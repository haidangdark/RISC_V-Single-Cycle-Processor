`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/05/2025 02:43:12 AM
// Design Name: 
// Module Name: MEM
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


module MEM(
    input wire clk, rst, MemRead, MemWrite,
    input wire [31:0] address,
    input wire [31:0] write_data,
    output reg [31:0] read_data
    );
    
    reg [31:0] D_Mem [63:0];
    integer i;
    
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            for (i = 0; i < 64; i = i + 1) begin
                D_Mem[i] <= 32'b00;
            end //for
            read_data <= 32'b00;
        end //if
        
        else if (MemWrite) begin
            D_Mem[address] <= write_data;
            read_data <= 32'b00;
        end //else if (MemWrite)
        
        else if (MemRead) begin
            read_data <= D_Mem[address];
        end //else if (MemRead)
        
        else begin 
            read_data <= 32'b00;
        end //else
    end //always
endmodule
