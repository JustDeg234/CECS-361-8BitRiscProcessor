`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/28/2024 01:33:24 PM
// Design Name: 
// Module Name: ALU
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


module ALU(
    //input switchDisplay,
    input [7:0] A, //input register A acting as operand A
    input [7:0] B, //input register B acting as operand B
    // Control Unit signals
    //input [1:0] alu_op, // 2 bit ALU operation control signal
    input [1:0] alu_op,
    //input alu_src
    output reg [15:0] result,
    output reg enableSDisplay
    );
    
    
    wire [7:0] addResult;
    wire [7:0] subResult;
    //temp values
    wire [15:0] multResult;
    wire [7:0] divResult = 8'b0000_0110;
   
    /*
    always @* begin
        if (addition) begin
            result <= addResult;
        end else if (subtraction) begin
            alu_op <= 2'b10;
        end else if (multiplication) begin
            result <= multResult;
        end else begin
            alu_op <= 2'b00;
        end
    end
    */
    
    //Instantiate the modules ASK REZAI HOW TO INSTANTIATE IN CASE
    AddSub_8bit RCA_ADD(.a(A), .b(B), .cin(1'b0), .s(addResult), .cout(cout), .overflow(overflow)); //instantiate RCA module for addition
    AddSub_8bit RCA_SUB(.a(A), .b(B), .cin(1'b1), .s(subResult), .cout(cout), .overflow(overflow)); //instantiate RCA module for subtraction
    ArrMult_8bit AM_8b(.a(A), .b(B), .prod(multResult)); 
    
always @(*) begin //always runs every clock cycle, always @(*) used only for combinational logic, which also means blocking assignment '='

        case(alu_op)
            2'b00: result = addResult; //addition
            2'b01: result = subResult; // Subtraction
            2'b10: result = multResult; // Array Multiplier Result
            2'b11: result = divResult; //Test
            default: result = addResult; // Default is to show 
        endcase
   
        
end

endmodule



//IT ALWAYS WRITES IT TO MEMORY

//THE REGISTERS ALTERNATE

//INCORPORTATE COUNTER

//PRESS PEVIOUS BUTTON TO SEE THE LAST RESULT