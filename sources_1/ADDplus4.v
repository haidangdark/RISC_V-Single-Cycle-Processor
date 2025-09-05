`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/05/2025 12:11:21 AM
// Design Name: 
// Module Name: ADDplus4
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

// this module also plus 4 to fromPC by using assign
module ADDplus4(
    input wire [31:0] fromPC,
    output reg [31:0] toPC
    );
    always @(*) begin
        toPC <= fromPC + 4;
    end //always
endmodule
