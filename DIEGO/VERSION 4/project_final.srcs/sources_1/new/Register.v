`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/02/2024 01:57:30 AM
// Design Name: 
// Module Name: Register
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


module Register(
    input clk,
    input read,
    input write,
    input [7:0] result, //Result from ALU
    output reg [7:0] readResult //Reads the chosen register
    );
    
    reg [7:0] register1 = 8'h00; //8-bit storage register initialized to 0
    reg [7:0] register2 = 8'h00; //8-bit storage register initialized to 0
    //readResult = 8'h00; //8-bit register to hold result
    //reg c = 0;
    
    always @(posedge clk) begin
        readResult = result;
        if (write == 1'b1)
            register1 = result;
        if (read == 1'b1)
            readResult = register1;
    end
    
    /*
    always@(write) begin
        register1 = result; //stores current result in register 1, quick memory
        
        if (write == 1'b1)
            register2 = result;
        if (read == 1'b1)
            readResult = register2;
        else
            readResult = register2;
    end
    */
    
    /*
    always@(write == 1'b1)begin
        register1 = result;
        if (read == 1'b1)
            readResult = register1;
    end
    */
    
    /*
    always@(clk) begin
        if (c==0)begin
        if (register1 != result)
           c=1;
        register1 <= result;        
        end        
        else begin
        if (register2 != result)
                   c=0;
        register2 <= result;
        end
        
        
        if (read) begin
             if(c==0)
            readResult = register2;
            else 
            readResult=register1;
        end
    end
    */
    
endmodule
