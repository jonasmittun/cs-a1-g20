;buildInfoPackage: chisel3, version: 3.3.2, scalaVersion: 2.12.11, sbtVersion: 1.3.10
circuit ALU : 
  module ALU : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip op : UInt<4>, flip a : UInt<32>, flip b : UInt<32>, result : UInt<32>}
    
    io.result <= UInt<32>("h00") @[ALU.scala 23:13]
    node _T = eq(io.op, UInt<1>("h01")) @[ALU.scala 25:12]
    when _T : @[ALU.scala 25:21]
      node _T_1 = add(io.a, io.b) @[ALU.scala 26:21]
      node _T_2 = tail(_T_1, 1) @[ALU.scala 26:21]
      io.result <= _T_2 @[ALU.scala 26:15]
      skip @[ALU.scala 25:21]
    
