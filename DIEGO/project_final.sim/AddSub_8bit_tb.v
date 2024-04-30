`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: CSULB
// Engineer: Jonathan Lopez
// 
// Create Date: 04/24/2024 10:15:13 PM
// Design Name: 
// Module Name: AddSub_8bit_tb
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


module AddSub_8bit_tb();
    reg [7:0] a_tb, b_tb;
    reg [7:0] result;
    reg cin_tb;

    wire [7:0] sum_tb;
    wire cout_tb;
    wire overflow_tb;    
    
    integer i, j;
    
    // Instantiate the AddSub_8bit module
      AddSub_8bit uut (
        .a(a_tb),
        .b(b_tb),
        .cin(cin_tb),
        .cout(cout_tb),
        .s(sum_tb),
        .overflow(overflow_tb)
      );
   
    
   initial begin
   
      cin_tb = 0; // addition
   
      for(i = 0; i < 129; i = i + 1) 
          begin
          {a_tb} = i;
              for(j = 0; j < 129; j = j + 1) 
              begin
              {b_tb} = j;     
              //#10;
              result = (a_tb + b_tb);
              #3;   
              if (result == sum_tb) 
                  begin
                  $display(a_tb," + ",b_tb," passed. Since result = ",result," and sum_tb = ",sum_tb);
                  end 
              else 
                  begin
                  $display(a_tb," + ", b_tb," failed.");
                  end
              end  
          end
      $finish;   
  end    
endmodule


