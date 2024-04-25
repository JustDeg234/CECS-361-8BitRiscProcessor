`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Diego Davalos
// 
// Create Date: 03/28/2024 12:45:47 PM
// Design Name: 
// Module Name: Registers
// Project Name: 8-bit RISC architecture
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


module Registers(
    input clk, //Clock input
    input reset, //Reset input
    input [2:0] readAddr, //Determines which registers to read from
    input [2:0] writeAddr, //Determines which register to write data on
    input [7:0] writeData, //Data to be written
    input writeEnable, //Write enable signal
    output reg [7:0] readData //Reads the chosen register
    );

reg [7:0] registers [0:7]; //2D array of 8-bit registers defined for storage

//base case - reset all registers to 0
integer i;
always @(*)
    if (reset == 1) 
    begin
        #10
        for (i = 0; i < 8; i = i + 1) 
        begin
            registers[i] = 8'b00000000;
        end
    end
    

//Read Operation
always @ (posedge clk) begin //clocked always block with nonblocking assignments for sequential logic
    readData <= registers[readAddr]; //nonblocking assignment, reads data from registers
end

//Write Operation
always @ (posedge clk) begin
    if (writeEnable == 1'b1 && reset == 1'b0) begin
        registers[writeAddr] <= writeData; //populates registers with input data
    end
end
   
endmodule
