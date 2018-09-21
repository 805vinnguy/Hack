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

              // If (D-1==0) jump to execute the instruction stored in ROM[56]
              @56 // A=56
              D-1;JEQ // if (D-1==0) goto 56

## Input/Output

+ Screen memory map : designated memory area dedicated to manage display unit
    + the physical display is continuously refreshed from the memory map, many times per second
    + output is affected by writing code that manipulates the screen memory map

+ Display Unit(256 rows, 512 columns, b/w)
+ for every pixel, there is a bit in the screen memory map that represents it
+ b = 1, w = 0
+ to **set** pixel (row, col) on/off:
    1. i = 32*row + col/16 = address of register in memory map that must be manipulated
    2. set the (col % 16)*th* bit of *word* to 0 or 1
    3. commit *word* to RAM
+ *word* = Screen[32*row + col/16]
+ *word* = RAM[16384 + 32*row + col/16] if screen is part of larger ram

+ Keyboard memory map : single 16 bit register
    + when a key is pressed, the key's *scan code* (a 16 bit number) appears in the keyboard memory map

### The Hack Character Set

+ minimal, but sufficiently rich

|key|code|
|:-:|:-: |
|0  |48  |
|1  |49  |
|...|... |
|9  |57  |

|key|code|
|:-:|:-: |
|A  |65  |
|B  |66  |
|...|... |
|Z  |90  |

|key    |code|
|:-:    |:-: |
|(space)|32  |
|!      |33  |
|"      |34  |
|#      |35  |
|$      |36  |
|%      |37  |
|&      |38  |
|'      |39  |
|(      |40  |
|)      |41  |
|*      |42  |
|+      |43  |
|,      |44  |
|-      |45  |
|.      |46  |
|/      |47  |

|key|code|
|:-:|:-: |
|:  |58  |
|;  |59  |
|<  |60  |
|=  |61  |
|>  |62  |
|?  |63  |
|@  |64  |

|key|code|
|:-:|:-: |
|[  |91  |
|/  |92  |
|]  |93  |
|^  |94  |
|_  |95  |

|key         |code|
|:-:         |:-: |
|newline     |128 |
|backspace   |129 |
|left arrow  |130 |
|up arrow    |131 |
|right arrow |132 |
|down arrow  |133 |
|home        |134 |
|end         |135 |
|Page up     |136 |
|Page down   |137 |
|insert      |138 |
|delete      |139 |
|esc         |140 |
|f1          |141 |
|...         |... |
|f12         |152 |

+ when no key is pressed, the resulting code is 0
+ same idea as ascii

+ to **check** which key is currently pressed:
    1. probe the contents of the keyboard chip
    2. in the Hack computer, probe the contents of RAM[24576]
+ if the register contains 0, no key is pressed

**nop slide** : null instructions, bad hacker can write malicious programs downstream of the pc

### Builtin symbols

> symbols denote *virtual registers*

|symbol|value|
|:-:   |:-:  |
|R0    |0    |
|...   |...  |
|R15   |15   |
|SCREEN|16384|
|KBD   |24576|
|SP    |0    |
|LCL   |1    |
|ARG   |2    |
|THIS  |3    |
|THAT  |4    |

+ last 5 used in virtual machine making that runs on top of cpu

> instead of:

```
    // RAM[5] = 15
    @15
    D=A

    @5
    M=D
```

> better style:

```
    // RAM[5] = 15
    @15
    D=A

    @R5
    M=D
```

### Branching

+ @LABEL translates to @n, where n is the instruction number following the (LABEL) declaration
    + contract:
        + label declaratations are not translated
        + each reference to a label is replaced with a reference to the instruction number following that label's declaration

### Variables

+ @temp : *find some available memory register (say register n), and use it to represent the variable **temp**. So from now on, each occurance of @temp in the program will be translated to @n.
    + contract:
        + a reference to a symbol that has no corresponding label declaration is treated as a reference to a variable
        + variables are allocated to the RAM from address 16 onward

### Pointers

+ Variables that store memory addresses like *arr* and *i* are called pointers
+ Hack pointer logic: whenever we have to access memory using a pointer, we need an instruction like A=M
+ Typical pointer semantics: set the address register to the contents of some memory register
+ Accessing a pointer usually involves changing the address register to a value retrieved from memory

### Input/Output

**drawing a rectangle**
- *draw a filled rectangle at the upper left corner of the screen, 16 pixels wide and RAM[0] pixels long*

pseudo code:
```
    for(i=0; i<n; i++) {
        draw 16 black pixels at the beginning of row i
    }

    addr = SCREEN
    n = RAM[0]
    i = 0
    
    LOOP:
        if(i < n) {
            goto END
        }
        RAM[addr] = -1  //1111111111111111
        addr = addr + 32  //advances to the next row
        i = i + 1
        goto LOOP

    END:
        goto END
```

**Handling the keyboard**
- *to check which key is currently pressed*
    + read the contents of RAM[24576] address KBD (@KBD)
    + application: accumulating keys until **ENTER** is pressed

### Endnote: compilation

High level code --> compiler --> machine language

1. there is a builtin screen chip
2. there is a builtin keyboard chip
    + enable keyboard chip by pressing on the keyboard icon in HW simulator
3. CPU emulator, translates assembly to machine language (**use this for mult and fill**)
4. to properly terminate a program, end programs with an infinite loop that loops back to the beginning
```
    @[insert line number]
    0; JMP
```
5. Hack is case sensitive, R5 != r5
6. *Simple minded people are impressed by sophisticated things and sophisticated people are impressed by simple things.*
    + Any high level program can be translated into a Hack program that does the same thing.