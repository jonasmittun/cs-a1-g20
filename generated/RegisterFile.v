module RegisterFile(
  input         clock,
  input         reset,
  input  [4:0]  io_aSel,
  input  [4:0]  io_bSel,
  input  [31:0] io_writeData,
  input  [4:0]  io_writeSel,
  input         io_writeEnable,
  output [31:0] io_aOut,
  output [31:0] io_bOut
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_6;
  reg [31:0] _RAND_7;
  reg [31:0] _RAND_8;
  reg [31:0] _RAND_9;
  reg [31:0] _RAND_10;
  reg [31:0] _RAND_11;
  reg [31:0] _RAND_12;
  reg [31:0] _RAND_13;
  reg [31:0] _RAND_14;
  reg [31:0] _RAND_15;
  reg [31:0] _RAND_16;
  reg [31:0] _RAND_17;
  reg [31:0] _RAND_18;
  reg [31:0] _RAND_19;
  reg [31:0] _RAND_20;
  reg [31:0] _RAND_21;
  reg [31:0] _RAND_22;
  reg [31:0] _RAND_23;
  reg [31:0] _RAND_24;
  reg [31:0] _RAND_25;
  reg [31:0] _RAND_26;
  reg [31:0] _RAND_27;
  reg [31:0] _RAND_28;
  reg [31:0] _RAND_29;
  reg [31:0] _RAND_30;
  reg [31:0] _RAND_31;
`endif // RANDOMIZE_REG_INIT
  reg [31:0] reg_0; // @[RegisterFile.scala 18:20]
  reg [31:0] reg_1; // @[RegisterFile.scala 18:20]
  reg [31:0] reg_2; // @[RegisterFile.scala 18:20]
  reg [31:0] reg_3; // @[RegisterFile.scala 18:20]
  reg [31:0] reg_4; // @[RegisterFile.scala 18:20]
  reg [31:0] reg_5; // @[RegisterFile.scala 18:20]
  reg [31:0] reg_6; // @[RegisterFile.scala 18:20]
  reg [31:0] reg_7; // @[RegisterFile.scala 18:20]
  reg [31:0] reg_8; // @[RegisterFile.scala 18:20]
  reg [31:0] reg_9; // @[RegisterFile.scala 18:20]
  reg [31:0] reg_10; // @[RegisterFile.scala 18:20]
  reg [31:0] reg_11; // @[RegisterFile.scala 18:20]
  reg [31:0] reg_12; // @[RegisterFile.scala 18:20]
  reg [31:0] reg_13; // @[RegisterFile.scala 18:20]
  reg [31:0] reg_14; // @[RegisterFile.scala 18:20]
  reg [31:0] reg_15; // @[RegisterFile.scala 18:20]
  reg [31:0] reg_16; // @[RegisterFile.scala 18:20]
  reg [31:0] reg_17; // @[RegisterFile.scala 18:20]
  reg [31:0] reg_18; // @[RegisterFile.scala 18:20]
  reg [31:0] reg_19; // @[RegisterFile.scala 18:20]
  reg [31:0] reg_20; // @[RegisterFile.scala 18:20]
  reg [31:0] reg_21; // @[RegisterFile.scala 18:20]
  reg [31:0] reg_22; // @[RegisterFile.scala 18:20]
  reg [31:0] reg_23; // @[RegisterFile.scala 18:20]
  reg [31:0] reg_24; // @[RegisterFile.scala 18:20]
  reg [31:0] reg_25; // @[RegisterFile.scala 18:20]
  reg [31:0] reg_26; // @[RegisterFile.scala 18:20]
  reg [31:0] reg_27; // @[RegisterFile.scala 18:20]
  reg [31:0] reg_28; // @[RegisterFile.scala 18:20]
  reg [31:0] reg_29; // @[RegisterFile.scala 18:20]
  reg [31:0] reg_30; // @[RegisterFile.scala 18:20]
  reg [31:0] reg_31; // @[RegisterFile.scala 18:20]
  wire [31:0] _GEN_1 = 5'h1 == io_aSel ? reg_1 : reg_0; // @[RegisterFile.scala 20:11]
  wire [31:0] _GEN_2 = 5'h2 == io_aSel ? reg_2 : _GEN_1; // @[RegisterFile.scala 20:11]
  wire [31:0] _GEN_3 = 5'h3 == io_aSel ? reg_3 : _GEN_2; // @[RegisterFile.scala 20:11]
  wire [31:0] _GEN_4 = 5'h4 == io_aSel ? reg_4 : _GEN_3; // @[RegisterFile.scala 20:11]
  wire [31:0] _GEN_5 = 5'h5 == io_aSel ? reg_5 : _GEN_4; // @[RegisterFile.scala 20:11]
  wire [31:0] _GEN_6 = 5'h6 == io_aSel ? reg_6 : _GEN_5; // @[RegisterFile.scala 20:11]
  wire [31:0] _GEN_7 = 5'h7 == io_aSel ? reg_7 : _GEN_6; // @[RegisterFile.scala 20:11]
  wire [31:0] _GEN_8 = 5'h8 == io_aSel ? reg_8 : _GEN_7; // @[RegisterFile.scala 20:11]
  wire [31:0] _GEN_9 = 5'h9 == io_aSel ? reg_9 : _GEN_8; // @[RegisterFile.scala 20:11]
  wire [31:0] _GEN_10 = 5'ha == io_aSel ? reg_10 : _GEN_9; // @[RegisterFile.scala 20:11]
  wire [31:0] _GEN_11 = 5'hb == io_aSel ? reg_11 : _GEN_10; // @[RegisterFile.scala 20:11]
  wire [31:0] _GEN_12 = 5'hc == io_aSel ? reg_12 : _GEN_11; // @[RegisterFile.scala 20:11]
  wire [31:0] _GEN_13 = 5'hd == io_aSel ? reg_13 : _GEN_12; // @[RegisterFile.scala 20:11]
  wire [31:0] _GEN_14 = 5'he == io_aSel ? reg_14 : _GEN_13; // @[RegisterFile.scala 20:11]
  wire [31:0] _GEN_15 = 5'hf == io_aSel ? reg_15 : _GEN_14; // @[RegisterFile.scala 20:11]
  wire [31:0] _GEN_16 = 5'h10 == io_aSel ? reg_16 : _GEN_15; // @[RegisterFile.scala 20:11]
  wire [31:0] _GEN_17 = 5'h11 == io_aSel ? reg_17 : _GEN_16; // @[RegisterFile.scala 20:11]
  wire [31:0] _GEN_18 = 5'h12 == io_aSel ? reg_18 : _GEN_17; // @[RegisterFile.scala 20:11]
  wire [31:0] _GEN_19 = 5'h13 == io_aSel ? reg_19 : _GEN_18; // @[RegisterFile.scala 20:11]
  wire [31:0] _GEN_20 = 5'h14 == io_aSel ? reg_20 : _GEN_19; // @[RegisterFile.scala 20:11]
  wire [31:0] _GEN_21 = 5'h15 == io_aSel ? reg_21 : _GEN_20; // @[RegisterFile.scala 20:11]
  wire [31:0] _GEN_22 = 5'h16 == io_aSel ? reg_22 : _GEN_21; // @[RegisterFile.scala 20:11]
  wire [31:0] _GEN_23 = 5'h17 == io_aSel ? reg_23 : _GEN_22; // @[RegisterFile.scala 20:11]
  wire [31:0] _GEN_24 = 5'h18 == io_aSel ? reg_24 : _GEN_23; // @[RegisterFile.scala 20:11]
  wire [31:0] _GEN_25 = 5'h19 == io_aSel ? reg_25 : _GEN_24; // @[RegisterFile.scala 20:11]
  wire [31:0] _GEN_26 = 5'h1a == io_aSel ? reg_26 : _GEN_25; // @[RegisterFile.scala 20:11]
  wire [31:0] _GEN_27 = 5'h1b == io_aSel ? reg_27 : _GEN_26; // @[RegisterFile.scala 20:11]
  wire [31:0] _GEN_28 = 5'h1c == io_aSel ? reg_28 : _GEN_27; // @[RegisterFile.scala 20:11]
  wire [31:0] _GEN_29 = 5'h1d == io_aSel ? reg_29 : _GEN_28; // @[RegisterFile.scala 20:11]
  wire [31:0] _GEN_30 = 5'h1e == io_aSel ? reg_30 : _GEN_29; // @[RegisterFile.scala 20:11]
  wire [31:0] _GEN_33 = 5'h1 == io_bSel ? reg_1 : reg_0; // @[RegisterFile.scala 21:11]
  wire [31:0] _GEN_34 = 5'h2 == io_bSel ? reg_2 : _GEN_33; // @[RegisterFile.scala 21:11]
  wire [31:0] _GEN_35 = 5'h3 == io_bSel ? reg_3 : _GEN_34; // @[RegisterFile.scala 21:11]
  wire [31:0] _GEN_36 = 5'h4 == io_bSel ? reg_4 : _GEN_35; // @[RegisterFile.scala 21:11]
  wire [31:0] _GEN_37 = 5'h5 == io_bSel ? reg_5 : _GEN_36; // @[RegisterFile.scala 21:11]
  wire [31:0] _GEN_38 = 5'h6 == io_bSel ? reg_6 : _GEN_37; // @[RegisterFile.scala 21:11]
  wire [31:0] _GEN_39 = 5'h7 == io_bSel ? reg_7 : _GEN_38; // @[RegisterFile.scala 21:11]
  wire [31:0] _GEN_40 = 5'h8 == io_bSel ? reg_8 : _GEN_39; // @[RegisterFile.scala 21:11]
  wire [31:0] _GEN_41 = 5'h9 == io_bSel ? reg_9 : _GEN_40; // @[RegisterFile.scala 21:11]
  wire [31:0] _GEN_42 = 5'ha == io_bSel ? reg_10 : _GEN_41; // @[RegisterFile.scala 21:11]
  wire [31:0] _GEN_43 = 5'hb == io_bSel ? reg_11 : _GEN_42; // @[RegisterFile.scala 21:11]
  wire [31:0] _GEN_44 = 5'hc == io_bSel ? reg_12 : _GEN_43; // @[RegisterFile.scala 21:11]
  wire [31:0] _GEN_45 = 5'hd == io_bSel ? reg_13 : _GEN_44; // @[RegisterFile.scala 21:11]
  wire [31:0] _GEN_46 = 5'he == io_bSel ? reg_14 : _GEN_45; // @[RegisterFile.scala 21:11]
  wire [31:0] _GEN_47 = 5'hf == io_bSel ? reg_15 : _GEN_46; // @[RegisterFile.scala 21:11]
  wire [31:0] _GEN_48 = 5'h10 == io_bSel ? reg_16 : _GEN_47; // @[RegisterFile.scala 21:11]
  wire [31:0] _GEN_49 = 5'h11 == io_bSel ? reg_17 : _GEN_48; // @[RegisterFile.scala 21:11]
  wire [31:0] _GEN_50 = 5'h12 == io_bSel ? reg_18 : _GEN_49; // @[RegisterFile.scala 21:11]
  wire [31:0] _GEN_51 = 5'h13 == io_bSel ? reg_19 : _GEN_50; // @[RegisterFile.scala 21:11]
  wire [31:0] _GEN_52 = 5'h14 == io_bSel ? reg_20 : _GEN_51; // @[RegisterFile.scala 21:11]
  wire [31:0] _GEN_53 = 5'h15 == io_bSel ? reg_21 : _GEN_52; // @[RegisterFile.scala 21:11]
  wire [31:0] _GEN_54 = 5'h16 == io_bSel ? reg_22 : _GEN_53; // @[RegisterFile.scala 21:11]
  wire [31:0] _GEN_55 = 5'h17 == io_bSel ? reg_23 : _GEN_54; // @[RegisterFile.scala 21:11]
  wire [31:0] _GEN_56 = 5'h18 == io_bSel ? reg_24 : _GEN_55; // @[RegisterFile.scala 21:11]
  wire [31:0] _GEN_57 = 5'h19 == io_bSel ? reg_25 : _GEN_56; // @[RegisterFile.scala 21:11]
  wire [31:0] _GEN_58 = 5'h1a == io_bSel ? reg_26 : _GEN_57; // @[RegisterFile.scala 21:11]
  wire [31:0] _GEN_59 = 5'h1b == io_bSel ? reg_27 : _GEN_58; // @[RegisterFile.scala 21:11]
  wire [31:0] _GEN_60 = 5'h1c == io_bSel ? reg_28 : _GEN_59; // @[RegisterFile.scala 21:11]
  wire [31:0] _GEN_61 = 5'h1d == io_bSel ? reg_29 : _GEN_60; // @[RegisterFile.scala 21:11]
  wire [31:0] _GEN_62 = 5'h1e == io_bSel ? reg_30 : _GEN_61; // @[RegisterFile.scala 21:11]
  wire [31:0] _GEN_129 = 5'h1 == io_writeSel ? reg_1 : reg_0; // @[RegisterFile.scala 26:22]
  wire [31:0] _GEN_130 = 5'h2 == io_writeSel ? reg_2 : _GEN_129; // @[RegisterFile.scala 26:22]
  wire [31:0] _GEN_131 = 5'h3 == io_writeSel ? reg_3 : _GEN_130; // @[RegisterFile.scala 26:22]
  wire [31:0] _GEN_132 = 5'h4 == io_writeSel ? reg_4 : _GEN_131; // @[RegisterFile.scala 26:22]
  wire [31:0] _GEN_133 = 5'h5 == io_writeSel ? reg_5 : _GEN_132; // @[RegisterFile.scala 26:22]
  wire [31:0] _GEN_134 = 5'h6 == io_writeSel ? reg_6 : _GEN_133; // @[RegisterFile.scala 26:22]
  wire [31:0] _GEN_135 = 5'h7 == io_writeSel ? reg_7 : _GEN_134; // @[RegisterFile.scala 26:22]
  wire [31:0] _GEN_136 = 5'h8 == io_writeSel ? reg_8 : _GEN_135; // @[RegisterFile.scala 26:22]
  wire [31:0] _GEN_137 = 5'h9 == io_writeSel ? reg_9 : _GEN_136; // @[RegisterFile.scala 26:22]
  wire [31:0] _GEN_138 = 5'ha == io_writeSel ? reg_10 : _GEN_137; // @[RegisterFile.scala 26:22]
  wire [31:0] _GEN_139 = 5'hb == io_writeSel ? reg_11 : _GEN_138; // @[RegisterFile.scala 26:22]
  wire [31:0] _GEN_140 = 5'hc == io_writeSel ? reg_12 : _GEN_139; // @[RegisterFile.scala 26:22]
  wire [31:0] _GEN_141 = 5'hd == io_writeSel ? reg_13 : _GEN_140; // @[RegisterFile.scala 26:22]
  wire [31:0] _GEN_142 = 5'he == io_writeSel ? reg_14 : _GEN_141; // @[RegisterFile.scala 26:22]
  wire [31:0] _GEN_143 = 5'hf == io_writeSel ? reg_15 : _GEN_142; // @[RegisterFile.scala 26:22]
  wire [31:0] _GEN_144 = 5'h10 == io_writeSel ? reg_16 : _GEN_143; // @[RegisterFile.scala 26:22]
  wire [31:0] _GEN_145 = 5'h11 == io_writeSel ? reg_17 : _GEN_144; // @[RegisterFile.scala 26:22]
  wire [31:0] _GEN_146 = 5'h12 == io_writeSel ? reg_18 : _GEN_145; // @[RegisterFile.scala 26:22]
  wire [31:0] _GEN_147 = 5'h13 == io_writeSel ? reg_19 : _GEN_146; // @[RegisterFile.scala 26:22]
  wire [31:0] _GEN_148 = 5'h14 == io_writeSel ? reg_20 : _GEN_147; // @[RegisterFile.scala 26:22]
  wire [31:0] _GEN_149 = 5'h15 == io_writeSel ? reg_21 : _GEN_148; // @[RegisterFile.scala 26:22]
  wire [31:0] _GEN_150 = 5'h16 == io_writeSel ? reg_22 : _GEN_149; // @[RegisterFile.scala 26:22]
  wire [31:0] _GEN_151 = 5'h17 == io_writeSel ? reg_23 : _GEN_150; // @[RegisterFile.scala 26:22]
  wire [31:0] _GEN_152 = 5'h18 == io_writeSel ? reg_24 : _GEN_151; // @[RegisterFile.scala 26:22]
  wire [31:0] _GEN_153 = 5'h19 == io_writeSel ? reg_25 : _GEN_152; // @[RegisterFile.scala 26:22]
  wire [31:0] _GEN_154 = 5'h1a == io_writeSel ? reg_26 : _GEN_153; // @[RegisterFile.scala 26:22]
  wire [31:0] _GEN_155 = 5'h1b == io_writeSel ? reg_27 : _GEN_154; // @[RegisterFile.scala 26:22]
  wire [31:0] _GEN_156 = 5'h1c == io_writeSel ? reg_28 : _GEN_155; // @[RegisterFile.scala 26:22]
  wire [31:0] _GEN_157 = 5'h1d == io_writeSel ? reg_29 : _GEN_156; // @[RegisterFile.scala 26:22]
  wire [31:0] _GEN_158 = 5'h1e == io_writeSel ? reg_30 : _GEN_157; // @[RegisterFile.scala 26:22]
  wire [31:0] _GEN_159 = 5'h1f == io_writeSel ? reg_31 : _GEN_158; // @[RegisterFile.scala 26:22]
  assign io_aOut = 5'h1f == io_aSel ? reg_31 : _GEN_30; // @[RegisterFile.scala 20:11]
  assign io_bOut = 5'h1f == io_bSel ? reg_31 : _GEN_62; // @[RegisterFile.scala 21:11]
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  reg_0 = _RAND_0[31:0];
  _RAND_1 = {1{`RANDOM}};
  reg_1 = _RAND_1[31:0];
  _RAND_2 = {1{`RANDOM}};
  reg_2 = _RAND_2[31:0];
  _RAND_3 = {1{`RANDOM}};
  reg_3 = _RAND_3[31:0];
  _RAND_4 = {1{`RANDOM}};
  reg_4 = _RAND_4[31:0];
  _RAND_5 = {1{`RANDOM}};
  reg_5 = _RAND_5[31:0];
  _RAND_6 = {1{`RANDOM}};
  reg_6 = _RAND_6[31:0];
  _RAND_7 = {1{`RANDOM}};
  reg_7 = _RAND_7[31:0];
  _RAND_8 = {1{`RANDOM}};
  reg_8 = _RAND_8[31:0];
  _RAND_9 = {1{`RANDOM}};
  reg_9 = _RAND_9[31:0];
  _RAND_10 = {1{`RANDOM}};
  reg_10 = _RAND_10[31:0];
  _RAND_11 = {1{`RANDOM}};
  reg_11 = _RAND_11[31:0];
  _RAND_12 = {1{`RANDOM}};
  reg_12 = _RAND_12[31:0];
  _RAND_13 = {1{`RANDOM}};
  reg_13 = _RAND_13[31:0];
  _RAND_14 = {1{`RANDOM}};
  reg_14 = _RAND_14[31:0];
  _RAND_15 = {1{`RANDOM}};
  reg_15 = _RAND_15[31:0];
  _RAND_16 = {1{`RANDOM}};
  reg_16 = _RAND_16[31:0];
  _RAND_17 = {1{`RANDOM}};
  reg_17 = _RAND_17[31:0];
  _RAND_18 = {1{`RANDOM}};
  reg_18 = _RAND_18[31:0];
  _RAND_19 = {1{`RANDOM}};
  reg_19 = _RAND_19[31:0];
  _RAND_20 = {1{`RANDOM}};
  reg_20 = _RAND_20[31:0];
  _RAND_21 = {1{`RANDOM}};
  reg_21 = _RAND_21[31:0];
  _RAND_22 = {1{`RANDOM}};
  reg_22 = _RAND_22[31:0];
  _RAND_23 = {1{`RANDOM}};
  reg_23 = _RAND_23[31:0];
  _RAND_24 = {1{`RANDOM}};
  reg_24 = _RAND_24[31:0];
  _RAND_25 = {1{`RANDOM}};
  reg_25 = _RAND_25[31:0];
  _RAND_26 = {1{`RANDOM}};
  reg_26 = _RAND_26[31:0];
  _RAND_27 = {1{`RANDOM}};
  reg_27 = _RAND_27[31:0];
  _RAND_28 = {1{`RANDOM}};
  reg_28 = _RAND_28[31:0];
  _RAND_29 = {1{`RANDOM}};
  reg_29 = _RAND_29[31:0];
  _RAND_30 = {1{`RANDOM}};
  reg_30 = _RAND_30[31:0];
  _RAND_31 = {1{`RANDOM}};
  reg_31 = _RAND_31[31:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
  always @(posedge clock) begin
    if (reset) begin
      reg_0 <= 32'h0;
    end else if (io_writeEnable) begin
      if (5'h0 == io_writeSel) begin
        reg_0 <= io_writeData;
      end
    end else if (5'h0 == io_writeSel) begin
      if (5'h1f == io_writeSel) begin
        reg_0 <= reg_31;
      end else if (5'h1e == io_writeSel) begin
        reg_0 <= reg_30;
      end else if (5'h1d == io_writeSel) begin
        reg_0 <= reg_29;
      end else if (5'h1c == io_writeSel) begin
        reg_0 <= reg_28;
      end else if (5'h1b == io_writeSel) begin
        reg_0 <= reg_27;
      end else if (5'h1a == io_writeSel) begin
        reg_0 <= reg_26;
      end else if (5'h19 == io_writeSel) begin
        reg_0 <= reg_25;
      end else if (5'h18 == io_writeSel) begin
        reg_0 <= reg_24;
      end else if (5'h17 == io_writeSel) begin
        reg_0 <= reg_23;
      end else if (5'h16 == io_writeSel) begin
        reg_0 <= reg_22;
      end else if (5'h15 == io_writeSel) begin
        reg_0 <= reg_21;
      end else if (5'h14 == io_writeSel) begin
        reg_0 <= reg_20;
      end else if (5'h13 == io_writeSel) begin
        reg_0 <= reg_19;
      end else if (5'h12 == io_writeSel) begin
        reg_0 <= reg_18;
      end else if (5'h11 == io_writeSel) begin
        reg_0 <= reg_17;
      end else if (5'h10 == io_writeSel) begin
        reg_0 <= reg_16;
      end else if (5'hf == io_writeSel) begin
        reg_0 <= reg_15;
      end else if (5'he == io_writeSel) begin
        reg_0 <= reg_14;
      end else if (5'hd == io_writeSel) begin
        reg_0 <= reg_13;
      end else if (5'hc == io_writeSel) begin
        reg_0 <= reg_12;
      end else if (5'hb == io_writeSel) begin
        reg_0 <= reg_11;
      end else if (5'ha == io_writeSel) begin
        reg_0 <= reg_10;
      end else if (5'h9 == io_writeSel) begin
        reg_0 <= reg_9;
      end else if (5'h8 == io_writeSel) begin
        reg_0 <= reg_8;
      end else if (5'h7 == io_writeSel) begin
        reg_0 <= reg_7;
      end else if (5'h6 == io_writeSel) begin
        reg_0 <= reg_6;
      end else if (5'h5 == io_writeSel) begin
        reg_0 <= reg_5;
      end else if (5'h4 == io_writeSel) begin
        reg_0 <= reg_4;
      end else if (5'h3 == io_writeSel) begin
        reg_0 <= reg_3;
      end else if (5'h2 == io_writeSel) begin
        reg_0 <= reg_2;
      end else if (5'h1 == io_writeSel) begin
        reg_0 <= reg_1;
      end
    end
    if (reset) begin
      reg_1 <= 32'h0;
    end else if (io_writeEnable) begin
      if (5'h1 == io_writeSel) begin
        reg_1 <= io_writeData;
      end
    end else if (5'h1 == io_writeSel) begin
      if (5'h1f == io_writeSel) begin
        reg_1 <= reg_31;
      end else if (5'h1e == io_writeSel) begin
        reg_1 <= reg_30;
      end else if (5'h1d == io_writeSel) begin
        reg_1 <= reg_29;
      end else if (5'h1c == io_writeSel) begin
        reg_1 <= reg_28;
      end else if (5'h1b == io_writeSel) begin
        reg_1 <= reg_27;
      end else if (5'h1a == io_writeSel) begin
        reg_1 <= reg_26;
      end else if (5'h19 == io_writeSel) begin
        reg_1 <= reg_25;
      end else if (5'h18 == io_writeSel) begin
        reg_1 <= reg_24;
      end else if (5'h17 == io_writeSel) begin
        reg_1 <= reg_23;
      end else if (5'h16 == io_writeSel) begin
        reg_1 <= reg_22;
      end else if (5'h15 == io_writeSel) begin
        reg_1 <= reg_21;
      end else if (5'h14 == io_writeSel) begin
        reg_1 <= reg_20;
      end else if (5'h13 == io_writeSel) begin
        reg_1 <= reg_19;
      end else if (5'h12 == io_writeSel) begin
        reg_1 <= reg_18;
      end else if (5'h11 == io_writeSel) begin
        reg_1 <= reg_17;
      end else if (5'h10 == io_writeSel) begin
        reg_1 <= reg_16;
      end else if (5'hf == io_writeSel) begin
        reg_1 <= reg_15;
      end else if (5'he == io_writeSel) begin
        reg_1 <= reg_14;
      end else if (5'hd == io_writeSel) begin
        reg_1 <= reg_13;
      end else if (5'hc == io_writeSel) begin
        reg_1 <= reg_12;
      end else if (5'hb == io_writeSel) begin
        reg_1 <= reg_11;
      end else if (5'ha == io_writeSel) begin
        reg_1 <= reg_10;
      end else if (5'h9 == io_writeSel) begin
        reg_1 <= reg_9;
      end else if (5'h8 == io_writeSel) begin
        reg_1 <= reg_8;
      end else if (5'h7 == io_writeSel) begin
        reg_1 <= reg_7;
      end else if (5'h6 == io_writeSel) begin
        reg_1 <= reg_6;
      end else if (5'h5 == io_writeSel) begin
        reg_1 <= reg_5;
      end else if (5'h4 == io_writeSel) begin
        reg_1 <= reg_4;
      end else if (5'h3 == io_writeSel) begin
        reg_1 <= reg_3;
      end else if (5'h2 == io_writeSel) begin
        reg_1 <= reg_2;
      end else if (!(5'h1 == io_writeSel)) begin
        reg_1 <= reg_0;
      end
    end
    if (reset) begin
      reg_2 <= 32'h0;
    end else if (io_writeEnable) begin
      if (5'h2 == io_writeSel) begin
        reg_2 <= io_writeData;
      end
    end else if (5'h2 == io_writeSel) begin
      if (5'h1f == io_writeSel) begin
        reg_2 <= reg_31;
      end else if (5'h1e == io_writeSel) begin
        reg_2 <= reg_30;
      end else if (5'h1d == io_writeSel) begin
        reg_2 <= reg_29;
      end else if (5'h1c == io_writeSel) begin
        reg_2 <= reg_28;
      end else if (5'h1b == io_writeSel) begin
        reg_2 <= reg_27;
      end else if (5'h1a == io_writeSel) begin
        reg_2 <= reg_26;
      end else if (5'h19 == io_writeSel) begin
        reg_2 <= reg_25;
      end else if (5'h18 == io_writeSel) begin
        reg_2 <= reg_24;
      end else if (5'h17 == io_writeSel) begin
        reg_2 <= reg_23;
      end else if (5'h16 == io_writeSel) begin
        reg_2 <= reg_22;
      end else if (5'h15 == io_writeSel) begin
        reg_2 <= reg_21;
      end else if (5'h14 == io_writeSel) begin
        reg_2 <= reg_20;
      end else if (5'h13 == io_writeSel) begin
        reg_2 <= reg_19;
      end else if (5'h12 == io_writeSel) begin
        reg_2 <= reg_18;
      end else if (5'h11 == io_writeSel) begin
        reg_2 <= reg_17;
      end else if (5'h10 == io_writeSel) begin
        reg_2 <= reg_16;
      end else if (5'hf == io_writeSel) begin
        reg_2 <= reg_15;
      end else if (5'he == io_writeSel) begin
        reg_2 <= reg_14;
      end else if (5'hd == io_writeSel) begin
        reg_2 <= reg_13;
      end else if (5'hc == io_writeSel) begin
        reg_2 <= reg_12;
      end else if (5'hb == io_writeSel) begin
        reg_2 <= reg_11;
      end else if (5'ha == io_writeSel) begin
        reg_2 <= reg_10;
      end else if (5'h9 == io_writeSel) begin
        reg_2 <= reg_9;
      end else if (5'h8 == io_writeSel) begin
        reg_2 <= reg_8;
      end else if (5'h7 == io_writeSel) begin
        reg_2 <= reg_7;
      end else if (5'h6 == io_writeSel) begin
        reg_2 <= reg_6;
      end else if (5'h5 == io_writeSel) begin
        reg_2 <= reg_5;
      end else if (5'h4 == io_writeSel) begin
        reg_2 <= reg_4;
      end else if (5'h3 == io_writeSel) begin
        reg_2 <= reg_3;
      end else if (!(5'h2 == io_writeSel)) begin
        if (5'h1 == io_writeSel) begin
          reg_2 <= reg_1;
        end else begin
          reg_2 <= reg_0;
        end
      end
    end
    if (reset) begin
      reg_3 <= 32'h0;
    end else if (io_writeEnable) begin
      if (5'h3 == io_writeSel) begin
        reg_3 <= io_writeData;
      end
    end else if (5'h3 == io_writeSel) begin
      if (5'h1f == io_writeSel) begin
        reg_3 <= reg_31;
      end else if (5'h1e == io_writeSel) begin
        reg_3 <= reg_30;
      end else if (5'h1d == io_writeSel) begin
        reg_3 <= reg_29;
      end else if (5'h1c == io_writeSel) begin
        reg_3 <= reg_28;
      end else if (5'h1b == io_writeSel) begin
        reg_3 <= reg_27;
      end else if (5'h1a == io_writeSel) begin
        reg_3 <= reg_26;
      end else if (5'h19 == io_writeSel) begin
        reg_3 <= reg_25;
      end else if (5'h18 == io_writeSel) begin
        reg_3 <= reg_24;
      end else if (5'h17 == io_writeSel) begin
        reg_3 <= reg_23;
      end else if (5'h16 == io_writeSel) begin
        reg_3 <= reg_22;
      end else if (5'h15 == io_writeSel) begin
        reg_3 <= reg_21;
      end else if (5'h14 == io_writeSel) begin
        reg_3 <= reg_20;
      end else if (5'h13 == io_writeSel) begin
        reg_3 <= reg_19;
      end else if (5'h12 == io_writeSel) begin
        reg_3 <= reg_18;
      end else if (5'h11 == io_writeSel) begin
        reg_3 <= reg_17;
      end else if (5'h10 == io_writeSel) begin
        reg_3 <= reg_16;
      end else if (5'hf == io_writeSel) begin
        reg_3 <= reg_15;
      end else if (5'he == io_writeSel) begin
        reg_3 <= reg_14;
      end else if (5'hd == io_writeSel) begin
        reg_3 <= reg_13;
      end else if (5'hc == io_writeSel) begin
        reg_3 <= reg_12;
      end else if (5'hb == io_writeSel) begin
        reg_3 <= reg_11;
      end else if (5'ha == io_writeSel) begin
        reg_3 <= reg_10;
      end else if (5'h9 == io_writeSel) begin
        reg_3 <= reg_9;
      end else if (5'h8 == io_writeSel) begin
        reg_3 <= reg_8;
      end else if (5'h7 == io_writeSel) begin
        reg_3 <= reg_7;
      end else if (5'h6 == io_writeSel) begin
        reg_3 <= reg_6;
      end else if (5'h5 == io_writeSel) begin
        reg_3 <= reg_5;
      end else if (5'h4 == io_writeSel) begin
        reg_3 <= reg_4;
      end else if (!(5'h3 == io_writeSel)) begin
        if (5'h2 == io_writeSel) begin
          reg_3 <= reg_2;
        end else if (5'h1 == io_writeSel) begin
          reg_3 <= reg_1;
        end else begin
          reg_3 <= reg_0;
        end
      end
    end
    if (reset) begin
      reg_4 <= 32'h0;
    end else if (io_writeEnable) begin
      if (5'h4 == io_writeSel) begin
        reg_4 <= io_writeData;
      end
    end else if (5'h4 == io_writeSel) begin
      reg_4 <= _GEN_159;
    end
    if (reset) begin
      reg_5 <= 32'h0;
    end else if (io_writeEnable) begin
      if (5'h5 == io_writeSel) begin
        reg_5 <= io_writeData;
      end
    end else if (5'h5 == io_writeSel) begin
      reg_5 <= _GEN_159;
    end
    if (reset) begin
      reg_6 <= 32'h0;
    end else if (io_writeEnable) begin
      if (5'h6 == io_writeSel) begin
        reg_6 <= io_writeData;
      end
    end else if (5'h6 == io_writeSel) begin
      reg_6 <= _GEN_159;
    end
    if (reset) begin
      reg_7 <= 32'h0;
    end else if (io_writeEnable) begin
      if (5'h7 == io_writeSel) begin
        reg_7 <= io_writeData;
      end
    end else if (5'h7 == io_writeSel) begin
      reg_7 <= _GEN_159;
    end
    if (reset) begin
      reg_8 <= 32'h0;
    end else if (io_writeEnable) begin
      if (5'h8 == io_writeSel) begin
        reg_8 <= io_writeData;
      end
    end else if (5'h8 == io_writeSel) begin
      reg_8 <= _GEN_159;
    end
    if (reset) begin
      reg_9 <= 32'h0;
    end else if (io_writeEnable) begin
      if (5'h9 == io_writeSel) begin
        reg_9 <= io_writeData;
      end
    end else if (5'h9 == io_writeSel) begin
      reg_9 <= _GEN_159;
    end
    if (reset) begin
      reg_10 <= 32'h0;
    end else if (io_writeEnable) begin
      if (5'ha == io_writeSel) begin
        reg_10 <= io_writeData;
      end
    end else if (5'ha == io_writeSel) begin
      reg_10 <= _GEN_159;
    end
    if (reset) begin
      reg_11 <= 32'h0;
    end else if (io_writeEnable) begin
      if (5'hb == io_writeSel) begin
        reg_11 <= io_writeData;
      end
    end else if (5'hb == io_writeSel) begin
      reg_11 <= _GEN_159;
    end
    if (reset) begin
      reg_12 <= 32'h0;
    end else if (io_writeEnable) begin
      if (5'hc == io_writeSel) begin
        reg_12 <= io_writeData;
      end
    end else if (5'hc == io_writeSel) begin
      reg_12 <= _GEN_159;
    end
    if (reset) begin
      reg_13 <= 32'h0;
    end else if (io_writeEnable) begin
      if (5'hd == io_writeSel) begin
        reg_13 <= io_writeData;
      end
    end else if (5'hd == io_writeSel) begin
      reg_13 <= _GEN_159;
    end
    if (reset) begin
      reg_14 <= 32'h0;
    end else if (io_writeEnable) begin
      if (5'he == io_writeSel) begin
        reg_14 <= io_writeData;
      end
    end else if (5'he == io_writeSel) begin
      reg_14 <= _GEN_159;
    end
    if (reset) begin
      reg_15 <= 32'h0;
    end else if (io_writeEnable) begin
      if (5'hf == io_writeSel) begin
        reg_15 <= io_writeData;
      end
    end else if (5'hf == io_writeSel) begin
      reg_15 <= _GEN_159;
    end
    if (reset) begin
      reg_16 <= 32'h0;
    end else if (io_writeEnable) begin
      if (5'h10 == io_writeSel) begin
        reg_16 <= io_writeData;
      end
    end else if (5'h10 == io_writeSel) begin
      reg_16 <= _GEN_159;
    end
    if (reset) begin
      reg_17 <= 32'h0;
    end else if (io_writeEnable) begin
      if (5'h11 == io_writeSel) begin
        reg_17 <= io_writeData;
      end
    end else if (5'h11 == io_writeSel) begin
      reg_17 <= _GEN_159;
    end
    if (reset) begin
      reg_18 <= 32'h0;
    end else if (io_writeEnable) begin
      if (5'h12 == io_writeSel) begin
        reg_18 <= io_writeData;
      end
    end else if (5'h12 == io_writeSel) begin
      reg_18 <= _GEN_159;
    end
    if (reset) begin
      reg_19 <= 32'h0;
    end else if (io_writeEnable) begin
      if (5'h13 == io_writeSel) begin
        reg_19 <= io_writeData;
      end
    end else if (5'h13 == io_writeSel) begin
      reg_19 <= _GEN_159;
    end
    if (reset) begin
      reg_20 <= 32'h0;
    end else if (io_writeEnable) begin
      if (5'h14 == io_writeSel) begin
        reg_20 <= io_writeData;
      end
    end else if (5'h14 == io_writeSel) begin
      reg_20 <= _GEN_159;
    end
    if (reset) begin
      reg_21 <= 32'h0;
    end else if (io_writeEnable) begin
      if (5'h15 == io_writeSel) begin
        reg_21 <= io_writeData;
      end
    end else if (5'h15 == io_writeSel) begin
      reg_21 <= _GEN_159;
    end
    if (reset) begin
      reg_22 <= 32'h0;
    end else if (io_writeEnable) begin
      if (5'h16 == io_writeSel) begin
        reg_22 <= io_writeData;
      end
    end else if (5'h16 == io_writeSel) begin
      reg_22 <= _GEN_159;
    end
    if (reset) begin
      reg_23 <= 32'h0;
    end else if (io_writeEnable) begin
      if (5'h17 == io_writeSel) begin
        reg_23 <= io_writeData;
      end
    end else if (5'h17 == io_writeSel) begin
      reg_23 <= _GEN_159;
    end
    if (reset) begin
      reg_24 <= 32'h0;
    end else if (io_writeEnable) begin
      if (5'h18 == io_writeSel) begin
        reg_24 <= io_writeData;
      end
    end else if (5'h18 == io_writeSel) begin
      reg_24 <= _GEN_159;
    end
    if (reset) begin
      reg_25 <= 32'h0;
    end else if (io_writeEnable) begin
      if (5'h19 == io_writeSel) begin
        reg_25 <= io_writeData;
      end
    end else if (5'h19 == io_writeSel) begin
      reg_25 <= _GEN_159;
    end
    if (reset) begin
      reg_26 <= 32'h0;
    end else if (io_writeEnable) begin
      if (5'h1a == io_writeSel) begin
        reg_26 <= io_writeData;
      end
    end else if (5'h1a == io_writeSel) begin
      reg_26 <= _GEN_159;
    end
    if (reset) begin
      reg_27 <= 32'h0;
    end else if (io_writeEnable) begin
      if (5'h1b == io_writeSel) begin
        reg_27 <= io_writeData;
      end
    end else if (5'h1b == io_writeSel) begin
      reg_27 <= _GEN_159;
    end
    if (reset) begin
      reg_28 <= 32'h0;
    end else if (io_writeEnable) begin
      if (5'h1c == io_writeSel) begin
        reg_28 <= io_writeData;
      end
    end else if (5'h1c == io_writeSel) begin
      reg_28 <= _GEN_159;
    end
    if (reset) begin
      reg_29 <= 32'h0;
    end else if (io_writeEnable) begin
      if (5'h1d == io_writeSel) begin
        reg_29 <= io_writeData;
      end
    end else if (5'h1d == io_writeSel) begin
      reg_29 <= _GEN_159;
    end
    if (reset) begin
      reg_30 <= 32'h0;
    end else if (io_writeEnable) begin
      if (5'h1e == io_writeSel) begin
        reg_30 <= io_writeData;
      end
    end else if (5'h1e == io_writeSel) begin
      reg_30 <= _GEN_159;
    end
    if (reset) begin
      reg_31 <= 32'h0;
    end else if (io_writeEnable) begin
      if (5'h1f == io_writeSel) begin
        reg_31 <= io_writeData;
      end
    end else if (5'h1f == io_writeSel) begin
      reg_31 <= _GEN_159;
    end
  end
endmodule
