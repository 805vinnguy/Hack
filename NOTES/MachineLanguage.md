# Machine Language

## Universality

+ same **hardware** can run many different **software** programs
+ theory: universal turing machine: general machine able to run all possible programs
+ practice: von neumann architecture: practical architecture for general computing machine

## Elements

1. Operations (what instructions to do)
2. Program Counter (which instruction to do at some given stage in time)
3. Addressing (tell hardware what to operate on)

## Instruction

|0100010|0011|0010|
|:-:    |:-: |:-: |
|ADD    |R3  |R2  |

> *Interpretation 1*: The symbolic form doesn't exist but is just a convenient mneumonic to present machine language instructions to humans.

> *Interpretation 2*: This symbolic form allows humans to write machine language instructions using assembly language and have an assembler program convert it to bit-form.

## Memory Hierarchy

+ Accessing a memory location is expensive
    + Need to supply a long address
    + Getting the memory contents into the CPU takes time

CPU --> Register --> Cache --> Main Memory --> Disk

+ Faster access = smaller memory size

### Registers

+ CPUs contain a few, easily accessed, registers
+ Their number and function are a central part of the machine language

### Addressing Modes

+ Register
    + Add R1, R2        R2 <-- R2 + R1
+ Direct
    + Add R1, Mem[200]  Mem[200] <-- Mem[200] + R1
+ Indirect
    + Add R1, @A        Mem[A] <-- Mem[A] + R1
+ Immediate
    + Add 73, R1        R1 <-- R1 + 73

### Input/Output Devices

> One way to access input and output devices is to connect the registers which control them as part of the main memory.

+ The protocol that allows the CPU to *talk* to each device is the software **drivers**.
    1. Memory location 12345 holds the direction of the last movement of the mouse
    2. Memory location 6789 is not a real memory location but a way to tell the printer which paper to use

### Hardware

+ A 16 bit computer consisting of
    + Data Memory (RAM): a sequence of 16 bit registers RAM[0], RAM[1], RAM[2], ...
    + Instruction Memory (ROM): a sequence of 16 bit registers ROM[0], ROM[1], ROM[2], ...
    + Central Processing Unit (CPU): performs 16 bit instructions
    + Instructions bus / Data bus / Address bus

+ Control:
    + The ROM is loaded with a Hack program
    + The *reset* button is pushed
    + The program starts running

+ Computer recognizes 3 registers:
    + D Register holds a 16 bit value
    + A Register holds a 16 bit value
    + M Register represents the 16 bit RAM register addressed by A Register

### The A Instruction (Addressing)

**Syntax** : @*value*
*value* = non-negative decimal or symbol
**Semantics** : Sets the A register to *value*
                RAM[A] becomes the selected RAM register
**Example** : @*21*
              Sets the A register to 21
              RAM[21] becomes the selected RAM register

**Code** : // Set RAM[100] to -1
           @100   // A=100
           M=-1   // RAM[100] = -1

### The C Instruction (computation)

**Syntax** : *dest* = *comp* ; *jump* (both *dest* and *jump* are optional)

|*comp*|   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |      |
|:-:   |:-:|:-:|:-:|:-:|:-:|:-:|:-:|:-:|:-:|:-:|:-:|:-:|:-:|:-:|:-:|:-:|:-:   |
|0     |1  |-1 |D  |A  |!D |!A |-D |-A |D+1|A+1|D-1|A-1|D+A|D-A|A-D|D&A|D or A|
|      |   |   |   |M  |   |!M |   |-M |   |M+1|   |M-1|D+M|D-M|M-D|D&M|D or M|

|*dest*|null|M  |D  |MD |A  |AM |AD |AMD|
|:-:   |:-: |:-:|:-:|:-:|:-:|:-:|:-:|:-:|

|*jump*|null|JGT|JEQ|JGE|JLT|JNE|JLE|JMP|
|:-:   |:-: |:-:|:-:|:-:|:-:|:-:|:-:|:-:|

**Semantics** : Computes the value of *comp*
                Stores the result in *dest*
                If the boolean expression *comp* *jump* 0 is true, jumps to execute the instruction store in ROM[A]

**Example** : // Set D register to -1
              D=-1

              // Set RAM[300] to the value of the D register minus 1
              @300 // A=300
              M=D-1 // RAM[300]=D-1

              // If (D-1==0) jump to execute the instruction store in ROM[56]
              @56 // A=56
              D-1;JEQ // if (D-1==0) goto 56
              
           
