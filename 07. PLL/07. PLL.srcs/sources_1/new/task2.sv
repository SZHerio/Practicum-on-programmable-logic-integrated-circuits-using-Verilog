`timescale 1ns / 1ps

module task2(
    input logic clkA_i,
    input logic clkB_i,

    input logic rstnA_i,
    input logic rstnB_i,

    input logic [8:0] dataA_i,
    output logic [8:0] dataB_o,

    input logic reqB_i,
    output logic busyB_o,
    
    output logic dataB_valid_o
    );

    logic reqB_ff;
    logic reqB_change;

    always_ff @( posedge clkB_i or negedge rstnB_i) begin
        if(~rstnB_i) begin
            reqB_ff <= 1'b0;
        end
        else begin
            reqB_ff <= reqB_i;
        end
    end 

    assign reqB_change = reqB_i & ~reqB_ff;

    logic toggleB_ff;
    logic [2:0] syncA_ff;
    logic reqA_pulse;

    always_ff @(posedge clkB_i or negedge rstnB_i) begin
        if(~rstnB_i) begin
            toggleB_ff <= 0;
        end
        else if(reqB_change & ~busyB_o) begin
           toggleB_ff <= ~toggleB_ff; 
        end
    end
    
    
    always_ff @(posedge clkA_i or negedge rstnA_i) begin
        if(~rstnA_i) begin
            syncA_ff <= '0;
        end
        else begin
            syncA_ff <= {syncA_ff[1:0], toggleB_ff};
        end
    end

    assign reqA_pulse = ^syncA_ff[2:1];

    logic [7:0] dataA_hold_ff;
    logic toggleA_ff;

    always_ff @(posedge clkA_i or negedge rstnA_i) begin
        if(~rstnA_i) begin
            dataA_hold_ff <= '0;
            toggleA_ff <= 1'b0;
        end

        else if(reqA_pulse) begin
            dataA_hold_ff <= dataA_i;
            toggleA_ff <= ~toggleA_ff;
        end
    end 

    logic [2:0] syncB_ff;
    logic ackB_pulse;
    
    always_ff @(posedge clkB_i or negedge rstnB_i) begin
        if (~rstnB_i) begin
            syncB_ff <= '0;
        end
        else begin
            syncB_ff <= {syncB_ff[1:0], toggleA_ff};
        end
    end

    assign ackB_pulse = ^syncB_ff[2:1];
    assign busyB_o = toggleB_ff ^ syncB_ff[2];

    always_ff @(posedge clkB_i or negedge rstnB_i) begin
        if(~rstnB_i) begin
            dataB_o <= '0;
            dataB_valid_o <= 1'b0;
        end
        else begin
            dataB_valid_o <= ackB_pulse;

            if(ackB_pulse) begin
                dataB_o <= dataA_hold_ff;
            end
        end
    end
  
endmodule
