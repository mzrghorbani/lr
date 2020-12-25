LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;
USE IEEE.math_real.ALL;
USE WORK.Config_LR.ALL;



ENTITY InputLinkFormatter IS
  PORT(
    clk          : IN STD_LOGIC; --! The algorithm clock
    LinksIn      : IN ldata( 0 DOWNTO 0 ) := ( OTHERS => LWORD_NULL );
    StubOut      : OUT Stub              := NullStub
  );
END InputLinkFormatter;


ARCHITECTURE behavioral OF InputLinkFormatter IS
SIGNAL StubIn : Stub := NullStub;
SIGNAL LinksInReg : ldata( 0 DOWNTO 0 ) := ( OTHERS => LWORD_NULL );

BEGIN

    PROCESS( clk )
    VARIABLE AggregatedVector    : STD_LOGIC_VECTOR( 63 DOWNTO 0 );
    VARIABLE LayerID             : INTEGER RANGE 0 TO 7  := 0;
    VARIABLE LastStubInTrack     : BOOLEAN               := FALSE;
    
    BEGIN
      IF( RISING_EDGE( clk ) ) THEN
        LinksInReg <= LinksIn;
      END IF;
      
    IF( ToBoolean( LinksInReg( 0 ).valid ) )THEN
        AggregatedVector   := LinksInReg( 0 ) .data;
        StubIn             <= LinkToStub( AggregatedVector );
        StubIn .valid <= TRUE;
    ELSE
        StubIn             <= NullStub;
        StubIn .valid <= FALSE;
    END IF;
    
    LastStubInTrack := ( NOT StubIn.valid );
    
    CASE StubIn.LayerID IS
        WHEN 1 => LayerID := 0;
        WHEN 2 => LayerID := 1;
        WHEN 3 => LayerID := 2;
        WHEN 4 => LayerID := 3;
        WHEN 5 => LayerID := 4;
        WHEN 6 => LayerID := 5;
        WHEN 7 => LayerID := 6;
        WHEN OTHERS => LayerID := 6;
    END CASE;
      
    END PROCESS;
    
    stubOut <= StubIn;

END ARCHITECTURE behavioral;


--------------------------------------------
library IEEE;
use IEEE.Std_logic_1164.all;
USE WORK.Config_LR.ALL;

ENTITY OutputLinkFormatter IS
  PORT(
    clk      : IN STD_LOGIC;
    StubIn  : IN Stub := NullStub;
    LinksOut : OUT ldata( 1 DOWNTO 0 ) := ( OTHERS => LWORD_NULL )
  );
END OutputLinkFormatter;


ARCHITECTURE behavioral OF OutputLinkFormatter IS
SIGNAL Aggregated             : Stub := NullStub;  
SIGNAL LinksOut1              : ldata( 1 DOWNTO 0 )              := ( OTHERS => LWORD_NULL );

BEGIN

  PROCESS( clk )
  BEGIN
    IF( RISING_EDGE( clk ) ) THEN

      FOR j IN 1 TO 2 LOOP
        LinksOut1( j-1 ) .data   <= x"0000000000000000";
        LinksOut1( j-1 ) .valid  <= '0';
        LinksOut1( j-1 ) .strobe <= '1';
      END LOOP;
      
      LinksOut <= LinksOut1;
      
    END IF;
      
  END PROCESS;

END ARCHITECTURE behavioral;
