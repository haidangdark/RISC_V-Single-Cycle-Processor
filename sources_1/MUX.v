`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/05/2025 03:04:48 AM
// Design Name: 
// Module Name: MUX
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


module MUX(
    input wire select,
    input wire [31:0] in1, in2,
    output reg [31:0] mux_out
    );
    
    always @(*) begin
        if (select) begin
            mux_out <= in1;
        end //if
        else begin
            mux_out <= in2;
        end //else
    end //always
endmodule
