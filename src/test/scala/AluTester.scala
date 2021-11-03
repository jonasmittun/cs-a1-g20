import chisel3.iotesters
import chisel3.iotesters.PeekPokeTester

class AluTester(dut: ALU) extends PeekPokeTester(dut) {

  //ADDI
  poke(dut.io.a, 2)
  poke(dut.io.b, 3)
  poke(dut.io.op, 0x1)
  step(5)

  //SUBI
  poke(dut.io.a, 3)
  poke(dut.io.b, 2)
  poke(dut.io.op, 0x2)
  step(5)

  //MULI
  poke(dut.io.a, 3)
  poke(dut.io.b, 2)
  poke(dut.io.op, 0x3)
  step(5)

  //JEQI
  poke(dut.io.a, 3)
  poke(dut.io.b, 2)
  poke(dut.io.op, 0xD)
  step(5)

  poke(dut.io.a, 3)
  poke(dut.io.b, 3)
  poke(dut.io.op, 0xD)
  step(5)

  //JGTI
  poke(dut.io.a, 3)
  poke(dut.io.b, 3)
  poke(dut.io.op,   0xE)
  step(5)

  poke(dut.io.a, 3)
  poke(dut.io.b, 2)
  poke(dut.io.op,   0xE)
  step(5)

  poke(dut.io.a, 2)
  poke(dut.io.b, 3)
  poke(dut.io.op,   0xE)
  step(5)

  //JLTI
  poke(dut.io.a, 3)
  poke(dut.io.b, 3)
  poke(dut.io.op,   0xF)
  step(5)

  poke(dut.io.a, 3)
  poke(dut.io.b, 2)
  poke(dut.io.op,   0xF)
  step(5)

  poke(dut.io.a, 2)
  poke(dut.io.b, 3)
  poke(dut.io.op,   0xF)
  step(5)

}

object AluTester {
  def main(args: Array[String]): Unit = {
    println("Testing Register")
    iotesters.Driver.execute(
      Array("--generate-vcd-output", "on",
        "--target-dir", "generated",
        "--top-name", "ProgramCounter"),
      () => new ALU()) {
      c => new AluTester(c)
    }
  }
}

