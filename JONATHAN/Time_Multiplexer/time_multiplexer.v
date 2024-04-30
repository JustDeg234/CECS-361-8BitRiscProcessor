`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: CSULB
// Engineer: Jonathan Lopez
// 
// Create Date: 04/29/2024 09:14:50 PM
// Design Name: 
// Module Name: time_multiplexer
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


module time_multiplexer(
    input clk, reset,
              // units, tens, hundreds,   
    input [3:0] in1, in2, in3, // 4-bit inputs w/ all possible scenarios for each 7-seg display (XXXX = 15, but we really only need to 9)
    output reg [7:0] anode, // anode for each individual 7-seg dislay                     (anything less than 4-bits is too small, like XXX = 7)
    output reg [7:0] cathode // cathode for each seg of each display
    );
  
    // 5.2ms is the total refresh period (combining all in time from simulation)
    parameter N = 19; // 100Mhz / (2^17) = 763 Hz --> desired refresh rate for each digit
    
    // internal registers
    reg [N-1:0] curr_state;
    wire [N-1:0] next_state;
    
    // current state logic
    always @ (posedge clk, posedge reset) 
    begin
        if(reset)
            curr_state <= 0;
        else
            curr_state <= next_state;
    end
    
    // next state logic
    assign next_state = curr_state + 1; 
    
    wire [7:0] digit1, digit2, digit3;
    
    // output logic
    always @ (*)
    begin
        case(curr_state[N-1:N-2]) // 2-bit value looking at the msb and one bit before the msb of curr_state
        2'b00 : begin 
                      anode = 8'b1111_1110;
                      cathode = digit1; 
                end
        2'b01 : begin 
                      anode = 8'b1111_1101;
                      cathode = digit2; 
                end   
        default : begin // since the default case is more likely to occur, this case technically happens more often
                      anode = 8'b1111_1011;   // however, it doesn't interfere with on-board sim or behavioral sim
                      cathode = digit3; 
                end    
       endcase         
    end
   
    BCD_to7Seg inst1(in1, digit1);
    BCD_to7Seg inst2(in2, digit2);
    BCD_to7Seg inst3(in3, digit3);
    
endmodule
