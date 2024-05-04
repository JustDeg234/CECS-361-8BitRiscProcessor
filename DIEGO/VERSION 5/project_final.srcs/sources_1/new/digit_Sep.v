`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/30/2024 04:10:56 PM
// Design Name: 
// Module Name: digit_Sep
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


module digit_Sep(
    input [15:0] input_data,
    output reg [3:0] digit_1,
    output reg [3:0] digit_2,
    output reg [3:0] digit_3,
    output reg [3:0] digit_4,
    output reg [3:0] digit_5
);

// Declare variables for calculations
reg [15:0] temp;
reg [15:0] decimal;

// Separate the digits using procedural assignments
always @*
    begin
        temp = input_data;
        digit_1 = temp % 10;
        temp = temp / 10;
        digit_2 = temp % 10;
        temp = temp / 10;
        digit_3 = temp % 10;
        temp = temp / 10;
        digit_4 = temp % 10;
        temp = temp / 10;
        digit_5 = temp % 10;
    end

endmodule

