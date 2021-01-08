LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;
USE IEEE.math_real.ALL;

USE WORK.Config.ALL;
USE WORK.LR_Config_pkg.ALL;
USE WORK.DR_Tracks_pkg.ALL;
USE WORK.LR_Tracks_pkg.ALL;
USE WORK.LR_Stubs_pkg.ALL;
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
    clk        : in  std_logic;
    stubIn     : in  tStub       := NullStub;
    stubOut    : out tStub       := NullStub;
    trackOut   : out tLRtrack    := NullLRtrack
  );
END LR_WorkerCallHLS;

ARCHITECTURE rtl OF LR_WorkerCallHLS IS
component LRHLS_update_IP is
    port (
        ap_clk : in STD_LOGIC;
        ap_rst : in STD_LOGIC;
        ap_start : in STD_LOGIC;
        ap_ready : out STD_LOGIC;
        ap_done : out STD_LOGIC;
        ap_idle : out STD_LOGIC;
        stubIn_r : in STD_LOGIC_VECTOR ( 12 downto 0 );
        stubIn_phi : in STD_LOGIC_VECTOR ( 13 downto 0 );
        stubIn_z : in STD_LOGIC_VECTOR ( 13 downto 0 );
        stubIn_layer : in STD_LOGIC_VECTOR ( 2 downto 0 );
        stubIn_barrel : in STD_LOGIC_VECTOR ( 0 to 0 );
        stubIn_psModule : in STD_LOGIC_VECTOR ( 0 to 0 );
        stubIn_valid : in STD_LOGIC_VECTOR ( 0 to 0 );
        stubOut_r : out STD_LOGIC_VECTOR ( 12 downto 0 );
        stubOut_phi : out STD_LOGIC_VECTOR ( 13 downto 0 );
        stubOut_z : out STD_LOGIC_VECTOR ( 13 downto 0 );
        stubOut_layer : out STD_LOGIC_VECTOR ( 2 downto 0 );
        stubOut_barrel : out STD_LOGIC_VECTOR ( 0 to 0 );
        stubOut_psModule : out STD_LOGIC_VECTOR ( 0 to 0 );
        stubOut_valid : out STD_LOGIC_VECTOR ( 0 to 0 );
        track_qOverPt : out STD_LOGIC_VECTOR ( 17 downto 0 );
        track_phiT : out STD_LOGIC_VECTOR ( 17 downto 0 );
        track_cot : out STD_LOGIC_VECTOR ( 17 downto 0 );
        track_zT : out STD_LOGIC_VECTOR ( 17 downto 0 )
    );
end component LRHLS_update_IP;

-- Control signals
signal reset : std_logic := '1'; -- asserted LOW
signal start : std_logic := '0'; -- asserted HIGHT
signal ready : std_logic := '0'; -- asserted HIGHT
signal done  : std_logic := '0'; -- asserted HIGHT 
signal idle  : std_logic := '1'; -- asserted LOW

-- input interface
signal stubIn_r: STD_LOGIC_VECTOR ( 12 downto 0 );
signal stubIn_phi: STD_LOGIC_VECTOR ( 13 downto 0 );
signal stubIn_z: STD_LOGIC_VECTOR ( 13 downto 0 );
signal stubIn_layer: STD_LOGIC_VECTOR ( 2 downto 0 );
signal stubIn_barrel: STD_LOGIC_VECTOR ( 0 to 0 );
signal stubIn_psModule: STD_LOGIC_VECTOR ( 0 to 0 );
signal stubIn_valid: STD_LOGIC_VECTOR ( 0 to 0 );

-- output interface
signal stubOut_r: STD_LOGIC_VECTOR ( 12 downto 0 );
signal stubOut_phi: STD_LOGIC_VECTOR ( 13 downto 0 );
signal stubOut_z: STD_LOGIC_VECTOR ( 13 downto 0 );
signal stubOut_layer: STD_LOGIC_VECTOR ( 2 downto 0 );
signal stubOut_barrel: STD_LOGIC_VECTOR ( 0 to 0 );
signal stubOut_psModule: STD_LOGIC_VECTOR ( 0 to 0 );
signal stubOut_valid: STD_LOGIC_VECTOR ( 0 to 0 );

-- output interface
signal track_qOverPt: STD_LOGIC_VECTOR ( 17 downto 0 );
signal track_qOverPt_vld: STD_LOGIC;
signal track_phiT: STD_LOGIC_VECTOR ( 17 downto 0 );
signal track_phiT_vld: STD_LOGIC;
signal track_cot: STD_LOGIC_VECTOR ( 17 downto 0 );
signal track_cot_vld: STD_LOGIC;
signal track_zT: STD_LOGIC_VECTOR ( 17 downto 0 );
signal track_zT_vld: STD_LOGIC;

-- intermediate signals
signal absZ: integer;

begin

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


stubIn_r <= std_logic_vector( stubIn.r );
stubIn_phi <= std_logic_vector( stubIn.phiS );
stubIn_z <= std_logic_vector( stubIn.z );
stubIn_layer <= std_logic_vector( to_unsigned( stubIn.layerID, stubIn_layer'length ) );

-- TODO: modification of tStub record to add barrel and PS information.
-- Setting barrel and PS for simulations only! (perhaps not correct values!)
absZ <= to_integer( not stubIn.z ) when stubIn.z( stubIn.z'high ) = '1';
stubIn_barrel <= "1" when absZ < integer( floor( barrelHalfLength / baseZ ) ) else "0";
stubIn_psModule <= "1" when absZ < integer( floor( barrelHalfLength / baseZ ) ) else "0";

stubIn_valid <= ToStdLogicVector( stubIn.DataValid );

  
LRHLS_update_IP_i: component LRHLS_update_IP
    port map (
        ap_clk => clk,
        ap_rst => reset,
        ap_start => start,
        ap_ready => ready,
        ap_done => done,
        ap_idle => idle,
        stubIn_r(12 downto 0) => stubIn_r(12 downto 0),
        stubIn_phi(13 downto 0) => stubIn_phi(13 downto 0),
        stubIn_z(13 downto 0) => stubIn_z(13 downto 0),
        stubIn_layer(2 downto 0) => stubIn_layer(2 downto 0),
        stubIn_barrel(0) => stubIn_barrel(0),
        stubIn_psModule(0) => stubIn_psModule(0),
        stubIn_valid(0) => stubIn_valid(0),
        stubOut_r(12 downto 0) => stubOut_r(12 downto 0),
        stubOut_phi(13 downto 0) => stubOut_phi(13 downto 0),
        stubOut_z(13 downto 0) => stubOut_z(13 downto 0),
        stubOut_layer(2 downto 0) => stubOut_layer(2 downto 0),
        stubOut_barrel(0) => stubOut_barrel(0),
        stubOut_psModule(0) => stubOut_psModule(0),
        stubOut_valid(0) => stubOut_valid(0),
        track_qOverPt(17 downto 0) => track_qOverPt(17 downto 0),
        track_phiT(17 downto 0) => track_phiT(17 downto 0),
        track_cot(17 downto 0) => track_cot(17 downto 0),
        track_zT(17 downto 0) => track_zT(17 downto 0)
    );
    
stubOut.r <= unsigned( stubOut_r );
stubOut.phiS <= signed( stubOut_phi );
stubOut.z <= signed( stubOut_z );
stubOut.layerID <= to_integer( unsigned( stubOut_layer ) );
stubOut.DataValid <= ToBoolean( stubOut_valid );

END;
