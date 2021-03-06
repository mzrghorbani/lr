// ==============================================================
// RTL generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and OpenCL
// Version: 2020.1
// Copyright (C) 1986-2020 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

`timescale 1 ns / 1 ps 

module countLayersAll (
        ap_clk,
        ap_rst,
        stubs_0_layer_V_read,
        stubs_1_layer_V_read,
        stubs_2_layer_V_read,
        stubs_3_layer_V_read,
        stubs_0_valid_V_read,
        stubs_1_valid_V_read,
        stubs_2_valid_V_read,
        stubs_3_valid_V_read,
        ap_return,
        ap_ce
);


input   ap_clk;
input   ap_rst;
input  [2:0] stubs_0_layer_V_read;
input  [2:0] stubs_1_layer_V_read;
input  [2:0] stubs_2_layer_V_read;
input  [2:0] stubs_3_layer_V_read;
input  [0:0] stubs_0_valid_V_read;
input  [0:0] stubs_1_valid_V_read;
input  [0:0] stubs_2_valid_V_read;
input  [0:0] stubs_3_valid_V_read;
output  [2:0] ap_return;
input   ap_ce;

reg[2:0] ap_return;

wire   [0:0] or_ln321_fu_770_p2;
reg   [0:0] or_ln321_reg_1040;
wire    ap_block_state1_pp0_stage0_iter0;
wire    ap_block_state2_pp0_stage0_iter1;
wire    ap_block_state3_pp0_stage0_iter2;
wire    ap_block_pp0_stage0_11001;
reg   [0:0] or_ln321_reg_1040_pp0_iter1_reg;
wire   [0:0] or_ln321_21_fu_776_p2;
reg   [0:0] or_ln321_21_reg_1045;
reg   [0:0] or_ln321_21_reg_1045_pp0_iter1_reg;
wire   [0:0] or_ln321_23_fu_800_p2;
reg   [0:0] or_ln321_23_reg_1050;
wire   [0:0] or_ln321_24_fu_806_p2;
reg   [0:0] or_ln321_24_reg_1055;
wire   [0:0] or_ln321_28_fu_842_p2;
reg   [0:0] or_ln321_28_reg_1060;
wire   [0:0] or_ln321_29_fu_860_p2;
reg   [0:0] or_ln321_29_reg_1065;
wire   [0:0] or_ln321_30_fu_866_p2;
reg   [0:0] or_ln321_30_reg_1070;
wire   [1:0] select_ln113_1_fu_964_p3;
reg   [1:0] select_ln113_1_reg_1075;
wire   [2:0] select_ln113_4_fu_1016_p3;
reg   [2:0] select_ln113_4_reg_1080;
wire    ap_block_pp0_stage0;
wire   [0:0] icmp_ln321_24_fu_92_p2;
wire   [0:0] icmp_ln321_25_fu_104_p2;
wire   [0:0] and_ln321_76_fu_110_p2;
wire   [0:0] icmp_ln321_26_fu_122_p2;
wire   [0:0] and_ln321_77_fu_128_p2;
wire   [0:0] icmp_ln321_27_fu_140_p2;
wire   [0:0] and_ln321_78_fu_146_p2;
wire   [0:0] icmp_ln321_28_fu_158_p2;
wire   [0:0] and_ln321_79_fu_164_p2;
wire   [0:0] and_ln321_fu_98_p2;
wire   [0:0] xor_ln321_27_fu_176_p2;
wire   [0:0] icmp_ln321_fu_86_p2;
wire   [0:0] xor_ln321_fu_116_p2;
wire   [0:0] xor_ln321_24_fu_134_p2;
wire   [0:0] xor_ln321_25_fu_152_p2;
wire   [0:0] xor_ln321_26_fu_170_p2;
wire   [0:0] and_ln321_82_fu_194_p2;
wire   [0:0] and_ln321_81_fu_188_p2;
wire   [0:0] and_ln321_83_fu_200_p2;
wire   [0:0] and_ln321_80_fu_182_p2;
wire   [0:0] icmp_ln321_29_fu_212_p2;
wire   [0:0] and_ln321_85_fu_218_p2;
wire   [0:0] and_ln321_88_fu_236_p2;
wire   [0:0] and_ln321_87_fu_230_p2;
wire   [0:0] and_ln321_90_fu_248_p2;
wire   [0:0] icmp_ln321_31_fu_278_p2;
wire   [0:0] icmp_ln321_32_fu_290_p2;
wire   [0:0] and_ln321_95_fu_296_p2;
wire   [0:0] icmp_ln321_33_fu_308_p2;
wire   [0:0] and_ln321_96_fu_314_p2;
wire   [0:0] icmp_ln321_34_fu_326_p2;
wire   [0:0] and_ln321_97_fu_332_p2;
wire   [0:0] icmp_ln321_35_fu_344_p2;
wire   [0:0] and_ln321_98_fu_350_p2;
wire   [0:0] and_ln321_94_fu_284_p2;
wire   [0:0] xor_ln321_32_fu_362_p2;
wire   [0:0] icmp_ln321_30_fu_272_p2;
wire   [0:0] xor_ln321_28_fu_302_p2;
wire   [0:0] xor_ln321_29_fu_320_p2;
wire   [0:0] xor_ln321_30_fu_338_p2;
wire   [0:0] xor_ln321_31_fu_356_p2;
wire   [0:0] and_ln321_101_fu_380_p2;
wire   [0:0] and_ln321_100_fu_374_p2;
wire   [0:0] and_ln321_102_fu_386_p2;
wire   [0:0] and_ln321_99_fu_368_p2;
wire   [0:0] icmp_ln321_36_fu_398_p2;
wire   [0:0] and_ln321_104_fu_404_p2;
wire   [0:0] and_ln321_107_fu_422_p2;
wire   [0:0] and_ln321_106_fu_416_p2;
wire   [0:0] and_ln321_109_fu_434_p2;
wire   [0:0] icmp_ln321_38_fu_464_p2;
wire   [0:0] icmp_ln321_39_fu_476_p2;
wire   [0:0] and_ln321_114_fu_482_p2;
wire   [0:0] icmp_ln321_40_fu_494_p2;
wire   [0:0] and_ln321_115_fu_500_p2;
wire   [0:0] icmp_ln321_41_fu_512_p2;
wire   [0:0] and_ln321_116_fu_518_p2;
wire   [0:0] icmp_ln321_42_fu_530_p2;
wire   [0:0] and_ln321_117_fu_536_p2;
wire   [0:0] and_ln321_113_fu_470_p2;
wire   [0:0] xor_ln321_37_fu_548_p2;
wire   [0:0] icmp_ln321_37_fu_458_p2;
wire   [0:0] xor_ln321_33_fu_488_p2;
wire   [0:0] xor_ln321_34_fu_506_p2;
wire   [0:0] xor_ln321_35_fu_524_p2;
wire   [0:0] xor_ln321_36_fu_542_p2;
wire   [0:0] and_ln321_120_fu_566_p2;
wire   [0:0] and_ln321_119_fu_560_p2;
wire   [0:0] and_ln321_121_fu_572_p2;
wire   [0:0] and_ln321_118_fu_554_p2;
wire   [0:0] icmp_ln321_43_fu_584_p2;
wire   [0:0] and_ln321_123_fu_590_p2;
wire   [0:0] and_ln321_126_fu_608_p2;
wire   [0:0] and_ln321_125_fu_602_p2;
wire   [0:0] and_ln321_128_fu_620_p2;
wire   [0:0] icmp_ln321_45_fu_650_p2;
wire   [0:0] icmp_ln321_46_fu_662_p2;
wire   [0:0] and_ln321_133_fu_668_p2;
wire   [0:0] icmp_ln321_47_fu_680_p2;
wire   [0:0] and_ln321_134_fu_686_p2;
wire   [0:0] icmp_ln321_48_fu_698_p2;
wire   [0:0] and_ln321_135_fu_704_p2;
wire   [0:0] icmp_ln321_49_fu_716_p2;
wire   [0:0] and_ln321_136_fu_722_p2;
wire   [0:0] and_ln321_132_fu_656_p2;
wire   [0:0] xor_ln321_42_fu_734_p2;
wire   [0:0] icmp_ln321_44_fu_644_p2;
wire   [0:0] xor_ln321_38_fu_674_p2;
wire   [0:0] xor_ln321_39_fu_692_p2;
wire   [0:0] xor_ln321_40_fu_710_p2;
wire   [0:0] xor_ln321_41_fu_728_p2;
wire   [0:0] and_ln321_139_fu_752_p2;
wire   [0:0] and_ln321_138_fu_746_p2;
wire   [0:0] and_ln321_140_fu_758_p2;
wire   [0:0] and_ln321_137_fu_740_p2;
wire   [0:0] and_ln321_84_fu_206_p2;
wire   [0:0] and_ln321_103_fu_392_p2;
wire   [0:0] and_ln321_122_fu_578_p2;
wire   [0:0] and_ln321_141_fu_764_p2;
wire   [0:0] icmp_ln321_50_fu_782_p2;
wire   [0:0] and_ln321_142_fu_788_p2;
wire   [0:0] and_ln321_86_fu_224_p2;
wire   [0:0] and_ln321_105_fu_410_p2;
wire   [0:0] and_ln321_124_fu_596_p2;
wire   [0:0] and_ln321_143_fu_794_p2;
wire   [0:0] and_ln321_145_fu_818_p2;
wire   [0:0] and_ln321_144_fu_812_p2;
wire   [0:0] and_ln321_89_fu_242_p2;
wire   [0:0] and_ln321_108_fu_428_p2;
wire   [0:0] and_ln321_127_fu_614_p2;
wire   [0:0] and_ln321_146_fu_824_p2;
wire   [0:0] or_ln321_27_fu_836_p2;
wire   [0:0] or_ln321_26_fu_830_p2;
wire   [0:0] and_ln321_147_fu_848_p2;
wire   [0:0] and_ln321_91_fu_254_p2;
wire   [0:0] and_ln321_110_fu_440_p2;
wire   [0:0] and_ln321_129_fu_626_p2;
wire   [0:0] and_ln321_148_fu_854_p2;
wire   [0:0] and_ln321_92_fu_260_p2;
wire   [0:0] and_ln321_111_fu_446_p2;
wire   [0:0] and_ln321_130_fu_632_p2;
wire   [0:0] and_ln321_149_fu_872_p2;
wire   [0:0] or_ln321_33_fu_884_p2;
wire   [0:0] or_ln321_32_fu_878_p2;
wire   [0:0] and_ln321_93_fu_266_p2;
wire   [0:0] and_ln321_112_fu_452_p2;
wire   [0:0] and_ln321_131_fu_638_p2;
wire   [0:0] and_ln321_150_fu_896_p2;
wire   [0:0] or_ln321_36_fu_908_p2;
wire   [0:0] or_ln321_35_fu_902_p2;
wire   [0:0] or_ln321_39_fu_926_p2;
wire   [0:0] or_ln321_38_fu_920_p2;
wire   [0:0] or_ln321_40_fu_932_p2;
wire   [0:0] or_ln321_37_fu_914_p2;
wire   [1:0] select_ln700_fu_942_p3;
wire   [1:0] zext_ln113_fu_938_p1;
wire   [1:0] select_ln113_fu_950_p3;
wire   [0:0] or_ln321_34_fu_890_p2;
wire   [1:0] add_ln700_2_fu_958_p2;
wire   [2:0] zext_ln113_1_fu_980_p1;
wire   [0:0] or_ln321_31_fu_976_p2;
wire   [2:0] add_ln700_3_fu_983_p2;
wire   [2:0] select_ln113_2_fu_989_p3;
wire   [2:0] add_ln700_4_fu_997_p2;
wire   [2:0] select_ln113_3_fu_1003_p3;
wire   [0:0] or_ln321_25_fu_972_p2;
wire   [2:0] add_ln700_5_fu_1010_p2;
wire   [0:0] or_ln321_22_fu_1024_p2;
wire   [2:0] add_ln700_fu_1028_p2;
wire   [2:0] select_ln113_5_fu_1033_p3;
reg    ap_ce_reg;
reg   [2:0] stubs_0_layer_V_read_int_reg;
reg   [2:0] stubs_1_layer_V_read_int_reg;
reg   [2:0] stubs_2_layer_V_read_int_reg;
reg   [2:0] stubs_3_layer_V_read_int_reg;
reg   [0:0] stubs_0_valid_V_read_int_reg;
reg   [0:0] stubs_1_valid_V_read_int_reg;
reg   [0:0] stubs_2_valid_V_read_int_reg;
reg   [0:0] stubs_3_valid_V_read_int_reg;
reg   [2:0] ap_return_int_reg;

always @ (posedge ap_clk) begin
    ap_ce_reg <= ap_ce;
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_ce_reg)) begin
        ap_return_int_reg <= select_ln113_5_fu_1033_p3;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_ce_reg) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        or_ln321_21_reg_1045 <= or_ln321_21_fu_776_p2;
        or_ln321_21_reg_1045_pp0_iter1_reg <= or_ln321_21_reg_1045;
        or_ln321_23_reg_1050 <= or_ln321_23_fu_800_p2;
        or_ln321_24_reg_1055 <= or_ln321_24_fu_806_p2;
        or_ln321_28_reg_1060 <= or_ln321_28_fu_842_p2;
        or_ln321_29_reg_1065 <= or_ln321_29_fu_860_p2;
        or_ln321_30_reg_1070 <= or_ln321_30_fu_866_p2;
        or_ln321_reg_1040 <= or_ln321_fu_770_p2;
        or_ln321_reg_1040_pp0_iter1_reg <= or_ln321_reg_1040;
        select_ln113_1_reg_1075 <= select_ln113_1_fu_964_p3;
        select_ln113_4_reg_1080 <= select_ln113_4_fu_1016_p3;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_ce)) begin
        stubs_0_layer_V_read_int_reg <= stubs_0_layer_V_read;
        stubs_0_valid_V_read_int_reg <= stubs_0_valid_V_read;
        stubs_1_layer_V_read_int_reg <= stubs_1_layer_V_read;
        stubs_1_valid_V_read_int_reg <= stubs_1_valid_V_read;
        stubs_2_layer_V_read_int_reg <= stubs_2_layer_V_read;
        stubs_2_valid_V_read_int_reg <= stubs_2_valid_V_read;
        stubs_3_layer_V_read_int_reg <= stubs_3_layer_V_read;
        stubs_3_valid_V_read_int_reg <= stubs_3_valid_V_read;
    end
end

always @ (*) begin
    if ((1'b0 == ap_ce_reg)) begin
        ap_return = ap_return_int_reg;
    end else if ((1'b1 == ap_ce_reg)) begin
        ap_return = select_ln113_5_fu_1033_p3;
    end
end

assign add_ln700_2_fu_958_p2 = (select_ln113_fu_950_p3 + 2'd1);

assign add_ln700_3_fu_983_p2 = (zext_ln113_1_fu_980_p1 + 3'd1);

assign add_ln700_4_fu_997_p2 = (select_ln113_2_fu_989_p3 + 3'd1);

assign add_ln700_5_fu_1010_p2 = (select_ln113_3_fu_1003_p3 + 3'd1);

assign add_ln700_fu_1028_p2 = (select_ln113_4_reg_1080 + 3'd1);

assign and_ln321_100_fu_374_p2 = (xor_ln321_29_fu_320_p2 & xor_ln321_28_fu_302_p2);

assign and_ln321_101_fu_380_p2 = (xor_ln321_31_fu_356_p2 & xor_ln321_30_fu_338_p2);

assign and_ln321_102_fu_386_p2 = (and_ln321_101_fu_380_p2 & and_ln321_100_fu_374_p2);

assign and_ln321_103_fu_392_p2 = (and_ln321_99_fu_368_p2 & and_ln321_102_fu_386_p2);

assign and_ln321_104_fu_404_p2 = (xor_ln321_32_fu_362_p2 & icmp_ln321_36_fu_398_p2);

assign and_ln321_105_fu_410_p2 = (and_ln321_104_fu_404_p2 & and_ln321_102_fu_386_p2);

assign and_ln321_106_fu_416_p2 = (xor_ln321_28_fu_302_p2 & and_ln321_94_fu_284_p2);

assign and_ln321_107_fu_422_p2 = (xor_ln321_29_fu_320_p2 & and_ln321_101_fu_380_p2);

assign and_ln321_108_fu_428_p2 = (and_ln321_107_fu_422_p2 & and_ln321_106_fu_416_p2);

assign and_ln321_109_fu_434_p2 = (xor_ln321_29_fu_320_p2 & and_ln321_95_fu_296_p2);

assign and_ln321_110_fu_440_p2 = (and_ln321_109_fu_434_p2 & and_ln321_101_fu_380_p2);

assign and_ln321_111_fu_446_p2 = (and_ln321_96_fu_314_p2 & and_ln321_101_fu_380_p2);

assign and_ln321_112_fu_452_p2 = (xor_ln321_31_fu_356_p2 & and_ln321_97_fu_332_p2);

assign and_ln321_113_fu_470_p2 = (stubs_2_valid_V_read_int_reg & icmp_ln321_38_fu_464_p2);

assign and_ln321_114_fu_482_p2 = (stubs_2_valid_V_read_int_reg & icmp_ln321_39_fu_476_p2);

assign and_ln321_115_fu_500_p2 = (stubs_2_valid_V_read_int_reg & icmp_ln321_40_fu_494_p2);

assign and_ln321_116_fu_518_p2 = (stubs_2_valid_V_read_int_reg & icmp_ln321_41_fu_512_p2);

assign and_ln321_117_fu_536_p2 = (stubs_2_valid_V_read_int_reg & icmp_ln321_42_fu_530_p2);

assign and_ln321_118_fu_554_p2 = (xor_ln321_37_fu_548_p2 & icmp_ln321_37_fu_458_p2);

assign and_ln321_119_fu_560_p2 = (xor_ln321_34_fu_506_p2 & xor_ln321_33_fu_488_p2);

assign and_ln321_120_fu_566_p2 = (xor_ln321_36_fu_542_p2 & xor_ln321_35_fu_524_p2);

assign and_ln321_121_fu_572_p2 = (and_ln321_120_fu_566_p2 & and_ln321_119_fu_560_p2);

assign and_ln321_122_fu_578_p2 = (and_ln321_121_fu_572_p2 & and_ln321_118_fu_554_p2);

assign and_ln321_123_fu_590_p2 = (xor_ln321_37_fu_548_p2 & icmp_ln321_43_fu_584_p2);

assign and_ln321_124_fu_596_p2 = (and_ln321_123_fu_590_p2 & and_ln321_121_fu_572_p2);

assign and_ln321_125_fu_602_p2 = (xor_ln321_33_fu_488_p2 & and_ln321_113_fu_470_p2);

assign and_ln321_126_fu_608_p2 = (xor_ln321_34_fu_506_p2 & and_ln321_120_fu_566_p2);

assign and_ln321_127_fu_614_p2 = (and_ln321_126_fu_608_p2 & and_ln321_125_fu_602_p2);

assign and_ln321_128_fu_620_p2 = (xor_ln321_34_fu_506_p2 & and_ln321_114_fu_482_p2);

assign and_ln321_129_fu_626_p2 = (and_ln321_128_fu_620_p2 & and_ln321_120_fu_566_p2);

assign and_ln321_130_fu_632_p2 = (and_ln321_120_fu_566_p2 & and_ln321_115_fu_500_p2);

assign and_ln321_131_fu_638_p2 = (xor_ln321_36_fu_542_p2 & and_ln321_116_fu_518_p2);

assign and_ln321_132_fu_656_p2 = (stubs_3_valid_V_read_int_reg & icmp_ln321_45_fu_650_p2);

assign and_ln321_133_fu_668_p2 = (stubs_3_valid_V_read_int_reg & icmp_ln321_46_fu_662_p2);

assign and_ln321_134_fu_686_p2 = (stubs_3_valid_V_read_int_reg & icmp_ln321_47_fu_680_p2);

assign and_ln321_135_fu_704_p2 = (stubs_3_valid_V_read_int_reg & icmp_ln321_48_fu_698_p2);

assign and_ln321_136_fu_722_p2 = (stubs_3_valid_V_read_int_reg & icmp_ln321_49_fu_716_p2);

assign and_ln321_137_fu_740_p2 = (xor_ln321_42_fu_734_p2 & icmp_ln321_44_fu_644_p2);

assign and_ln321_138_fu_746_p2 = (xor_ln321_39_fu_692_p2 & xor_ln321_38_fu_674_p2);

assign and_ln321_139_fu_752_p2 = (xor_ln321_41_fu_728_p2 & xor_ln321_40_fu_710_p2);

assign and_ln321_140_fu_758_p2 = (and_ln321_139_fu_752_p2 & and_ln321_138_fu_746_p2);

assign and_ln321_141_fu_764_p2 = (and_ln321_140_fu_758_p2 & and_ln321_137_fu_740_p2);

assign and_ln321_142_fu_788_p2 = (xor_ln321_42_fu_734_p2 & icmp_ln321_50_fu_782_p2);

assign and_ln321_143_fu_794_p2 = (and_ln321_142_fu_788_p2 & and_ln321_140_fu_758_p2);

assign and_ln321_144_fu_812_p2 = (xor_ln321_38_fu_674_p2 & and_ln321_132_fu_656_p2);

assign and_ln321_145_fu_818_p2 = (xor_ln321_39_fu_692_p2 & and_ln321_139_fu_752_p2);

assign and_ln321_146_fu_824_p2 = (and_ln321_145_fu_818_p2 & and_ln321_144_fu_812_p2);

assign and_ln321_147_fu_848_p2 = (xor_ln321_39_fu_692_p2 & and_ln321_133_fu_668_p2);

assign and_ln321_148_fu_854_p2 = (and_ln321_147_fu_848_p2 & and_ln321_139_fu_752_p2);

assign and_ln321_149_fu_872_p2 = (and_ln321_139_fu_752_p2 & and_ln321_134_fu_686_p2);

assign and_ln321_150_fu_896_p2 = (xor_ln321_41_fu_728_p2 & and_ln321_135_fu_704_p2);

assign and_ln321_76_fu_110_p2 = (stubs_0_valid_V_read_int_reg & icmp_ln321_25_fu_104_p2);

assign and_ln321_77_fu_128_p2 = (stubs_0_valid_V_read_int_reg & icmp_ln321_26_fu_122_p2);

assign and_ln321_78_fu_146_p2 = (stubs_0_valid_V_read_int_reg & icmp_ln321_27_fu_140_p2);

assign and_ln321_79_fu_164_p2 = (stubs_0_valid_V_read_int_reg & icmp_ln321_28_fu_158_p2);

assign and_ln321_80_fu_182_p2 = (xor_ln321_27_fu_176_p2 & icmp_ln321_fu_86_p2);

assign and_ln321_81_fu_188_p2 = (xor_ln321_fu_116_p2 & xor_ln321_24_fu_134_p2);

assign and_ln321_82_fu_194_p2 = (xor_ln321_26_fu_170_p2 & xor_ln321_25_fu_152_p2);

assign and_ln321_83_fu_200_p2 = (and_ln321_82_fu_194_p2 & and_ln321_81_fu_188_p2);

assign and_ln321_84_fu_206_p2 = (and_ln321_83_fu_200_p2 & and_ln321_80_fu_182_p2);

assign and_ln321_85_fu_218_p2 = (xor_ln321_27_fu_176_p2 & icmp_ln321_29_fu_212_p2);

assign and_ln321_86_fu_224_p2 = (and_ln321_85_fu_218_p2 & and_ln321_83_fu_200_p2);

assign and_ln321_87_fu_230_p2 = (xor_ln321_fu_116_p2 & and_ln321_fu_98_p2);

assign and_ln321_88_fu_236_p2 = (xor_ln321_24_fu_134_p2 & and_ln321_82_fu_194_p2);

assign and_ln321_89_fu_242_p2 = (and_ln321_88_fu_236_p2 & and_ln321_87_fu_230_p2);

assign and_ln321_90_fu_248_p2 = (xor_ln321_24_fu_134_p2 & and_ln321_76_fu_110_p2);

assign and_ln321_91_fu_254_p2 = (and_ln321_90_fu_248_p2 & and_ln321_82_fu_194_p2);

assign and_ln321_92_fu_260_p2 = (and_ln321_82_fu_194_p2 & and_ln321_77_fu_128_p2);

assign and_ln321_93_fu_266_p2 = (xor_ln321_26_fu_170_p2 & and_ln321_78_fu_146_p2);

assign and_ln321_94_fu_284_p2 = (stubs_1_valid_V_read_int_reg & icmp_ln321_31_fu_278_p2);

assign and_ln321_95_fu_296_p2 = (stubs_1_valid_V_read_int_reg & icmp_ln321_32_fu_290_p2);

assign and_ln321_96_fu_314_p2 = (stubs_1_valid_V_read_int_reg & icmp_ln321_33_fu_308_p2);

assign and_ln321_97_fu_332_p2 = (stubs_1_valid_V_read_int_reg & icmp_ln321_34_fu_326_p2);

assign and_ln321_98_fu_350_p2 = (stubs_1_valid_V_read_int_reg & icmp_ln321_35_fu_344_p2);

assign and_ln321_99_fu_368_p2 = (xor_ln321_32_fu_362_p2 & icmp_ln321_30_fu_272_p2);

assign and_ln321_fu_98_p2 = (stubs_0_valid_V_read_int_reg & icmp_ln321_24_fu_92_p2);

assign ap_block_pp0_stage0 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage0_11001 = ~(1'b1 == 1'b1);

assign ap_block_state1_pp0_stage0_iter0 = ~(1'b1 == 1'b1);

assign ap_block_state2_pp0_stage0_iter1 = ~(1'b1 == 1'b1);

assign ap_block_state3_pp0_stage0_iter2 = ~(1'b1 == 1'b1);

assign icmp_ln321_24_fu_92_p2 = ((stubs_0_layer_V_read_int_reg == 3'd4) ? 1'b1 : 1'b0);

assign icmp_ln321_25_fu_104_p2 = ((stubs_0_layer_V_read_int_reg == 3'd3) ? 1'b1 : 1'b0);

assign icmp_ln321_26_fu_122_p2 = ((stubs_0_layer_V_read_int_reg == 3'd2) ? 1'b1 : 1'b0);

assign icmp_ln321_27_fu_140_p2 = ((stubs_0_layer_V_read_int_reg == 3'd1) ? 1'b1 : 1'b0);

assign icmp_ln321_28_fu_158_p2 = ((stubs_0_layer_V_read_int_reg == 3'd0) ? 1'b1 : 1'b0);

assign icmp_ln321_29_fu_212_p2 = ((stubs_0_layer_V_read_int_reg == 3'd5) ? 1'b1 : 1'b0);

assign icmp_ln321_30_fu_272_p2 = ((stubs_1_layer_V_read_int_reg != 3'd5) ? 1'b1 : 1'b0);

assign icmp_ln321_31_fu_278_p2 = ((stubs_1_layer_V_read_int_reg == 3'd4) ? 1'b1 : 1'b0);

assign icmp_ln321_32_fu_290_p2 = ((stubs_1_layer_V_read_int_reg == 3'd3) ? 1'b1 : 1'b0);

assign icmp_ln321_33_fu_308_p2 = ((stubs_1_layer_V_read_int_reg == 3'd2) ? 1'b1 : 1'b0);

assign icmp_ln321_34_fu_326_p2 = ((stubs_1_layer_V_read_int_reg == 3'd1) ? 1'b1 : 1'b0);

assign icmp_ln321_35_fu_344_p2 = ((stubs_1_layer_V_read_int_reg == 3'd0) ? 1'b1 : 1'b0);

assign icmp_ln321_36_fu_398_p2 = ((stubs_1_layer_V_read_int_reg == 3'd5) ? 1'b1 : 1'b0);

assign icmp_ln321_37_fu_458_p2 = ((stubs_2_layer_V_read_int_reg != 3'd5) ? 1'b1 : 1'b0);

assign icmp_ln321_38_fu_464_p2 = ((stubs_2_layer_V_read_int_reg == 3'd4) ? 1'b1 : 1'b0);

assign icmp_ln321_39_fu_476_p2 = ((stubs_2_layer_V_read_int_reg == 3'd3) ? 1'b1 : 1'b0);

assign icmp_ln321_40_fu_494_p2 = ((stubs_2_layer_V_read_int_reg == 3'd2) ? 1'b1 : 1'b0);

assign icmp_ln321_41_fu_512_p2 = ((stubs_2_layer_V_read_int_reg == 3'd1) ? 1'b1 : 1'b0);

assign icmp_ln321_42_fu_530_p2 = ((stubs_2_layer_V_read_int_reg == 3'd0) ? 1'b1 : 1'b0);

assign icmp_ln321_43_fu_584_p2 = ((stubs_2_layer_V_read_int_reg == 3'd5) ? 1'b1 : 1'b0);

assign icmp_ln321_44_fu_644_p2 = ((stubs_3_layer_V_read_int_reg != 3'd5) ? 1'b1 : 1'b0);

assign icmp_ln321_45_fu_650_p2 = ((stubs_3_layer_V_read_int_reg == 3'd4) ? 1'b1 : 1'b0);

assign icmp_ln321_46_fu_662_p2 = ((stubs_3_layer_V_read_int_reg == 3'd3) ? 1'b1 : 1'b0);

assign icmp_ln321_47_fu_680_p2 = ((stubs_3_layer_V_read_int_reg == 3'd2) ? 1'b1 : 1'b0);

assign icmp_ln321_48_fu_698_p2 = ((stubs_3_layer_V_read_int_reg == 3'd1) ? 1'b1 : 1'b0);

assign icmp_ln321_49_fu_716_p2 = ((stubs_3_layer_V_read_int_reg == 3'd0) ? 1'b1 : 1'b0);

assign icmp_ln321_50_fu_782_p2 = ((stubs_3_layer_V_read_int_reg == 3'd5) ? 1'b1 : 1'b0);

assign icmp_ln321_fu_86_p2 = ((stubs_0_layer_V_read_int_reg != 3'd5) ? 1'b1 : 1'b0);

assign or_ln321_21_fu_776_p2 = (and_ln321_141_fu_764_p2 | and_ln321_122_fu_578_p2);

assign or_ln321_22_fu_1024_p2 = (or_ln321_reg_1040_pp0_iter1_reg | or_ln321_21_reg_1045_pp0_iter1_reg);

assign or_ln321_23_fu_800_p2 = (and_ln321_86_fu_224_p2 | and_ln321_105_fu_410_p2);

assign or_ln321_24_fu_806_p2 = (and_ln321_143_fu_794_p2 | and_ln321_124_fu_596_p2);

assign or_ln321_25_fu_972_p2 = (or_ln321_24_reg_1055 | or_ln321_23_reg_1050);

assign or_ln321_26_fu_830_p2 = (and_ln321_89_fu_242_p2 | and_ln321_108_fu_428_p2);

assign or_ln321_27_fu_836_p2 = (and_ln321_146_fu_824_p2 | and_ln321_127_fu_614_p2);

assign or_ln321_28_fu_842_p2 = (or_ln321_27_fu_836_p2 | or_ln321_26_fu_830_p2);

assign or_ln321_29_fu_860_p2 = (and_ln321_91_fu_254_p2 | and_ln321_110_fu_440_p2);

assign or_ln321_30_fu_866_p2 = (and_ln321_148_fu_854_p2 | and_ln321_129_fu_626_p2);

assign or_ln321_31_fu_976_p2 = (or_ln321_30_reg_1070 | or_ln321_29_reg_1065);

assign or_ln321_32_fu_878_p2 = (and_ln321_92_fu_260_p2 | and_ln321_111_fu_446_p2);

assign or_ln321_33_fu_884_p2 = (and_ln321_149_fu_872_p2 | and_ln321_130_fu_632_p2);

assign or_ln321_34_fu_890_p2 = (or_ln321_33_fu_884_p2 | or_ln321_32_fu_878_p2);

assign or_ln321_35_fu_902_p2 = (and_ln321_93_fu_266_p2 | and_ln321_112_fu_452_p2);

assign or_ln321_36_fu_908_p2 = (and_ln321_150_fu_896_p2 | and_ln321_131_fu_638_p2);

assign or_ln321_37_fu_914_p2 = (or_ln321_36_fu_908_p2 | or_ln321_35_fu_902_p2);

assign or_ln321_38_fu_920_p2 = (and_ln321_79_fu_164_p2 | and_ln321_117_fu_536_p2);

assign or_ln321_39_fu_926_p2 = (and_ln321_98_fu_350_p2 | and_ln321_136_fu_722_p2);

assign or_ln321_40_fu_932_p2 = (or_ln321_39_fu_926_p2 | or_ln321_38_fu_920_p2);

assign or_ln321_fu_770_p2 = (and_ln321_84_fu_206_p2 | and_ln321_103_fu_392_p2);

assign select_ln113_1_fu_964_p3 = ((or_ln321_34_fu_890_p2[0:0] === 1'b1) ? add_ln700_2_fu_958_p2 : select_ln113_fu_950_p3);

assign select_ln113_2_fu_989_p3 = ((or_ln321_31_fu_976_p2[0:0] === 1'b1) ? add_ln700_3_fu_983_p2 : zext_ln113_1_fu_980_p1);

assign select_ln113_3_fu_1003_p3 = ((or_ln321_28_reg_1060[0:0] === 1'b1) ? add_ln700_4_fu_997_p2 : select_ln113_2_fu_989_p3);

assign select_ln113_4_fu_1016_p3 = ((or_ln321_25_fu_972_p2[0:0] === 1'b1) ? add_ln700_5_fu_1010_p2 : select_ln113_3_fu_1003_p3);

assign select_ln113_5_fu_1033_p3 = ((or_ln321_22_fu_1024_p2[0:0] === 1'b1) ? add_ln700_fu_1028_p2 : select_ln113_4_reg_1080);

assign select_ln113_fu_950_p3 = ((or_ln321_37_fu_914_p2[0:0] === 1'b1) ? select_ln700_fu_942_p3 : zext_ln113_fu_938_p1);

assign select_ln700_fu_942_p3 = ((or_ln321_40_fu_932_p2[0:0] === 1'b1) ? 2'd2 : 2'd1);

assign xor_ln321_24_fu_134_p2 = (1'd1 ^ and_ln321_77_fu_128_p2);

assign xor_ln321_25_fu_152_p2 = (1'd1 ^ and_ln321_78_fu_146_p2);

assign xor_ln321_26_fu_170_p2 = (1'd1 ^ and_ln321_79_fu_164_p2);

assign xor_ln321_27_fu_176_p2 = (stubs_0_valid_V_read_int_reg ^ and_ln321_fu_98_p2);

assign xor_ln321_28_fu_302_p2 = (1'd1 ^ and_ln321_95_fu_296_p2);

assign xor_ln321_29_fu_320_p2 = (1'd1 ^ and_ln321_96_fu_314_p2);

assign xor_ln321_30_fu_338_p2 = (1'd1 ^ and_ln321_97_fu_332_p2);

assign xor_ln321_31_fu_356_p2 = (1'd1 ^ and_ln321_98_fu_350_p2);

assign xor_ln321_32_fu_362_p2 = (stubs_1_valid_V_read_int_reg ^ and_ln321_94_fu_284_p2);

assign xor_ln321_33_fu_488_p2 = (1'd1 ^ and_ln321_114_fu_482_p2);

assign xor_ln321_34_fu_506_p2 = (1'd1 ^ and_ln321_115_fu_500_p2);

assign xor_ln321_35_fu_524_p2 = (1'd1 ^ and_ln321_116_fu_518_p2);

assign xor_ln321_36_fu_542_p2 = (1'd1 ^ and_ln321_117_fu_536_p2);

assign xor_ln321_37_fu_548_p2 = (stubs_2_valid_V_read_int_reg ^ and_ln321_113_fu_470_p2);

assign xor_ln321_38_fu_674_p2 = (1'd1 ^ and_ln321_133_fu_668_p2);

assign xor_ln321_39_fu_692_p2 = (1'd1 ^ and_ln321_134_fu_686_p2);

assign xor_ln321_40_fu_710_p2 = (1'd1 ^ and_ln321_135_fu_704_p2);

assign xor_ln321_41_fu_728_p2 = (1'd1 ^ and_ln321_136_fu_722_p2);

assign xor_ln321_42_fu_734_p2 = (stubs_3_valid_V_read_int_reg ^ and_ln321_132_fu_656_p2);

assign xor_ln321_fu_116_p2 = (1'd1 ^ and_ln321_76_fu_110_p2);

assign zext_ln113_1_fu_980_p1 = select_ln113_1_reg_1075;

assign zext_ln113_fu_938_p1 = or_ln321_40_fu_932_p2;

endmodule //countLayersAll
