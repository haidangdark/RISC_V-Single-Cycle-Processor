`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/05/2025 03:09:47 AM
// Design Name: 
// Module Name: AND_log
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


module AND_log(
    input wire in1, in2,
    output reg and_out
    );
    
    always @(*) begin
        and_out <= in1 & in2;
    end
endmodule
