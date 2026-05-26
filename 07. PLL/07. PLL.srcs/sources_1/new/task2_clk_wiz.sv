`timescale 1ns / 1ps

module task2_clk_wiz(
    input  logic clk_i,
    input  logic rst_i,

    input  logic [8:0] dataA_i,
    input  logic reqB_i,

    output logic busyB_o,
    output logic [8:0] dataB_o,
    output logic dataB_valid_o,

    output logic locked_o
    );
    
    logic clkA;
    logic clkB;
    logic locked;
    
    assign locked_o = locked;
    
    clk_wiz_0 clk_wiz_0_inst
    (
        .clk_in1 (clk_i),
        .reset (rst_i),
        .clk_out1 (clkA),
        .clk_out2 (clkB),
        .locked (locked)
    );
    
    task2 task2_inst
    (
        .clkA_i       (clkA),
        .clkB_i       (clkB),
        .rstnA_i      (locked & ~rst_i),
        .rstnB_i      (locked & ~rst_i),
        .dataA_i      (dataA_i),
        .dataB_o      (dataB_o),
        .reqB_i       (reqB_i),
        .busyB_o      (busyB_o),
        .dataB_valid_o (dataB_valid_o)
    );
     
endmodule
