// ==============================================================
// RTL generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and OpenCL
// Version: 2020.1
// Copyright (C) 1986-2020 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

`timescale 1 ns / 1 ps 

module countLayersPS (
        ap_clk,
        ap_rst,
        stubs_0_layer_V_read,
        stubs_1_layer_V_read,
        stubs_2_layer_V_read,
        stubs_3_layer_V_read,
        stubs_4_layer_V_read,
        stubs_5_layer_V_read,
        stubs_6_layer_V_read,
        stubs_0_psModule_V_read,
        stubs_1_psModule_V_read,
        stubs_2_psModule_V_read,
        stubs_3_psModule_V_read,
        stubs_4_psModule_V_read,
        stubs_5_psModule_V_read,
        stubs_6_psModule_V_read,
        stubs_0_valid_V_read,
        stubs_1_valid_V_read,
        stubs_2_valid_V_read,
        stubs_3_valid_V_read,
        stubs_4_valid_V_read,
        stubs_5_valid_V_read,
        stubs_6_valid_V_read,
        ap_return,
        ap_ce
);


input   ap_clk;
input   ap_rst;
input  [2:0] stubs_0_layer_V_read;
input  [2:0] stubs_1_layer_V_read;
input  [2:0] stubs_2_layer_V_read;
input  [2:0] stubs_3_layer_V_read;
input  [2:0] stubs_4_layer_V_read;
input  [2:0] stubs_5_layer_V_read;
input  [2:0] stubs_6_layer_V_read;
input  [0:0] stubs_0_psModule_V_read;
input  [0:0] stubs_1_psModule_V_read;
input  [0:0] stubs_2_psModule_V_read;
input  [0:0] stubs_3_psModule_V_read;
input  [0:0] stubs_4_psModule_V_read;
input  [0:0] stubs_5_psModule_V_read;
input  [0:0] stubs_6_psModule_V_read;
input  [0:0] stubs_0_valid_V_read;
input  [0:0] stubs_1_valid_V_read;
input  [0:0] stubs_2_valid_V_read;
input  [0:0] stubs_3_valid_V_read;
input  [0:0] stubs_4_valid_V_read;
input  [0:0] stubs_5_valid_V_read;
input  [0:0] stubs_6_valid_V_read;
output  [2:0] ap_return;
input   ap_ce;

reg[2:0] ap_return;

wire   [0:0] or_ln321_5_fu_1516_p2;
reg   [0:0] or_ln321_5_reg_1873;
wire    ap_block_state1_pp0_stage0_iter0;
wire    ap_block_state2_pp0_stage0_iter1;
wire    ap_block_state3_pp0_stage0_iter2;
wire    ap_block_pp0_stage0_11001;
reg   [0:0] or_ln321_5_reg_1873_pp0_iter1_reg;
wire   [0:0] or_ln321_11_fu_1564_p2;
reg   [0:0] or_ln321_11_reg_1878;
wire   [0:0] or_ln321_17_fu_1612_p2;
reg   [0:0] or_ln321_17_reg_1883;
wire   [0:0] or_ln321_23_fu_1660_p2;
reg   [0:0] or_ln321_23_reg_1888;
wire   [1:0] select_ln110_1_fu_1812_p3;
reg   [1:0] select_ln110_1_reg_1893;
wire   [2:0] select_ln110_4_fu_1855_p3;
reg   [2:0] select_ln110_4_reg_1898;
wire    ap_block_pp0_stage0;
wire   [0:0] and_ln98_fu_190_p2;
wire   [0:0] icmp_ln321_fu_196_p2;
wire   [0:0] and_ln321_fu_202_p2;
wire   [0:0] icmp_ln321_1_fu_214_p2;
wire   [0:0] and_ln321_1_fu_220_p2;
wire   [0:0] icmp_ln321_2_fu_232_p2;
wire   [0:0] and_ln321_2_fu_238_p2;
wire   [0:0] icmp_ln321_3_fu_250_p2;
wire   [0:0] and_ln321_3_fu_256_p2;
wire   [0:0] icmp_ln321_4_fu_268_p2;
wire   [0:0] and_ln321_4_fu_274_p2;
wire   [0:0] icmp_ln321_5_fu_286_p2;
wire   [0:0] and_ln321_5_fu_292_p2;
wire   [0:0] xor_ln321_1_fu_226_p2;
wire   [0:0] xor_ln321_2_fu_244_p2;
wire   [0:0] and_ln321_6_fu_304_p2;
wire   [0:0] xor_ln321_fu_208_p2;
wire   [0:0] xor_ln321_4_fu_280_p2;
wire   [0:0] xor_ln321_5_fu_298_p2;
wire   [0:0] and_ln321_8_fu_316_p2;
wire   [0:0] xor_ln321_3_fu_262_p2;
wire   [0:0] and_ln321_9_fu_322_p2;
wire   [0:0] and_ln321_7_fu_310_p2;
wire   [0:0] and_ln321_11_fu_334_p2;
wire   [0:0] and_ln321_13_fu_346_p2;
wire   [0:0] and_ln321_15_fu_358_p2;
wire   [0:0] and_ln98_1_fu_382_p2;
wire   [0:0] icmp_ln321_6_fu_388_p2;
wire   [0:0] and_ln321_19_fu_394_p2;
wire   [0:0] icmp_ln321_7_fu_406_p2;
wire   [0:0] and_ln321_20_fu_412_p2;
wire   [0:0] icmp_ln321_8_fu_424_p2;
wire   [0:0] and_ln321_21_fu_430_p2;
wire   [0:0] icmp_ln321_9_fu_442_p2;
wire   [0:0] and_ln321_22_fu_448_p2;
wire   [0:0] icmp_ln321_10_fu_460_p2;
wire   [0:0] and_ln321_23_fu_466_p2;
wire   [0:0] icmp_ln321_11_fu_478_p2;
wire   [0:0] and_ln321_24_fu_484_p2;
wire   [0:0] xor_ln321_7_fu_418_p2;
wire   [0:0] xor_ln321_8_fu_436_p2;
wire   [0:0] and_ln321_25_fu_496_p2;
wire   [0:0] xor_ln321_6_fu_400_p2;
wire   [0:0] xor_ln321_10_fu_472_p2;
wire   [0:0] xor_ln321_11_fu_490_p2;
wire   [0:0] and_ln321_27_fu_508_p2;
wire   [0:0] xor_ln321_9_fu_454_p2;
wire   [0:0] and_ln321_28_fu_514_p2;
wire   [0:0] and_ln321_26_fu_502_p2;
wire   [0:0] and_ln321_30_fu_526_p2;
wire   [0:0] and_ln321_32_fu_538_p2;
wire   [0:0] and_ln321_34_fu_550_p2;
wire   [0:0] and_ln98_2_fu_574_p2;
wire   [0:0] icmp_ln321_12_fu_580_p2;
wire   [0:0] and_ln321_38_fu_586_p2;
wire   [0:0] icmp_ln321_13_fu_598_p2;
wire   [0:0] and_ln321_39_fu_604_p2;
wire   [0:0] icmp_ln321_14_fu_616_p2;
wire   [0:0] and_ln321_40_fu_622_p2;
wire   [0:0] icmp_ln321_15_fu_634_p2;
wire   [0:0] and_ln321_41_fu_640_p2;
wire   [0:0] icmp_ln321_16_fu_652_p2;
wire   [0:0] and_ln321_42_fu_658_p2;
wire   [0:0] icmp_ln321_17_fu_670_p2;
wire   [0:0] and_ln321_43_fu_676_p2;
wire   [0:0] xor_ln321_13_fu_610_p2;
wire   [0:0] xor_ln321_14_fu_628_p2;
wire   [0:0] and_ln321_44_fu_688_p2;
wire   [0:0] xor_ln321_12_fu_592_p2;
wire   [0:0] xor_ln321_16_fu_664_p2;
wire   [0:0] xor_ln321_17_fu_682_p2;
wire   [0:0] and_ln321_46_fu_700_p2;
wire   [0:0] xor_ln321_15_fu_646_p2;
wire   [0:0] and_ln321_47_fu_706_p2;
wire   [0:0] and_ln321_45_fu_694_p2;
wire   [0:0] and_ln321_49_fu_718_p2;
wire   [0:0] and_ln321_51_fu_730_p2;
wire   [0:0] and_ln321_53_fu_742_p2;
wire   [0:0] and_ln98_3_fu_766_p2;
wire   [0:0] icmp_ln321_18_fu_772_p2;
wire   [0:0] and_ln321_57_fu_778_p2;
wire   [0:0] icmp_ln321_19_fu_790_p2;
wire   [0:0] and_ln321_58_fu_796_p2;
wire   [0:0] icmp_ln321_20_fu_808_p2;
wire   [0:0] and_ln321_59_fu_814_p2;
wire   [0:0] icmp_ln321_21_fu_826_p2;
wire   [0:0] and_ln321_60_fu_832_p2;
wire   [0:0] icmp_ln321_22_fu_844_p2;
wire   [0:0] and_ln321_61_fu_850_p2;
wire   [0:0] icmp_ln321_23_fu_862_p2;
wire   [0:0] and_ln321_62_fu_868_p2;
wire   [0:0] xor_ln321_19_fu_802_p2;
wire   [0:0] xor_ln321_20_fu_820_p2;
wire   [0:0] and_ln321_63_fu_880_p2;
wire   [0:0] xor_ln321_18_fu_784_p2;
wire   [0:0] xor_ln321_22_fu_856_p2;
wire   [0:0] xor_ln321_23_fu_874_p2;
wire   [0:0] and_ln321_65_fu_892_p2;
wire   [0:0] xor_ln321_21_fu_838_p2;
wire   [0:0] and_ln321_66_fu_898_p2;
wire   [0:0] and_ln321_64_fu_886_p2;
wire   [0:0] and_ln321_68_fu_910_p2;
wire   [0:0] and_ln321_70_fu_922_p2;
wire   [0:0] and_ln321_72_fu_934_p2;
wire   [0:0] and_ln98_4_fu_958_p2;
wire   [0:0] icmp_ln321_24_fu_964_p2;
wire   [0:0] and_ln321_76_fu_970_p2;
wire   [0:0] icmp_ln321_25_fu_982_p2;
wire   [0:0] and_ln321_77_fu_988_p2;
wire   [0:0] icmp_ln321_26_fu_1000_p2;
wire   [0:0] and_ln321_78_fu_1006_p2;
wire   [0:0] icmp_ln321_27_fu_1018_p2;
wire   [0:0] and_ln321_79_fu_1024_p2;
wire   [0:0] icmp_ln321_28_fu_1036_p2;
wire   [0:0] and_ln321_80_fu_1042_p2;
wire   [0:0] icmp_ln321_29_fu_1054_p2;
wire   [0:0] and_ln321_81_fu_1060_p2;
wire   [0:0] xor_ln321_25_fu_994_p2;
wire   [0:0] xor_ln321_26_fu_1012_p2;
wire   [0:0] and_ln321_82_fu_1072_p2;
wire   [0:0] xor_ln321_24_fu_976_p2;
wire   [0:0] xor_ln321_28_fu_1048_p2;
wire   [0:0] xor_ln321_29_fu_1066_p2;
wire   [0:0] and_ln321_84_fu_1084_p2;
wire   [0:0] xor_ln321_27_fu_1030_p2;
wire   [0:0] and_ln321_85_fu_1090_p2;
wire   [0:0] and_ln321_83_fu_1078_p2;
wire   [0:0] and_ln321_87_fu_1102_p2;
wire   [0:0] and_ln321_89_fu_1114_p2;
wire   [0:0] and_ln321_91_fu_1126_p2;
wire   [0:0] and_ln98_5_fu_1150_p2;
wire   [0:0] icmp_ln321_30_fu_1156_p2;
wire   [0:0] and_ln321_95_fu_1162_p2;
wire   [0:0] icmp_ln321_31_fu_1174_p2;
wire   [0:0] and_ln321_96_fu_1180_p2;
wire   [0:0] icmp_ln321_32_fu_1192_p2;
wire   [0:0] and_ln321_97_fu_1198_p2;
wire   [0:0] icmp_ln321_33_fu_1210_p2;
wire   [0:0] and_ln321_98_fu_1216_p2;
wire   [0:0] icmp_ln321_34_fu_1228_p2;
wire   [0:0] and_ln321_99_fu_1234_p2;
wire   [0:0] icmp_ln321_35_fu_1246_p2;
wire   [0:0] and_ln321_100_fu_1252_p2;
wire   [0:0] xor_ln321_31_fu_1186_p2;
wire   [0:0] xor_ln321_32_fu_1204_p2;
wire   [0:0] and_ln321_101_fu_1264_p2;
wire   [0:0] xor_ln321_30_fu_1168_p2;
wire   [0:0] xor_ln321_34_fu_1240_p2;
wire   [0:0] xor_ln321_35_fu_1258_p2;
wire   [0:0] and_ln321_103_fu_1276_p2;
wire   [0:0] xor_ln321_33_fu_1222_p2;
wire   [0:0] and_ln321_104_fu_1282_p2;
wire   [0:0] and_ln321_102_fu_1270_p2;
wire   [0:0] and_ln321_106_fu_1294_p2;
wire   [0:0] and_ln321_108_fu_1306_p2;
wire   [0:0] and_ln321_110_fu_1318_p2;
wire   [0:0] and_ln98_6_fu_1342_p2;
wire   [0:0] icmp_ln321_36_fu_1348_p2;
wire   [0:0] and_ln321_114_fu_1354_p2;
wire   [0:0] icmp_ln321_37_fu_1366_p2;
wire   [0:0] and_ln321_115_fu_1372_p2;
wire   [0:0] icmp_ln321_38_fu_1384_p2;
wire   [0:0] and_ln321_116_fu_1390_p2;
wire   [0:0] icmp_ln321_39_fu_1402_p2;
wire   [0:0] and_ln321_117_fu_1408_p2;
wire   [0:0] icmp_ln321_40_fu_1420_p2;
wire   [0:0] and_ln321_118_fu_1426_p2;
wire   [0:0] icmp_ln321_41_fu_1438_p2;
wire   [0:0] and_ln321_119_fu_1444_p2;
wire   [0:0] xor_ln321_37_fu_1378_p2;
wire   [0:0] xor_ln321_38_fu_1396_p2;
wire   [0:0] and_ln321_120_fu_1456_p2;
wire   [0:0] xor_ln321_36_fu_1360_p2;
wire   [0:0] xor_ln321_40_fu_1432_p2;
wire   [0:0] xor_ln321_41_fu_1450_p2;
wire   [0:0] and_ln321_122_fu_1468_p2;
wire   [0:0] xor_ln321_39_fu_1414_p2;
wire   [0:0] and_ln321_123_fu_1474_p2;
wire   [0:0] and_ln321_121_fu_1462_p2;
wire   [0:0] and_ln321_29_fu_520_p2;
wire   [0:0] and_ln321_48_fu_712_p2;
wire   [0:0] or_ln321_fu_1486_p2;
wire   [0:0] and_ln321_10_fu_328_p2;
wire   [0:0] and_ln321_67_fu_904_p2;
wire   [0:0] and_ln321_86_fu_1096_p2;
wire   [0:0] and_ln321_105_fu_1288_p2;
wire   [0:0] and_ln321_124_fu_1480_p2;
wire   [0:0] or_ln321_3_fu_1504_p2;
wire   [0:0] or_ln321_2_fu_1498_p2;
wire   [0:0] or_ln321_4_fu_1510_p2;
wire   [0:0] or_ln321_1_fu_1492_p2;
wire   [0:0] and_ln321_125_fu_1522_p2;
wire   [0:0] and_ln321_31_fu_532_p2;
wire   [0:0] and_ln321_50_fu_724_p2;
wire   [0:0] or_ln321_6_fu_1534_p2;
wire   [0:0] and_ln321_12_fu_340_p2;
wire   [0:0] and_ln321_69_fu_916_p2;
wire   [0:0] and_ln321_88_fu_1108_p2;
wire   [0:0] and_ln321_107_fu_1300_p2;
wire   [0:0] and_ln321_126_fu_1528_p2;
wire   [0:0] or_ln321_9_fu_1552_p2;
wire   [0:0] or_ln321_8_fu_1546_p2;
wire   [0:0] or_ln321_10_fu_1558_p2;
wire   [0:0] or_ln321_7_fu_1540_p2;
wire   [0:0] and_ln321_127_fu_1570_p2;
wire   [0:0] and_ln321_33_fu_544_p2;
wire   [0:0] and_ln321_52_fu_736_p2;
wire   [0:0] or_ln321_12_fu_1582_p2;
wire   [0:0] and_ln321_14_fu_352_p2;
wire   [0:0] and_ln321_71_fu_928_p2;
wire   [0:0] and_ln321_90_fu_1120_p2;
wire   [0:0] and_ln321_109_fu_1312_p2;
wire   [0:0] and_ln321_128_fu_1576_p2;
wire   [0:0] or_ln321_15_fu_1600_p2;
wire   [0:0] or_ln321_14_fu_1594_p2;
wire   [0:0] or_ln321_16_fu_1606_p2;
wire   [0:0] or_ln321_13_fu_1588_p2;
wire   [0:0] and_ln321_129_fu_1618_p2;
wire   [0:0] and_ln321_35_fu_556_p2;
wire   [0:0] and_ln321_54_fu_748_p2;
wire   [0:0] or_ln321_18_fu_1630_p2;
wire   [0:0] and_ln321_16_fu_364_p2;
wire   [0:0] and_ln321_73_fu_940_p2;
wire   [0:0] and_ln321_92_fu_1132_p2;
wire   [0:0] and_ln321_111_fu_1324_p2;
wire   [0:0] and_ln321_130_fu_1624_p2;
wire   [0:0] or_ln321_21_fu_1648_p2;
wire   [0:0] or_ln321_20_fu_1642_p2;
wire   [0:0] or_ln321_22_fu_1654_p2;
wire   [0:0] or_ln321_19_fu_1636_p2;
wire   [0:0] and_ln321_36_fu_562_p2;
wire   [0:0] and_ln321_55_fu_754_p2;
wire   [0:0] or_ln321_24_fu_1672_p2;
wire   [0:0] and_ln321_17_fu_370_p2;
wire   [0:0] and_ln321_74_fu_946_p2;
wire   [0:0] and_ln321_93_fu_1138_p2;
wire   [0:0] and_ln321_112_fu_1330_p2;
wire   [0:0] and_ln321_131_fu_1666_p2;
wire   [0:0] or_ln321_27_fu_1690_p2;
wire   [0:0] or_ln321_26_fu_1684_p2;
wire   [0:0] or_ln321_28_fu_1696_p2;
wire   [0:0] or_ln321_25_fu_1678_p2;
wire   [0:0] and_ln321_37_fu_568_p2;
wire   [0:0] and_ln321_56_fu_760_p2;
wire   [0:0] or_ln321_30_fu_1714_p2;
wire   [0:0] and_ln321_18_fu_376_p2;
wire   [0:0] and_ln321_75_fu_952_p2;
wire   [0:0] and_ln321_94_fu_1144_p2;
wire   [0:0] and_ln321_113_fu_1336_p2;
wire   [0:0] and_ln321_132_fu_1708_p2;
wire   [0:0] or_ln321_33_fu_1732_p2;
wire   [0:0] or_ln321_32_fu_1726_p2;
wire   [0:0] or_ln321_34_fu_1738_p2;
wire   [0:0] or_ln321_31_fu_1720_p2;
wire   [0:0] or_ln321_36_fu_1750_p2;
wire   [0:0] or_ln321_39_fu_1768_p2;
wire   [0:0] or_ln321_38_fu_1762_p2;
wire   [0:0] or_ln321_40_fu_1774_p2;
wire   [0:0] or_ln321_37_fu_1756_p2;
wire   [0:0] or_ln321_41_fu_1780_p2;
wire   [0:0] or_ln321_35_fu_1744_p2;
wire   [1:0] select_ln700_fu_1790_p3;
wire   [1:0] zext_ln110_fu_1786_p1;
wire   [1:0] select_ln110_fu_1798_p3;
wire   [0:0] or_ln321_29_fu_1702_p2;
wire   [1:0] add_ln700_2_fu_1806_p2;
wire   [2:0] zext_ln110_1_fu_1820_p1;
wire   [2:0] add_ln700_3_fu_1823_p2;
wire   [2:0] select_ln110_2_fu_1829_p3;
wire   [2:0] add_ln700_4_fu_1836_p2;
wire   [2:0] select_ln110_3_fu_1842_p3;
wire   [2:0] add_ln700_5_fu_1849_p2;
wire   [2:0] add_ln700_6_fu_1862_p2;
wire   [2:0] select_ln110_5_fu_1867_p3;
reg    ap_ce_reg;
reg   [2:0] stubs_0_layer_V_read_int_reg;
reg   [2:0] stubs_1_layer_V_read_int_reg;
reg   [2:0] stubs_2_layer_V_read_int_reg;
reg   [2:0] stubs_3_layer_V_read_int_reg;
reg   [2:0] stubs_4_layer_V_read_int_reg;
reg   [2:0] stubs_5_layer_V_read_int_reg;
reg   [2:0] stubs_6_layer_V_read_int_reg;
reg   [0:0] stubs_0_psModule_V_read_int_reg;
reg   [0:0] stubs_1_psModule_V_read_int_reg;
reg   [0:0] stubs_2_psModule_V_read_int_reg;
reg   [0:0] stubs_3_psModule_V_read_int_reg;
reg   [0:0] stubs_4_psModule_V_read_int_reg;
reg   [0:0] stubs_5_psModule_V_read_int_reg;
reg   [0:0] stubs_6_psModule_V_read_int_reg;
reg   [0:0] stubs_0_valid_V_read_int_reg;
reg   [0:0] stubs_1_valid_V_read_int_reg;
reg   [0:0] stubs_2_valid_V_read_int_reg;
reg   [0:0] stubs_3_valid_V_read_int_reg;
reg   [0:0] stubs_4_valid_V_read_int_reg;
reg   [0:0] stubs_5_valid_V_read_int_reg;
reg   [0:0] stubs_6_valid_V_read_int_reg;
reg   [2:0] ap_return_int_reg;

always @ (posedge ap_clk) begin
    ap_ce_reg <= ap_ce;
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_ce_reg)) begin
        ap_return_int_reg <= select_ln110_5_fu_1867_p3;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_ce_reg))) begin
        or_ln321_11_reg_1878 <= or_ln321_11_fu_1564_p2;
        or_ln321_17_reg_1883 <= or_ln321_17_fu_1612_p2;
        or_ln321_23_reg_1888 <= or_ln321_23_fu_1660_p2;
        or_ln321_5_reg_1873 <= or_ln321_5_fu_1516_p2;
        or_ln321_5_reg_1873_pp0_iter1_reg <= or_ln321_5_reg_1873;
        select_ln110_1_reg_1893 <= select_ln110_1_fu_1812_p3;
        select_ln110_4_reg_1898 <= select_ln110_4_fu_1855_p3;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_ce)) begin
        stubs_0_layer_V_read_int_reg <= stubs_0_layer_V_read;
        stubs_0_psModule_V_read_int_reg <= stubs_0_psModule_V_read;
        stubs_0_valid_V_read_int_reg <= stubs_0_valid_V_read;
        stubs_1_layer_V_read_int_reg <= stubs_1_layer_V_read;
        stubs_1_psModule_V_read_int_reg <= stubs_1_psModule_V_read;
        stubs_1_valid_V_read_int_reg <= stubs_1_valid_V_read;
        stubs_2_layer_V_read_int_reg <= stubs_2_layer_V_read;
        stubs_2_psModule_V_read_int_reg <= stubs_2_psModule_V_read;
        stubs_2_valid_V_read_int_reg <= stubs_2_valid_V_read;
        stubs_3_layer_V_read_int_reg <= stubs_3_layer_V_read;
        stubs_3_psModule_V_read_int_reg <= stubs_3_psModule_V_read;
        stubs_3_valid_V_read_int_reg <= stubs_3_valid_V_read;
        stubs_4_layer_V_read_int_reg <= stubs_4_layer_V_read;
        stubs_4_psModule_V_read_int_reg <= stubs_4_psModule_V_read;
        stubs_4_valid_V_read_int_reg <= stubs_4_valid_V_read;
        stubs_5_layer_V_read_int_reg <= stubs_5_layer_V_read;
        stubs_5_psModule_V_read_int_reg <= stubs_5_psModule_V_read;
        stubs_5_valid_V_read_int_reg <= stubs_5_valid_V_read;
        stubs_6_layer_V_read_int_reg <= stubs_6_layer_V_read;
        stubs_6_psModule_V_read_int_reg <= stubs_6_psModule_V_read;
        stubs_6_valid_V_read_int_reg <= stubs_6_valid_V_read;
    end
end

always @ (*) begin
    if ((1'b0 == ap_ce_reg)) begin
        ap_return = ap_return_int_reg;
    end else if ((1'b1 == ap_ce_reg)) begin
        ap_return = select_ln110_5_fu_1867_p3;
    end
end

assign add_ln700_2_fu_1806_p2 = (select_ln110_fu_1798_p3 + 2'd1);

assign add_ln700_3_fu_1823_p2 = (zext_ln110_1_fu_1820_p1 + 3'd1);

assign add_ln700_4_fu_1836_p2 = (select_ln110_2_fu_1829_p3 + 3'd1);

assign add_ln700_5_fu_1849_p2 = (select_ln110_3_fu_1842_p3 + 3'd1);

assign add_ln700_6_fu_1862_p2 = (select_ln110_4_reg_1898 + 3'd1);

assign and_ln321_100_fu_1252_p2 = (icmp_ln321_35_fu_1246_p2 & and_ln98_5_fu_1150_p2);

assign and_ln321_101_fu_1264_p2 = (xor_ln321_32_fu_1204_p2 & xor_ln321_31_fu_1186_p2);

assign and_ln321_102_fu_1270_p2 = (xor_ln321_30_fu_1168_p2 & and_ln321_101_fu_1264_p2);

assign and_ln321_103_fu_1276_p2 = (xor_ln321_35_fu_1258_p2 & xor_ln321_34_fu_1240_p2);

assign and_ln321_104_fu_1282_p2 = (xor_ln321_33_fu_1222_p2 & and_ln321_103_fu_1276_p2);

assign and_ln321_105_fu_1288_p2 = (and_ln321_104_fu_1282_p2 & and_ln321_102_fu_1270_p2);

assign and_ln321_106_fu_1294_p2 = (and_ln321_95_fu_1162_p2 & and_ln321_101_fu_1264_p2);

assign and_ln321_107_fu_1300_p2 = (and_ln321_106_fu_1294_p2 & and_ln321_104_fu_1282_p2);

assign and_ln321_108_fu_1306_p2 = (xor_ln321_32_fu_1204_p2 & and_ln321_96_fu_1180_p2);

assign and_ln321_109_fu_1312_p2 = (and_ln321_108_fu_1306_p2 & and_ln321_104_fu_1282_p2);

assign and_ln321_10_fu_328_p2 = (and_ln321_9_fu_322_p2 & and_ln321_7_fu_310_p2);

assign and_ln321_110_fu_1318_p2 = (xor_ln321_33_fu_1222_p2 & and_ln321_97_fu_1198_p2);

assign and_ln321_111_fu_1324_p2 = (and_ln321_110_fu_1318_p2 & and_ln321_103_fu_1276_p2);

assign and_ln321_112_fu_1330_p2 = (and_ln321_98_fu_1216_p2 & and_ln321_103_fu_1276_p2);

assign and_ln321_113_fu_1336_p2 = (xor_ln321_35_fu_1258_p2 & and_ln321_99_fu_1234_p2);

assign and_ln321_114_fu_1354_p2 = (icmp_ln321_36_fu_1348_p2 & and_ln98_6_fu_1342_p2);

assign and_ln321_115_fu_1372_p2 = (icmp_ln321_37_fu_1366_p2 & and_ln98_6_fu_1342_p2);

assign and_ln321_116_fu_1390_p2 = (icmp_ln321_38_fu_1384_p2 & and_ln98_6_fu_1342_p2);

assign and_ln321_117_fu_1408_p2 = (icmp_ln321_39_fu_1402_p2 & and_ln98_6_fu_1342_p2);

assign and_ln321_118_fu_1426_p2 = (icmp_ln321_40_fu_1420_p2 & and_ln98_6_fu_1342_p2);

assign and_ln321_119_fu_1444_p2 = (icmp_ln321_41_fu_1438_p2 & and_ln98_6_fu_1342_p2);

assign and_ln321_11_fu_334_p2 = (and_ln321_fu_202_p2 & and_ln321_6_fu_304_p2);

assign and_ln321_120_fu_1456_p2 = (xor_ln321_38_fu_1396_p2 & xor_ln321_37_fu_1378_p2);

assign and_ln321_121_fu_1462_p2 = (xor_ln321_36_fu_1360_p2 & and_ln321_120_fu_1456_p2);

assign and_ln321_122_fu_1468_p2 = (xor_ln321_41_fu_1450_p2 & xor_ln321_40_fu_1432_p2);

assign and_ln321_123_fu_1474_p2 = (xor_ln321_39_fu_1414_p2 & and_ln321_122_fu_1468_p2);

assign and_ln321_124_fu_1480_p2 = (and_ln321_123_fu_1474_p2 & and_ln321_121_fu_1462_p2);

assign and_ln321_125_fu_1522_p2 = (and_ln321_120_fu_1456_p2 & and_ln321_114_fu_1354_p2);

assign and_ln321_126_fu_1528_p2 = (and_ln321_125_fu_1522_p2 & and_ln321_123_fu_1474_p2);

assign and_ln321_127_fu_1570_p2 = (xor_ln321_38_fu_1396_p2 & and_ln321_115_fu_1372_p2);

assign and_ln321_128_fu_1576_p2 = (and_ln321_127_fu_1570_p2 & and_ln321_123_fu_1474_p2);

assign and_ln321_129_fu_1618_p2 = (xor_ln321_39_fu_1414_p2 & and_ln321_116_fu_1390_p2);

assign and_ln321_12_fu_340_p2 = (and_ln321_9_fu_322_p2 & and_ln321_11_fu_334_p2);

assign and_ln321_130_fu_1624_p2 = (and_ln321_129_fu_1618_p2 & and_ln321_122_fu_1468_p2);

assign and_ln321_131_fu_1666_p2 = (and_ln321_122_fu_1468_p2 & and_ln321_117_fu_1408_p2);

assign and_ln321_132_fu_1708_p2 = (xor_ln321_41_fu_1450_p2 & and_ln321_118_fu_1426_p2);

assign and_ln321_13_fu_346_p2 = (xor_ln321_2_fu_244_p2 & and_ln321_1_fu_220_p2);

assign and_ln321_14_fu_352_p2 = (and_ln321_9_fu_322_p2 & and_ln321_13_fu_346_p2);

assign and_ln321_15_fu_358_p2 = (xor_ln321_3_fu_262_p2 & and_ln321_2_fu_238_p2);

assign and_ln321_16_fu_364_p2 = (and_ln321_8_fu_316_p2 & and_ln321_15_fu_358_p2);

assign and_ln321_17_fu_370_p2 = (and_ln321_8_fu_316_p2 & and_ln321_3_fu_256_p2);

assign and_ln321_18_fu_376_p2 = (xor_ln321_5_fu_298_p2 & and_ln321_4_fu_274_p2);

assign and_ln321_19_fu_394_p2 = (icmp_ln321_6_fu_388_p2 & and_ln98_1_fu_382_p2);

assign and_ln321_1_fu_220_p2 = (icmp_ln321_1_fu_214_p2 & and_ln98_fu_190_p2);

assign and_ln321_20_fu_412_p2 = (icmp_ln321_7_fu_406_p2 & and_ln98_1_fu_382_p2);

assign and_ln321_21_fu_430_p2 = (icmp_ln321_8_fu_424_p2 & and_ln98_1_fu_382_p2);

assign and_ln321_22_fu_448_p2 = (icmp_ln321_9_fu_442_p2 & and_ln98_1_fu_382_p2);

assign and_ln321_23_fu_466_p2 = (icmp_ln321_10_fu_460_p2 & and_ln98_1_fu_382_p2);

assign and_ln321_24_fu_484_p2 = (icmp_ln321_11_fu_478_p2 & and_ln98_1_fu_382_p2);

assign and_ln321_25_fu_496_p2 = (xor_ln321_8_fu_436_p2 & xor_ln321_7_fu_418_p2);

assign and_ln321_26_fu_502_p2 = (xor_ln321_6_fu_400_p2 & and_ln321_25_fu_496_p2);

assign and_ln321_27_fu_508_p2 = (xor_ln321_11_fu_490_p2 & xor_ln321_10_fu_472_p2);

assign and_ln321_28_fu_514_p2 = (xor_ln321_9_fu_454_p2 & and_ln321_27_fu_508_p2);

assign and_ln321_29_fu_520_p2 = (and_ln321_28_fu_514_p2 & and_ln321_26_fu_502_p2);

assign and_ln321_2_fu_238_p2 = (icmp_ln321_2_fu_232_p2 & and_ln98_fu_190_p2);

assign and_ln321_30_fu_526_p2 = (and_ln321_25_fu_496_p2 & and_ln321_19_fu_394_p2);

assign and_ln321_31_fu_532_p2 = (and_ln321_30_fu_526_p2 & and_ln321_28_fu_514_p2);

assign and_ln321_32_fu_538_p2 = (xor_ln321_8_fu_436_p2 & and_ln321_20_fu_412_p2);

assign and_ln321_33_fu_544_p2 = (and_ln321_32_fu_538_p2 & and_ln321_28_fu_514_p2);

assign and_ln321_34_fu_550_p2 = (xor_ln321_9_fu_454_p2 & and_ln321_21_fu_430_p2);

assign and_ln321_35_fu_556_p2 = (and_ln321_34_fu_550_p2 & and_ln321_27_fu_508_p2);

assign and_ln321_36_fu_562_p2 = (and_ln321_27_fu_508_p2 & and_ln321_22_fu_448_p2);

assign and_ln321_37_fu_568_p2 = (xor_ln321_11_fu_490_p2 & and_ln321_23_fu_466_p2);

assign and_ln321_38_fu_586_p2 = (icmp_ln321_12_fu_580_p2 & and_ln98_2_fu_574_p2);

assign and_ln321_39_fu_604_p2 = (icmp_ln321_13_fu_598_p2 & and_ln98_2_fu_574_p2);

assign and_ln321_3_fu_256_p2 = (icmp_ln321_3_fu_250_p2 & and_ln98_fu_190_p2);

assign and_ln321_40_fu_622_p2 = (icmp_ln321_14_fu_616_p2 & and_ln98_2_fu_574_p2);

assign and_ln321_41_fu_640_p2 = (icmp_ln321_15_fu_634_p2 & and_ln98_2_fu_574_p2);

assign and_ln321_42_fu_658_p2 = (icmp_ln321_16_fu_652_p2 & and_ln98_2_fu_574_p2);

assign and_ln321_43_fu_676_p2 = (icmp_ln321_17_fu_670_p2 & and_ln98_2_fu_574_p2);

assign and_ln321_44_fu_688_p2 = (xor_ln321_14_fu_628_p2 & xor_ln321_13_fu_610_p2);

assign and_ln321_45_fu_694_p2 = (xor_ln321_12_fu_592_p2 & and_ln321_44_fu_688_p2);

assign and_ln321_46_fu_700_p2 = (xor_ln321_17_fu_682_p2 & xor_ln321_16_fu_664_p2);

assign and_ln321_47_fu_706_p2 = (xor_ln321_15_fu_646_p2 & and_ln321_46_fu_700_p2);

assign and_ln321_48_fu_712_p2 = (and_ln321_47_fu_706_p2 & and_ln321_45_fu_694_p2);

assign and_ln321_49_fu_718_p2 = (and_ln321_44_fu_688_p2 & and_ln321_38_fu_586_p2);

assign and_ln321_4_fu_274_p2 = (icmp_ln321_4_fu_268_p2 & and_ln98_fu_190_p2);

assign and_ln321_50_fu_724_p2 = (and_ln321_49_fu_718_p2 & and_ln321_47_fu_706_p2);

assign and_ln321_51_fu_730_p2 = (xor_ln321_14_fu_628_p2 & and_ln321_39_fu_604_p2);

assign and_ln321_52_fu_736_p2 = (and_ln321_51_fu_730_p2 & and_ln321_47_fu_706_p2);

assign and_ln321_53_fu_742_p2 = (xor_ln321_15_fu_646_p2 & and_ln321_40_fu_622_p2);

assign and_ln321_54_fu_748_p2 = (and_ln321_53_fu_742_p2 & and_ln321_46_fu_700_p2);

assign and_ln321_55_fu_754_p2 = (and_ln321_46_fu_700_p2 & and_ln321_41_fu_640_p2);

assign and_ln321_56_fu_760_p2 = (xor_ln321_17_fu_682_p2 & and_ln321_42_fu_658_p2);

assign and_ln321_57_fu_778_p2 = (icmp_ln321_18_fu_772_p2 & and_ln98_3_fu_766_p2);

assign and_ln321_58_fu_796_p2 = (icmp_ln321_19_fu_790_p2 & and_ln98_3_fu_766_p2);

assign and_ln321_59_fu_814_p2 = (icmp_ln321_20_fu_808_p2 & and_ln98_3_fu_766_p2);

assign and_ln321_5_fu_292_p2 = (icmp_ln321_5_fu_286_p2 & and_ln98_fu_190_p2);

assign and_ln321_60_fu_832_p2 = (icmp_ln321_21_fu_826_p2 & and_ln98_3_fu_766_p2);

assign and_ln321_61_fu_850_p2 = (icmp_ln321_22_fu_844_p2 & and_ln98_3_fu_766_p2);

assign and_ln321_62_fu_868_p2 = (icmp_ln321_23_fu_862_p2 & and_ln98_3_fu_766_p2);

assign and_ln321_63_fu_880_p2 = (xor_ln321_20_fu_820_p2 & xor_ln321_19_fu_802_p2);

assign and_ln321_64_fu_886_p2 = (xor_ln321_18_fu_784_p2 & and_ln321_63_fu_880_p2);

assign and_ln321_65_fu_892_p2 = (xor_ln321_23_fu_874_p2 & xor_ln321_22_fu_856_p2);

assign and_ln321_66_fu_898_p2 = (xor_ln321_21_fu_838_p2 & and_ln321_65_fu_892_p2);

assign and_ln321_67_fu_904_p2 = (and_ln321_66_fu_898_p2 & and_ln321_64_fu_886_p2);

assign and_ln321_68_fu_910_p2 = (and_ln321_63_fu_880_p2 & and_ln321_57_fu_778_p2);

assign and_ln321_69_fu_916_p2 = (and_ln321_68_fu_910_p2 & and_ln321_66_fu_898_p2);

assign and_ln321_6_fu_304_p2 = (xor_ln321_2_fu_244_p2 & xor_ln321_1_fu_226_p2);

assign and_ln321_70_fu_922_p2 = (xor_ln321_20_fu_820_p2 & and_ln321_58_fu_796_p2);

assign and_ln321_71_fu_928_p2 = (and_ln321_70_fu_922_p2 & and_ln321_66_fu_898_p2);

assign and_ln321_72_fu_934_p2 = (xor_ln321_21_fu_838_p2 & and_ln321_59_fu_814_p2);

assign and_ln321_73_fu_940_p2 = (and_ln321_72_fu_934_p2 & and_ln321_65_fu_892_p2);

assign and_ln321_74_fu_946_p2 = (and_ln321_65_fu_892_p2 & and_ln321_60_fu_832_p2);

assign and_ln321_75_fu_952_p2 = (xor_ln321_23_fu_874_p2 & and_ln321_61_fu_850_p2);

assign and_ln321_76_fu_970_p2 = (icmp_ln321_24_fu_964_p2 & and_ln98_4_fu_958_p2);

assign and_ln321_77_fu_988_p2 = (icmp_ln321_25_fu_982_p2 & and_ln98_4_fu_958_p2);

assign and_ln321_78_fu_1006_p2 = (icmp_ln321_26_fu_1000_p2 & and_ln98_4_fu_958_p2);

assign and_ln321_79_fu_1024_p2 = (icmp_ln321_27_fu_1018_p2 & and_ln98_4_fu_958_p2);

assign and_ln321_7_fu_310_p2 = (xor_ln321_fu_208_p2 & and_ln321_6_fu_304_p2);

assign and_ln321_80_fu_1042_p2 = (icmp_ln321_28_fu_1036_p2 & and_ln98_4_fu_958_p2);

assign and_ln321_81_fu_1060_p2 = (icmp_ln321_29_fu_1054_p2 & and_ln98_4_fu_958_p2);

assign and_ln321_82_fu_1072_p2 = (xor_ln321_26_fu_1012_p2 & xor_ln321_25_fu_994_p2);

assign and_ln321_83_fu_1078_p2 = (xor_ln321_24_fu_976_p2 & and_ln321_82_fu_1072_p2);

assign and_ln321_84_fu_1084_p2 = (xor_ln321_29_fu_1066_p2 & xor_ln321_28_fu_1048_p2);

assign and_ln321_85_fu_1090_p2 = (xor_ln321_27_fu_1030_p2 & and_ln321_84_fu_1084_p2);

assign and_ln321_86_fu_1096_p2 = (and_ln321_85_fu_1090_p2 & and_ln321_83_fu_1078_p2);

assign and_ln321_87_fu_1102_p2 = (and_ln321_82_fu_1072_p2 & and_ln321_76_fu_970_p2);

assign and_ln321_88_fu_1108_p2 = (and_ln321_87_fu_1102_p2 & and_ln321_85_fu_1090_p2);

assign and_ln321_89_fu_1114_p2 = (xor_ln321_26_fu_1012_p2 & and_ln321_77_fu_988_p2);

assign and_ln321_8_fu_316_p2 = (xor_ln321_5_fu_298_p2 & xor_ln321_4_fu_280_p2);

assign and_ln321_90_fu_1120_p2 = (and_ln321_89_fu_1114_p2 & and_ln321_85_fu_1090_p2);

assign and_ln321_91_fu_1126_p2 = (xor_ln321_27_fu_1030_p2 & and_ln321_78_fu_1006_p2);

assign and_ln321_92_fu_1132_p2 = (and_ln321_91_fu_1126_p2 & and_ln321_84_fu_1084_p2);

assign and_ln321_93_fu_1138_p2 = (and_ln321_84_fu_1084_p2 & and_ln321_79_fu_1024_p2);

assign and_ln321_94_fu_1144_p2 = (xor_ln321_29_fu_1066_p2 & and_ln321_80_fu_1042_p2);

assign and_ln321_95_fu_1162_p2 = (icmp_ln321_30_fu_1156_p2 & and_ln98_5_fu_1150_p2);

assign and_ln321_96_fu_1180_p2 = (icmp_ln321_31_fu_1174_p2 & and_ln98_5_fu_1150_p2);

assign and_ln321_97_fu_1198_p2 = (icmp_ln321_32_fu_1192_p2 & and_ln98_5_fu_1150_p2);

assign and_ln321_98_fu_1216_p2 = (icmp_ln321_33_fu_1210_p2 & and_ln98_5_fu_1150_p2);

assign and_ln321_99_fu_1234_p2 = (icmp_ln321_34_fu_1228_p2 & and_ln98_5_fu_1150_p2);

assign and_ln321_9_fu_322_p2 = (xor_ln321_3_fu_262_p2 & and_ln321_8_fu_316_p2);

assign and_ln321_fu_202_p2 = (icmp_ln321_fu_196_p2 & and_ln98_fu_190_p2);

assign and_ln98_1_fu_382_p2 = (stubs_1_valid_V_read_int_reg & stubs_1_psModule_V_read_int_reg);

assign and_ln98_2_fu_574_p2 = (stubs_2_valid_V_read_int_reg & stubs_2_psModule_V_read_int_reg);

assign and_ln98_3_fu_766_p2 = (stubs_3_valid_V_read_int_reg & stubs_3_psModule_V_read_int_reg);

assign and_ln98_4_fu_958_p2 = (stubs_4_valid_V_read_int_reg & stubs_4_psModule_V_read_int_reg);

assign and_ln98_5_fu_1150_p2 = (stubs_5_valid_V_read_int_reg & stubs_5_psModule_V_read_int_reg);

assign and_ln98_6_fu_1342_p2 = (stubs_6_valid_V_read_int_reg & stubs_6_psModule_V_read_int_reg);

assign and_ln98_fu_190_p2 = (stubs_0_valid_V_read_int_reg & stubs_0_psModule_V_read_int_reg);

assign ap_block_pp0_stage0 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage0_11001 = ~(1'b1 == 1'b1);

assign ap_block_state1_pp0_stage0_iter0 = ~(1'b1 == 1'b1);

assign ap_block_state2_pp0_stage0_iter1 = ~(1'b1 == 1'b1);

assign ap_block_state3_pp0_stage0_iter2 = ~(1'b1 == 1'b1);

assign icmp_ln321_10_fu_460_p2 = ((stubs_1_layer_V_read_int_reg == 3'd1) ? 1'b1 : 1'b0);

assign icmp_ln321_11_fu_478_p2 = ((stubs_1_layer_V_read_int_reg == 3'd0) ? 1'b1 : 1'b0);

assign icmp_ln321_12_fu_580_p2 = ((stubs_2_layer_V_read_int_reg == 3'd5) ? 1'b1 : 1'b0);

assign icmp_ln321_13_fu_598_p2 = ((stubs_2_layer_V_read_int_reg == 3'd4) ? 1'b1 : 1'b0);

assign icmp_ln321_14_fu_616_p2 = ((stubs_2_layer_V_read_int_reg == 3'd3) ? 1'b1 : 1'b0);

assign icmp_ln321_15_fu_634_p2 = ((stubs_2_layer_V_read_int_reg == 3'd2) ? 1'b1 : 1'b0);

assign icmp_ln321_16_fu_652_p2 = ((stubs_2_layer_V_read_int_reg == 3'd1) ? 1'b1 : 1'b0);

assign icmp_ln321_17_fu_670_p2 = ((stubs_2_layer_V_read_int_reg == 3'd0) ? 1'b1 : 1'b0);

assign icmp_ln321_18_fu_772_p2 = ((stubs_3_layer_V_read_int_reg == 3'd5) ? 1'b1 : 1'b0);

assign icmp_ln321_19_fu_790_p2 = ((stubs_3_layer_V_read_int_reg == 3'd4) ? 1'b1 : 1'b0);

assign icmp_ln321_1_fu_214_p2 = ((stubs_0_layer_V_read_int_reg == 3'd4) ? 1'b1 : 1'b0);

assign icmp_ln321_20_fu_808_p2 = ((stubs_3_layer_V_read_int_reg == 3'd3) ? 1'b1 : 1'b0);

assign icmp_ln321_21_fu_826_p2 = ((stubs_3_layer_V_read_int_reg == 3'd2) ? 1'b1 : 1'b0);

assign icmp_ln321_22_fu_844_p2 = ((stubs_3_layer_V_read_int_reg == 3'd1) ? 1'b1 : 1'b0);

assign icmp_ln321_23_fu_862_p2 = ((stubs_3_layer_V_read_int_reg == 3'd0) ? 1'b1 : 1'b0);

assign icmp_ln321_24_fu_964_p2 = ((stubs_4_layer_V_read_int_reg == 3'd5) ? 1'b1 : 1'b0);

assign icmp_ln321_25_fu_982_p2 = ((stubs_4_layer_V_read_int_reg == 3'd4) ? 1'b1 : 1'b0);

assign icmp_ln321_26_fu_1000_p2 = ((stubs_4_layer_V_read_int_reg == 3'd3) ? 1'b1 : 1'b0);

assign icmp_ln321_27_fu_1018_p2 = ((stubs_4_layer_V_read_int_reg == 3'd2) ? 1'b1 : 1'b0);

assign icmp_ln321_28_fu_1036_p2 = ((stubs_4_layer_V_read_int_reg == 3'd1) ? 1'b1 : 1'b0);

assign icmp_ln321_29_fu_1054_p2 = ((stubs_4_layer_V_read_int_reg == 3'd0) ? 1'b1 : 1'b0);

assign icmp_ln321_2_fu_232_p2 = ((stubs_0_layer_V_read_int_reg == 3'd3) ? 1'b1 : 1'b0);

assign icmp_ln321_30_fu_1156_p2 = ((stubs_5_layer_V_read_int_reg == 3'd5) ? 1'b1 : 1'b0);

assign icmp_ln321_31_fu_1174_p2 = ((stubs_5_layer_V_read_int_reg == 3'd4) ? 1'b1 : 1'b0);

assign icmp_ln321_32_fu_1192_p2 = ((stubs_5_layer_V_read_int_reg == 3'd3) ? 1'b1 : 1'b0);

assign icmp_ln321_33_fu_1210_p2 = ((stubs_5_layer_V_read_int_reg == 3'd2) ? 1'b1 : 1'b0);

assign icmp_ln321_34_fu_1228_p2 = ((stubs_5_layer_V_read_int_reg == 3'd1) ? 1'b1 : 1'b0);

assign icmp_ln321_35_fu_1246_p2 = ((stubs_5_layer_V_read_int_reg == 3'd0) ? 1'b1 : 1'b0);

assign icmp_ln321_36_fu_1348_p2 = ((stubs_6_layer_V_read_int_reg == 3'd5) ? 1'b1 : 1'b0);

assign icmp_ln321_37_fu_1366_p2 = ((stubs_6_layer_V_read_int_reg == 3'd4) ? 1'b1 : 1'b0);

assign icmp_ln321_38_fu_1384_p2 = ((stubs_6_layer_V_read_int_reg == 3'd3) ? 1'b1 : 1'b0);

assign icmp_ln321_39_fu_1402_p2 = ((stubs_6_layer_V_read_int_reg == 3'd2) ? 1'b1 : 1'b0);

assign icmp_ln321_3_fu_250_p2 = ((stubs_0_layer_V_read_int_reg == 3'd2) ? 1'b1 : 1'b0);

assign icmp_ln321_40_fu_1420_p2 = ((stubs_6_layer_V_read_int_reg == 3'd1) ? 1'b1 : 1'b0);

assign icmp_ln321_41_fu_1438_p2 = ((stubs_6_layer_V_read_int_reg == 3'd0) ? 1'b1 : 1'b0);

assign icmp_ln321_4_fu_268_p2 = ((stubs_0_layer_V_read_int_reg == 3'd1) ? 1'b1 : 1'b0);

assign icmp_ln321_5_fu_286_p2 = ((stubs_0_layer_V_read_int_reg == 3'd0) ? 1'b1 : 1'b0);

assign icmp_ln321_6_fu_388_p2 = ((stubs_1_layer_V_read_int_reg == 3'd5) ? 1'b1 : 1'b0);

assign icmp_ln321_7_fu_406_p2 = ((stubs_1_layer_V_read_int_reg == 3'd4) ? 1'b1 : 1'b0);

assign icmp_ln321_8_fu_424_p2 = ((stubs_1_layer_V_read_int_reg == 3'd3) ? 1'b1 : 1'b0);

assign icmp_ln321_9_fu_442_p2 = ((stubs_1_layer_V_read_int_reg == 3'd2) ? 1'b1 : 1'b0);

assign icmp_ln321_fu_196_p2 = ((stubs_0_layer_V_read_int_reg == 3'd5) ? 1'b1 : 1'b0);

assign or_ln321_10_fu_1558_p2 = (or_ln321_9_fu_1552_p2 | or_ln321_8_fu_1546_p2);

assign or_ln321_11_fu_1564_p2 = (or_ln321_7_fu_1540_p2 | or_ln321_10_fu_1558_p2);

assign or_ln321_12_fu_1582_p2 = (and_ln321_52_fu_736_p2 | and_ln321_33_fu_544_p2);

assign or_ln321_13_fu_1588_p2 = (or_ln321_12_fu_1582_p2 | and_ln321_14_fu_352_p2);

assign or_ln321_14_fu_1594_p2 = (and_ln321_90_fu_1120_p2 | and_ln321_71_fu_928_p2);

assign or_ln321_15_fu_1600_p2 = (and_ln321_128_fu_1576_p2 | and_ln321_109_fu_1312_p2);

assign or_ln321_16_fu_1606_p2 = (or_ln321_15_fu_1600_p2 | or_ln321_14_fu_1594_p2);

assign or_ln321_17_fu_1612_p2 = (or_ln321_16_fu_1606_p2 | or_ln321_13_fu_1588_p2);

assign or_ln321_18_fu_1630_p2 = (and_ln321_54_fu_748_p2 | and_ln321_35_fu_556_p2);

assign or_ln321_19_fu_1636_p2 = (or_ln321_18_fu_1630_p2 | and_ln321_16_fu_364_p2);

assign or_ln321_1_fu_1492_p2 = (or_ln321_fu_1486_p2 | and_ln321_10_fu_328_p2);

assign or_ln321_20_fu_1642_p2 = (and_ln321_92_fu_1132_p2 | and_ln321_73_fu_940_p2);

assign or_ln321_21_fu_1648_p2 = (and_ln321_130_fu_1624_p2 | and_ln321_111_fu_1324_p2);

assign or_ln321_22_fu_1654_p2 = (or_ln321_21_fu_1648_p2 | or_ln321_20_fu_1642_p2);

assign or_ln321_23_fu_1660_p2 = (or_ln321_22_fu_1654_p2 | or_ln321_19_fu_1636_p2);

assign or_ln321_24_fu_1672_p2 = (and_ln321_55_fu_754_p2 | and_ln321_36_fu_562_p2);

assign or_ln321_25_fu_1678_p2 = (or_ln321_24_fu_1672_p2 | and_ln321_17_fu_370_p2);

assign or_ln321_26_fu_1684_p2 = (and_ln321_93_fu_1138_p2 | and_ln321_74_fu_946_p2);

assign or_ln321_27_fu_1690_p2 = (and_ln321_131_fu_1666_p2 | and_ln321_112_fu_1330_p2);

assign or_ln321_28_fu_1696_p2 = (or_ln321_27_fu_1690_p2 | or_ln321_26_fu_1684_p2);

assign or_ln321_29_fu_1702_p2 = (or_ln321_28_fu_1696_p2 | or_ln321_25_fu_1678_p2);

assign or_ln321_2_fu_1498_p2 = (and_ln321_86_fu_1096_p2 | and_ln321_67_fu_904_p2);

assign or_ln321_30_fu_1714_p2 = (and_ln321_56_fu_760_p2 | and_ln321_37_fu_568_p2);

assign or_ln321_31_fu_1720_p2 = (or_ln321_30_fu_1714_p2 | and_ln321_18_fu_376_p2);

assign or_ln321_32_fu_1726_p2 = (and_ln321_94_fu_1144_p2 | and_ln321_75_fu_952_p2);

assign or_ln321_33_fu_1732_p2 = (and_ln321_132_fu_1708_p2 | and_ln321_113_fu_1336_p2);

assign or_ln321_34_fu_1738_p2 = (or_ln321_33_fu_1732_p2 | or_ln321_32_fu_1726_p2);

assign or_ln321_35_fu_1744_p2 = (or_ln321_34_fu_1738_p2 | or_ln321_31_fu_1720_p2);

assign or_ln321_36_fu_1750_p2 = (and_ln321_62_fu_868_p2 | and_ln321_100_fu_1252_p2);

assign or_ln321_37_fu_1756_p2 = (or_ln321_36_fu_1750_p2 | and_ln321_81_fu_1060_p2);

assign or_ln321_38_fu_1762_p2 = (and_ln321_43_fu_676_p2 | and_ln321_24_fu_484_p2);

assign or_ln321_39_fu_1768_p2 = (and_ln321_5_fu_292_p2 | and_ln321_119_fu_1444_p2);

assign or_ln321_3_fu_1504_p2 = (and_ln321_124_fu_1480_p2 | and_ln321_105_fu_1288_p2);

assign or_ln321_40_fu_1774_p2 = (or_ln321_39_fu_1768_p2 | or_ln321_38_fu_1762_p2);

assign or_ln321_41_fu_1780_p2 = (or_ln321_40_fu_1774_p2 | or_ln321_37_fu_1756_p2);

assign or_ln321_4_fu_1510_p2 = (or_ln321_3_fu_1504_p2 | or_ln321_2_fu_1498_p2);

assign or_ln321_5_fu_1516_p2 = (or_ln321_4_fu_1510_p2 | or_ln321_1_fu_1492_p2);

assign or_ln321_6_fu_1534_p2 = (and_ln321_50_fu_724_p2 | and_ln321_31_fu_532_p2);

assign or_ln321_7_fu_1540_p2 = (or_ln321_6_fu_1534_p2 | and_ln321_12_fu_340_p2);

assign or_ln321_8_fu_1546_p2 = (and_ln321_88_fu_1108_p2 | and_ln321_69_fu_916_p2);

assign or_ln321_9_fu_1552_p2 = (and_ln321_126_fu_1528_p2 | and_ln321_107_fu_1300_p2);

assign or_ln321_fu_1486_p2 = (and_ln321_48_fu_712_p2 | and_ln321_29_fu_520_p2);

assign select_ln110_1_fu_1812_p3 = ((or_ln321_29_fu_1702_p2[0:0] === 1'b1) ? add_ln700_2_fu_1806_p2 : select_ln110_fu_1798_p3);

assign select_ln110_2_fu_1829_p3 = ((or_ln321_23_reg_1888[0:0] === 1'b1) ? add_ln700_3_fu_1823_p2 : zext_ln110_1_fu_1820_p1);

assign select_ln110_3_fu_1842_p3 = ((or_ln321_17_reg_1883[0:0] === 1'b1) ? add_ln700_4_fu_1836_p2 : select_ln110_2_fu_1829_p3);

assign select_ln110_4_fu_1855_p3 = ((or_ln321_11_reg_1878[0:0] === 1'b1) ? add_ln700_5_fu_1849_p2 : select_ln110_3_fu_1842_p3);

assign select_ln110_5_fu_1867_p3 = ((or_ln321_5_reg_1873_pp0_iter1_reg[0:0] === 1'b1) ? add_ln700_6_fu_1862_p2 : select_ln110_4_reg_1898);

assign select_ln110_fu_1798_p3 = ((or_ln321_35_fu_1744_p2[0:0] === 1'b1) ? select_ln700_fu_1790_p3 : zext_ln110_fu_1786_p1);

assign select_ln700_fu_1790_p3 = ((or_ln321_41_fu_1780_p2[0:0] === 1'b1) ? 2'd2 : 2'd1);

assign xor_ln321_10_fu_472_p2 = (1'd1 ^ and_ln321_23_fu_466_p2);

assign xor_ln321_11_fu_490_p2 = (1'd1 ^ and_ln321_24_fu_484_p2);

assign xor_ln321_12_fu_592_p2 = (and_ln98_2_fu_574_p2 ^ and_ln321_38_fu_586_p2);

assign xor_ln321_13_fu_610_p2 = (1'd1 ^ and_ln321_39_fu_604_p2);

assign xor_ln321_14_fu_628_p2 = (1'd1 ^ and_ln321_40_fu_622_p2);

assign xor_ln321_15_fu_646_p2 = (1'd1 ^ and_ln321_41_fu_640_p2);

assign xor_ln321_16_fu_664_p2 = (1'd1 ^ and_ln321_42_fu_658_p2);

assign xor_ln321_17_fu_682_p2 = (1'd1 ^ and_ln321_43_fu_676_p2);

assign xor_ln321_18_fu_784_p2 = (and_ln98_3_fu_766_p2 ^ and_ln321_57_fu_778_p2);

assign xor_ln321_19_fu_802_p2 = (1'd1 ^ and_ln321_58_fu_796_p2);

assign xor_ln321_1_fu_226_p2 = (1'd1 ^ and_ln321_1_fu_220_p2);

assign xor_ln321_20_fu_820_p2 = (1'd1 ^ and_ln321_59_fu_814_p2);

assign xor_ln321_21_fu_838_p2 = (1'd1 ^ and_ln321_60_fu_832_p2);

assign xor_ln321_22_fu_856_p2 = (1'd1 ^ and_ln321_61_fu_850_p2);

assign xor_ln321_23_fu_874_p2 = (1'd1 ^ and_ln321_62_fu_868_p2);

assign xor_ln321_24_fu_976_p2 = (and_ln98_4_fu_958_p2 ^ and_ln321_76_fu_970_p2);

assign xor_ln321_25_fu_994_p2 = (1'd1 ^ and_ln321_77_fu_988_p2);

assign xor_ln321_26_fu_1012_p2 = (1'd1 ^ and_ln321_78_fu_1006_p2);

assign xor_ln321_27_fu_1030_p2 = (1'd1 ^ and_ln321_79_fu_1024_p2);

assign xor_ln321_28_fu_1048_p2 = (1'd1 ^ and_ln321_80_fu_1042_p2);

assign xor_ln321_29_fu_1066_p2 = (1'd1 ^ and_ln321_81_fu_1060_p2);

assign xor_ln321_2_fu_244_p2 = (1'd1 ^ and_ln321_2_fu_238_p2);

assign xor_ln321_30_fu_1168_p2 = (and_ln98_5_fu_1150_p2 ^ and_ln321_95_fu_1162_p2);

assign xor_ln321_31_fu_1186_p2 = (1'd1 ^ and_ln321_96_fu_1180_p2);

assign xor_ln321_32_fu_1204_p2 = (1'd1 ^ and_ln321_97_fu_1198_p2);

assign xor_ln321_33_fu_1222_p2 = (1'd1 ^ and_ln321_98_fu_1216_p2);

assign xor_ln321_34_fu_1240_p2 = (1'd1 ^ and_ln321_99_fu_1234_p2);

assign xor_ln321_35_fu_1258_p2 = (1'd1 ^ and_ln321_100_fu_1252_p2);

assign xor_ln321_36_fu_1360_p2 = (and_ln98_6_fu_1342_p2 ^ and_ln321_114_fu_1354_p2);

assign xor_ln321_37_fu_1378_p2 = (1'd1 ^ and_ln321_115_fu_1372_p2);

assign xor_ln321_38_fu_1396_p2 = (1'd1 ^ and_ln321_116_fu_1390_p2);

assign xor_ln321_39_fu_1414_p2 = (1'd1 ^ and_ln321_117_fu_1408_p2);

assign xor_ln321_3_fu_262_p2 = (1'd1 ^ and_ln321_3_fu_256_p2);

assign xor_ln321_40_fu_1432_p2 = (1'd1 ^ and_ln321_118_fu_1426_p2);

assign xor_ln321_41_fu_1450_p2 = (1'd1 ^ and_ln321_119_fu_1444_p2);

assign xor_ln321_4_fu_280_p2 = (1'd1 ^ and_ln321_4_fu_274_p2);

assign xor_ln321_5_fu_298_p2 = (1'd1 ^ and_ln321_5_fu_292_p2);

assign xor_ln321_6_fu_400_p2 = (and_ln98_1_fu_382_p2 ^ and_ln321_19_fu_394_p2);

assign xor_ln321_7_fu_418_p2 = (1'd1 ^ and_ln321_20_fu_412_p2);

assign xor_ln321_8_fu_436_p2 = (1'd1 ^ and_ln321_21_fu_430_p2);

assign xor_ln321_9_fu_454_p2 = (1'd1 ^ and_ln321_22_fu_448_p2);

assign xor_ln321_fu_208_p2 = (and_ln98_fu_190_p2 ^ and_ln321_fu_202_p2);

assign zext_ln110_1_fu_1820_p1 = select_ln110_1_reg_1893;

assign zext_ln110_fu_1786_p1 = or_ln321_41_fu_1780_p2;

endmodule //countLayersPS
