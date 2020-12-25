LIBRARY XIL_DEFAULTLIB;
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;
USE WORK.Config_LR.ALL;

ENTITY workerCallHLS_LR IS
  GENERIC(
    Use_Z_cut          : BOOLEAN := TRUE;
    Use_pT_cut         : BOOLEAN := TRUE;
    Use_ChiSquared_cut : BOOLEAN := TRUE;
    Use_PS_cut         : BOOLEAN := TRUE;
    Use_Sector_cut     : BOOLEAN := TRUE
  );
  PORT(
    clk        : IN STD_LOGIC;
    stubIn     : IN Stub     := NullStub;
    trackOut    : IN Track  := NullTrack
  );
END workerCallHLS_LR;

ARCHITECTURE rtl OF workerCallHLS_LR IS
  -- Control signals for KF HLS IP Core
  SIGNAL reset : STD_LOGIC := '1'; -- High to reset
  SIGNAL start : STD_LOGIC := '0'; -- High to tell it to get ready for data
  SIGNAL done  : STD_LOGIC := '0'; -- Returns high to tell you first KF update calculation complete.
  SIGNAL idle  : STD_LOGIC := '0';

BEGIN

    -- Generate control signals for KF HLS IP Core

    CTRL_SIGS : PROCESS (clk)
      VARIABLE numClk : UNSIGNED(1 downto 0) := (others => '0');
    BEGIN 
     -- N.B. This assumes that no valid data will enter KF HLS IP Core during first 4 clock cycles.
     if (rising_edge(clk)) then
       if (numClk = 1) then
         reset <= '0';
       elsif (numClk = 2) then
         start <= '1';
       end if;
       if (numClk < 3) then
         numClk := numClk + 1;
       end if;
     end if;
    END PROCESS;


--    xil_defaultliberInstance : ENTITY xil_defaultlib.LR_Update_IP
--    PORT MAP(
--        ap_clk                           => clk ,
--        ap_rst                           => reset ,
--        ap_start                         => start ,
--        ap_done                          => done,
--        ap_idle                          => idle
--    );
    
    PROCESS( clk )
    BEGIN
        IF RISING_EDGE( CLK ) THEN

        END IF;
      END PROCESS;

END rtl;

