`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/02/2024 01:57:30 AM
// Design Name: 
// Module Name: Register
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


module Register(
    input clk,
    input read, 
    input [7:0] result, //Result from ALU
    output [7:0] readResult //Reads the chosen register
    );
    
    reg [7:0] register = 8'h00; //8-bit storage register initialized to 0
    reg [7:0] readResult = 8'h00; //8-bit register to hold result
    
    always@(clk) begin
        register <= result;
        
        if (read) begin
            readResult = register;
        end
    end
    
endmodule
