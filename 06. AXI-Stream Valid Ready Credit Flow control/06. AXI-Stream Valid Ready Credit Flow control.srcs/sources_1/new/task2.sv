module task2 (
    input logic clk_i,
    input logic rstn_i,
    input logic signed [15:0] s_data_i,
    input logic s_valid_i,
    output logic s_ready_o,
    output logic signed [15:0] m_data_o,
    output logic m_valid_o,
    input logic m_ready_i
);

logic [3:0] credit_cnt;
logic push_in;
logic pop_out;

assign s_ready_o = |credit_cnt;
assign push_in = s_valid_i & s_ready_o;
assign pop_out = m_valid_o & m_ready_i;

always_ff @(posedge clk_i or negedge rstn_i) begin
    if (~rstn_i) credit_cnt <= 4'd8;
    else begin
        if (push_in & ~pop_out) credit_cnt <= credit_cnt - 1;
        else if (~push_in & pop_out) credit_cnt <= credit_cnt + 1;
    end
end

logic signed [15:0] prev_val;
logic signed [16:0] stg1_data;
logic stg1_valid;

always_ff @(posedge clk_i or negedge rstn_i) begin
    if (~rstn_i) prev_val <= '0;
    else if (push_in) prev_val <= s_data_i;
end

always_ff @(posedge clk_i or negedge rstn_i) begin
    if (~rstn_i) begin
        stg1_valid <= 1'b0;
        stg1_data <= '0;
    end else begin
        stg1_valid <= push_in;
        stg1_data <= $signed(s_data_i) - prev_val;
    end
end

logic signed [4:0] stg2_data;
logic stg2_valid;

always_ff @(posedge clk_i or negedge rstn_i) begin
    if (~rstn_i) begin
        stg2_valid <= 1'b0;
        stg2_data <= '0;
    end else begin
        stg2_valid <= stg1_valid;
        stg2_data <= stg1_data % 16;
    end
end

logic signed [7:0] stg3_data;
logic stg3_valid;

always_ff @(posedge clk_i or negedge rstn_i) begin
    if (~rstn_i) begin
        stg3_valid <= 1'b0;
        stg3_data <= '0;
    end else begin
        stg3_valid <= stg2_valid;
        stg3_data <= stg2_data * 5;
    end
end

logic signed [8:0] stg4_data;
logic stg4_valid;

always_ff @(posedge clk_i or negedge rstn_i) begin
    if (~rstn_i) begin
        stg4_valid <= 1'b0;
        stg4_data <= '0;
    end else begin
        stg4_valid <= stg3_valid;
        stg4_data <= stg3_data - 16;
    end
end

logic signed [15:0] stg5_data;
logic stg5_valid;

always_ff @(posedge clk_i or negedge rstn_i) begin
    if (~rstn_i) begin
        stg5_valid <= 1'b0;
        stg5_data <= '0;
    end else begin
        stg5_valid <= stg4_valid;
        stg5_data <= stg4_data + 652;
    end
end

logic signed [15:0] fifo_mem [0:7];
logic [2:0] wr_ptr;
logic [2:0] rd_ptr;
logic [3:0] fifo_count;
logic fifo_push;

assign fifo_push = stg5_valid;

always_ff @(posedge clk_i or negedge rstn_i) begin
    if (~rstn_i) begin
        wr_ptr <= '0;
        rd_ptr <= '0;
        fifo_count <= '0;
    end else begin
        if (fifo_push) begin
            fifo_mem[wr_ptr] <= stg5_data;
            wr_ptr <= wr_ptr + 1;
        end
        if (pop_out) rd_ptr <= rd_ptr + 1;

        if (fifo_push & ~pop_out) fifo_count <= fifo_count + 1;
        else if (~fifo_push & pop_out) fifo_count <= fifo_count - 1;
    end
end

assign m_valid_o = |fifo_count;
assign m_data_o = fifo_mem[rd_ptr];

endmodule