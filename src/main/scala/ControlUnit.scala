import chisel3._
import chisel3.util._

class ControlUnit extends Module {
  val io = IO(new Bundle {
    val opcode = Input(UInt(5.W))

    val ALU_op = Output(UInt(4.W))
    val c_jump = Output(Bool())
    val mux_sel1 = Output(Bool())
    val mux_sel2 = Output(Bool())
    val stop = Output(Bool())
    val u_jump = Output(Bool())
    val write_enable_dm = Output(Bool())
    val write_enable_reg = Output(Bool())
  })

  //0x00 reserved for NOP
  io.ALU_op := 0.U
  io.c_jump := false.B
  io.mux_sel1 := false.B
  io.mux_sel2 := false.B
  io.stop := false.B
  io.u_jump := false.B
  io.write_enable_dm := false.B
  io.write_enable_reg := false.B

  when (io.opcode === 0x01.U) {       //ADD
    io.mux_sel1 := true.B                //Use ALU output
    io.mux_sel2 := false.B                //Use register values

    io.stop := false.B                   //Don't stop

    io.c_jump := false.B                  //Don't jump
    io.u_jump := false.B

    io.write_enable_dm := false.B         //Don't write to data memory
    io.write_enable_reg := true.B        //Write to register

    io.ALU_op := 0x1.U                //ALU operation 0001
  }

  when (io.opcode === 0x02.U) {       //ADDI
    io.mux_sel1 := true.B                //Use ALU output
    io.mux_sel2 := true.B                //Use immediate value

    io.stop := false.B                   //Don't stop

    io.c_jump := false.B                  //Don't jump
    io.u_jump := false.B

    io.write_enable_dm := false.B         //Don't write to data memory
    io.write_enable_reg := true.B        //Write to register

    io.ALU_op := 0x1.U                //ALU operation 0001
  }

  when (io.opcode === 0x03.U) {       //SUB
    io.mux_sel1 := true.B                //Use ALU output
    io.mux_sel2 := false.B               //Use register values

    io.stop := false.B                    //Don't stop

    io.c_jump := false.B                  //Don't jump
    io.u_jump := false.B

    io.write_enable_dm := false.B         //Don't write to data memory
    io.write_enable_reg := true.B        //Write to register

    io.ALU_op := 0x2.U                //ALU operation 0010
  }

  when (io.opcode === 0x04.U) {       //SUBI
    io.mux_sel1 := true.B               //Use ALU output
    io.mux_sel2 := true.B                //Use immediate value

    io.stop := false.B                   //Don't stop

    io.c_jump := false.B                  //Don't jump
    io.u_jump := false.B

    io.write_enable_dm := false.B         //Don't write to data memory
    io.write_enable_reg := true.B        //Write to register

    io.ALU_op := 0x2.U                //ALU operation 0010
  }

  when (io.opcode === 0x05.U) {       //MUL
    io.mux_sel1 := true.B                //Use ALU output
    io.mux_sel2 := false.B                //Use register values

    io.stop := false.B                    //Don't stop

    io.c_jump := false.B                 //Don't jump
    io.u_jump := false.B

    io.write_enable_dm := false.B        //Don't write to data memory
    io.write_enable_reg := 1.U        //Write to register

    io.ALU_op := 0x3.U                //ALU operation 0011
  }

  when (io.opcode === 0x06.U) {       //MULI
    io.mux_sel1 := true.B                //Use ALU output
    io.mux_sel2 := true.B                //Use immediate value

    io.stop := false.B                    //Don't stop

    io.c_jump := false.B                  //Don't jump
    io.u_jump := false.B

    io.write_enable_dm := false.B         //Don't write to data memory
    io.write_enable_reg := true.B        //Write to register

    io.ALU_op := 0x3.U                //ALU operation 0011
  }

  when (io.opcode === 0x11.U) {       //SET
    io.mux_sel1 := true.B                //Use ALU output
    io.mux_sel2 := true.B                //Use immediate value

    io.stop := false.B                   //Don't stop

    io.c_jump := false.B                  //Don't jump
    io.u_jump := false.B

    io.write_enable_dm := false.B         //Don't write to data memory
    io.write_enable_reg := true.B        //Write to register

    io.ALU_op := 0x7.U                //ALU operation 0111
  }

  when (io.opcode === 0x12.U) {       //LDD
    io.mux_sel1 := true.B               //Use ALU output
    io.mux_sel2 := false.B                //Use register values

    io.stop := false.B                    //Don't stop

    io.c_jump := false.B                  //Don't jump
    io.u_jump := false.B

    io.write_enable_dm := false.B         //Don't write to data memory
    io.write_enable_reg := true.B       //Write to register

    io.ALU_op := 0x8.U                //ALU operation 1000
  }

