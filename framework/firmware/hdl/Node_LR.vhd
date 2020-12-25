library ieee;
use ieee.std_logic_1164.all;
USE work.Config_LR.all;


entity Node_LR is
generic (
    WorkerID : integer     -- For debug
);
port (
    clk: in std_logic;
    LR_Node_din: in ldata( 0 downto 0 );
    LR_Node_dout: out ldata( 1 downto 0 )
);
end;


architecture rtl of node_LR is

signal aStub: Stub := NullStub;
signal aTrack: Track := NullTrack;
signal dout: StubTrack := NullStubTrack;

begin

    --cIF: entity work.InputLinkFormatter port map ( clk, LR_Node_din, aStub );
        
    --cHS: entity work.workerCallHLS_LR port map ( clk, aStub, aTrack );   
    
    --cTS: entity work.TrackStubAssociation_LR port map ( clk, aStub, aTrack, dout );
        
    --cOF: entity work.OutputLinkFormatter port map ( clk, aStub, LR_Node_dout ); 

end;

