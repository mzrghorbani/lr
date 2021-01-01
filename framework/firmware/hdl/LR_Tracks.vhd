LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;

USE WORK.XMLutilities_pkg.ALL;
USE WORK.utilities_pkg.ALL;
USE WORK.config.ALL;
USE WORK.LR_Config_pkg.ALL;

-- ----------------------------------------------
PACKAGE LR_Tracks_pkg IS

  TYPE tLRtrack IS RECORD
    inv2R             : SIGNED( widthHELIX-1 DOWNTO 0 );
    phi0              : SIGNED( widthHELIX-1 DOWNTO 0 );
    tanL              : SIGNED( widthHELIX-1 DOWNTO 0 );
    z0                : SIGNED( widthHELIX-1 DOWNTO 0 );
    cov_00            : UNSIGNED( widthCOV-1 DOWNTO 0 );
    cov_11            : UNSIGNED( widthCOV-1 DOWNTO 0 );
    cov_22            : UNSIGNED( widthCOV-1 DOWNTO 0 );
    cov_33            : UNSIGNED( widthCOV-1 DOWNTO 0 );
    cov_01            : SIGNED  ( widthCOV-1 DOWNTO 0 );
    cov_23            : SIGNED  ( widthCOV-1 DOWNTO 0 );
    hitPattern        : STD_LOGIC_VECTOR( 8-1 DOWNTO 0 );
-- Below here, signals are stored in the header section of the FIFO
    chiSquaredRphi    : UNSIGNED( 16 DOWNTO 0 );
    chiSquaredRz      : UNSIGNED( 16 DOWNTO 0 );
    LayerID           : INTEGER RANGE 0 TO 7;
    trackID           : INTEGER RANGE 0 TO numTracks - 1;
    eventID           : INTEGER RANGE 0 TO numEvents - 1;
    SkippedLayerCount : INTEGER RANGE 0 TO 3;
    DataValid         : BOOLEAN;
-- Below here, signals are not stored in FIFOs and are just packaged into the state for convenience
    Addr              : INTEGER RANGE 0 TO 511;
    FifoID            : INTEGER RANGE 0 TO 1;
    LocalCounter      : INTEGER RANGE 0 TO maxStubsPerLayer - 1;
    LocalSkipped      : BOOLEAN; -- added MP 19.11.16
-- Below here, signals are not stored in FIFOs and are used for the State Filter or for output to DR state only
    cBin_ht           : SIGNED( widthBinsPhi - 1 DOWNTO 0 );
    mBin_ht           : SIGNED( widthBinsPt  - 1 DOWNTO 0 );
    cBin_fit          : SIGNED( widthBinsPhi - 1 DOWNTO 0 );
    mBin_fit          : SIGNED( widthBinsPt  - 1 DOWNTO 0 );
    PhiSectorID       : INTEGER RANGE 0 TO numSectorsPhi - 1;
    EtaSectorID       : INTEGER RANGE 0 TO numSectorsEta / 2 - 1;
    zSign             : BOOLEAN;
    Consistent        : BOOLEAN;
    passesCuts        : BOOLEAN;
-- Below here are for XML debugging only
    z0Cut             : BOOLEAN;
    ptCut             : BOOLEAN;
    csCut             : BOOLEAN;
    psCut             : BOOLEAN;
    sectorCut         : BOOLEAN;
    iterationCut      : BOOLEAN;
  END RECORD;

  TYPE tUnconstrainedLRtrackArray IS ARRAY( INTEGER RANGE <> ) OF tLRtrack;
  SUBTYPE tLRtrackArray           IS tUnconstrainedLRtrackArray( 0 TO 35 );
  TYPE tLRtrackPipe               IS ARRAY( INTEGER RANGE <> ) OF tLRtrackArray;

  CONSTANT NullLRtrack : tLRtrack := ( ( OTHERS => '0' ) , ( OTHERS => '0' ) , ( OTHERS => '0' ) , ( OTHERS => '0' ) ,
                                       ( OTHERS => '0' ) , ( OTHERS => '0' ) , ( OTHERS => '0' ) , ( OTHERS => '0' ) ,
                                       ( OTHERS => '0' ) , ( OTHERS => '0' ) ,
				       ( OTHERS => '0' ) ,
-- Below here, signals are stored in the header section of the FIFO
                                       ( OTHERS => '0' ) , ( OTHERS => '0' ) , 0 , 0 , 0 , 0 , FALSE ,
-- Below here, signals are not stored in FIFOs and are just packaged into the state for convenience
                                        0 , 0 , 0 , FALSE ,
-- Below here, signals are not stored in FIFOs and are used for the State Filter or for output to DR state only
                                        ( OTHERS => '0' ) , ( OTHERS => '0' ) , ( OTHERS => '0' ) , ( OTHERS => '0' ) ,
                                        0 , 0 , FALSE , FALSE , FALSE , FALSE , FALSE , FALSE , FALSE , FALSE , FALSE
                                   );

  CONSTANT NullLRtrackArray           : tLRtrackArray := ( OTHERS => NullLRtrack );

  FUNCTION ToStdLogicVector( aTrack   : tLRtrack ; CONSTANT width : INTEGER ) RETURN STD_LOGIC_VECTOR;
  FUNCTION ToLRtrack( aStdLogicVector : STD_LOGIC_VECTOR ) RETURN tLRtrack;

  FUNCTION ToXML( aTrack              : tLRtrack ) RETURN STRING;

