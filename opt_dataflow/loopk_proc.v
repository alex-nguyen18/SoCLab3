// ==============================================================
// RTL generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC
// Version: 2018.3
// Copyright (C) 1986-2018 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

`timescale 1 ns / 1 ps 

module loopk_proc (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_continue,
        ap_idle,
        ap_ready,
        K,
        N,
        i,
        lda,
        A_address0,
        A_ce0,
        A_q0,
        ldb,
        B_address0,
        B_ce0,
        B_q0,
        ldc,
        C_address0,
        C_ce0,
        C_we0,
        C_d0,
        C_q0
);

parameter    ap_ST_fsm_state1 = 5'd1;
parameter    ap_ST_fsm_state2 = 5'd2;
parameter    ap_ST_fsm_state3 = 5'd4;
parameter    ap_ST_fsm_state4 = 5'd8;
parameter    ap_ST_fsm_state5 = 5'd16;

input   ap_clk;
input   ap_rst;
input   ap_start;
output   ap_done;
input   ap_continue;
output   ap_idle;
output   ap_ready;
input  [31:0] K;
input  [31:0] N;
input  [30:0] i;
input  [31:0] lda;
output  [17:0] A_address0;
output   A_ce0;
input  [15:0] A_q0;
input  [31:0] ldb;
output  [17:0] B_address0;
output   B_ce0;
input  [15:0] B_q0;
input  [31:0] ldc;
output  [17:0] C_address0;
output   C_ce0;
output   C_we0;
output  [31:0] C_d0;
input  [31:0] C_q0;

reg ap_done;
reg ap_idle;
reg ap_ready;
reg A_ce0;
reg B_ce0;
reg[17:0] C_address0;
reg C_ce0;
reg C_we0;

reg    ap_done_reg;
(* fsm_encoding = "none" *) reg   [4:0] ap_CS_fsm;
wire    ap_CS_fsm_state1;
reg    ap_block_state1;
wire   [31:0] tmp_1_fu_159_p2;
reg   [31:0] tmp_1_reg_268;
wire   [31:0] tmp_2_fu_165_p2;
reg   [31:0] tmp_2_reg_273;
wire   [31:0] next_mul_fu_171_p2;
reg   [31:0] next_mul_reg_278;
wire    ap_CS_fsm_state2;
wire   [30:0] k_fu_185_p2;
reg   [30:0] k_reg_286;
wire   [0:0] tmp_3_i_fu_180_p2;
wire  signed [31:0] A_PART_fu_201_p1;
reg  signed [31:0] A_PART_reg_296;
wire    ap_CS_fsm_state3;
wire   [30:0] j_fu_214_p2;
reg   [30:0] j_reg_304;
wire    ap_CS_fsm_state4;
wire   [0:0] tmp_8_i_fu_209_p2;
reg   [17:0] C_addr_reg_314;
reg   [30:0] k_i_reg_121;
reg   [31:0] phi_mul_reg_132;
reg   [30:0] j_i_reg_144;
wire    ap_CS_fsm_state5;
wire  signed [63:0] tmp_5_i_fu_196_p1;
wire  signed [63:0] tmp_i_fu_226_p1;
wire  signed [63:0] tmp_12_i_fu_236_p1;
wire  signed [31:0] grp_fu_245_p3;
wire   [30:0] tmp_1_fu_159_p0;
wire   [31:0] i_cast_fu_155_p1;
wire  signed [31:0] tmp_1_fu_159_p1;
wire   [30:0] tmp_2_fu_165_p0;
wire  signed [31:0] tmp_2_fu_165_p1;
wire   [31:0] k_cast_i_fu_176_p1;
wire   [31:0] tmp_4_i_fu_191_p2;
wire   [31:0] j_cast_i_fu_205_p1;
wire   [31:0] tmp_9_i_fu_220_p2;
wire   [31:0] tmp_11_i_fu_231_p2;
wire  signed [15:0] grp_fu_245_p1;
reg   [4:0] ap_NS_fsm;

// power-on initialization
initial begin
#0 ap_done_reg = 1'b0;
#0 ap_CS_fsm = 5'd1;
end

gemm_mac_muladd_16s_16s_32ns_32_1_1 #(
    .ID( 1 ),
    .NUM_STAGE( 1 ),
    .din0_WIDTH( 16 ),
    .din1_WIDTH( 16 ),
    .din2_WIDTH( 32 ),
    .dout_WIDTH( 32 ))
gemm_mac_muladd_16s_16s_32ns_32_1_1_U1(
    .din0(B_q0),
    .din1(grp_fu_245_p1),
    .din2(C_q0),
    .dout(grp_fu_245_p3)
);

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_CS_fsm <= ap_ST_fsm_state1;
    end else begin
        ap_CS_fsm <= ap_NS_fsm;
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_done_reg <= 1'b0;
    end else begin
        if ((ap_continue == 1'b1)) begin
            ap_done_reg <= 1'b0;
        end else if (((tmp_3_i_fu_180_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state2))) begin
            ap_done_reg <= 1'b1;
        end
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state5)) begin
        j_i_reg_144 <= j_reg_304;
    end else if ((1'b1 == ap_CS_fsm_state3)) begin
        j_i_reg_144 <= 31'd0;
    end
end

always @ (posedge ap_clk) begin
    if (((tmp_8_i_fu_209_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state4))) begin
        k_i_reg_121 <= k_reg_286;
    end else if ((~((ap_start == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        k_i_reg_121 <= 31'd0;
    end
end

always @ (posedge ap_clk) begin
    if (((tmp_8_i_fu_209_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state4))) begin
        phi_mul_reg_132 <= next_mul_reg_278;
    end else if ((~((ap_start == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        phi_mul_reg_132 <= 32'd0;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state3)) begin
        A_PART_reg_296 <= A_PART_fu_201_p1;
    end
end

always @ (posedge ap_clk) begin
    if (((tmp_8_i_fu_209_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state4))) begin
        C_addr_reg_314 <= tmp_12_i_fu_236_p1;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state4)) begin
        j_reg_304 <= j_fu_214_p2;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state2)) begin
        k_reg_286 <= k_fu_185_p2;
        next_mul_reg_278 <= next_mul_fu_171_p2;
    end
end

always @ (posedge ap_clk) begin
    if ((~((ap_start == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        tmp_1_reg_268 <= tmp_1_fu_159_p2;
        tmp_2_reg_273 <= tmp_2_fu_165_p2;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state2)) begin
        A_ce0 = 1'b1;
    end else begin
        A_ce0 = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state4)) begin
        B_ce0 = 1'b1;
    end else begin
        B_ce0 = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state5)) begin
        C_address0 = C_addr_reg_314;
    end else if ((1'b1 == ap_CS_fsm_state4)) begin
        C_address0 = tmp_12_i_fu_236_p1;
    end else begin
        C_address0 = 'bx;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state4) | (1'b1 == ap_CS_fsm_state5))) begin
        C_ce0 = 1'b1;
    end else begin
        C_ce0 = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state5)) begin
        C_we0 = 1'b1;
    end else begin
        C_we0 = 1'b0;
    end
end

always @ (*) begin
    if (((tmp_3_i_fu_180_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state2))) begin
        ap_done = 1'b1;
    end else begin
        ap_done = ap_done_reg;
    end
end

always @ (*) begin
    if (((ap_start == 1'b0) & (1'b1 == ap_CS_fsm_state1))) begin
        ap_idle = 1'b1;
    end else begin
        ap_idle = 1'b0;
    end
end

always @ (*) begin
    if (((tmp_3_i_fu_180_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state2))) begin
        ap_ready = 1'b1;
    end else begin
        ap_ready = 1'b0;
    end
end

always @ (*) begin
    case (ap_CS_fsm)
        ap_ST_fsm_state1 : begin
            if ((~((ap_start == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
                ap_NS_fsm = ap_ST_fsm_state2;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state1;
            end
        end
        ap_ST_fsm_state2 : begin
            if (((tmp_3_i_fu_180_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state2))) begin
                ap_NS_fsm = ap_ST_fsm_state1;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state3;
            end
        end
        ap_ST_fsm_state3 : begin
            ap_NS_fsm = ap_ST_fsm_state4;
        end
        ap_ST_fsm_state4 : begin
            if (((tmp_8_i_fu_209_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state4))) begin
                ap_NS_fsm = ap_ST_fsm_state2;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state5;
            end
        end
        ap_ST_fsm_state5 : begin
            ap_NS_fsm = ap_ST_fsm_state4;
        end
        default : begin
            ap_NS_fsm = 'bx;
        end
    endcase
end

assign A_PART_fu_201_p1 = $signed(A_q0);

assign A_address0 = tmp_5_i_fu_196_p1;

assign B_address0 = tmp_i_fu_226_p1;

assign C_d0 = grp_fu_245_p3;

assign ap_CS_fsm_state1 = ap_CS_fsm[32'd0];

assign ap_CS_fsm_state2 = ap_CS_fsm[32'd1];

assign ap_CS_fsm_state3 = ap_CS_fsm[32'd2];

assign ap_CS_fsm_state4 = ap_CS_fsm[32'd3];

assign ap_CS_fsm_state5 = ap_CS_fsm[32'd4];

always @ (*) begin
    ap_block_state1 = ((ap_start == 1'b0) | (ap_done_reg == 1'b1));
end

assign grp_fu_245_p1 = A_PART_reg_296;

assign i_cast_fu_155_p1 = i;

assign j_cast_i_fu_205_p1 = j_i_reg_144;

assign j_fu_214_p2 = (j_i_reg_144 + 31'd1);

assign k_cast_i_fu_176_p1 = k_i_reg_121;

assign k_fu_185_p2 = (k_i_reg_121 + 31'd1);

assign next_mul_fu_171_p2 = (phi_mul_reg_132 + ldb);

assign tmp_11_i_fu_231_p2 = (tmp_2_reg_273 + j_cast_i_fu_205_p1);

assign tmp_12_i_fu_236_p1 = $signed(tmp_11_i_fu_231_p2);

assign tmp_1_fu_159_p0 = i_cast_fu_155_p1;

assign tmp_1_fu_159_p1 = lda;

assign tmp_1_fu_159_p2 = ($signed({{1'b0}, {tmp_1_fu_159_p0}}) * $signed(tmp_1_fu_159_p1));

assign tmp_2_fu_165_p0 = i_cast_fu_155_p1;

assign tmp_2_fu_165_p1 = ldc;

assign tmp_2_fu_165_p2 = ($signed({{1'b0}, {tmp_2_fu_165_p0}}) * $signed(tmp_2_fu_165_p1));

assign tmp_3_i_fu_180_p2 = (($signed(k_cast_i_fu_176_p1) < $signed(K)) ? 1'b1 : 1'b0);

assign tmp_4_i_fu_191_p2 = (tmp_1_reg_268 + k_cast_i_fu_176_p1);

assign tmp_5_i_fu_196_p1 = $signed(tmp_4_i_fu_191_p2);

assign tmp_8_i_fu_209_p2 = (($signed(j_cast_i_fu_205_p1) < $signed(N)) ? 1'b1 : 1'b0);

assign tmp_9_i_fu_220_p2 = (phi_mul_reg_132 + j_cast_i_fu_205_p1);

assign tmp_i_fu_226_p1 = $signed(tmp_9_i_fu_220_p2);

endmodule //loopk_proc
