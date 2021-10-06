;buildInfoPackage: chisel3, version: 3.3.2, scalaVersion: 2.12.11, sbtVersion: 1.3.10
circuit ProgramCounter : 
  module Incrementer : 
    input clock : Clock
    input reset : Reset
    output io : {flip a : UInt<16>, out : UInt<16>}
    
    node _T = add(io.a, UInt<1>("h01")) @[ProgramCounter.scala 62:18]
    node _T_1 = tail(_T, 1) @[ProgramCounter.scala 62:18]
    io.out <= _T_1 @[ProgramCounter.scala 62:10]
    
  module ProgramCounter : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip stop : UInt<1>, flip jump : UInt<1>, flip run : UInt<1>, flip programCounterJump : UInt<16>, programCounter : UInt<16>}
    
    inst inc of Incrementer @[ProgramCounter.scala 14:19]
    inc.clock <= clock
    inc.reset <= reset
    reg reg : UInt<16>, clock with : (reset => (reset, UInt<16>("h00"))) @[ProgramCounter.scala 15:20]
    wire mult1Out : UInt<16> @[ProgramCounter.scala 18:22]
    wire mult2Out : UInt<16> @[ProgramCounter.scala 19:22]
    wire notOut : UInt<1> @[ProgramCounter.scala 22:20]
    node _T = eq(io.run, UInt<1>("h00")) @[ProgramCounter.scala 23:13]
    notOut <= _T @[ProgramCounter.scala 23:10]
    wire orOut : UInt<1> @[ProgramCounter.scala 26:19]
    node _T_1 = or(notOut, io.stop) @[ProgramCounter.scala 27:19]
    orOut <= _T_1 @[ProgramCounter.scala 27:9]
    when io.jump : @[ProgramCounter.scala 30:18]
      mult1Out <= io.programCounterJump @[ProgramCounter.scala 31:14]
      skip @[ProgramCounter.scala 30:18]
    else : @[ProgramCounter.scala 32:16]
      mult1Out <= inc.io.out @[ProgramCounter.scala 33:14]
      skip @[ProgramCounter.scala 32:16]
    when orOut : @[ProgramCounter.scala 37:16]
      mult2Out <= reg @[ProgramCounter.scala 38:14]
      skip @[ProgramCounter.scala 37:16]
    else : @[ProgramCounter.scala 39:16]
      mult2Out <= mult1Out @[ProgramCounter.scala 40:14]
      skip @[ProgramCounter.scala 39:16]
    reg <= mult2Out @[ProgramCounter.scala 44:7]
    inc.io.a <= reg @[ProgramCounter.scala 47:12]
    io.programCounter <= reg @[ProgramCounter.scala 48:21]
    
