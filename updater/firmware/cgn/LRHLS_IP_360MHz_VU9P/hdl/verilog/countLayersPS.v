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
        stubs_0_psModule_V_read,
        stubs_1_psModule_V_read,
        stubs_2_psModule_V_read,
        stubs_3_psModule_V_read,
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
input  [0:0] stubs_0_psModule_V_read;
input  [0:0] stubs_1_psModule_V_read;
input  [0:0] stubs_2_psModule_V_read;
input  [0:0] stubs_3_psModule_V_read;
input  [0:0] stubs_0_valid_V_read;
input  [0:0] stubs_1_valid_V_read;
input  [0:0] stubs_2_valid_V_read;
input  [0:0] stubs_3_valid_V_read;
output  [2:0] ap_return;
input   ap_ce;

reg[2:0] ap_return;

wire   [0:0] or_ln321_2_fu_850_p2;
reg   [0:0] or_ln321_2_reg_1096;
wire    ap_block_state1_pp0_stage0_iter0;
wire    ap_block_state2_pp0_stage0_iter1;
wire    ap_block_state3_pp0_stage0_iter2;
wire    ap_block_pp0_stage0_11001;
reg   [0:0] or_ln321_2_reg_1096_pp0_iter1_reg;
wire   [0:0] or_ln321_3_fu_868_p2;
reg   [0:0] or_ln321_3_reg_1101;
wire   [0:0] or_ln321_4_fu_874_p2;
reg   [0:0] or_ln321_4_reg_1106;
wire   [0:0] or_ln321_6_fu_892_p2;
reg   [0:0] or_ln321_6_reg_1111;
wire   [0:0] or_ln321_7_fu_898_p2;
reg   [0:0] or_ln321_7_reg_1116;
wire   [0:0] or_ln321_9_fu_916_p2;
reg   [0:0] or_ln321_9_reg_1121;
wire   [0:0] or_ln321_10_fu_922_p2;
reg   [0:0] or_ln321_10_reg_1126;
wire   [1:0] select_ln97_1_fu_1020_p3;
reg   [1:0] select_ln97_1_reg_1131;
wire   [2:0] select_ln97_4_fu_1077_p3;
reg   [2:0] select_ln97_4_reg_1136;
wire    ap_block_pp0_stage0;
wire   [0:0] and_ln85_fu_118_p2;
wire   [0:0] icmp_ln321_fu_124_p2;
wire   [0:0] and_ln321_fu_130_p2;
wire   [0:0] icmp_ln321_1_fu_142_p2;
wire   [0:0] and_ln321_1_fu_148_p2;
wire   [0:0] icmp_ln321_2_fu_160_p2;
wire   [0:0] and_ln321_2_fu_166_p2;
wire   [0:0] icmp_ln321_3_fu_178_p2;
wire   [0:0] and_ln321_3_fu_184_p2;
wire   [0:0] icmp_ln321_4_fu_196_p2;
wire   [0:0] and_ln321_4_fu_202_p2;
wire   [0:0] icmp_ln321_5_fu_214_p2;
wire   [0:0] and_ln321_5_fu_220_p2;
wire   [0:0] xor_ln321_1_fu_154_p2;
wire   [0:0] xor_ln321_2_fu_172_p2;
wire   [0:0] and_ln321_6_fu_232_p2;
wire   [0:0] xor_ln321_fu_136_p2;
wire   [0:0] xor_ln321_4_fu_208_p2;
wire   [0:0] xor_ln321_5_fu_226_p2;
wire   [0:0] and_ln321_8_fu_244_p2;
wire   [0:0] xor_ln321_3_fu_190_p2;
wire   [0:0] and_ln321_9_fu_250_p2;
wire   [0:0] and_ln321_7_fu_238_p2;
wire   [0:0] and_ln321_11_fu_262_p2;
wire   [0:0] and_ln321_13_fu_274_p2;
wire   [0:0] and_ln321_15_fu_286_p2;
wire   [0:0] and_ln85_1_fu_310_p2;
wire   [0:0] icmp_ln321_6_fu_316_p2;
wire   [0:0] and_ln321_19_fu_322_p2;
wire   [0:0] icmp_ln321_7_fu_334_p2;
wire   [0:0] and_ln321_20_fu_340_p2;
wire   [0:0] icmp_ln321_8_fu_352_p2;
wire   [0:0] and_ln321_21_fu_358_p2;
wire   [0:0] icmp_ln321_9_fu_370_p2;
wire   [0:0] and_ln321_22_fu_376_p2;
wire   [0:0] icmp_ln321_10_fu_388_p2;
wire   [0:0] and_ln321_23_fu_394_p2;
wire   [0:0] icmp_ln321_11_fu_406_p2;
wire   [0:0] and_ln321_24_fu_412_p2;
wire   [0:0] xor_ln321_7_fu_346_p2;
wire   [0:0] xor_ln321_8_fu_364_p2;
wire   [0:0] and_ln321_25_fu_424_p2;
wire   [0:0] xor_ln321_6_fu_328_p2;
wire   [0:0] xor_ln321_10_fu_400_p2;
wire   [0:0] xor_ln321_11_fu_418_p2;
wire   [0:0] and_ln321_27_fu_436_p2;
wire   [0:0] xor_ln321_9_fu_382_p2;
wire   [0:0] and_ln321_28_fu_442_p2;
wire   [0:0] and_ln321_26_fu_430_p2;
wire   [0:0] and_ln321_30_fu_454_p2;
wire   [0:0] and_ln321_32_fu_466_p2;
wire   [0:0] and_ln321_34_fu_478_p2;
wire   [0:0] and_ln85_2_fu_502_p2;
wire   [0:0] icmp_ln321_12_fu_508_p2;
wire   [0:0] and_ln321_38_fu_514_p2;
wire   [0:0] icmp_ln321_13_fu_526_p2;
wire   [0:0] and_ln321_39_fu_532_p2;
wire   [0:0] icmp_ln321_14_fu_544_p2;
wire   [0:0] and_ln321_40_fu_550_p2;
wire   [0:0] icmp_ln321_15_fu_562_p2;
wire   [0:0] and_ln321_41_fu_568_p2;
wire   [0:0] icmp_ln321_16_fu_580_p2;
wire   [0:0] and_ln321_42_fu_586_p2;
wire   [0:0] icmp_ln321_17_fu_598_p2;
wire   [0:0] and_ln321_43_fu_604_p2;
wire   [0:0] xor_ln321_13_fu_538_p2;
wire   [0:0] xor_ln321_14_fu_556_p2;
wire   [0:0] and_ln321_44_fu_616_p2;
wire   [0:0] xor_ln321_12_fu_520_p2;
wire   [0:0] xor_ln321_16_fu_592_p2;
wire   [0:0] xor_ln321_17_fu_610_p2;
wire   [0:0] and_ln321_46_fu_628_p2;
wire   [0:0] xor_ln321_15_fu_574_p2;
wire   [0:0] and_ln321_47_fu_634_p2;
wire   [0:0] and_ln321_45_fu_622_p2;
wire   [0:0] and_ln321_49_fu_646_p2;
wire   [0:0] and_ln321_51_fu_658_p2;
wire   [0:0] and_ln321_53_fu_670_p2;
wire   [0:0] and_ln85_3_fu_694_p2;
wire   [0:0] icmp_ln321_18_fu_700_p2;
wire   [0:0] and_ln321_57_fu_706_p2;
wire   [0:0] icmp_ln321_19_fu_718_p2;
wire   [0:0] and_ln321_58_fu_724_p2;
wire   [0:0] icmp_ln321_20_fu_736_p2;
wire   [0:0] and_ln321_59_fu_742_p2;
wire   [0:0] icmp_ln321_21_fu_754_p2;
wire   [0:0] and_ln321_60_fu_760_p2;
wire   [0:0] icmp_ln321_22_fu_772_p2;
wire   [0:0] and_ln321_61_fu_778_p2;
wire   [0:0] icmp_ln321_23_fu_790_p2;
wire   [0:0] and_ln321_62_fu_796_p2;
wire   [0:0] xor_ln321_19_fu_730_p2;
wire   [0:0] xor_ln321_20_fu_748_p2;
wire   [0:0] and_ln321_63_fu_808_p2;
wire   [0:0] xor_ln321_18_fu_712_p2;
wire   [0:0] xor_ln321_22_fu_784_p2;
wire   [0:0] xor_ln321_23_fu_802_p2;
wire   [0:0] and_ln321_65_fu_820_p2;
wire   [0:0] xor_ln321_21_fu_766_p2;
wire   [0:0] and_ln321_66_fu_826_p2;
wire   [0:0] and_ln321_64_fu_814_p2;
wire   [0:0] and_ln321_10_fu_256_p2;
wire   [0:0] and_ln321_29_fu_448_p2;
wire   [0:0] and_ln321_48_fu_640_p2;
wire   [0:0] and_ln321_67_fu_832_p2;
wire   [0:0] or_ln321_1_fu_844_p2;
wire   [0:0] or_ln321_fu_838_p2;
wire   [0:0] and_ln321_68_fu_856_p2;
wire   [0:0] and_ln321_12_fu_268_p2;
wire   [0:0] and_ln321_31_fu_460_p2;
wire   [0:0] and_ln321_50_fu_652_p2;
wire   [0:0] and_ln321_69_fu_862_p2;
wire   [0:0] and_ln321_70_fu_880_p2;
wire   [0:0] and_ln321_14_fu_280_p2;
wire   [0:0] and_ln321_33_fu_472_p2;
wire   [0:0] and_ln321_52_fu_664_p2;
wire   [0:0] and_ln321_71_fu_886_p2;
wire   [0:0] and_ln321_72_fu_904_p2;
wire   [0:0] and_ln321_16_fu_292_p2;
wire   [0:0] and_ln321_35_fu_484_p2;
wire   [0:0] and_ln321_54_fu_676_p2;
wire   [0:0] and_ln321_73_fu_910_p2;
wire   [0:0] and_ln321_17_fu_298_p2;
wire   [0:0] and_ln321_36_fu_490_p2;
wire   [0:0] and_ln321_55_fu_682_p2;
wire   [0:0] and_ln321_74_fu_928_p2;
wire   [0:0] or_ln321_13_fu_940_p2;
wire   [0:0] or_ln321_12_fu_934_p2;
wire   [0:0] and_ln321_18_fu_304_p2;
wire   [0:0] and_ln321_37_fu_496_p2;
wire   [0:0] and_ln321_56_fu_688_p2;
wire   [0:0] and_ln321_75_fu_952_p2;
wire   [0:0] or_ln321_16_fu_964_p2;
wire   [0:0] or_ln321_15_fu_958_p2;
wire   [0:0] or_ln321_19_fu_982_p2;
wire   [0:0] or_ln321_18_fu_976_p2;
wire   [0:0] or_ln321_20_fu_988_p2;
wire   [0:0] or_ln321_17_fu_970_p2;
wire   [1:0] select_ln700_fu_998_p3;
wire   [1:0] zext_ln97_fu_994_p1;
wire   [1:0] select_ln97_fu_1006_p3;
wire   [0:0] or_ln321_14_fu_946_p2;
wire   [1:0] add_ln700_2_fu_1014_p2;
wire   [2:0] zext_ln97_1_fu_1040_p1;
wire   [0:0] or_ln321_11_fu_1036_p2;
wire   [2:0] add_ln700_3_fu_1043_p2;
wire   [2:0] select_ln97_2_fu_1049_p3;
wire   [0:0] or_ln321_8_fu_1032_p2;
wire   [2:0] add_ln700_fu_1057_p2;
wire   [2:0] select_ln97_3_fu_1063_p3;
wire   [0:0] or_ln321_5_fu_1028_p2;
wire   [2:0] add_ln700_4_fu_1071_p2;
wire   [2:0] add_ln700_5_fu_1085_p2;
wire   [2:0] select_ln97_5_fu_1090_p3;
reg    ap_ce_reg;
reg   [2:0] stubs_0_layer_V_read_int_reg;
reg   [2:0] stubs_1_layer_V_read_int_reg;
reg   [2:0] stubs_2_layer_V_read_int_reg;
reg   [2:0] stubs_3_layer_V_read_int_reg;
reg   [0:0] stubs_0_psModule_V_read_int_reg;
reg   [0:0] stubs_1_psModule_V_read_int_reg;
reg   [0:0] stubs_2_psModule_V_read_int_reg;
reg   [0:0] stubs_3_psModule_V_read_int_reg;
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
        ap_return_int_reg <= select_ln97_5_fu_1090_p3;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_ce_reg) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        or_ln321_10_reg_1126 <= or_ln321_10_fu_922_p2;
        or_ln321_2_reg_1096 <= or_ln321_2_fu_850_p2;
        or_ln321_2_reg_1096_pp0_iter1_reg <= or_ln321_2_reg_1096;
        or_ln321_3_reg_1101 <= or_ln321_3_fu_868_p2;
        or_ln321_4_reg_1106 <= or_ln321_4_fu_874_p2;
        or_ln321_6_reg_1111 <= or_ln321_6_fu_892_p2;
        or_ln321_7_reg_1116 <= or_ln321_7_fu_898_p2;
        or_ln321_9_reg_1121 <= or_ln321_9_fu_916_p2;
        select_ln97_1_reg_1131 <= select_ln97_1_fu_1020_p3;
        select_ln97_4_reg_1136 <= select_ln97_4_fu_1077_p3;
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
    end
