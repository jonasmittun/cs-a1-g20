;buildInfoPackage: chisel3, version: 3.3.2, scalaVersion: 2.12.11, sbtVersion: 1.3.10
circuit ProgramCounter : 
  module ProgramCounter : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip stop : UInt<1>, flip jump : UInt<1>, flip run : UInt<1>, flip programCounterJump : UInt<16>, programCounter : UInt<16>}
    
    wire w1 : UInt<1> @[ProgramCounter.scala 14:16]
    wire w2 : UInt<1> @[ProgramCounter.scala 15:16]
    wire w3 : UInt<16> @[ProgramCounter.scala 16:16]
    node _T = eq(io.run, UInt<1>("h00")) @[ProgramCounter.scala 18:9]
    w1 <= _T @[ProgramCounter.scala 18:6]
    node _T_1 = or(io.stop, w1) @[ProgramCounter.scala 19:17]
    w2 <= _T_1 @[ProgramCounter.scala 19:6]
    node _T_2 = add(io.programCounter, UInt<1>("h01")) @[ProgramCounter.scala 20:27]
    node _T_3 = tail(_T_2, 1) @[ProgramCounter.scala 20:27]
    w3 <= _T_3 @[ProgramCounter.scala 20:6]
    node m1 = mux(io.jump, io.programCounterJump, w3) @[ProgramCounter.scala 22:15]
    node m2 = mux(w2, io.programCounter, m1) @[ProgramCounter.scala 23:15]
    reg reg : UInt<16>, clock with : (reset => (reset, UInt<16>("h00"))) @[ProgramCounter.scala 25:20]
    reg <= m2 @[ProgramCounter.scala 27:7]
    io.programCounter <= reg @[ProgramCounter.scala 29:21]
    
