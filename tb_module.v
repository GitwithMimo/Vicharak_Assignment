`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01.11.2024 19:10:23
// Design Name: 
// Module Name: tb_module
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////




module tb_module();

    // Testbench signals
    reg clk;
    reg rst;
    reg [18:0] instruction;
    wire [18:0] pc;
    wire [18:0] data_out;
    wire [18:0] addr;

    // Instantiate the CPU module
    cpu_19bit uut (
        .clk(clk),
        .rst(rst),
        .instruction(instruction),
        .pc(pc),
        .data_out(data_out),
        .addr(addr)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk;  // 10ns clock period
    end

    // Apply test vectors
    initial begin
        // Reset the CPU
        rst = 1;
        #10;
        rst = 0;

        // Test Instructions (in binary format)

        // ADD instruction
        instruction = 19'b0000000010010000000;  // ADD r1 + r2 -> r3
        #10;
        $display("ADD: data_out = %b, pc = %b, addr = %b", data_out, pc, addr);

        // SUB instruction
        instruction = 19'b0000100010010000000;  // SUB r1 - r2 -> r4
        #10;
        $display("SUB: data_out = %b, pc = %b, addr = %b", data_out, pc, addr);

        // MUL instruction
        instruction = 19'b0001000010010000000;  // MUL r1 * r2 -> r5
        #10;
        $display("MUL: data_out = %b, pc = %b, addr = %b", data_out, pc, addr);

        // JMP instruction
        instruction = 19'b0101000000000000011;  // JMP to address 3
        #10;
        $display("JMP: data_out = %b, pc = %b, addr = %b", data_out, pc, addr);

        // AND instruction
        instruction = 19'b0011000010010000000;  // AND r1 & r2 -> r6
        #10;
        $display("AND: data_out = %b, pc = %b, addr = %b", data_out, pc, addr);

        // OR instruction
        instruction = 19'b0011100010010000000;  // OR r1 | r2 -> r7
        #10;
        $display("OR: data_out = %b, pc = %b, addr = %b", data_out, pc, addr);

        // XOR instruction
        instruction = 19'b0100000010010000000;  // XOR r1 ^ r2 -> r8
        #10;
        $display("XOR: data_out = %b, pc = %b, addr = %b", data_out, pc, addr);

        // ENC instruction
        instruction = 19'b1001000010010000000;  // ENC r2 -> r9
        #10;
        $display("ENC: data_out = %b, pc = %b, addr = %b", data_out, pc, addr);

        // DEC instruction
        instruction = 19'b1001100010010000000;  // DEC r2 -> r10
        #10;
        $display("DEC: data_out = %b, pc = %b, addr = %b", data_out, pc, addr);

        // Finish simulation
        $stop;
    end
endmodule







