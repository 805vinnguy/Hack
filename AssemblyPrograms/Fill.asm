// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel;
// the screen should remain fully black as long as the key is pressed. 
// When no key is pressed, the program clears the screen, i.e. writes
// "white" in every pixel;
// the screen should remain fully clear as long as no key is pressed.

// Put your code here.

    @255
    D=A
    @i
    M=D    // i = rows of screen

    @SCREEN
    D=A
    @addr
    M=D    // addr = 16384 (screen base address)

(LOOP)
    //@END
    //M;JEQ    // goto END if M == 0

    @addr
    A=M
    M=-1    // RAM[addr] = 1111111111111111

    @i
    M=M-1    // i = i - 1

    @addr
    M=M+1    // addr = addr + 1

    @LOOP
    0;JMP    // goto LOOP

(END)
    @END    
    0;JMP
