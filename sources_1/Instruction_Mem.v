`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/05/2025 12:19:34 AM
// Design Name: 
// Module Name: Instruction_Mem
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


module Instruction_Mem(
    input wire clk, rst,
    input wire [31:0] read_addr, // dia chi lenh
    output reg [31:0] instruction_out // lenh dc fetch ra
    );
    reg [31:0] I_mem [63:0]; // Bộ nhớ lệnh 64 dòng

    integer i;
    
    always @(posedge clk or posedge rst) begin
        if (rst) begin 
            for (i = 0; i < 64; i = i + 1) begin
                I_mem[i] <= 32'b00;
            end //for
            instruction_out <= 32'b00;
        end //if
        
        else begin
            instruction_out <= I_mem[read_addr];
        end //else
    end //always 
endmodule

