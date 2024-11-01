# Vicharak_Assignment

## Objective: Define a CPU architecture using a 19-bit instruction size tailored to specific applications such as signal processing or cryptography. The design should include a detailed architectural specification with pipeline stages, a register file, an ALU, and memory interfaces.

### Task Requirements:

#### Instruction Set:

Choose an instruction set specialized for the application.
Define operations for arithmetic, logical, control flow, memory access, and custom instructions.
Architecture Components:

Specify the pipeline stages.
Include a register file with adequate registers.
Define the ALU functionalities.
Submission Timeline: Complete and submit the task within 15 days.

#### Instruction Set Overview
#### Arithmetic Instructions
#### ADD r1, r2, r3
Adds the values in registers r2 and r3 and stores the result in r1.
Operation: r1 = r2 + r3

#### SUB r1, r2, r3
Subtracts the value in r3 from r2 and stores the result in r1.
Operation: r1 = r2 - r3

#### MUL r1, r2, r3
Multiplies the values in r2 and r3 and stores the result in r1.
Operation: r1 = r2 * r3

#### DIV r1, r2, r3
Divides the value in r2 by r3 and stores the result in r1.
Operation: r1 = r2 / r3

#### INC r1
Increments the value in register r1 by 1.
Operation: r1 = r1 + 1

#### DEC r1
Decrements the value in register r1 by 1.
Operation: r1 = r1 - 1

#### Logical Instructions

#### AND r1, r2, r3
Performs a bitwise AND on the values in r2 and r3, storing the result in r1.
Operation: r1 = r2 & r3

#### OR r1, r2, r3
Performs a bitwise OR on the values in r2 and r3, storing the result in r1.
Operation: r1 = r2 | r3

#### XOR r1, r2, r3
Performs a bitwise XOR on the values in r2 and r3, storing the result in r1.
Operation: r1 = r2 ^ r3

#### NOT r1, r2
Performs a bitwise NOT on the value in r2, storing the result in r1.
Operation: r1 = ~r2

#### Control Flow Instructions

#### JMP addr
Jumps to the specified address.
Operation: PC = addr

#### BEQ r1, r2, addr
Branches to the specified address if the values in r1 and r2 are equal.
Operation: if (r1 == r2) PC = addr

#### BNE r1, r2, addr
Branches to the specified address if the values in r1 and r2 are not equal.
Operation: if (r1 != r2) PC = addr

#### CALL addr
Calls a subroutine at the specified address, saving the current program counter to the stack.
Operation: stack[SP] = PC + 1; SP = SP - 1; PC = addr

#### RET
Returns from a subroutine by restoring the program counter from the stack.
Operation: SP = SP + 1; PC = stack[SP]

#### Memory Access Instructions

#### LD r1, addr
Loads the value from the specified memory address into register r1.
Operation: r1 = memory[addr]

#### ST addr, r1
Stores the value in register r1 to the specified memory address.
Operation: memory[addr] = r1

#### ENC r1, r2
Encrypts the data at address r2 using a predefined encryption algorithm and stores the result at the location pointed to by r1.
Operation: encrypted_data = Encrypt(memory[r2]); memory[r1] = encrypted_data

#### DEC r1, r2
Decrypts the data at address r2 using a predefined decryption algorithm and stores the result at the location pointed to by r1.
Operation: decrypted_data = Decrypt(memory[r2]); memory[r1] = decrypted_data



it is designed to be implemented in Verilog/VHDL/SystemVerilog based on user convenience.
