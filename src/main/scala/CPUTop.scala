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

  //Wires
  val stop = Wire(Bool())
  val jump = Wire(Bool())
  val counterJump = Wire(UInt(16.W))
  val counter = Wire(UInt(16.W))
  val instruction = Wire(UInt(32.W))
  val opcode = Wire(UInt(5.W))
  val writeSel = Wire(UInt(5.W))
  val aSel = Wire(UInt(5.W))
  val bSel = Wire(UInt(5.W))
  val intermediate = Wire(UInt(16.W))
  val writeEnableReg = Wire(Bool())
  val writeData = Wire(UInt(32.W))
  val a = Wire(UInt(32.W))
  val b = Wire(UInt(32.W))
  val uJump = Wire(Bool())
  val cJump = Wire(Bool())
  val writeEnableDat = Wire(Bool())
  val aluOp = Wire(UInt(4.W))
  val intSel = Wire(Bool())
  val writeDataSel = Wire(Bool())
  val result = Wire(UInt(32.W))
  val boolResult = Wire(Bool())
  val bMux = Wire(Bool())
  val dataRead = Wire(UInt(32.W))
  val dataWrite = Wire(UInt(32.W))
  val dataAddress = Wire(UInt(16.W))
  val jumpAndOr = Wire(Bool())

  //ProgramCounter connections
  programCounter.io.run := io.run
  programCounter.io.stop := stop
  programCounter.io.jump := jump
  programCounter.io.programCounterJump := counterJump
  counter := programCounter.io.programCounter

  //ProgramMemory connections
  programMemory.io.address := counter
  instruction := programMemory.io.instructionRead

  //Register
  registerFile.io.writeEnable := writeEnableReg
  registerFile.io.writeSel := writeSel
  registerFile.io.aSel := aSel
  registerFile.io.bSel := bSel
  registerFile.io.writeData := writeData
  a := registerFile.io.aOut
  b := registerFile.io.bOut

  //Control Unit
  controlUnit.io.opcode := opcode
  stop := controlUnit.io.stop
  uJump := controlUnit.io.u_jump
  cJump := controlUnit.io.c_jump
  writeEnableDat := controlUnit.io.write_enable_dm
  aluOp := controlUnit.io.ALU_op
  intSel := controlUnit.io.mux_sel2
  writeDataSel := controlUnit.io.mux_sel1

  //ALU
  alu.io.a := a
  alu.io.b := bMux
  alu.io.op := aluOp
  result := alu.io.result
  boolResult := alu.io.boolVal

  //Data Memory
  dataMemory.io.writeEnable := writeEnableDat
  dataMemory.io.dataWrite := dataWrite
  dataMemory.io.address := dataAddress
  dataRead := dataMemory.io.dataRead

  //Intermediate mux
  val intMux = Mux(intSel, b, intermediate)
  bMux := intMux

  //Data mux
  val datMux = Mux(writeDataSel, dataRead, result)
  writeData := datMux

  //AND
  jumpAndOr := boolResult & cJump

  //OR
  jump := jumpAndOr | uJump

  //Wire splits
  counterJump := instruction(16,31)
  opcode := instruction(27,31)
  writeSel := instruction(22,26)
  aSel := instruction(17,21)
  bSel := instruction(12,16)
  intermediate := instruction(1,16)
  dataWrite := b
  dataAddress := b(16,31)

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