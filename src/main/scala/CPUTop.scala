import chisel3._
import chisel3.util._

class CPUTop extends Module {
  val io = IO(new Bundle {
    val done = Output(Bool ())
    val run = Input(Bool ())
    //This signals are used by the tester for loading and dumping the memory content, do not touch
    val testerDataMemEnable = Input(Bool ())
    val testerDataMemAddress = Input(UInt (16.W))
    val testerDataMemDataRead = Output(UInt (32.W))
    val testerDataMemWriteEnable = Input(Bool ())
    val testerDataMemDataWrite = Input(UInt (32.W))
    //This signals are used by the tester for loading and dumping the memory content, do not touch
    val testerProgMemEnable = Input(Bool ())
    val testerProgMemAddress = Input(UInt (16.W))
    val testerProgMemDataRead = Output(UInt (32.W))
    val testerProgMemWriteEnable = Input(Bool ())
    val testerProgMemDataWrite = Input(UInt (32.W))
  })

  //Creating components
  val programCounter = Module(new ProgramCounter())
  val dataMemory = Module(new DataMemory())
  val programMemory = Module(new ProgramMemory())
  val registerFile = Module(new RegisterFile())
  val controlUnit = Module(new ControlUnit())
  val alu = Module(new ALU())

  //Connecting the modules
  //programCounter.io.run := io.run
  //programMemory.io.address := programCounter.io.programCounter

  ////////////////////////////////////////////
  //Continue here with your connections
  ////////////////////////////////////////////

  //Done signal to CPUTopTester
  io.done := controlUnit.io.stop

  //ProgramCounter connections
  programCounter.io.run := io.run
  programCounter.io.stop := controlUnit.io.stop
  programCounter.io.jump := controlUnit.io.u_jump | (controlUnit.io.c_jump & alu.io.boolVal)
  programCounter.io.programCounterJump := programMemory.io.instructionRead(16, 1)

  //ProgramMemory connections
  programMemory.io.address := programCounter.io.programCounter

  //Register
  registerFile.io.writeEnable := controlUnit.io.write_enable_reg
  registerFile.io.writeSel := programMemory.io.instructionRead(26, 22)
  registerFile.io.aSel := programMemory.io.instructionRead(21, 17)
  registerFile.io.bSel := programMemory.io.instructionRead(16, 12)
  registerFile.io.writeData := Mux(controlUnit.io.mux_sel1, dataMemory.io.dataRead, alu.io.result)

  //Control Unit
  controlUnit.io.opcode := programMemory.io.instructionRead(31, 27)

  //ALU
  alu.io.a := registerFile.io.aOut
  alu.io.b := Mux(controlUnit.io.mux_sel2, registerFile.io.bOut, programMemory.io.instructionRead(16, 1))
  alu.io.op := controlUnit.io.ALU_op

  //Data Memory
  dataMemory.io.writeEnable := controlUnit.io.write_enable_dm
  dataMemory.io.dataWrite := registerFile.io.bOut
  dataMemory.io.address := registerFile.io.aOut

  //This signals are used by the tester for loading the program to the program memory, do not touch
  programMemory.io.testerAddress := io.testerProgMemAddress
  io.testerProgMemDataRead := programMemory.io.testerDataRead
  programMemory.io.testerDataWrite := io.testerProgMemDataWrite
  programMemory.io.testerEnable := io.testerProgMemEnable
  programMemory.io.testerWriteEnable := io.testerProgMemWriteEnable
  //This signals are used by the tester for loading and dumping the data memory content, do not touch
  dataMemory.io.testerAddress := io.testerDataMemAddress
  io.testerDataMemDataRead := dataMemory.io.testerDataRead
  dataMemory.io.testerDataWrite := io.testerDataMemDataWrite
  dataMemory.io.testerEnable := io.testerDataMemEnable
  dataMemory.io.testerWriteEnable := io.testerDataMemWriteEnable
}