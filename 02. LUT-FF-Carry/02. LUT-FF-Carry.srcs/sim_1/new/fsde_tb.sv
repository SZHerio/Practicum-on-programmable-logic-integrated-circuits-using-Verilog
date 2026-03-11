`timescale 1ns / 1ps

module fsde_tb();
        logic clk;
        logic [3:0] c;
        logic [3:0] a;
        logic [3:0] y;

    fdse dut(
        .clk_i(clk),
        .c_i(c),
        .a_i(a),
        .y_o(y)
    );

initial clk = 0;

always begin
        #5;
        clk = ~clk;
    end

initial begin  
    {a,c} = 8'b0;
    #100;
    
    for(int i = 0; i < 256; i++) begin
        {a,c} = i;
        #10;   
    end  
end

endmodule
