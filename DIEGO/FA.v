`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: CSULB
// Engineers: Jose Aceves & Amin Rezaei 
// Create Date: 08/22/2020 06:59:39 PM
// Design Name: 361_Lab1
// Module Name: FA
// Revision 0.01 - File Created
//////////////////////////////////////////////////////////////////////////////////

module FA(
    input a,
    input b,
    input c_in,
    output c_out,
    output sum
    );
    
    //assign {c_out, sum} = a + b + c_in; //behavioral implementation
    
    //wire wire1, wire2, wire3;
    
    assign sum = a ^ b ^ c_in;
    //xor (wire1, a, b);  wire1 = a ^ b;
    //xor (sum, wire1, c_in); // sum = wire1 ^ c_in;
    
    
    assign c_out = (c_in * (a ^ b) + (a * b));
    //and (wire2, a, b); // wire2 = a * b; 
    //and (wire3, c_in, wire1); // wire3 = c_in * wire1; 
    //or (c_out, wire3, wire2); // c_out = wire3 + wire2;
    
endmodule
