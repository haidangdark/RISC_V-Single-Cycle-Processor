`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/05/2025 03:14:23 AM
// Design Name: 
// Module Name: TOP_MODULE
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



module TOP_MODULE(
    input wire clk, rst
    
    );
    
    wire [31:0] PC_top, PCin_top, instruction_top, read_data1_top, read_data2_top, imm_ext_top, mux1_top, add_out_top, add4_out_top, alu_result_top, data_wb_top, read_data_top; 
    wire Branch, MemRead, MemtoReg, MemWrite, ALUSrc, RegWrite, zero, select_mux2;
    wire [1:0] ALUOp;
    wire [3:0] ALU_control_top;
    //program counter
    PC program_counter (
        .clk(clk), 
        .rst(rst), 
        .PC_in(PCin_top), 
        .PC_out(PC_top)
    );
    
    
    //PC adder +4
    ADDplus4 adder_4 (
        .fromPC(PC_top), 
        .toPC(add4_out_top)
    );
    
    //Instruction memory
    Instruction_Mem IM(
        .clk(clk), 
        .rst(rst), 
        .read_addr(PC_top), 
        .instruction_out(instruction_top)
    );
    
    //Register file
    Register_file IF(
        .clk(clk), 
        .rst(rst), 
        .instruction(instruction_top), 
        .write_data(data_wb_top), 
        .RegWrite(RegWrite), 
        .read_data1(read_data1_top), 
        .read_data2(read_data2_top)
    ); 
    
    //Immediate generation
    ImmGen IG(
        .instruction(instruction_top), 
        .imm_out(imm_ext_top)
    );
    
    //Control unit
    Control_Unit control (
        .instruction(instruction_top), 
        .Branch(Branch), 
        .MemRead(MemRead), 
        .MemtoReg(MemtoReg), 
        .MemWrite(MemWrite), 
        .ALUSrc(ALUSrc), 
        .RegWrite(RegWrite), 
        .ALUOp(ALUOp)
    );
    
    //ALU Control unit
    ALU_Control_Unit ACU (
        .instruction(instruction_top), 
        .ALUOp(ALUOp), 
        .ALU_Control(ALU_control_top)
    );
    
    //mux 1 before to ALU 
    MUX mux1(
        .select(ALUSrc),
        .in1(read_data2_top),
        .in2(imm_ext_top),
        .mux_out(mux1_top)
    );
    
    //ALU
    ALU ALU_unit(
        .in1(read_data1_top),
        .in2(mux1_top),
        .ALU_Control(ALU_control_top),
        .zero(zero),
        .ALU_result(alu_result_top)
    );
    
    //ADDER
    ADDER ADDER(
        .in1(PC_top),
        .in2(imm_ext_top),
        .add_out(add_out_top)
    );
    
    //AND
    AND_log AND_gate(
        .in1(Branch),
        .in2(zero),
        .and_out(select_mux2)
    );

    //mux_2 before adder
    MUX mux2(
        .select(select_mux2),
        .in1(add4_out_top),
        .in2(add_out_top),
        .mux_out(PCin_top)
    );    
    
    //Data memory
    MEM data_mem(
        .clk(clk),
        .rst(rst),
        .MemRead(MemRead),
        .MemWrite(MemWrite),
        .address(alu_result_top),
        .write_data(read_data2_top),
        .read_data(read_data_top)
    );

    //mux_3 WB
    MUX mux3(
        .select(MemtoReg),
        .in1(alu_result_top),
        .in2(read_data_top),
        .mux_out(data_wb_top)
    );        
    
endmodule



    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    