// ==============================================================
// Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2020.1 (64-bit)
// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// ==============================================================
`timescale 1 ns / 1 ps

module LRHLS_top_ama_addmuladd_17ns_22ns_18s_27ns_41_1_0_DSP48_11 (
    input  [17 - 1:0] in0,
    input  [22 - 1:0] in1,
    input  [18 - 1:0] in2,
    input  [27 - 1:0] in3,
    output [41 - 1:0]  dout);


wire signed [18 - 1:0]     b;
wire signed [27 - 1:0]     a;
wire signed [27 - 1:0]     d;
wire signed [48 - 1:0]     c;
wire signed [45 - 1:0]     m;
wire signed [48 - 1:0]     p;
wire signed [27 - 1:0]     ad;

assign a = $unsigned(in0);
assign d = $unsigned(in1);
assign b = $signed(in2);
assign c = $unsigned(in3);

assign ad = a + d;
assign m  = ad * b;
assign p  = m + c;

assign dout = p;

endmodule
`timescale 1 ns / 1 ps
module LRHLS_top_ama_addmuladd_17ns_22ns_18s_27ns_41_1_0(
    din0,
    din1,
    din2,
    din3,
    dout);

parameter ID = 32'd1;
parameter NUM_STAGE = 32'd1;
parameter din0_WIDTH = 32'd1;
parameter din1_WIDTH = 32'd1;
parameter din2_WIDTH = 32'd1;
parameter din3_WIDTH = 32'd1;
parameter dout_WIDTH = 32'd1;
input[din0_WIDTH - 1:0] din0;
input[din1_WIDTH - 1:0] din1;
input[din2_WIDTH - 1:0] din2;
input[din3_WIDTH - 1:0] din3;
output[dout_WIDTH - 1:0] dout;



LRHLS_top_ama_addmuladd_17ns_22ns_18s_27ns_41_1_0_DSP48_11 LRHLS_top_ama_addmuladd_17ns_22ns_18s_27ns_41_1_0_DSP48_11_U(
    .in0( din0 ),
    .in1( din1 ),
    .in2( din2 ),
    .in3( din3 ),
    .dout( dout ));

endmodule

