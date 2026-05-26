`timescale 1ns / 1ps

module wrapper_crc12(
    input logic p_clk_i,
    input logic p_rstn_i,
    input logic [31:0] p_dat_i,
    output logic [31:0] p_dat_o,
    input logic p_sel_i,
    input logic p_enable_i,
    input logic p_we_i,
    input logic [31:0] p_adr_i,
    output logic p_ready,
    output logic p_slverr
);

    localparam ADDR_DATA = 4'd0;
    localparam ADDR_CRC = 4'd4;
    localparam ADDR_STATE = 4'd8;
    localparam ADDR_CTRL = 4'd12;

    logic [7:0] din_i;
    logic data_valid_i;
    logic crc_rd;
    logic [11:0] crc_o;
    logic [1:0] state_o;

    logic [31:0] ctrl_ff;
    logic [31:0] p_dat_o_ff;
    logic p_ready_ff;

    logic apb_active;
    logic cs;

    assign p_slverr = 1'b0;
    assign p_dat_o = p_dat_o_ff;
    assign p_ready = p_ready_ff;

    assign apb_active = p_sel_i & p_enable_i;

    always_ff @(posedge p_clk_i) begin
        if(~p_rstn_i) begin
            p_ready_ff <= 1'b0;
        end
        else begin
            p_ready_ff <= apb_active;
        end
    end

    assign cs = apb_active & ~p_ready_ff;

    always_ff @(posedge p_clk_i) begin
        if(~p_rstn_i) begin
            ctrl_ff <= 32'd0;
        end
        else if(cs & p_we_i & (p_adr_i[3:0] == ADDR_CTRL)) begin
            ctrl_ff <= p_dat_i;
        end
    end

    always_ff @(posedge p_clk_i) begin
        if(~p_rstn_i) begin
            p_dat_o_ff <= 32'd0;
        end
        else if(cs & ~p_we_i) begin
            case(p_adr_i[3:0])
                ADDR_CRC: begin
                    p_dat_o_ff <= {20'd0, crc_o};
                end

                ADDR_STATE: begin
                    p_dat_o_ff <= {30'd0, state_o};
                end

                ADDR_CTRL: begin
                    p_dat_o_ff <= ctrl_ff;
                end

                default: begin
                    p_dat_o_ff <= 32'd0;
                end
            endcase
        end
    end

    assign data_valid_i = cs & p_we_i & (p_adr_i[3:0] == ADDR_DATA);
    assign din_i = data_valid_i ? p_dat_i[7:0] : 8'd0;
    assign crc_rd = cs & ~p_we_i & (p_adr_i[3:0] == ADDR_CRC);

    crc12 i_crc12(
        .clk_i(p_clk_i),
        .rstn_i(p_rstn_i),
        .din_i(din_i),
        .data_valid_i(data_valid_i),
        .crc_rd(crc_rd),
        .crc_o(crc_o),
        .state_o(state_o)
    );

endmodule