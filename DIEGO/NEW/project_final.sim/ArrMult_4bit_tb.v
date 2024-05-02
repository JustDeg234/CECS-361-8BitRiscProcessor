`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: CSULB
// Engineer: Amin Rezaei
// Modified by Jonathan Lopez
// Create Date: 08/22/2020 06:59:39 PM
// Design Name: 361_Lab1
// Module Name: ArrMult_4bit_tb
// Revision 0.01 - File Created
//////////////////////////////////////////////////////////////////////////////////

module ArrMult_4bit_tb();
    reg [3:0] a_tb, b_tb; 
    reg [7:0] result;
    wire [7:0] prod_tb;
    integer i, j;
    
    
    ArrMult_4bit uut(.a(a_tb), .b(b_tb), .prod(prod_tb));
    
    initial begin
        for(i=0; i < 16; i = i + 1) 
            begin
            {a_tb} = i;
                for(j=0; j<16; j = j + 1) 
                begin
                {b_tb} = j;     
                //#10;
                result = (a_tb * b_tb);
                #3;   
                if (result == prod_tb) 
                    begin
                    $display(a_tb," * ", b_tb, " passed. Since result = ",result," and prod_tb = ",prod_tb);
                    end 
                else 
                    begin
                    $display(a_tb," * ", b_tb, " failed.");
                    end
                end  
            end
        $finish;   
    end    
endmodule

