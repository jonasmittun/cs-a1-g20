import java.io.*;
import java.util.Scanner;
import java.util.ArrayList;
import java.util.Collections;

public class Encoder {

	public static void main(String[] args) {
		ArrayList<String> asm = new ArrayList<String>();
		ArrayList<String> bin = new ArrayList<String>();
		String fileInput = "ErodeAssembly.txt";
		String fileOutput = "ErodeBinary.txt";
		asm = read(fileInput);
		try {
			bin = encode(asm);
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException(e);
		}
		write(bin, fileOutput);
	}

	//Remove comments and blank lines
	public static ArrayList<String> read(String fileName){
		FileInputStream input = null;
		try {
			input = new FileInputStream(fileName);
		} catch (FileNotFoundException e) {
			System.out.println(fileName + " not found!");
		}
		Scanner scanner = new Scanner(input);
		ArrayList<String> asm = new ArrayList<String>();
		String line = "";
		while(scanner.hasNextLine()) {
			line = scanner.nextLine();
			line = line.replace('\t',' ');
			if(line.contains("//")) {
				int commentLine = line.indexOf("//");
				line = line.substring(0, commentLine);
			}
			if(line.isBlank()) {
				continue;
			}
			asm.add(line);
		}
		scanner.close();
		return asm;
	}

	//Encodes and handles jump labels
	public static ArrayList<String> encode(ArrayList<String> input) throws Exception {
		ArrayList<String> output = new ArrayList<String>();
		ArrayList<String> jumps = new ArrayList<String>();
		String line = "";
		for(int i = 0; i < input.size(); i++) {
			line = input.get(i);
			if(line.contains(":")) {
				jumps.add(line.substring(0, line.indexOf(":")) + " " + i);
				line = line.substring(line.indexOf(":") + 1);
				input.set(i, line);
			}
		}
		Collections.sort(jumps);
		for(int i = 0; i < jumps.size() - 1; i++) {
			if(jumps.get(i).substring(0, jumps.get(i).indexOf(' ')).equals(jumps.get(i + 1).substring(0, jumps.get(i + 1).indexOf(' ')))){
				throw new Exception("Jump label \"" + jumps.get(i).substring(0, jumps.get(i).indexOf(' ')) + "\" has a duplicate!");
			}
		}
		String seg = "";
		String bits = "";
		Scanner scanner = null;
		for(int i = 0; i < input.size(); i++) {
			scanner = new Scanner(input.get(i));
			seg = scanner.next();
			switch(seg) {
				case "NOP":
					bits = opcode(0);
					bits += "000000000000000000000000000";
					bits += "\".U(32.W),";
					output.add(bits);
					break;
				case "ADD":
					bits = opcode(1);
					bits += reg(scanner.next());
					bits += reg(scanner.next());
					bits += reg(scanner.next());
					bits += "000000000000";
					bits += "\".U(32.W),";
					output.add(bits);
					break;
				case "ADDI":
					bits = opcode(2);
					bits += reg(scanner.next());
					bits += reg(scanner.next());
					bits += intermediate(scanner.next());
					bits += "0";
					bits += "\".U(32.W),";
					output.add(bits);
					break;
				case "SUB":
					bits = opcode(3);
					bits += reg(scanner.next());
					bits += reg(scanner.next());
					bits += reg(scanner.next());
					bits += "000000000000";
					bits += "\".U(32.W),";
					output.add(bits);
					break;
				case "SUBI":
					bits = opcode(4);
					bits += reg(scanner.next());
					bits += reg(scanner.next());
					bits += intermediate(scanner.next());
					bits += "0";
					bits += "\".U(32.W),";
					output.add(bits);
					break;
				case "MUL":
					bits = opcode(5);
					bits += reg(scanner.next());
					bits += reg(scanner.next());
					bits += reg(scanner.next());
					bits += "000000000000";
					bits += "\".U(32.W),";
					output.add(bits);
					break;
				case "MULI":
					bits = opcode(6);
					bits += reg(scanner.next());
					bits += reg(scanner.next());
					bits += intermediate(scanner.next());
					bits += "0";
					bits += "\".U(32.W),";
					output.add(bits);
					break;
				case "DIV":
					bits = opcode(7);
					bits += reg(scanner.next());
					bits += reg(scanner.next());
					bits += reg(scanner.next());
					bits += "000000000000";
					bits += "\".U(32.W),";
					output.add(bits);
					break;
				case "DIVI":
					bits = opcode(8);
					bits += reg(scanner.next());
					bits += reg(scanner.next());
					bits += intermediate(scanner.next());
					bits += "0";
					bits += "\".U(32.W),";
					output.add(bits);
					break;
				case "MOD":
					bits = opcode(9);
					bits += reg(scanner.next());
					bits += reg(scanner.next());
					bits += reg(scanner.next());
					bits += "000000000000";
					bits += "\".U(32.W),";
					output.add(bits);
					break;
				case "MODI":
					bits = opcode(10);
					bits += reg(scanner.next());
					bits += reg(scanner.next());
					bits += intermediate(scanner.next());
					bits += "0";
					bits += "\".U(32.W),";
					output.add(bits);
					break;
				case "OR":
					bits = opcode(11);
					bits += reg(scanner.next());
					bits += reg(scanner.next());
					bits += reg(scanner.next());
					bits += "000000000000";
					bits += "\".U(32.W),";
					output.add(bits);
					break;
				case "AND":
					bits = opcode(12);
					bits += reg(scanner.next());
					bits += reg(scanner.next());
					bits += reg(scanner.next());
					bits += "000000000000";
					bits += "\".U(32.W),";
					output.add(bits);
					break;
				case "NOT":
					bits = opcode(13);
					bits += reg(scanner.next());
					bits += reg(scanner.next());
					bits += "00000000000000000";
					bits += "\".U(32.W),";
					output.add(bits);
					break;
				case "NAND":
					bits = opcode(14);
					bits += reg(scanner.next());
					bits += reg(scanner.next());
					bits += reg(scanner.next());
					bits += "000000000000";
					bits += "\".U(32.W),";
					output.add(bits);
					break;
				case "SLL":
					bits = opcode(15);
					bits += reg(scanner.next());
					bits += intermediate(scanner.next());
					bits += "000000";
					bits += "\".U(32.W),";
					output.add(bits);
					break;
				case "SRL":
					bits = opcode(16);
					bits += reg(scanner.next());
					bits += intermediate(scanner.next());
					bits += "000000";
					bits += "\".U(32.W),";
					output.add(bits);
					break;
				case "SET":
					bits = opcode(17);
					bits += reg(scanner.next());
					bits += intermediate(scanner.next());
					bits += "000000";
					bits += "\".U(32.W),";
					output.add(bits);
					break;
				case "LDD":
					bits = opcode(18);
					bits += reg(scanner.next());
					bits += intermediate(scanner.next());
					bits += "000000";
					bits += "\".U(32.W),";
					output.add(bits);
					break;
				case "STR":
					bits = opcode(19);
					bits += intermediate(scanner.next());
					bits += reg(scanner.next());
					bits += "000000";
					bits += "\".U(32.W),";
					output.add(bits);
					break;
				// opcode(20-24) non intermediate jumps currently not used
				case "JMPI":
					bits = opcode(25);
					bits += jumpLabel(scanner.next(), jumps);
					bits += "00000000000";
					bits += "\".U(32.W),";
					output.add(bits);
					break;
				case "JEQI":
					bits = opcode(26);
					bits += jumpLabel(scanner.next(), jumps);
					bits += reg(scanner.next());
					bits += reg(scanner.next());
					bits += "0";
					bits += "\".U(32.W),";
					output.add(bits);
					break;
				case "JGTI":
					bits = opcode(27);
					bits += jumpLabel(scanner.next(), jumps);
					bits += reg(scanner.next());
					bits += reg(scanner.next());
					bits += "0";
					bits += "\".U(32.W),";
					output.add(bits);
					break;
				case "JLTI":
					bits = opcode(28);
					bits += jumpLabel(scanner.next(), jumps);
					bits += reg(scanner.next());
					bits += reg(scanner.next());
					bits += "0";
					bits += "\".U(32.W),";
					output.add(bits);
					break;
				case "JNQI":
					bits = opcode(29);
					bits += jumpLabel(scanner.next(), jumps);
					bits += reg(scanner.next());
					bits += reg(scanner.next());
					bits += "0";
					bits += "\".U(32.W),";
					output.add(bits);
					break;
				// opcode(30) currently unused
				case "END":
					bits = opcode(31);
					bits += "000000000000000000000000000";
					bits += "\".U(32.W)";
					output.add(bits);
					break;
				default:
					output.add("ERROR");
			}
		}
		//DEBUG: System prints for the three array lists
		//System.out.println(input);
		//System.out.println(jumps);
		//System.out.println(output);
		return output;
	}

