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
