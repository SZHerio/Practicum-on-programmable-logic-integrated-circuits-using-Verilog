`timescale 1ns / 1ps

module FDRE_tb();
    
    logic clk;
    logic rst;
    logic[3:0] a_i;
    logic[3:0] c_i;
    
    logic[3:0] a_o;
    logic[3:0] c_o;
    logic[3:0] y_o;
    
    fdre dut(
        .clk(clk),
        .rst(rst),
        .a_i(a_i),
        .c_i(c_i),
        .a_o(a_o),
        .c_o(c_o),
        .y_o(y_o)
    );
    
    always begin
    #10
    clk = ~clk;
    end
  
    initial begin
        for(int i = 0; i < 256; i++) 
            {a_i, c_i} = i;
        end
    end
  
endmodule
