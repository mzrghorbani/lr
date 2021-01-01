library ieee;
use ieee.std_logic_1164.all;
use ieee.math_real.all;
use ieee.numeric_std.all;
use work.emp_data_types.all;
use work.emp_device_decl.all;
use work.tools.all;
use work.config.all;


package LR_Config_pkg is

constant LR_Workers: natural := 16;

constant inputLinkMap: integers( 0 to LR_Workers - 1 ) := ( 0,2,4,6,8,10,12,14,16,18,20,22,24,26,28,30 );
constant outputLinkMap: integers( 0 to  2 * LR_Workers - 1 ) := ( 0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31 );
function inputLinkMapping( l: ldata ) return ldata;
function outputLinkMapping( l: ldata ) return ldata;

-- accumulation period is TmPeriod * EventCounterOffset + ClockCounterOffset
-- 360 MHz
constant TmPeriod              : unsigned( 7 downto 0 ) := to_unsigned ( 161 , 8 );  -- TM / readout cycle period (= TM period minus 1. Why?)
-- 320 MHz (= Apollo)
-- constant TmPeriod              : unsigned( 7 downto 0 ) := to_unsigned ( 143 , 8 ); 

constant ClockCounterOffset    : unsigned( 7 downto 0 ) := to_unsigned ( 31  , 8 );  -- #clock cycles offset to convert assoc to DR state (suggest set to >= HLS latency + 10)
constant EventCounterOffset    : unsigned( 2 downto 0 ) := to_unsigned ( 2   , 3 );  -- accumulation period in readout cycles (can't exceed numEventsRed - 1) -- use 2 or 3 with input load-balancing.

-- max #stubs considered by KF per layer per HT track.
constant MaxStubsPerLayer  : natural  := 4;  -- If increase above 4, must redimension AddressBookRam first.
constant widthMaxStubsPerLayer : natural := width( MaxStubsPerLayer );

-- max #stubs HT track must have to be defined "hard"
constant MaxStubsEasy          : natural  := 10; -- If reduced, some tracks have wrong z0?

-- max allowed skipped layers on easy/hard tracks.
constant MaxSkipLayersEasy     : natural  := 2;
constant MaxSkipLayersHard     : natural  := 1;

-- min/max stubs required to output final fitted track.
constant MinStubsPerTrack      : natural  := 4;
constant MaxStubsPerTrack      : natural  := 4;  

-- debug prinout to xml for at most this many clks.
constant PrintNumClks          : natural  := 9999;

constant numTracks   : natural := 32;  -- max. number of HT tracks per TMP (compare TM*(360MHz/40MHz)/(5 stubs) = 32)
constant numEventsRed   : natural := 4;  -- Dimensions of arrays used to store data from different event IDs. (Power of 2 that is >= EventCounterOffset)
constant numEvents      : natural := 2*numEventsRed; -- No. of event IDs used to distinguish interleaved events.
constant widthTracks    : natural := width( numTracks );
constant widthEvents    : natural := width( numEvents );
constant widthEventsRed : natural := width( numEventsRed );

-- Bits used internally by KF to represent helix params & cov. matrix.
constant widthHELIX : integer := 18; 
constant widthCOV   : integer := 20;
-- Bits used in HLS (KFstate.h) for fraction part of helix params after decimal point.
constant BFH0 : integer := widthHELIX - 3;  -- Inv2R
constant BFH1 : integer := widthHELIX - 15; -- phi0
constant BFH2 : integer := widthHELIX - 5;  -- tanL
constant BFH3 : integer := widthHELIX - 11; -- z0

constant widthInv2R : natural := 15;
constant widthPhi0  : natural := 12;
constant widthTanL  : natural := 16;
constant widthZ0    : natural := 12;

-- FIX: Move to L1TF config?
-- Granularity of stub base relative to HT cell size, expressed as relative number of bits.
-- (baseDiffPhi0 = 7, baseDiffInvR = -4).
constant baseInv2R : REAL := basePhi/baseR;
constant baseDiffPhi0  : integer := integer(round(log2(neededRangeC/real(houghNbinsPhi)/basePhi))); -- number returned by log2 will be integer aside from numerical inaccuracy.
constant baseDiffInv2R : integer := integer(round(log2(neededRangeM/real(houghNbinsPt)/baseInv2R)));

end package LR_Config_pkg;



package body LR_Config_pkg is

function inputLinkMapping( l: ldata ) return ldata is
    variable r: ldata( LR_Workers - 1 downto 0 ) := ( others => LWORD_NULL );
begin
    for k in LR_Workers - 1 downto 0 loop
        r( k ) := l( inputLinkMap( k ) );
    end loop;
    return r;
end function;

function outputLinkMapping( l: ldata ) return ldata is
    variable r: ldata( 4 * N_REGION - 1 downto 0 ) := ( others => LWORD_NULL );
begin
    for k in 2 * LR_Workers - 1 downto 0 loop
        r( outputLinkMap( k ) ) := l( k );
    end loop;
    return r;
end function;

end package body LR_Config_pkg;