END PACKAGE LR_Tracks_pkg;
-- ----------------------------------------------

-- ----------------------------------------------
PACKAGE BODY LR_Tracks_pkg IS

  FUNCTION ToXML( aTrack : tLRtrack ) RETURN STRING IS
  BEGIN
    RETURN "<Track" &
            ToXMLattr( "eventID" , aTrack.EventID ) &
            ToXMLattr( "trackID" , aTrack.trackID ) &
            ToXMLattr( "layerId" , aTrack.LayerID ) &
            ToXMLattr( "PhiSectorID" , aTrack.PhiSectorID ) &
            ToXMLattr( "EtaSectorID" , aTrack.EtaSectorID ) &
            ToXMLattr( "zSign" , aTrack.zSign ) &
	    ToXMLattr( "hitPattern", aTrack.hitPattern ) &
            ToXMLattr( "skippedLayerCount" , aTrack.SkippedLayerCount ) &
            ToXMLattr( "phi0" , aTrack.phi0 ) &
            ToXMLattr( "inv2R" , aTrack.inv2R ) &
            ToXMLattr( "z0" , aTrack.z0 ) &
            ToXMLattr( "tanL" , aTrack.tanL ) &
            ToXMLattr( "chi2rphi" , aTrack.chiSquaredRphi ) &
            ToXMLattr( "chi2rz"   , aTrack.chiSquaredRz ) &
            ToXMLattr( "cov_00" , aTrack.cov_00 ) &
            ToXMLattr( "cov_11" , aTrack.cov_11 ) &
            ToXMLattr( "cov_01" , aTrack.cov_01 ) &
            ToXMLattr( "cov_22" , aTrack.cov_22 ) &
            ToXMLattr( "cov_23" , aTrack.cov_23 ) &
            ToXMLattr( "cov_33" , aTrack.cov_33 ) &
            ToXMLattr( "dataValid" , aTrack.DataValid ) &
            ToXMLattr( "mBin_fit" , aTrack.mBin_fit ) &
            ToXMLattr( "cBin_fit" , aTrack.cBin_fit ) &
            ToXMLattr( "mBin_ht" , aTrack.mBin_ht ) &
            ToXMLattr( "cBin_ht" , aTrack.cBin_ht ) &
            ToXMLattr( "consistent" , aTrack.Consistent ) &
            ToXMLattr( "localCounter" , aTrack.LocalCounter ) &
            ToXMLattr( "localSkipped" , aTrack.LocalSkipped ) &
            ToXMLattr( "cut_z0" , aTrack.z0Cut ) &
            ToXMLattr( "cut_pt" , aTrack.ptCut ) &
            ToXMLattr( "cut_cs" , aTrack.csCut ) &
            ToXMLattr( "cut_ps" , aTrack.psCut ) &
            ToXMLattr( "cut_iteration" , aTrack.iterationCut ) &
            ToXMLattr( "cut_sector" , aTrack.sectorCut ) &
            ToXMLattr( "cut_all" , aTrack.passesCuts ) &
            "/>";
  END FUNCTION ToXML;

  FUNCTION ToStdLogicVector( aTrack : tLRtrack ; CONSTANT width : INTEGER ) RETURN STD_LOGIC_VECTOR IS
    VARIABLE lStdLogicVector        : STD_LOGIC_VECTOR( width-1 DOWNTO 0 ) := ( OTHERS => '0' );
    VARIABLE offset : natural := 0;
  BEGIN
    lStdLogicVector( widthHELIX          - 1 DOWNTO      0 ) := STD_LOGIC_VECTOR( aTrack.inv2R );
    offset := widthHELIX;
    lStdLogicVector( widthHELIX + offset - 1 DOWNTO offset ) := STD_LOGIC_VECTOR( aTrack.phi0 );
    offset := offset + widthHELIX;
    lStdLogicVector( widthHELIX + offset - 1 DOWNTO offset ) := STD_LOGIC_VECTOR( aTrack.tanL );
    offset := offset + widthHELIX;
    lStdLogicVector( widthHELIX + offset - 1 DOWNTO offset ) := STD_LOGIC_VECTOR( aTrack.z0 );
    offset := offset + widthHELIX;
    lStdLogicVector( widthCOV   + offset - 1 DOWNTO offset ) := STD_LOGIC_VECTOR( aTrack.cov_00 );
    offset := offset + widthCOV;
    lStdLogicVector( widthCOV   + offset - 1 DOWNTO offset ) := STD_LOGIC_VECTOR( aTrack.cov_11 );
    offset := offset + widthCOV;
    lStdLogicVector( widthCOV   + offset - 1 DOWNTO offset ) := STD_LOGIC_VECTOR( aTrack.cov_22 );
    offset := offset + widthCOV;
    lStdLogicVector( widthCOV   + offset - 1 DOWNTO offset ) := STD_LOGIC_VECTOR( aTrack.cov_33 );
    offset := offset + widthCOV;
    lStdLogicVector( widthCOV   + offset - 1 DOWNTO offset ) := STD_LOGIC_VECTOR( aTrack.cov_01 );
    offset := offset + widthCOV;
    lStdLogicVector( widthCOV   + offset - 1 DOWNTO offset ) := STD_LOGIC_VECTOR( aTrack.cov_23 );
    offset := offset + widthCOV;
    lStdLogicVector( 8      + offset - 1 DOWNTO offset ) := aTrack.hitPattern;
