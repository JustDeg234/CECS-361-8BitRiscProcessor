`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/29/2024 05:38:32 PM
// Design Name: 
// Module Name: top_time
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


module top_time(
    input clk,
    input reset,
    input [3:0] in1,
    input [3:0] in2,
    input [3:0] in3,
    output [7:0] anode,
    output [7:0] cathode
);

// Embedded values for in0, in1, and in2
localparam [3:0] IN0_VALUE = 4'b0000; // Replace XXXX with your desired value
localparam [3:0] IN1_VALUE = 4'b0001;
localparam [3:0] IN2_VALUE = 4'b0010;
localparam [3:0] IN3_VALUE = 4'b0011;

    /*
    BCD_to7Seg inst1(in0, o1);
    BCD_to7Seg inst2(in1, o2);
    BCD_to7Seg inst3(in2, o3);
    */

time_multiplexer inst_time_mux(
    .clk(clk),
    .reset(reset),
    .in1(in1),
    .in2(in2),
    .in3(in3),
    .anode(anode),
    .cathode(cathode)
);

endmodule