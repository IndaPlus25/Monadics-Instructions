# DD1337 Week 8

Author: Viola Söderlund

Modified: Isak Larsson

Modified 2.0: Benjamin Widman & Daniel Strömberg

## Assembly Language Design

RISC-V is sooo last week. We'll make our own assembly language with blackjack and... cool instructions!

1Your assembly language should use 16-bit instructions. See the [RISC-V instruction sheet](../task-8-assembly/riscv-instruction-sheet.pdf) and take inspiration from the RISC-V 32-bit instruction encoding. Your instruction encoding determines:

| **Code**                    | **Size and Flexibility**                                                                            |
| --------------------------- | --------------------------------------------------------------------------------------------------- |
| `op` *(operation)*          | 4 bits operation code gives room for up to 16 instructions (doesn't have to be 16).                 |
| `rs`/`rt`/`rd` *(register)* | 3 bits register addresses gives room for 8 registers.                                               |
| `imm` *(immediate)*         | 6/12 bits immediate values, which for unsigned integers give room for 0-63 (6-bit)/0-4065 (12 bit). |

Think carefully of how your instructions are encoded. More registers may mean a smaller instruction set or smaller immediates. The above table is only an example for how you may divide your available bits.

Your registers should be 32 bits in size, meaning values ranging from 0 to 4,294,967,295 (unsigned) and −2,147,483,648 to 2,147,483,647 (signed).

Lastly, remember to give your language a cool name!

## Reading Material

The [RISC-V Reference sheet](../task-8-assembly/riscv-instruction-sheet.pdf) is *extremely* useful as a reference for how an assembly language can be designed.

## Assignment

Summary:

- Fulfill one of the assignment levels below.
- Write a factorial calculator in your own language as described [below](#language-capabilities).

### Prepare Assignment

1) Create a repository named `<KTH_ID>-isa` and clone it.
2) Navigate into your newly created repository and start writing.

See `./bbvv` for an example language and interpreter.

### Assignment Levels

Higher levels equals more fun!

1) Copy the design of *Bacon Borde Vara Vegetariskt* and implement an interpreter.
2) Design your own language and implement an interpreter for your language.
3) Design your own language and write an compiler as well as an emulator (we don't have time to design and order custom chips) for your language/architecture.

You are free to use any language you'd like!

For advanced implementations (only level 2-3), contenders for the most outrageous implementation, **you are allowed to team up in pairs**!

An interpreter reads a code file and run it instruction for instruction. A compiler reads a code file and outputs a system specific executable file. An emulator reads an executable file and executes it by interpretation.

### Language Capabilities

Your language has to have the instructions for you to write a program that takes an integer `n` as user input, then calculates and outputs the value `n!`.

To prove your language's capabilities, write this program and include the file in your repository ready to be interpreted or compiled. In addition, include instructions of how to do this.

### *NOTE*

Your language are not allowed to fit multiplication of factorial logic in single instructions. Multiplication by gate logic (add, or, not, xor ...) and addition is allowed.
