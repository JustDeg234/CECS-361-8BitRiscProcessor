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


module digit_Sep_tb();
    //create registers and wires
    reg [7:0] result_tb; 
    wire [3:0] digit_1_tb;
    wire [3:0] digit_2_tb;
    wire [3:0] digit_3_tb;
    wire [3:0] digit_4_tb;
    
    //Duration for each bit
    localparam period = 50;
    
    //Instantiate the module (uut = unit under test)
    digit_Sep uut(.input_data(result_tb), .digit_1(digit_1_tb), .digit_2(digit_2_tb), .digit_3(digit_3_tb), .digit_4(digit_4_tb));
    
    initial begin
        result_tb = 8'b0000_0001;
        #period;
        
        result_tb = 8'b0000_0011;
        #period;
        
        result_tb = 8'b1111_1111;
        #period;
        
        result_tb = 8'b0011_0101;
        #period;
        
        result_tb = 8'b1100_0011;
        #period;
        
        result_tb = 8'b0001_1111;
        #period;
        
        result_tb = 8'b0101_0101;
        #period;
        
        result_tb = 8'b1100_0101;
        #period;
    end
endmodule
