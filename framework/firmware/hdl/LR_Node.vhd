library ieee;
use ieee.std_logic_1164.all;
USE WORK.LR_Config.all;
use work.LR_Tracks.all;
use work.DR_Tracks.all;
use work.LR_Stubs.all;
use work.utilities_pkg.all;
use work.emp_data_types.all;


entity LR_Node is
generic (
    WorkerID : integer     -- For debug
);
port (
    clk: in std_logic;
    LR_Node_din: in ldata( 0 downto 0 );
    LR_Node_dout: out ldata( 1 downto 0 )
);
end;


architecture rtl of LR_Node is


signal InputStub, OutputStub : tStub := NullStub;
signal OutputLRtrack : tLRtrack := NullLRtrack;
signal OutputDRtrack : tDRtrack := NullDRtrack;

begin

cILF: entity work.InputLinkFormatter port map ( clk, LR_Node_din, InputStub);

cHLS: entity work.LR_WorkerCallHLS port map ( clk, InputStub, OutputStub, OutputLRtrack, OutputDRtrack );
 
cOLF: entity work.OutputLinkFormatter port map ( clk, OutputDRtrack, LR_Node_dout );

--Debug printout
--gDebug : if not For_Synthesis generate
--  cPT: entity work.LR_PrintTop generic map ( WorkerID ) port map ( clk, LR_Node_din, InputStub, OutputStub, OutputLRTrack, OutputDRTrack ); --, LR_Node_dout );
--end generate;

end;
