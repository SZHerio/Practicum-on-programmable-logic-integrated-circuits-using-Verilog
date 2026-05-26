`timescale 1ns / 1ps

module tb_task2();

    logic clkA;
    logic clkB;
    logic rstnA;
    logic rstnB;
    
    logic [7:0] dataA;
    logic [7:0] dataB;
    
    logic reqB;
    logic busyB;
    logic dataB_valid;

    task2 dut (
        .clkA_i (clkA),
        .clkB_i (clkB),
        .rstnA_i (rstnA),
        .rstnB_i (rstnB),
        .dataA_i (dataA),
        .dataB_o (dataB),
        .reqB_i (reqB),
        .busyB_o (busyB),
        .dataB_valid_o(dataB_valid)
    );

    always #17.86 clkA = ~clkA;
    always #12.82 clkB = ~clkB;

    initial begin
        clkA = 0;
        clkB = 0;
        rstnA = 0;
        rstnB = 0;
        dataA = 0;
        reqB = 0;
        
        @(posedge clkB);
        rstnA <= 0; 
        rstnB <= 0;
        
        repeat(10) @(posedge clkB);
        rstnA <= 1; 
        rstnB <= 1;
        
        repeat(5) @(posedge clkB);

        @(posedge clkA);
        dataA <= 8'hA5;   

        @(posedge clkB);
        reqB  <= 1'b1;    
        @(posedge clkB);
        reqB  <= 1'b0;    

        repeat(2) @(posedge clkB);
        reqB  <= 1'b1;    
        @(posedge clkB);
        reqB  <= 1'b0;

        wait(dataB_valid == 1'b1);
        @(posedge clkB); 

        wait(busyB == 1'b0);
        #50;

        @(posedge clkA);
        dataA <= 8'h3C;

        @(posedge clkB);
        reqB  <= 1'b1;
        @(posedge clkB);
        reqB  <= 1'b0;

        wait(dataB_valid == 1'b1);
        @(posedge clkB);

        wait(busyB == 1'b0);
        #50;

        $finish;
    end

endmodule