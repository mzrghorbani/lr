LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;
USE IEEE.math_real.ALL;

USE WORK.XMLutilities_pkg.ALL;
USE WORK.utilities_pkg.ALL;
USE WORK.config.ALL;
USE WORK.LR_Config_pkg.ALL;
USE WORK.tools.ALL;


-- ----------------------------------------------
PACKAGE LR_Stubs_pkg IS

  TYPE tStub IS RECORD
    cBin                : SIGNED( widthBinsPhi - 1 DOWNTO 0 );
    mBin                : SIGNED( widthBinsPt - 1 DOWNTO 0 );
    z                   : SIGNED( widthZ - 1 DOWNTO 0 );
    phiS                : SIGNED( widthPhi - 1 DOWNTO 0 );
    r                   : UNSIGNED( widthR DOWNTO 0 ); 
    PhiSectorID         : INTEGER RANGE 0 TO numSectorsPhi - 1;
    EtaSectorID         : INTEGER RANGE 0 TO numSectorsEta / 2 - 1;
    zSign               : BOOLEAN;
    trackID             : INTEGER RANGE 0 TO numTracks - 1;
    layerID             : INTEGER RANGE 0 TO numLayers; 
    StubID              : INTEGER RANGE 0 TO MaxStubsPerLayer - 1;
    EventID             : INTEGER RANGE 0 TO numEvents - 1;
    LastStubInTrack     : BOOLEAN;
    DataValid           : BOOLEAN;
-- Below here are not stored in FIFO
    IsEndCap            : BOOLEAN;
    FrameValid          : BOOLEAN;
  END RECORD;

  TYPE tUnconstrainedStubArray IS ARRAY( INTEGER RANGE <> ) OF tStub;
  SUBTYPE tStubArray           IS tUnconstrainedStubArray( 0 TO 35 );
  TYPE tStubPipe               IS ARRAY( INTEGER RANGE <> ) OF tStubArray;
  TYPE tSingleStubPipe         IS ARRAY( INTEGER RANGE <> ) OF tStub;

  CONSTANT NullStub : tStub := ( ( OTHERS => '0' ) , ( OTHERS => '0' ) ,
                                 ( OTHERS => '0' ) , ( OTHERS => '0' ) , ( OTHERS => '0' ) , 0 , 0 , FALSE ,
                                 0 , 0 , 0 , 0 , FALSE , FALSE , FALSE , FALSE );
  CONSTANT NullStubArray               : tStubArray := ( OTHERS => NullStub );

  FUNCTION ToXML( aStub                : tStub ) RETURN STRING;

  FUNCTION ToStdLogicVector( aStub     : tStub ; CONSTANT width : INTEGER ) RETURN STD_LOGIC_VECTOR;

  FUNCTION ToStub( aStdLogicVector     : STD_LOGIC_VECTOR ) RETURN tStub;
  FUNCTION LinkToStub( aStdLogicVector : STD_LOGIC_VECTOR ) RETURN tStub;

END PACKAGE LR_Stubs_pkg;
-- ----------------------------------------------

