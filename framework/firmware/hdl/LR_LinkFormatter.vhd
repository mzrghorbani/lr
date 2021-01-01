-- -------------------------------------------------------------------------------------------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;
USE IEEE.math_real.ALL;

USE WORK.LR_Stubs_pkg.ALL;
USE WORK.utilities_pkg.ALL;
USE WORK.config.ALL;
USE WORK.LR_Config_pkg.ALL;

USE WORK.emp_data_types.ALL;



ENTITY InputLinkFormatter IS
  PORT(
    clk          : IN STD_LOGIC;
    LinksIn      : IN ldata( 0 DOWNTO 0 ) := ( OTHERS => LWORD_NULL );
    StubOut      : OUT tStub              := NullStub;
    Synchronize  : OUT STD_LOGIC          := '0'
  );
END InputLinkFormatter;


ARCHITECTURE rtl OF InputLinkFormatter IS
  SIGNAL StubIn, Stub0, Stub1, Stub2 : tStub              := NullStub;

  SIGNAL EventID                  : INTEGER RANGE 0 TO numEvents - 1  := 0;
  SIGNAL TrackId                  : INTEGER RANGE 0 TO numTracks - 1  := 0;

  TYPE tStubIDs IS ARRAY( 0 TO 6 ) OF INTEGER RANGE 0 TO maxStubsPerLayer - 1;
  SIGNAL StubID                   : tStubIDs               := ( OTHERS => 0 );

  SIGNAL SynchronizeCounter       : INTEGER RANGE 0 TO 255 := 0;
  SIGNAL TestBenchSynchronizeDone : BOOLEAN                := FALSE;

  SIGNAL LinksInReg               : ldata( 0 DOWNTO 0 )    := ( OTHERS => LWORD_NULL );
  

BEGIN

-- ---------------------------------------
    PROCESS( clk )
      VARIABLE AggregatedVector    : STD_LOGIC_VECTOR( 63 DOWNTO 0 ); -- Unconstrained arrays got confused in simulation

      CONSTANT RtOffset            : INTEGER               := integer( round( chosenRofPhi / baseR ) );

      VARIABLE RawSignedRt         : INTEGER               := 0;

      VARIABLE LayerID             : INTEGER RANGE 0 TO 7  := 0;

      VARIABLE LastStubInTrack     : BOOLEAN               := FALSE;

    BEGIN
      IF( RISING_EDGE( clk ) ) THEN
      
      
      LinksInReg <= LinksIn;
      

-- --------------------------------------------------------------------------------------
-- Unpack the link only if link data is valid

    IF( ToBoolean( LinksInReg( 0 ).valid ) )THEN

          AggregatedVector   := LinksInReg( 0 ) .data;
          StubIn             <= LinkToStub( AggregatedVector );
          StubIn .FrameValid <= TRUE;

	ELSE

          StubIn             <= NullStub;
          StubIn .FrameValid <= FALSE;

	END IF;
-- --------------------------------------------------------------------------------------


-- --------------------------------------------------------------------------------------
-- Stub2 is just a copy of Stub1... apart from all the changes below
        Stub0   <= StubIn;
        Stub1   <= Stub0;        
        Stub2   <= Stub1;
-- --------------------------------------------------------------------------------------

-- --------------------------------------------------------------------------------------
        LastStubInTrack := ( NOT Stub0.DataValid )
                             OR( Stub0.zSign /= Stub1 .zSign )
                             OR( Stub0.PhiSectorID /= Stub1 .PhiSectorID )
                             OR( Stub0.EtaSectorID /= Stub1 .EtaSectorID )
                             OR( Stub0.cBin /= Stub1 .cBin )
                             OR( Stub0.mBin /= Stub1 .mBin );
-- --------------------------------------------------------------------------------------

-- --------------------------------------------------------------------------------------
-- Transform the Layer ID from Ian to Kalman
-- 
-- ("b3" indicates GP encoded layer ID = 3 in barrel etc).
-- ------------------------------------------------------------------------------------------
-- eta- eta+  bound 1  bound 2  KF layer 0    1    2    3    4    5    6  KF eta
-- ------------------------------------------------------------------------------------------
--  7      8     0.00     0.20          b1   b2   b7   b5   b4   b3    -     0
--  6      9     0.20     0.41          b1   b2   b7   b5   b4   b3    -     1
--  5     10     0.41     0.62          b1   b2   b7   b5   b4   b3    -     2
--  4     11     0.62     0.90          b1   b2   b7   b5   b4   b3    -     3
-- ------------------------------------------------------------------------------------------
--  3     12     0.90     1.26          b1   b2   b7   b5 b4/e3 b3/e4  e5    4
-- ------------------------------------------------------------------------------------------
--  2     13     1.26     1.68          b1   b2 b7/b5  e3   e4   e5  e6/e7   5
--                                             (or b7/b5/e4 e4 ... ?)
-- ------------------------------------------------------------------------------------------
--  1     14     1.68     2.08          b1 b2/e3  e4   e5   e6   e7    -     6
-- ------------------------------------------------------------------------------------------
--  0     15     2.08     2.40          b1   e3   e4   e5   e6   e7    -     7
-- ------------------------------------------------------------------------------------------

