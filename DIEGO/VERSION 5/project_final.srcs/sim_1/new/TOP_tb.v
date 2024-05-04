`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/02/2024 02:10:15 AM
// Design Name: 
// Module Name: TOP_tb
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


module TOP_tb();
    //create registers and wires
    reg clk_tb;
    reg [7:0] A_tb, B_tb; 
    reg [4:0] op_tb;
    //reg add_tb, sub_tb, mult_tb, div_tb, prev_tb;
    wire [7:0] anode_tb;
    wire [7:0] cathode_tb;
    //wire [7:0] finalResult_tb;
    
    //Instantiate the module (uut = unit under test)
    /*
    TOP uut(.clk(clk_tb), 
            .A(A_tb), 
            .B(B_tb), 
            .addition(add_tb), 
            .subtraction(sub_tb), 
            .multiplication(mult_tb),
            .divider(div_tb),
            .previous(prev_tb),
            .anode(anode_tb),
            .cathode(cathode_tb),
            .finalResult(finalResult_tb)
            ); //.finalResult(finalResult_tb)
     */
    TOP uut(.clk(clk_tb), 
            .A(A_tb), 
            .B(B_tb), 
            .op(op_tb),
            .anode(anode_tb),
            .cathode(cathode_tb)
            ); //.finalResult(finalResult_tb)     
     
    
    always #5 clk_tb = ~clk_tb;
    
    localparam period = 50; //local parameter for easily changing period time
    
    initial begin
        clk_tb = 0;
        
        A_tb = 8'b0000_0001;
        B_tb = 8'b0000_0010;
        op_tb = 5'b00010; //add
        #period;
        op_tb = 5'b00011; //write
        #period;
        
        A_tb = 8'b0000_0100;
        B_tb = 8'b0000_0010;
        op_tb = 5'b10000; //sub
        #period;
        op_tb = 5'b00011; //write
        #period;
        op_tb = 5'b00001; //read
        #period;
        
        A_tb = 8'b0000_1111;
        B_tb = 8'b0000_1110;
        op_tb = 5'b00100; //mult
        #period;
        op_tb = 5'b00011; //write
        #period;
        op_tb = 5'b00001; //read
        #period;
        
        A_tb = 8'b0000_0001;
        B_tb = 8'b0000_0010;
        op_tb = 5'b01000; //div
        #period;
        op_tb = 5'b00011; //write
        #period;
        op_tb = 5'b00001; //read
        #period;
        
        A_tb = 8'b0000_0001;
        B_tb = 8'b0000_1111;
        op_tb = 5'b00011; //write
        #period;
        op_tb = 5'b00001; //read
        $finish;
    end
    /*
    initial begin
        clk_tb = 0;
        add_tb = 1'b0;
        sub_tb = 1'b0;
        mult_tb = 1'b0;
        div_tb = 1'b0;
        prev_tb = 1'b0;
        #period;
        
        A_tb = 8'b0000_0001;
        B_tb = 8'b0000_0010;
        add_tb = 1'b1;
        #period;
        //$display("anode = %h, cathode = %h", anode, cathode);
        
        A_tb = 8'b0000_0100;
        B_tb = 8'b0000_0010;
        add_tb = 1'b0;
        sub_tb = 1'b1;
        #period;
        //$display("anode = %h, cathode = %h", anode, cathode);
        
        A_tb = 8'b0000_1111;
        B_tb = 8'b0000_1110;
        add_tb = 1'b0;
        sub_tb = 1'b0;
        mult_tb = 1'b1;
        #period;
        //$display("anode = %h, cathode = %h", anode, cathode);

        A_tb = 8'b0000_0001;
        B_tb = 8'b0000_0010;
        add_tb = 1'b0;
        sub_tb = 1'b0;
        mult_tb = 1'b0;
        div_tb = 1'b1;
        #period;
        //$display("anode = %h, cathode = %h", anode, cathode);
        
        A_tb = 8'b0000_0001;
        B_tb = 8'b0000_1111;
        add_tb = 1'b0;
        sub_tb = 1'b0;
        mult_tb = 1'b0;
        div_tb = 1'b0;
        prev_tb = 1'b1;    
        #period;
        //$display("anode = %h, cathode = %h", anode, cathode);
        
        A_tb = 8'b0000_0001;
        B_tb = 8'b0000_0001; 
        //$display("anode = %h, cathode = %h", anode, cathode);
        
        $finish;
    end
    */
endmodule