`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/05/2025 02:12:03 AM
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
    input wire [31:0] in1, in2,
    input wire [3:0] ALU_Control,
    output reg zero,
    output reg [31:0] ALU_result
    );
    
    always @(ALU_Control or in1 or in2) begin
        case (ALU_Control)
            4'b0000: ALU_result = in1 & in2;
            4'b0001: ALU_result = in1 | in2;
            4'b0010: ALU_result = in1 + in2;
            4'b0110: ALU_result = in1 - in2;
            4'b0111: ALU_result = in1 < in2;
            default: ALU_result = 32'b00;
        endcase
        if (ALU_result == 0)
            zero = 1;
        else
            zero = 0;
    
    end //always
endmodule
