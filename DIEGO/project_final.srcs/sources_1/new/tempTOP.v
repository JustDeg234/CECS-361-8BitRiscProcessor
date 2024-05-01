`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/30/2024 07:26:35 PM
// Design Name: 
// Module Name: tempTOP
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


module tempTOP(
    input clk,
    input [7:0] A,
    input [7:0] B,
    input [1:0] alu_op,
    input reset,
    input [3:0] in1,
    input [3:0] in2,
    input [3:0] in3,
    input [3:0] in4,
    input [7:0] aluResult,
    input [7:0] anode,
    input [7:0] cathode
    );
    
    ALU alu(.A(A), .B(B), .alu_op(alu_op), .reset(reset), .result(aluResult));
    digit_Sep digit_sep(.input_data(aluResult), .digit_1(in1), .digit_2(in2), .digit_3(in3), .digit_4(in4));
    top_time toptime(.clk(clk), .reset(reset), .in1(in1), .in2(in2), .in3(in3), .in4(in4), .anode(anode), .cathode(cathode)); 

endmodule
