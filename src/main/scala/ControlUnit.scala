/*
 *
 * Written by s204488
 * Revision by s204502
 *
 */

import chisel3._
import chisel3.util._

class ControlUnit extends Module {
  val io = IO(new Bundle {
    val opcode = Input(UInt(5.W))

    val ALU_op = Output(UInt(5.W))
    val data_mux_sel = Output(Bool())
    val int_mux_sel = Output(Bool())
    val c_jump = Output(Bool())
    val u_jump = Output(Bool())
    val write_enable_dm = Output(Bool())
    val write_enable_reg = Output(Bool())
    val stop = Output(Bool())
  })

  //Define instructions as opcode values
  val ADD:  UInt = 0x01.U
  val ADDI: UInt = 0x02.U
  val SUB:  UInt = 0x03.U
  val SUBI: UInt = 0x04.U
  val MUL:  UInt = 0x05.U
  val MULI: UInt = 0x06.U
  val SET:  UInt = 0x11.U
  val LDD:  UInt = 0x12.U
  val STR:  UInt = 0x13.U
  val JMPI: UInt = 0x19.U
  val JEQ:  UInt = 0x15.U
  val JGT:  UInt = 0x16.U
  val JLT:  UInt = 0x17.U
  val JEQI: UInt = 0x1A.U
  val JGTI: UInt = 0x1B.U
  val JLTI: UInt = 0x1C.U
  val END:  UInt = 0x1F.U

  // Instantiate outputs                    Default
  io.ALU_op := 0.U                          // ALU operation 00000
  io.data_mux_sel := true.B                 // Use ALU result
  io.int_mux_sel := false.B                 // Don't immediate value
  io.c_jump := false.B                      // Don't jump
  io.u_jump := false.B
  io.write_enable_dm := false.B             // Don't write to data memory
  io.write_enable_reg := true.B             // Write to register
  io.stop := false.B                        // Don't stop

  switch(io.opcode){
    is(ADD){
      io.ALU_op := ADDI                       //ALU operation 00010
    }
    is(ADDI){
      io.int_mux_sel := true.B                //Use immediate value
      io.ALU_op := ADDI                       //ALU operation 00010
    }
    is(SUB){
      io.ALU_op := SUBI                       //ALU operation 00100
    }
    is(SUBI){
      io.int_mux_sel := true.B                //Use immediate value
      io.ALU_op := SUBI                       //ALU operation 00100
    }
    is(MUL){
      io.ALU_op := MULI                       //ALU operation 00110
    }
    is(MULI){
      io.int_mux_sel := true.B                //Use immediate value
      io.ALU_op := MULI                       //ALU operation 00110
    }
    is(SET){
      io.int_mux_sel := true.B                //Use immediate value
      io.ALU_op := SET                        //ALU operation 10001
    }
    is(LDD){
      io.data_mux_sel := false.B              //Don't use ALU output
      io.ALU_op := LDD                        //ALU operation 10010
    }
    is(STR){
      io.data_mux_sel := false.B              //Don't use ALU output
      io.write_enable_dm := true.B            //Write to data memory
      io.write_enable_reg := false.B          //Don't write to register
      io.ALU_op := 0.U                        //ALU operation 00000
    }
    is(JMPI){
      io.int_mux_sel := true.B                //Use immediate value
      io.u_jump := true.B                     //Unconditional Jump
      io.write_enable_reg := false.B          //Don't write to register
      io.ALU_op := 0.U                        //ALU operation 00000
    }
    is(JEQ){
      io.c_jump := true.B                     //Conditional jump
      io.write_enable_reg := false.B          //Don't write to register
      io.ALU_op := JEQI                       //ALU operation 11010
    }
    is(JGT){
      io.c_jump := true.B                     //Conditional jump
      io.write_enable_reg := false.B          //Don't write to register
      io.ALU_op := JGTI                       //ALU operation 11011
    }
    is(JLT){
      io.c_jump := true.B                     //Conditional jump
      io.write_enable_reg := false.B          //Don't write to register
      io.ALU_op := JLTI                       //ALU operation 11100
    }
    is(JEQI){
      io.c_jump := true.B                     //Conditional jump
      io.write_enable_reg := false.B          //Don't write to register
      io.ALU_op := JEQI                       //ALU operation 11010
    }
    is(JGTI){
      io.c_jump := true.B                     //Conditional jump
      io.write_enable_reg := false.B          //Don't write to register
      io.ALU_op := JGTI                       //ALU operation 11011
    }
    is(JLTI){
      io.c_jump := true.B                     //Conditional jump
      io.write_enable_reg := false.B          //Don't write to register
      io.ALU_op := JLTI                       //ALU operation 11100
    }
    is(END){
      io.data_mux_sel := false.B              //Don't use ALU output
      io.stop := true.B                       //Stop
      io.write_enable_reg := false.B          //Don't write to register
      io.ALU_op := 0.U                        //ALU operation 00000
    }
  }
}