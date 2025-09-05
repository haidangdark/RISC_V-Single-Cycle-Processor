`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/05/2025 12:00:04 AM
// Design Name: 
// Module Name: PC
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


module PC(
    input wire clk, rst,
    input wire [31:0] PC_in, // address in 32bit
    output reg [31:0] PC_out // address out 32bit
);
    always @(posedge clk or posedge  rst) begin
        if (rst) begin
            PC_out <= 32'b0;
        end //if
        else begin
            PC_out <= PC_in;
        end //else
    end // always

endmodule
