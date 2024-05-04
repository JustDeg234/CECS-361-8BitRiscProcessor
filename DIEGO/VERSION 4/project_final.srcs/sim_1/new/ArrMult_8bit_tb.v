`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/03/2024 04:59:27 PM
// Design Name: 
// Module Name: ArrMult_8bit_tb
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

module ArrMult_8bit_tb();
    reg [7:0] a_tb, b_tb; 
    reg [15:0] result;
    wire [15:0] prod_tb;
    integer i, j;


    ArrMult_8bit uut(.a(a_tb), .b(b_tb), .prod(prod_tb));

    initial begin
        for(i=0; i < 256; i = i + 1) 
            begin
            {a_tb} = i;
                for(j=0; j<256; j = j + 1) 
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
