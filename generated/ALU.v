module ALU(
  input         clock,
  input         reset,
  input  [3:0]  io_op,
  input  [31:0] io_a,
  input  [31:0] io_b,
  output [31:0] io_result
);
  wire  _T = io_op == 4'h1; // @[ALU.scala 25:12]
  wire [31:0] _T_2 = io_a + io_b; // @[ALU.scala 26:21]
  assign io_result = _T ? _T_2 : 32'h0; // @[ALU.scala 23:13 ALU.scala 26:15]
endmodule