end

always @ (*) begin
    if ((1'b0 == ap_ce_reg)) begin
        ap_return = ap_return_int_reg;
    end else if ((1'b1 == ap_ce_reg)) begin
        ap_return = select_ln97_5_fu_1090_p3;
    end
end

assign add_ln700_2_fu_1014_p2 = (select_ln97_fu_1006_p3 + 2'd1);

assign add_ln700_3_fu_1043_p2 = (zext_ln97_1_fu_1040_p1 + 3'd1);

assign add_ln700_4_fu_1071_p2 = (select_ln97_3_fu_1063_p3 + 3'd1);

assign add_ln700_5_fu_1085_p2 = (select_ln97_4_reg_1136 + 3'd1);

assign add_ln700_fu_1057_p2 = (select_ln97_2_fu_1049_p3 + 3'd1);

assign and_ln321_10_fu_256_p2 = (and_ln321_9_fu_250_p2 & and_ln321_7_fu_238_p2);

assign and_ln321_11_fu_262_p2 = (and_ln321_fu_130_p2 & and_ln321_6_fu_232_p2);

assign and_ln321_12_fu_268_p2 = (and_ln321_9_fu_250_p2 & and_ln321_11_fu_262_p2);

assign and_ln321_13_fu_274_p2 = (xor_ln321_2_fu_172_p2 & and_ln321_1_fu_148_p2);

assign and_ln321_14_fu_280_p2 = (and_ln321_9_fu_250_p2 & and_ln321_13_fu_274_p2);

assign and_ln321_15_fu_286_p2 = (xor_ln321_3_fu_190_p2 & and_ln321_2_fu_166_p2);

assign and_ln321_16_fu_292_p2 = (and_ln321_8_fu_244_p2 & and_ln321_15_fu_286_p2);

assign and_ln321_17_fu_298_p2 = (and_ln321_8_fu_244_p2 & and_ln321_3_fu_184_p2);

assign and_ln321_18_fu_304_p2 = (xor_ln321_5_fu_226_p2 & and_ln321_4_fu_202_p2);

assign and_ln321_19_fu_322_p2 = (icmp_ln321_6_fu_316_p2 & and_ln85_1_fu_310_p2);

assign and_ln321_1_fu_148_p2 = (icmp_ln321_1_fu_142_p2 & and_ln85_fu_118_p2);

assign and_ln321_20_fu_340_p2 = (icmp_ln321_7_fu_334_p2 & and_ln85_1_fu_310_p2);

assign and_ln321_21_fu_358_p2 = (icmp_ln321_8_fu_352_p2 & and_ln85_1_fu_310_p2);

assign and_ln321_22_fu_376_p2 = (icmp_ln321_9_fu_370_p2 & and_ln85_1_fu_310_p2);

assign and_ln321_23_fu_394_p2 = (icmp_ln321_10_fu_388_p2 & and_ln85_1_fu_310_p2);

assign and_ln321_24_fu_412_p2 = (icmp_ln321_11_fu_406_p2 & and_ln85_1_fu_310_p2);

assign and_ln321_25_fu_424_p2 = (xor_ln321_8_fu_364_p2 & xor_ln321_7_fu_346_p2);

assign and_ln321_26_fu_430_p2 = (xor_ln321_6_fu_328_p2 & and_ln321_25_fu_424_p2);

assign and_ln321_27_fu_436_p2 = (xor_ln321_11_fu_418_p2 & xor_ln321_10_fu_400_p2);

assign and_ln321_28_fu_442_p2 = (xor_ln321_9_fu_382_p2 & and_ln321_27_fu_436_p2);

assign and_ln321_29_fu_448_p2 = (and_ln321_28_fu_442_p2 & and_ln321_26_fu_430_p2);

assign and_ln321_2_fu_166_p2 = (icmp_ln321_2_fu_160_p2 & and_ln85_fu_118_p2);

assign and_ln321_30_fu_454_p2 = (and_ln321_25_fu_424_p2 & and_ln321_19_fu_322_p2);

assign and_ln321_31_fu_460_p2 = (and_ln321_30_fu_454_p2 & and_ln321_28_fu_442_p2);

assign and_ln321_32_fu_466_p2 = (xor_ln321_8_fu_364_p2 & and_ln321_20_fu_340_p2);

assign and_ln321_33_fu_472_p2 = (and_ln321_32_fu_466_p2 & and_ln321_28_fu_442_p2);

assign and_ln321_34_fu_478_p2 = (xor_ln321_9_fu_382_p2 & and_ln321_21_fu_358_p2);

assign and_ln321_35_fu_484_p2 = (and_ln321_34_fu_478_p2 & and_ln321_27_fu_436_p2);

assign and_ln321_36_fu_490_p2 = (and_ln321_27_fu_436_p2 & and_ln321_22_fu_376_p2);

assign and_ln321_37_fu_496_p2 = (xor_ln321_11_fu_418_p2 & and_ln321_23_fu_394_p2);

assign and_ln321_38_fu_514_p2 = (icmp_ln321_12_fu_508_p2 & and_ln85_2_fu_502_p2);

assign and_ln321_39_fu_532_p2 = (icmp_ln321_13_fu_526_p2 & and_ln85_2_fu_502_p2);

assign and_ln321_3_fu_184_p2 = (icmp_ln321_3_fu_178_p2 & and_ln85_fu_118_p2);

assign and_ln321_40_fu_550_p2 = (icmp_ln321_14_fu_544_p2 & and_ln85_2_fu_502_p2);

assign and_ln321_41_fu_568_p2 = (icmp_ln321_15_fu_562_p2 & and_ln85_2_fu_502_p2);

assign and_ln321_42_fu_586_p2 = (icmp_ln321_16_fu_580_p2 & and_ln85_2_fu_502_p2);

assign and_ln321_43_fu_604_p2 = (icmp_ln321_17_fu_598_p2 & and_ln85_2_fu_502_p2);

assign and_ln321_44_fu_616_p2 = (xor_ln321_14_fu_556_p2 & xor_ln321_13_fu_538_p2);

assign and_ln321_45_fu_622_p2 = (xor_ln321_12_fu_520_p2 & and_ln321_44_fu_616_p2);

assign and_ln321_46_fu_628_p2 = (xor_ln321_17_fu_610_p2 & xor_ln321_16_fu_592_p2);

assign and_ln321_47_fu_634_p2 = (xor_ln321_15_fu_574_p2 & and_ln321_46_fu_628_p2);

assign and_ln321_48_fu_640_p2 = (and_ln321_47_fu_634_p2 & and_ln321_45_fu_622_p2);

assign and_ln321_49_fu_646_p2 = (and_ln321_44_fu_616_p2 & and_ln321_38_fu_514_p2);

assign and_ln321_4_fu_202_p2 = (icmp_ln321_4_fu_196_p2 & and_ln85_fu_118_p2);

assign and_ln321_50_fu_652_p2 = (and_ln321_49_fu_646_p2 & and_ln321_47_fu_634_p2);

assign and_ln321_51_fu_658_p2 = (xor_ln321_14_fu_556_p2 & and_ln321_39_fu_532_p2);

assign and_ln321_52_fu_664_p2 = (and_ln321_51_fu_658_p2 & and_ln321_47_fu_634_p2);

assign and_ln321_53_fu_670_p2 = (xor_ln321_15_fu_574_p2 & and_ln321_40_fu_550_p2);

assign and_ln321_54_fu_676_p2 = (and_ln321_53_fu_670_p2 & and_ln321_46_fu_628_p2);

assign and_ln321_55_fu_682_p2 = (and_ln321_46_fu_628_p2 & and_ln321_41_fu_568_p2);

assign and_ln321_56_fu_688_p2 = (xor_ln321_17_fu_610_p2 & and_ln321_42_fu_586_p2);

assign and_ln321_57_fu_706_p2 = (icmp_ln321_18_fu_700_p2 & and_ln85_3_fu_694_p2);

assign and_ln321_58_fu_724_p2 = (icmp_ln321_19_fu_718_p2 & and_ln85_3_fu_694_p2);

assign and_ln321_59_fu_742_p2 = (icmp_ln321_20_fu_736_p2 & and_ln85_3_fu_694_p2);

assign and_ln321_5_fu_220_p2 = (icmp_ln321_5_fu_214_p2 & and_ln85_fu_118_p2);

assign and_ln321_60_fu_760_p2 = (icmp_ln321_21_fu_754_p2 & and_ln85_3_fu_694_p2);

assign and_ln321_61_fu_778_p2 = (icmp_ln321_22_fu_772_p2 & and_ln85_3_fu_694_p2);

assign and_ln321_62_fu_796_p2 = (icmp_ln321_23_fu_790_p2 & and_ln85_3_fu_694_p2);

assign and_ln321_63_fu_808_p2 = (xor_ln321_20_fu_748_p2 & xor_ln321_19_fu_730_p2);

assign and_ln321_64_fu_814_p2 = (xor_ln321_18_fu_712_p2 & and_ln321_63_fu_808_p2);

assign and_ln321_65_fu_820_p2 = (xor_ln321_23_fu_802_p2 & xor_ln321_22_fu_784_p2);

assign and_ln321_66_fu_826_p2 = (xor_ln321_21_fu_766_p2 & and_ln321_65_fu_820_p2);

assign and_ln321_67_fu_832_p2 = (and_ln321_66_fu_826_p2 & and_ln321_64_fu_814_p2);

assign and_ln321_68_fu_856_p2 = (and_ln321_63_fu_808_p2 & and_ln321_57_fu_706_p2);

assign and_ln321_69_fu_862_p2 = (and_ln321_68_fu_856_p2 & and_ln321_66_fu_826_p2);

assign and_ln321_6_fu_232_p2 = (xor_ln321_2_fu_172_p2 & xor_ln321_1_fu_154_p2);

assign and_ln321_70_fu_880_p2 = (xor_ln321_20_fu_748_p2 & and_ln321_58_fu_724_p2);

assign and_ln321_71_fu_886_p2 = (and_ln321_70_fu_880_p2 & and_ln321_66_fu_826_p2);

assign and_ln321_72_fu_904_p2 = (xor_ln321_21_fu_766_p2 & and_ln321_59_fu_742_p2);

assign and_ln321_73_fu_910_p2 = (and_ln321_72_fu_904_p2 & and_ln321_65_fu_820_p2);

assign and_ln321_74_fu_928_p2 = (and_ln321_65_fu_820_p2 & and_ln321_60_fu_760_p2);

assign and_ln321_75_fu_952_p2 = (xor_ln321_23_fu_802_p2 & and_ln321_61_fu_778_p2);

assign and_ln321_7_fu_238_p2 = (xor_ln321_fu_136_p2 & and_ln321_6_fu_232_p2);

assign and_ln321_8_fu_244_p2 = (xor_ln321_5_fu_226_p2 & xor_ln321_4_fu_208_p2);

assign and_ln321_9_fu_250_p2 = (xor_ln321_3_fu_190_p2 & and_ln321_8_fu_244_p2);

assign and_ln321_fu_130_p2 = (icmp_ln321_fu_124_p2 & and_ln85_fu_118_p2);

assign and_ln85_1_fu_310_p2 = (stubs_1_valid_V_read_int_reg & stubs_1_psModule_V_read_int_reg);

assign and_ln85_2_fu_502_p2 = (stubs_2_valid_V_read_int_reg & stubs_2_psModule_V_read_int_reg);

assign and_ln85_3_fu_694_p2 = (stubs_3_valid_V_read_int_reg & stubs_3_psModule_V_read_int_reg);

assign and_ln85_fu_118_p2 = (stubs_0_valid_V_read_int_reg & stubs_0_psModule_V_read_int_reg);

assign ap_block_pp0_stage0 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage0_11001 = ~(1'b1 == 1'b1);

assign ap_block_state1_pp0_stage0_iter0 = ~(1'b1 == 1'b1);

assign ap_block_state2_pp0_stage0_iter1 = ~(1'b1 == 1'b1);

assign ap_block_state3_pp0_stage0_iter2 = ~(1'b1 == 1'b1);

assign icmp_ln321_10_fu_388_p2 = ((stubs_1_layer_V_read_int_reg == 3'd1) ? 1'b1 : 1'b0);

assign icmp_ln321_11_fu_406_p2 = ((stubs_1_layer_V_read_int_reg == 3'd0) ? 1'b1 : 1'b0);

assign icmp_ln321_12_fu_508_p2 = ((stubs_2_layer_V_read_int_reg == 3'd5) ? 1'b1 : 1'b0);

assign icmp_ln321_13_fu_526_p2 = ((stubs_2_layer_V_read_int_reg == 3'd4) ? 1'b1 : 1'b0);

assign icmp_ln321_14_fu_544_p2 = ((stubs_2_layer_V_read_int_reg == 3'd3) ? 1'b1 : 1'b0);

assign icmp_ln321_15_fu_562_p2 = ((stubs_2_layer_V_read_int_reg == 3'd2) ? 1'b1 : 1'b0);

assign icmp_ln321_16_fu_580_p2 = ((stubs_2_layer_V_read_int_reg == 3'd1) ? 1'b1 : 1'b0);

assign icmp_ln321_17_fu_598_p2 = ((stubs_2_layer_V_read_int_reg == 3'd0) ? 1'b1 : 1'b0);

assign icmp_ln321_18_fu_700_p2 = ((stubs_3_layer_V_read_int_reg == 3'd5) ? 1'b1 : 1'b0);

assign icmp_ln321_19_fu_718_p2 = ((stubs_3_layer_V_read_int_reg == 3'd4) ? 1'b1 : 1'b0);

assign icmp_ln321_1_fu_142_p2 = ((stubs_0_layer_V_read_int_reg == 3'd4) ? 1'b1 : 1'b0);

assign icmp_ln321_20_fu_736_p2 = ((stubs_3_layer_V_read_int_reg == 3'd3) ? 1'b1 : 1'b0);

assign icmp_ln321_21_fu_754_p2 = ((stubs_3_layer_V_read_int_reg == 3'd2) ? 1'b1 : 1'b0);

assign icmp_ln321_22_fu_772_p2 = ((stubs_3_layer_V_read_int_reg == 3'd1) ? 1'b1 : 1'b0);

assign icmp_ln321_23_fu_790_p2 = ((stubs_3_layer_V_read_int_reg == 3'd0) ? 1'b1 : 1'b0);

assign icmp_ln321_2_fu_160_p2 = ((stubs_0_layer_V_read_int_reg == 3'd3) ? 1'b1 : 1'b0);

assign icmp_ln321_3_fu_178_p2 = ((stubs_0_layer_V_read_int_reg == 3'd2) ? 1'b1 : 1'b0);

assign icmp_ln321_4_fu_196_p2 = ((stubs_0_layer_V_read_int_reg == 3'd1) ? 1'b1 : 1'b0);

assign icmp_ln321_5_fu_214_p2 = ((stubs_0_layer_V_read_int_reg == 3'd0) ? 1'b1 : 1'b0);

assign icmp_ln321_6_fu_316_p2 = ((stubs_1_layer_V_read_int_reg == 3'd5) ? 1'b1 : 1'b0);

assign icmp_ln321_7_fu_334_p2 = ((stubs_1_layer_V_read_int_reg == 3'd4) ? 1'b1 : 1'b0);

assign icmp_ln321_8_fu_352_p2 = ((stubs_1_layer_V_read_int_reg == 3'd3) ? 1'b1 : 1'b0);

assign icmp_ln321_9_fu_370_p2 = ((stubs_1_layer_V_read_int_reg == 3'd2) ? 1'b1 : 1'b0);

assign icmp_ln321_fu_124_p2 = ((stubs_0_layer_V_read_int_reg == 3'd5) ? 1'b1 : 1'b0);

assign or_ln321_10_fu_922_p2 = (and_ln321_73_fu_910_p2 | and_ln321_54_fu_676_p2);

assign or_ln321_11_fu_1036_p2 = (or_ln321_9_reg_1121 | or_ln321_10_reg_1126);

assign or_ln321_12_fu_934_p2 = (and_ln321_36_fu_490_p2 | and_ln321_17_fu_298_p2);

assign or_ln321_13_fu_940_p2 = (and_ln321_74_fu_928_p2 | and_ln321_55_fu_682_p2);

assign or_ln321_14_fu_946_p2 = (or_ln321_13_fu_940_p2 | or_ln321_12_fu_934_p2);

assign or_ln321_15_fu_958_p2 = (and_ln321_37_fu_496_p2 | and_ln321_18_fu_304_p2);

assign or_ln321_16_fu_964_p2 = (and_ln321_75_fu_952_p2 | and_ln321_56_fu_688_p2);

assign or_ln321_17_fu_970_p2 = (or_ln321_16_fu_964_p2 | or_ln321_15_fu_958_p2);

assign or_ln321_18_fu_976_p2 = (and_ln321_5_fu_220_p2 | and_ln321_43_fu_604_p2);

assign or_ln321_19_fu_982_p2 = (and_ln321_62_fu_796_p2 | and_ln321_24_fu_412_p2);

assign or_ln321_1_fu_844_p2 = (and_ln321_67_fu_832_p2 | and_ln321_48_fu_640_p2);

assign or_ln321_20_fu_988_p2 = (or_ln321_19_fu_982_p2 | or_ln321_18_fu_976_p2);

assign or_ln321_2_fu_850_p2 = (or_ln321_fu_838_p2 | or_ln321_1_fu_844_p2);

assign or_ln321_3_fu_868_p2 = (and_ln321_31_fu_460_p2 | and_ln321_12_fu_268_p2);

assign or_ln321_4_fu_874_p2 = (and_ln321_69_fu_862_p2 | and_ln321_50_fu_652_p2);

assign or_ln321_5_fu_1028_p2 = (or_ln321_4_reg_1106 | or_ln321_3_reg_1101);

assign or_ln321_6_fu_892_p2 = (and_ln321_33_fu_472_p2 | and_ln321_14_fu_280_p2);

assign or_ln321_7_fu_898_p2 = (and_ln321_71_fu_886_p2 | and_ln321_52_fu_664_p2);

assign or_ln321_8_fu_1032_p2 = (or_ln321_7_reg_1116 | or_ln321_6_reg_1111);

assign or_ln321_9_fu_916_p2 = (and_ln321_35_fu_484_p2 | and_ln321_16_fu_292_p2);

assign or_ln321_fu_838_p2 = (and_ln321_29_fu_448_p2 | and_ln321_10_fu_256_p2);

assign select_ln700_fu_998_p3 = ((or_ln321_20_fu_988_p2[0:0] === 1'b1) ? 2'd2 : 2'd1);

assign select_ln97_1_fu_1020_p3 = ((or_ln321_14_fu_946_p2[0:0] === 1'b1) ? add_ln700_2_fu_1014_p2 : select_ln97_fu_1006_p3);

assign select_ln97_2_fu_1049_p3 = ((or_ln321_11_fu_1036_p2[0:0] === 1'b1) ? add_ln700_3_fu_1043_p2 : zext_ln97_1_fu_1040_p1);

assign select_ln97_3_fu_1063_p3 = ((or_ln321_8_fu_1032_p2[0:0] === 1'b1) ? add_ln700_fu_1057_p2 : select_ln97_2_fu_1049_p3);

assign select_ln97_4_fu_1077_p3 = ((or_ln321_5_fu_1028_p2[0:0] === 1'b1) ? add_ln700_4_fu_1071_p2 : select_ln97_3_fu_1063_p3);

assign select_ln97_5_fu_1090_p3 = ((or_ln321_2_reg_1096_pp0_iter1_reg[0:0] === 1'b1) ? add_ln700_5_fu_1085_p2 : select_ln97_4_reg_1136);

assign select_ln97_fu_1006_p3 = ((or_ln321_17_fu_970_p2[0:0] === 1'b1) ? select_ln700_fu_998_p3 : zext_ln97_fu_994_p1);

assign xor_ln321_10_fu_400_p2 = (1'd1 ^ and_ln321_23_fu_394_p2);

assign xor_ln321_11_fu_418_p2 = (1'd1 ^ and_ln321_24_fu_412_p2);

assign xor_ln321_12_fu_520_p2 = (and_ln85_2_fu_502_p2 ^ and_ln321_38_fu_514_p2);

assign xor_ln321_13_fu_538_p2 = (1'd1 ^ and_ln321_39_fu_532_p2);

assign xor_ln321_14_fu_556_p2 = (1'd1 ^ and_ln321_40_fu_550_p2);

assign xor_ln321_15_fu_574_p2 = (1'd1 ^ and_ln321_41_fu_568_p2);

assign xor_ln321_16_fu_592_p2 = (1'd1 ^ and_ln321_42_fu_586_p2);

assign xor_ln321_17_fu_610_p2 = (1'd1 ^ and_ln321_43_fu_604_p2);

assign xor_ln321_18_fu_712_p2 = (and_ln85_3_fu_694_p2 ^ and_ln321_57_fu_706_p2);

assign xor_ln321_19_fu_730_p2 = (1'd1 ^ and_ln321_58_fu_724_p2);

assign xor_ln321_1_fu_154_p2 = (1'd1 ^ and_ln321_1_fu_148_p2);

assign xor_ln321_20_fu_748_p2 = (1'd1 ^ and_ln321_59_fu_742_p2);

assign xor_ln321_21_fu_766_p2 = (1'd1 ^ and_ln321_60_fu_760_p2);

assign xor_ln321_22_fu_784_p2 = (1'd1 ^ and_ln321_61_fu_778_p2);

assign xor_ln321_23_fu_802_p2 = (1'd1 ^ and_ln321_62_fu_796_p2);

assign xor_ln321_2_fu_172_p2 = (1'd1 ^ and_ln321_2_fu_166_p2);

assign xor_ln321_3_fu_190_p2 = (1'd1 ^ and_ln321_3_fu_184_p2);

assign xor_ln321_4_fu_208_p2 = (1'd1 ^ and_ln321_4_fu_202_p2);

assign xor_ln321_5_fu_226_p2 = (1'd1 ^ and_ln321_5_fu_220_p2);

assign xor_ln321_6_fu_328_p2 = (and_ln85_1_fu_310_p2 ^ and_ln321_19_fu_322_p2);

assign xor_ln321_7_fu_346_p2 = (1'd1 ^ and_ln321_20_fu_340_p2);

assign xor_ln321_8_fu_364_p2 = (1'd1 ^ and_ln321_21_fu_358_p2);

assign xor_ln321_9_fu_382_p2 = (1'd1 ^ and_ln321_22_fu_376_p2);

assign xor_ln321_fu_136_p2 = (and_ln85_fu_118_p2 ^ and_ln321_fu_130_p2);

assign zext_ln97_1_fu_1040_p1 = select_ln97_1_reg_1131;

assign zext_ln97_fu_994_p1 = or_ln321_20_fu_988_p2;

endmodule //countLayersPS
