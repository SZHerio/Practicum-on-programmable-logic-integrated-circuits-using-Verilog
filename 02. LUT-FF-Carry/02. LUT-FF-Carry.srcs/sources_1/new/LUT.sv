`timescale 1ns / 1ps

module lut(
    input logic[3:0] a,
    input logic[3:0] c,
    output logic[3:0] y
);  
    LUT2 #(
    .INIT(4'b0111)
    ) LUT2_inst_0(
        .O(y[0]),
        .I0(a[0]),
        .I1(c[0])
    );
    
    LUT2 #(
    .INIT(4'b0111)
    ) LUT2_inst_1(
        .O(y[1]),
        .I0(a[1]),
        .I1(c[1])
    );
    
    LUT2 #(
    .INIT(4'b0111)
    ) LUT2_inst_2(
        .O(y[2]),
        .I0(a[2]),
        .I1(c[2])
    );
    
    LUT2 #(
    .INIT(4'b0111)
    ) LUT2_inst_3(
        .O(y[3]),
        .I0(a[3]),
        .I1(c[3])
    );

endmodule