	private static String opcode(int number) {
		return "\"b" + String.format("%5s", Integer.toBinaryString(number)).replace(' ', '0');
	}

	private static String reg(String number) {
		int holder = Integer.parseInt(number, 16);
		return String.format("%5s", Integer.toBinaryString(holder)).replace(' ', '0');
	}

	private static String intermediate(String number) {
		int holder = Integer.parseInt(number, 16);
		return String.format("%16s", Integer.toBinaryString(holder)).replace(' ', '0');
	}

	private static String jumpLabel(String input, ArrayList<String> jumps) throws Exception {
		String seg = input.substring(1);
		int holder = -1;
		for(int j = 0; j < jumps.size(); j++) {
			if(jumps.get(j).substring(0, seg.length()).equals(seg)) {
				holder = Integer.parseInt(jumps.get(j).substring(seg.length() + 1));
				break;
			}
		}
		if(holder == -1) {
			throw new Exception("Jump label \"" + seg + "\" not found!");
		}
		return String.format("%16s", Integer.toBinaryString(holder)).replace(' ', '0');
	}

	//https://stackoverflow.com/a/2885241/14986889
	public static void write(ArrayList<String> bin, String fileOutput) {
		try {
			Writer writer = new BufferedWriter(new OutputStreamWriter(new FileOutputStream(fileOutput), "utf-8"));
			for(int i = 0; i < bin.size(); i++) {
				writer.write(bin.get(i) + "\n");
			}
			writer.close();
		} catch (IOException e) {
			System.out.println("Error writing to: " + fileOutput);
			e.printStackTrace();
		}
	}
}
