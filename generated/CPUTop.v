module ProgramCounter(
  input         clock,
  input         reset,
  input         io_stop,
  input         io_jump,
  input         io_run,
  input  [15:0] io_programCounterJump,
  output [15:0] io_programCounter
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_REG_INIT
  wire  w1 = ~io_run; // @[ProgramCounter.scala 18:9]
  wire  w2 = io_stop | w1; // @[ProgramCounter.scala 19:17]
  wire [15:0] w3 = io_programCounter + 16'h1; // @[ProgramCounter.scala 20:27]
  reg [15:0] reg_; // @[ProgramCounter.scala 25:20]
  assign io_programCounter = reg_; // @[ProgramCounter.scala 29:21]
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
  reg_ = _RAND_0[15:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
  always @(posedge clock) begin
    if (reset) begin
      reg_ <= 16'h0;
    end else if (w2) begin
      reg_ <= io_programCounter;
    end else if (io_jump) begin
      reg_ <= io_programCounterJump;
    end else begin
      reg_ <= w3;
    end
  end
endmodule
module DataMemory(
  input         clock,
  input  [15:0] io_address,
  output [31:0] io_dataRead,
  input         io_writeEnable,
  input  [31:0] io_dataWrite,
  input         io_testerEnable,
  input  [15:0] io_testerAddress,
  output [31:0] io_testerDataRead,
  input         io_testerWriteEnable,
  input  [31:0] io_testerDataWrite
);
`ifdef RANDOMIZE_MEM_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_MEM_INIT
  reg [31:0] memory [0:65535]; // @[DataMemory.scala 18:20]
  wire [31:0] memory__T_data; // @[DataMemory.scala 18:20]
  wire [15:0] memory__T_addr; // @[DataMemory.scala 18:20]
  wire [31:0] memory__T_2_data; // @[DataMemory.scala 18:20]
  wire [15:0] memory__T_2_addr; // @[DataMemory.scala 18:20]
  wire [31:0] memory__T_1_data; // @[DataMemory.scala 18:20]
  wire [15:0] memory__T_1_addr; // @[DataMemory.scala 18:20]
  wire  memory__T_1_mask; // @[DataMemory.scala 18:20]
  wire  memory__T_1_en; // @[DataMemory.scala 18:20]
  wire [31:0] memory__T_3_data; // @[DataMemory.scala 18:20]
  wire [15:0] memory__T_3_addr; // @[DataMemory.scala 18:20]
  wire  memory__T_3_mask; // @[DataMemory.scala 18:20]
  wire  memory__T_3_en; // @[DataMemory.scala 18:20]
  wire [31:0] _GEN_5 = io_testerWriteEnable ? io_testerDataWrite : memory__T_data; // @[DataMemory.scala 24:32]
  wire [31:0] _GEN_11 = io_writeEnable ? io_dataWrite : memory__T_2_data; // @[DataMemory.scala 32:26]
  assign memory__T_addr = io_testerAddress;
  assign memory__T_data = memory[memory__T_addr]; // @[DataMemory.scala 18:20]
  assign memory__T_2_addr = io_address;
  assign memory__T_2_data = memory[memory__T_2_addr]; // @[DataMemory.scala 18:20]
  assign memory__T_1_data = io_testerDataWrite;
  assign memory__T_1_addr = io_testerAddress;
  assign memory__T_1_mask = 1'h1;
  assign memory__T_1_en = io_testerEnable & io_testerWriteEnable;
  assign memory__T_3_data = io_dataWrite;
  assign memory__T_3_addr = io_address;
  assign memory__T_3_mask = 1'h1;
  assign memory__T_3_en = io_testerEnable ? 1'h0 : io_writeEnable;
  assign io_dataRead = io_testerEnable ? 32'h0 : _GEN_11; // @[DataMemory.scala 23:17 DataMemory.scala 30:17 DataMemory.scala 34:19]
  assign io_testerDataRead = io_testerEnable ? _GEN_5 : 32'h0; // @[DataMemory.scala 22:23 DataMemory.scala 26:25 DataMemory.scala 31:23]
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
`ifdef RANDOMIZE_MEM_INIT
  _RAND_0 = {1{`RANDOM}};
  for (initvar = 0; initvar < 65536; initvar = initvar+1)
    memory[initvar] = _RAND_0[31:0];
`endif // RANDOMIZE_MEM_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
  always @(posedge clock) begin
    if(memory__T_1_en & memory__T_1_mask) begin
      memory[memory__T_1_addr] <= memory__T_1_data; // @[DataMemory.scala 18:20]
    end
    if(memory__T_3_en & memory__T_3_mask) begin
      memory[memory__T_3_addr] <= memory__T_3_data; // @[DataMemory.scala 18:20]
    end
  end
endmodule
module ProgramMemory(
  input         clock,
  input  [15:0] io_address,
  output [31:0] io_instructionRead,
  input         io_testerEnable,
  input  [15:0] io_testerAddress,
  output [31:0] io_testerDataRead,
  input         io_testerWriteEnable,
  input  [31:0] io_testerDataWrite
);
`ifdef RANDOMIZE_MEM_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_MEM_INIT
  reg [31:0] memory [0:65535]; // @[ProgramMemory.scala 16:20]
  wire [31:0] memory__T_data; // @[ProgramMemory.scala 16:20]
  wire [15:0] memory__T_addr; // @[ProgramMemory.scala 16:20]
  wire [31:0] memory__T_2_data; // @[ProgramMemory.scala 16:20]
  wire [15:0] memory__T_2_addr; // @[ProgramMemory.scala 16:20]
  wire [31:0] memory__T_1_data; // @[ProgramMemory.scala 16:20]
  wire [15:0] memory__T_1_addr; // @[ProgramMemory.scala 16:20]
  wire  memory__T_1_mask; // @[ProgramMemory.scala 16:20]
  wire  memory__T_1_en; // @[ProgramMemory.scala 16:20]
  wire [31:0] _GEN_5 = io_testerWriteEnable ? io_testerDataWrite : memory__T_data; // @[ProgramMemory.scala 22:32]
  assign memory__T_addr = io_testerAddress;
  assign memory__T_data = memory[memory__T_addr]; // @[ProgramMemory.scala 16:20]
  assign memory__T_2_addr = io_address;
  assign memory__T_2_data = memory[memory__T_2_addr]; // @[ProgramMemory.scala 16:20]
  assign memory__T_1_data = io_testerDataWrite;
  assign memory__T_1_addr = io_testerAddress;
  assign memory__T_1_mask = 1'h1;
  assign memory__T_1_en = io_testerEnable & io_testerWriteEnable;
  assign io_instructionRead = io_testerEnable ? 32'h0 : memory__T_2_data; // @[ProgramMemory.scala 21:24 ProgramMemory.scala 28:24]
  assign io_testerDataRead = io_testerEnable ? _GEN_5 : 32'h0; // @[ProgramMemory.scala 20:23 ProgramMemory.scala 24:25 ProgramMemory.scala 29:23]
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
`ifdef RANDOMIZE_MEM_INIT
  _RAND_0 = {1{`RANDOM}};
  for (initvar = 0; initvar < 65536; initvar = initvar+1)
    memory[initvar] = _RAND_0[31:0];
`endif // RANDOMIZE_MEM_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
  always @(posedge clock) begin
    if(memory__T_1_en & memory__T_1_mask) begin
      memory[memory__T_1_addr] <= memory__T_1_data; // @[ProgramMemory.scala 16:20]
    end
  end
endmodule
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
module ControlUnit(
  input  [4:0] io_opcode,
  output [3:0] io_ALU_op,
  output       io_c_jump,
  output       io_mux_sel1,
  output       io_mux_sel2,
  output       io_stop,
  output       io_u_jump,
  output       io_write_enable_dm,
  output       io_write_enable_reg
);
  wire  _T = io_opcode == 5'h1; // @[ControlUnit.scala 28:19]
  wire  _T_1 = io_opcode == 5'h2; // @[ControlUnit.scala 43:19]
  wire  _GEN_2 = _T_1 | _T; // @[ControlUnit.scala 43:31]
  wire  _T_2 = io_opcode == 5'h3; // @[ControlUnit.scala 58:19]
  wire  _GEN_5 = _T_2 | _GEN_2; // @[ControlUnit.scala 58:31]
  wire  _GEN_6 = _T_2 ? 1'h0 : _T_1; // @[ControlUnit.scala 58:31]
  wire [1:0] _GEN_8 = _T_2 ? 2'h2 : {{1'd0}, _GEN_2}; // @[ControlUnit.scala 58:31]
  wire  _T_3 = io_opcode == 5'h4; // @[ControlUnit.scala 73:19]
  wire  _GEN_9 = _T_3 | _GEN_5; // @[ControlUnit.scala 73:31]
  wire  _GEN_10 = _T_3 | _GEN_6; // @[ControlUnit.scala 73:31]
  wire [1:0] _GEN_12 = _T_3 ? 2'h2 : _GEN_8; // @[ControlUnit.scala 73:31]
  wire  _T_4 = io_opcode == 5'h5; // @[ControlUnit.scala 88:19]
  wire  _GEN_13 = _T_4 | _GEN_9; // @[ControlUnit.scala 88:31]
  wire  _GEN_14 = _T_4 ? 1'h0 : _GEN_10; // @[ControlUnit.scala 88:31]
  wire [1:0] _GEN_16 = _T_4 ? 2'h3 : _GEN_12; // @[ControlUnit.scala 88:31]
  wire  _T_5 = io_opcode == 5'h6; // @[ControlUnit.scala 103:19]
  wire  _GEN_17 = _T_5 | _GEN_13; // @[ControlUnit.scala 103:31]
  wire  _GEN_18 = _T_5 | _GEN_14; // @[ControlUnit.scala 103:31]
  wire [1:0] _GEN_20 = _T_5 ? 2'h3 : _GEN_16; // @[ControlUnit.scala 103:31]
  wire  _T_6 = io_opcode == 5'hb; // @[ControlUnit.scala 118:19]
  wire  _GEN_21 = _T_6 | _GEN_17; // @[ControlUnit.scala 118:31]
  wire  _GEN_22 = _T_6 ? 1'h0 : _GEN_18; // @[ControlUnit.scala 118:31]
  wire [2:0] _GEN_24 = _T_6 ? 3'h4 : {{1'd0}, _GEN_20}; // @[ControlUnit.scala 118:31]
  wire  _T_7 = io_opcode == 5'hc; // @[ControlUnit.scala 133:19]
  wire  _GEN_25 = _T_7 | _GEN_21; // @[ControlUnit.scala 133:31]
  wire  _GEN_26 = _T_7 ? 1'h0 : _GEN_22; // @[ControlUnit.scala 133:31]
  wire [2:0] _GEN_28 = _T_7 ? 3'h5 : _GEN_24; // @[ControlUnit.scala 133:31]
  wire  _T_8 = io_opcode == 5'hd; // @[ControlUnit.scala 148:19]
  wire  _GEN_29 = _T_8 | _GEN_25; // @[ControlUnit.scala 148:31]
  wire  _GEN_30 = _T_8 ? 1'h0 : _GEN_26; // @[ControlUnit.scala 148:31]
  wire [2:0] _GEN_32 = _T_8 ? 3'h6 : _GEN_28; // @[ControlUnit.scala 148:31]
  wire  _T_9 = io_opcode == 5'h11; // @[ControlUnit.scala 163:19]
  wire  _GEN_33 = _T_9 | _GEN_29; // @[ControlUnit.scala 163:31]
  wire  _GEN_34 = _T_9 | _GEN_30; // @[ControlUnit.scala 163:31]
  wire [2:0] _GEN_36 = _T_9 ? 3'h7 : _GEN_32; // @[ControlUnit.scala 163:31]
  wire  _T_10 = io_opcode == 5'h12; // @[ControlUnit.scala 178:19]
  wire  _GEN_37 = _T_10 | _GEN_33; // @[ControlUnit.scala 178:31]
  wire  _GEN_38 = _T_10 ? 1'h0 : _GEN_34; // @[ControlUnit.scala 178:31]
  wire [3:0] _GEN_40 = _T_10 ? 4'h8 : {{1'd0}, _GEN_36}; // @[ControlUnit.scala 178:31]
  wire  _T_11 = io_opcode == 5'h13; // @[ControlUnit.scala 193:19]
  wire  _GEN_41 = _T_11 ? 1'h0 : _GEN_37; // @[ControlUnit.scala 193:31]
  wire  _GEN_42 = _T_11 ? 1'h0 : _GEN_38; // @[ControlUnit.scala 193:31]
  wire [3:0] _GEN_45 = _T_11 ? 4'h0 : _GEN_40; // @[ControlUnit.scala 193:31]
  wire  _T_12 = io_opcode == 5'h14; // @[ControlUnit.scala 208:19]
  wire  _GEN_46 = _T_12 | _GEN_41; // @[ControlUnit.scala 208:31]
  wire  _GEN_47 = _T_12 | _GEN_42; // @[ControlUnit.scala 208:31]
  wire  _GEN_50 = _T_12 ? 1'h0 : _T_11; // @[ControlUnit.scala 208:31]
  wire  _GEN_51 = _T_12 ? 1'h0 : _GEN_41; // @[ControlUnit.scala 208:31]
  wire [3:0] _GEN_52 = _T_12 ? 4'h0 : _GEN_45; // @[ControlUnit.scala 208:31]
  wire  _T_13 = io_opcode == 5'h15; // @[ControlUnit.scala 223:19]
  wire  _GEN_53 = _T_13 | _GEN_46; // @[ControlUnit.scala 223:31]
  wire  _GEN_54 = _T_13 ? 1'h0 : _GEN_47; // @[ControlUnit.scala 223:31]
  wire  _GEN_57 = _T_13 ? 1'h0 : _T_12; // @[ControlUnit.scala 223:31]
  wire  _GEN_58 = _T_13 ? 1'h0 : _GEN_50; // @[ControlUnit.scala 223:31]
  wire  _GEN_59 = _T_13 ? 1'h0 : _GEN_51; // @[ControlUnit.scala 223:31]
  wire [3:0] _GEN_60 = _T_13 ? 4'h9 : _GEN_52; // @[ControlUnit.scala 223:31]
  wire  _T_14 = io_opcode == 5'h16; // @[ControlUnit.scala 238:19]
  wire  _GEN_61 = _T_14 | _GEN_53; // @[ControlUnit.scala 238:31]
  wire  _GEN_62 = _T_14 ? 1'h0 : _GEN_54; // @[ControlUnit.scala 238:31]
  wire  _GEN_64 = _T_14 | _T_13; // @[ControlUnit.scala 238:31]
  wire  _GEN_65 = _T_14 ? 1'h0 : _GEN_57; // @[ControlUnit.scala 238:31]
  wire  _GEN_66 = _T_14 ? 1'h0 : _GEN_58; // @[ControlUnit.scala 238:31]
  wire  _GEN_67 = _T_14 ? 1'h0 : _GEN_59; // @[ControlUnit.scala 238:31]
  wire [3:0] _GEN_68 = _T_14 ? 4'ha : _GEN_60; // @[ControlUnit.scala 238:31]
  wire  _T_15 = io_opcode == 5'h17; // @[ControlUnit.scala 253:19]
  wire  _GEN_69 = _T_15 | _GEN_61; // @[ControlUnit.scala 253:31]
  wire  _GEN_70 = _T_15 ? 1'h0 : _GEN_62; // @[ControlUnit.scala 253:31]
  wire  _GEN_72 = _T_15 | _GEN_64; // @[ControlUnit.scala 253:31]
  wire  _GEN_73 = _T_15 ? 1'h0 : _GEN_65; // @[ControlUnit.scala 253:31]
  wire  _GEN_74 = _T_15 ? 1'h0 : _GEN_66; // @[ControlUnit.scala 253:31]
  wire  _GEN_75 = _T_15 ? 1'h0 : _GEN_67; // @[ControlUnit.scala 253:31]
  wire [3:0] _GEN_76 = _T_15 ? 4'hb : _GEN_68; // @[ControlUnit.scala 253:31]
  wire  _T_16 = io_opcode == 5'h1a; // @[ControlUnit.scala 268:19]
  wire  _GEN_77 = _T_16 | _GEN_69; // @[ControlUnit.scala 268:31]
  wire  _GEN_78 = _T_16 | _GEN_70; // @[ControlUnit.scala 268:31]
  wire  _GEN_80 = _T_16 | _GEN_72; // @[ControlUnit.scala 268:31]
  wire  _GEN_81 = _T_16 ? 1'h0 : _GEN_73; // @[ControlUnit.scala 268:31]
  wire  _GEN_82 = _T_16 ? 1'h0 : _GEN_74; // @[ControlUnit.scala 268:31]
  wire  _GEN_83 = _T_16 ? 1'h0 : _GEN_75; // @[ControlUnit.scala 268:31]
  wire [3:0] _GEN_84 = _T_16 ? 4'h9 : _GEN_76; // @[ControlUnit.scala 268:31]
  wire  _T_17 = io_opcode == 5'h1b; // @[ControlUnit.scala 283:19]
  wire  _GEN_85 = _T_17 | _GEN_77; // @[ControlUnit.scala 283:31]
  wire  _GEN_86 = _T_17 | _GEN_78; // @[ControlUnit.scala 283:31]
  wire  _GEN_88 = _T_17 | _GEN_80; // @[ControlUnit.scala 283:31]
  wire  _GEN_89 = _T_17 ? 1'h0 : _GEN_81; // @[ControlUnit.scala 283:31]
  wire  _GEN_90 = _T_17 ? 1'h0 : _GEN_82; // @[ControlUnit.scala 283:31]
  wire  _GEN_91 = _T_17 ? 1'h0 : _GEN_83; // @[ControlUnit.scala 283:31]
  wire [3:0] _GEN_92 = _T_17 ? 4'ha : _GEN_84; // @[ControlUnit.scala 283:31]
  wire  _T_18 = io_opcode == 5'h1c; // @[ControlUnit.scala 298:19]
  wire  _GEN_93 = _T_18 | _GEN_85; // @[ControlUnit.scala 298:31]
  wire  _GEN_94 = _T_18 | _GEN_86; // @[ControlUnit.scala 298:31]
  wire  _GEN_96 = _T_18 | _GEN_88; // @[ControlUnit.scala 298:31]
  wire  _GEN_97 = _T_18 ? 1'h0 : _GEN_89; // @[ControlUnit.scala 298:31]
  wire  _GEN_98 = _T_18 ? 1'h0 : _GEN_90; // @[ControlUnit.scala 298:31]
  wire  _GEN_99 = _T_18 ? 1'h0 : _GEN_91; // @[ControlUnit.scala 298:31]
  wire [3:0] _GEN_100 = _T_18 ? 4'hb : _GEN_92; // @[ControlUnit.scala 298:31]
  wire  _T_19 = io_opcode == 5'h1f; // @[ControlUnit.scala 313:19]
  assign io_ALU_op = _T_19 ? 4'h0 : _GEN_100; // @[ControlUnit.scala 19:13 ControlUnit.scala 40:15 ControlUnit.scala 55:15 ControlUnit.scala 70:15 ControlUnit.scala 85:15 ControlUnit.scala 100:15 ControlUnit.scala 115:15 ControlUnit.scala 130:15 ControlUnit.scala 145:15 ControlUnit.scala 160:15 ControlUnit.scala 175:15 ControlUnit.scala 190:15 ControlUnit.scala 205:15 ControlUnit.scala 220:15 ControlUnit.scala 235:15 ControlUnit.scala 250:15 ControlUnit.scala 265:15 ControlUnit.scala 280:15 ControlUnit.scala 295:15 ControlUnit.scala 310:15 ControlUnit.scala 325:15]
  assign io_c_jump = _T_19 ? 1'h0 : _GEN_96; // @[ControlUnit.scala 20:13 ControlUnit.scala 34:15 ControlUnit.scala 49:15 ControlUnit.scala 64:15 ControlUnit.scala 79:15 ControlUnit.scala 94:15 ControlUnit.scala 109:15 ControlUnit.scala 124:15 ControlUnit.scala 139:15 ControlUnit.scala 154:15 ControlUnit.scala 169:15 ControlUnit.scala 184:15 ControlUnit.scala 199:15 ControlUnit.scala 214:15 ControlUnit.scala 229:15 ControlUnit.scala 244:15 ControlUnit.scala 259:15 ControlUnit.scala 274:15 ControlUnit.scala 289:15 ControlUnit.scala 304:15 ControlUnit.scala 319:15]
  assign io_mux_sel1 = _T_19 | _GEN_93; // @[ControlUnit.scala 21:15 ControlUnit.scala 29:17 ControlUnit.scala 44:17 ControlUnit.scala 59:17 ControlUnit.scala 74:17 ControlUnit.scala 89:17 ControlUnit.scala 104:17 ControlUnit.scala 119:17 ControlUnit.scala 134:17 ControlUnit.scala 149:17 ControlUnit.scala 164:17 ControlUnit.scala 179:17 ControlUnit.scala 194:17 ControlUnit.scala 209:17 ControlUnit.scala 224:17 ControlUnit.scala 239:17 ControlUnit.scala 254:17 ControlUnit.scala 269:17 ControlUnit.scala 284:17 ControlUnit.scala 299:17 ControlUnit.scala 314:17]
  assign io_mux_sel2 = _T_19 ? 1'h0 : _GEN_94; // @[ControlUnit.scala 22:15 ControlUnit.scala 30:17 ControlUnit.scala 45:17 ControlUnit.scala 60:17 ControlUnit.scala 75:17 ControlUnit.scala 90:17 ControlUnit.scala 105:17 ControlUnit.scala 120:17 ControlUnit.scala 135:17 ControlUnit.scala 150:17 ControlUnit.scala 165:17 ControlUnit.scala 180:17 ControlUnit.scala 195:17 ControlUnit.scala 210:17 ControlUnit.scala 225:17 ControlUnit.scala 240:17 ControlUnit.scala 255:17 ControlUnit.scala 270:17 ControlUnit.scala 285:17 ControlUnit.scala 300:17 ControlUnit.scala 315:17]
  assign io_stop = io_opcode == 5'h1f; // @[ControlUnit.scala 23:11 ControlUnit.scala 32:13 ControlUnit.scala 47:13 ControlUnit.scala 62:13 ControlUnit.scala 77:13 ControlUnit.scala 92:13 ControlUnit.scala 107:13 ControlUnit.scala 122:13 ControlUnit.scala 137:13 ControlUnit.scala 152:13 ControlUnit.scala 167:13 ControlUnit.scala 182:13 ControlUnit.scala 197:13 ControlUnit.scala 212:13 ControlUnit.scala 227:13 ControlUnit.scala 242:13 ControlUnit.scala 257:13 ControlUnit.scala 272:13 ControlUnit.scala 287:13 ControlUnit.scala 302:13 ControlUnit.scala 317:13]
  assign io_u_jump = _T_19 ? 1'h0 : _GEN_97; // @[ControlUnit.scala 24:13 ControlUnit.scala 35:15 ControlUnit.scala 50:15 ControlUnit.scala 65:15 ControlUnit.scala 80:15 ControlUnit.scala 95:15 ControlUnit.scala 110:15 ControlUnit.scala 125:15 ControlUnit.scala 140:15 ControlUnit.scala 155:15 ControlUnit.scala 170:15 ControlUnit.scala 185:15 ControlUnit.scala 200:15 ControlUnit.scala 215:15 ControlUnit.scala 230:15 ControlUnit.scala 245:15 ControlUnit.scala 260:15 ControlUnit.scala 275:15 ControlUnit.scala 290:15 ControlUnit.scala 305:15 ControlUnit.scala 320:15]
  assign io_write_enable_dm = _T_19 ? 1'h0 : _GEN_98; // @[ControlUnit.scala 25:22 ControlUnit.scala 37:24 ControlUnit.scala 52:24 ControlUnit.scala 67:24 ControlUnit.scala 82:24 ControlUnit.scala 97:24 ControlUnit.scala 112:24 ControlUnit.scala 127:24 ControlUnit.scala 142:24 ControlUnit.scala 157:24 ControlUnit.scala 172:24 ControlUnit.scala 187:24 ControlUnit.scala 202:24 ControlUnit.scala 217:24 ControlUnit.scala 232:24 ControlUnit.scala 247:24 ControlUnit.scala 262:24 ControlUnit.scala 277:24 ControlUnit.scala 292:24 ControlUnit.scala 307:24 ControlUnit.scala 322:24]
  assign io_write_enable_reg = _T_19 ? 1'h0 : _GEN_99; // @[ControlUnit.scala 26:23 ControlUnit.scala 38:25 ControlUnit.scala 53:25 ControlUnit.scala 68:25 ControlUnit.scala 83:25 ControlUnit.scala 98:25 ControlUnit.scala 113:25 ControlUnit.scala 128:25 ControlUnit.scala 143:25 ControlUnit.scala 158:25 ControlUnit.scala 173:25 ControlUnit.scala 188:25 ControlUnit.scala 203:25 ControlUnit.scala 218:25 ControlUnit.scala 233:25 ControlUnit.scala 248:25 ControlUnit.scala 263:25 ControlUnit.scala 278:25 ControlUnit.scala 293:25 ControlUnit.scala 308:25 ControlUnit.scala 323:25]
