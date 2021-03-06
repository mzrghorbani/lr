library ieee;
use ieee.std_logic_1164.all;
use work.emp_data_types.all;
use work.emp_device_decl.all;
use work.LR_Config.all;


entity LR_Top is
PORT(
    clk: in std_logic;
    LR_Top_din: in ldata( 4 * N_REGION - 1 downto 0 );
    LR_Top_dout: out ldata( 4 * N_REGION - 1 downto 0 )
);
end;


architecture rtl of LR_Top is

signal din: ldata( LR_Workers - 1 downto 0 ) := ( others => LWORD_NULL );
signal dout: ldata( 2 * LR_Workers - 1 downto 0 ) := ( others => LWORD_NULL );

begin


din <= work.LR_Config.inputLinkMapping( LR_Top_din );
LR_Top_dout <= work.LR_Config.outputLinkMapping( dout );

gN: for WorkerID in 0 to LR_Workers - 1 generate

  signal LR_Node_din: ldata( 0 downto 0 ) := ( others => LWORD_NULL );
  signal LR_Node_dout: ldata( 1 downto 0 ) := ( others => LWORD_NULL );

  begin

    LR_Node_din( 0 ) <= din( WorkerID );
    dout( 2 * WorkerID + 1  downto  2 * WorkerID ) <= LR_Node_dout;

    c: entity work.LR_Node generic map ( WorkerID ) port map ( clk, LR_Node_din, LR_Node_dout );

  end generate;


end;




