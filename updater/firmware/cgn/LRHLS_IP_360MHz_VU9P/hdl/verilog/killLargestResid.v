// ==============================================================
// RTL generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and OpenCL
// Version: 2020.1
// Copyright (C) 1986-2020 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

`timescale 1 ns / 1 ps 

module killLargestResid (
        ap_ready,
        LRHLS_largestResid_V_read,
        stubs_0_valid_V_read,
        stubs_1_valid_V_read,
        stubs_2_valid_V_read,
        stubs_3_valid_V_read,
        stubs_4_valid_V_read,
        stubs_5_valid_V_read,
        stubs_6_valid_V_read,
        ap_return_0,
        ap_return_1,
        ap_return_2,
        ap_return_3,
        ap_return_4,
        ap_return_5,
        ap_return_6
);


output   ap_ready;
input  [2:0] LRHLS_largestResid_V_read;
input  [0:0] stubs_0_valid_V_read;
input  [0:0] stubs_1_valid_V_read;
input  [0:0] stubs_2_valid_V_read;
input  [0:0] stubs_3_valid_V_read;
input  [0:0] stubs_4_valid_V_read;
input  [0:0] stubs_5_valid_V_read;
input  [0:0] stubs_6_valid_V_read;
output  [0:0] ap_return_0;
output  [0:0] ap_return_1;
output  [0:0] ap_return_2;
output  [0:0] ap_return_3;
output  [0:0] ap_return_4;
output  [0:0] ap_return_5;
output  [0:0] ap_return_6;

wire   [0:0] write_flag_fu_76_p10;
wire   [0:0] xor_ln404_fu_230_p2;
wire   [0:0] write_flag4_fu_98_p10;
wire   [0:0] xor_ln404_1_fu_242_p2;
wire   [0:0] write_flag8_fu_142_p10;
wire   [0:0] xor_ln404_2_fu_254_p2;
wire   [0:0] write_flag2_fu_164_p10;
wire   [0:0] xor_ln404_3_fu_266_p2;
wire   [0:0] write_flag5_fu_208_p10;
wire   [0:0] xor_ln404_4_fu_278_p2;
wire   [0:0] write_flag3_fu_186_p10;
wire   [0:0] xor_ln404_5_fu_290_p2;
wire   [0:0] write_flag1_fu_120_p10;
wire   [0:0] xor_ln404_6_fu_302_p2;
wire   [0:0] and_ln404_fu_236_p2;
wire   [0:0] and_ln404_1_fu_248_p2;
wire   [0:0] and_ln404_2_fu_260_p2;
wire   [0:0] and_ln404_3_fu_272_p2;
wire   [0:0] and_ln404_4_fu_284_p2;
wire   [0:0] and_ln404_5_fu_296_p2;
wire   [0:0] and_ln404_6_fu_308_p2;

LRHLS_top_mux_83_1_1_1 #(
    .ID( 1 ),
    .NUM_STAGE( 1 ),
    .din0_WIDTH( 1 ),
    .din1_WIDTH( 1 ),
    .din2_WIDTH( 1 ),
    .din3_WIDTH( 1 ),
    .din4_WIDTH( 1 ),
    .din5_WIDTH( 1 ),
    .din6_WIDTH( 1 ),
    .din7_WIDTH( 1 ),
    .din8_WIDTH( 3 ),
    .dout_WIDTH( 1 ))
LRHLS_top_mux_83_1_1_1_U309(
    .din0(1'd1),
    .din1(1'd0),
    .din2(1'd0),
    .din3(1'd0),
    .din4(1'd0),
    .din5(1'd0),
    .din6(1'd0),
    .din7(1'd0),
    .din8(LRHLS_largestResid_V_read),
    .dout(write_flag_fu_76_p10)
);

LRHLS_top_mux_83_1_1_1 #(
    .ID( 1 ),
    .NUM_STAGE( 1 ),
    .din0_WIDTH( 1 ),
    .din1_WIDTH( 1 ),
    .din2_WIDTH( 1 ),
    .din3_WIDTH( 1 ),
    .din4_WIDTH( 1 ),
    .din5_WIDTH( 1 ),
    .din6_WIDTH( 1 ),
    .din7_WIDTH( 1 ),
    .din8_WIDTH( 3 ),
    .dout_WIDTH( 1 ))
LRHLS_top_mux_83_1_1_1_U310(
    .din0(1'd0),
    .din1(1'd1),
    .din2(1'd0),
    .din3(1'd0),
    .din4(1'd0),
    .din5(1'd0),
    .din6(1'd0),
    .din7(1'd0),
    .din8(LRHLS_largestResid_V_read),
    .dout(write_flag4_fu_98_p10)
);

LRHLS_top_mux_83_1_1_1 #(
    .ID( 1 ),
    .NUM_STAGE( 1 ),
    .din0_WIDTH( 1 ),
    .din1_WIDTH( 1 ),
    .din2_WIDTH( 1 ),
    .din3_WIDTH( 1 ),
    .din4_WIDTH( 1 ),
    .din5_WIDTH( 1 ),
    .din6_WIDTH( 1 ),
    .din7_WIDTH( 1 ),
    .din8_WIDTH( 3 ),
    .dout_WIDTH( 1 ))
LRHLS_top_mux_83_1_1_1_U311(
    .din0(1'd0),
    .din1(1'd0),
    .din2(1'd0),
    .din3(1'd0),
    .din4(1'd0),
    .din5(1'd0),
    .din6(1'd1),
    .din7(1'd1),
    .din8(LRHLS_largestResid_V_read),
    .dout(write_flag1_fu_120_p10)
);

LRHLS_top_mux_83_1_1_1 #(
    .ID( 1 ),
    .NUM_STAGE( 1 ),
    .din0_WIDTH( 1 ),
    .din1_WIDTH( 1 ),
    .din2_WIDTH( 1 ),
    .din3_WIDTH( 1 ),
    .din4_WIDTH( 1 ),
    .din5_WIDTH( 1 ),
    .din6_WIDTH( 1 ),
    .din7_WIDTH( 1 ),
    .din8_WIDTH( 3 ),
    .dout_WIDTH( 1 ))
LRHLS_top_mux_83_1_1_1_U312(
    .din0(1'd0),
    .din1(1'd0),
    .din2(1'd1),
    .din3(1'd0),
    .din4(1'd0),
    .din5(1'd0),
    .din6(1'd0),
    .din7(1'd0),
    .din8(LRHLS_largestResid_V_read),
    .dout(write_flag8_fu_142_p10)
);

LRHLS_top_mux_83_1_1_1 #(
    .ID( 1 ),
    .NUM_STAGE( 1 ),
    .din0_WIDTH( 1 ),
    .din1_WIDTH( 1 ),
    .din2_WIDTH( 1 ),
    .din3_WIDTH( 1 ),
    .din4_WIDTH( 1 ),
    .din5_WIDTH( 1 ),
    .din6_WIDTH( 1 ),
    .din7_WIDTH( 1 ),
    .din8_WIDTH( 3 ),
    .dout_WIDTH( 1 ))
LRHLS_top_mux_83_1_1_1_U313(
    .din0(1'd0),
    .din1(1'd0),
    .din2(1'd0),
    .din3(1'd1),
    .din4(1'd0),
    .din5(1'd0),
    .din6(1'd0),
    .din7(1'd0),
    .din8(LRHLS_largestResid_V_read),
    .dout(write_flag2_fu_164_p10)
);

LRHLS_top_mux_83_1_1_1 #(
    .ID( 1 ),
    .NUM_STAGE( 1 ),
    .din0_WIDTH( 1 ),
    .din1_WIDTH( 1 ),
    .din2_WIDTH( 1 ),
    .din3_WIDTH( 1 ),
    .din4_WIDTH( 1 ),
    .din5_WIDTH( 1 ),
    .din6_WIDTH( 1 ),
    .din7_WIDTH( 1 ),
    .din8_WIDTH( 3 ),
    .dout_WIDTH( 1 ))
LRHLS_top_mux_83_1_1_1_U314(
    .din0(1'd0),
    .din1(1'd0),
    .din2(1'd0),
    .din3(1'd0),
    .din4(1'd0),
    .din5(1'd1),
    .din6(1'd0),
    .din7(1'd0),
    .din8(LRHLS_largestResid_V_read),
    .dout(write_flag3_fu_186_p10)
);

LRHLS_top_mux_83_1_1_1 #(
    .ID( 1 ),
    .NUM_STAGE( 1 ),
    .din0_WIDTH( 1 ),
    .din1_WIDTH( 1 ),
    .din2_WIDTH( 1 ),
    .din3_WIDTH( 1 ),
    .din4_WIDTH( 1 ),
    .din5_WIDTH( 1 ),
    .din6_WIDTH( 1 ),
    .din7_WIDTH( 1 ),
    .din8_WIDTH( 3 ),
    .dout_WIDTH( 1 ))
LRHLS_top_mux_83_1_1_1_U315(
    .din0(1'd0),
    .din1(1'd0),
    .din2(1'd0),
    .din3(1'd0),
    .din4(1'd1),
    .din5(1'd0),
    .din6(1'd0),
    .din7(1'd0),
    .din8(LRHLS_largestResid_V_read),
    .dout(write_flag5_fu_208_p10)
);

assign and_ln404_1_fu_248_p2 = (xor_ln404_1_fu_242_p2 & stubs_1_valid_V_read);

assign and_ln404_2_fu_260_p2 = (xor_ln404_2_fu_254_p2 & stubs_2_valid_V_read);

assign and_ln404_3_fu_272_p2 = (xor_ln404_3_fu_266_p2 & stubs_3_valid_V_read);

assign and_ln404_4_fu_284_p2 = (xor_ln404_4_fu_278_p2 & stubs_4_valid_V_read);

assign and_ln404_5_fu_296_p2 = (xor_ln404_5_fu_290_p2 & stubs_5_valid_V_read);

assign and_ln404_6_fu_308_p2 = (xor_ln404_6_fu_302_p2 & stubs_6_valid_V_read);

assign and_ln404_fu_236_p2 = (xor_ln404_fu_230_p2 & stubs_0_valid_V_read);

assign ap_ready = 1'b1;

assign ap_return_0 = and_ln404_fu_236_p2;

assign ap_return_1 = and_ln404_1_fu_248_p2;

assign ap_return_2 = and_ln404_2_fu_260_p2;

assign ap_return_3 = and_ln404_3_fu_272_p2;

assign ap_return_4 = and_ln404_4_fu_284_p2;

assign ap_return_5 = and_ln404_5_fu_296_p2;

assign ap_return_6 = and_ln404_6_fu_308_p2;

assign xor_ln404_1_fu_242_p2 = (write_flag4_fu_98_p10 ^ 1'd1);

assign xor_ln404_2_fu_254_p2 = (write_flag8_fu_142_p10 ^ 1'd1);

assign xor_ln404_3_fu_266_p2 = (write_flag2_fu_164_p10 ^ 1'd1);

assign xor_ln404_4_fu_278_p2 = (write_flag5_fu_208_p10 ^ 1'd1);

assign xor_ln404_5_fu_290_p2 = (write_flag3_fu_186_p10 ^ 1'd1);

assign xor_ln404_6_fu_302_p2 = (write_flag1_fu_120_p10 ^ 1'd1);

assign xor_ln404_fu_230_p2 = (write_flag_fu_76_p10 ^ 1'd1);

endmodule //killLargestResid
