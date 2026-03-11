`timescale 1ns / 1ps


module fdse(
        input logic clk_i, 
        input logic [3:0] a_i,  
        input logic [3:0] c_i,  
        output logic [3:0] y_o   
    );
    
    logic [3:0] data;
    assign data = ~a_i | ~c_i;
    
    FDSE #(
      .INIT(1'b0) // Initial value of register (1'b0 or 1'b1)
   ) FDSE_inst_0 (
      .Q(y_o[0]),      // 1-bit Data output
      .C(clk_i),      // 1-bit Clock input
      .CE(1'b1),    // 1-bit Clock enable input
      .S(1'b0),      // 1-bit Synchronous set input
      .D(data[0])       // 1-bit Data input
   );
   
   FDSE #(
      .INIT(1'b0) // Initial value of register (1'b0 or 1'b1)
   ) FDSE_inst_1 (
      .Q(y_o[1]),      // 1-bit Data output
      .C(clk_i),      // 1-bit Clock input
      .CE(1'b1),    // 1-bit Clock enable input
      .S(1'b0),      // 1-bit Synchronous set input
      .D(data[1])       // 1-bit Data input
   );
   
   FDSE #(
      .INIT(1'b0) // Initial value of register (1'b0 or 1'b1)
   ) FDSE_inst_2 (
      .Q(y_o[2]),      // 1-bit Data output
      .C(clk_i),      // 1-bit Clock input
      .CE(1'b1),    // 1-bit Clock enable input
      .S(1'b0),      // 1-bit Synchronous set input
      .D(data[2])       // 1-bit Data input
   );
   
   FDSE #(
      .INIT(1'b0) // Initial value of register (1'b0 or 1'b1)
   ) FDSE_inst_3 (
      .Q(y_o[3]),      // 1-bit Data output
      .C(clk_i),      // 1-bit Clock input
      .CE(1'b1),    // 1-bit Clock enable input
      .S(1'b0),      // 1-bit Synchronous set input
      .D(data[3])       // 1-bit Data input
   );
   
    
endmodule
