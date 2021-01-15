library ieee;
use ieee.std_logic_1164.all;
use work.LR_Config.all;
use work.LR_Tracks.all;
use work.DR_Tracks.all;
use work.LR_Stubs.all;
use work.utilities_pkg.all;
use work.emp_data_types.all;
use work.XMLutilities_pkg.all;
use std.textio.all;


entity LR_PrintTop is
generic (
    WorkerID : integer   
);
port (
    clk: in std_logic;
    LR_Node_din: in ldata( 0 downto 0 );
    InputStub: in tStub;
    OutputStub: in tStub;
    lrTrack: in tLRtrack;
    drTrack: in tDRtrack
    --LR_Node_dout: in ldata( 1 downto 0 )
);
end;



architecture rtl of LR_PrintTop is

begin

  proc : PROCESS( clk )

    VARIABLE s : LINE;
    VARIABLE clockCounter : INTEGER := 0;

    FILE Debug : TEXT OPEN write_mode IS "debug/LR_Top.xml";

  BEGIN
    IF RISING_EDGE( CLK ) THEN

--    IF clockCounter = 0 THEN
--      InitializeXML( Debug );
--    ELSIF clockCounter = PrintNumClks THEN
--      CloseXML( Debug );
--    END IF;

      IF clockCounter < PrintNumClks THEN

        --IF LR_Node_din( 0 ) .Valid = '1' OR LR_Node_din( 0 ) .Data /= x"0000000000000000" THEN
        --  WRITE( s , STRING' ( "<LinksIn" ) & ToXMLattr( "worker" , WorkerID ) & ToXMLattr( "clock" , clockCounter ) & ToXMLattr( "Value" , LR_Node_din( 0 ) .Data ) & STRING' ( " valid=" ) & STD_LOGIC'IMAGE( LR_Node_din( 0 ) .Valid ) & STRING' ( "/>" ) );
        --  WRITELINE( Debug , s );
        --END IF;

        IF InputStub.DataValid THEN
          WRITE( s , STRING' ( "<InputStub" ) & ToXMLattr( "worker" , WorkerID ) & ToXMLattr( "clock" , clockCounter ) & STRING' ( ">" ) );
          WRITE( s , ToXML( InputStub) );
          WRITE( s , STRING' ( "</InputStub>" ) );
          WRITELINE( Debug , s );
        END IF;


        --IF OutputStub.DataValid THEN
        --  WRITE( s , STRING' ( "<OutputStub" ) & ToXMLattr( "worker" , WorkerID ) & ToXMLattr( "clock" , clockCounter ) & STRING' ( ">" ) );
        --  WRITE( s , ToXML( InputStub) );
        --  WRITE( s , STRING' ( "</InputStub>" ) );
        --  WRITELINE( Debug , s );
        --END IF;

        --IF lrTrack.DataValid THEN
        --  WRITE( s , STRING' ( "<LRtrack" ) & ToXMLattr( "worker" , WorkerID ) & ToXMLattr( "clock" , clockCounter ) & STRING' ( ">" ) );
        --  WRITE( s , ToXML( lrTrack ) );
        --  WRITE( s , STRING' ( "</LRtrack>" ) );
        --  WRITELINE( Debug , s );
        --END IF;

        --IF drTrack.DataValid THEN
        --  WRITE( s , STRING' ( "<DRtrack" ) & ToXMLattr( "worker" , WorkerID ) & ToXMLattr( "clock" , clockCounter ) & STRING' ( ">" ) );
        --  WRITE( s , ToXML( drTrack ) );
        --  WRITE( s , STRING' ( "</DRtrack>" ) );
        --  WRITELINE( Debug , s );
        --END IF;

        --FOR j IN 0 TO 1 LOOP
        --  IF LR_Node_dout( j ).Data /= x"0000000000000000" THEN
        --    WRITE( s , STRING' ( "<LinksOut" ) & ToXMLattr( "worker" , WorkerID ) & ToXMLattr( "link" , j ) & ToXMLattr( "clock" , clockCounter ) & ToXMLattr( "Value" , LR_Node_dout( j ) .Data ) & STRING' ( "/>" ) );
        --    WRITELINE( Debug , s );
        --  END IF;
        --END LOOP;

      END IF;

      clockCounter := clockCounter + 1;

    END IF;
  END PROCESS;
end;