-- ----------------------------------------------
PACKAGE BODY LR_Stubs_pkg IS

  FUNCTION ToXML( aStub : tStub ) RETURN STRING IS
  BEGIN
    RETURN "<Stub" &
            ToXMLattr( "eventID" , aStub.EventID ) &
            ToXMLattr( "trackID" , aStub.trackID ) &
            ToXMLattr( "layerID" , aStub.layerID ) &
            ToXMLattr( "stubID" , aStub.StubID ) &
            ToXMLattr( "PhiSectorID" , aStub.PhiSectorID ) &
            ToXMLattr( "EtaSectorID" , aStub.EtaSectorID ) &
            ToXMLattr( "zSign" , aStub.zSign ) &
            ToXMLattr( "cBin_ht" , aStub.cBin ) &
            ToXMLattr( "mBin_ht" , aStub.mBin ) &
            ToXMLattr( "z" , aStub.z ) &
            ToXMLattr( "phiS" , aStub.phiS ) &
            ToXMLattr( "r" , aStub.r ) &
            ToXMLattr( "isEndCap" , aStub.IsEndCap ) &
            ToXMLattr( "lastStubInTrack" , aStub.LastStubInTrack ) &
            ToXMLattr( "dataValid" , aStub.DataValid ) &
            ToXMLattr( "frameValid" , aStub.FrameValid ) &
            "/>";
  END FUNCTION ToXML;

  FUNCTION ToStdLogicVector( aStub : tStub ; CONSTANT width : INTEGER ) RETURN STD_LOGIC_VECTOR IS
    VARIABLE lStdLogicVector       : STD_LOGIC_VECTOR( width-1 DOWNTO 0 ) := ( OTHERS => '0' );
    VARIABLE offset : natural := 0;
  BEGIN
    lStdLogicVector( widthBinsPhi                - 1 DOWNTO      0 ) := STD_LOGIC_VECTOR( aStub.cBin );
    offset := widthBinsPhi;
    lStdLogicVector( widthBinsPt        + offset - 1 DOWNTO offset ) := STD_LOGIC_VECTOR( aStub.mBin );
    offset := offset + widthBinsPt;
    lStdLogicVector( widthLayer         + offset - 1 DOWNTO offset ) := STD_LOGIC_VECTOR( TO_UNSIGNED( aStub.layerID, 3 ) );
    offset := offset + widthLayer;
    lStdLogicVector( widthZ             + offset - 1 DOWNTO offset ) := STD_LOGIC_VECTOR( aStub.z );
    offset := offset + widthZ;
    lStdLogicVector( widthPhi           + offset - 1 DOWNTO offset ) := STD_LOGIC_VECTOR( aStub.phiS );
    offset := offset + widthPhi;
    lStdLogicVector( (widthR + 1)       + offset - 1 DOWNTO offset ) := STD_LOGIC_VECTOR( aStub.r );
    offset := offset + (widthR + 1);
    lStdLogicVector( widthSectorPhi     + offset - 1 DOWNTO offset ) := STD_LOGIC_VECTOR( TO_UNSIGNED( aStub.PhiSectorID, widthSectorPhi ) );
    offset := offset + widthSectorPhi;
    lStdLogicVector( widthSectorEta - 1 + offset - 1 DOWNTO offset ) := STD_LOGIC_VECTOR( TO_UNSIGNED( aStub.EtaSectorID, widthSectorEta - 1 ) );
    offset := offset + (widthSectorEta - 1);
    lStdLogicVector( 1                  + offset - 1               ) := ToStdLogic( aStub.zSign );
    offset := offset + 1;
    lStdLogicVector( widthTracks        + offset - 1 DOWNTO offset ) := STD_LOGIC_VECTOR( TO_UNSIGNED( aStub.trackID, widthTracks ) );
    offset := offset + widthTracks;
    lStdLogicVector( widthEvents        + offset - 1 DOWNTO offset ) := STD_LOGIC_VECTOR( TO_UNSIGNED( aStub.EventID, widthEvents ) );
    offset := offset + widthEvents;
    lStdLogicVector( 1                  + offset - 1               ) := ToStdLogic( aStub.LastStubInTrack );
    offset := offset + 1;
    lStdLogicVector( 1                  + offset - 1               ) := ToStdLogic( aStub.DataValid );
    RETURN lStdLogicVector;
  END FUNCTION ToStdLogicVector;


  FUNCTION ToStub( aStdLogicVector : STD_LOGIC_VECTOR ) RETURN tStub IS
    VARIABLE lStub                 : tStub := NullStub;
    VARIABLE absZ: integer;    
    VARIABLE offset : natural := 0;
  BEGIN
    lStub.cBin             :=   SIGNED( aStdLogicVector( widthBinsPhi          - 1 DOWNTO 0 ) );
    offset                 := widthBinsPhi;
    lStub.mBin             :=   SIGNED( aStdLogicVector( widthBinsPt  + offset - 1 DOWNTO offset ) );
    offset                 := offset + widthBinsPt;
    lStub.layerID          := TO_INTEGER( UNSIGNED( aStdLogicVector( widthLayer + offset - 1 DOWNTO offset ) ) );
    offset                 := offset + widthLayer;
    lStub.z                :=   SIGNED( aStdLogicVector( widthZ       + offset - 1 DOWNTO offset ) );
    offset                 := offset + widthZ;
    lStub.phiS             :=   SIGNED( aStdLogicVector( widthPhi     + offset - 1 DOWNTO offset ) );
    offset                 := offset + widthPhi;
    lStub.r                := UNSIGNED( aStdLogicVector( (widthR + 1) + offset - 1 DOWNTO offset ) );
    offset                 := offset + (widthR + 1);
    lStub.PhiSectorID      := TO_INTEGER( UNSIGNED( aStdLogicVector( widthSectorPhi + offset - 1 DOWNTO offset ) ) );
    offset                 := offset + widthSectorPhi;
    lStub.EtaSectorID      := TO_INTEGER( UNSIGNED( aStdLogicVector( widthSectorEta - 1 + offset - 1 DOWNTO offset ) ) );
    offset                 := offset + (widthSectorEta - 1);
    lStub.zSign            := ToBoolean( aStdLogicVector( 1           + offset - 1) );
    offset                 := offset + 1;
    lStub.trackID          := TO_INTEGER( UNSIGNED( aStdLogicVector( widthTracks + offset - 1 DOWNTO offset ) ) );
    offset                 := offset + widthTracks;
    lStub.EventID          := TO_INTEGER( UNSIGNED( aStdLogicVector( widthEvents + offset - 1 DOWNTO offset ) ) );
    offset                 := offset + widthEvents;
    lStub.LastStubInTrack  := ToBoolean( aStdLogicVector( 1           + offset - 1) );
    offset                 := offset + 1;
    lStub.DataValid        := ToBoolean( aStdLogicVector( 1           + offset - 1) );

