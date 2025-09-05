`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/06/2025 01:06:57 AM
// Design Name: 
// Module Name: tb_TOP_MODULE
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


module tb_TOP_MODULE;
    reg clk, rst;
    
    TOP_MODULE uut(
        .clk(clk),
        .rst(rst)
    );
    
    initial begin
        forever #5 clk = ~clk;
    end

    initial begin
        clk = 0;
        rst = 1;
        #5;
        rst = 0;
        #400;
    end
    
endmodule
