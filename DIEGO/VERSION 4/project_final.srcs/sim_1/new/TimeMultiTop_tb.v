`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: CSULB
// Engineer: Jonathan Lopez
// 
// Create Date: 04/29/2024 11:09:02 PM
// Design Name: 
// Module Name: TimeMultiTop_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments: Run twice at 20ms in behavioral simulation to observe full sequences and partitioning of the cathode and anode values.
//                      Also, set radix to Binary to see the cycling more clearly. 
//////////////////////////////////////////////////////////////////////////////////


module TimeMultiTop_tb; // simple testbench

    reg clk_tb, reset_tb;
    //reg in1_tb = 0, in2_tb = 0, in3_tb = 0;
    reg [7:0] in1_tb = 0, in2_tb = 0, in3_tb = 0, in4_tb = 0;
    wire [3:0] anode_tb;
    wire [7:0] cathode_tb;
    
    time_multiplexer UUT(.clk(clk_tb), .reset(reset_tb), .in1(in1_tb), .in2(in2_tb), .in3(in3_tb), .in4(in4_tb), .anode(anode_tb), .cathode(cathode_tb));
  
    always // create clock
        #5 clk_tb = ~clk_tb;
    
    initial
        begin
        
            clk_tb = 0; 
            reset_tb = 1;
            #2000000; // long delay (2ms in behavioral sim) to create visible case of reset_tb = 1 in 20ms simulation frame
                    
             
            reset_tb = 0; // set reset_tb to 0 after 2ms have transpired
            
            // 7-seg values desired to be displayed
            in1_tb = 2; 
            in2_tb = 5; 
            in3_tb = 4;
            in4_tb = 8;
            
            //repeat(20) @(negedge clk_tb); // wait for 20 falling edges before ending simulation
        end    

endmodule


