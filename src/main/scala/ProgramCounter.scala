import chisel3._

class ProgramCounter extends Module {
  val io = IO(new Bundle {
    val stop = Input(Bool())
    val jump = Input(Bool())
    val run = Input(Bool())
    val programCounterJump = Input(UInt(16.W))
    val programCounter = Output(UInt(16.W))
  })

  //Implement this module here (respect the provided interface, since it used by the tester)




  val w1 = Wire(Bool())
  val w2 = Wire(Bool())
  val w3 = Wire(UInt(16.W))

  w1 := !io.run
  w2 := io.stop | w1
  w3 := io.programCounter + 1.U

  val m1 = Mux(io.jump, io.programCounterJump, w3)
  val m2 = Mux(w2, io.programCounter, m1)

  val reg = RegInit(0.U(16.W))

  reg := m2

  io.programCounter := reg

}