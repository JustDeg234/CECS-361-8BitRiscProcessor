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
    input [7:0] A,
    input [7:0] B,
    input [3:0] multiplicand_A,
    input [3:0] multiplier_B,
    input [2:0] opcode,
    output reg [7:0] result
    );
    
    //Instantiate ArrMult_4bit module
    ArrMult_4bit AM_4b(.a(multiplicand_A), .b(multiplier_B), .prod(result));
    
    always @* begin
        case(opcode)
            3'b001: result = A + B; // Addition
            3'b010: result = result; // Array Multiplier Result
            default: result = 8'h00; // Default is to 0 for unknown opcode
        endcase
    end

endmodule
