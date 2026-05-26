`timescale 1ns / 1ps

module task1_tb;
    logic clk_i;
    logic rstn_i;

    logic [15:0] a_data_i;
    logic        a_valid_i;
    logic        a_ready_o;

    logic [15:0] b_data_i;
    logic        b_valid_i;
    logic        b_ready_o;

    logic [15:0] c_data_i;
    logic        c_valid_i;
    logic        c_ready_o;

    logic [34:0] y_data_o;
    logic        y_valid_o; 
    logic        y_ready_i; 

    task1 dut (
        .clk_i     (clk_i),
        .rstn_i    (rstn_i),
       
        .a_data_i  (a_data_i),
        .a_valid_i (a_valid_i),
        .a_ready_o (a_ready_o),
        
        .b_data_i  (b_data_i),
        .b_valid_i (b_valid_i),
        .b_ready_o (b_ready_o),
        
        .c_data_i  (c_data_i),
        .c_valid_i (c_valid_i),
        .c_ready_o (c_ready_o),
        
        .y_data_o  (y_data_o),
        .y_valid_o (y_valid_o),
        .y_ready_i (y_ready_i)
    );
    
    always #5 clk_i = ~clk_i;

    initial begin
        clk_i = 0;
        rstn_i = 0; 
       
        a_valid_i = 0; 
        a_data_i = 0;
        
        b_valid_i = 0; 
        b_data_i = 0;
        
        c_valid_i = 0; 
        c_data_i = 0;
        
        y_ready_i = 0;
        
        #25;
        rstn_i = 1; 
        
        #5
        a_data_i = 16'd2;
        a_valid_i = 1;
        
        #10;
        b_data_i = 16'd3; 
        b_valid_i = 1;
        
        c_data_i = 16'd4; 
        c_valid_i = 1;
        
        #20
        y_ready_i = 1;    
        
        #20; 
        a_valid_i = 0;
        b_valid_i = 0;
        c_valid_i = 0;
        
        #20;
        a_data_i = -16'd2;  
        a_valid_i = 1;
        
        b_data_i = 16'd5;   
        b_valid_i = 1;
        
        c_data_i = -16'd10; 
        c_valid_i = 1;
        
        #20; 
        a_valid_i = 0; 
        b_valid_i = 0; 
        c_valid_i = 0;

        #30; 
        $finish;
    end

endmodule