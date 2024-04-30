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
    // Control Unit signals
    input [1:0] alu_op, // 2 bit ALU operation control signal
    //input alu_src
    input cin,
    input overflow,
    input cout,
    input [7:0] addResult,
    input [7:0] subResult,
    input [7:0] multResult,
    input [7:0] multResult2, //for 8 bit array multiplier
    output reg [7:0] result,
    output reg [7:0] result2,
    output reg zero, //zero flag
    output reg carry //carry flag
    );
    
    //Instantiate the modules
    AddSub_8bit RCA_ADD(.a(A), .b(B), .cin(1'b0), .s(addResult), .cout(cout), .overflow(overflow)); //instantiate RCA module for addition
    AddSub_8bit RCA_SUB(.a(A), .b(B), .cin(1'b1), .s(subResult), .cout(cout), .overflow(overflow)); //instantiate RCA module for subtraction
    ArrMult_8bit AM_4b(.a(A), .b(B), .prod(multResult)); // .prod2(multResult2);
    
    
always @(*) begin //always runs every clock cycle
    case(alu_op)
        2'b00: begin //addition
            result <= addResult;
        end
        2'b01: begin // Subtraction
            result <= subResult;
        end
        2'b10: begin // Array Multiplier Result
            result <= multResult;
            result2 <= multResult2;
        end
        2'b11: result = 0; //Test
        default: result = 8'h00; // Default is to 0 for unknown opcode
    endcase
end

    
    
endmodule
