`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/05/2025 12:44:07 AM
// Design Name: 
// Module Name: Register_file
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


module Register_file(
    input wire clk, rst,
    //input wire [4:0] rs1, rs2, rd,
    input wire [31:0] instruction,
    input wire [31:0] write_data,
    input wire RegWrite,
    output reg [31:0] read_data1, read_data2
    );
    reg [31:0] registers_mem [0:31];
    integer i;
    
    wire [4:0] rs1 = instruction[19:15];
    wire [4:0] rs2 = instruction[24:20];
    wire [4:0] rd = instruction[11:7];
    
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            for (i = 0; i < 32; i = i + 1) begin
                registers_mem[i] <= 32'b00;
            end //for
            read_data1 <= 32'b00;
            read_data2 <= 32'b00;
        end //if
        
        else if (RegWrite) begin
            registers_mem[rd] <= write_data;
        end //else if (RegWrite)
        
        else begin
            read_data1 <= registers_mem[rs1];
            read_data2 <= registers_mem[rs2];
        end //else
        
    end //always
endmodule
