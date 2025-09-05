`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/05/2025 02:26:59 AM
// Design Name: 
// Module Name: ALU_Control_Unit
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


module ALU_Control_Unit(
    input wire [31:0] instruction,
    input wire [1:0] ALUOp,
    output reg [3:0] ALU_Control
    );
    
    wire [6:0] funct7 = instruction[31:25];
    wire [2:0] funct3 = instruction[14:12];
    
    always @(*) begin 
        case (ALUOp)
            2'b00: begin
                ALU_Control <= 4'b0010;
            end
            2'b01: begin
                ALU_Control <= 4'b0110;
            end
            2'b10: begin
                case ({funct7,funct3})
                    10'b0000000000: ALU_Control <= 4'b0010;
                    10'b0100000000: ALU_Control <= 4'b0110;
                    10'b0000000111: ALU_Control <= 4'b0000;
                    10'b0000000110: ALU_Control <= 4'b0001;
                endcase
            end
        endcase
    end //always
endmodule