-- Are we in Barrel or Endcap?
    absZ := to_integer( lStub.z );
    if lStub.z( lStub.z'high ) = '1' then
        absZ := to_integer( not lStub.z );
    end if;
    lStub.IsEndcap  := absZ > integer( floor( barrelHalfLength / baseZ ) );    
    
    RETURN lStub;
  END FUNCTION ToStub;


  FUNCTION LinkToStub( aStdLogicVector : STD_LOGIC_VECTOR ) RETURN tStub IS
    VARIABLE lStub                     : tStub                 := NullStub;
    VARIABLE RawEtaSectorID            : INTEGER RANGE 0 TO numSectorsEta - 1 := 0;
    VARIABLE absZ: integer;
    VARIABLE offset : natural := 0;
  BEGIN
    offset        := widthR + widthPhi;
    lStub.PhiSectorID := TO_INTEGER( UNSIGNED ( aStdLogicVector( widthSectorPhi + offset - 1 downto offset ) ) );
    offset        := offset + widthSectorPhi;
    RawEtaSectorID := TO_INTEGER( UNSIGNED( aStdLogicVector( widthSectorEta + offset - 1 DOWNTO offset ) ) ); 
    offset        := offset + widthZ + widthSectorEta;
    lStub.layerID := TO_INTEGER( UNSIGNED( aStdLogicVector( widthLayer + offset - 1 DOWNTO offset ) ) );
    offset        := offset + widthLayer;
    lStub.mBin    := SIGNED( aStdLogicVector( widthBinsPt + offset - 1 DOWNTO offset ) );
    offset        := offset + widthBinsPt;
    lStub.cBin    := SIGNED( aStdLogicVector( widthBinsPhi + offset - 1 DOWNTO offset ) );

    IF RawEtaSectorID < numSectorsEta / 2 THEN
      lStub.zSign    := True;
      lStub.EtaSectorID := numSectorsEta / 2 - 1 - RawEtaSectorID;
    ELSE
      lStub.zSign    := False;
      lStub.EtaSectorID := RawEtaSectorID - numSectorsEta / 2;
    END IF;

    offset          := widthSectorPhi + widthSectorEta + widthR + widthPhi;
    lStub.z         := SIGNED( aStdLogicVector( widthZ + offset - 1 DOWNTO offset ) ); -- Pad the LSB to preserve the sign and remember to remove the additional factor-2 later.

-- Are we in Barrel or Endcap?
    absZ := to_integer( lStub.z );
    if lStub.z( lStub.z'high ) = '1' then
        absZ := to_integer( not lStub.z );
    end if;
    lStub.IsEndcap  := absZ > integer( floor( barrelHalfLength / baseZ ) );

    lStub.phiS      := SIGNED( aStdLogicVector( widthPhi - 1 DOWNTO 0 ) );
    lStub.r         := UNSIGNED( '0' & aStdLogicVector( widthR + widthPhi - 1 DOWNTO widthPhi ) ); -- From the link , it is actually a 10-bit signed number , but the first operation is to remove the offset.
    offset          := widthBinsPhi + widthBinsPt + widthLayer + widthZ + widthSectorPhi + widthSectorEta + widthR + widthPhi;
    lStub.DataValid := ToBoolean( aStdLogicVector( 1 + offset - 1 ) );
    RETURN lStub;
  END FUNCTION LinkToStub;

END PACKAGE BODY LR_Stubs_pkg;
