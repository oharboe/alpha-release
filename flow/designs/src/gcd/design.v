
// Generated by Cadence Genus(TM) Synthesis Solution 18.10-p003_1
// Generated on: Jun 29 2019 16:19:10 EDT (Jun 29 2019 20:19:10 UTC)

// Verification Directory fv/gcd 

module bmux(ctl, in_0, in_1, z);
  input ctl;
  input [1:0] in_0, in_1;
  output [1:0] z;
  wire ctl;
  wire [1:0] in_0, in_1;
  wire [1:0] z;
  CDN_bmux2 g1(.sel0 (ctl), .data0 (in_0[1]), .data1 (in_1[1]), .z
       (z[1]));
  CDN_bmux2 g2(.sel0 (ctl), .data0 (in_0[0]), .data1 (in_1[0]), .z
       (z[0]));
endmodule

module RegRst_0x9f365fdf6c8998a(clk, in_, out, reset);
  input [0:0] clk, reset;
  input [1:0] in_;
  output [1:0] out;
  wire [0:0] clk, reset;
  wire [1:0] in_;
  wire [1:0] out;
  wire UNCONNECTED, UNCONNECTED0;
  bmux mux_out_359_9(.ctl (reset), .in_0 (in_), .in_1 (2'b00), .z
       ({UNCONNECTED0, UNCONNECTED}));
  CDN_flop \out_reg[0] (.clk (clk), .d (in_[0]), .sena (1'b1), .aclr
       (1'b0), .apre (1'b0), .srl (reset), .srd (1'b0), .q (out[0]));
  CDN_flop \out_reg[1] (.clk (clk), .d (in_[1]), .sena (1'b1), .aclr
       (1'b0), .apre (1'b0), .srl (reset), .srd (1'b0), .q (out[1]));
endmodule

module case_box(in_0, out_0);
  input [1:0] in_0;
  output [3:0] out_0;
  wire [1:0] in_0;
  wire [3:0] out_0;
  wire n_4, n_6;
  assign out_0[3] = ~(in_0[0] | in_0[1]);
  assign out_0[2] = ~(n_4 | in_0[1]);
  assign n_4 = ~(in_0[0]);
  assign out_0[1] = ~(in_0[0] | n_6);
  assign n_6 = ~(in_0[1]);
  assign out_0[0] = ~(n_4 | n_6);
endmodule

module mux(ctl, in_0, in_1, in_2, in_3, z);
  input [3:0] ctl, in_0, in_1, in_2, in_3;
  output [3:0] z;
  wire [3:0] ctl, in_0, in_1, in_2, in_3;
  wire [3:0] z;
  CDN_mux4 g1(.sel0 (ctl[3]), .data0 (in_0[3]), .sel1 (ctl[2]), .data1
       (in_1[3]), .sel2 (ctl[1]), .data2 (in_2[3]), .sel3 (ctl[0]),
       .data3 (in_3[3]), .z (z[3]));
  CDN_mux4 g5(.sel0 (ctl[3]), .data0 (in_0[2]), .sel1 (ctl[2]), .data1
       (in_1[2]), .sel2 (ctl[1]), .data2 (in_2[2]), .sel3 (ctl[0]),
       .data3 (in_3[2]), .z (z[2]));
  CDN_mux4 g6(.sel0 (ctl[3]), .data0 (in_0[1]), .sel1 (ctl[2]), .data1
       (in_1[1]), .sel2 (ctl[1]), .data2 (in_2[1]), .sel3 (ctl[0]),
       .data3 (in_3[1]), .z (z[1]));
  CDN_mux4 g7(.sel0 (ctl[3]), .data0 (in_0[0]), .sel1 (ctl[2]), .data1
       (in_1[0]), .sel2 (ctl[1]), .data2 (in_2[0]), .sel3 (ctl[0]),
       .data3 (in_3[0]), .z (z[0]));
endmodule

module bmux_10(ctl, in_0, in_1, in_2, in_3, z);
  input [1:0] ctl;
  input in_0, in_1, in_2, in_3;
  output z;
  wire [1:0] ctl;
  wire in_0, in_1, in_2, in_3;
  wire z;
  CDN_bmux4 g1(.sel0 (ctl[0]), .data0 (in_0), .data1 (in_1), .sel1
       (ctl[1]), .data2 (in_2), .data3 (in_3), .z (z));
endmodule

module bmux_12(ctl, in_0, in_1, in_2, in_3, z);
  input [1:0] ctl, in_0, in_1, in_2, in_3;
  output [1:0] z;
  wire [1:0] ctl, in_0, in_1, in_2, in_3;
  wire [1:0] z;
  CDN_bmux4 g1(.sel0 (ctl[0]), .data0 (in_0[1]), .data1 (in_1[1]),
       .sel1 (ctl[1]), .data2 (in_2[1]), .data3 (in_3[1]), .z (z[1]));
  CDN_bmux4 g2(.sel0 (ctl[0]), .data0 (in_0[0]), .data1 (in_1[0]),
       .sel1 (ctl[1]), .data2 (in_2[0]), .data3 (in_3[0]), .z (z[0]));
endmodule

module GcdUnitCtrlRTL_0x4d0fc71ead8d3d9e(a_mux_sel, a_reg_en,
     b_mux_sel, b_reg_en, clk, is_a_lt_b, is_b_zero, req_rdy, req_val,
     reset, resp_rdy, resp_val);
  input [0:0] clk, is_a_lt_b, is_b_zero, req_val, reset, resp_rdy;
  output [1:0] a_mux_sel;
  output [0:0] a_reg_en, b_mux_sel, b_reg_en, req_rdy, resp_val;
  wire [0:0] clk, is_a_lt_b, is_b_zero, req_val, reset, resp_rdy;
  wire [1:0] a_mux_sel;
  wire [0:0] a_reg_en, b_mux_sel, b_reg_en, req_rdy, resp_val;
  wire [1:0] state$in_;
  wire [1:0] state$out;
  wire [1:0] next_state__0;
  wire n_40, n_41, n_42, n_43, n_44, n_45, n_46, n_47;
  wire n_48, n_49, n_50, n_65, n_68, n_73;
  RegRst_0x9f365fdf6c8998a state(.clk (clk), .in_ (state$in_), .out
       (state$out), .reset (reset));
  bmux mux_next_state__0_201_24(.ctl (n_42), .in_0 (state$out), .in_1
       (2'b01), .z (next_state__0));
  bmux mux_next_state__0_210_24(.ctl (n_41), .in_0 (next_state__0),
       .in_1 (2'b10), .z ({n_44, n_43}));
  bmux mux_next_state__0_219_24(.ctl (n_40), .in_0 ({n_44, n_43}),
       .in_1 (2'b00), .z (state$in_));
  case_box ctl_285_10(.in_0 (state$out), .out_0 ({n_45, n_46, n_47,
       n_48}));
  mux mux_cmbsop_req_rdy_285_10(.ctl ({n_45, n_46, n_47, n_48}), .in_0
       (4'b1011), .in_1 (4'b0010), .in_2 (4'b0100), .in_3 (4'b0000), .z
       ({req_rdy, resp_val, a_reg_en, b_mux_sel}));
  bmux_10 mux_b_reg_en_285_10(.ctl (state$out), .in_0 (1'b1), .in_1
       (is_a_lt_b), .in_2 (1'b0), .in_3 (1'b0), .z (b_reg_en));
  bmux mux_299_21(.ctl (is_a_lt_b), .in_0 (2'b01), .in_1 (2'b10), .z
       ({n_50, n_49}));
  bmux_12 mux_a_mux_sel_285_10(.ctl (state$out), .in_0 (2'b00), .in_1
       ({n_50, n_49}), .in_2 (2'b00), .in_3 (2'b00), .z (a_mux_sel));
  assign n_68 = ~(state$out[1]);
  assign n_65 = ~(state$out[0]);
  assign n_40 = state$out[1] & n_65 & resp_val & resp_rdy;
  assign n_41 = n_73 & state$out[0] & n_68 & is_b_zero;
  assign n_73 = ~(is_a_lt_b);
  assign n_42 = n_65 & n_68 & req_val & req_rdy;
endmodule

module RegEn_0x68db79c4ec1d6e5b(clk, en, in_, out, reset);
  input [0:0] clk, en, reset;
  input [15:0] in_;
  output [15:0] out;
  wire [0:0] clk, en, reset;
  wire [15:0] in_;
  wire [15:0] out;
  CDN_flop \out_reg[0] (.clk (clk), .d (in_[0]), .sena (en), .aclr
       (1'b0), .apre (1'b0), .srl (1'b0), .srd (1'b0), .q (out[0]));
  CDN_flop \out_reg[1] (.clk (clk), .d (in_[1]), .sena (en), .aclr
       (1'b0), .apre (1'b0), .srl (1'b0), .srd (1'b0), .q (out[1]));
  CDN_flop \out_reg[2] (.clk (clk), .d (in_[2]), .sena (en), .aclr
       (1'b0), .apre (1'b0), .srl (1'b0), .srd (1'b0), .q (out[2]));
  CDN_flop \out_reg[3] (.clk (clk), .d (in_[3]), .sena (en), .aclr
       (1'b0), .apre (1'b0), .srl (1'b0), .srd (1'b0), .q (out[3]));
  CDN_flop \out_reg[4] (.clk (clk), .d (in_[4]), .sena (en), .aclr
       (1'b0), .apre (1'b0), .srl (1'b0), .srd (1'b0), .q (out[4]));
  CDN_flop \out_reg[5] (.clk (clk), .d (in_[5]), .sena (en), .aclr
       (1'b0), .apre (1'b0), .srl (1'b0), .srd (1'b0), .q (out[5]));
  CDN_flop \out_reg[6] (.clk (clk), .d (in_[6]), .sena (en), .aclr
       (1'b0), .apre (1'b0), .srl (1'b0), .srd (1'b0), .q (out[6]));
  CDN_flop \out_reg[7] (.clk (clk), .d (in_[7]), .sena (en), .aclr
       (1'b0), .apre (1'b0), .srl (1'b0), .srd (1'b0), .q (out[7]));
  CDN_flop \out_reg[8] (.clk (clk), .d (in_[8]), .sena (en), .aclr
       (1'b0), .apre (1'b0), .srl (1'b0), .srd (1'b0), .q (out[8]));
  CDN_flop \out_reg[9] (.clk (clk), .d (in_[9]), .sena (en), .aclr
       (1'b0), .apre (1'b0), .srl (1'b0), .srd (1'b0), .q (out[9]));
  CDN_flop \out_reg[10] (.clk (clk), .d (in_[10]), .sena (en), .aclr
       (1'b0), .apre (1'b0), .srl (1'b0), .srd (1'b0), .q (out[10]));
  CDN_flop \out_reg[11] (.clk (clk), .d (in_[11]), .sena (en), .aclr
       (1'b0), .apre (1'b0), .srl (1'b0), .srd (1'b0), .q (out[11]));
  CDN_flop \out_reg[12] (.clk (clk), .d (in_[12]), .sena (en), .aclr
       (1'b0), .apre (1'b0), .srl (1'b0), .srd (1'b0), .q (out[12]));
  CDN_flop \out_reg[13] (.clk (clk), .d (in_[13]), .sena (en), .aclr
       (1'b0), .apre (1'b0), .srl (1'b0), .srd (1'b0), .q (out[13]));
  CDN_flop \out_reg[14] (.clk (clk), .d (in_[14]), .sena (en), .aclr
       (1'b0), .apre (1'b0), .srl (1'b0), .srd (1'b0), .q (out[14]));
  CDN_flop \out_reg[15] (.clk (clk), .d (in_[15]), .sena (en), .aclr
       (1'b0), .apre (1'b0), .srl (1'b0), .srd (1'b0), .q (out[15]));
endmodule

module lt_unsigned(A, B, Z);
  input [15:0] A, B;
  output Z;
  wire [15:0] A, B;
  wire Z;
  wire n_52, n_53, n_54, n_55, n_56, n_57, n_58, n_59;
  wire n_60, n_61, n_62, n_63, n_64, n_65, n_66, n_68;
  wire n_69, n_71, n_72, n_73, n_74, n_75, n_76, n_77;
  wire n_78, n_79, n_80, n_81, n_82, n_83, n_84, n_85;
  wire n_86, n_87, n_88, n_89, n_90, n_91, n_92, n_93;
  wire n_94, n_95, n_96, n_97, n_98, n_99, n_100, n_101;
  wire n_102, n_103, n_104, n_105, n_106, n_107, n_108, n_109;
  wire n_110, n_111, n_112, n_113, n_114, n_115, n_116, n_117;
  wire n_118, n_121, n_122, n_123, n_124, n_127, n_129, n_130;
  wire n_131, n_132, n_133, n_134, n_137, n_139, n_140, n_141;
  wire n_142, n_143, n_144, n_147, n_149, n_150, n_151, n_152;
  wire n_153, n_154, n_162, n_163, n_164, n_165, n_166, n_169;
  wire n_177, n_178, n_179, n_180, n_181, n_200, n_201, n_202;
  assign n_52 = ~(B[15]);
  assign n_53 = ~(B[14]);
  assign n_54 = ~(B[13]);
  assign n_55 = ~(B[12]);
  assign n_56 = ~(B[11]);
  assign n_57 = ~(B[10]);
  assign n_58 = ~(B[9]);
  assign n_59 = ~(B[8]);
  assign n_60 = ~(B[7]);
  assign n_61 = ~(B[6]);
  assign n_62 = ~(B[5]);
  assign n_63 = ~(B[4]);
  assign n_64 = ~(B[3]);
  assign n_65 = ~(B[2]);
  assign n_66 = ~(B[1]);
  assign Z = ~(n_68);
  assign n_72 = ~(n_69 & B[0]);
  assign n_71 = ~(A[1] | n_66);
  assign n_74 = ~(A[1] & n_66);
  assign n_81 = ~(A[2] | n_65);
  assign n_76 = ~(A[2] & n_65);
  assign n_77 = ~(A[3] | n_64);
  assign n_78 = ~(A[3] & n_64);
  assign n_87 = ~(A[4] | n_63);
  assign n_82 = ~(A[4] & n_63);
  assign n_83 = ~(A[5] | n_62);
  assign n_84 = ~(A[5] & n_62);
  assign n_93 = ~(A[6] | n_61);
  assign n_88 = ~(A[6] & n_61);
  assign n_89 = ~(A[7] | n_60);
  assign n_90 = ~(A[7] & n_60);
  assign n_99 = ~(A[8] | n_59);
  assign n_94 = ~(A[8] & n_59);
  assign n_95 = ~(A[9] | n_58);
  assign n_96 = ~(A[9] & n_58);
  assign n_105 = ~(A[10] | n_57);
  assign n_100 = ~(A[10] & n_57);
  assign n_101 = ~(A[11] | n_56);
  assign n_102 = ~(A[11] & n_56);
  assign n_111 = ~(A[12] | n_55);
  assign n_106 = ~(A[12] & n_55);
  assign n_107 = ~(A[13] | n_54);
  assign n_108 = ~(A[13] & n_54);
  assign n_117 = ~(A[14] | n_53);
  assign n_112 = ~(A[14] & n_53);
  assign n_113 = ~(A[15] | n_52);
  assign n_114 = ~(A[15] & n_52);
  assign n_73 = ~(n_71);
  assign n_75 = ~(n_72 & n_73);
  assign n_118 = ~(n_74 & n_75);
  assign n_79 = ~(n_76 | n_77);
  assign n_80 = ~(n_78);
  assign n_122 = ~(n_79 | n_80);
  assign n_121 = ~(n_81 | n_77);
  assign n_85 = ~(n_82 | n_83);
  assign n_86 = ~(n_84);
  assign n_124 = ~(n_85 | n_86);
  assign n_127 = ~(n_87 | n_83);
  assign n_91 = ~(n_88 | n_89);
  assign n_92 = ~(n_90);
  assign n_131 = ~(n_91 | n_92);
  assign n_129 = ~(n_93 | n_89);
  assign n_97 = ~(n_94 | n_95);
  assign n_98 = ~(n_96);
  assign n_134 = ~(n_97 | n_98);
  assign n_137 = ~(n_99 | n_95);
  assign n_103 = ~(n_100 | n_101);
  assign n_104 = ~(n_102);
  assign n_141 = ~(n_103 | n_104);
  assign n_139 = ~(n_105 | n_101);
  assign n_109 = ~(n_106 | n_107);
  assign n_110 = ~(n_108);
  assign n_144 = ~(n_109 | n_110);
  assign n_147 = ~(n_111 | n_107);
  assign n_115 = ~(n_112 | n_113);
  assign n_116 = ~(n_114);
  assign n_151 = ~(n_115 | n_116);
  assign n_149 = ~(n_117 | n_113);
  assign n_123 = ~(n_121 & n_118);
  assign n_154 = ~(n_122 & n_123);
  assign n_130 = ~(n_129);
  assign n_132 = ~(n_124 | n_130);
  assign n_133 = ~(n_131);
  assign n_164 = ~(n_132 | n_133);
  assign n_162 = ~(n_127 & n_129);
  assign n_140 = ~(n_139);
  assign n_142 = ~(n_134 | n_140);
  assign n_143 = ~(n_141);
  assign n_166 = ~(n_142 | n_143);
  assign n_169 = ~(n_137 & n_139);
  assign n_150 = ~(n_149);
  assign n_152 = ~(n_144 | n_150);
  assign n_153 = ~(n_151);
  assign n_178 = ~(n_152 | n_153);
  assign n_177 = ~(n_147 & n_149);
  assign n_163 = ~(n_162);
  assign n_165 = ~(n_154 & n_163);
  assign n_181 = ~(n_164 & n_165);
  assign n_179 = ~(n_177 | n_166);
  assign n_180 = ~(n_178);
  assign n_201 = ~(n_179 | n_180);
  assign n_200 = ~(n_169 | n_177);
  assign n_202 = ~(n_200 & n_181);
  assign n_68 = ~(n_201 & n_202);
  assign n_69 = ~(A[0]);
endmodule

module LtComparator_0x422b1f52edd46a85(clk, in0, in1, out, reset);
  input [0:0] clk, reset;
  input [15:0] in0, in1;
  output [0:0] out;
  wire [0:0] clk, reset;
  wire [15:0] in0, in1;
  wire [0:0] out;
  lt_unsigned lt_613_16(.A (in0), .B (in1), .Z (out));
endmodule

module equal_unsigned_14(A, B, Z);
  input [15:0] A;
  input B;
  output Z;
  wire [15:0] A;
  wire B;
  wire Z;
  wire n_19, n_20, n_21, n_22, n_23, n_24, n_25;
  assign n_19 = ~(A[0] ^ B);
  assign n_20 = ~(A[15] | A[14] | A[13] | A[12]);
  assign n_21 = ~(A[11] | A[10] | A[9] | A[8]);
  assign n_22 = ~(A[7] | A[6] | A[5] | A[4]);
  assign n_23 = ~(A[3] | A[2] | A[1]);
  assign n_24 = ~(n_19 & n_20 & n_21 & n_22);
  assign n_25 = ~(n_23);
  assign Z = ~(n_24 | n_25);
endmodule

module ZeroComparator_0x422b1f52edd46a85(clk, in_, out, reset);
  input [0:0] clk, reset;
  input [15:0] in_;
  output [0:0] out;
  wire [0:0] clk, reset;
  wire [15:0] in_;
  wire [0:0] out;
  equal_unsigned_14 eq_643_16(.A (in_), .B (1'b0), .Z (out));
endmodule

module mux_15(ctl, in_0, in_1, in_2, z);
  input [2:0] ctl;
  input [15:0] in_0, in_1, in_2;
  output [15:0] z;
  wire [2:0] ctl;
  wire [15:0] in_0, in_1, in_2;
  wire [15:0] z;
  CDN_mux3 g1(.sel0 (ctl[2]), .data0 (in_0[15]), .sel1 (ctl[1]), .data1
       (in_1[15]), .sel2 (ctl[0]), .data2 (in_2[15]), .z (z[15]));
  CDN_mux3 g17(.sel0 (ctl[2]), .data0 (in_0[14]), .sel1 (ctl[1]),
       .data1 (in_1[14]), .sel2 (ctl[0]), .data2 (in_2[14]), .z
       (z[14]));
  CDN_mux3 g18(.sel0 (ctl[2]), .data0 (in_0[13]), .sel1 (ctl[1]),
       .data1 (in_1[13]), .sel2 (ctl[0]), .data2 (in_2[13]), .z
       (z[13]));
  CDN_mux3 g19(.sel0 (ctl[2]), .data0 (in_0[12]), .sel1 (ctl[1]),
       .data1 (in_1[12]), .sel2 (ctl[0]), .data2 (in_2[12]), .z
       (z[12]));
  CDN_mux3 g20(.sel0 (ctl[2]), .data0 (in_0[11]), .sel1 (ctl[1]),
       .data1 (in_1[11]), .sel2 (ctl[0]), .data2 (in_2[11]), .z
       (z[11]));
  CDN_mux3 g21(.sel0 (ctl[2]), .data0 (in_0[10]), .sel1 (ctl[1]),
       .data1 (in_1[10]), .sel2 (ctl[0]), .data2 (in_2[10]), .z
       (z[10]));
  CDN_mux3 g22(.sel0 (ctl[2]), .data0 (in_0[9]), .sel1 (ctl[1]), .data1
       (in_1[9]), .sel2 (ctl[0]), .data2 (in_2[9]), .z (z[9]));
  CDN_mux3 g23(.sel0 (ctl[2]), .data0 (in_0[8]), .sel1 (ctl[1]), .data1
       (in_1[8]), .sel2 (ctl[0]), .data2 (in_2[8]), .z (z[8]));
  CDN_mux3 g24(.sel0 (ctl[2]), .data0 (in_0[7]), .sel1 (ctl[1]), .data1
       (in_1[7]), .sel2 (ctl[0]), .data2 (in_2[7]), .z (z[7]));
  CDN_mux3 g25(.sel0 (ctl[2]), .data0 (in_0[6]), .sel1 (ctl[1]), .data1
       (in_1[6]), .sel2 (ctl[0]), .data2 (in_2[6]), .z (z[6]));
  CDN_mux3 g26(.sel0 (ctl[2]), .data0 (in_0[5]), .sel1 (ctl[1]), .data1
       (in_1[5]), .sel2 (ctl[0]), .data2 (in_2[5]), .z (z[5]));
  CDN_mux3 g27(.sel0 (ctl[2]), .data0 (in_0[4]), .sel1 (ctl[1]), .data1
       (in_1[4]), .sel2 (ctl[0]), .data2 (in_2[4]), .z (z[4]));
  CDN_mux3 g28(.sel0 (ctl[2]), .data0 (in_0[3]), .sel1 (ctl[1]), .data1
       (in_1[3]), .sel2 (ctl[0]), .data2 (in_2[3]), .z (z[3]));
  CDN_mux3 g29(.sel0 (ctl[2]), .data0 (in_0[2]), .sel1 (ctl[1]), .data1
       (in_1[2]), .sel2 (ctl[0]), .data2 (in_2[2]), .z (z[2]));
  CDN_mux3 g30(.sel0 (ctl[2]), .data0 (in_0[1]), .sel1 (ctl[1]), .data1
       (in_1[1]), .sel2 (ctl[0]), .data2 (in_2[1]), .z (z[1]));
  CDN_mux3 g31(.sel0 (ctl[2]), .data0 (in_0[0]), .sel1 (ctl[1]), .data1
       (in_1[0]), .sel2 (ctl[0]), .data2 (in_2[0]), .z (z[0]));
endmodule

module Mux_0x683fa1a418b072c9(clk, in_$000, in_$001, in_$002, out,
     reset, sel);
  input [0:0] clk, reset;
  input [15:0] in_$000, in_$001, in_$002;
  input [1:0] sel;
  output [15:0] out;
  wire [0:0] clk, reset;
  wire [15:0] in_$000, in_$001, in_$002;
  wire [1:0] sel;
  wire [15:0] out;
  wire n_3;
  mux_15 \mux_in_[sel]_686_11 (.ctl ({n_3, sel[0], sel[1]}), .in_0
       (in_$000), .in_1 (in_$001), .in_2 (in_$002), .z (out));
  assign n_3 = ~(sel[0] | sel[1]);
endmodule

module mux_30(ctl, in_0, in_1, z);
  input [1:0] ctl;
  input [15:0] in_0, in_1;
  output [15:0] z;
  wire [1:0] ctl;
  wire [15:0] in_0, in_1;
  wire [15:0] z;
  CDN_mux2 g1(.sel0 (ctl[1]), .data0 (in_0[15]), .sel1 (ctl[0]), .data1
       (in_1[15]), .z (z[15]));
  CDN_mux2 g17(.sel0 (ctl[1]), .data0 (in_0[14]), .sel1 (ctl[0]),
       .data1 (in_1[14]), .z (z[14]));
  CDN_mux2 g18(.sel0 (ctl[1]), .data0 (in_0[13]), .sel1 (ctl[0]),
       .data1 (in_1[13]), .z (z[13]));
  CDN_mux2 g19(.sel0 (ctl[1]), .data0 (in_0[12]), .sel1 (ctl[0]),
       .data1 (in_1[12]), .z (z[12]));
  CDN_mux2 g20(.sel0 (ctl[1]), .data0 (in_0[11]), .sel1 (ctl[0]),
       .data1 (in_1[11]), .z (z[11]));
  CDN_mux2 g21(.sel0 (ctl[1]), .data0 (in_0[10]), .sel1 (ctl[0]),
       .data1 (in_1[10]), .z (z[10]));
  CDN_mux2 g22(.sel0 (ctl[1]), .data0 (in_0[9]), .sel1 (ctl[0]), .data1
       (in_1[9]), .z (z[9]));
  CDN_mux2 g23(.sel0 (ctl[1]), .data0 (in_0[8]), .sel1 (ctl[0]), .data1
       (in_1[8]), .z (z[8]));
  CDN_mux2 g24(.sel0 (ctl[1]), .data0 (in_0[7]), .sel1 (ctl[0]), .data1
       (in_1[7]), .z (z[7]));
  CDN_mux2 g25(.sel0 (ctl[1]), .data0 (in_0[6]), .sel1 (ctl[0]), .data1
       (in_1[6]), .z (z[6]));
  CDN_mux2 g26(.sel0 (ctl[1]), .data0 (in_0[5]), .sel1 (ctl[0]), .data1
       (in_1[5]), .z (z[5]));
  CDN_mux2 g27(.sel0 (ctl[1]), .data0 (in_0[4]), .sel1 (ctl[0]), .data1
       (in_1[4]), .z (z[4]));
  CDN_mux2 g28(.sel0 (ctl[1]), .data0 (in_0[3]), .sel1 (ctl[0]), .data1
       (in_1[3]), .z (z[3]));
  CDN_mux2 g29(.sel0 (ctl[1]), .data0 (in_0[2]), .sel1 (ctl[0]), .data1
       (in_1[2]), .z (z[2]));
  CDN_mux2 g30(.sel0 (ctl[1]), .data0 (in_0[1]), .sel1 (ctl[0]), .data1
       (in_1[1]), .z (z[1]));
  CDN_mux2 g31(.sel0 (ctl[1]), .data0 (in_0[0]), .sel1 (ctl[0]), .data1
       (in_1[0]), .z (z[0]));
endmodule

module Mux_0xdd6473406d1a99a(clk, in_$000, in_$001, out, reset, sel);
  input [0:0] clk, reset, sel;
  input [15:0] in_$000, in_$001;
  output [15:0] out;
  wire [0:0] clk, reset, sel;
  wire [15:0] in_$000, in_$001;
  wire [15:0] out;
  wire n_2;
  mux_30 \mux_in_[sel]_727_11 (.ctl ({n_2, sel}), .in_0 (in_$000),
       .in_1 (in_$001), .z (out));
  assign n_2 = ~(sel);
endmodule

module sub_unsigned(A, B, Z);
  input [15:0] A, B;
  output [15:0] Z;
  wire [15:0] A, B;
  wire [15:0] Z;
  wire n_51, n_52, n_53, n_54, n_55, n_56, n_57, n_58;
  wire n_59, n_60, n_61, n_62, n_63, n_64, n_65, n_66;
  wire n_69, n_71, n_72, n_73, n_74, n_75, n_76, n_77;
  wire n_78, n_79, n_80, n_81, n_82, n_83, n_84, n_85;
  wire n_86, n_87, n_88, n_89, n_90, n_91, n_92, n_93;
  wire n_94, n_95, n_96, n_97, n_98, n_99, n_100, n_101;
  wire n_102, n_103, n_104, n_105, n_106, n_107, n_108, n_109;
  wire n_110, n_111, n_112, n_113, n_114, n_117, n_118, n_119;
  wire n_120, n_121, n_122, n_123, n_124, n_125, n_126, n_127;
  wire n_128, n_129, n_130, n_131, n_132, n_133, n_134, n_135;
  wire n_136, n_137, n_138, n_139, n_140, n_141, n_142, n_143;
  wire n_144, n_145, n_146, n_147, n_148, n_154, n_155, n_156;
  wire n_157, n_158, n_159, n_160, n_161, n_162, n_163, n_164;
  wire n_165, n_166, n_167, n_168, n_169, n_170, n_171, n_172;
  wire n_173, n_174, n_175, n_176, n_181, n_182, n_183, n_184;
  wire n_185, n_186, n_187, n_188, n_189, n_190, n_191, n_192;
  wire n_193, n_194, n_195, n_196, n_197, n_198, n_199, n_203;
  wire n_204, n_205, n_206, n_207, n_208, n_209, n_210, n_211;
  wire n_212, n_213, n_214, n_215, n_216, n_217, n_218, n_219;
  wire n_220, n_221, n_222, n_223, n_224, n_225, n_226, n_227;
  wire n_228, n_229, n_230, n_231, n_232, n_233, n_234, n_235;
  wire n_236, n_237;
  assign n_51 = ~(B[15]);
  assign n_52 = ~(B[14]);
  assign n_53 = ~(B[13]);
  assign n_54 = ~(B[12]);
  assign n_55 = ~(B[11]);
  assign n_56 = ~(B[10]);
  assign n_57 = ~(B[9]);
  assign n_58 = ~(B[8]);
  assign n_59 = ~(B[7]);
  assign n_60 = ~(B[6]);
  assign n_61 = ~(B[5]);
  assign n_62 = ~(B[4]);
  assign n_63 = ~(B[3]);
  assign n_64 = ~(B[2]);
  assign n_65 = ~(B[1]);
  assign n_66 = ~(B[0]);
  assign n_237 = A[0] ^ n_66;
  assign n_72 = ~(n_69 & B[0]);
  assign n_71 = ~(A[1] | n_65);
  assign n_74 = ~(A[1] & n_65);
  assign n_81 = ~(A[2] | n_64);
  assign n_76 = ~(A[2] & n_64);
  assign n_77 = ~(A[3] | n_63);
  assign n_78 = ~(A[3] & n_63);
  assign n_87 = ~(A[4] | n_62);
  assign n_82 = ~(A[4] & n_62);
  assign n_83 = ~(A[5] | n_61);
  assign n_84 = ~(A[5] & n_61);
  assign n_93 = ~(A[6] | n_60);
  assign n_88 = ~(A[6] & n_60);
  assign n_89 = ~(A[7] | n_59);
  assign n_90 = ~(A[7] & n_59);
  assign n_99 = ~(A[8] | n_58);
  assign n_94 = ~(A[8] & n_58);
  assign n_95 = ~(A[9] | n_57);
  assign n_96 = ~(A[9] & n_57);
  assign n_105 = ~(A[10] | n_56);
  assign n_100 = ~(A[10] & n_56);
  assign n_101 = ~(A[11] | n_55);
  assign n_102 = ~(A[11] & n_55);
  assign n_111 = ~(A[12] | n_54);
  assign n_106 = ~(A[12] & n_54);
  assign n_107 = ~(A[13] | n_53);
  assign n_108 = ~(A[13] & n_53);
  assign n_117 = ~(A[14] | n_52);
  assign n_112 = ~(A[14] & n_52);
  assign n_113 = ~(A[15] | n_51);
  assign n_114 = ~(A[15] & n_51);
  assign n_73 = ~(n_71);
  assign n_75 = ~(n_72 & n_73);
  assign n_118 = ~(n_74 & n_75);
  assign n_79 = ~(n_76 | n_77);
  assign n_80 = ~(n_78);
  assign n_122 = ~(n_79 | n_80);
  assign n_121 = ~(n_81 | n_77);
  assign n_85 = ~(n_82 | n_83);
  assign n_86 = ~(n_84);
  assign n_124 = ~(n_85 | n_86);
  assign n_127 = ~(n_87 | n_83);
  assign n_91 = ~(n_88 | n_89);
  assign n_92 = ~(n_90);
  assign n_131 = ~(n_91 | n_92);
  assign n_129 = ~(n_93 | n_89);
  assign n_97 = ~(n_94 | n_95);
  assign n_98 = ~(n_96);
  assign n_134 = ~(n_97 | n_98);
  assign n_137 = ~(n_99 | n_95);
  assign n_103 = ~(n_100 | n_101);
  assign n_104 = ~(n_102);
  assign n_141 = ~(n_103 | n_104);
  assign n_139 = ~(n_105 | n_101);
  assign n_109 = ~(n_106 | n_107);
  assign n_110 = ~(n_108);
  assign n_144 = ~(n_109 | n_110);
  assign n_147 = ~(n_111 | n_107);
  assign n_119 = ~(n_81);
  assign n_120 = ~(n_118 & n_119);
  assign n_206 = ~(n_76 & n_120);
  assign n_123 = ~(n_121 & n_118);
  assign n_154 = ~(n_122 & n_123);
  assign n_125 = ~(n_93 | n_124);
  assign n_126 = ~(n_88);
  assign n_160 = ~(n_125 | n_126);
  assign n_128 = ~(n_93);
  assign n_158 = ~(n_127 & n_128);
  assign n_130 = ~(n_129);
  assign n_132 = ~(n_124 | n_130);
  assign n_133 = ~(n_131);
  assign n_164 = ~(n_132 | n_133);
  assign n_162 = ~(n_127 & n_129);
  assign n_135 = ~(n_105 | n_134);
  assign n_136 = ~(n_100);
  assign n_187 = ~(n_135 | n_136);
  assign n_138 = ~(n_105);
  assign n_185 = ~(n_137 & n_138);
  assign n_140 = ~(n_139);
  assign n_142 = ~(n_134 | n_140);
  assign n_143 = ~(n_141);
  assign n_166 = ~(n_142 | n_143);
  assign n_169 = ~(n_137 & n_139);
  assign n_145 = ~(n_117 | n_144);
  assign n_146 = ~(n_112);
  assign n_174 = ~(n_145 | n_146);
  assign n_148 = ~(n_117);
  assign n_173 = ~(n_147 & n_148);
  assign n_155 = ~(n_87);
  assign n_156 = ~(n_154 & n_155);
  assign n_210 = ~(n_82 & n_156);
  assign n_157 = ~(n_127 & n_154);
  assign n_212 = ~(n_124 & n_157);
  assign n_159 = ~(n_158);
  assign n_161 = ~(n_154 & n_159);
  assign n_215 = ~(n_160 & n_161);
  assign n_163 = ~(n_162);
  assign n_165 = ~(n_154 & n_163);
  assign n_181 = ~(n_164 & n_165);
  assign n_167 = ~(n_111 | n_166);
  assign n_168 = ~(n_106);
  assign n_192 = ~(n_167 | n_168);
  assign n_191 = ~(n_111 | n_169);
  assign n_170 = ~(n_147);
  assign n_171 = ~(n_166 | n_170);
  assign n_172 = ~(n_144);
  assign n_195 = ~(n_171 | n_172);
  assign n_194 = ~(n_169 | n_170);
  assign n_175 = ~(n_173 | n_166);
  assign n_176 = ~(n_174);
  assign n_198 = ~(n_175 | n_176);
  assign n_197 = ~(n_169 | n_173);
  assign n_182 = ~(n_99);
  assign n_183 = ~(n_181 & n_182);
  assign n_219 = ~(n_94 & n_183);
  assign n_184 = ~(n_137 & n_181);
  assign n_221 = ~(n_134 & n_184);
  assign n_186 = ~(n_185);
  assign n_188 = ~(n_181 & n_186);
  assign n_224 = ~(n_187 & n_188);
  assign n_189 = ~(n_169);
  assign n_190 = ~(n_181 & n_189);
  assign n_227 = ~(n_166 & n_190);
  assign n_193 = ~(n_191 & n_181);
  assign n_230 = ~(n_192 & n_193);
  assign n_196 = ~(n_194 & n_181);
  assign n_232 = ~(n_195 & n_196);
  assign n_199 = ~(n_197 & n_181);
  assign n_235 = ~(n_198 & n_199);
  assign n_203 = ~(n_73 & n_74);
  assign Z[1] = ~(n_72 ^ n_203);
  assign n_204 = ~(n_119 & n_76);
  assign Z[2] = ~(n_118 ^ n_204);
  assign n_205 = ~(n_77);
  assign n_207 = ~(n_205 & n_78);
  assign Z[3] = ~(n_206 ^ n_207);
  assign n_208 = ~(n_155 & n_82);
  assign Z[4] = ~(n_154 ^ n_208);
  assign n_209 = ~(n_83);
  assign n_211 = ~(n_209 & n_84);
  assign Z[5] = ~(n_210 ^ n_211);
  assign n_213 = ~(n_128 & n_88);
  assign Z[6] = ~(n_212 ^ n_213);
  assign n_214 = ~(n_89);
  assign n_216 = ~(n_214 & n_90);
  assign Z[7] = ~(n_215 ^ n_216);
  assign n_217 = ~(n_182 & n_94);
  assign Z[8] = ~(n_181 ^ n_217);
  assign n_218 = ~(n_95);
  assign n_220 = ~(n_218 & n_96);
  assign Z[9] = ~(n_219 ^ n_220);
  assign n_222 = ~(n_138 & n_100);
  assign Z[10] = ~(n_221 ^ n_222);
  assign n_223 = ~(n_101);
  assign n_225 = ~(n_223 & n_102);
  assign Z[11] = ~(n_224 ^ n_225);
  assign n_226 = ~(n_111);
  assign n_228 = ~(n_226 & n_106);
  assign Z[12] = ~(n_227 ^ n_228);
  assign n_229 = ~(n_107);
  assign n_231 = ~(n_229 & n_108);
  assign Z[13] = ~(n_230 ^ n_231);
  assign n_233 = ~(n_148 & n_112);
  assign Z[14] = ~(n_232 ^ n_233);
  assign n_234 = ~(n_113);
  assign n_236 = ~(n_234 & n_114);
  assign Z[15] = ~(n_235 ^ n_236);
  assign n_69 = ~(A[0]);
  assign Z[0] = ~(n_237);
endmodule

module Subtractor_0x422b1f52edd46a85(clk, in0, in1, out, reset);
  input [0:0] clk, reset;
  input [15:0] in0, in1;
  output [15:0] out;
  wire [0:0] clk, reset;
  wire [15:0] in0, in1;
  wire [15:0] out;
  sub_unsigned sub_758_15(.A (in0), .B (in1), .Z (out));
endmodule

module GcdUnitDpathRTL_0x4d0fc71ead8d3d9e(a_mux_sel, a_reg_en,
     b_mux_sel, b_reg_en, clk, is_a_lt_b, is_b_zero, req_msg_a,
     req_msg_b, reset, resp_msg);
  input [1:0] a_mux_sel;
  input [0:0] a_reg_en, b_mux_sel, b_reg_en, clk, reset;
  input [15:0] req_msg_a, req_msg_b;
  output [0:0] is_a_lt_b, is_b_zero;
  output [15:0] resp_msg;
  wire [1:0] a_mux_sel;
  wire [0:0] a_reg_en, b_mux_sel, b_reg_en, clk, reset;
  wire [15:0] req_msg_a, req_msg_b;
  wire [0:0] is_a_lt_b, is_b_zero;
  wire [15:0] resp_msg;
  wire [15:0] a_mux$out;
  wire [15:0] a_reg$out;
  wire [15:0] b_reg$out;
  wire [15:0] b_mux$out;
  RegEn_0x68db79c4ec1d6e5b a_reg(.clk (clk), .en (a_reg_en), .in_
       (a_mux$out), .out (a_reg$out), .reset (reset));
  LtComparator_0x422b1f52edd46a85 a_lt_b(.clk (clk), .in0 (a_reg$out),
       .in1 (b_reg$out), .out (is_a_lt_b), .reset (reset));
  ZeroComparator_0x422b1f52edd46a85 b_zero(.clk (clk), .in_
       (b_reg$out), .out (is_b_zero), .reset (reset));
  Mux_0x683fa1a418b072c9 a_mux(.clk (clk), .in_$000 (req_msg_a),
       .in_$001 (resp_msg), .in_$002 (b_reg$out), .out (a_mux$out),
       .reset (reset), .sel (a_mux_sel));
  Mux_0xdd6473406d1a99a b_mux(.clk (clk), .in_$000 (a_reg$out),
       .in_$001 (req_msg_b), .out (b_mux$out), .reset (reset), .sel
       (b_mux_sel));
  Subtractor_0x422b1f52edd46a85 sub(.clk (clk), .in0 (a_reg$out), .in1
       (b_reg$out), .out (resp_msg), .reset (reset));
  RegEn_0x68db79c4ec1d6e5b b_reg(.clk (clk), .en (b_reg_en), .in_
       (b_mux$out), .out (b_reg$out), .reset (reset));
endmodule

module gcd(clk, req_msg, req_rdy, req_val, reset, resp_msg, resp_rdy,
     resp_val);
  input clk, req_val, reset, resp_rdy;
  input [31:0] req_msg;
  output req_rdy, resp_val;
  output [15:0] resp_msg;
  wire clk, req_val, reset, resp_rdy;
  wire [31:0] req_msg;
  wire req_rdy, resp_val;
  wire [15:0] resp_msg;
  wire [0:0] dpath$is_a_lt_b;
  wire [0:0] dpath$is_b_zero;
  wire [1:0] dpath$a_mux_sel;
  wire [1:0] ctrl$a_mux_sel;
  wire [0:0] ctrl$a_reg_en;
  wire [0:0] ctrl$b_mux_sel;
  wire [0:0] ctrl$b_reg_en;
  GcdUnitCtrlRTL_0x4d0fc71ead8d3d9e ctrl(.a_mux_sel
       ({dpath$a_mux_sel[1], ctrl$a_mux_sel[0]}), .a_reg_en
       (ctrl$a_reg_en), .b_mux_sel (ctrl$b_mux_sel), .b_reg_en
       (ctrl$b_reg_en), .clk (clk), .is_a_lt_b (dpath$is_a_lt_b),
       .is_b_zero (dpath$is_b_zero), .req_rdy (req_rdy), .req_val
       (req_val), .reset (reset), .resp_rdy (resp_rdy), .resp_val
       (resp_val));
  GcdUnitDpathRTL_0x4d0fc71ead8d3d9e dpath(.a_mux_sel
       ({dpath$a_mux_sel[1], ctrl$a_mux_sel[0]}), .a_reg_en
       (ctrl$a_reg_en), .b_mux_sel (ctrl$b_mux_sel), .b_reg_en
       (ctrl$b_reg_en), .clk (clk), .is_a_lt_b (dpath$is_a_lt_b),
       .is_b_zero (dpath$is_b_zero), .req_msg_a (req_msg[31:16]),
       .req_msg_b (req_msg[15:0]), .reset (reset), .resp_msg
       (resp_msg));
endmodule

`ifdef RC_CDN_GENERIC_GATE
`else
module CDN_flop(clk, d, sena, aclr, apre, srl, srd, q);
  input clk, d, sena, aclr, apre, srl, srd;
  output q;
  wire clk, d, sena, aclr, apre, srl, srd;
  wire q;
  reg  qi;
  assign #1 q = qi;
  always 
    @(posedge clk or posedge apre or posedge aclr) 
      if (aclr) 
        qi <= 0;
      else if (apre) 
          qi <= 1;
        else if (srl) 
            qi <= srd;
          else begin
            if (sena) 
              qi <= d;
          end
  initial 
    qi <= 1'b0;
endmodule
`endif
`ifdef RC_CDN_GENERIC_GATE
`else
`ifdef ONE_HOT_MUX // captures one-hot property of select inputs
module CDN_mux4(sel0, data0, sel1, data1, sel2, data2, sel3, data3, z);
  input sel0, data0, sel1, data1, sel2, data2, sel3, data3;
  output z;
  wire sel0, data0, sel1, data1, sel2, data2, sel3, data3;
  reg  z;
  always 
    @(sel0 or sel1 or sel2 or sel3 or data0 or data1 or data2 or data3) 
      case ({sel0, sel1, sel2, sel3})
       4'b1000: z = data0;
       4'b0100: z = data1;
       4'b0010: z = data2;
       4'b0001: z = data3;
       default: z = 1'bX;
      endcase
endmodule
`else
module CDN_mux4(sel0, data0, sel1, data1, sel2, data2, sel3, data3, z);
  input sel0, data0, sel1, data1, sel2, data2, sel3, data3;
  output z;
  wire sel0, data0, sel1, data1, sel2, data2, sel3, data3;
  wire z;
  wire w_0, w_1, w_2, w_3;
  assign w_0 = sel0 & data0;
  assign w_1 = sel1 & data1;
  assign w_2 = sel2 & data2;
  assign w_3 = sel3 & data3;
  assign z = w_0 | w_1 | w_2 | w_3;
endmodule
`endif // ONE_HOT_MUX
`endif
`ifdef RC_CDN_GENERIC_GATE
`else
`ifdef ONE_HOT_MUX // captures one-hot property of select inputs
module CDN_mux3(sel0, data0, sel1, data1, sel2, data2, z);
  input sel0, data0, sel1, data1, sel2, data2;
  output z;
  wire sel0, data0, sel1, data1, sel2, data2;
  reg  z;
  always 
    @(sel0 or sel1 or sel2 or data0 or data1 or data2) 
      case ({sel0, sel1, sel2})
       3'b100: z = data0;
       3'b010: z = data1;
       3'b001: z = data2;
       default: z = 1'bX;
      endcase
endmodule
`else
module CDN_mux3(sel0, data0, sel1, data1, sel2, data2, z);
  input sel0, data0, sel1, data1, sel2, data2;
  output z;
  wire sel0, data0, sel1, data1, sel2, data2;
  wire z;
  wire w_0, w_1, w_2;
  assign w_0 = sel0 & data0;
  assign w_1 = sel1 & data1;
  assign w_2 = sel2 & data2;
  assign z = w_0 | w_1 | w_2;
endmodule
`endif // ONE_HOT_MUX
`endif
`ifdef RC_CDN_GENERIC_GATE
`else
`ifdef ONE_HOT_MUX // captures one-hot property of select inputs
module CDN_mux2(sel0, data0, sel1, data1, z);
  input sel0, data0, sel1, data1;
  output z;
  wire sel0, data0, sel1, data1;
  reg  z;
  always 
    @(sel0 or sel1 or data0 or data1) 
      case ({sel0, sel1})
       2'b10: z = data0;
       2'b01: z = data1;
       default: z = 1'bX;
      endcase
endmodule
`else
module CDN_mux2(sel0, data0, sel1, data1, z);
  input sel0, data0, sel1, data1;
  output z;
  wire sel0, data0, sel1, data1;
  wire z;
  wire w_0, w_1;
  assign w_0 = sel0 & data0;
  assign w_1 = sel1 & data1;
  assign z = w_0 | w_1;
endmodule
`endif // ONE_HOT_MUX
`endif
`ifdef RC_CDN_GENERIC_GATE
`else
`ifdef ONE_HOT_MUX
module CDN_bmux2(sel0, data0, data1, z);
  input sel0, data0, data1;
  output z;
  wire sel0, data0, data1;
  reg  z;
  always 
    @(sel0 or data0 or data1) 
      case ({sel0})
       1'b0: z = data0;
       1'b1: z = data1;
      endcase
endmodule
`else
module CDN_bmux2(sel0, data0, data1, z);
  input sel0, data0, data1;
  output z;
  wire sel0, data0, data1;
  wire z;
  wire inv_sel0, w_0, w_1;
  assign inv_sel0 = ~(sel0);
  assign w_0 = inv_sel0 & data0;
  assign w_1 = sel0 & data1;
  assign z = w_0 | w_1;
endmodule
`endif // ONE_HOT_MUX
`endif
`ifdef RC_CDN_GENERIC_GATE
`else
`ifdef ONE_HOT_MUX
module CDN_bmux4(sel0, data0, data1, sel1, data2, data3, z);
  input sel0, data0, data1, sel1, data2, data3;
  output z;
  wire sel0, data0, data1, sel1, data2, data3;
  reg  z;
  always 
    @(sel0 or sel1 or data0 or data1 or data2 or data3) 
      case ({sel0, sel1})
       2'b00: z = data0;
       2'b10: z = data1;
       2'b01: z = data2;
       2'b11: z = data3;
      endcase
endmodule
`else
module CDN_bmux4(sel0, data0, data1, sel1, data2, data3, z);
  input sel0, data0, data1, sel1, data2, data3;
  output z;
  wire sel0, data0, data1, sel1, data2, data3;
  wire z;
  wire inv_sel0, inv_sel1, w_0, w_1, w_2, w_3;
  assign inv_sel0 = ~(sel0);
  assign inv_sel1 = ~(sel1);
  assign w_0 = inv_sel1 & inv_sel0 & data0;
  assign w_1 = inv_sel1 & sel0 & data1;
  assign w_2 = sel1 & inv_sel0 & data2;
  assign w_3 = sel1 & sel0 & data3;
  assign z = w_0 | w_1 | w_2 | w_3;
endmodule
`endif // ONE_HOT_MUX
`endif
