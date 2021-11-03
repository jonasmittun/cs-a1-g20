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
  val intMuxOut = Wire(UInt(32.W))
  val dataRead = Wire(UInt(32.W))
  val dataWrite = Wire(UInt(32.W))
  val dataAddress = Wire(UInt(16.W))
  val jumpAndOr = Wire(Bool())

  //Done signal to CPUTopTester
  io.done := controlUnit.io.stop

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
  writeEnableReg := controlUnit.io.write_enable_reg

  //ALU
  alu.io.a := a
  alu.io.b := intMuxOut
  alu.io.op := aluOp
  result := alu.io.result
  boolResult := alu.io.boolVal

  //Data Memory
  dataMemory.io.writeEnable := writeEnableDat
  dataMemory.io.dataWrite := dataWrite
  dataMemory.io.address := dataAddress
  dataRead := dataMemory.io.dataRead

  //Intermediate mux
  when (intSel){
    intMuxOut := b
  } .otherwise {
    intMuxOut := Cat(0.U(16.W),intermediate)
  }

  //Data mux
  when (writeDataSel){
    writeData := dataRead
  } .otherwise {
    writeData := result
  }

  //AND
  jumpAndOr := boolResult & cJump

  //OR
  jump := jumpAndOr | uJump

  //Wire splits
  counterJump := instruction(16, 1)
  opcode := instruction(31, 27)
  writeSel := instruction(26, 22)
  aSel := instruction(21, 17)
  bSel := instruction(16, 12)
  intermediate := instruction(16, 1)
  dataWrite := b
  dataAddress := a(15, 0)

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