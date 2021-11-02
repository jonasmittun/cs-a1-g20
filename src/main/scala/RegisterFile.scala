import chisel3._
import chisel3.util._

class RegisterFile extends Module {
  val io = IO(new Bundle {
    //Define the module interface here (inputs/outputs)
    val aSel = Input(UInt(5.W))
    val bSel = Input(UInt(5.W))
    val writeData = Input(UInt(32.W))
    val writeSel = Input(UInt(5.W))
    val writeEnable = Input(Bool())
    val aOut = Output(UInt(32.W))
    val bOut = Output(UInt(32.W))
  })

  //Implement this module here

  val reg = RegInit(VecInit(Seq.fill(32)(0.U(32.W))))

  io.aOut := reg(io.aSel)
  io.bOut := reg(io.bSel)

  when(io.writeEnable){
    reg(io.writeSel) := io.writeData
  } .otherwise {
    reg(io.writeSel) := reg(io.writeSel)
  }

}