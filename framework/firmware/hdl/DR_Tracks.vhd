LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;

USE WORK.XMLutilities_pkg.ALL;
USE WORK.utilities_pkg.ALL;
USE WORK.config.ALL;
USE WORK.LR_Config_pkg.ALL;
USE WORK.LR_Tracks_pkg.ALL;


-- ----------------------------------------------
PACKAGE DR_Tracks_pkg IS

  TYPE tDRtrack IS RECORD
    inv2R        : SIGNED( widthInv2R-1 DOWNTO 0 );
    phi0         : SIGNED( widthPhi0-1  DOWNTO 0 );
    tanL         : SIGNED( widthTanL-1  DOWNTO 0 );
    z0           : SIGNED( widthZ0-1    DOWNTO 0 );
    hitPattern   : STD_LOGIC_VECTOR( 6 DOWNTO 0 );
    ChiSquaredRphi : UNSIGNED( 16-2 DOWNTO 0 ); -- Drop two bits to fit inside output opto-links.
    ChiSquaredRz   : UNSIGNED( 16-2 DOWNTO 0 );
    nLayers      : INTEGER RANGE 0 TO 7;
    PhiSectorID  : INTEGER RANGE 0 TO numSectorsPhi - 1;
    EtaSectorID  : INTEGER RANGE 0 TO numSectorsEta - 1;
    eventID      : INTEGER RANGE 0 TO numEvents - 1;
    cBin_ht      : SIGNED( widthBinsPhi - 1 DOWNTO 0 );
    mBin_ht      : SIGNED( widthBinsPt  - 1 DOWNTO 0 );
    cBin_fit     : SIGNED( widthBinsPhi - 1 DOWNTO 0 );
    mBin_fit     : SIGNED( widthBinsPt  - 1 DOWNTO 0 );
    Consistent   : BOOLEAN;
    DataValid    : BOOLEAN;
    FrameValid   : BOOLEAN;
-- The following is internal to the state selection logic
    SortCriteria : UNSIGNED( 15 DOWNTO 0 );
    trackID      : INTEGER RANGE 0 TO numTracks - 1;
    ChainId      : INTEGER RANGE 0 TO 35;
  END RECORD;

  TYPE tUnconstrainedDRtrackArray IS ARRAY( INTEGER RANGE <> ) OF tDRtrack;
  SUBTYPE tDRtrackArray           IS tUnconstrainedDRtrackArray( 0 TO 35 );
  TYPE tDRtrackPipe               IS ARRAY( INTEGER RANGE <> ) OF tDRtrackArray;

  CONSTANT NullDRtrack : tDRtrack := ( ( OTHERS => '0' ) , ( OTHERS => '0' ) , ( OTHERS => '0' ) ,
                                       ( OTHERS => '0' ) , 
				       ( OTHERS => '0' ) , ( OTHERS => '0' ) , ( OTHERS => '0' ) ,
                                       0 , 0 , 0 , 0 ,
                                       ( OTHERS => '0' ) , ( OTHERS => '0' ) , ( OTHERS => '0' ) , ( OTHERS => '0' ) ,
                                       FALSE , FALSE , FALSE ,
                                       ( OTHERS => '0' ) , 0 , 0
                                     );
  CONSTANT NullDRtrackArray           : tDRtrackArray := ( OTHERS => NullDRtrack );

  FUNCTION ToXML( aTrack              : tDRtrack ) RETURN STRING;

  FUNCTION ToStdLogicVector( aTrack   : tDRtrack ; CONSTANT width : INTEGER ) RETURN STD_LOGIC_VECTOR;
  FUNCTION ToDRtrack( aStdLogicVector : STD_LOGIC_VECTOR ) RETURN tDRtrack;

  FUNCTION ToDRtrack( aLRtrack        : tLRtrack ) RETURN tDRtrack;


END PACKAGE DR_Tracks_pkg;
-- ----------------------------------------------

