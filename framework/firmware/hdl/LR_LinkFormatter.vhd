-- -------------------------------------------------------------------------------------------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;
USE IEEE.math_real.ALL;

USE WORK.utilities_pkg.ALL;
USE WORK.config.ALL;
USE WORK.LR_Config.ALL;
USE WORK.LR_Stubs.ALL;

USE WORK.emp_data_types.ALL;



ENTITY InputLinkFormatter IS
  PORT(
    clk          : IN STD_LOGIC;
    LinksIn      : IN ldata( 0 DOWNTO 0 ) := ( OTHERS => LWORD_NULL );
    StubOut      : OUT tStub              := NullStub
  );
END InputLinkFormatter;


ARCHITECTURE rtl OF InputLinkFormatter IS

SIGNAL Stub : tStub             := NullStub;
SIGNAL LinksInReg               : ldata( 0 DOWNTO 0 )    := ( OTHERS => LWORD_NULL );
  

BEGIN


  PROCESS( clk )

  VARIABLE AggregatedVector    : STD_LOGIC_VECTOR( 63 DOWNTO 0 ); -- Unconstrained arrays got confused in simulation

  BEGIN
    IF( RISING_EDGE( clk ) ) THEN


      LinksInReg <= LinksIn;

      -- Unpack the link only if link data is valid

      IF ( ToBoolean( LinksInReg( 0 ).valid ) ) THEN

        AggregatedVector   := LinksInReg( 0 ) .data;
        Stub             <= LinkToStub( AggregatedVector );
        Stub .FrameValid <= TRUE;

      ELSE

        Stub             <= NullStub;
        Stub .FrameValid <= FALSE;

      END IF;
    END IF;

  END PROCESS;
  StubOut <= Stub;
END;


--------------------------------------------------------------

LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;

USE WORK.utilities_pkg.ALL;
USE WORK.DR_Tracks.ALL;
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

