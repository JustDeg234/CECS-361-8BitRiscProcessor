`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/30/2024 04:29:23 PM
// Design Name: 
// Module Name: ALU_tb
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


module ALU_tb();
    //create registers and wires
    reg [7:0] A_tb, B_tb; 
    reg [1:0] alu_op_tb;
    wire [7:0] result_tb;
    
    //Duration for each bit
    localparam period = 50;
    
    //Instantiate the module (uut = unit under test)
    ALU uut(.A(A_tb), .B(B_tb), .alu_op(alu_op_tb), .result(result_tb));
    
    initial begin
        A_tb = 8'b0000_0001;
        B_tb = 8'b0000_0010;
        alu_op_tb = 2'b00;
        #period;
        
        A_tb = 8'b0000_0001;
        B_tb = 8'b0000_0001;
        alu_op_tb = 2'b00;
        #period;
        
        A_tb = 8'b0000_1111;
        B_tb = 8'b0000_1110;
        alu_op_tb = 2'b00;
        #period;

        A_tb = 8'b0000_0001;
        B_tb = 8'b0000_0010;
        alu_op_tb = 2'b01;
        #period;
        //#period;
    end
endmodule
