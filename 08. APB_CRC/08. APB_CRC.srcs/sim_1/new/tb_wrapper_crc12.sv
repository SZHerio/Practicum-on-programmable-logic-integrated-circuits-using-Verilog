`timescale 1ns / 1ps

module tb_wrapper_crc12;

    logic p_clk_i;
    logic p_rstn_i;
    logic [31:0] p_dat_i;
    logic [31:0] p_dat_o;
    logic p_sel_i;
    logic p_enable_i;
    logic p_we_i;
    logic [31:0] p_adr_i;
    logic p_ready;
    logic p_slverr;

    wrapper_crc12 dut_wrapper_crc12(
        .p_clk_i(p_clk_i),
        .p_rstn_i(p_rstn_i),
        .p_dat_i(p_dat_i),
        .p_dat_o(p_dat_o),
        .p_sel_i(p_sel_i),
        .p_enable_i(p_enable_i),
        .p_we_i(p_we_i),
        .p_adr_i(p_adr_i),
        .p_ready(p_ready),
        .p_slverr(p_slverr)
    );

    always #50 p_clk_i = ~p_clk_i;

    initial begin
        p_clk_i = 1'b1;
        p_dat_i = 'hz;
        p_enable_i = 1'b0;
        p_sel_i = 1'b0;
        p_we_i = 'hz;
        p_adr_i = 'hz;
        p_rstn_i = 1'b0;

        #200;
        p_rstn_i = 1'b1;
    end

    task write_register;
        input [31:0] reg_addr;
        input [31:0] reg_data;

        begin
            @(posedge p_clk_i);

            p_adr_i = reg_addr;
            p_dat_i = reg_data;
            p_enable_i = 1'b0;
            p_sel_i = 1'b1;
            p_we_i = 1'b1;

            @(posedge p_clk_i);

            p_enable_i = 1'b1;

            wait(p_ready);

            $display("(%0t) Writing register [%0d] = 0x%0x, ready = %0b, slverr = %0b",
                     $time, p_adr_i, reg_data, p_ready, p_slverr);

            @(posedge p_clk_i);

            p_adr_i = 'hz;
            p_dat_i = 'hz;
            p_enable_i = 1'b0;
            p_sel_i = 1'b0;
            p_we_i = 'hz;
        end
    endtask

    task read_register;
        input [31:0] reg_addr;

        begin
            @(posedge p_clk_i);

            p_adr_i = reg_addr;
            p_dat_i = 'hz;
            p_enable_i = 1'b0;
            p_sel_i = 1'b1;
            p_we_i = 1'b0;

            @(posedge p_clk_i);

            p_enable_i = 1'b1;

            wait(p_ready);

            $display("(%0t) Reading register [%0d] = 0x%0x, ready = %0b, slverr = %0b",
                     $time, p_adr_i, p_dat_o, p_ready, p_slverr);

            @(posedge p_clk_i);

            p_adr_i = 'hz;
            p_dat_i = 'hz;
            p_enable_i = 1'b0;
            p_sel_i = 1'b0;
            p_we_i = 'hz;
        end
    endtask

    initial begin
        #300;

        write_register(32'd12, 32'd4);
        #300;

        read_register(32'd12);
        #300;

        read_register(32'd8);
        #300;

        write_register(32'd0, 32'h0000000BC);
        #1200;

        read_register(32'd8);
        #300;

        write_register(32'd0, 32'h00000033);
        #1200;

        read_register(32'd8);
        #300;

        read_register(32'd4);
        #500;

        read_register(32'd4);
        #500;

        $finish;
    end

endmodule