-- P.S. GP encoded layer ID defined such that barrel layers=1,2,7,5,4,3 
-- & endcap wheels=3,4,5,6,7, & 0 never occurs

-- In principle, the link ID restricts the range of selections, but the merging of sectors in the  
-- HT mux means the minimal saving in resources is not worth the extra coding complexity...

        CASE Stub1 .EtaSectorID IS 
          WHEN 0|1|2|3 =>    -- 4|5|6|7|8|9|10|11
            CASE Stub1 .LayerID IS
              WHEN 1 => LayerID := 0;
              WHEN 2 => LayerID := 1;
              WHEN 3 => LayerID := 5;
              WHEN 4 => LayerID := 4;
              WHEN 5 => LayerID := 3;
              WHEN 7 => LayerID := 2;
              WHEN OTHERS =>
                LayerID := 7;
            END CASE;
          WHEN 4 =>    -- 3|12 
            CASE Stub1 .LayerID IS
              WHEN 1 => LayerID := 0;
              WHEN 2 => LayerID := 1;
              WHEN 3 =>
                IF Stub1 .IsEndcap THEN
                  LayerID := 4;
                ELSE
                  LayerID := 5;
                END IF;
              WHEN 4 =>
                IF Stub1 .IsEndcap THEN
                  LayerID := 5; 
                ELSE
                  LayerID := 4;
                END IF;
              WHEN 5 =>
                IF Stub1 .IsEndcap THEN
                  LayerID := 6; 
                ELSE
                  LayerID := 3;
                END IF;
              WHEN 7 => LayerID := 2;
              WHEN OTHERS =>
                LayerID := 7;
            END CASE;
          WHEN 5 =>    --2|13 
            CASE Stub1 .LayerID IS
              WHEN 1 => LayerID := 0;
              WHEN 2 => LayerID := 1;
              WHEN 3 => LayerID := 3;
              WHEN 4 => LayerID := 4;
              WHEN 5 =>
                IF Stub1 .IsEndcap THEN
                  LayerID := 5;
                ELSE
                  LayerID := 2;
                END IF;
              WHEN 6 => LayerID := 6;
              WHEN 7 =>
                IF Stub1 .IsEndcap THEN
                  LayerID := 6;
                ELSE
                  LayerID := 2;
                END IF;
              WHEN OTHERS =>
                LayerID := 7;
            END CASE;
          WHEN 6 =>    --1|14
            CASE Stub1 .LayerID IS
              WHEN 1 => LayerID := 0;
              WHEN 2 => LayerID := 1;
              WHEN 3 => LayerID := 1;
              WHEN 4 => LayerID := 2;
              WHEN 5 => LayerID := 3;
              WHEN 6 => LayerID := 4;
              WHEN 7 => LayerID := 5;
              WHEN OTHERS =>
                LayerID := 7;
            END CASE;
          WHEN 7 =>    --0|15
            CASE Stub1 .LayerID IS
              WHEN 1 => LayerID := 0;
              WHEN 3 => LayerID := 1;
              WHEN 4 => LayerID := 2;
              WHEN 5 => LayerID := 3;
              WHEN 6 => LayerID := 4;
              WHEN 7 => LayerID := 5; 
              WHEN OTHERS =>
                LayerID := 7;
            END CASE;
        END CASE;


        IF Stub1 .DataValid THEN
          IF LayerID = 7 THEN
            REPORT "LinkFormatter found stub with illegal 'LayerID' for the given region (OK if affects <0.1% of stubs): " & ToXML( Stub1 ) SEVERITY WARNING;
            LayerID := 6; -- Very rare occurance: just set to any allowed value.
          END IF;
          Stub2 .LayerID <= LayerID;
          Stub2 .StubID  <= StubID( LayerID );
        ELSE
          Stub2 .LayerID <= 0; -- Doesn't matter, it is an invalid stub anyway...
        END IF;

-- --------------------------------------------------------------------------------------


