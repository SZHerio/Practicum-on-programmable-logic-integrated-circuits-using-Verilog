`timescale 1ns / 1ps

module lut_tb();

    logic[3:0] y;
    logic[3:0] a;
    logic[3:0] c;
    
    LUT dut(
        .a(a),
        .c(c),
        .y(y)
    );
    
    initial begin
        #100
        
        {a,c} = 8'b0;
        
        for(int i = 1'd0; i < 256; i++) begin
            #10;
            {a, c} = i;   
        end 
    end
endmodule
