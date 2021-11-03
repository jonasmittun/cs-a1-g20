import chisel3._
import chisel3.util._


class ALU extends Module {
  val io = IO(new Bundle {
    val op = Input(UInt(4.W))
    val a = Input(UInt(32.W))
    val b = Input(UInt(32.W))
    val result = Output(UInt(32.W))
    val boolVal = Output(Bool())
  })

  io.result := 0.U
  io.boolVal := false.B

  val op = io.op
  val ADDI: UInt = 0x1.U
  val SUBI: UInt = 0x2.U
  val MULI: UInt = 0x3.U
  val SET:  UInt = 0x7.U
  val LDD:  UInt = 0x8.U
  val JEQI: UInt = 0x9.U
  val JGTI: UInt = 0xA.U
  val JLTI: UInt = 0xB.U

  switch(op) {
    is(ADDI) {
      io.result := io.a + io.b
    }
    is(MULI) {
      io.result := io.a * io.b
    }
    is(SUBI) {
      io.result := io.a - io.b
    }
    is(SET) {
      io.result := io.b
    }
    is(JEQI) {
      io.boolVal := (io.a === io.b)
    }
    is(JGTI) {
      io.boolVal := io.a > io.b
    }
    is(JLTI) {
      io.boolVal := io.a < io.b
    }
    is(LDD) {
      io.result := io.a
    }
  }
}