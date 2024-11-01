`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01.11.2024 18:27:22
// Design Name: 
// Module Name: cpu_bit
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


module cpu_bit(
input wire clk,
input wire rst,
input wire[18:0]instruction,
output reg [18:0] data_out,
output reg[18:0] pc,
output wire[18:0] addr
    );
    
    reg [18:0] r0,r1,r2,r3,r4,r5,r6,r7,r8,r9,r10,r11,r12;
    
    reg[18:0]memory[255:0];
    
    reg [4:0] opcode;
    reg[3:0] rs1,rs2,rd;
    reg[7:0] addr_imm;
    
    reg[18:0] tmp;
    
    parameter [18:0] enc_key=19'h1f1f1;
    
    initial pc=19'b0;
    
    always@(*) begin
     opcode=instruction[18:14];
     rs1=instruction[13:10];
     rs2=instruction[9:6];
     addr_imm=instruction[7:0];
    end
    
    always@(posedge clk or posedge rst) begin
    if(rst) begin
     pc<=19'b0;
     data_out<=19'b0;
    end
    else begin
    pc<=pc+1;
    
    case(opcode)
    5'b00000: begin
              r0<=rs1+rs2;
              rd<=r0;
              data_out<=rd;
              end
    5'b00001: begin
              r1<=rs1-rs2;
              rd<=r1;
              data_out<=rd;
              end
    5'b00010: begin
              r2<=rs1*rs2;
              rd<=r2;
              data_out<=rd;
              end
    5'b00011: begin
              r3<=rs1/rs2;
              rd<=r3;
              data_out<=rd;
              end
    5'b00100: begin
              r4<=rs1+1;
              rd<=r4;
              data_out<=rd;
              end
    5'b00101: begin
              r5<=rs1-1;
              rd<=r5;
              data_out<=rd;
              end
    5'b00110: begin
              r6<=rs1&rs2;
              rd<=r6;
              data_out<=rd;
              end
    5'b00111: begin
              r7<=rs1|rs2;
              rd<=r7;
              data_out<=rd;
              end
    5'b01000: begin
              r8<=rs1^rs2;
              rd<=r8;
              data_out<=rd;
              end
    5'b01001: begin
              r9<= ~rs1;
              rd<=r9;
              data_out<=rd;
              end
    5'b01010: pc<=addr_imm;
    5'b01011: begin
              if(rs1==rs2)
                pc<=addr_imm;
              end
    5'b01100: begin
              if(rs1!=rs2)
                pc<=addr_imm;
              end
    5'b01101: begin
                memory[pc]<=pc+1;
                pc<=addr_imm;
              end
    5'b01110: pc<= memory[pc];
    5'b01111: begin
               r10<=memory[addr_imm];
               rd<=r10;
               data_out<=rd;
              end 
    5'b10000: memory[addr_imm]<=rs1;
    5'b10010: begin
                r11<=rs2^enc_key;
                rd<=r11;
                data_out<=rd;
              end 
    5'b10011: begin
                r12<=rs2^enc_key;
                rd<=r12;
                data_out<=rd;
              end 
    default: data_out<=data_out;        
    endcase
    end
    end
    
    assign addr= addr_imm;
endmodule
