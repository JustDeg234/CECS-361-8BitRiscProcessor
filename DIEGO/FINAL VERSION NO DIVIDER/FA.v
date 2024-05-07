`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: CSULB
// Engineer: Jonathan Lopez
// 
// Create Date: 04/24/2024 10:03:16 PM
// Design Name: 
// Module Name: FA
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


module FA(
    input a,
    input b,
    input c_in,
    output sum,
    output c_out
    );

    assign sum = a ^ b ^ c_in;

    assign c_out = (c_in * (a ^ b) + (a * b));
    

endmodule