  when (io.opcode === 0x13.U) {       //STR
    io.mux_sel1 := false.B                //Use ALU output
    io.mux_sel2 := false.B                //Use register values

    io.stop := false.B                    //Don't stop

    io.c_jump := false.B                  //Don't jump
    io.u_jump := false.B

    io.write_enable_dm := 1.U         //Write to data memory
    io.write_enable_reg := false.B        //Don't write to register

    io.ALU_op := false.B                  //ALU operation 0000
  }

  when (io.opcode === 0x19.U) {       //JMPI
    io.mux_sel1 := true.B               //Use ALU output
    io.mux_sel2 := true.B                //Use immediate value

    io.stop := false.B                    //Don't stop

    io.c_jump := false.B                  //Unconditional jump
    io.u_jump := true.B

    io.write_enable_dm := false.B         //Don't write to data memory
    io.write_enable_reg := false.B        //Don't write to register

    io.ALU_op := false.B                  //ALU operation 0000
  }

  when (io.opcode === 0x15.U) {       //JEQ
    io.mux_sel1 := true.B                //Use ALU output
    io.mux_sel2 := false.B                //Use register values

    io.stop := false.B                    //Don't stop

    io.c_jump := true.B                 //Conditional jump
    io.u_jump := false.B

    io.write_enable_dm := false.B         //Don't write to data memory
    io.write_enable_reg := false.B        //Don't write to register

    io.ALU_op := 0x9.U                //ALU operation 1001
  }

  when (io.opcode === 0x16.U) {       //JGT
    io.mux_sel1 := true.B                //Use ALU output
    io.mux_sel2 := false.B                //Use register values

    io.stop := false.B                    //Don't stop

    io.c_jump := true.B                 //Conditional jump
    io.u_jump := false.B

    io.write_enable_dm := false.B         //Don't write to data memory
    io.write_enable_reg := false.B        //Don't write to register

    io.ALU_op := 0xA.U                //ALU operation 1010
  }

  when (io.opcode === 0x17.U) {       //JLT
    io.mux_sel1 := true.B                //Use ALU output
    io.mux_sel2 := false.B                //Use register values

    io.stop := false.B                    //Don't stop

    io.c_jump := true.B                  //Conditional jump
    io.u_jump := false.B

    io.write_enable_dm := false.B         //Don't write to data memory
    io.write_enable_reg := false.B        //Don't write to register

    io.ALU_op := 0xB.U                //ALU operation 1100
  }

  when (io.opcode === 0x1A.U) {       //JEQI
    io.mux_sel1 := true.B                //Use ALU output
    io.mux_sel2 := true.B                //Use immediate value

    io.stop := false.B                    //Don't stop

    io.c_jump := true.B                 //Conditional jump
    io.u_jump := false.B

    io.write_enable_dm := false.B        //Don't write to data memory
    io.write_enable_reg := false.B        //Don't write to register

    io.ALU_op := 0x9.U                //ALU operation 1101
  }

  when (io.opcode === 0x1B.U) {       //JGTI
    io.mux_sel1 := true.B                //Use ALU output
    io.mux_sel2 := true.B                //Use immediate value

    io.stop := false.B                    //Don't stop

    io.c_jump := true.B                 //Conditional jump
    io.u_jump := false.B

    io.write_enable_dm := false.B         //Don't write to data memory
    io.write_enable_reg := false.B        //Don't write to register

    io.ALU_op := 0xA.U                //ALU operation 1110
  }

  when (io.opcode === 0x1C.U) {       //JLTI
    io.mux_sel1 := true.B                //Use ALU output
    io.mux_sel2 := true.B                //Use immediate value

    io.stop := false.B                    //Don't stop

    io.c_jump := true.B                 //Conditional jump
    io.u_jump := false.B

    io.write_enable_dm := false.B         //Don't write to data memory
    io.write_enable_reg := false.B        //Don't write to register

    io.ALU_op := 0xB.U                //ALU operation 1111
  }

  when (io.opcode === 0x1F.U) {       //END
    io.mux_sel1 := true.B                //Use ALU output
    io.mux_sel2 := false.B                //Use register values

    io.stop := true.B                   //Stop

    io.c_jump := false.B                  //Don't jump
    io.u_jump := false.B

    io.write_enable_dm := false.B         //Don't write to data memory
    io.write_enable_reg := false.B        //Don't write to register

    io.ALU_op := 0.U                  //ALU operation 0000
  }
}