-- 200 to 202 free
    lStdLogicVector( 219 DOWNTO 203 ) := STD_LOGIC_VECTOR( aTrack.chiSquaredRphi );
    lStdLogicVector( 236 DOWNTO 220 ) := STD_LOGIC_VECTOR( aTrack.chiSquaredRz );
    lStdLogicVector( 237 )            := ToStdLogic( aTrack.DataValid );
    lStdLogicVector( 240 DOWNTO 238 ) := STD_LOGIC_VECTOR( TO_UNSIGNED( aTrack.LayerID , 3 ) );
    lStdLogicVector( 245 DOWNTO 241 ) := STD_LOGIC_VECTOR( TO_UNSIGNED( aTrack.trackID , 5 ) );
    lStdLogicVector( 249 DOWNTO 247 ) := STD_LOGIC_VECTOR( TO_UNSIGNED( aTrack.eventID , 3 ) );
    lStdLogicVector( 251 DOWNTO 250 ) := STD_LOGIC_VECTOR( TO_UNSIGNED( aTrack.SkippedLayerCount , 2 ) );

    RETURN lStdLogicVector;
  END FUNCTION ToStdLogicVector;

  FUNCTION ToLRtrack( aStdLogicVector : STD_LOGIC_VECTOR ) RETURN tLRtrack IS
    VARIABLE lTrack                   : tLRtrack := NullLRtrack;
    VARIABLE offset : natural := 0;
  BEGIN
     lTrack.inv2R             :=   SIGNED( aStdLogicVector( widthHELIX          - 1 DOWNTO      0 ) );
     offset := widthHELIX;
     lTrack.phi0              :=   SIGNED( aStdLogicVector( widthHELIX + offset - 1 DOWNTO offset ) );
     offset := offset + widthHELIX;
     lTrack.tanL              :=   SIGNED( aStdLogicVector( widthHELIX + offset - 1 DOWNTO offset ) );
     offset := offset + widthHELIX;
     lTrack.z0                :=   SIGNED( aStdLogicVector( widthHELIX + offset - 1 DOWNTO offset ) );
     offset := offset + widthHELIX;
     lTrack.cov_00            := UNSIGNED( aStdLogicVector( widthCOV   + offset - 1 DOWNTO offset ) );
     offset := offset + widthCOV;
     lTrack.cov_11            := UNSIGNED( aStdLogicVector( widthCOV   + offset - 1 DOWNTO offset ) );
     offset := offset + widthCOV;
     lTrack.cov_22            := UNSIGNED( aStdLogicVector( widthCOV   + offset - 1 DOWNTO offset ) );
     offset := offset + widthCOV;
     lTrack.cov_33            := UNSIGNED( aStdLogicVector( widthCOV   + offset - 1 DOWNTO offset ) );
     offset := offset + widthCOV;
     lTrack.cov_01            :=   SIGNED( aStdLogicVector( widthCOV   + offset - 1 DOWNTO offset ) );
     offset := offset + widthCOV;
     lTrack.cov_23            :=   SIGNED( aStdLogicVector( widthCOV   + offset - 1 DOWNTO offset ) );
     offset := offset + widthCOV;
     lTrack.hitPattern        := aStdLogicVector( 8 + offset - 1 DOWNTO offset );
-- 200 to 202 free
     lTrack.chiSquaredRphi    := UNSIGNED( aStdLogicVector( 219 DOWNTO 203 ) );
     lTrack.chiSquaredRz      := UNSIGNED( aStdLogicVector( 236 DOWNTO 220 ) );
     lTrack.dataValid         := ToBoolean( aStdLogicVector( 237 ) );
     lTrack.LayerID           := TO_INTEGER( UNSIGNED( aStdLogicVector( 240 DOWNTO 238 ) ) );
     lTrack.trackID           := TO_INTEGER( UNSIGNED( aStdLogicVector( 245 DOWNTO 241 ) ) );
     lTrack.eventID           := TO_INTEGER( UNSIGNED( aStdLogicVector( 249 DOWNTO 247 ) ) );
     lTrack.SkippedLayerCount := TO_INTEGER( UNSIGNED( aStdLogicVector( 251 DOWNTO 250 ) ) );
    RETURN lTrack;
  END FUNCTION ToLRtrack;

END PACKAGE BODY LR_Tracks_pkg;
