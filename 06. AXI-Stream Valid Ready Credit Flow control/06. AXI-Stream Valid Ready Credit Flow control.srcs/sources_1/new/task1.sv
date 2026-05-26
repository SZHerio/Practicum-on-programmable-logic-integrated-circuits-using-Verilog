module task1 (
    input  logic               clk_i,
    input  logic               rstn_i,

    input  logic signed [15:0] a_data_i,
    input  logic               a_valid_i,
    output logic               a_ready_o,

    input  logic signed [15:0] b_data_i,
    input  logic               b_valid_i,
    output logic               b_ready_o,

    input  logic signed [15:0] c_data_i,
    input  logic               c_valid_i,
    output logic               c_ready_o,

    output logic signed [34:0] y_data_o,
    output logic               y_valid_o,
    input  logic               y_ready_i
);

    logic all_valid;

    logic stage0_ready;
    logic stage1_ready;
    logic stage2_ready;

    logic stage0_valid_ff;
    logic stage1_valid_ff;
    logic stage2_valid_ff;

    logic signed [16:0] sum_ff;
    logic signed [34:0] c0_ff;

    logic signed [33:0] mult_ff;
    logic signed [34:0] c1_ff;

    logic signed [34:0] mult_ext_ff;
    logic signed [34:0] y_ff;

    assign all_valid = a_valid_i & b_valid_i & c_valid_i;

    assign stage2_ready = ~stage2_valid_ff | y_ready_i;
    assign stage1_ready = ~stage1_valid_ff | stage2_ready;
    assign stage0_ready = ~stage0_valid_ff | stage1_ready;

    assign a_ready_o = stage0_ready & b_valid_i & c_valid_i;
    assign b_ready_o = stage0_ready & a_valid_i & c_valid_i;
    assign c_ready_o = stage0_ready & a_valid_i & b_valid_i;

    always_ff @(posedge clk_i or negedge rstn_i) begin
        if (~rstn_i)
            stage0_valid_ff <= 1'b0;
        else if (stage0_ready)
            stage0_valid_ff <= all_valid;
    end

    always_ff @(posedge clk_i) begin
        if (stage0_ready & all_valid) begin
            sum_ff <= {a_data_i[15], a_data_i} + {b_data_i[15], b_data_i};
            c0_ff  <= {{19{c_data_i[15]}}, c_data_i};
        end
    end

    always_ff @(posedge clk_i or negedge rstn_i) begin
        if (~rstn_i)
            stage1_valid_ff <= 1'b0;
        else if (stage1_ready)
            stage1_valid_ff <= stage0_valid_ff;
    end

    always_ff @(posedge clk_i) begin
        if (stage1_ready & stage0_valid_ff) begin
            mult_ff <= sum_ff * sum_ff;
            c1_ff   <= c0_ff;
        end
    end

    always_ff @(posedge clk_i or negedge rstn_i) begin
        if (~rstn_i)
            stage2_valid_ff <= 1'b0;
        else if (stage2_ready)
            stage2_valid_ff <= stage1_valid_ff;
    end

    always_ff @(posedge clk_i) begin
        if (stage2_ready & stage1_valid_ff) begin
            mult_ext_ff <= {mult_ff[33], mult_ff};
            y_ff        <= {mult_ff[33], mult_ff} - c1_ff;
        end
    end

    assign y_data_o  = y_ff;
    assign y_valid_o = stage2_valid_ff;

endmodule