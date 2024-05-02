`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Diego Davalos, Jonathon Lopez
// 
// Create Date: 04/21/2024 12:49:44 PM
// Design Name: 
// Module Name: ControlUnit
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


module ControlUnit( //Control Unit takes in opcode signal, modifies control signals, then decodes for directing instruction to ALU
    input [4:0] opcode, // 3 bit input control signal from FPGA that determines CPU process 
    //essential control signals:
    output reg reg_dst, // 1 bit Register destination control signal, determines if output result is sent to a registerz
    output reg mem_to_reg, /* 1 bit Memory to Register control signal, specifies location of signal written to register, 
                            high: data signal from memory unit
                            low: data signal from ALU or other
                           */
    output reg [1:0] alu_op, // 2 bit ALU control signal that specifies the operation, depends on opcode too, needed to specify opcode
    output reg jump, // 1 bit jump/branch control signal that alters control flow via non-sequential instruction execution
    output reg mem_read, // 1 bit Memory read control signal that reads data from memory when high
    output reg mem_write, // 1 bit Memory write control signal that writes data to memory when high
    //output reg alu_src, // 1 bit ALU source control signal that changes operand B from register B to a predetermined operand.
    output reg reg_write, // 1 bit Register write control signal that writes data to register when high
    //output reg reg_read NOT NEEDED because it is the default operation by the CPU
    output reg signed_zero, // 1 bit signed or zero control signal that determines if ALU result should be read as a signed var or zero.
    
    output reg cin, //for addsub
    output reg overflow, //for addsub
    output reg cout
    );
    
    //opcode:
    always @(*) //loop that triggers procedural statements whenever an input to or signals in this module (sensitivity list) changes
    begin
        case(opcode) //control signals changed depedning on the following opcode input
            3'b000: begin //addition operation
                //control signals
                alu_op = 2'b00;  
            end
            
            3'b001: begin //subtraction
                //control signals
                alu_op = 2'b01; //2nd ALU case
            end
            
            3'b010: begin //array multiplier
                //control signals
                alu_op = 2'b10; //3rd ALU case
            end
            
            3'b011: begin //array divider
                //control signals
                alu_op = 2'b11; //4th ALU case
            end
            
            default: begin
                //control signals definition
                reg_dst = 1'b0;
                mem_to_reg = 1'b0;
                alu_op = 2'b00;
                jump = 1'b0;
                mem_read = 1'b0;
                mem_write = 1'b0;
                //alu_src = 1'b0;
                reg_write = 1'b0;
                signed_zero = 1'b0;
            end
        endcase
    end
endmodule
