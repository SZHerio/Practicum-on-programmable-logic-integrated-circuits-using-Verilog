// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2018.3 (win64) Build 2405991 Thu Dec  6 23:38:27 MST 2018
// Date        : Fri May 22 01:11:41 2026
// Host        : DESKTOP-B526498 running 64-bit major release  (build 9200)
// Command     : write_verilog -mode timesim -nolib -sdf_anno true -force -file
//               {C:/Users/SZHerio/Desktop/Practicum-on-programmable-logic-integrated-circuits-using-Verilog/07. PLL/07.
//               PLL.sim/sim_1/impl/timing/xsim/tb_task2_time_impl.v}
// Design      : task2_clk_wiz
// Purpose     : This verilog netlist is a timing simulation representation of the design and should not be modified or
//               synthesized. Please ensure that this netlist is used with the corresponding SDF file.
// Device      : xc7a100ticsg324-1L
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps
`define XIL_TIMING

module clk_wiz_0
   (clk_out1,
    clk_out2,
    reset,
    locked,
    clk_in1);
  output clk_out1;
  output clk_out2;
  input reset;
  output locked;
  input clk_in1;

  wire clk_in1;
  wire clk_out1;
  wire clk_out2;
  wire locked;
  wire reset;

  clk_wiz_0_clk_wiz_0_clk_wiz inst
       (.clk_in1(clk_in1),
        .clk_out1(clk_out1),
        .clk_out2(clk_out2),
        .locked(locked),
        .reset(reset));
endmodule

(* ORIG_REF_NAME = "clk_wiz_0_clk_wiz" *) 
module clk_wiz_0_clk_wiz_0_clk_wiz
   (clk_out1,
    clk_out2,
    reset,
    locked,
    clk_in1);
  output clk_out1;
  output clk_out2;
  input reset;
  output locked;
  input clk_in1;

  wire clk_in1;
  wire clk_in1_clk_wiz_0;
  wire clk_out1;
  wire clk_out1_clk_wiz_0;
  wire clk_out2;
  wire clk_out2_clk_wiz_0;
  wire clkfbout_buf_clk_wiz_0;
  wire clkfbout_clk_wiz_0;
  wire locked;
  wire reset;
  wire NLW_plle2_adv_inst_CLKOUT2_UNCONNECTED;
  wire NLW_plle2_adv_inst_CLKOUT3_UNCONNECTED;
  wire NLW_plle2_adv_inst_CLKOUT4_UNCONNECTED;
  wire NLW_plle2_adv_inst_CLKOUT5_UNCONNECTED;
  wire NLW_plle2_adv_inst_DRDY_UNCONNECTED;
  wire [15:0]NLW_plle2_adv_inst_DO_UNCONNECTED;

  (* BOX_TYPE = "PRIMITIVE" *) 
  BUFG clkf_buf
       (.I(clkfbout_clk_wiz_0),
        .O(clkfbout_buf_clk_wiz_0));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* CAPACITANCE = "DONT_CARE" *) 
  (* IBUF_DELAY_VALUE = "0" *) 
  (* IFD_DELAY_VALUE = "AUTO" *) 
  IBUF #(
    .IOSTANDARD("DEFAULT")) 
    clkin1_ibufg
       (.I(clk_in1),
        .O(clk_in1_clk_wiz_0));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* OPT_MODIFIED = "BUFG_OPT " *) 
  BUFG clkout1_buf
       (.I(clk_out1_clk_wiz_0),
        .O(clk_out1));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* OPT_MODIFIED = "BUFG_OPT " *) 
  BUFG clkout2_buf
       (.I(clk_out2_clk_wiz_0),
        .O(clk_out2));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* OPT_MODIFIED = "BUFG_OPT " *) 
  PLLE2_ADV #(
    .BANDWIDTH("OPTIMIZED"),
    .CLKFBOUT_MULT(14),
    .CLKFBOUT_PHASE(0.000000),
    .CLKIN1_PERIOD(10.000000),
    .CLKIN2_PERIOD(0.000000),
    .CLKOUT0_DIVIDE(50),
    .CLKOUT0_DUTY_CYCLE(0.500000),
    .CLKOUT0_PHASE(0.000000),
    .CLKOUT1_DIVIDE(36),
    .CLKOUT1_DUTY_CYCLE(0.500000),
    .CLKOUT1_PHASE(0.000000),
    .CLKOUT2_DIVIDE(1),
    .CLKOUT2_DUTY_CYCLE(0.500000),
    .CLKOUT2_PHASE(0.000000),
    .CLKOUT3_DIVIDE(1),
    .CLKOUT3_DUTY_CYCLE(0.500000),
    .CLKOUT3_PHASE(0.000000),
    .CLKOUT4_DIVIDE(1),
    .CLKOUT4_DUTY_CYCLE(0.500000),
    .CLKOUT4_PHASE(0.000000),
    .CLKOUT5_DIVIDE(1),
    .CLKOUT5_DUTY_CYCLE(0.500000),
    .CLKOUT5_PHASE(0.000000),
    .COMPENSATION("ZHOLD"),
    .DIVCLK_DIVIDE(1),
    .IS_CLKINSEL_INVERTED(1'b0),
    .IS_PWRDWN_INVERTED(1'b0),
    .IS_RST_INVERTED(1'b0),
    .REF_JITTER1(0.010000),
    .REF_JITTER2(0.010000),
    .STARTUP_WAIT("FALSE")) 
    plle2_adv_inst
       (.CLKFBIN(clkfbout_buf_clk_wiz_0),
        .CLKFBOUT(clkfbout_clk_wiz_0),
        .CLKIN1(clk_in1_clk_wiz_0),
        .CLKIN2(1'b0),
        .CLKINSEL(1'b1),
        .CLKOUT0(clk_out1_clk_wiz_0),
        .CLKOUT1(clk_out2_clk_wiz_0),
        .CLKOUT2(NLW_plle2_adv_inst_CLKOUT2_UNCONNECTED),
        .CLKOUT3(NLW_plle2_adv_inst_CLKOUT3_UNCONNECTED),
        .CLKOUT4(NLW_plle2_adv_inst_CLKOUT4_UNCONNECTED),
        .CLKOUT5(NLW_plle2_adv_inst_CLKOUT5_UNCONNECTED),
        .DADDR({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .DCLK(1'b0),
        .DEN(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .DO(NLW_plle2_adv_inst_DO_UNCONNECTED[15:0]),
        .DRDY(NLW_plle2_adv_inst_DRDY_UNCONNECTED),
        .DWE(1'b0),
        .LOCKED(locked),
        .PWRDWN(1'b0),
        .RST(reset));
endmodule

module task2
   (Q,
    dataB_valid_o,
    busyB_o_OBUF,
    reset,
    locked,
    reqB_i_IBUF,
    clkB_i,
    CLK,
    D);
  output [7:0]Q;
  output dataB_valid_o;
  output busyB_o_OBUF;
  input reset;
  input locked;
  input reqB_i_IBUF;
  input clkB_i;
  input CLK;
  input [7:0]D;

  wire CLK;
  wire [7:0]D;
  wire [7:0]Q;
  wire ackB_pulse;
  wire busyB_o_OBUF;
  wire clkB_i;
  wire [7:0]dataA_hold_ff;
  wire dataB_valid_o;
  wire locked;
  wire p_0_in;
  wire reqA_pulse;
  wire reqB_ff;
  wire reqB_ff_i_1_n_0;
  wire reqB_i_IBUF;
  wire reset;
  wire [2:0]syncA_ff;
  wire \syncB_ff_reg_n_0_[0] ;
  wire \syncB_ff_reg_n_0_[1] ;
  wire toggleA_ff;
  wire toggleA_ff_i_1_n_0;
  wire toggleB_ff;
  wire toggleB_ff_i_1_n_0;

  LUT2 #(
    .INIT(4'h6)) 
    busyB_o_OBUF_inst_i_1
       (.I0(p_0_in),
        .I1(toggleB_ff),
        .O(busyB_o_OBUF));
  LUT2 #(
    .INIT(4'h6)) 
    \dataA_hold_ff[7]_i_1 
       (.I0(syncA_ff[2]),
        .I1(syncA_ff[1]),
        .O(reqA_pulse));
  FDCE #(
    .INIT(1'b0)) 
    \dataA_hold_ff_reg[0] 
       (.C(CLK),
        .CE(reqA_pulse),
        .CLR(reqB_ff_i_1_n_0),
        .D(D[0]),
        .Q(dataA_hold_ff[0]));
  FDCE #(
    .INIT(1'b0)) 
    \dataA_hold_ff_reg[1] 
       (.C(CLK),
        .CE(reqA_pulse),
        .CLR(reqB_ff_i_1_n_0),
        .D(D[1]),
        .Q(dataA_hold_ff[1]));
  FDCE #(
    .INIT(1'b0)) 
    \dataA_hold_ff_reg[2] 
       (.C(CLK),
        .CE(reqA_pulse),
        .CLR(reqB_ff_i_1_n_0),
        .D(D[2]),
        .Q(dataA_hold_ff[2]));
  FDCE #(
    .INIT(1'b0)) 
    \dataA_hold_ff_reg[3] 
       (.C(CLK),
        .CE(reqA_pulse),
        .CLR(reqB_ff_i_1_n_0),
        .D(D[3]),
        .Q(dataA_hold_ff[3]));
  FDCE #(
    .INIT(1'b0)) 
    \dataA_hold_ff_reg[4] 
       (.C(CLK),
        .CE(reqA_pulse),
        .CLR(reqB_ff_i_1_n_0),
        .D(D[4]),
        .Q(dataA_hold_ff[4]));
  FDCE #(
    .INIT(1'b0)) 
    \dataA_hold_ff_reg[5] 
       (.C(CLK),
        .CE(reqA_pulse),
        .CLR(reqB_ff_i_1_n_0),
        .D(D[5]),
        .Q(dataA_hold_ff[5]));
  FDCE #(
    .INIT(1'b0)) 
    \dataA_hold_ff_reg[6] 
       (.C(CLK),
        .CE(reqA_pulse),
        .CLR(reqB_ff_i_1_n_0),
        .D(D[6]),
        .Q(dataA_hold_ff[6]));
  FDCE #(
    .INIT(1'b0)) 
    \dataA_hold_ff_reg[7] 
       (.C(CLK),
        .CE(reqA_pulse),
        .CLR(reqB_ff_i_1_n_0),
        .D(D[7]),
        .Q(dataA_hold_ff[7]));
  LUT2 #(
    .INIT(4'h6)) 
    \dataB_o[7]_i_1 
       (.I0(p_0_in),
        .I1(\syncB_ff_reg_n_0_[1] ),
        .O(ackB_pulse));
  FDCE #(
    .INIT(1'b0)) 
    \dataB_o_reg[0] 
       (.C(clkB_i),
        .CE(ackB_pulse),
        .CLR(reqB_ff_i_1_n_0),
        .D(dataA_hold_ff[0]),
        .Q(Q[0]));
  FDCE #(
    .INIT(1'b0)) 
    \dataB_o_reg[1] 
       (.C(clkB_i),
        .CE(ackB_pulse),
        .CLR(reqB_ff_i_1_n_0),
        .D(dataA_hold_ff[1]),
        .Q(Q[1]));
  FDCE #(
    .INIT(1'b0)) 
    \dataB_o_reg[2] 
       (.C(clkB_i),
        .CE(ackB_pulse),
        .CLR(reqB_ff_i_1_n_0),
        .D(dataA_hold_ff[2]),
        .Q(Q[2]));
  FDCE #(
    .INIT(1'b0)) 
    \dataB_o_reg[3] 
       (.C(clkB_i),
        .CE(ackB_pulse),
        .CLR(reqB_ff_i_1_n_0),
        .D(dataA_hold_ff[3]),
        .Q(Q[3]));
  FDCE #(
    .INIT(1'b0)) 
    \dataB_o_reg[4] 
       (.C(clkB_i),
        .CE(ackB_pulse),
        .CLR(reqB_ff_i_1_n_0),
        .D(dataA_hold_ff[4]),
        .Q(Q[4]));
  FDCE #(
    .INIT(1'b0)) 
    \dataB_o_reg[5] 
       (.C(clkB_i),
        .CE(ackB_pulse),
        .CLR(reqB_ff_i_1_n_0),
        .D(dataA_hold_ff[5]),
        .Q(Q[5]));
  FDCE #(
    .INIT(1'b0)) 
    \dataB_o_reg[6] 
       (.C(clkB_i),
        .CE(ackB_pulse),
        .CLR(reqB_ff_i_1_n_0),
        .D(dataA_hold_ff[6]),
        .Q(Q[6]));
  FDCE #(
    .INIT(1'b0)) 
    \dataB_o_reg[7] 
       (.C(clkB_i),
        .CE(ackB_pulse),
        .CLR(reqB_ff_i_1_n_0),
        .D(dataA_hold_ff[7]),
        .Q(Q[7]));
  FDCE #(
    .INIT(1'b0)) 
    dataB_valid_o_reg
       (.C(clkB_i),
        .CE(1'b1),
        .CLR(reqB_ff_i_1_n_0),
        .D(ackB_pulse),
        .Q(dataB_valid_o));
  LUT2 #(
    .INIT(4'hB)) 
    reqB_ff_i_1
       (.I0(reset),
        .I1(locked),
        .O(reqB_ff_i_1_n_0));
  FDCE #(
    .INIT(1'b0)) 
    reqB_ff_reg
       (.C(clkB_i),
        .CE(1'b1),
        .CLR(reqB_ff_i_1_n_0),
        .D(reqB_i_IBUF),
        .Q(reqB_ff));
  FDCE #(
    .INIT(1'b0)) 
    \syncA_ff_reg[0] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(reqB_ff_i_1_n_0),
        .D(toggleB_ff),
        .Q(syncA_ff[0]));
  FDCE #(
    .INIT(1'b0)) 
    \syncA_ff_reg[1] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(reqB_ff_i_1_n_0),
        .D(syncA_ff[0]),
        .Q(syncA_ff[1]));
  FDCE #(
    .INIT(1'b0)) 
    \syncA_ff_reg[2] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(reqB_ff_i_1_n_0),
        .D(syncA_ff[1]),
        .Q(syncA_ff[2]));
  FDCE #(
    .INIT(1'b0)) 
    \syncB_ff_reg[0] 
       (.C(clkB_i),
        .CE(1'b1),
        .CLR(reqB_ff_i_1_n_0),
        .D(toggleA_ff),
        .Q(\syncB_ff_reg_n_0_[0] ));
  FDCE #(
    .INIT(1'b0)) 
    \syncB_ff_reg[1] 
       (.C(clkB_i),
        .CE(1'b1),
        .CLR(reqB_ff_i_1_n_0),
        .D(\syncB_ff_reg_n_0_[0] ),
        .Q(\syncB_ff_reg_n_0_[1] ));
  FDCE #(
    .INIT(1'b0)) 
    \syncB_ff_reg[2] 
       (.C(clkB_i),
        .CE(1'b1),
        .CLR(reqB_ff_i_1_n_0),
        .D(\syncB_ff_reg_n_0_[1] ),
        .Q(p_0_in));
  LUT3 #(
    .INIT(8'h96)) 
    toggleA_ff_i_1
       (.I0(syncA_ff[1]),
        .I1(syncA_ff[2]),
        .I2(toggleA_ff),
        .O(toggleA_ff_i_1_n_0));
  FDCE #(
    .INIT(1'b0)) 
    toggleA_ff_reg
       (.C(CLK),
        .CE(1'b1),
        .CLR(reqB_ff_i_1_n_0),
        .D(toggleA_ff_i_1_n_0),
        .Q(toggleA_ff));
  LUT4 #(
    .INIT(16'hDF10)) 
    toggleB_ff_i_1
       (.I0(p_0_in),
        .I1(reqB_ff),
        .I2(reqB_i_IBUF),
        .I3(toggleB_ff),
        .O(toggleB_ff_i_1_n_0));
  FDCE #(
    .INIT(1'b0)) 
    toggleB_ff_reg
       (.C(clkB_i),
        .CE(1'b1),
        .CLR(reqB_ff_i_1_n_0),
        .D(toggleB_ff_i_1_n_0),
        .Q(toggleB_ff));
endmodule

(* ECO_CHECKSUM = "81a72cfa" *) 
(* NotValidForBitStream *)
module task2_clk_wiz
   (clk_i,
    rst_i,
    dataA_i,
    reqB_i,
    busyB_o,
    dataB_o,
    dataB_valid_o,
    locked_o);
  input clk_i;
  input rst_i;
  input [8:0]dataA_i;
  input reqB_i;
  output busyB_o;
  output [8:0]dataB_o;
  output dataB_valid_o;
  output locked_o;

  wire busyB_o;
  wire busyB_o_OBUF;
  wire clkA;
  wire clkB;
  (* IBUF_LOW_PWR *) wire clk_i;
  wire [8:0]dataA_i;
  wire [7:0]dataA_i_IBUF;
  wire [8:0]dataB_o;
  wire [7:0]dataB_o_OBUF;
  wire dataB_valid_o;
  wire dataB_valid_o_OBUF;
  wire locked_o;
  wire locked_o_OBUF;
  wire reqB_i;
  wire reqB_i_IBUF;
  wire rst_i;
  wire rst_i_IBUF;

initial begin
 $sdf_annotate("tb_task2_time_impl.sdf",,,,"tool_control");
end
  OBUF busyB_o_OBUF_inst
       (.I(busyB_o_OBUF),
        .O(busyB_o));
  clk_wiz_0 clk_wiz_0_inst
       (.clk_in1(clk_i),
        .clk_out1(clkA),
        .clk_out2(clkB),
        .locked(locked_o_OBUF),
        .reset(rst_i_IBUF));
  IBUF \dataA_i_IBUF[0]_inst 
       (.I(dataA_i[0]),
        .O(dataA_i_IBUF[0]));
  IBUF \dataA_i_IBUF[1]_inst 
       (.I(dataA_i[1]),
        .O(dataA_i_IBUF[1]));
  IBUF \dataA_i_IBUF[2]_inst 
       (.I(dataA_i[2]),
        .O(dataA_i_IBUF[2]));
  IBUF \dataA_i_IBUF[3]_inst 
       (.I(dataA_i[3]),
        .O(dataA_i_IBUF[3]));
  IBUF \dataA_i_IBUF[4]_inst 
       (.I(dataA_i[4]),
        .O(dataA_i_IBUF[4]));
  IBUF \dataA_i_IBUF[5]_inst 
       (.I(dataA_i[5]),
        .O(dataA_i_IBUF[5]));
  IBUF \dataA_i_IBUF[6]_inst 
       (.I(dataA_i[6]),
        .O(dataA_i_IBUF[6]));
  IBUF \dataA_i_IBUF[7]_inst 
       (.I(dataA_i[7]),
        .O(dataA_i_IBUF[7]));
  OBUF \dataB_o_OBUF[0]_inst 
       (.I(dataB_o_OBUF[0]),
        .O(dataB_o[0]));
  OBUF \dataB_o_OBUF[1]_inst 
       (.I(dataB_o_OBUF[1]),
        .O(dataB_o[1]));
  OBUF \dataB_o_OBUF[2]_inst 
       (.I(dataB_o_OBUF[2]),
        .O(dataB_o[2]));
  OBUF \dataB_o_OBUF[3]_inst 
       (.I(dataB_o_OBUF[3]),
        .O(dataB_o[3]));
  OBUF \dataB_o_OBUF[4]_inst 
       (.I(dataB_o_OBUF[4]),
        .O(dataB_o[4]));
  OBUF \dataB_o_OBUF[5]_inst 
       (.I(dataB_o_OBUF[5]),
        .O(dataB_o[5]));
  OBUF \dataB_o_OBUF[6]_inst 
       (.I(dataB_o_OBUF[6]),
        .O(dataB_o[6]));
  OBUF \dataB_o_OBUF[7]_inst 
       (.I(dataB_o_OBUF[7]),
        .O(dataB_o[7]));
  OBUF \dataB_o_OBUF[8]_inst 
       (.I(1'b0),
        .O(dataB_o[8]));
  OBUF dataB_valid_o_OBUF_inst
       (.I(dataB_valid_o_OBUF),
        .O(dataB_valid_o));
  OBUF locked_o_OBUF_inst
       (.I(locked_o_OBUF),
        .O(locked_o));
  IBUF reqB_i_IBUF_inst
       (.I(reqB_i),
        .O(reqB_i_IBUF));
  IBUF rst_i_IBUF_inst
       (.I(rst_i),
        .O(rst_i_IBUF));
  task2 task2_inst
       (.CLK(clkA),
        .D(dataA_i_IBUF),
        .Q(dataB_o_OBUF),
        .busyB_o_OBUF(busyB_o_OBUF),
        .clkB_i(clkB),
        .dataB_valid_o(dataB_valid_o_OBUF),
        .locked(locked_o_OBUF),
        .reqB_i_IBUF(reqB_i_IBUF),
        .reset(rst_i_IBUF));
endmodule
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

endmodule
`endif
