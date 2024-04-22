`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/28/2024 01:33:24 PM
// Design Name: 
// Module Name: ALU
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


module ALU(
    input [7:0] A, //input register A acting as operand A
    input [7:0] B, //input register B acting as operand B
    input [3:0] multiplicand_A, // or have matthew do a 8 bit input array multiplier
    input [3:0] multiplier_B,
    // Control Unit signals
    input [1:0] alu_op, // 2 bit ALU operation control signal
    //input alu_src
    output reg [7:0] result,
    output reg zero, //zero flag
    output reg carry //carry flag
    );
    
    //Instantiate ArrMult_4bit module
    ArrMult_4bit AM_4b(.a(multiplicand_A), .b(multiplier_B), .prod(mult_result));
    
    always @(*) 
    begin
        case(alu_op)
            2'b00: result = A + B; // Addition - have matthew implement 8-bit CLA
            2'b01: result = A - B; // Subtraction
            2'b10: result = mult_result; // Array Multiplier Result
            2'b11: result = 0; //Test
            default: result = 8'h00; // Default is to 0 for unknown opcode
        endcase
    end
    
    
    
endmodule
