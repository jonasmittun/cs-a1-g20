import chisel3._
import chisel3.util._
import chisel3.iotesters
import chisel3.iotesters.PeekPokeTester
import java.util

object Programs{
  val program1 = Array(
    "b10001000010000000000000000000000".U(32.W),
    "b10001000100000000000000000000000".U(32.W),
    "b10001000110000000000000000100110".U(32.W),
    "b10001001000000000000000000000000".U(32.W),
    "b10001001010000000000000000101000".U(32.W),
    "b00101001010010100010000000000000".U(32.W),
    "b00001001010010100001000000000000".U(32.W),
    "b11010000010001100000000000011000".U(32.W),
    "b11010000010010000000000000011000".U(32.W),
    "b11010000100001100000000000011000".U(32.W),
    "b11010000100010000000000000011000".U(32.W),
    "b11001000000000000000000000011100".U(32.W),
    "b10011000000010100100000000000000".U(32.W),
    "b11001000000000000000000001000100".U(32.W),
    "b10010001100010100000000000000000".U(32.W),
    "b00010001110010100000001100100000".U(32.W),
    "b11010001100010000000000000111100".U(32.W),
    "b00100010000010100000000000000010".U(32.W),
    "b10010010000100000000000000000000".U(32.W),
    "b11010010000010000000000000111100".U(32.W),
    "b00010010000010100000000000000010".U(32.W),
    "b10010010000100000000000000000000".U(32.W),
    "b11010010000010000000000000111100".U(32.W),
    "b00100010000010100000000000101000".U(32.W),
    "b10010010000100000000000000000000".U(32.W),
    "b11010010000010000000000000111100".U(32.W),
    "b00010010000010100000000000101000".U(32.W),
    "b10010010000100000000000000000000".U(32.W),
    "b11010010000010000000000000111100".U(32.W),
    "b11001000000000000000000001000000".U(32.W),
    "b10011000000011100100000000000000".U(32.W),
    "b11001000000000000000000001000100".U(32.W),
    "b10001010010000000000000111111110".U(32.W),
    "b10011000000011101001000000000000".U(32.W),
    "b11010000100001100000000001001010".U(32.W),
    "b00010000100001000000000000000010".U(32.W),
    "b11001000000000000000000000001000".U(32.W),
    "b10001000100000000000000000000000".U(32.W),
    "b11010000010001100000000001010010".U(32.W),
    "b00010000010000100000000000000010".U(32.W),
    "b11001000000000000000000000001000".U(32.W),
    "b11111000000000000000000000000000".U(32.W)
  )

  val program2 = Array(
    "h00000000".U(32.W),
    "h00000000".U(32.W),
    "h00000000".U(32.W),
    "h00000000".U(32.W),
    "h00000000".U(32.W),
    "h00000000".U(32.W),
    "h00000000".U(32.W),
    "h00000000".U(32.W),
    "h00000000".U(32.W),
    "h00000000".U(32.W),
    "h00000000".U(32.W),
    "h00000000".U(32.W)
  )
}