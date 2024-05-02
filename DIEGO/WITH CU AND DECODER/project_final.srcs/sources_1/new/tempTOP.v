`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/30/2024 07:26:35 PM
// Design Name: 
// Module Name: TOP
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


module TOP(
    input clk,
    input [7:0] A,
    input [7:0] B,
    input addition, subtraction, multiplication, divider,// previous,
    output [7:0] anode,
    output [7:0] cathode
    //output reg [7:0] finalResult
    );
    
    wire [3:0] in1;
    wire [3:0] in2;
    wire [3:0] in3;
    wire [3:0] in4;
    wire [7:0] aluResult;
    wire [1:0] alu_op;
    wire [3:0] opcode;
    //wire read;
    //wire [7:0] readResult;
    wire reset = 0;
    
    ALU alu(.A(A), .B(B), .alu_op(alu_op), .result(aluResult));
    InstructionDecoder inst_dec(.add(addition), .sub(subtraction), .mult(multiplication), .div(divider), .prev(previous), .opcode(opcode));
    ControlUnit cu(.opcode(opcode), .alu_op(alu_op)); //.read(read));
    //Register register(.clk(clk), .read(read), .result(aluResult), .readResult(readResult));
    digit_Sep digit_sep(.input_data(aluResult), .digit_1(in1), .digit_2(in2), .digit_3(in3), .digit_4(in4));
    time_multiplexer inst_time_mux(.clk(clk), .reset(reset), .in1(in1), .in2(in2), .in3(in3), .in4(in4), .anode(anode), .cathode(cathode)); 
    
    /*
    always @(clk) begin
        finalResult <= aluResult;
    end
    */

endmodule
