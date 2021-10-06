module Incrementer(
  input  [15:0] io_a,
  output [15:0] io_out
);
  assign io_out = io_a + 16'h1; // @[ProgramCounter.scala 62:10]
endmodule
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
  wire [15:0] inc_io_a; // @[ProgramCounter.scala 14:19]
  wire [15:0] inc_io_out; // @[ProgramCounter.scala 14:19]
  reg [15:0] reg_; // @[ProgramCounter.scala 15:20]
  wire  notOut = ~io_run; // @[ProgramCounter.scala 23:13]
  wire  orOut = notOut | io_stop; // @[ProgramCounter.scala 27:19]
  Incrementer inc ( // @[ProgramCounter.scala 14:19]
    .io_a(inc_io_a),
    .io_out(inc_io_out)
  );
  assign io_programCounter = reg_; // @[ProgramCounter.scala 48:21]
  assign inc_io_a = reg_; // @[ProgramCounter.scala 47:12]
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
    end else if (!(orOut)) begin
      if (io_jump) begin
        reg_ <= io_programCounterJump;
      end else begin
        reg_ <= inc_io_out;
      end
    end
  end
endmodule
