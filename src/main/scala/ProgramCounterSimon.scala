import chisel3._
import chisel3.util._

class ProgramCounterSimon extends Module {
  val io = IO(new Bundle {
    val stop = Input(Bool())
    val jump = Input(Bool())
    val run = Input(Bool())
    val programCounterJump = Input(UInt(16.W))
    val programCounter = Output(UInt(16.W))
  })

  //Define register and incrementer
  val inc = Module(new Incrementer())
  val reg = RegInit(0.U(16.W))

  //Define internal wires from multiplexor output
  val mult1Out = Wire(UInt(16.W))
  val mult2Out = Wire(UInt(16.W))

  //Define internal wire from not output
  val notOut = Wire(Bool())
  notOut := !io.run

  //Define internal wire from or output
  val orOut = Wire(Bool())
  orOut := notOut | io.stop

  //First multiplexor
  when (io.jump) {
    mult1Out := io.programCounterJump
  } .otherwise {
    mult1Out := inc.io.out
  }

  //Second multiplexor
  when (orOut) {
    mult2Out := reg
  } .otherwise {
    mult2Out := mult1Out
  }

  //Connect register to output of second multiplexor output
  reg := mult2Out

  //Connect incrementer and output wire to register output
  inc.io.a := reg
  io.programCounter := reg



  //Implement this module here (respect the provided interface, since it used by the tester)
}

//Incrementer module
class Incrementer extends Module {
  val io = IO(new Bundle {
    val a = Input(UInt(16.W))
    val out = Output(UInt(16.W))
  })

  io.out := io.a + 1.U
}