-- ----------------------------------------------
PACKAGE BODY DR_Tracks_pkg IS

  FUNCTION ToXML( aTrack : tDRtrack ) RETURN STRING IS
  BEGIN
    RETURN "<Track" &
            ToXMLattr( "eventID" , aTrack.EventID ) &
            ToXMLattr( "trackID" , aTrack.trackID ) &
            ToXMLattr( "chainID" , aTrack.chainID ) &
            ToXMLattr( "PhiSectorID" , aTrack.PhiSectorID ) &
            ToXMLattr( "EtaSectorID" , aTrack.EtaSectorID ) &
            ToXMLattr( "nLayers" , aTrack.nLayers ) &
	    ToXMLattr( "hitPattern", aTrack.hitPattern ) &
            ToXMLattr( "phi0" , aTrack.phi0 ) &
            ToXMLattr( "inv2R" , aTrack.inv2R ) &
            ToXMLattr( "z0" , aTrack.z0 ) &
            ToXMLattr( "tanL" , aTrack.tanL ) &
            ToXMLattr( "chi2rphi" , aTrack.chiSquaredRphi ) &
            ToXMLattr( "chi2rz" , aTrack.chiSquaredRz ) &
            ToXMLattr( "mBin_fit" , aTrack.mBin_fit ) &
            ToXMLattr( "cBin_fit" , aTrack.cBin_fit ) &
            ToXMLattr( "mBin_ht" , aTrack.mBin_ht ) &
            ToXMLattr( "cBin_ht" , aTrack.cBin_ht ) &
            ToXMLattr( "consistent" , aTrack.Consistent ) &
            ToXMLattr( "sortCriteria" , aTrack.SortCriteria ) &
            ToXMLattr( "dataValid" , aTrack.DataValid ) &
            ToXMLattr( "frameValid" , aTrack.FrameValid ) &
            "/>";
  END FUNCTION ToXML;


  FUNCTION ToStdLogicVector( aTrack : tDRtrack ; CONSTANT width : INTEGER ) RETURN STD_LOGIC_VECTOR IS
    VARIABLE lStdLogicVector        : STD_LOGIC_VECTOR( width-1 DOWNTO 0 ) := ( OTHERS => '0' );
    VARIABLE offset : natural := 0;
  BEGIN

    -- Warning: Assumes < 64 m bins & < 64 c bins in HT.

    lStdLogicVector( widthInv2R            - 1 DOWNTO      0 ) := STD_LOGIC_VECTOR( aTrack.inv2R );
    offset := widthInv2R;
    lStdLogicVector( widthPhi0    + offset - 1 DOWNTO offset ) := STD_LOGIC_VECTOR( aTrack.phi0 );
    offset := offset + widthPhi0;
    lStdLogicVector( widthTanL    + offset - 1 DOWNTO offset ) := STD_LOGIC_VECTOR( aTrack.tanL );
    offset := offset + widthTanL;
    lStdLogicVector( widthZ0      + offset - 1 DOWNTO offset ) := STD_LOGIC_VECTOR( aTrack.z0 );
    offset := offset + widthZ0;
    lStdLogicVector( 17-2         + offset - 1 DOWNTO offset ) := STD_LOGIC_VECTOR( aTrack.chiSquaredRphi );
    offset := offset + 17-2;    
    lStdLogicVector( 17-2         + offset - 1 DOWNTO offset ) := STD_LOGIC_VECTOR( aTrack.chiSquaredRz );
    offset := offset + 17-2;    
    lStdLogicVector( 7            + offset - 1 DOWNTO offset )  := aTrack.hitPattern;
    offset := offset + 7;        
    lStdLogicVector( widthBinsPt  + offset - 1 DOWNTO offset ) := STD_LOGIC_VECTOR( aTrack.mBin_ht );
    offset := offset + widthBinsPt;
    lStdLogicVector( widthBinsPhi + offset - 1 DOWNTO offset ) := STD_LOGIC_VECTOR( aTrack.cBin_ht );
    offset := offset + widthBinsPhi;
    lStdLogicVector( 3            + offset - 1 DOWNTO offset ) := STD_LOGIC_VECTOR( TO_UNSIGNED( aTrack.nLayers , 3 ) );
    offset := offset + 3;
    lStdLogicVector( 3            + offset - 1 DOWNTO offset ) := STD_LOGIC_VECTOR( TO_UNSIGNED( aTrack.eventID , 3 ) );
    offset := offset + 3;
    lStdLogicVector( widthSectorPhi + offset - 1 DOWNTO offset ) := STD_LOGIC_VECTOR( TO_UNSIGNED( aTrack.PhiSectorID , widthSectorPhi ) );
    offset := offset + widthSectorPhi;
    lStdLogicVector( widthSectorEta + offset - 1 DOWNTO offset ) := STD_LOGIC_VECTOR( TO_UNSIGNED( aTrack.EtaSectorID , widthSectorEta ) );
    offset := offset + widthSectorEta;
    lStdLogicVector( widthBinsPt  + offset - 1 DOWNTO offset ) := STD_LOGIC_VECTOR( aTrack.mBin_fit );
    offset := offset + widthBinsPt;
    lStdLogicVector( widthBinsPhi + offset - 1 DOWNTO offset ) := STD_LOGIC_VECTOR( aTrack.cBin_fit );
    offset := offset + widthBinsPhi;
    lStdLogicVector( 125 )                                     := ToStdLogic( aTrack.Consistent );
    lStdLogicVector( 126 )                                     := ToStdLogic( aTrack.DataValid );
    lStdLogicVector( 127 )                                     := ToStdLogic( aTrack.FrameValid );

    -- The following is internal to the state selection logic
    lStdLogicVector( 143 DOWNTO 128 )                          := STD_LOGIC_VECTOR( aTrack.SortCriteria );

    RETURN lStdLogicVector;
  END FUNCTION ToStdLogicVector;


  FUNCTION ToDRtrack( aStdLogicVector : STD_LOGIC_VECTOR ) RETURN tDRtrack IS
    VARIABLE lTrack                   : tDRtrack := NullDRtrack;
    VARIABLE offset : natural := 0;
  BEGIN

    -- Warning: Assumes < 64 m bins & < 64 c bins in HT.

     lTrack.inv2R        :=   SIGNED( aStdLogicVector( widthInv2R          - 1 DOWNTO      0 ) );
     offset := widthInv2R;
     lTrack.phi0         :=   SIGNED( aStdLogicVector( widthPhi0  + offset - 1 DOWNTO offset ) );
     offset := offset + widthPhi0;
     lTrack.tanL         :=   SIGNED( aStdLogicVector( widthTanL  + offset - 1 DOWNTO offset ) );
     offset := offset + widthTanL;
     lTrack.z0           :=   SIGNED( aStdLogicVector( widthZ0    + offset - 1 DOWNTO offset ) );
     offset := offset + widthZ0;
     lTrack.chiSquaredRphi := UNSIGNED( aStdLogicVector( 17-2     + offset - 1 DOWNTO offset ) );
     offset := offset + 17-2;     
     lTrack.chiSquaredRz   := UNSIGNED( aStdLogicVector( 17-2     + offset - 1 DOWNTO offset ) );
     offset := offset + 17-2;     
     lTrack.hitPattern   := aStdLogicVector( 7         + offset - 1 DOWNTO offset );
     offset := offset + 7;          
     lTrack.mBin_ht	 :=   SIGNED( aStdLogicVector( widthBinsPt   + offset - 1 DOWNTO offset ) );
     offset := offset + widthBinsPt;
     lTrack.cBin_ht      :=   SIGNED( aStdLogicVector( widthBinsPhi + offset - 1 DOWNTO offset ) );
     offset := offset + widthBinsPhi;
     lTrack.nLayers      := TO_INTEGER( UNSIGNED( aStdLogicVector( 3 + offset - 1 DOWNTO offset ) ) );
     offset := offset + 3;
     lTrack.eventID      := TO_INTEGER( UNSIGNED( aStdLogicVector( 3 + offset - 1 DOWNTO offset ) ) );
     offset := offset + 3;
     lTrack.PhiSectorID  := TO_INTEGER( UNSIGNED( aStdLogicVector( widthSectorPhi + offset - 1 DOWNTO offset ) ) );
     offset := offset + widthSectorPhi;
     lTrack.EtaSectorID  := TO_INTEGER( UNSIGNED( aStdLogicVector( widthSectorEta + offset - 1 DOWNTO offset ) ) );
     offset := offset + widthSectorEta;
     lTrack.mBin_fit     :=   SIGNED( aStdLogicVector( widthBinsPt  + offset - 1 DOWNTO offset ) );
     offset := offset + widthBinsPt;
     lTrack.cBin_fit     :=   SIGNED( aStdLogicVector( widthBinsPhi  + offset - 1 DOWNTO offset ) );
     offset := offset + widthBinsPhi;
     lTrack.Consistent   := ToBoolean( aStdLogicVector( 125 ) );
     lTrack.DataValid    := ToBoolean( aStdLogicVector( 126 ) );
     lTrack.FrameValid   := ToBoolean( aStdLogicVector( 127 ) );

    -- The following is internal to the state selection logic
     lTrack.SortCriteria := UNSIGNED( aStdLogicVector( 143 DOWNTO 128 ) );
    RETURN lTrack;
  END FUNCTION ToDRtrack;




  FUNCTION ToDRtrack( aLRtrack : tLRtrack ) RETURN tDRtrack IS
    VARIABLE Nlayers           : INTEGER RANGE 0 TO 7    := 0;
    VARIABLE NotLay            : UNSIGNED(  2 DOWNTO 0 ) := ( OTHERS => '0' );
    VARIABLE SortCriteria      : UNSIGNED( 19 DOWNTO 0 ) := ( OTHERS => '0' );
    CONSTANT SortCritTrunc     : UNSIGNED( 13 DOWNTO 0 ) := ( OTHERS => '1' ); -- cut to save RAM

    VARIABLE lDRtrack          : tDRtrack                := NullDRtrack;
  BEGIN    
    lDRtrack.inv2R      := aLRtrack.inv2R( widthInv2R - 1 + 2 downto 2);   --16->2 
    lDRtrack.phi0       := aLRtrack.phi0(  widthPhi0  - 1 + 5 downto 5 );  --16->5  
    lDRtrack.tanL       := aLRtrack.tanL(  widthTanL          downto 1 );  --16->1
    lDRtrack.z0         := aLRtrack.z0(    widthZ0    - 1 + 6 downto 6 );  --17->6
    lDRtrack.ChiSquaredRphi := aLRtrack.ChiSquaredRphi(16 downto 2); -- drop two bits.
    lDRtrack.ChiSquaredRz   := aLRtrack.ChiSquaredRz(16 downto 2);

    lDRtrack.hitPattern := aLRtrack.hitPattern(6 downto 0);

    Nlayers             := aLRtrack.LayerID - aLRtrack.SkippedLayerCount;
    lDRtrack.nLayers    := Nlayers;
    lDRtrack.PhiSectorID := aLRtrack.PhiSectorID;
    IF aLRtrack.zSign THEN
      lDRtrack.EtaSectorID := (numSectorsEta/2 - 1) - aLRtrack.EtaSectorID;
    ELSE
      lDRtrack.EtaSectorID := aLRtrack.EtaSectorID + (numSectorsEta/2);
    END IF;

    lDRtrack.trackID    := aLRtrack.trackID;
    lDRtrack.eventID    := aLRtrack.eventID;

    lDRtrack.cBin_ht    := aLRtrack.cBin_ht;
    lDRtrack.mBin_ht    := aLRtrack.mBin_ht;

    lDRtrack.cBin_fit   := aLRtrack.cBin_fit;
    lDRtrack.mBin_fit   := aLRtrack.mBin_fit;

    lDRtrack.Consistent := aLRtrack.Consistent;

    -- chi2(rphi) divided by 8 to improve performance for electrons. Factor matches that in KF HLS KFconstants.h
    SortCriteria        := (resize(shift_right(aLRtrack.ChiSquaredRphi,3), 17+1) + resize(aLRtrack.ChiSquaredRz, 17+1)) * TO_UNSIGNED( aLRtrack.SkippedLayerCount + 1 , 2 );
    NotLay              := NOT TO_UNSIGNED( Nlayers, 3 ); 
    IF SortCriteria > SortCritTrunc THEN   -- Compress into fewer bits.
      lDRtrack.SortCriteria := NotLay(1 DOWNTO 0) & SortCritTrunc; -- subtracts 4 from NotLay to save bit
    ELSE
      lDRtrack.SortCriteria := NotLay(1 DOWNTO 0) & SortCriteria( 15 DOWNTO 2 ); -- Bits 15-2 more important than 13-0.
    END IF;

    lDRtrack.DataValid := aLRtrack.DataValid;

    RETURN lDRtrack;
  END FUNCTION ToDRtrack;

END PACKAGE BODY DR_Tracks_pkg;
