`timescale 1ns / 1ps

module fdse(
    input logic clk,
    input logic rst,
    input logic[3:0] a_i,
    input logic[3:0] c_i,
    
    output logic[3:0] a_o,
    output logic[3:0] c_o,
    output logic[3:0] y_o
    );
    
    logic y;
    
    FDSE#()
    
endmodule
