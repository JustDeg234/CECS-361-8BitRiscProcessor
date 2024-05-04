`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/03/2024 12:35:26 PM
// Design Name: 
// Module Name: InstructionDecoder_tb
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



module InstructionDecoder_tb();
    //create registers and wires
    reg add_tb;
    reg sub_tb;
    reg prev_tb;
    reg write_en_tb;
    
    wire [2:0] opcode_tb;
    
    //Duration for each bit
    localparam period = 50;
    
    //Instantiate the module (uut = unit under test)
    InstructionDecoder uut(.add(add_tb), .sub(sub_tb), .prev(prev_tb), .write_en(write_en_tb), .opcode(opcode_tb));
    
    initial begin
        #period;
    
        add_tb = 1'b1;
        sub_tb = 1'b0;
        prev_tb = 1'b0;
        write_en_tb = 1'b0;
        #period;
        
        add_tb = 1'b0;
        sub_tb = 1'b1;
        prev_tb = 1'b0;
        write_en_tb = 1'b0;
        #period;
        
        add_tb = 1'b1;
        sub_tb = 1'b0;
        prev_tb = 1'b0;
        write_en_tb = 1'b1;
        #period;
        
        add_tb = 1'b0;
        sub_tb = 1'b0;
        prev_tb = 1'b1;
        write_en_tb = 1'b0;
        #period;
    end
endmodule
