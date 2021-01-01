library ieee;
use ieee.std_logic_1164.all;
USE WORK.LR_Config_pkg.all;
use work.LR_Tracks_pkg.all;
use work.DR_Tracks_pkg.all;
use work.LR_Stubs_pkg.all;
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


signal InputStub, AssociatedStub: tStub := NullStub;
signal LR_PreTrack, FilteredIteratedTrack: tLRtrack := NullLRtrack;
signal AssociatedTrack, IteratedTrack: tLRtrack := NullLRtrack;
signal OutputTrack, DRtrack: tDRtrack := NullDRtrack;
signal Synchronize: std_logic := '0';
signal EventCut: integer range 0 to numEvents - 1 := 0;
signal ConcatinatedTrack: tUnconstrainedLRtrackArray( 1 downto 0 ) := ( others => NullLRtrack );


begin


cILF: entity work.InputLinkFormatter port map ( clk, LR_Node_din, InputStub, Synchronize );

--cPTC: entity work.LR_PreTrackCreator port map ( clk, InputStub, LR_PreTrack );

--cTF: entity work.LR_TrackFilter generic map ( true ) port map ( clk, IteratedTrack, EventCut, FilteredIteratedTrack );

--ConcatinatedTrack <= FilteredIteratedTrack & LR_PreTrack;

--cTSA: entity work.LR_TrackStubAssociation generic map (WorkerID) port map ( clk, EventCut, InputStub, ConcatinatedTrack, AssociatedStub, AssociatedTrack );

cHLS: entity work.LR_WorkerCallHLS port map ( clk, AssociatedStub, AssociatedTrack );

--cTA: entity work.LR_TrackAccumulator port map ( clk, Synchronize, EventCut, DRtrack, OutputTrack );

cOLF: entity work.OutputLinkFormatter port map ( clk, OutputTrack, LR_Node_dout );

--Debug printout
--gDebug : if not For_Synthesis generate
--  cPT: entity work.LR_PrintTop generic map ( WorkerID ) port map ( clk, EventCut, LR_Node_din, InputStub, LR_PreTrack, AssociatedStub, AssociatedTrack, IteratedTrack, FilteredIteratedTrack, DRtrack, OutputTrack); -- , KalmanNode_dout );
--end generate;

end;
