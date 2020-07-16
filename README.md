# HACK.v

HACK.v is a 16 bit RISC processor in Verilog. HACK is a microarchitecture specified in *Elements of Computing System* by Noam Nisan and Shimon Schocken which is informally known as [nand2tetris](http://www.nand2tetris.org). The authors implemented the architecture in an indigenous HDL(Hardware Description Language), but HACK.v is an implementation of the architecture in much standard **Verilog**.  

##Contents

-[Description](#Description)
  -[HACK microarchitecture](#HACK-microarchitecture)
  -[HACK CPU](#HACK-CPU)
  -[Files Description](#Files-Description)
-[HACK Assembly Language](#HACK-Assembly-Language)
  -[A Instructions](#A-Instructions)
  -[C Instructions](#C-Instructions)
-[Sample Usage](#Sample-Usage)

##Description

HACK.v is a structural implementation of the HACK microarchitecture. This is modified *Von Neumann* architecture with separate instruction memory and data memory. The main components being the Instruction memory, CPU and Data memory.

###HACK microarchitecture

![HACK microarchitecture](/diagrams/microarchitecture.png "HACK microarchitecture")

###HACK CPU

![HACK CPU](/diagrams/CPU.png "HACK CPU")

###Files Description

The files are listed in the logical order they were created and reside in **/HACK verilog** directory
1. **Mux16_2way.v:** 2 input 16 bit Multiplexer
2. **Adder16.v:** 2 input 16 bit adder
3. **ALU.v:** Arithmetic and Logic Unit
4. **register.v:** 16 bit register for A register and D register
5. **CPU.v:** Central Processing Unit
6. **Instrn_mem.v:** 64K instruction memory
7. **data_mem.v:** 64K data memory
8. **HACK.v:** complete integration of the microarchitecture components.
9. **HACK_sim.v:** Simulation File to be executed
10. **\*tb.v:** all these files are testbenches for checking their corresponding functionality

##HACK Assembly Language

The HACK assembly Language mainly consists of two types of instructions A-type and C-type.

### A Instructions

#### Symbolic Syntax of an A-Instruction

`@value`, where value is either a decimal non-negative number or a Symbol.

Examples:

- `@21`
- `@R0`
- `@SCREEN`

#### Binary Syntax of an A-Instruction

`0xxxxxxxxxxxxxxx`, where `x` is a bit, either 0 or 1. A-Instructions always have their MSB set to 0.

Examples:

- `000000000001010`
- `011111111111111`

#### Effects of an A-Instruction

Sets the contents of the **A** register to the specified value. The value is either a non-negative number (i.e. 21) or a Symbol. If the value is a Symbol, then the contents of the **A** register is set to the value that the Symbol refers to but not the actual data in that Register or Memory Location.

### C Instructions

#### Symbolic Syntax of a C-Instruction

*dest* = *comp* ; *jmp*, where:

1. *dest*: Destination register in which the result of computation will be stored.
2. *comp*: Computation code.
3. *jmp*: The jump directive.

Examples:

- `D=0`
- `M=1`
- `D=D+1;JMP`
- `M=M-D;JEQ`

#### Binary Syntax of a C-Instruction

`1 1 1 a c1 c2 c3 c4 c5 c6 d1 d2 d3 j1 j2 j3`, where:

- `111` bits: C-Instructions always begin with bits `111`.
- `a` bit: Chooses to load the contents of either **A** register or **M** (Main Memory register addressed by **A**) into the ALU for computation.
- Bits `c1` through `c6`: Control bits expected by the ALU to perform arithmetic or bit-wise logic operations.
- Bits `d1` through `d3`: Specify which memory location to store the result of ALU computation into: **A**, **D** or **M**.
- Bits `j1` through `j3`: Specify which JUMP directive to execute (either conditional or uncoditional).

#### Effects of a C-Instruction

Performs a computation on the CPU (arithmetic or bit-wise logic) and stores it into a destination register or memory location, and then (optionally) JUMPS to an instruction memory location that is usually addressed by a value or a Symbol (label).

![C-Instructions Reference](assets/c_instructions_reference.png "C-Instructions Reference")

##Sample Usage

###Requirements

A Verilog Simulator like ModelSim

###Execution

1. Download all the verilog files into a single folders.
2. Create a file **code.txt** and type in the machine language(binary) instructions inside it.
3. Create a file **InitialRam.txt** and type in the initial values inside the RAM (both the text files should be in the same folder as the verilog files).
4. Compile all the verilog files
5. Simulate the HACK_sim component
6. Add the variables to the wave window (ModelSim).
7. Run the Simulation
8. Any value written in RAM will be displayed in the simulation output window.

###Sample Assembly Source Code

```asm
// Computes 1+2+...+RAM[0]
// And the sum is stored in RAM[1]
@i
M=1 // i = 1
@sum
M=0 // sum = 0
(LOOP)
@i // if i>RAM[0] goto WRITE
D=M
@R0
D=D‐M
@WRITE
D;JGT
@i // sum += i
D=M
@sum
M=D+M
@i // i++
M=M+1
@LOOP // goto LOOP
0;JMP
(WRITE)
@sum
D=M
@R1
M=D // RAM[1] = the sum
(END)
@END
0;JMP

```
###code.txt

machine code of the above source code

```binary
0000000000010000
1110111111001000
0000000000010001
1110101010001000
0000000000010000
1111110000010000
0000000000000000
1111010011010000
0000000000010010
1110001100000001
0000000000010000
1111110000010000
0000000000010001
1111000010001000
0000000000010000
1111110111001000
0000000000000100
1110101010000111
0000000000010001
1111110000010000
0000000000000001
1110001100001000
0000000000010110
1110101010000111
```
###InitialRam.txt

RAM[0] is initialised with 10 (0000000000001010)
```binary
000000000001010
```
