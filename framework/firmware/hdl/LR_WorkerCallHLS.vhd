LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;

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
    clk        : IN STD_LOGIC;
    StubIn     : IN tStub      := NullStub;
    TrackOut   : buffer tLRtrack  := NullLRtrack
  );
END LR_WorkerCallHLS;

ARCHITECTURE rtl OF LR_WorkerCallHLS IS

  component WorkerUpdateIP is
  port (
    ap_clk : in STD_LOGIC;
    ap_rst : in STD_LOGIC;
    stub_r_V : in STD_LOGIC_VECTOR ( 11 downto 0 );
    stub_phi_V : in STD_LOGIC_VECTOR ( 13 downto 0 );
    stub_z_V : in STD_LOGIC_VECTOR ( 13 downto 0 );
    track_qOverPt_V : out STD_LOGIC_VECTOR ( 17 downto 0 );
    track_phiT_V : out STD_LOGIC_VECTOR ( 17 downto 0 );
    track_cot_V : out STD_LOGIC_VECTOR ( 17 downto 0 );
    track_zT_V : out STD_LOGIC_VECTOR ( 17 downto 0 )
  );
  end component WorkerUpdateIP;
  
  
  
signal ap_clk_t : STD_LOGIC;
signal ap_rst_t : STD_LOGIC;

signal stub_phi_t : STD_LOGIC_VECTOR ( 13 downto 0 );
signal stub_r_t : STD_LOGIC_VECTOR ( 11 downto 0 );
signal stub_z_t : STD_LOGIC_VECTOR ( 13 downto 0 );
  
signal track_cot_t : std_logic_vector(17 downto 0) := (others => '0');
signal track_phiT_t : std_logic_vector(17 downto 0) := (others => '0');
signal track_qOverPt_t : std_logic_vector(17 downto 0) := (others => '0');
signal track_zT_t : std_logic_vector(17 downto 0) := (others => '0');


begin

ap_clk_t <= clk;
stub_phi_t <= std_logic_vector(stubin.phis);
stub_r_t <= std_logic_vector(stubin.r);
stub_z_t <= std_logic_vector(stubin.z);

track_cot_t <= std_logic_vector(trackOut.inv2R);
  
WorkerUpdateIP_0: component WorkerUpdateIP
     port map (
      ap_clk => ap_clk_t,
      ap_rst => '0',
      stub_phi_V(13 downto 0) => std_logic_vector(stubin.phis),
      stub_r_V(11 downto 0) => std_logic_vector(stubin.r),
      stub_z_V(13 downto 0) => std_logic_vector(stubin.z),
      track_cot_V(17 downto 0) =>  track_cot_t,
      track_phiT_V(17 downto 0) => track_phiT_t,
      track_qOverPt_V(17 downto 0) => track_qOverPt_t,
      track_zT_V(17 downto 0) => track_zT_t 
    );

END;
