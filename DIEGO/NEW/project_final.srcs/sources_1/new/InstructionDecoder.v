`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/02/2024 12:08:06 AM
// Design Name: 
// Module Name: InstructionDecoder
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


module InstructionDecoder( //basically a lot of muxes
    input add,
    input sub,
    input mult,
    input div,
    input prev,
    output reg [2:0] opcode
    );
    
    //converts the multiple 1-bit signal input from the button presses to the corresponding operation code to be sent to ALU or Registers
    always @(*) begin
    if (add)
        opcode = 3'b000;
    else if (sub)
        opcode = 3'b001;
    else if (mult)
        opcode = 3'b010;
    else if (div)
        opcode = 3'b011;
    else if (prev)
        opcode = 3'b100;
    else
        opcode = 3'b101;
    end
    
endmodule
