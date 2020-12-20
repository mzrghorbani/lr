-- top_decl

-- Defines constants for the whole device

-- Dave Newbold , June 2014

LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

USE work.emp_framework_decl.ALL;
USE work.emp_device_types.ALL;

PACKAGE emp_project_decl IS

  CONSTANT PAYLOAD_REV         : STD_LOGIC_VECTOR( 31 DOWNTO 0 ) := X"10010039";

  CONSTANT LHC_BUNCH_COUNT     : INTEGER                         := 3564;
  CONSTANT LB_ADDR_WIDTH       : INTEGER                         := 10;
-- N.B. CLOCK_COMMON_RATIO must be multiple of CLOCK_RATIO.
-- Give 320 MHz algo clock for Apollo (40MHz*8). 
--  CONSTANT CLOCK_RATIO         : INTEGER                         := 8;
--  CONSTANT CLOCK_COMMON_RATIO  : INTEGER                         := 24;
-- Give 360 MHz algo clock (40MHz*9)
  CONSTANT CLOCK_RATIO         : INTEGER                         := 9;
  CONSTANT CLOCK_COMMON_RATIO  : INTEGER                         := 36;
  CONSTANT CLOCK_AUX_RATIO     : clock_ratio_array_t             := ( 2 , 4 , 6 );
  CONSTANT PAYLOAD_LATENCY     : INTEGER                         := 2;

-- mgt -> chk -> buf -> fmt -> ( algo ) -> ( fmt ) -> buf -> chk -> mgt

-- For old EMP version (0.2.5), arrays below had two additional elements -1, -1.

  CONSTANT REGION_CONF         : region_conf_array_t             := (
    0  => (no_mgt, no_chk, buf, no_fmt, buf, no_chk, no_mgt), 
    1  => (no_mgt, no_chk, buf, no_fmt, buf, no_chk, no_mgt),
    2  => (no_mgt, no_chk, buf, no_fmt, buf, no_chk, no_mgt),
    3  => (no_mgt, no_chk, buf, no_fmt, buf, no_chk, no_mgt),
    4  => (no_mgt, no_chk, buf, no_fmt, buf, no_chk, no_mgt),
    5  => (no_mgt, no_chk, buf, no_fmt, buf, no_chk, no_mgt),
    6  => (no_mgt, no_chk, buf, no_fmt, buf, no_chk, no_mgt),
    7  => (no_mgt, no_chk, buf, no_fmt, buf, no_chk, no_mgt),
    8  => (no_mgt, no_chk, buf, no_fmt, buf, no_chk, no_mgt),
    ---- Cross-chip
    9  => (no_mgt, no_chk, no_buf, no_fmt, no_buf, no_chk, no_mgt),
    10 => (no_mgt, no_chk, no_buf, no_fmt, no_buf, no_chk, no_mgt),
    11 => (no_mgt, no_chk, no_buf, no_fmt, no_buf, no_chk, no_mgt),
    12 => (no_mgt, no_chk, no_buf, no_fmt, no_buf, no_chk, no_mgt),
    13 => (no_mgt, no_chk, no_buf, no_fmt, no_buf, no_chk, no_mgt),
    14 => (no_mgt, no_chk, no_buf, no_fmt, no_buf, no_chk, no_mgt),
    15 => (no_mgt, no_chk, no_buf, no_fmt, no_buf, no_chk, no_mgt),
    16 => (no_mgt, no_chk, no_buf, no_fmt, no_buf, no_chk, no_mgt),
    17 => (no_mgt, no_chk, no_buf, no_fmt, no_buf, no_chk, no_mgt),

    others => kDummyRegion
  );

END emp_project_decl;
