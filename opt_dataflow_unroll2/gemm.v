// ==============================================================
// RTL generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC
// Version: 2018.3
// Copyright (C) 1986-2018 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

`timescale 1 ns / 1 ps 

(* CORE_GENERATION_INFO="gemm,hls_ip_2018_3,{HLS_INPUT_TYPE=cxx,HLS_INPUT_FLOAT=0,HLS_INPUT_FIXED=0,HLS_INPUT_PART=xczu3eg-sbva484-1-e,HLS_INPUT_CLOCK=10.000000,HLS_INPUT_ARCH=others,HLS_SYN_CLOCK=5.550000,HLS_SYN_LAT=-1,HLS_SYN_TPT=none,HLS_SYN_MEM=0,HLS_SYN_DSP=8,HLS_SYN_FF=457,HLS_SYN_LUT=885,HLS_VERSION=2018_3}" *)

module gemm (
        M,
        N,
        K,
        A_address0,
        A_ce0,
        A_d0,
        A_q0,
        A_we0,
        A_address1,
        A_ce1,
        A_d1,
        A_q1,
        A_we1,
        lda,
        B_address0,
        B_ce0,
        B_d0,
        B_q0,
        B_we0,
        B_address1,
        B_ce1,
        B_d1,
        B_q1,
        B_we1,
        ldb,
        C_address0,
        C_ce0,
        C_d0,
        C_q0,
        C_we0,
        C_address1,
        C_ce1,
        C_d1,
        C_q1,
        C_we1,
        ldc,
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_ready,
        ap_idle
);


input  [31:0] M;
input  [31:0] N;
input  [31:0] K;
output  [17:0] A_address0;
output   A_ce0;
output  [15:0] A_d0;
input  [15:0] A_q0;
output   A_we0;
output  [17:0] A_address1;
output   A_ce1;
output  [15:0] A_d1;
input  [15:0] A_q1;
output   A_we1;
input  [31:0] lda;
output  [17:0] B_address0;
output   B_ce0;
output  [15:0] B_d0;
input  [15:0] B_q0;
output   B_we0;
output  [17:0] B_address1;
output   B_ce1;
output  [15:0] B_d1;
input  [15:0] B_q1;
output   B_we1;
input  [31:0] ldb;
output  [17:0] C_address0;
output   C_ce0;
output  [31:0] C_d0;
input  [31:0] C_q0;
output   C_we0;
output  [17:0] C_address1;
output   C_ce1;
output  [31:0] C_d1;
input  [31:0] C_q1;
output   C_we1;
input  [31:0] ldc;
input   ap_clk;
input   ap_rst;
input   ap_start;
output   ap_done;
output   ap_ready;
output   ap_idle;

reg ap_done;
reg ap_ready;

wire   [30:0] dataflow_in_loop_loo_U0_i;
wire   [17:0] dataflow_in_loop_loo_U0_A_address0;
wire    dataflow_in_loop_loo_U0_A_ce0;
wire   [15:0] dataflow_in_loop_loo_U0_A_d0;
wire    dataflow_in_loop_loo_U0_A_we0;
wire   [17:0] dataflow_in_loop_loo_U0_A_address1;
wire    dataflow_in_loop_loo_U0_A_ce1;
wire   [15:0] dataflow_in_loop_loo_U0_A_d1;
wire    dataflow_in_loop_loo_U0_A_we1;
wire   [17:0] dataflow_in_loop_loo_U0_B_address0;
wire    dataflow_in_loop_loo_U0_B_ce0;
wire   [15:0] dataflow_in_loop_loo_U0_B_d0;
wire    dataflow_in_loop_loo_U0_B_we0;
wire   [17:0] dataflow_in_loop_loo_U0_B_address1;
wire    dataflow_in_loop_loo_U0_B_ce1;
wire   [15:0] dataflow_in_loop_loo_U0_B_d1;
wire    dataflow_in_loop_loo_U0_B_we1;
wire   [17:0] dataflow_in_loop_loo_U0_C_address0;
wire    dataflow_in_loop_loo_U0_C_ce0;
wire   [31:0] dataflow_in_loop_loo_U0_C_d0;
wire    dataflow_in_loop_loo_U0_C_we0;
wire   [17:0] dataflow_in_loop_loo_U0_C_address1;
wire    dataflow_in_loop_loo_U0_C_ce1;
wire   [31:0] dataflow_in_loop_loo_U0_C_d1;
wire    dataflow_in_loop_loo_U0_C_we1;
wire    dataflow_in_loop_loo_U0_ap_start;
wire    dataflow_in_loop_loo_U0_ap_done;
wire    dataflow_in_loop_loo_U0_ap_ready;
wire    dataflow_in_loop_loo_U0_ap_idle;
wire    dataflow_in_loop_loo_U0_ap_continue;
wire    ap_sync_continue;
wire    ap_sync_done;
wire    ap_sync_ready;
reg   [31:0] loop_dataflow_input_count;
reg   [31:0] loop_dataflow_output_count;
wire   [31:0] bound_minus_1;
wire    dataflow_in_loop_loo_U0_start_full_n;
wire    dataflow_in_loop_loo_U0_start_write;

// power-on initialization
initial begin
#0 loop_dataflow_input_count = 32'd0;
#0 loop_dataflow_output_count = 32'd0;
end

dataflow_in_loop_loo dataflow_in_loop_loo_U0(
    .K(K),
    .N(N),
    .i(dataflow_in_loop_loo_U0_i),
    .lda(lda),
    .A_address0(dataflow_in_loop_loo_U0_A_address0),
    .A_ce0(dataflow_in_loop_loo_U0_A_ce0),
    .A_d0(dataflow_in_loop_loo_U0_A_d0),
    .A_q0(A_q0),
    .A_we0(dataflow_in_loop_loo_U0_A_we0),
    .A_address1(dataflow_in_loop_loo_U0_A_address1),
    .A_ce1(dataflow_in_loop_loo_U0_A_ce1),
    .A_d1(dataflow_in_loop_loo_U0_A_d1),
    .A_q1(16'd0),
    .A_we1(dataflow_in_loop_loo_U0_A_we1),
    .ldb(ldb),
    .B_address0(dataflow_in_loop_loo_U0_B_address0),
    .B_ce0(dataflow_in_loop_loo_U0_B_ce0),
    .B_d0(dataflow_in_loop_loo_U0_B_d0),
    .B_q0(B_q0),
    .B_we0(dataflow_in_loop_loo_U0_B_we0),
    .B_address1(dataflow_in_loop_loo_U0_B_address1),
    .B_ce1(dataflow_in_loop_loo_U0_B_ce1),
    .B_d1(dataflow_in_loop_loo_U0_B_d1),
    .B_q1(16'd0),
    .B_we1(dataflow_in_loop_loo_U0_B_we1),
    .ldc(ldc),
    .C_address0(dataflow_in_loop_loo_U0_C_address0),
    .C_ce0(dataflow_in_loop_loo_U0_C_ce0),
    .C_d0(dataflow_in_loop_loo_U0_C_d0),
    .C_q0(C_q0),
    .C_we0(dataflow_in_loop_loo_U0_C_we0),
    .C_address1(dataflow_in_loop_loo_U0_C_address1),
    .C_ce1(dataflow_in_loop_loo_U0_C_ce1),
    .C_d1(dataflow_in_loop_loo_U0_C_d1),
    .C_q1(32'd0),
    .C_we1(dataflow_in_loop_loo_U0_C_we1),
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .K_ap_vld(1'b1),
    .N_ap_vld(1'b1),
    .i_ap_vld(1'b0),
    .lda_ap_vld(1'b1),
    .ldb_ap_vld(1'b1),
    .ldc_ap_vld(1'b1),
    .ap_start(dataflow_in_loop_loo_U0_ap_start),
    .ap_done(dataflow_in_loop_loo_U0_ap_done),
    .ap_ready(dataflow_in_loop_loo_U0_ap_ready),
    .ap_idle(dataflow_in_loop_loo_U0_ap_idle),
    .ap_continue(dataflow_in_loop_loo_U0_ap_continue)
);

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        loop_dataflow_input_count <= 32'd0;
    end else begin
        if ((~(loop_dataflow_input_count == bound_minus_1) & (ap_start == 1'b1) & (dataflow_in_loop_loo_U0_ap_ready == 1'b1))) begin
            loop_dataflow_input_count <= (loop_dataflow_input_count + 32'd1);
        end else if (((ap_start == 1'b1) & (dataflow_in_loop_loo_U0_ap_ready == 1'b1) & (loop_dataflow_input_count == bound_minus_1))) begin
            loop_dataflow_input_count <= 32'd0;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        loop_dataflow_output_count <= 32'd0;
    end else begin
        if ((~(loop_dataflow_output_count == bound_minus_1) & (dataflow_in_loop_loo_U0_ap_continue == 1'b1) & (dataflow_in_loop_loo_U0_ap_done == 1'b1))) begin
            loop_dataflow_output_count <= (loop_dataflow_output_count + 32'd1);
        end else if (((dataflow_in_loop_loo_U0_ap_continue == 1'b1) & (dataflow_in_loop_loo_U0_ap_done == 1'b1) & (loop_dataflow_output_count == bound_minus_1))) begin
            loop_dataflow_output_count <= 32'd0;
        end
    end
end

always @ (*) begin
    if (((dataflow_in_loop_loo_U0_ap_done == 1'b1) & (loop_dataflow_output_count == bound_minus_1))) begin
        ap_done = 1'b1;
    end else begin
        ap_done = 1'b0;
    end
end

always @ (*) begin
    if (((ap_start == 1'b1) & (dataflow_in_loop_loo_U0_ap_ready == 1'b1) & (loop_dataflow_input_count == bound_minus_1))) begin
        ap_ready = 1'b1;
    end else begin
        ap_ready = 1'b0;
    end
end

assign dataflow_in_loop_loo_U0_ap_continue = 1'b1;

assign A_address0 = dataflow_in_loop_loo_U0_A_address0;

assign A_address1 = 18'd0;

assign A_ce0 = dataflow_in_loop_loo_U0_A_ce0;

assign A_ce1 = 1'b0;

assign A_d0 = 16'd0;

assign A_d1 = 16'd0;

assign A_we0 = 1'b0;

assign A_we1 = 1'b0;

assign B_address0 = dataflow_in_loop_loo_U0_B_address0;

assign B_address1 = 18'd0;

assign B_ce0 = dataflow_in_loop_loo_U0_B_ce0;

assign B_ce1 = 1'b0;

assign B_d0 = 16'd0;

assign B_d1 = 16'd0;

assign B_we0 = 1'b0;

assign B_we1 = 1'b0;

assign C_address0 = dataflow_in_loop_loo_U0_C_address0;

assign C_address1 = 18'd0;

assign C_ce0 = dataflow_in_loop_loo_U0_C_ce0;

assign C_ce1 = 1'b0;

assign C_d0 = dataflow_in_loop_loo_U0_C_d0;

assign C_d1 = 32'd0;

assign C_we0 = dataflow_in_loop_loo_U0_C_we0;

assign C_we1 = 1'b0;

assign ap_idle = dataflow_in_loop_loo_U0_ap_idle;

assign ap_sync_continue = 1'b1;

assign ap_sync_done = dataflow_in_loop_loo_U0_ap_done;

assign ap_sync_ready = dataflow_in_loop_loo_U0_ap_ready;

assign bound_minus_1 = (M - 32'd1);

assign dataflow_in_loop_loo_U0_ap_start = ap_start;

assign dataflow_in_loop_loo_U0_i = loop_dataflow_input_count;

assign dataflow_in_loop_loo_U0_start_full_n = 1'b1;

assign dataflow_in_loop_loo_U0_start_write = 1'b0;

endmodule //gemm
