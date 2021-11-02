import chisel3.iotesters
import chisel3.iotesters.PeekPokeTester

class RegisterFileTester(dut: RegisterFile) extends PeekPokeTester(dut) {

  //Do nothing for 5 cycles
  poke(dut.io.aSel, 0)
  poke(dut.io.bSel, 0)
  poke(dut.io.writeData, 0)
  poke(dut.io.writeSel, 0)
  poke(dut.io.writeEnable, false)
  step(5)

  //Write 15 to reg3
  poke(dut.io.aSel, 0)
  poke(dut.io.bSel, 0)
  poke(dut.io.writeData, 15)
  poke(dut.io.writeSel, 3)
  poke(dut.io.writeEnable, true)
  step(5)

  //Write 63 to reg17
  poke(dut.io.aSel, 0)
  poke(dut.io.bSel, 0)
  poke(dut.io.writeData, 63)
  poke(dut.io.writeSel, 17)
  poke(dut.io.writeEnable, true)
  step(5)

  //Read reg3 with aSel and reg17 with bSel
  poke(dut.io.aSel, 3)
  poke(dut.io.bSel, 17)
  poke(dut.io.writeData, 0)
  poke(dut.io.writeSel, 0)
  poke(dut.io.writeEnable, false)
  step(5)

}

object RegisterFileTester {
  def main(args: Array[String]): Unit = {
    println("Testing Register")
    iotesters.Driver.execute(
      Array("--generate-vcd-output", "on",
        "--target-dir", "generated",
        "--top-name", "ProgramCounter"),
      () => new RegisterFile()) {
      c => new RegisterFileTester(c)
    }
  }
}
