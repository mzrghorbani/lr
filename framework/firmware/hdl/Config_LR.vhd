LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.math_real.all;

--library UNISIM;
--use UNISIM.VComponents.all;

PACKAGE Config_LR IS

-- EMP-FW

CONSTANT LWORD_WIDTH: INTEGER := 64;
CONSTANT N_REGION: INTEGER := 28;
CONSTANT LR_Workers: INTEGER := 16;

constant MinStubsPerTrack      : natural  := 4;
constant MaxStubsPerTrack      : natural  := 4;  

-- debug prinout to xml for at most this many clks.
constant PrintNumClks          : natural  := 9999;

constant numTracks   : natural := 32;  -- max. number of HT tracks per TMP (compare TM*(360MHz/40MHz)/(5 stubs) = 32)
constant numEventsRed   : natural := 4;  -- Dimensions of arrays used to store data from different event IDs. (Power of 2 that is >= EventCounterOffset)
constant numEvents      : natural := 2*numEventsRed; -- No. of event IDs used to distinguish interleaved events.

type lword is
    record
        data: std_logic_vector(LWORD_WIDTH - 1 downto 0);
        valid: std_logic;
        start: std_logic;
        strobe: std_logic;
    end record;
    
type ldata is array(natural range <>) of lword;

constant LWORD_NULL: lword := ((others => '0'), '0', '0', '0');
constant LDATA_NULL: ldata(0 downto 0) := (0 => LWORD_NULL);

type integers   is array ( natural range <> ) of integer;

constant inputLinkMap: integers( 0 to LR_Workers - 1 ) := ( 0,2,4,6,8,10,12,14,16,18,20,22,24,26,28,30 );
constant outputLinkMap: integers( 0 to  2 * LR_Workers - 1 ) := ( 0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31 );
function inputLinkMapping( l: ldata ) return ldata;
function outputLinkMapping( l: ldata ) return ldata;

-- LRHLS
    
    CONSTANT numStubs       : INTEGER := 7;
    CONSTANT numLayers      : INTEGER := 7; 
    
    CONSTANT lrMinLayers    : INTEGER := 4;
    CONSTANT lrMinLayersPS  : INTEGER := 2;
    CONSTANT MaxStubsPerLayer  : NATURAL  := 4;
    
    CONSTANT lrChosenRofPhi : REAL    := 67.24;
    CONSTANT lrChosenRofZ   : REAL    := 50.0;
    CONSTANT lrResidPhi     : REAL    := 0.001;
    CONSTANT lrResidZPS     : REAL    := 0.07;
    CONSTANT lrResidZ2S     : REAL    := 0.25;
    
    constant chosenRofPhi       : real    := 67.240; -- offest radius used for phi sector definitionmaxRtimesMoverBend21.
    constant numSectorsEta      : natural := 16;     -- number of further sectors in eta
    constant chosenRofZ         : real    := 50.0;   -- offest radius used for eta sector definition
    
    TYPE Stub IS RECORD
        r                   : SIGNED( 11 DOWNTO 0 );
        phi                 : SIGNED( 13 DOWNTO 0 );
        z                   : SIGNED( 13 DOWNTO 0 );
        layerID             : INTEGER RANGE 0 TO 2;
        psModule            : BOOLEAN;
        barrel              : BOOLEAN;
        valid               : BOOLEAN;
    END RECORD Stub;
    
    CONSTANT NullStub : Stub := ( ( OTHERS => '0' ), ( OTHERS => '0' ), ( OTHERS => '0' ), 0, FALSE, FALSE, FALSE);
    
    TYPE Track IS RECORD
        qOverPt             : SIGNED( 15 DOWNTO 0 );
        phiT                : SIGNED( 12 DOWNTO 0 );
        cot                 : SIGNED( 16 DOWNTO 0 );
        zT                  : SIGNED( 12 DOWNTO 0 );
    END RECORD Track;
    
    CONSTANT NullTrack : Track := ( ( OTHERS => '0'), ( OTHERS => '0'), ( OTHERS => '0'), ( OTHERS => '0') );
    
    TYPE StubTrack IS RECORD
        r                   : SIGNED( 11 DOWNTO 0 );
        phi                 : SIGNED( 13 DOWNTO 0 );
        z                   : SIGNED( 13 DOWNTO 0 );
        qOverPt             : SIGNED( 15 DOWNTO 0 );
        phiT                : SIGNED( 12 DOWNTO 0 );
        cot                 : SIGNED( 16 DOWNTO 0 );
        zT                  : SIGNED( 12 DOWNTO 0 );
        layerID             : INTEGER RANGE 0 TO 2;
        psModule            : BOOLEAN;
        barrel              : BOOLEAN;
        valid               : BOOLEAN;
    END RECORD StubTrack;
    
    CONSTANT NullStubTrack : StubTrack := ( ( OTHERS => '0' ), ( OTHERS => '0' ), ( OTHERS => '0' ), 
                                            ( OTHERS => '0' ), ( OTHERS => '0' ), ( OTHERS => '0' ), 
                                            ( OTHERS => '0' ), 0 , FALSE, FALSE, FALSE);
    
    TYPE Stubs IS ARRAY (0 TO numStubs-1) OF Stub;
    TYPE layerPopulations IS ARRAY (0 TO numLayers-1) OF INTEGER;
    
    constant widthZ             : natural := 14;
    constant widthR             : natural := 12; 
    constant widthPhi           : natural := 14; 
    constant widthCotTheta      : integer := 17; 
    
    FUNCTION width( x: INTEGER ) RETURN INTEGER;
    FUNCTION width( x: REAL    ) RETURN INTEGER;
    FUNCTION ToBoolean( ARG : STD_LOGIC ) RETURN BOOLEAN;
    FUNCTION ToStdLogic( ARG : BOOLEAN ) RETURN STD_LOGIC;
    FUNCTION ToStdLogicVector( aStub : Stub ; CONSTANT width : INTEGER ) RETURN STD_LOGIC_VECTOR;
    FUNCTION LinkToStub( aStdLogicVector : STD_LOGIC_VECTOR ) RETURN Stub;
    FUNCTION TrackToLink( aTrack : Track ) RETURN ldata;
    
    constant widthLayer     : natural := width( numLayers );
    constant widthStubs     : natural := width( numStubs );
    constant widthTracks    : natural := width( numTracks );
    constant widthEvents    : natural := width( numEvents );
    constant widthEventsRed : natural := width( numEventsRed );
    
