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
    //input [4:0] op,
    input addition, subtraction, multiplication, divide, previous, write_enable,
    output [7:0] anode, 
    output [7:0] cathode
    //output reg switchDisplay
    //output reg [7:0] finalResult
    );
    
    wire [3:0] in1;
    wire [3:0] in1_A;
    
    wire [3:0] in2;
    wire [3:0] in2_A;
    
    wire [3:0] in3;
    wire [3:0] in3_A;
    
    wire [3:0] in4;
    wire [3:0] in4_B;
    
    wire [3:0] in5;
    wire [3:0] in5_B;
    
    wire [3:0] in6;
    wire [3:0] in6_B;
    
    wire [15:0] aluResult;
    wire [1:0] alu_op;
    wire [2:0] opcode;
    wire read;
    wire write;
    wire [15:0] readResult;
    wire reset = 0;
    
    wire switchInput_s;
    //wire [3:0] digit_1A; wire [3:0] digit_2A; wire [3:0] digit_3A;
    //wire [3:0] digit_1B; wire [3:0] digit_2B; wire [3:0] digit_3B;

    
    ALU alu(.A(A), .B(B), .alu_op(alu_op), .result(aluResult));
    //InstructionDecoder inst_dec(.op(op), .opcode(opcode));
    InstructionDecoder inst_dec(.clk(clk), .add(addition), .sub(subtraction), .mult(multiplication), .div(divide), .prev(previous), .write_en(write_enable), .opcode(opcode));
    ControlUnit cu(.clk(clk), .opcode(opcode), .alu_op(alu_op), .read(read), .write(write), .switchInput(switchInput_s));
    Register register(.clk(clk), .read(read), .write(write), .result(aluResult), .readResult(readResult));
    digit_Sep digit_sep(.A_channel(A), .B_channel(B), .switchInput(switchInput_s), .input_data(readResult), .digit_1(in1), .digit_2(in2), .digit_3(in3), .digit_4(in4), .digit_5(in5), .digit_1A(in1_A), .digit_2A(in2_A), .digit_3A(in3_A), .digit_1B(in4_B), .digit_2B(in5_B), .digit_3B(in6_B));
    
    time_multiplexer inst_time_mux0(.clk(clk), .reset(reset), .switchInput(switchInput_s), .in1(in1), .in2(in2), .in3(in3), .in4(in4), .in5(in5), .in1_A(in1_A), .in2_A(in2_A), .in3_A(in3_A), .in4_B(in4_B), .in5_B(in5_B), .in6_B(in6_B), .anode(anode), .cathode(cathode));
    
    /*
    always @(clk) begin
        finalResult <= aluResult;
    end
    */
    

endmodule