endmodule
module ALU(
  input  [3:0]  io_op,
  input  [31:0] io_a,
  input  [31:0] io_b,
  output [31:0] io_result,
  output        io_boolVal
);
  wire  _T = 4'h1 == io_op; // @[Conditional.scala 37:30]
  wire [31:0] _T_2 = io_a + io_b; // @[ALU.scala 30:25]
  wire  _T_3 = 4'h3 == io_op; // @[Conditional.scala 37:30]
  wire [63:0] _T_4 = io_a * io_b; // @[ALU.scala 33:25]
  wire  _T_5 = 4'h2 == io_op; // @[Conditional.scala 37:30]
  wire [31:0] _T_7 = io_a - io_b; // @[ALU.scala 36:25]
  wire  _T_8 = 4'h7 == io_op; // @[Conditional.scala 37:30]
  wire  _T_9 = 4'h9 == io_op; // @[Conditional.scala 37:30]
  wire  _T_10 = io_a == io_b; // @[ALU.scala 42:26]
  wire  _T_11 = 4'ha == io_op; // @[Conditional.scala 37:30]
  wire  _T_12 = io_a > io_b; // @[ALU.scala 45:26]
  wire  _T_13 = 4'hb == io_op; // @[Conditional.scala 37:30]
  wire  _T_14 = io_a < io_b; // @[ALU.scala 48:26]
  wire  _GEN_0 = _T_13 & _T_14; // @[Conditional.scala 39:67]
  wire  _GEN_1 = _T_11 ? _T_12 : _GEN_0; // @[Conditional.scala 39:67]
  wire  _GEN_2 = _T_9 ? _T_10 : _GEN_1; // @[Conditional.scala 39:67]
  wire [31:0] _GEN_3 = _T_8 ? io_b : 32'h0; // @[Conditional.scala 39:67]
  wire  _GEN_4 = _T_8 ? 1'h0 : _GEN_2; // @[Conditional.scala 39:67]
  wire [31:0] _GEN_5 = _T_5 ? _T_7 : _GEN_3; // @[Conditional.scala 39:67]
  wire  _GEN_6 = _T_5 ? 1'h0 : _GEN_4; // @[Conditional.scala 39:67]
  wire [63:0] _GEN_7 = _T_3 ? _T_4 : {{32'd0}, _GEN_5}; // @[Conditional.scala 39:67]
  wire  _GEN_8 = _T_3 ? 1'h0 : _GEN_6; // @[Conditional.scala 39:67]
  wire [63:0] _GEN_9 = _T ? {{32'd0}, _T_2} : _GEN_7; // @[Conditional.scala 40:58]
  assign io_result = _GEN_9[31:0]; // @[ALU.scala 14:13 ALU.scala 30:17 ALU.scala 33:17 ALU.scala 36:17 ALU.scala 39:17]
  assign io_boolVal = _T ? 1'h0 : _GEN_8; // @[ALU.scala 15:14 ALU.scala 42:18 ALU.scala 45:18 ALU.scala 48:18]
endmodule
module CPUTop(
  input         clock,
  input         reset,
  output        io_done,
  input         io_run,
  input         io_testerDataMemEnable,
  input  [15:0] io_testerDataMemAddress,
  output [31:0] io_testerDataMemDataRead,
  input         io_testerDataMemWriteEnable,
  input  [31:0] io_testerDataMemDataWrite,
  input         io_testerProgMemEnable,
  input  [15:0] io_testerProgMemAddress,
  output [31:0] io_testerProgMemDataRead,
  input         io_testerProgMemWriteEnable,
  input  [31:0] io_testerProgMemDataWrite
);
  wire  programCounter_clock; // @[CPUTop.scala 23:30]
  wire  programCounter_reset; // @[CPUTop.scala 23:30]
  wire  programCounter_io_stop; // @[CPUTop.scala 23:30]
  wire  programCounter_io_jump; // @[CPUTop.scala 23:30]
  wire  programCounter_io_run; // @[CPUTop.scala 23:30]
  wire [15:0] programCounter_io_programCounterJump; // @[CPUTop.scala 23:30]
  wire [15:0] programCounter_io_programCounter; // @[CPUTop.scala 23:30]
  wire  dataMemory_clock; // @[CPUTop.scala 24:26]
  wire [15:0] dataMemory_io_address; // @[CPUTop.scala 24:26]
  wire [31:0] dataMemory_io_dataRead; // @[CPUTop.scala 24:26]
  wire  dataMemory_io_writeEnable; // @[CPUTop.scala 24:26]
  wire [31:0] dataMemory_io_dataWrite; // @[CPUTop.scala 24:26]
  wire  dataMemory_io_testerEnable; // @[CPUTop.scala 24:26]
  wire [15:0] dataMemory_io_testerAddress; // @[CPUTop.scala 24:26]
  wire [31:0] dataMemory_io_testerDataRead; // @[CPUTop.scala 24:26]
  wire  dataMemory_io_testerWriteEnable; // @[CPUTop.scala 24:26]
  wire [31:0] dataMemory_io_testerDataWrite; // @[CPUTop.scala 24:26]
  wire  programMemory_clock; // @[CPUTop.scala 25:29]
  wire [15:0] programMemory_io_address; // @[CPUTop.scala 25:29]
  wire [31:0] programMemory_io_instructionRead; // @[CPUTop.scala 25:29]
  wire  programMemory_io_testerEnable; // @[CPUTop.scala 25:29]
  wire [15:0] programMemory_io_testerAddress; // @[CPUTop.scala 25:29]
  wire [31:0] programMemory_io_testerDataRead; // @[CPUTop.scala 25:29]
  wire  programMemory_io_testerWriteEnable; // @[CPUTop.scala 25:29]
  wire [31:0] programMemory_io_testerDataWrite; // @[CPUTop.scala 25:29]
  wire  registerFile_clock; // @[CPUTop.scala 26:28]
  wire  registerFile_reset; // @[CPUTop.scala 26:28]
  wire [4:0] registerFile_io_aSel; // @[CPUTop.scala 26:28]
  wire [4:0] registerFile_io_bSel; // @[CPUTop.scala 26:28]
  wire [31:0] registerFile_io_writeData; // @[CPUTop.scala 26:28]
  wire [4:0] registerFile_io_writeSel; // @[CPUTop.scala 26:28]
  wire  registerFile_io_writeEnable; // @[CPUTop.scala 26:28]
  wire [31:0] registerFile_io_aOut; // @[CPUTop.scala 26:28]
  wire [31:0] registerFile_io_bOut; // @[CPUTop.scala 26:28]
  wire [4:0] controlUnit_io_opcode; // @[CPUTop.scala 27:27]
  wire [3:0] controlUnit_io_ALU_op; // @[CPUTop.scala 27:27]
  wire  controlUnit_io_c_jump; // @[CPUTop.scala 27:27]
  wire  controlUnit_io_mux_sel1; // @[CPUTop.scala 27:27]
  wire  controlUnit_io_mux_sel2; // @[CPUTop.scala 27:27]
  wire  controlUnit_io_stop; // @[CPUTop.scala 27:27]
  wire  controlUnit_io_u_jump; // @[CPUTop.scala 27:27]
  wire  controlUnit_io_write_enable_dm; // @[CPUTop.scala 27:27]
  wire  controlUnit_io_write_enable_reg; // @[CPUTop.scala 27:27]
  wire [3:0] alu_io_op; // @[CPUTop.scala 28:19]
  wire [31:0] alu_io_a; // @[CPUTop.scala 28:19]
  wire [31:0] alu_io_b; // @[CPUTop.scala 28:19]
  wire [31:0] alu_io_result; // @[CPUTop.scala 28:19]
  wire  alu_io_boolVal; // @[CPUTop.scala 28:19]
  wire [31:0] instruction = programMemory_io_instructionRead; // @[CPUTop.scala 43:25 CPUTop.scala 79:15]
  wire [15:0] intermediate = instruction[16:1]; // @[CPUTop.scala 134:30]
  wire [31:0] _T = {16'h0,intermediate}; // @[Cat.scala 29:58]
  wire  intSel = controlUnit_io_mux_sel2; // @[CPUTop.scala 57:20 CPUTop.scala 97:10]
  wire [31:0] b = registerFile_io_bOut; // @[CPUTop.scala 52:15 CPUTop.scala 88:5]
  wire  writeDataSel = controlUnit_io_mux_sel1; // @[CPUTop.scala 58:26 CPUTop.scala 98:16]
  wire [31:0] dataRead = dataMemory_io_dataRead; // @[CPUTop.scala 62:22 CPUTop.scala 112:12]
  wire [31:0] result = alu_io_result; // @[CPUTop.scala 59:20 CPUTop.scala 105:10]
  wire  boolResult = alu_io_boolVal; // @[CPUTop.scala 60:24 CPUTop.scala 106:14]
  wire  cJump = controlUnit_io_c_jump; // @[CPUTop.scala 54:19 CPUTop.scala 94:9]
  wire  jumpAndOr = boolResult & cJump; // @[CPUTop.scala 123:27]
  wire  uJump = controlUnit_io_u_jump; // @[CPUTop.scala 53:19 CPUTop.scala 93:9]
  ProgramCounter programCounter ( // @[CPUTop.scala 23:30]
    .clock(programCounter_clock),
    .reset(programCounter_reset),
    .io_stop(programCounter_io_stop),
    .io_jump(programCounter_io_jump),
    .io_run(programCounter_io_run),
    .io_programCounterJump(programCounter_io_programCounterJump),
    .io_programCounter(programCounter_io_programCounter)
  );
  DataMemory dataMemory ( // @[CPUTop.scala 24:26]
    .clock(dataMemory_clock),
    .io_address(dataMemory_io_address),
    .io_dataRead(dataMemory_io_dataRead),
    .io_writeEnable(dataMemory_io_writeEnable),
    .io_dataWrite(dataMemory_io_dataWrite),
    .io_testerEnable(dataMemory_io_testerEnable),
    .io_testerAddress(dataMemory_io_testerAddress),
    .io_testerDataRead(dataMemory_io_testerDataRead),
    .io_testerWriteEnable(dataMemory_io_testerWriteEnable),
    .io_testerDataWrite(dataMemory_io_testerDataWrite)
  );
  ProgramMemory programMemory ( // @[CPUTop.scala 25:29]
    .clock(programMemory_clock),
    .io_address(programMemory_io_address),
    .io_instructionRead(programMemory_io_instructionRead),
    .io_testerEnable(programMemory_io_testerEnable),
    .io_testerAddress(programMemory_io_testerAddress),
    .io_testerDataRead(programMemory_io_testerDataRead),
    .io_testerWriteEnable(programMemory_io_testerWriteEnable),
    .io_testerDataWrite(programMemory_io_testerDataWrite)
  );
  RegisterFile registerFile ( // @[CPUTop.scala 26:28]
    .clock(registerFile_clock),
    .reset(registerFile_reset),
    .io_aSel(registerFile_io_aSel),
    .io_bSel(registerFile_io_bSel),
    .io_writeData(registerFile_io_writeData),
    .io_writeSel(registerFile_io_writeSel),
    .io_writeEnable(registerFile_io_writeEnable),
    .io_aOut(registerFile_io_aOut),
    .io_bOut(registerFile_io_bOut)
  );
  ControlUnit controlUnit ( // @[CPUTop.scala 27:27]
    .io_opcode(controlUnit_io_opcode),
    .io_ALU_op(controlUnit_io_ALU_op),
    .io_c_jump(controlUnit_io_c_jump),
    .io_mux_sel1(controlUnit_io_mux_sel1),
    .io_mux_sel2(controlUnit_io_mux_sel2),
    .io_stop(controlUnit_io_stop),
    .io_u_jump(controlUnit_io_u_jump),
    .io_write_enable_dm(controlUnit_io_write_enable_dm),
    .io_write_enable_reg(controlUnit_io_write_enable_reg)
  );
  ALU alu ( // @[CPUTop.scala 28:19]
    .io_op(alu_io_op),
    .io_a(alu_io_a),
    .io_b(alu_io_b),
    .io_result(alu_io_result),
    .io_boolVal(alu_io_boolVal)
  );
  assign io_done = controlUnit_io_stop; // @[CPUTop.scala 68:11]
  assign io_testerDataMemDataRead = dataMemory_io_testerDataRead; // @[CPUTop.scala 146:28]
  assign io_testerProgMemDataRead = programMemory_io_testerDataRead; // @[CPUTop.scala 140:28]
  assign programCounter_clock = clock;
  assign programCounter_reset = reset;
  assign programCounter_io_stop = controlUnit_io_stop; // @[CPUTop.scala 72:26]
  assign programCounter_io_jump = jumpAndOr | uJump; // @[CPUTop.scala 73:26]
  assign programCounter_io_run = io_run; // @[CPUTop.scala 71:25]
  assign programCounter_io_programCounterJump = instruction[16:1]; // @[CPUTop.scala 74:40]
  assign dataMemory_clock = clock;
  assign dataMemory_io_address = b[31:16]; // @[CPUTop.scala 111:25]
  assign dataMemory_io_writeEnable = controlUnit_io_write_enable_dm; // @[CPUTop.scala 109:29]
  assign dataMemory_io_dataWrite = registerFile_io_bOut; // @[CPUTop.scala 110:27]
  assign dataMemory_io_testerEnable = io_testerDataMemEnable; // @[CPUTop.scala 148:30]
  assign dataMemory_io_testerAddress = io_testerDataMemAddress; // @[CPUTop.scala 145:31]
  assign dataMemory_io_testerWriteEnable = io_testerDataMemWriteEnable; // @[CPUTop.scala 149:35]
  assign dataMemory_io_testerDataWrite = io_testerDataMemDataWrite; // @[CPUTop.scala 147:33]
  assign programMemory_clock = clock;
  assign programMemory_io_address = programCounter_io_programCounter; // @[CPUTop.scala 78:28]
  assign programMemory_io_testerEnable = io_testerProgMemEnable; // @[CPUTop.scala 142:33]
  assign programMemory_io_testerAddress = io_testerProgMemAddress; // @[CPUTop.scala 139:34]
  assign programMemory_io_testerWriteEnable = io_testerProgMemWriteEnable; // @[CPUTop.scala 143:38]
  assign programMemory_io_testerDataWrite = io_testerProgMemDataWrite; // @[CPUTop.scala 141:36]
  assign registerFile_clock = clock;
  assign registerFile_reset = reset;
  assign registerFile_io_aSel = instruction[21:17]; // @[CPUTop.scala 84:24]
  assign registerFile_io_bSel = instruction[16:12]; // @[CPUTop.scala 85:24]
  assign registerFile_io_writeData = writeDataSel ? dataRead : result; // @[CPUTop.scala 86:29]
  assign registerFile_io_writeSel = instruction[26:22]; // @[CPUTop.scala 83:28]
  assign registerFile_io_writeEnable = controlUnit_io_write_enable_reg; // @[CPUTop.scala 82:31]
  assign controlUnit_io_opcode = instruction[31:27]; // @[CPUTop.scala 91:25]
  assign alu_io_op = controlUnit_io_ALU_op; // @[CPUTop.scala 104:13]
  assign alu_io_a = registerFile_io_aOut; // @[CPUTop.scala 102:12]
  assign alu_io_b = intSel ? b : _T; // @[CPUTop.scala 103:12]
endmodule