END PACKAGE Config_LR;


PACKAGE BODY Config_LR IS

--    FUNCTION shift_reg(din : Stub) RETURN Stubs IS
--        VARIABLE reg, dout : Stubs;
--        BEGIN
--        SHIFT: FOR i IN numStubs-1 DOWNTO 0 LOOP
--            IF i = 0 THEN
--                reg(i) := din;
--            ELSE
--                reg(i) := reg(i-1);
--            END IF;
--        END LOOP SHIFT;
--        WRITE: FOR i IN 0 TO numStubs LOOP
--            dout(i) := reg(i);
--        END LOOP WRITE;
--        RETURN dout;
--    END shift_reg;
--FUNCTION layerPopulation_t( buffer_t : stubs ) RETURN layerPopulations;

--FUNCTION layerPopulation_t( buffer_t : stubs ) RETURN layerPopulations IS
--VARIABLE population : layerPopulations;
--BEGIN
--    FOR k IN 0 To numStubs-1 LOOP 
--        IF( buffer_t( k ).valid = true ) THEN
--            population( buffer_t( k ).layer ) := population( buffer_t( k ).layer ) + 1;
--        END IF;
--    END LOOP;
--END layerPopulation_t;

FUNCTION ToStdLogic( ARG : BOOLEAN ) RETURN STD_LOGIC IS
BEGIN
    IF ARG THEN RETURN( '1' );
    ELSE RETURN( '0' );
    END IF;
END FUNCTION ToStdLogic;



FUNCTION ToBoolean( ARG : STD_LOGIC ) RETURN BOOLEAN IS
  BEGIN
      IF ARG='1' THEN RETURN( true );
      ELSE RETURN( false );
      END IF;
  END FUNCTION ToBoolean;
  


function inputLinkMapping( l: ldata ) return ldata is
    variable r: ldata( LR_Workers - 1 downto 0 ) := ( others => LWORD_NULL );
begin
    for k in LR_Workers - 1 downto 0 loop
        r( k ) := l( inputLinkMap( k ) );
    end loop;
    return r;
end function;


function outputLinkMapping( l: ldata ) return ldata is
    variable r: ldata( 4 * N_REGION - 1 downto 0 ) := ( others => LWORD_NULL );
begin
    for k in 2 * LR_Workers - 1 downto 0 loop
        r( outputLinkMap( k ) ) := l( k );
    end loop;
    return r;
end function;



function width( x: integer ) return integer is 
begin 
    return width( real( x ) ); 
end function;



function width( x: real ) return integer is
    variable y: real := abs( x );
begin
    if y < 1.0 and y > 0.0 then
        return 1;
    end if;
    if y = 0.0 then
        return 0;
    end if;
    return integer( ceil( log2( y ) ) );
end function;



FUNCTION ToStdLogicVector( aStub : Stub ; CONSTANT width : INTEGER ) RETURN STD_LOGIC_VECTOR IS
    VARIABLE lStdLogicVector       : STD_LOGIC_VECTOR( width-1 DOWNTO 0 ) := ( OTHERS => '0' );
    VARIABLE offset : natural := 0;
  BEGIN
    lStdLogicVector( widthLayer         + offset - 1 DOWNTO offset ) := STD_LOGIC_VECTOR( TO_UNSIGNED( aStub.layerID, 3 ) );
    offset := offset + widthLayer;
    lStdLogicVector( widthZ             + offset - 1 DOWNTO offset ) := STD_LOGIC_VECTOR( aStub.z );
    offset := offset + widthZ;
    lStdLogicVector( widthPhi           + offset - 1 DOWNTO offset ) := STD_LOGIC_VECTOR( aStub.phi );
    offset := offset + widthPhi;
    lStdLogicVector( (widthR + 1)       + offset - 1 DOWNTO offset ) := STD_LOGIC_VECTOR( aStub.r );
    offset := offset + (widthR + 1);
    offset := offset + 1;
    lStdLogicVector( 1                  + offset - 1               ) := ToStdLogic( aStub.valid );
    RETURN lStdLogicVector;
END FUNCTION ToStdLogicVector;



FUNCTION TrackToLink( aTrack : Track ) RETURN ldata IS
    variable data : ldata( 4 * N_REGION - 1 downto 0 ) := ( others => LWORD_NULL );
    VARIABLE offset : natural := 0;
  BEGIN

    RETURN data;
  END FUNCTION TrackToLink;



FUNCTION LinkToStub( aStdLogicVector : STD_LOGIC_VECTOR ) RETURN Stub IS
    VARIABLE lStub                 : Stub := NullStub;  
    VARIABLE offset : natural := 0;
  BEGIN

    RETURN lStub;
  END FUNCTION LinkToStub;


END PACKAGE BODY Config_LR;

