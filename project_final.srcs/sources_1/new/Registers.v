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
    input [2:0] readAddr, //Address for the read port
    input [2:0] writeAddr, //Address for the write port
    input [7:0] writeData, //Data to be written
    input writeEnable, //Write enable signal
    output reg [7:0] readData //Data output for read port
    );

reg [7:0] registers [0:7]; //2D array of 8-bit registers defined for storage

//Read Operation
always @ (posedge clk) begin
    readData <= registers[readAddr];
end

//Write Operation
always @ (posedge clk) begin
    if (writeEnable) begin
        registers[writeAddr] <= writeData;
    end
end
   
endmodule
