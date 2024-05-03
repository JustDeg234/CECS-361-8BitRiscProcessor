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
    //wire [19:0] curr_state,
    //wire [19:0] next_state,
    input [3:0] in1,
    input [3:0] in2,
    input [3:0] in3,
    input [3:0] in4,
    input [3:0] in5,
    output [7:0] anode,
    output [7:0] cathode
);

// Embedded values for in0, in1, and in2
localparam [3:0] IN0_VALUE = 4'b0000; // 0
localparam [3:0] IN1_VALUE = 4'b0001; // 1
localparam [3:0] IN2_VALUE = 4'b0010; // 2
localparam [3:0] IN3_VALUE = 4'b0011; // 3
localparam [3:0] IN4_VALUE = 4'b0100; // 4
localparam [3:0] IN5_VALUE = 4'b0101; // 5
localparam [3:0] IN6_VALUE = 4'b0110; // 6
localparam [3:0] IN7_VALUE = 4'b0111; // 7
localparam [3:0] IN8_VALUE = 4'b1000; // 8
localparam [3:0] IN9_VALUE = 4'b1001; // 9


time_multiplexer inst_time_mux(
    .clk(clk),
    .reset(reset),
    //.curr_state(curr_state),
    //.next_state(next_state),
    .in1(IN2_VALUE),
    .in2(IN5_VALUE),
    .in3(IN4_VALUE),
    .in4(IN8_VALUE),
    .in5(IN9_VALUE),
    .anode(anode),
    .cathode(cathode)
);

endmodule