-- --------------------------------------------------------------------------------------
-- The Counters
        Stub2 .EventID     <= EventID;
        Stub2 .TrackID     <= TrackId;

        Synchronize        <= '0';

--- Check if we have >= 255 clks without a valid frame. In HW, this happens at start of run, and also between LHC orbits.
--- Not needed for ModelSim?

        IF NOT Stub1.FrameValid AND SynchronizeCounter < 255 THEN
          SynchronizeCounter <= SynchronizeCounter + 1;
        END IF;

-- As ModelSim runs don't have >= 255 clk gaps in ModelSim, skip above count.

        IF NOT FOR_SYNTHESIS THEN
          IF NOT TestBenchSynchronizeDone THEN
            SynchronizeCounter       <= 255;
            TestBenchSynchronizeDone <= TRUE;
          END IF;
        END IF;

-- IRT: bug fix, so StubID(...) is incremented for 1st stub in run.
--        IF SynchronizeCounter = 255 AND Stub1.FrameValid THEN
        IF SynchronizeCounter = 255 AND Stub0.FrameValid THEN
-- Synchronize at start of run. And for HW, also after each orbit gap.
          Synchronize        <= '1';
          SynchronizeCounter <= 0;
          EventID            <= 0;
          TrackID            <= 0;
          StubID             <= ( OTHERS => 0 );
        ELSIF( Stub2 .FrameValid ) AND( NOT Stub1 .FrameValid ) THEN -- Last object valid & current object is invalid -> next object is start of new event
-- Increment event counter after each valid packet.
          SynchronizeCounter <= 0;                        
          EventID            <= ( EventID + 1 ) MOD numEvents;
          TrackID            <= 0;
          StubID             <= ( OTHERS => 0 );
        ELSIF Stub1 .DataValid THEN
          IF StubID( LayerID ) < (MaxStubsPerLayer - 1) THEN -- Stubs numbered 0 to N-1.
            StubID( LayerID ) <= StubID( LayerID ) + 1;
          END IF;
          IF LastStubInTrack THEN
            Stub2 .LastStubInTrack <= TRUE;
            TrackID                <= ( TrackID + 1 ) MOD numTracks;
            StubID                     <= ( OTHERS => 0 );
          END IF;
        END IF;
-- --------------------------------------------------------------------------------------


-- --------------------------------------------------------------------------------------
-- Remove the offset from rT
        RawSignedRt := TO_INTEGER( SIGNED( STD_LOGIC_VECTOR( Stub1 .r( widthR - 1 DOWNTO 0 ) ) ) ); -- We pack the bits into an 11-bit unsigned , but really it is a 10-bit signed number
        Stub2 .r <= TO_UNSIGNED( RawSignedRt + RtOffset , widthR + 1 );

      END IF;
    END PROCESS;

  StubOut <= Stub2;

END;



-- -------------------------------------------------------------------------------------------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;

USE WORK.utilities_pkg.ALL;
USE WORK.DR_Tracks_pkg.ALL;
USE WORK.emp_data_types.ALL;



ENTITY OutputLinkFormatter IS
  PORT(
    clk      : IN STD_LOGIC;
    TrackIn  : IN tDRtrack             := NullDRtrack;
    LinksOut : OUT ldata( 1 DOWNTO 0 ) := ( OTHERS => LWORD_NULL )
  );
END OutputLinkFormatter;


ARCHITECTURE rtl OF OutputLinkFormatter IS

  SIGNAL Aggregated             : STD_LOGIC_VECTOR( 143 DOWNTO 0 ) := ( OTHERS => '0' );  
  SIGNAL LinksOut1              : ldata( 1 DOWNTO 0 )              := ( OTHERS => LWORD_NULL );
  
BEGIN

Aggregated <= ToStdLogicVector( TrackIn , 144 );

  PROCESS( clk )
  BEGIN
    IF( RISING_EDGE( clk ) ) THEN

      FOR j IN 1 TO 2 LOOP
        LinksOut1( j-1 ) .data   <= x"0000000000000000";
        LinksOut1( j-1 ) .valid  <= '0';
        LinksOut1( j-1 ) .strobe <= '1';
      END LOOP;

      IF TrackIn .DataValid THEN

        FOR j IN 1 TO 2 LOOP
          LinksOut1( j - 1 ) .data <= Aggregated( ( 64 * j ) -1 DOWNTO 64 * ( j-1 ) );
        END LOOP;

      END IF;

      FOR j IN 1 TO 2 LOOP
        LinksOut1( j-1 ) .valid <= ToStdLogic( TrackIn .FrameValid );
      END LOOP;
      
      LinksOut <= LinksOut1;
      
    END IF;
  END PROCESS;

END;

