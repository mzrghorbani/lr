LIBRARY XIL_DEFAULTLIB;
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;

USE WORK.Config.ALL;
USE WORK.LR_Config.ALL;
USE WORK.LR_Stubs.ALL;
USE WORK.DR_Tracks.ALL;
USE WORK.LR_Tracks.ALL;

USE WORK.utilities_pkg.ALL;



ENTITY LR_WorkerCallHLS IS
  GENERIC(
    Use_Z_cut          : BOOLEAN := TRUE;
    Use_pT_cut         : BOOLEAN := TRUE;
    Use_ChiSquared_cut : BOOLEAN := TRUE;
    Use_PS_cut         : BOOLEAN := TRUE;
    Use_Sector_cut     : BOOLEAN := TRUE
  );
  PORT(
    clk          : in  std_logic;
    stubIn       : in  tStub       := NullStub;
    stubOut      : out tStub       := NullStub;
    lrTrackOut   : out tLRtrack    := NullLRtrack;
    drTrackOut   : out tDRtrack    := NullDRtrack
  );
END LR_WorkerCallHLS;

ARCHITECTURE rtl OF LR_WorkerCallHLS IS

-- Control signals
signal reset : std_logic := '1'; -- asserted LOW
signal start : std_logic := '0'; -- asserted HIGHT
signal ready : std_logic := '0'; -- asserted HIGHT
signal done  : std_logic := '0'; -- asserted HIGHT 
signal idle  : std_logic := '1'; -- asserted LOW

-- Internal signals

signal cBin : std_logic_vector( widthBinsPhi - 1 downto 0 ) := ( others => '0' );
signal mBin : std_logic_vector( widthBinsPt - 1 downto 0 ) := ( others => '0' );
signal z : std_logic_vector( widthZ - 1 downto 0 ) := ( others => '0' );
signal phiS : std_logic_vector( 13 downto 0 ) := ( others => '0' );               
signal r : std_logic_vector( 12 downto 0 ) := ( others => '0' );                  
signal PhiSectorID : std_logic_vector( 17 downto 0 ) := ( others => '0' );       
signal EtaSectorID : std_logic_vector( 7 downto 0 ) := ( others => '0' );      
signal zSign : std_logic := '0';             
signal trackID : std_logic_vector( 17 downto 0 ) := ( others => '0' );            
signal layerID : std_logic_vector( 17 downto 0 ) := ( others => '0' );          
signal StubID  : std_logic_vector( 17 downto 0 ) := ( others => '0' );          
signal EventID :  std_logic_vector( 17 downto 0 ) := ( others => '0' );          
signal LastStubInTrack : std_logic := '0';     
signal DataValid : std_logic_vector( 0 downto 0 ) := ( others => '0' );      
signal IsEndCap : std_logic := '0';           
signal FrameValid : std_logic := '0'; 

signal stubIn_barrel :  std_logic_vector( 0 downto 0 ) := ( others => '0' ); 
signal stubIn_psModule :  std_logic_vector( 0 downto 0 ) := ( others => '0' );     

signal barrel :  std_logic_vector( 0 downto 0 ) := ( others => '0' ); 
signal psModule :  std_logic_vector( 0 downto 0 ) := ( others => '0' );
    
signal qOverPt: std_logic_vector ( 17 downto 0 ) := ( others => '0' );
signal phiT: std_logic_vector ( 17 downto 0 ) := ( others => '0' );
signal cot: std_logic_vector ( 17 downto 0 ) := ( others => '0' );
signal zT: std_logic_vector ( 17 downto 0 ) := ( others => '0' );

-- signals
signal absZ: integer;

begin

-- TODO: modification of tStub record to add barrel and PS information.
-- Setting barrel and PS for simulations only! (perhaps not correct values!)
absZ <= to_integer( not stubIn.z ) when stubIn.z( stubIn.z'high ) = '1';
stubIn_barrel <= "1" when absZ < integer( barrelHalfLength / baseZ ) else "0";
stubIn_psModule <= "1" when absZ < integer( barrelHalfLength / baseZ ) else "0";


ctrl_proc : process ( clk )
variable numClk : unsigned( 1 downto 0 ) := ( others => '0' );
begin
    -- commence processing after 4th clock cycle
    if ( rising_edge( clk ) ) then
        if ( numClk = 1 ) then
            reset <= '0';
        elsif ( numClk = 2 ) then
            start <= '1';
        end if;
        if ( numClk < 3 ) then
            numClk := numClk + 1;
        end if;
    end if;
end process;


xil_defaultliberInstance : entity xil_defaultlib.LRHLS_update_IP
port map (
    ap_clk => clk,
    ap_rst => reset,
    ap_start => start,
    ap_ready => ready,
    ap_done => done,
    ap_idle => idle,
    stubIn_r_V_q0( 12 downto 0 ) => std_logic_vector( StubIn.r ),
    stubIn_phi_V_q0( 13 downto 0 ) => std_logic_vector( StubIn.phiS ),
    stubIn_z_V_q0( 13 downto 0 ) => std_logic_vector( StubIn.z ),
    stubIn_layer_V_q0( 2 downto 0 ) => ToStdLogicVector3( StubIn.LayerID ),
    stubIn_barrel_V_q0( 0 ) => stubIn_barrel( 0 ),
    stubIn_psModule_V_q0( 0 ) => stubIn_psModule( 0 ),
    stubIn_valid_V_q0( 0 ) => ToStdLogic( StubIn.DataValid ),
    stubOut_r_V_d0( 12 downto 0 ) => r( 12 downto 0 ),
    stubOut_phi_V_d0( 13 downto 0 ) => phiS( 13 downto 0 ),
    stubOut_z_V_d0( 13 downto 0 ) => z( 13 downto 0 ),
    stubOut_layer_V_d0( 2 downto 0 ) => layerID( 2 downto 0 ),
    stubOut_barrel_V_d0( 0 ) => barrel( 0 ),
    stubOut_psModule_V_d0( 0 ) => psModule( 0 ),
    stubOut_valid_V_d0( 0 ) => DataValid( 0 ),
    track_qOverPt_V( 17 downto 0 ) => qOverPt( 17 downto 0 ),
    track_phiT_V( 17 downto 0 ) => phiT( 17 downto 0 ),
    track_cot_V( 17 downto 0 ) => cot( 17 downto 0 ),
    track_zT_V( 17 downto 0 ) => zT( 17 downto 0 )
);


proc : process( clk )

variable llrTrack : tLRtrack := NullLRtrack;
variable ldrTrack : tDRtrack := NullDRtrack;

begin

    if rising_edge( clk ) then
    
        -- for debug only. Correct conversion must be calculated 
        llrTrack.inv2R := signed( qOverPt );
        llrTrack.phi0 := signed( phiT );
        llrTrack.tanL := signed( cot );
        llrTrack.z0 := signed( zT );

        ldrTrack := ToDrTrack( llrTrack );

        lrTrackOut <= llrTrack;
        drTrackOut <= ldrTrack;

    end if;
end process;

END;
