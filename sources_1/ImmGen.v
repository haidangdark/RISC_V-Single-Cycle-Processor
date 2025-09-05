`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/05/2025 01:03:00 AM
// Design Name: 
// Module Name: ImmGen
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

//module generate cac immediate chua du 32bit len 32bit
// phan code nay chi giai quyet cac lenh r-format, lw, sw, beq
module ImmGen(
    //input wire [6:0] opcode,
    input wire [31:0] instruction,
    output reg [31:0] imm_out //extended
    );
    wire [6:0] opcode = instruction[6:0]; 
    
    always @(*) begin
        case (opcode)
            7'b0000011 : imm_out <= {{20{instruction[31]}}, instruction[31:20]}; //lww
            7'b0100011 : imm_out <= {{20{instruction[31]}}, instruction[31:25], instruction[11:7]}; //sw
            7'b1100011 : imm_out <= {{19{instruction[31]}}, instruction[31], instruction[7], instruction[30:25], instruction[11:8], 1'b0};  //beq
        endcase
    end //always
    
endmodule
