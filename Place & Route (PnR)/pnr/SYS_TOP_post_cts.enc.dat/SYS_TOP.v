module SYS_TOP (
	scan_clk, 
	scan_rst, 
	test_mode, 
	SE, 
	SI, 
	SO, 
	RST_N, 
	UART_CLK, 
	REF_CLK, 
	UART_RX_IN, 
	UART_TX_O, 
	parity_error, 
	framing_error);
   input scan_clk;
   input scan_rst;
   input test_mode;
   input SE;
   input [3:0] SI;
   output [3:0] SO;
   input RST_N;
   input UART_CLK;
   input REF_CLK;
   input UART_RX_IN;
   output UART_TX_O;
   output parity_error;
   output framing_error;

   // Internal wires
   wire REF_CLK__L2_N0;
   wire REF_CLK__L1_N0;
   wire UART_CLK__L2_N0;
   wire UART_CLK__L1_N0;
   wire scan_clk__L13_N0;
   wire scan_clk__L12_N0;
   wire scan_clk__L11_N0;
   wire scan_clk__L10_N0;
   wire scan_clk__L9_N0;
   wire scan_clk__L8_N0;
   wire scan_clk__L7_N0;
   wire scan_clk__L6_N0;
   wire scan_clk__L5_N0;
   wire scan_clk__L4_N0;
   wire scan_clk__L3_N0;
   wire scan_clk__L2_N0;
   wire scan_clk__L1_N0;
   wire REF_CLK_M__L8_N13;
   wire REF_CLK_M__L8_N12;
   wire REF_CLK_M__L8_N11;
   wire REF_CLK_M__L8_N10;
   wire REF_CLK_M__L8_N9;
   wire REF_CLK_M__L8_N8;
   wire REF_CLK_M__L8_N7;
   wire REF_CLK_M__L8_N6;
   wire REF_CLK_M__L8_N5;
   wire REF_CLK_M__L8_N4;
   wire REF_CLK_M__L8_N3;
   wire REF_CLK_M__L8_N2;
   wire REF_CLK_M__L8_N1;
   wire REF_CLK_M__L8_N0;
   wire REF_CLK_M__L7_N7;
   wire REF_CLK_M__L7_N6;
   wire REF_CLK_M__L7_N5;
   wire REF_CLK_M__L7_N4;
   wire REF_CLK_M__L7_N3;
   wire REF_CLK_M__L7_N2;
   wire REF_CLK_M__L7_N1;
   wire REF_CLK_M__L7_N0;
   wire REF_CLK_M__L6_N3;
   wire REF_CLK_M__L6_N2;
   wire REF_CLK_M__L6_N1;
   wire REF_CLK_M__L6_N0;
   wire REF_CLK_M__L5_N1;
   wire REF_CLK_M__L5_N0;
   wire REF_CLK_M__L4_N0;
   wire REF_CLK_M__L3_N1;
   wire REF_CLK_M__L3_N0;
   wire REF_CLK_M__L2_N0;
   wire REF_CLK_M__L1_N0;
   wire ALU_CLK__L4_N1;
   wire ALU_CLK__L4_N0;
   wire ALU_CLK__L3_N0;
   wire ALU_CLK__L2_N0;
   wire ALU_CLK__L1_N0;
   wire UART_CLK_M__L13_N0;
   wire UART_CLK_M__L12_N0;
   wire UART_CLK_M__L11_N0;
   wire UART_CLK_M__L10_N0;
   wire UART_CLK_M__L9_N0;
   wire UART_CLK_M__L8_N0;
   wire UART_CLK_M__L7_N0;
   wire UART_CLK_M__L6_N1;
   wire UART_CLK_M__L6_N0;
   wire UART_CLK_M__L5_N0;
   wire UART_CLK_M__L4_N0;
   wire UART_CLK_M__L3_N0;
   wire UART_CLK_M__L2_N0;
   wire UART_CLK_M__L1_N0;
   wire TX_CLK__L1_N0;
   wire TX_CLK_M__L4_N1;
   wire TX_CLK_M__L4_N0;
   wire TX_CLK_M__L3_N0;
   wire TX_CLK_M__L2_N0;
   wire TX_CLK_M__L1_N0;
   wire RX_CLK_M__L3_N1;
   wire RX_CLK_M__L3_N0;
   wire RX_CLK_M__L2_N0;
   wire RX_CLK_M__L1_N0;
   wire FE_OFN4_ALU_FUNC_1_;
   wire FE_OFN3_RST_Domain_2_M;
   wire FE_OFN2_RST_Domain_1_M;
   wire FE_OFN1_RST_Domain_1_M;
   wire FE_OFN0_RST_Domain_1_M;
   wire REF_CLK_M;
   wire RST_M;
   wire RST_Domain_1;
   wire UART_CLK_M;
   wire RST_Domain_2;
   wire RST_Domain_2_M;
   wire RX_CLK;
   wire TX_CLK;
   wire CLK_en;
   wire ALU_CLK;
   wire RST_Domain_1_M;
   wire WR_en;
   wire RD_en;
   wire RD_Valid;
   wire ALU_Valid;
   wire RX_data_valid;
   wire RX_data_valid_synced;
   wire TX_CLK_M;
   wire busy;
   wire R_inc;
   wire W_full;
   wire W_inc;
   wire R_empty;
   wire RX_CLK_M;
   wire n10;
   wire n13;
   wire n14;
   wire n15;
   wire n34;
   wire n20;
   wire n21;
   wire n22;
   wire n26;
   wire n27;
   wire n28;
   wire n30;
   wire n31;
   wire n32;
   wire n33;
   wire [7:0] UART_CONFIG;
   wire [7:0] RX_DIV_Ratio;
   wire [7:0] TX_DIV_Ratio;
   wire [3:0] address;
   wire [7:0] WR_Data;
   wire [7:0] RD_Data;
   wire [7:0] OP_A;
   wire [7:0] OP_B;
   wire [3:0] ALU_FUNC;
   wire [15:0] ALU_OUT;
   wire [7:0] RX_P_DATA;
   wire [7:0] RX_P_DATA_synced;
   wire [7:0] WR_DATA_fifo;
   wire [7:0] TX_P_data;
   wire SYNOPSYS_UNCONNECTED__0;
   wire SYNOPSYS_UNCONNECTED__1;
   wire SYNOPSYS_UNCONNECTED__2;
   wire SYNOPSYS_UNCONNECTED__3;

   CLKINVX40M REF_CLK__L2_I0 (.Y(REF_CLK__L2_N0), 
	.A(REF_CLK__L1_N0));
   CLKINVX40M REF_CLK__L1_I0 (.Y(REF_CLK__L1_N0), 
	.A(REF_CLK));
   CLKINVX40M UART_CLK__L2_I0 (.Y(UART_CLK__L2_N0), 
	.A(UART_CLK__L1_N0));
   CLKINVX40M UART_CLK__L1_I0 (.Y(UART_CLK__L1_N0), 
	.A(UART_CLK));
   CLKINVX32M scan_clk__L13_I0 (.Y(scan_clk__L13_N0), 
	.A(scan_clk__L12_N0));
   CLKINVX40M scan_clk__L12_I0 (.Y(scan_clk__L12_N0), 
	.A(scan_clk__L11_N0));
   CLKBUFX40M scan_clk__L11_I0 (.Y(scan_clk__L11_N0), 
	.A(scan_clk__L10_N0));
   CLKBUFX24M scan_clk__L10_I0 (.Y(scan_clk__L10_N0), 
	.A(scan_clk__L9_N0));
   BUFX8M scan_clk__L9_I0 (.Y(scan_clk__L9_N0), 
	.A(scan_clk__L8_N0));
   CLKBUFX24M scan_clk__L8_I0 (.Y(scan_clk__L8_N0), 
	.A(scan_clk__L7_N0));
   CLKBUFX24M scan_clk__L7_I0 (.Y(scan_clk__L7_N0), 
	.A(scan_clk__L6_N0));
   CLKBUFX24M scan_clk__L6_I0 (.Y(scan_clk__L6_N0), 
	.A(scan_clk__L5_N0));
   CLKBUFX24M scan_clk__L5_I0 (.Y(scan_clk__L5_N0), 
	.A(scan_clk__L4_N0));
   CLKBUFX24M scan_clk__L4_I0 (.Y(scan_clk__L4_N0), 
	.A(scan_clk__L3_N0));
   CLKBUFX24M scan_clk__L3_I0 (.Y(scan_clk__L3_N0), 
	.A(scan_clk__L2_N0));
   CLKINVX40M scan_clk__L2_I0 (.Y(scan_clk__L2_N0), 
	.A(scan_clk__L1_N0));
   CLKINVX40M scan_clk__L1_I0 (.Y(scan_clk__L1_N0), 
	.A(scan_clk));
   CLKINVX32M REF_CLK_M__L8_I13 (.Y(REF_CLK_M__L8_N13), 
	.A(REF_CLK_M__L7_N7));
   CLKINVX32M REF_CLK_M__L8_I12 (.Y(REF_CLK_M__L8_N12), 
	.A(REF_CLK_M__L7_N6));
   CLKINVX32M REF_CLK_M__L8_I11 (.Y(REF_CLK_M__L8_N11), 
	.A(REF_CLK_M__L7_N6));
   CLKINVX32M REF_CLK_M__L8_I10 (.Y(REF_CLK_M__L8_N10), 
	.A(REF_CLK_M__L7_N5));
   CLKINVX32M REF_CLK_M__L8_I9 (.Y(REF_CLK_M__L8_N9), 
	.A(REF_CLK_M__L7_N5));
   CLKINVX32M REF_CLK_M__L8_I8 (.Y(REF_CLK_M__L8_N8), 
	.A(REF_CLK_M__L7_N4));
   CLKINVX32M REF_CLK_M__L8_I7 (.Y(REF_CLK_M__L8_N7), 
	.A(REF_CLK_M__L7_N4));
   CLKINVX32M REF_CLK_M__L8_I6 (.Y(REF_CLK_M__L8_N6), 
	.A(REF_CLK_M__L7_N3));
   CLKINVX32M REF_CLK_M__L8_I5 (.Y(REF_CLK_M__L8_N5), 
	.A(REF_CLK_M__L7_N2));
   CLKINVX32M REF_CLK_M__L8_I4 (.Y(REF_CLK_M__L8_N4), 
	.A(REF_CLK_M__L7_N2));
   CLKINVX32M REF_CLK_M__L8_I3 (.Y(REF_CLK_M__L8_N3), 
	.A(REF_CLK_M__L7_N1));
   CLKINVX32M REF_CLK_M__L8_I2 (.Y(REF_CLK_M__L8_N2), 
	.A(REF_CLK_M__L7_N1));
   CLKINVX32M REF_CLK_M__L8_I1 (.Y(REF_CLK_M__L8_N1), 
	.A(REF_CLK_M__L7_N0));
   CLKINVX32M REF_CLK_M__L8_I0 (.Y(REF_CLK_M__L8_N0), 
	.A(REF_CLK_M__L7_N0));
   CLKINVX40M REF_CLK_M__L7_I7 (.Y(REF_CLK_M__L7_N7), 
	.A(REF_CLK_M__L6_N3));
   CLKINVX40M REF_CLK_M__L7_I6 (.Y(REF_CLK_M__L7_N6), 
	.A(REF_CLK_M__L6_N3));
   CLKINVX40M REF_CLK_M__L7_I5 (.Y(REF_CLK_M__L7_N5), 
	.A(REF_CLK_M__L6_N2));
   CLKINVX40M REF_CLK_M__L7_I4 (.Y(REF_CLK_M__L7_N4), 
	.A(REF_CLK_M__L6_N2));
   CLKINVX40M REF_CLK_M__L7_I3 (.Y(REF_CLK_M__L7_N3), 
	.A(REF_CLK_M__L6_N1));
   CLKINVX40M REF_CLK_M__L7_I2 (.Y(REF_CLK_M__L7_N2), 
	.A(REF_CLK_M__L6_N1));
   CLKINVX40M REF_CLK_M__L7_I1 (.Y(REF_CLK_M__L7_N1), 
	.A(REF_CLK_M__L6_N0));
   CLKINVX40M REF_CLK_M__L7_I0 (.Y(REF_CLK_M__L7_N0), 
	.A(REF_CLK_M__L6_N0));
   CLKINVX40M REF_CLK_M__L6_I3 (.Y(REF_CLK_M__L6_N3), 
	.A(REF_CLK_M__L5_N1));
   CLKINVX40M REF_CLK_M__L6_I2 (.Y(REF_CLK_M__L6_N2), 
	.A(REF_CLK_M__L5_N1));
   CLKINVX40M REF_CLK_M__L6_I1 (.Y(REF_CLK_M__L6_N1), 
	.A(REF_CLK_M__L5_N0));
   CLKINVX40M REF_CLK_M__L6_I0 (.Y(REF_CLK_M__L6_N0), 
	.A(REF_CLK_M__L5_N0));
   CLKINVX40M REF_CLK_M__L5_I1 (.Y(REF_CLK_M__L5_N1), 
	.A(REF_CLK_M__L4_N0));
   CLKINVX40M REF_CLK_M__L5_I0 (.Y(REF_CLK_M__L5_N0), 
	.A(REF_CLK_M__L4_N0));
   CLKINVX40M REF_CLK_M__L4_I0 (.Y(REF_CLK_M__L4_N0), 
	.A(REF_CLK_M__L3_N1));
   CLKBUFX24M REF_CLK_M__L3_I1 (.Y(REF_CLK_M__L3_N1), 
	.A(REF_CLK_M__L2_N0));
   CLKINVX24M REF_CLK_M__L3_I0 (.Y(REF_CLK_M__L3_N0), 
	.A(REF_CLK_M__L2_N0));
   CLKINVX12M REF_CLK_M__L2_I0 (.Y(REF_CLK_M__L2_N0), 
	.A(REF_CLK_M__L1_N0));
   CLKBUFX12M REF_CLK_M__L1_I0 (.Y(REF_CLK_M__L1_N0), 
	.A(REF_CLK_M));
   CLKINVX40M ALU_CLK__L4_I1 (.Y(ALU_CLK__L4_N1), 
	.A(ALU_CLK__L3_N0));
   CLKINVX40M ALU_CLK__L4_I0 (.Y(ALU_CLK__L4_N0), 
	.A(ALU_CLK__L3_N0));
   CLKINVX40M ALU_CLK__L3_I0 (.Y(ALU_CLK__L3_N0), 
	.A(ALU_CLK__L2_N0));
   CLKBUFX40M ALU_CLK__L2_I0 (.Y(ALU_CLK__L2_N0), 
	.A(ALU_CLK__L1_N0));
   CLKBUFX12M ALU_CLK__L1_I0 (.Y(ALU_CLK__L1_N0), 
	.A(ALU_CLK));
   CLKINVX40M UART_CLK_M__L13_I0 (.Y(UART_CLK_M__L13_N0), 
	.A(UART_CLK_M__L12_N0));
   CLKINVX40M UART_CLK_M__L12_I0 (.Y(UART_CLK_M__L12_N0), 
	.A(UART_CLK_M__L11_N0));
   CLKINVX32M UART_CLK_M__L11_I0 (.Y(UART_CLK_M__L11_N0), 
	.A(UART_CLK_M__L10_N0));
   CLKBUFX20M UART_CLK_M__L10_I0 (.Y(UART_CLK_M__L10_N0), 
	.A(UART_CLK_M__L9_N0));
   CLKBUFX20M UART_CLK_M__L9_I0 (.Y(UART_CLK_M__L9_N0), 
	.A(UART_CLK_M__L8_N0));
   CLKBUFX20M UART_CLK_M__L8_I0 (.Y(UART_CLK_M__L8_N0), 
	.A(UART_CLK_M__L7_N0));
   CLKBUFX20M UART_CLK_M__L7_I0 (.Y(UART_CLK_M__L7_N0), 
	.A(UART_CLK_M__L6_N1));
   CLKBUFX20M UART_CLK_M__L6_I1 (.Y(UART_CLK_M__L6_N1), 
	.A(UART_CLK_M__L5_N0));
   CLKINVX32M UART_CLK_M__L6_I0 (.Y(UART_CLK_M__L6_N0), 
	.A(UART_CLK_M__L5_N0));
   CLKINVX24M UART_CLK_M__L5_I0 (.Y(UART_CLK_M__L5_N0), 
	.A(UART_CLK_M__L4_N0));
   CLKBUFX40M UART_CLK_M__L4_I0 (.Y(UART_CLK_M__L4_N0), 
	.A(UART_CLK_M__L3_N0));
   CLKBUFX24M UART_CLK_M__L3_I0 (.Y(UART_CLK_M__L3_N0), 
	.A(UART_CLK_M__L2_N0));
   CLKBUFX24M UART_CLK_M__L2_I0 (.Y(UART_CLK_M__L2_N0), 
	.A(UART_CLK_M__L1_N0));
   CLKBUFX12M UART_CLK_M__L1_I0 (.Y(UART_CLK_M__L1_N0), 
	.A(UART_CLK_M));
   CLKBUFX12M TX_CLK__L1_I0 (.Y(TX_CLK__L1_N0), 
	.A(TX_CLK));
   CLKINVX40M TX_CLK_M__L4_I1 (.Y(TX_CLK_M__L4_N1), 
	.A(TX_CLK_M__L3_N0));
   CLKINVX40M TX_CLK_M__L4_I0 (.Y(TX_CLK_M__L4_N0), 
	.A(TX_CLK_M__L3_N0));
   CLKINVX40M TX_CLK_M__L3_I0 (.Y(TX_CLK_M__L3_N0), 
	.A(TX_CLK_M__L2_N0));
   CLKBUFX40M TX_CLK_M__L2_I0 (.Y(TX_CLK_M__L2_N0), 
	.A(TX_CLK_M__L1_N0));
   BUFX14M TX_CLK_M__L1_I0 (.Y(TX_CLK_M__L1_N0), 
	.A(TX_CLK_M));
   CLKINVX32M RX_CLK_M__L3_I1 (.Y(RX_CLK_M__L3_N1), 
	.A(RX_CLK_M__L2_N0));
   CLKINVX32M RX_CLK_M__L3_I0 (.Y(RX_CLK_M__L3_N0), 
	.A(RX_CLK_M__L2_N0));
   CLKINVX40M RX_CLK_M__L2_I0 (.Y(RX_CLK_M__L2_N0), 
	.A(RX_CLK_M__L1_N0));
   CLKBUFX16M RX_CLK_M__L1_I0 (.Y(RX_CLK_M__L1_N0), 
	.A(RX_CLK_M));
   BUFX2M FE_OFC4_ALU_FUNC_1_ (.Y(FE_OFN4_ALU_FUNC_1_), 
	.A(ALU_FUNC[1]));
   CLKBUFX8M FE_OFC3_RST_Domain_2_M (.Y(FE_OFN3_RST_Domain_2_M), 
	.A(RST_Domain_2_M));
   BUFX4M FE_OFC2_RST_Domain_1_M (.Y(FE_OFN2_RST_Domain_1_M), 
	.A(FE_OFN0_RST_Domain_1_M));
   CLKBUFX8M FE_OFC1_RST_Domain_1_M (.Y(FE_OFN1_RST_Domain_1_M), 
	.A(FE_OFN0_RST_Domain_1_M));
   CLKBUFX8M FE_OFC0_RST_Domain_1_M (.Y(FE_OFN0_RST_Domain_1_M), 
	.A(RST_Domain_1_M));
   DLY1X1M U16 (.Y(n26), 
	.A(SE));
   DLY1X1M U17 (.Y(n27), 
	.A(n30));
   DLY1X1M U18 (.Y(n28), 
	.A(n26));
   DLY1X1M U20 (.Y(n30), 
	.A(SE));
   DLY1X1M U21 (.Y(n31), 
	.A(SE));
   DLY1X1M U22 (.Y(n32), 
	.A(SE));
   DLY1X1M U23 (.Y(n33), 
	.A(n26));
   Reset_SYNC_test_0 Domain_1_Reset (.clk(REF_CLK_M__L8_N12), 
	.rst(RST_M), 
	.sync_rst(RST_Domain_1), 
	.test_si(RX_P_DATA_synced[7]), 
	.test_se(n32));
   Reset_SYNC_test_1 Domain_2_Reset (.clk(UART_CLK_M__L13_N0), 
	.rst(RST_M), 
	.sync_rst(RST_Domain_2), 
	.test_si(RST_Domain_1), 
	.test_se(n28));
   Prescale_MUX Prescale_MUX (.prescale({ UART_CONFIG[7],
		UART_CONFIG[6],
		UART_CONFIG[5],
		UART_CONFIG[4],
		UART_CONFIG[3],
		UART_CONFIG[2] }), 
	.Div_ratio({ SYNOPSYS_UNCONNECTED__0,
		SYNOPSYS_UNCONNECTED__1,
		SYNOPSYS_UNCONNECTED__2,
		SYNOPSYS_UNCONNECTED__3,
		RX_DIV_Ratio[3],
		RX_DIV_Ratio[2],
		RX_DIV_Ratio[1],
		RX_DIV_Ratio[0] }));
   Clock_Divider_test_0 RX_Clock_Divider (.i_ref_clk(UART_CLK_M__L13_N0), 
	.i_clk_en(1'b1), 
	.i_rst_n(RST_Domain_2_M), 
	.i_div_ratio({ 1'b0,
		1'b0,
		1'b0,
		1'b0,
		RX_DIV_Ratio[3],
		RX_DIV_Ratio[2],
		RX_DIV_Ratio[1],
		RX_DIV_Ratio[0] }), 
	.o_div_clk(RX_CLK), 
	.test_si(n21), 
	.test_so(n20), 
	.test_se(n27), 
	.UART_CLK_M__L1_N0(UART_CLK_M__L1_N0), 
	.UART_CLK_M__L6_N0(UART_CLK_M__L6_N0));
   Clock_Divider_test_1 TX_Clock_Divider (.i_ref_clk(UART_CLK_M__L13_N0), 
	.i_clk_en(1'b1), 
	.i_rst_n(RST_Domain_2_M), 
	.i_div_ratio({ TX_DIV_Ratio[7],
		TX_DIV_Ratio[6],
		TX_DIV_Ratio[5],
		TX_DIV_Ratio[4],
		TX_DIV_Ratio[3],
		TX_DIV_Ratio[2],
		TX_DIV_Ratio[1],
		TX_DIV_Ratio[0] }), 
	.o_div_clk(TX_CLK), 
	.test_si(n14), 
	.test_so(n13), 
	.test_se(n31), 
	.UART_CLK_M__L1_N0(UART_CLK_M__L1_N0), 
	.UART_CLK_M__L6_N0(UART_CLK_M__L6_N0));
   Clock_Gating Clock_Gating (.CLK_en(CLK_en), 
	.test_mode(test_mode), 
	.clk(REF_CLK_M__L3_N0), 
	.Gated_CLK(ALU_CLK));
   register_file_test_1 Register_File (.WR_Data({ WR_Data[7],
		WR_Data[6],
		WR_Data[5],
		WR_Data[4],
		WR_Data[3],
		WR_Data[2],
		WR_Data[1],
		WR_Data[0] }), 
	.address({ address[3],
		address[2],
		address[1],
		address[0] }), 
	.WR_en(WR_en), 
	.RD_en(RD_en), 
	.clk(REF_CLK_M__L8_N10), 
	.rst(RST_Domain_1_M), 
	.RD_Valid(RD_Valid), 
	.RD_Data({ RD_Data[7],
		RD_Data[6],
		RD_Data[5],
		RD_Data[4],
		RD_Data[3],
		RD_Data[2],
		RD_Data[1],
		RD_Data[0] }), 
	.REG0({ OP_A[7],
		OP_A[6],
		OP_A[5],
		OP_A[4],
		OP_A[3],
		OP_A[2],
		OP_A[1],
		OP_A[0] }), 
	.REG1({ OP_B[7],
		OP_B[6],
		OP_B[5],
		OP_B[4],
		OP_B[3],
		OP_B[2],
		OP_B[1],
		OP_B[0] }), 
	.REG2({ UART_CONFIG[7],
		UART_CONFIG[6],
		UART_CONFIG[5],
		UART_CONFIG[4],
		UART_CONFIG[3],
		UART_CONFIG[2],
		UART_CONFIG[1],
		UART_CONFIG[0] }), 
	.REG3({ TX_DIV_Ratio[7],
		TX_DIV_Ratio[6],
		TX_DIV_Ratio[5],
		TX_DIV_Ratio[4],
		TX_DIV_Ratio[3],
		TX_DIV_Ratio[2],
		TX_DIV_Ratio[1],
		TX_DIV_Ratio[0] }), 
	.test_si3(SI[1]), 
	.test_si2(SI[2]), 
	.test_si1(n20), 
	.test_so3(n15), 
	.test_so2(SO[2]), 
	.test_so1(n34), 
	.test_se(n31), 
	.FE_OFN0_RST_Domain_1_M(FE_OFN0_RST_Domain_1_M), 
	.FE_OFN1_RST_Domain_1_M(FE_OFN1_RST_Domain_1_M), 
	.FE_OFN2_RST_Domain_1_M(FE_OFN2_RST_Domain_1_M), 
	.REF_CLK_M__L8_N11(REF_CLK_M__L8_N11), 
	.REF_CLK_M__L8_N12(REF_CLK_M__L8_N12), 
	.REF_CLK_M__L8_N4(REF_CLK_M__L8_N4), 
	.REF_CLK_M__L8_N6(REF_CLK_M__L8_N6), 
	.REF_CLK_M__L8_N7(REF_CLK_M__L8_N7), 
	.REF_CLK_M__L8_N8(REF_CLK_M__L8_N8), 
	.REF_CLK_M__L8_N9(REF_CLK_M__L8_N9));
   alu_top_test_1 ALU (.a({ OP_A[7],
		OP_A[6],
		OP_A[5],
		OP_A[4],
		OP_A[3],
		OP_A[2],
		OP_A[1],
		OP_A[0] }), 
	.b({ OP_B[7],
		OP_B[6],
		OP_B[5],
		OP_B[4],
		OP_B[3],
		OP_B[2],
		OP_B[1],
		OP_B[0] }), 
	.alu_fun({ ALU_FUNC[3],
		ALU_FUNC[2],
		FE_OFN4_ALU_FUNC_1_,
		ALU_FUNC[0] }), 
	.clk(ALU_CLK__L4_N0), 
	.rst(FE_OFN1_RST_Domain_1_M), 
	.ALU_OUT({ ALU_OUT[15],
		ALU_OUT[14],
		ALU_OUT[13],
		ALU_OUT[12],
		ALU_OUT[11],
		ALU_OUT[10],
		ALU_OUT[9],
		ALU_OUT[8],
		ALU_OUT[7],
		ALU_OUT[6],
		ALU_OUT[5],
		ALU_OUT[4],
		ALU_OUT[3],
		ALU_OUT[2],
		ALU_OUT[1],
		ALU_OUT[0] }), 
	.ALU_Valid(ALU_Valid), 
	.test_si(SI[3]), 
	.test_so(n22), 
	.test_se(n27), 
	.ALU_CLK__L4_N1(ALU_CLK__L4_N1));
   Data_Sync_test_1 Data_Synchronizer (.Unsync_bus({ RX_P_DATA[7],
		RX_P_DATA[6],
		RX_P_DATA[5],
		RX_P_DATA[4],
		RX_P_DATA[3],
		RX_P_DATA[2],
		RX_P_DATA[1],
		RX_P_DATA[0] }), 
	.bus_enable(RX_data_valid), 
	.clk(REF_CLK_M__L8_N13), 
	.rst(FE_OFN1_RST_Domain_1_M), 
	.sync_bus({ RX_P_DATA_synced[7],
		RX_P_DATA_synced[6],
		RX_P_DATA_synced[5],
		RX_P_DATA_synced[4],
		RX_P_DATA_synced[3],
		RX_P_DATA_synced[2],
		RX_P_DATA_synced[1],
		RX_P_DATA_synced[0] }), 
	.enable_pulse(RX_data_valid_synced), 
	.test_si(n22), 
	.test_se(n33));
   Pulse_Generator_test_1 Pulse_Generator (.bus_enable(busy), 
	.clk(TX_CLK_M__L4_N0), 
	.rst(RST_Domain_2_M), 
	.enable_pulse(R_inc), 
	.test_si(RST_Domain_2), 
	.test_so(n21), 
	.test_se(n33));
   System_Controller_test_1 SYS_CTRL (.clk(REF_CLK_M__L8_N11), 
	.rst(FE_OFN0_RST_Domain_1_M), 
	.P_data_sync({ RX_P_DATA_synced[7],
		RX_P_DATA_synced[6],
		RX_P_DATA_synced[5],
		RX_P_DATA_synced[4],
		RX_P_DATA_synced[3],
		RX_P_DATA_synced[2],
		RX_P_DATA_synced[1],
		RX_P_DATA_synced[0] }), 
	.data_valid_sync(RX_data_valid_synced), 
	.RD_Data({ RD_Data[7],
		RD_Data[6],
		RD_Data[5],
		RD_Data[4],
		RD_Data[3],
		RD_Data[2],
		RD_Data[1],
		RD_Data[0] }), 
	.RD_Valid(RD_Valid), 
	.WR_en(WR_en), 
	.RD_en(RD_en), 
	.ADDR({ address[3],
		address[2],
		address[1],
		address[0] }), 
	.WR_Data_regfile({ WR_Data[7],
		WR_Data[6],
		WR_Data[5],
		WR_Data[4],
		WR_Data[3],
		WR_Data[2],
		WR_Data[1],
		WR_Data[0] }), 
	.ALU_OUT({ ALU_OUT[15],
		ALU_OUT[14],
		ALU_OUT[13],
		ALU_OUT[12],
		ALU_OUT[11],
		ALU_OUT[10],
		ALU_OUT[9],
		ALU_OUT[8],
		ALU_OUT[7],
		ALU_OUT[6],
		ALU_OUT[5],
		ALU_OUT[4],
		ALU_OUT[3],
		ALU_OUT[2],
		ALU_OUT[1],
		ALU_OUT[0] }), 
	.ALU_Valid(ALU_Valid), 
	.ALU_FUNC({ ALU_FUNC[3],
		ALU_FUNC[2],
		ALU_FUNC[1],
		ALU_FUNC[0] }), 
	.CLK_en(CLK_en), 
	.W_full(W_full), 
	.WR_DATA_fifo({ WR_DATA_fifo[7],
		WR_DATA_fifo[6],
		WR_DATA_fifo[5],
		WR_DATA_fifo[4],
		WR_DATA_fifo[3],
		WR_DATA_fifo[2],
		WR_DATA_fifo[1],
		WR_DATA_fifo[0] }), 
	.W_inc(W_inc), 
	.test_si(n15), 
	.test_so(n14), 
	.test_se(n28), 
	.FE_OFN1_RST_Domain_1_M(FE_OFN1_RST_Domain_1_M));
   ASYC_FIFO_test_1 TX_FIFO (.W_clk(REF_CLK_M__L8_N0), 
	.W_rst(FE_OFN2_RST_Domain_1_M), 
	.W_inc(W_inc), 
	.R_clk(TX_CLK_M__L4_N1), 
	.R_rst(FE_OFN3_RST_Domain_2_M), 
	.R_inc(R_inc), 
	.W_data({ WR_DATA_fifo[7],
		WR_DATA_fifo[6],
		WR_DATA_fifo[5],
		WR_DATA_fifo[4],
		WR_DATA_fifo[3],
		WR_DATA_fifo[2],
		WR_DATA_fifo[1],
		WR_DATA_fifo[0] }), 
	.W_full(W_full), 
	.R_empty(R_empty), 
	.R_data({ TX_P_data[7],
		TX_P_data[6],
		TX_P_data[5],
		TX_P_data[4],
		TX_P_data[3],
		TX_P_data[2],
		TX_P_data[1],
		TX_P_data[0] }), 
	.test_si2(SI[0]), 
	.test_si1(n13), 
	.test_so2(n10), 
	.test_so1(SO[1]), 
	.test_se(n30), 
	.REF_CLK_M__L8_N1(REF_CLK_M__L8_N1), 
	.REF_CLK_M__L8_N2(REF_CLK_M__L8_N2), 
	.REF_CLK_M__L8_N3(REF_CLK_M__L8_N3), 
	.REF_CLK_M__L8_N5(REF_CLK_M__L8_N5));
   UART_TOP_test_1 UART (.rst(FE_OFN3_RST_Domain_2_M), 
	.PAR_EN(UART_CONFIG[0]), 
	.PAR_type(UART_CONFIG[1]), 
	.TX_P_data({ TX_P_data[7],
		TX_P_data[6],
		TX_P_data[5],
		TX_P_data[4],
		TX_P_data[3],
		TX_P_data[2],
		TX_P_data[1],
		TX_P_data[0] }), 
	.TX_Data_valid(R_empty), 
	.TX_CLK(TX_CLK_M__L4_N0), 
	.TX_OUT(UART_TX_O), 
	.TX_busy(busy), 
	.RX_IN(UART_RX_IN), 
	.prescale({ UART_CONFIG[7],
		UART_CONFIG[6],
		UART_CONFIG[5],
		UART_CONFIG[4],
		UART_CONFIG[3],
		UART_CONFIG[2] }), 
	.RX_CLK(RX_CLK_M__L3_N0), 
	.RX_data_valid(RX_data_valid), 
	.PAR_err(parity_error), 
	.STOP_err(SO[0]), 
	.RX_P_DATA({ RX_P_DATA[7],
		RX_P_DATA[6],
		RX_P_DATA[5],
		RX_P_DATA[4],
		RX_P_DATA[3],
		RX_P_DATA[2],
		RX_P_DATA[1],
		RX_P_DATA[0] }), 
	.test_si(n10), 
	.test_se(n32), 
	.RX_CLK_M__L3_N1(RX_CLK_M__L3_N1), 
	.TX_CLK_M__L4_N1(TX_CLK_M__L4_N1));
   mux2X1_1 REF_CLK_MUX (.IN_0(REF_CLK__L2_N0), 
	.IN_1(scan_clk__L8_N0), 
	.SEL(test_mode), 
	.OUT(REF_CLK_M));
   mux2X1_4 UART_CLK_MUX (.IN_0(UART_CLK__L2_N0), 
	.IN_1(scan_clk__L2_N0), 
	.SEL(test_mode), 
	.OUT(UART_CLK_M));
   mux2X1_3 TX_CLK_MUX (.IN_0(TX_CLK__L1_N0), 
	.IN_1(scan_clk__L13_N0), 
	.SEL(test_mode), 
	.OUT(TX_CLK_M));
   mux2X1_2 RX_CLK_MUX (.IN_0(RX_CLK), 
	.IN_1(scan_clk__L13_N0), 
	.SEL(test_mode), 
	.OUT(RX_CLK_M));
   mux2X1_0 REF_Reset_MUX (.IN_0(RST_N), 
	.IN_1(scan_rst), 
	.SEL(test_mode), 
	.OUT(RST_M));
   mux2X1_6 Domain_1_Reset_MUX (.IN_0(RST_Domain_1), 
	.IN_1(scan_rst), 
	.SEL(test_mode), 
	.OUT(RST_Domain_1_M));
   mux2X1_5 Domain_2_Reset_MUX (.IN_0(RST_Domain_2), 
	.IN_1(scan_rst), 
	.SEL(test_mode), 
	.OUT(RST_Domain_2_M));
   BUFX2M U15 (.Y(SO[3]), 
	.A(n34));
   BUFX2M U19 (.Y(framing_error), 
	.A(SO[0]));
endmodule

/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : O-2018.06-SP1
// Date      : Tue Oct  6 23:23:15 2026
/////////////////////////////////////////////////////////////
module Reset_SYNC_test_0 (
	clk, 
	rst, 
	sync_rst, 
	test_si, 
	test_se);
   input clk;
   input rst;
   output sync_rst;
   input test_si;
   input test_se;

   // Internal wires
   wire HTIE_LTIEHI_NET;
   wire \memory[0] ;
   wire n3;

   TIEHIM HTIE_LTIEHI (.Y(HTIE_LTIEHI_NET));
   SDFFRQX2M \memory_reg[1]  (.SI(\memory[0] ), 
	.SE(n3), 
	.RN(rst), 
	.Q(sync_rst), 
	.D(\memory[0] ), 
	.CK(clk));
   SDFFRQX2M \memory_reg[0]  (.SI(test_si), 
	.SE(n3), 
	.RN(rst), 
	.Q(\memory[0] ), 
	.D(HTIE_LTIEHI_NET), 
	.CK(clk));
   DLY1X1M U5 (.Y(n3), 
	.A(test_se));
endmodule

module Reset_SYNC_test_1 (
	clk, 
	rst, 
	sync_rst, 
	test_si, 
	test_se);
   input clk;
   input rst;
   output sync_rst;
   input test_si;
   input test_se;

   // Internal wires
   wire HTIE_LTIEHI_NET;
   wire \memory[0] ;
   wire n7;

   TIEHIM HTIE_LTIEHI (.Y(HTIE_LTIEHI_NET));
   SDFFRQX1M \memory_reg[1]  (.SI(\memory[0] ), 
	.SE(n7), 
	.RN(rst), 
	.Q(sync_rst), 
	.D(\memory[0] ), 
	.CK(clk));
   SDFFRQX1M \memory_reg[0]  (.SI(test_si), 
	.SE(n7), 
	.RN(rst), 
	.Q(\memory[0] ), 
	.D(HTIE_LTIEHI_NET), 
	.CK(clk));
   DLY1X1M U5 (.Y(n7), 
	.A(test_se));
endmodule

module Prescale_MUX (
	prescale, 
	Div_ratio);
   input [5:0] prescale;
   output [7:0] Div_ratio;

   // Internal wires
   wire HTIE_LTIEHI_NET;
   wire n5;
   wire n6;
   wire n7;
   wire n8;
   wire n9;
   wire n14;
   wire n15;
   wire n16;
   wire n17;

   TIEHIM HTIE_LTIEHI (.Y(HTIE_LTIEHI_NET));
   NOR3X2M U6 (.Y(Div_ratio[1]), 
	.C(prescale[0]), 
	.B(prescale[1]), 
	.A(n7));
   NOR4X1M U12 (.Y(n8), 
	.D(n14), 
	.C(prescale[3]), 
	.B(prescale[4]), 
	.A(prescale[5]));
   INVX2M U13 (.Y(n14), 
	.A(prescale[2]));
   NAND4BX1M U14 (.Y(n7), 
	.D(n15), 
	.C(n14), 
	.B(prescale[4]), 
	.AN(prescale[3]));
   NAND4BX1M U15 (.Y(n6), 
	.D(n15), 
	.C(n14), 
	.B(prescale[3]), 
	.AN(prescale[4]));
   OAI211X2M U16 (.Y(Div_ratio[0]), 
	.C0(n16), 
	.B0(n17), 
	.A1(n9), 
	.A0(n8));
   NAND2X2M U17 (.Y(n9), 
	.B(n6), 
	.A(n7));
   CLKINVX1M U18 (.Y(n15), 
	.A(prescale[5]));
   NOR3X2M U19 (.Y(Div_ratio[2]), 
	.C(prescale[0]), 
	.B(prescale[1]), 
	.A(n6));
   CLKINVX1M U20 (.Y(n16), 
	.A(prescale[1]));
   INVX2M U21 (.Y(n17), 
	.A(prescale[0]));
   NOR4X1M U22 (.Y(Div_ratio[3]), 
	.D(prescale[4]), 
	.C(prescale[5]), 
	.B(prescale[3]), 
	.A(n5));
   NAND3X2M U23 (.Y(n5), 
	.C(prescale[2]), 
	.B(n16), 
	.A(n17));
   INVX2M U3 (.Y(Div_ratio[7]), 
	.A(HTIE_LTIEHI_NET));
   INVX2M U5 (.Y(Div_ratio[6]), 
	.A(HTIE_LTIEHI_NET));
   INVX2M U8 (.Y(Div_ratio[5]), 
	.A(HTIE_LTIEHI_NET));
   INVX2M U10 (.Y(Div_ratio[4]), 
	.A(HTIE_LTIEHI_NET));
endmodule

module Clock_Divider_0_DW01_inc_0 (
	A, 
	SUM);
   input [7:0] A;
   output [7:0] SUM;

   // Internal wires
   wire [7:2] carry;

   ADDHX1M U1_1_6 (.S(SUM[6]), 
	.CO(carry[7]), 
	.B(carry[6]), 
	.A(A[6]));
   ADDHX1M U1_1_5 (.S(SUM[5]), 
	.CO(carry[6]), 
	.B(carry[5]), 
	.A(A[5]));
   ADDHX1M U1_1_4 (.S(SUM[4]), 
	.CO(carry[5]), 
	.B(carry[4]), 
	.A(A[4]));
   ADDHX1M U1_1_3 (.S(SUM[3]), 
	.CO(carry[4]), 
	.B(carry[3]), 
	.A(A[3]));
   ADDHX1M U1_1_2 (.S(SUM[2]), 
	.CO(carry[3]), 
	.B(carry[2]), 
	.A(A[2]));
   ADDHX1M U1_1_1 (.S(SUM[1]), 
	.CO(carry[2]), 
	.B(A[0]), 
	.A(A[1]));
   CLKXOR2X2M U1 (.Y(SUM[7]), 
	.B(A[7]), 
	.A(carry[7]));
   CLKINVX1M U2 (.Y(SUM[0]), 
	.A(A[0]));
endmodule

module Clock_Divider_test_0 (
	i_ref_clk, 
	i_clk_en, 
	i_rst_n, 
	i_div_ratio, 
	o_div_clk, 
	test_si, 
	test_so, 
	test_se, 
	UART_CLK_M__L1_N0, 
	UART_CLK_M__L6_N0);
   input i_ref_clk;
   input i_clk_en;
   input i_rst_n;
   input [7:0] i_div_ratio;
   output o_div_clk;
   input test_si;
   output test_so;
   input test_se;
   input UART_CLK_M__L1_N0;
   input UART_CLK_M__L6_N0;

   // Internal wires
   wire clk_div_reg__L1_N0;
   wire clk_div_reg__Exclude_0_NET;
   wire HTIE_LTIEHI_NET;
   wire LTIE_LTIELO_NET;
   wire clk_div_reg;
   wire N7;
   wire N8;
   wire N9;
   wire N10;
   wire N11;
   wire N12;
   wire N13;
   wire N14;
   wire N17;
   wire N18;
   wire N19;
   wire N20;
   wire N21;
   wire N22;
   wire N23;
   wire N24;
   wire N26;
   wire N27;
   wire N28;
   wire N29;
   wire N30;
   wire N31;
   wire N32;
   wire N33;
   wire N45;
   wire N46;
   wire N47;
   wire N48;
   wire N49;
   wire N50;
   wire N51;
   wire N52;
   wire n18;
   wire n19;
   wire n20;
   wire n21;
   wire n22;
   wire n23;
   wire n3;
   wire n4;
   wire n25;
   wire n28;
   wire n29;
   wire n30;
   wire n31;
   wire n32;
   wire n33;
   wire n34;
   wire n35;
   wire n36;
   wire n37;
   wire n38;
   wire n39;
   wire n40;
   wire n41;
   wire n42;
   wire n43;
   wire n44;
   wire n45;
   wire n46;
   wire n47;
   wire n48;
   wire n49;
   wire n50;
   wire n51;
   wire n52;
   wire n53;
   wire n54;
   wire n55;
   wire n56;
   wire n57;
   wire n58;
   wire n59;
   wire n60;
   wire n61;
   wire n62;
   wire n63;
   wire n64;
   wire n65;
   wire n68;
   wire n69;
   wire n70;
   wire n71;
   wire n72;
   wire n73;
   wire n74;
   wire n75;
   wire [7:0] counter;

   assign test_so = counter[7] ;

   CLKBUFX12M clk_div_reg__L1_I0 (.Y(clk_div_reg__L1_N0), 
	.A(clk_div_reg));
   BUFX8M clk_div_reg__Exclude_0 (.Y(clk_div_reg__Exclude_0_NET), 
	.A(clk_div_reg));
   TIEHIM HTIE_LTIEHI (.Y(HTIE_LTIEHI_NET));
   TIELOM LTIE_LTIELO (.Y(LTIE_LTIELO_NET));
   SDFFRQX2M \counter_reg[7]  (.SI(counter[6]), 
	.SE(n71), 
	.RN(i_rst_n), 
	.Q(counter[7]), 
	.D(N52), 
	.CK(i_ref_clk));
   SDFFRQX2M \counter_reg[2]  (.SI(counter[1]), 
	.SE(n70), 
	.RN(i_rst_n), 
	.Q(counter[2]), 
	.D(N47), 
	.CK(i_ref_clk));
   SDFFRQX2M \counter_reg[6]  (.SI(counter[5]), 
	.SE(n69), 
	.RN(i_rst_n), 
	.Q(counter[6]), 
	.D(N51), 
	.CK(i_ref_clk));
   SDFFRQX2M \counter_reg[5]  (.SI(counter[4]), 
	.SE(n71), 
	.RN(i_rst_n), 
	.Q(counter[5]), 
	.D(N50), 
	.CK(i_ref_clk));
   SDFFRQX2M \counter_reg[4]  (.SI(counter[3]), 
	.SE(n75), 
	.RN(i_rst_n), 
	.Q(counter[4]), 
	.D(N49), 
	.CK(i_ref_clk));
   SDFFRQX2M \counter_reg[3]  (.SI(counter[2]), 
	.SE(n74), 
	.RN(i_rst_n), 
	.Q(counter[3]), 
	.D(N48), 
	.CK(i_ref_clk));
   SDFFRQX2M clk_div_reg_reg (.SI(test_si), 
	.SE(n73), 
	.RN(i_rst_n), 
	.Q(clk_div_reg), 
	.D(n23), 
	.CK(UART_CLK_M__L1_N0));
   INVX2M U7 (.Y(n4), 
	.A(n3));
   INVX2M U8 (.Y(n3), 
	.A(counter[0]));
   OAI2BB1XLM U21 (.Y(N26), 
	.B0(n35), 
	.A1N(i_div_ratio[2]), 
	.A0N(i_div_ratio[1]));
   NOR3X2M U22 (.Y(n61), 
	.C(counter[7]), 
	.B(N32), 
	.A(n55));
   NOR3X2M U23 (.Y(N32), 
	.C(n38), 
	.B(LTIE_LTIELO_NET), 
	.A(LTIE_LTIELO_NET));
   NOR2X2M U24 (.Y(n31), 
	.B(LTIE_LTIELO_NET), 
	.A(n30));
   OR2X2M U25 (.Y(n30), 
	.B(i_div_ratio[3]), 
	.A(n29));
   OR2X2M U26 (.Y(n36), 
	.B(i_div_ratio[3]), 
	.A(n35));
   OAI2BB1XLM U27 (.Y(N27), 
	.B0(n36), 
	.A1N(i_div_ratio[3]), 
	.A0N(n35));
   OR2X2M U28 (.Y(n38), 
	.B(LTIE_LTIELO_NET), 
	.A(n37));
   OR2X2M U29 (.Y(n37), 
	.B(LTIE_LTIELO_NET), 
	.A(n36));
   OAI2BB1XLM U30 (.Y(N29), 
	.B0(n38), 
	.A1N(LTIE_LTIELO_NET), 
	.A0N(n37));
   OAI2BB1XLM U31 (.Y(N10), 
	.B0(n30), 
	.A1N(i_div_ratio[3]), 
	.A0N(n29));
   OAI2BB1XLM U32 (.Y(N28), 
	.B0(n37), 
	.A1N(LTIE_LTIELO_NET), 
	.A0N(n36));
   NOR2BX2M U33 (.Y(n42), 
	.B(n4), 
	.AN(N7));
   NOR2BX2M U34 (.Y(n41), 
	.B(N7), 
	.AN(n4));
   OAI2BB1XLM U35 (.Y(N9), 
	.B0(n29), 
	.A1N(i_div_ratio[2]), 
	.A0N(n28));
   NOR2X2M U36 (.Y(n53), 
	.B(n40), 
	.A(n3));
   OR2X2M U37 (.Y(n28), 
	.B(i_div_ratio[0]), 
	.A(i_div_ratio[1]));
   CLKNAND2X2M U38 (.Y(n20), 
	.B(n25), 
	.A(n65));
   INVX2M U39 (.Y(n65), 
	.A(n19));
   OR2X2M U40 (.Y(n25), 
	.B(n51), 
	.A(n52));
   NOR2BX2M U41 (.Y(N46), 
	.B(n20), 
	.AN(N18));
   NOR2BX2M U42 (.Y(N47), 
	.B(n20), 
	.AN(N19));
   NOR2BX2M U43 (.Y(N48), 
	.B(n20), 
	.AN(N20));
   NOR2BX2M U44 (.Y(N49), 
	.B(n20), 
	.AN(N21));
   NOR2BX2M U45 (.Y(N50), 
	.B(n20), 
	.AN(N22));
   NOR2BX2M U46 (.Y(N51), 
	.B(n20), 
	.AN(N23));
   INVX2M U47 (.Y(n40), 
	.A(i_div_ratio[1]));
   INVX2M U48 (.Y(n64), 
	.A(N26));
   NOR2BX2M U51 (.Y(N52), 
	.B(n20), 
	.AN(N24));
   NOR2BX2M U52 (.Y(N45), 
	.B(n20), 
	.AN(N17));
   AOI21X2M U53 (.Y(n23), 
	.B0(n19), 
	.A1(n18), 
	.A0(n25));
   NAND2BX2M U54 (.Y(n18), 
	.B(clk_div_reg__Exclude_0_NET), 
	.AN(N33));
   OAI2BB1X2M U55 (.Y(n19), 
	.B0(HTIE_LTIEHI_NET), 
	.A1N(n22), 
	.A0N(n21));
   NOR4X2M U56 (.Y(n22), 
	.D(LTIE_LTIELO_NET), 
	.C(LTIE_LTIELO_NET), 
	.B(LTIE_LTIELO_NET), 
	.A(LTIE_LTIELO_NET));
   NOR3X2M U57 (.Y(n21), 
	.C(i_div_ratio[2]), 
	.B(i_div_ratio[3]), 
	.A(i_div_ratio[1]));
   INVX2M U58 (.Y(n34), 
	.A(LTIE_LTIELO_NET));
   MX2XLM U59 (.Y(o_div_clk), 
	.S0(n65), 
	.B(clk_div_reg__L1_N0), 
	.A(UART_CLK_M__L6_N0));
   CLKINVX1M U60 (.Y(N7), 
	.A(i_div_ratio[0]));
   OAI2BB1X1M U61 (.Y(N8), 
	.B0(n28), 
	.A1N(i_div_ratio[1]), 
	.A0N(i_div_ratio[0]));
   OR2X1M U62 (.Y(n29), 
	.B(i_div_ratio[2]), 
	.A(n28));
   AO21XLM U63 (.Y(N11), 
	.B0(n31), 
	.A1(LTIE_LTIELO_NET), 
	.A0(n30));
   CLKNAND2X2M U64 (.Y(n32), 
	.B(n34), 
	.A(n31));
   OAI21X1M U65 (.Y(N12), 
	.B0(n32), 
	.A1(n34), 
	.A0(n31));
   XNOR2X1M U66 (.Y(N13), 
	.B(n32), 
	.A(LTIE_LTIELO_NET));
   NOR2X1M U67 (.Y(n33), 
	.B(n32), 
	.A(LTIE_LTIELO_NET));
   CLKXOR2X2M U68 (.Y(N14), 
	.B(n33), 
	.A(LTIE_LTIELO_NET));
   NAND2BX1M U69 (.Y(n35), 
	.B(n40), 
	.AN(i_div_ratio[2]));
   XNOR2X1M U70 (.Y(N30), 
	.B(n38), 
	.A(LTIE_LTIELO_NET));
   OAI21X1M U71 (.Y(n39), 
	.B0(LTIE_LTIELO_NET), 
	.A1(n38), 
	.A0(LTIE_LTIELO_NET));
   NAND2BX1M U72 (.Y(N31), 
	.B(n39), 
	.AN(N32));
   XNOR2X1M U73 (.Y(n46), 
	.B(counter[2]), 
	.A(N9));
   XNOR2X1M U74 (.Y(n45), 
	.B(counter[7]), 
	.A(N14));
   OAI2B2X1M U75 (.Y(n44), 
	.B1(n41), 
	.B0(counter[1]), 
	.A1N(N8), 
	.A0(n41));
   OAI2B2X1M U76 (.Y(n43), 
	.B1(n42), 
	.B0(N8), 
	.A1N(counter[1]), 
	.A0(n42));
   NAND4X1M U77 (.Y(n52), 
	.D(n43), 
	.C(n44), 
	.B(n45), 
	.A(n46));
   XNOR2X1M U78 (.Y(n50), 
	.B(counter[6]), 
	.A(N13));
   XNOR2X1M U79 (.Y(n49), 
	.B(counter[5]), 
	.A(N12));
   XNOR2X1M U80 (.Y(n48), 
	.B(counter[4]), 
	.A(N11));
   XNOR2X1M U81 (.Y(n47), 
	.B(counter[3]), 
	.A(N10));
   NAND4X1M U82 (.Y(n51), 
	.D(n47), 
	.C(n48), 
	.B(n49), 
	.A(n50));
   XNOR2X1M U83 (.Y(n63), 
	.B(counter[2]), 
	.A(N27));
   OAI22X1M U84 (.Y(n62), 
	.B1(n64), 
	.B0(n53), 
	.A1(n53), 
	.A0(counter[1]));
   CLKNAND2X2M U85 (.Y(n54), 
	.B(n3), 
	.A(n40));
   AOI22X1M U86 (.Y(n55), 
	.B1(counter[1]), 
	.B0(n54), 
	.A1(n64), 
	.A0(n54));
   CLKXOR2X2M U87 (.Y(n59), 
	.B(counter[3]), 
	.A(N28));
   CLKXOR2X2M U88 (.Y(n58), 
	.B(counter[4]), 
	.A(N29));
   CLKXOR2X2M U89 (.Y(n57), 
	.B(counter[5]), 
	.A(N30));
   CLKXOR2X2M U90 (.Y(n56), 
	.B(counter[6]), 
	.A(N31));
   NOR4X1M U91 (.Y(n60), 
	.D(n56), 
	.C(n57), 
	.B(n58), 
	.A(n59));
   AND4X1M U92 (.Y(N33), 
	.D(n60), 
	.C(n61), 
	.B(n62), 
	.A(n63));
   DLY1X1M U93 (.Y(n68), 
	.A(n72));
   DLY1X1M U94 (.Y(n69), 
	.A(n74));
   DLY1X1M U95 (.Y(n70), 
	.A(n75));
   DLY1X1M U96 (.Y(n71), 
	.A(n73));
   DLY1X1M U97 (.Y(n72), 
	.A(test_se));
   DLY1X1M U98 (.Y(n73), 
	.A(n72));
   DLY1X1M U99 (.Y(n74), 
	.A(n68));
   DLY1X1M U100 (.Y(n75), 
	.A(n68));
   Clock_Divider_0_DW01_inc_0 add_24 (.A({ counter[7],
		counter[6],
		counter[5],
		counter[4],
		counter[3],
		counter[2],
		counter[1],
		n4 }), 
	.SUM({ N24,
		N23,
		N22,
		N21,
		N20,
		N19,
		N18,
		N17 }));
   SDFFRQX2M \counter_reg[1]  (.SI(counter[0]), 
	.SE(n69), 
	.RN(i_rst_n), 
	.Q(counter[1]), 
	.D(N46), 
	.CK(i_ref_clk));
   SDFFRQX2M \counter_reg[0]  (.SI(clk_div_reg__Exclude_0_NET), 
	.SE(n70), 
	.RN(i_rst_n), 
	.Q(counter[0]), 
	.D(N45), 
	.CK(i_ref_clk));
endmodule

module Clock_Divider_1_DW01_inc_0 (
	A, 
	SUM);
   input [7:0] A;
   output [7:0] SUM;

   // Internal wires
   wire [7:2] carry;

   ADDHX1M U1_1_6 (.S(SUM[6]), 
	.CO(carry[7]), 
	.B(carry[6]), 
	.A(A[6]));
   ADDHX1M U1_1_5 (.S(SUM[5]), 
	.CO(carry[6]), 
	.B(carry[5]), 
	.A(A[5]));
   ADDHX1M U1_1_4 (.S(SUM[4]), 
	.CO(carry[5]), 
	.B(carry[4]), 
	.A(A[4]));
   ADDHX1M U1_1_3 (.S(SUM[3]), 
	.CO(carry[4]), 
	.B(carry[3]), 
	.A(A[3]));
   ADDHX1M U1_1_2 (.S(SUM[2]), 
	.CO(carry[3]), 
	.B(carry[2]), 
	.A(A[2]));
   ADDHX1M U1_1_1 (.S(SUM[1]), 
	.CO(carry[2]), 
	.B(A[0]), 
	.A(A[1]));
   CLKXOR2X2M U1 (.Y(SUM[7]), 
	.B(A[7]), 
	.A(carry[7]));
endmodule

module Clock_Divider_test_1 (
	i_ref_clk, 
	i_clk_en, 
	i_rst_n, 
	i_div_ratio, 
	o_div_clk, 
	test_si, 
	test_so, 
	test_se, 
	UART_CLK_M__L1_N0, 
	UART_CLK_M__L6_N0);
   input i_ref_clk;
   input i_clk_en;
   input i_rst_n;
   input [7:0] i_div_ratio;
   output o_div_clk;
   input test_si;
   output test_so;
   input test_se;
   input UART_CLK_M__L1_N0;
   input UART_CLK_M__L6_N0;

   // Internal wires
   wire clk_div_reg__Exclude_0_NET;
   wire HTIE_LTIEHI_NET;
   wire FE_UNCONNECTED_0;
   wire clk_div_reg;
   wire N7;
   wire N8;
   wire N9;
   wire N10;
   wire N11;
   wire N12;
   wire N13;
   wire N14;
   wire N18;
   wire N19;
   wire N20;
   wire N21;
   wire N22;
   wire N23;
   wire N24;
   wire N25;
   wire N27;
   wire N28;
   wire N29;
   wire N30;
   wire N31;
   wire N32;
   wire N33;
   wire N45;
   wire N46;
   wire N47;
   wire N48;
   wire N49;
   wire N50;
   wire N51;
   wire N52;
   wire n1;
   wire n2;
   wire n5;
   wire n6;
   wire n16;
   wire n17;
   wire n24;
   wire n25;
   wire n26;
   wire n27;
   wire n28;
   wire n29;
   wire n30;
   wire n31;
   wire n32;
   wire n33;
   wire n34;
   wire n35;
   wire n36;
   wire n37;
   wire n38;
   wire n39;
   wire n40;
   wire n41;
   wire n42;
   wire n43;
   wire n44;
   wire n45;
   wire n46;
   wire n47;
   wire n48;
   wire n49;
   wire n50;
   wire n51;
   wire n52;
   wire n53;
   wire n54;
   wire n55;
   wire n56;
   wire n57;
   wire n58;
   wire n59;
   wire n60;
   wire n61;
   wire n62;
   wire n74;
   wire n75;
   wire n76;
   wire n77;
   wire n78;
   wire n79;
   wire n80;
   wire n81;
   wire [7:0] counter;

   assign test_so = counter[7] ;

   BUFX8M clk_div_reg__Exclude_0 (.Y(clk_div_reg__Exclude_0_NET), 
	.A(clk_div_reg));
   TIEHIM HTIE_LTIEHI (.Y(HTIE_LTIEHI_NET));
   SDFFRQX1M clk_div_reg_reg (.SI(test_si), 
	.SE(n77), 
	.RN(i_rst_n), 
	.Q(clk_div_reg), 
	.D(n57), 
	.CK(UART_CLK_M__L1_N0));
   SDFFRQX2M \counter_reg[7]  (.SI(counter[6]), 
	.SE(n77), 
	.RN(i_rst_n), 
	.Q(counter[7]), 
	.D(N52), 
	.CK(i_ref_clk));
   SDFFRQX2M \counter_reg[2]  (.SI(counter[1]), 
	.SE(n76), 
	.RN(i_rst_n), 
	.Q(counter[2]), 
	.D(N47), 
	.CK(i_ref_clk));
   SDFFRQX2M \counter_reg[6]  (.SI(counter[5]), 
	.SE(n75), 
	.RN(i_rst_n), 
	.Q(counter[6]), 
	.D(N51), 
	.CK(i_ref_clk));
   SDFFRQX2M \counter_reg[5]  (.SI(counter[4]), 
	.SE(n81), 
	.RN(i_rst_n), 
	.Q(counter[5]), 
	.D(N50), 
	.CK(i_ref_clk));
   SDFFRQX2M \counter_reg[4]  (.SI(counter[3]), 
	.SE(n76), 
	.RN(i_rst_n), 
	.Q(counter[4]), 
	.D(N49), 
	.CK(i_ref_clk));
   SDFFRQX2M \counter_reg[3]  (.SI(counter[2]), 
	.SE(n75), 
	.RN(i_rst_n), 
	.Q(counter[3]), 
	.D(N48), 
	.CK(i_ref_clk));
   SDFFRQX4M \counter_reg[0]  (.SI(clk_div_reg__Exclude_0_NET), 
	.SE(n80), 
	.RN(i_rst_n), 
	.Q(counter[0]), 
	.D(N45), 
	.CK(i_ref_clk));
   SDFFRQX4M \counter_reg[1]  (.SI(counter[0]), 
	.SE(n79), 
	.RN(i_rst_n), 
	.Q(counter[1]), 
	.D(N46), 
	.CK(i_ref_clk));
   NOR2X2M U12 (.Y(n17), 
	.B(i_div_ratio[4]), 
	.A(n16));
   NOR4X1M U16 (.Y(n58), 
	.D(i_div_ratio[4]), 
	.C(i_div_ratio[5]), 
	.B(i_div_ratio[6]), 
	.A(i_div_ratio[7]));
   NOR3X2M U17 (.Y(n52), 
	.C(counter[7]), 
	.B(N32), 
	.A(n46));
   NOR2X2M U18 (.Y(n44), 
	.B(N25), 
	.A(n55));
   OR2X2M U19 (.Y(n16), 
	.B(i_div_ratio[3]), 
	.A(n6));
   OR2X2M U20 (.Y(n6), 
	.B(i_div_ratio[2]), 
	.A(n5));
   OR2X2M U21 (.Y(n30), 
	.B(i_div_ratio[5]), 
	.A(n29));
   OR2X2M U22 (.Y(n28), 
	.B(i_div_ratio[3]), 
	.A(n27));
   OR2X2M U23 (.Y(n29), 
	.B(i_div_ratio[4]), 
	.A(n28));
   OAI2BB1XLM U24 (.Y(N29), 
	.B0(n30), 
	.A1N(i_div_ratio[5]), 
	.A0N(n29));
   OAI2BB1XLM U25 (.Y(N9), 
	.B0(n6), 
	.A1N(i_div_ratio[2]), 
	.A0N(n5));
   OAI2BB1XLM U26 (.Y(N10), 
	.B0(n16), 
	.A1N(i_div_ratio[3]), 
	.A0N(n6));
   OAI2BB1XLM U27 (.Y(N28), 
	.B0(n29), 
	.A1N(i_div_ratio[4]), 
	.A0N(n28));
   NOR2BX2M U28 (.Y(n33), 
	.B(counter[0]), 
	.AN(N7));
   NOR2BX2M U29 (.Y(n32), 
	.B(N7), 
	.AN(counter[0]));
   OAI2BB1XLM U30 (.Y(N27), 
	.B0(n28), 
	.A1N(i_div_ratio[3]), 
	.A0N(n27));
   CLKNAND2X2M U31 (.Y(n60), 
	.B(n2), 
	.A(n56));
   INVX2M U32 (.Y(n56), 
	.A(n61));
   OR2X2M U33 (.Y(n2), 
	.B(n42), 
	.A(n43));
   NOR2BX2M U34 (.Y(N46), 
	.B(n60), 
	.AN(N18));
   NOR2BX2M U35 (.Y(N47), 
	.B(n60), 
	.AN(N19));
   NOR2BX2M U36 (.Y(N48), 
	.B(n60), 
	.AN(N20));
   NOR2BX2M U37 (.Y(N49), 
	.B(n60), 
	.AN(N21));
   NOR2BX2M U38 (.Y(N50), 
	.B(n60), 
	.AN(N22));
   NOR2BX2M U39 (.Y(N51), 
	.B(n60), 
	.AN(N23));
   OR2X2M U42 (.Y(n5), 
	.B(i_div_ratio[0]), 
	.A(i_div_ratio[1]));
   NOR2BX2M U43 (.Y(N52), 
	.B(n60), 
	.AN(N24));
   NOR2BX2M U44 (.Y(N45), 
	.B(n60), 
	.AN(n55));
   AOI21X2M U45 (.Y(n57), 
	.B0(n61), 
	.A1(n62), 
	.A0(n2));
   NAND2BX2M U46 (.Y(n62), 
	.B(clk_div_reg__Exclude_0_NET), 
	.AN(N33));
   OR2X2M U47 (.Y(n27), 
	.B(i_div_ratio[1]), 
	.A(i_div_ratio[2]));
   INVX2M U48 (.Y(n26), 
	.A(i_div_ratio[5]));
   INVX2M U49 (.Y(n55), 
	.A(counter[0]));
   OAI2BB1X2M U50 (.Y(n61), 
	.B0(HTIE_LTIEHI_NET), 
	.A1N(n58), 
	.A0N(n59));
   MX2XLM U51 (.Y(o_div_clk), 
	.S0(n56), 
	.B(clk_div_reg), 
	.A(UART_CLK_M__L6_N0));
   CLKINVX1M U52 (.Y(N7), 
	.A(i_div_ratio[0]));
   OAI2BB1X1M U53 (.Y(N8), 
	.B0(n5), 
	.A1N(i_div_ratio[1]), 
	.A0N(i_div_ratio[0]));
   AO21XLM U54 (.Y(N11), 
	.B0(n17), 
	.A1(i_div_ratio[4]), 
	.A0(n16));
   CLKNAND2X2M U55 (.Y(n24), 
	.B(n26), 
	.A(n17));
   OAI21X1M U56 (.Y(N12), 
	.B0(n24), 
	.A1(n26), 
	.A0(n17));
   XNOR2X1M U57 (.Y(N13), 
	.B(n24), 
	.A(i_div_ratio[6]));
   NOR2X1M U58 (.Y(n25), 
	.B(n24), 
	.A(i_div_ratio[6]));
   CLKINVX1M U60 (.Y(N25), 
	.A(i_div_ratio[1]));
   XNOR2X1M U61 (.Y(N30), 
	.B(n30), 
	.A(i_div_ratio[6]));
   OAI21X1M U62 (.Y(n31), 
	.B0(i_div_ratio[7]), 
	.A1(n30), 
	.A0(i_div_ratio[6]));
   NAND2BX1M U63 (.Y(N31), 
	.B(n31), 
	.AN(N32));
   XNOR2X1M U64 (.Y(n37), 
	.B(counter[2]), 
	.A(N9));
   XNOR2X1M U65 (.Y(n36), 
	.B(counter[7]), 
	.A(N14));
   OAI2B2X1M U66 (.Y(n35), 
	.B1(n32), 
	.B0(counter[1]), 
	.A1N(N8), 
	.A0(n32));
   OAI2B2X1M U67 (.Y(n34), 
	.B1(n33), 
	.B0(N8), 
	.A1N(counter[1]), 
	.A0(n33));
   NAND4X1M U68 (.Y(n43), 
	.D(n34), 
	.C(n35), 
	.B(n36), 
	.A(n37));
   XNOR2X1M U69 (.Y(n41), 
	.B(counter[6]), 
	.A(N13));
   XNOR2X1M U70 (.Y(n40), 
	.B(counter[5]), 
	.A(N12));
   XNOR2X1M U71 (.Y(n39), 
	.B(counter[4]), 
	.A(N11));
   XNOR2X1M U72 (.Y(n38), 
	.B(counter[3]), 
	.A(N10));
   NAND4X1M U73 (.Y(n42), 
	.D(n38), 
	.C(n39), 
	.B(n40), 
	.A(n41));
   XNOR2X1M U74 (.Y(n54), 
	.B(counter[2]), 
	.A(N27));
   OAI22X1M U75 (.Y(n53), 
	.B1(n1), 
	.B0(n44), 
	.A1(n44), 
	.A0(counter[1]));
   CLKNAND2X2M U76 (.Y(n45), 
	.B(n55), 
	.A(N25));
   AOI22X1M U77 (.Y(n46), 
	.B1(counter[1]), 
	.B0(n45), 
	.A1(n1), 
	.A0(n45));
   CLKXOR2X2M U78 (.Y(n50), 
	.B(counter[3]), 
	.A(N28));
   CLKXOR2X2M U79 (.Y(n49), 
	.B(counter[4]), 
	.A(N29));
   CLKXOR2X2M U80 (.Y(n48), 
	.B(counter[5]), 
	.A(N30));
   CLKXOR2X2M U81 (.Y(n47), 
	.B(counter[6]), 
	.A(N31));
   NOR4X1M U82 (.Y(n51), 
	.D(n47), 
	.C(n48), 
	.B(n49), 
	.A(n50));
   AND4X1M U83 (.Y(N33), 
	.D(n51), 
	.C(n52), 
	.B(n53), 
	.A(n54));
   DLY1X1M U84 (.Y(n74), 
	.A(n78));
   DLY1X1M U85 (.Y(n75), 
	.A(n79));
   DLY1X1M U86 (.Y(n76), 
	.A(n80));
   DLY1X1M U87 (.Y(n77), 
	.A(n81));
   DLY1X1M U88 (.Y(n78), 
	.A(test_se));
   DLY1X1M U89 (.Y(n79), 
	.A(n74));
   DLY1X1M U90 (.Y(n80), 
	.A(n74));
   DLY1X1M U91 (.Y(n81), 
	.A(n78));
   Clock_Divider_1_DW01_inc_0 add_24 (.A({ counter[7],
		counter[6],
		counter[5],
		counter[4],
		counter[3],
		counter[2],
		counter[1],
		counter[0] }), 
	.SUM({ N24,
		N23,
		N22,
		N21,
		N20,
		N19,
		N18,
		FE_UNCONNECTED_0 }));
   NOR3X2M U3 (.Y(N32), 
	.C(n30), 
	.B(i_div_ratio[7]), 
	.A(i_div_ratio[6]));
   XOR2X2M U4 (.Y(N14), 
	.B(n25), 
	.A(i_div_ratio[7]));
   NOR3X2M U5 (.Y(n59), 
	.C(i_div_ratio[2]), 
	.B(i_div_ratio[3]), 
	.A(i_div_ratio[1]));
   AOI21BX1M U6 (.Y(n1), 
	.B0N(n27), 
	.A1(i_div_ratio[2]), 
	.A0(i_div_ratio[1]));
endmodule

module Clock_Gating (
	CLK_en, 
	test_mode, 
	clk, 
	Gated_CLK);
   input CLK_en;
   input test_mode;
   input clk;
   output Gated_CLK;

   // Internal wires
   wire _0_net_;

   TLATNCAX12M U0_TLATNCAX12M (.ECK(Gated_CLK), 
	.E(_0_net_), 
	.CK(clk));
   OR2X2M U1 (.Y(_0_net_), 
	.B(test_mode), 
	.A(CLK_en));
endmodule

module register_file_test_1 (
	WR_Data, 
	address, 
	WR_en, 
	RD_en, 
	clk, 
	rst, 
	RD_Valid, 
	RD_Data, 
	REG0, 
	REG1, 
	REG2, 
	REG3, 
	test_si3, 
	test_si2, 
	test_si1, 
	test_so3, 
	test_so2, 
	test_so1, 
	test_se, 
	FE_OFN0_RST_Domain_1_M, 
	FE_OFN1_RST_Domain_1_M, 
	FE_OFN2_RST_Domain_1_M, 
	REF_CLK_M__L8_N11, 
	REF_CLK_M__L8_N12, 
	REF_CLK_M__L8_N4, 
	REF_CLK_M__L8_N6, 
	REF_CLK_M__L8_N7, 
	REF_CLK_M__L8_N8, 
	REF_CLK_M__L8_N9);
   input [7:0] WR_Data;
   input [3:0] address;
   input WR_en;
   input RD_en;
   input clk;
   input rst;
   output RD_Valid;
   output [7:0] RD_Data;
   output [7:0] REG0;
   output [7:0] REG1;
   output [7:0] REG2;
   output [7:0] REG3;
   input test_si3;
   input test_si2;
   input test_si1;
   output test_so3;
   output test_so2;
   output test_so1;
   input test_se;
   input FE_OFN0_RST_Domain_1_M;
   input FE_OFN1_RST_Domain_1_M;
   input FE_OFN2_RST_Domain_1_M;
   input REF_CLK_M__L8_N11;
   input REF_CLK_M__L8_N12;
   input REF_CLK_M__L8_N4;
   input REF_CLK_M__L8_N6;
   input REF_CLK_M__L8_N7;
   input REF_CLK_M__L8_N8;
   input REF_CLK_M__L8_N9;

   // Internal wires
   wire N11;
   wire N12;
   wire N13;
   wire N14;
   wire n546;
   wire n547;
   wire n548;
   wire n549;
   wire n550;
   wire n551;
   wire n552;
   wire n553;
   wire n554;
   wire n555;
   wire n556;
   wire n557;
   wire n558;
   wire n559;
   wire n560;
   wire n561;
   wire n563;
   wire n565;
   wire n566;
   wire n3;
   wire \reg_file[15][7] ;
   wire \reg_file[15][6] ;
   wire \reg_file[15][5] ;
   wire \reg_file[15][4] ;
   wire \reg_file[15][3] ;
   wire \reg_file[15][2] ;
   wire \reg_file[15][1] ;
   wire \reg_file[15][0] ;
   wire \reg_file[14][7] ;
   wire \reg_file[14][6] ;
   wire \reg_file[14][5] ;
   wire \reg_file[14][4] ;
   wire \reg_file[14][3] ;
   wire \reg_file[14][2] ;
   wire \reg_file[14][1] ;
   wire \reg_file[14][0] ;
   wire \reg_file[13][7] ;
   wire \reg_file[13][6] ;
   wire \reg_file[13][5] ;
   wire \reg_file[13][4] ;
   wire \reg_file[13][3] ;
   wire \reg_file[13][2] ;
   wire \reg_file[13][1] ;
   wire \reg_file[13][0] ;
   wire \reg_file[12][7] ;
   wire \reg_file[12][6] ;
   wire \reg_file[12][5] ;
   wire \reg_file[12][4] ;
   wire \reg_file[12][3] ;
   wire \reg_file[12][2] ;
   wire \reg_file[12][1] ;
   wire \reg_file[12][0] ;
   wire \reg_file[11][7] ;
   wire \reg_file[11][6] ;
   wire \reg_file[11][5] ;
   wire \reg_file[11][4] ;
   wire \reg_file[11][3] ;
   wire \reg_file[11][2] ;
   wire \reg_file[11][1] ;
   wire \reg_file[11][0] ;
   wire \reg_file[10][7] ;
   wire \reg_file[10][6] ;
   wire \reg_file[10][5] ;
   wire \reg_file[10][4] ;
   wire \reg_file[10][3] ;
   wire \reg_file[10][2] ;
   wire \reg_file[10][1] ;
   wire \reg_file[10][0] ;
   wire \reg_file[9][7] ;
   wire \reg_file[9][6] ;
   wire \reg_file[9][5] ;
   wire \reg_file[9][4] ;
   wire \reg_file[9][3] ;
   wire \reg_file[9][2] ;
   wire \reg_file[9][1] ;
   wire \reg_file[9][0] ;
   wire \reg_file[8][7] ;
   wire \reg_file[8][6] ;
   wire \reg_file[8][5] ;
   wire \reg_file[8][4] ;
   wire \reg_file[8][3] ;
   wire \reg_file[8][2] ;
   wire \reg_file[8][1] ;
   wire \reg_file[8][0] ;
   wire \reg_file[7][7] ;
   wire \reg_file[7][6] ;
   wire \reg_file[7][5] ;
   wire \reg_file[7][4] ;
   wire \reg_file[7][3] ;
   wire \reg_file[7][2] ;
   wire \reg_file[7][1] ;
   wire \reg_file[7][0] ;
   wire \reg_file[6][7] ;
   wire \reg_file[6][6] ;
   wire \reg_file[6][5] ;
   wire \reg_file[6][4] ;
   wire \reg_file[6][3] ;
   wire \reg_file[6][2] ;
   wire \reg_file[6][1] ;
   wire \reg_file[6][0] ;
   wire \reg_file[5][7] ;
   wire \reg_file[5][6] ;
   wire \reg_file[5][5] ;
   wire \reg_file[5][4] ;
   wire \reg_file[5][3] ;
   wire \reg_file[5][2] ;
   wire \reg_file[5][1] ;
   wire \reg_file[5][0] ;
   wire \reg_file[4][7] ;
   wire \reg_file[4][6] ;
   wire \reg_file[4][5] ;
   wire \reg_file[4][4] ;
   wire \reg_file[4][3] ;
   wire \reg_file[4][2] ;
   wire \reg_file[4][1] ;
   wire \reg_file[4][0] ;
   wire N36;
   wire N37;
   wire N38;
   wire N39;
   wire N40;
   wire N41;
   wire N42;
   wire N43;
   wire N61;
   wire n149;
   wire n150;
   wire n151;
   wire n152;
   wire n153;
   wire n154;
   wire n155;
   wire n156;
   wire n157;
   wire n158;
   wire n159;
   wire n160;
   wire n161;
   wire n162;
   wire n163;
   wire n164;
   wire n165;
   wire n166;
   wire n167;
   wire n168;
   wire n169;
   wire n170;
   wire n171;
   wire n172;
   wire n173;
   wire n174;
   wire n175;
   wire n176;
   wire n177;
   wire n178;
   wire n179;
   wire n180;
   wire n181;
   wire n182;
   wire n183;
   wire n184;
   wire n185;
   wire n186;
   wire n187;
   wire n188;
   wire n189;
   wire n190;
   wire n191;
   wire n192;
   wire n193;
   wire n194;
   wire n195;
   wire n196;
   wire n197;
   wire n198;
   wire n199;
   wire n200;
   wire n201;
   wire n202;
   wire n203;
   wire n204;
   wire n205;
   wire n206;
   wire n207;
   wire n208;
   wire n209;
   wire n210;
   wire n211;
   wire n212;
   wire n213;
   wire n214;
   wire n215;
   wire n216;
   wire n217;
   wire n218;
   wire n219;
   wire n220;
   wire n221;
   wire n222;
   wire n223;
   wire n224;
   wire n225;
   wire n226;
   wire n227;
   wire n228;
   wire n229;
   wire n230;
   wire n231;
   wire n232;
   wire n233;
   wire n234;
   wire n235;
   wire n236;
   wire n237;
   wire n238;
   wire n239;
   wire n240;
   wire n241;
   wire n242;
   wire n243;
   wire n244;
   wire n245;
   wire n246;
   wire n247;
   wire n248;
   wire n249;
   wire n250;
   wire n251;
   wire n252;
   wire n253;
   wire n254;
   wire n255;
   wire n256;
   wire n257;
   wire n258;
   wire n259;
   wire n260;
   wire n261;
   wire n262;
   wire n263;
   wire n264;
   wire n265;
   wire n266;
   wire n267;
   wire n268;
   wire n269;
   wire n270;
   wire n271;
   wire n272;
   wire n273;
   wire n274;
   wire n275;
   wire n276;
   wire n277;
   wire n278;
   wire n279;
   wire n280;
   wire n281;
   wire n282;
   wire n283;
   wire n284;
   wire n285;
   wire n286;
   wire n287;
   wire n288;
   wire n289;
   wire n290;
   wire n291;
   wire n292;
   wire n293;
   wire n294;
   wire n295;
   wire n296;
   wire n297;
   wire n298;
   wire n299;
   wire n300;
   wire n301;
   wire n302;
   wire n303;
   wire n304;
   wire n305;
   wire n306;
   wire n307;
   wire n308;
   wire n309;
   wire n310;
   wire n311;
   wire n138;
   wire n140;
   wire n142;
   wire n144;
   wire n146;
   wire n148;
   wire n313;
   wire n315;
   wire n317;
   wire n319;
   wire n321;
   wire n323;
   wire n325;
   wire n327;
   wire n329;
   wire n331;
   wire n333;
   wire n335;
   wire n365;
   wire n366;
   wire n367;
   wire n368;
   wire n369;
   wire n370;
   wire n371;
   wire n372;
   wire n373;
   wire n374;
   wire n375;
   wire n376;
   wire n377;
   wire n378;
   wire n379;
   wire n380;
   wire n381;
   wire n382;
   wire n383;
   wire n384;
   wire n385;
   wire n386;
   wire n387;
   wire n388;
   wire n389;
   wire n390;
   wire n391;
   wire n392;
   wire n393;
   wire n394;
   wire n395;
   wire n396;
   wire n397;
   wire n398;
   wire n399;
   wire n400;
   wire n401;
   wire n402;
   wire n403;
   wire n404;
   wire n405;
   wire n406;
   wire n407;
   wire n408;
   wire n409;
   wire n410;
   wire n411;
   wire n412;
   wire n413;
   wire n414;
   wire n415;
   wire n416;
   wire n417;
   wire n418;
   wire n419;
   wire n420;
   wire n421;
   wire n422;
   wire n423;
   wire n424;
   wire n425;
   wire n426;
   wire n427;
   wire n428;
   wire n429;
   wire n430;
   wire n431;
   wire n432;
   wire n433;
   wire n434;
   wire n435;
   wire n436;
   wire n437;
   wire n438;
   wire n439;
   wire n440;
   wire n441;
   wire n442;
   wire n443;
   wire n444;
   wire n445;
   wire n446;
   wire n447;
   wire n448;
   wire n449;
   wire n450;
   wire n451;
   wire n452;
   wire n453;
   wire n454;
   wire n455;
   wire n456;
   wire n457;
   wire n458;
   wire n459;
   wire n460;
   wire n461;
   wire n462;
   wire n463;
   wire n464;
   wire n465;
   wire n466;
   wire n467;
   wire n468;
   wire n469;
   wire n470;
   wire n471;
   wire n472;
   wire n473;
   wire n536;
   wire n537;
   wire n538;
   wire n539;
   wire n540;
   wire n541;
   wire n542;
   wire n543;
   wire n544;
   wire n545;
   wire n571;
   wire n572;
   wire n573;
   wire n574;
   wire n575;
   wire n576;
   wire n577;
   wire n578;
   wire n579;
   wire n580;
   wire n581;
   wire n582;
   wire n583;
   wire n584;
   wire n585;
   wire n586;
   wire n587;
   wire n588;
   wire n589;
   wire n590;
   wire n591;
   wire n592;
   wire n593;
   wire n594;
   wire n595;
   wire n596;
   wire n597;
   wire n598;
   wire n599;
   wire n600;
   wire n601;
   wire n602;
   wire n603;
   wire n604;
   wire n605;
   wire n606;
   wire n607;
   wire n608;
   wire n609;
   wire n610;
   wire n611;
   wire n612;
   wire n613;
   wire n614;
   wire n615;
   wire n616;
   wire n617;
   wire n618;
   wire n619;
   wire n620;
   wire n621;
   wire n622;
   wire n623;
   wire n624;
   wire n625;
   wire n626;
   wire n627;
   wire n628;
   wire n629;
   wire n630;
   wire n631;
   wire n632;
   wire n633;
   wire n634;
   wire n635;
   wire n636;
   wire n637;
   wire n638;
   wire n639;
   wire n640;
   wire n641;
   wire n642;
   wire n643;
   wire n644;
   wire n645;
   wire n646;
   wire n647;
   wire n648;
   wire n649;
   wire n650;
   wire n651;
   wire n652;
   wire n653;
   wire n654;
   wire n655;
   wire n656;
   wire n657;
   wire n658;
   wire n659;
   wire n660;
   wire n661;
   wire n662;
   wire n663;
   wire n664;
   wire n665;
   wire n666;
   wire n667;
   wire n668;
   wire n669;
   wire n670;
   wire n671;
   wire n672;
   wire n673;
   wire n674;
   wire n675;
   wire n676;
   wire n677;
   wire n678;
   wire n679;
   wire n680;
   wire n681;
   wire n682;
   wire n683;
   wire n684;
   wire n685;
   wire n686;
   wire n687;
   wire n688;
   wire n689;
   wire n690;
   wire n691;
   wire n692;
   wire n693;
   wire n694;
   wire n695;
   wire n696;
   wire n697;
   wire n698;
   wire n699;
   wire n700;
   wire n701;
   wire n702;
   wire n703;
   wire n704;
   wire n705;
   wire n706;
   wire n707;
   wire n708;
   wire n1;

   assign N11 = address[0] ;
   assign N12 = address[1] ;
   assign N13 = address[2] ;
   assign N14 = address[3] ;
   assign test_so1 = n557 ;
   assign test_so3 = \reg_file[15][7]  ;
   assign test_so2 = \reg_file[13][2]  ;

   SDFFRQX2M \RD_Data_reg[7]  (.SI(RD_Data[6]), 
	.SE(n637), 
	.RN(FE_OFN0_RST_Domain_1_M), 
	.Q(RD_Data[7]), 
	.D(n311), 
	.CK(REF_CLK_M__L8_N6));
   SDFFRQX2M \RD_Data_reg[6]  (.SI(RD_Data[5]), 
	.SE(n637), 
	.RN(FE_OFN0_RST_Domain_1_M), 
	.Q(RD_Data[6]), 
	.D(n310), 
	.CK(REF_CLK_M__L8_N6));
   SDFFRQX2M \RD_Data_reg[5]  (.SI(RD_Data[4]), 
	.SE(n696), 
	.RN(FE_OFN0_RST_Domain_1_M), 
	.Q(RD_Data[5]), 
	.D(n309), 
	.CK(REF_CLK_M__L8_N4));
   SDFFRQX2M \RD_Data_reg[4]  (.SI(RD_Data[3]), 
	.SE(n618), 
	.RN(FE_OFN0_RST_Domain_1_M), 
	.Q(RD_Data[4]), 
	.D(n308), 
	.CK(REF_CLK_M__L8_N4));
   SDFFRQX2M \RD_Data_reg[3]  (.SI(RD_Data[2]), 
	.SE(n618), 
	.RN(FE_OFN0_RST_Domain_1_M), 
	.Q(RD_Data[3]), 
	.D(n307), 
	.CK(REF_CLK_M__L8_N4));
   SDFFRQX2M \RD_Data_reg[2]  (.SI(RD_Data[1]), 
	.SE(n617), 
	.RN(FE_OFN0_RST_Domain_1_M), 
	.Q(RD_Data[2]), 
	.D(n306), 
	.CK(REF_CLK_M__L8_N6));
   SDFFRQX2M \RD_Data_reg[1]  (.SI(RD_Data[0]), 
	.SE(n617), 
	.RN(FE_OFN0_RST_Domain_1_M), 
	.Q(RD_Data[1]), 
	.D(n305), 
	.CK(REF_CLK_M__L8_N6));
   SDFFRQX2M \RD_Data_reg[0]  (.SI(test_si1), 
	.SE(n636), 
	.RN(FE_OFN0_RST_Domain_1_M), 
	.Q(RD_Data[0]), 
	.D(n304), 
	.CK(REF_CLK_M__L8_N7));
   SDFFRQX2M RD_Valid_reg (.SI(RD_Data[7]), 
	.SE(n636), 
	.RN(FE_OFN0_RST_Domain_1_M), 
	.Q(RD_Valid), 
	.D(N61), 
	.CK(REF_CLK_M__L8_N7));
   SDFFRQX2M \reg_file_reg[15][7]  (.SI(\reg_file[15][6] ), 
	.SE(n693), 
	.RN(FE_OFN0_RST_Domain_1_M), 
	.Q(\reg_file[15][7] ), 
	.D(n303), 
	.CK(REF_CLK_M__L8_N11));
   SDFFRQX2M \reg_file_reg[15][6]  (.SI(\reg_file[15][5] ), 
	.SE(n616), 
	.RN(FE_OFN0_RST_Domain_1_M), 
	.Q(\reg_file[15][6] ), 
	.D(n302), 
	.CK(REF_CLK_M__L8_N7));
   SDFFRQX2M \reg_file_reg[15][5]  (.SI(\reg_file[15][4] ), 
	.SE(n616), 
	.RN(FE_OFN0_RST_Domain_1_M), 
	.Q(\reg_file[15][5] ), 
	.D(n301), 
	.CK(REF_CLK_M__L8_N7));
   SDFFRQX2M \reg_file_reg[15][4]  (.SI(\reg_file[15][3] ), 
	.SE(n615), 
	.RN(FE_OFN0_RST_Domain_1_M), 
	.Q(\reg_file[15][4] ), 
	.D(n300), 
	.CK(REF_CLK_M__L8_N7));
   SDFFRQX2M \reg_file_reg[15][3]  (.SI(\reg_file[15][2] ), 
	.SE(n615), 
	.RN(FE_OFN0_RST_Domain_1_M), 
	.Q(\reg_file[15][3] ), 
	.D(n299), 
	.CK(REF_CLK_M__L8_N7));
   SDFFRQX2M \reg_file_reg[15][2]  (.SI(\reg_file[15][1] ), 
	.SE(n635), 
	.RN(FE_OFN0_RST_Domain_1_M), 
	.Q(\reg_file[15][2] ), 
	.D(n298), 
	.CK(REF_CLK_M__L8_N7));
   SDFFRQX2M \reg_file_reg[15][1]  (.SI(\reg_file[15][0] ), 
	.SE(n635), 
	.RN(FE_OFN0_RST_Domain_1_M), 
	.Q(\reg_file[15][1] ), 
	.D(n297), 
	.CK(REF_CLK_M__L8_N7));
   SDFFRQX2M \reg_file_reg[15][0]  (.SI(\reg_file[14][7] ), 
	.SE(n690), 
	.RN(FE_OFN0_RST_Domain_1_M), 
	.Q(\reg_file[15][0] ), 
	.D(n296), 
	.CK(REF_CLK_M__L8_N7));
   SDFFRQX2M \reg_file_reg[13][7]  (.SI(\reg_file[13][6] ), 
	.SE(n614), 
	.RN(FE_OFN0_RST_Domain_1_M), 
	.Q(\reg_file[13][7] ), 
	.D(n287), 
	.CK(REF_CLK_M__L8_N7));
   SDFFRQX2M \reg_file_reg[13][6]  (.SI(\reg_file[13][5] ), 
	.SE(n614), 
	.RN(FE_OFN0_RST_Domain_1_M), 
	.Q(\reg_file[13][6] ), 
	.D(n286), 
	.CK(REF_CLK_M__L8_N7));
   SDFFRQX2M \reg_file_reg[13][5]  (.SI(\reg_file[13][4] ), 
	.SE(n613), 
	.RN(FE_OFN0_RST_Domain_1_M), 
	.Q(\reg_file[13][5] ), 
	.D(n285), 
	.CK(REF_CLK_M__L8_N4));
   SDFFRQX2M \reg_file_reg[13][4]  (.SI(\reg_file[13][3] ), 
	.SE(n613), 
	.RN(FE_OFN0_RST_Domain_1_M), 
	.Q(\reg_file[13][4] ), 
	.D(n284), 
	.CK(REF_CLK_M__L8_N4));
   SDFFRQX2M \reg_file_reg[13][3]  (.SI(test_si3), 
	.SE(n634), 
	.RN(FE_OFN0_RST_Domain_1_M), 
	.Q(\reg_file[13][3] ), 
	.D(n283), 
	.CK(REF_CLK_M__L8_N4));
   SDFFRQX2M \reg_file_reg[13][1]  (.SI(\reg_file[13][0] ), 
	.SE(n687), 
	.RN(FE_OFN2_RST_Domain_1_M), 
	.Q(\reg_file[13][1] ), 
	.D(n281), 
	.CK(REF_CLK_M__L8_N4));
   SDFFRQX2M \reg_file_reg[13][0]  (.SI(\reg_file[12][7] ), 
	.SE(n612), 
	.RN(FE_OFN2_RST_Domain_1_M), 
	.Q(\reg_file[13][0] ), 
	.D(n280), 
	.CK(REF_CLK_M__L8_N4));
   SDFFRQX2M \reg_file_reg[11][7]  (.SI(\reg_file[11][6] ), 
	.SE(n612), 
	.RN(FE_OFN2_RST_Domain_1_M), 
	.Q(\reg_file[11][7] ), 
	.D(n271), 
	.CK(REF_CLK_M__L8_N4));
   SDFFRQX2M \reg_file_reg[11][6]  (.SI(\reg_file[11][5] ), 
	.SE(n611), 
	.RN(FE_OFN0_RST_Domain_1_M), 
	.Q(\reg_file[11][6] ), 
	.D(n270), 
	.CK(REF_CLK_M__L8_N4));
   SDFFRQX2M \reg_file_reg[11][5]  (.SI(\reg_file[11][4] ), 
	.SE(n611), 
	.RN(FE_OFN0_RST_Domain_1_M), 
	.Q(\reg_file[11][5] ), 
	.D(n269), 
	.CK(REF_CLK_M__L8_N8));
   SDFFRQX2M \reg_file_reg[11][4]  (.SI(\reg_file[11][3] ), 
	.SE(n633), 
	.RN(FE_OFN2_RST_Domain_1_M), 
	.Q(\reg_file[11][4] ), 
	.D(n268), 
	.CK(REF_CLK_M__L8_N8));
   SDFFRQX2M \reg_file_reg[11][3]  (.SI(\reg_file[11][2] ), 
	.SE(n633), 
	.RN(FE_OFN2_RST_Domain_1_M), 
	.Q(\reg_file[11][3] ), 
	.D(n267), 
	.CK(REF_CLK_M__L8_N8));
   SDFFRQX2M \reg_file_reg[11][2]  (.SI(\reg_file[11][1] ), 
	.SE(n684), 
	.RN(FE_OFN2_RST_Domain_1_M), 
	.Q(\reg_file[11][2] ), 
	.D(n266), 
	.CK(REF_CLK_M__L8_N8));
   SDFFRQX2M \reg_file_reg[11][1]  (.SI(\reg_file[11][0] ), 
	.SE(n610), 
	.RN(FE_OFN2_RST_Domain_1_M), 
	.Q(\reg_file[11][1] ), 
	.D(n265), 
	.CK(REF_CLK_M__L8_N8));
   SDFFRQX2M \reg_file_reg[11][0]  (.SI(\reg_file[10][7] ), 
	.SE(n610), 
	.RN(FE_OFN2_RST_Domain_1_M), 
	.Q(\reg_file[11][0] ), 
	.D(n264), 
	.CK(REF_CLK_M__L8_N8));
   SDFFRQX2M \reg_file_reg[9][7]  (.SI(\reg_file[9][6] ), 
	.SE(n609), 
	.RN(FE_OFN0_RST_Domain_1_M), 
	.Q(\reg_file[9][7] ), 
	.D(n255), 
	.CK(REF_CLK_M__L8_N8));
   SDFFRQX2M \reg_file_reg[9][6]  (.SI(\reg_file[9][5] ), 
	.SE(n609), 
	.RN(rst), 
	.Q(\reg_file[9][6] ), 
	.D(n254), 
	.CK(REF_CLK_M__L8_N8));
   SDFFRQX2M \reg_file_reg[9][5]  (.SI(\reg_file[9][4] ), 
	.SE(n632), 
	.RN(rst), 
	.Q(\reg_file[9][5] ), 
	.D(n253), 
	.CK(REF_CLK_M__L8_N8));
   SDFFRQX2M \reg_file_reg[9][4]  (.SI(\reg_file[9][3] ), 
	.SE(n632), 
	.RN(rst), 
	.Q(\reg_file[9][4] ), 
	.D(n252), 
	.CK(REF_CLK_M__L8_N8));
   SDFFRQX2M \reg_file_reg[9][3]  (.SI(\reg_file[9][2] ), 
	.SE(n681), 
	.RN(rst), 
	.Q(\reg_file[9][3] ), 
	.D(n251), 
	.CK(REF_CLK_M__L8_N9));
   SDFFRQX2M \reg_file_reg[9][2]  (.SI(\reg_file[9][1] ), 
	.SE(n608), 
	.RN(rst), 
	.Q(\reg_file[9][2] ), 
	.D(n250), 
	.CK(REF_CLK_M__L8_N8));
   SDFFRQX2M \reg_file_reg[9][1]  (.SI(\reg_file[9][0] ), 
	.SE(n608), 
	.RN(rst), 
	.Q(\reg_file[9][1] ), 
	.D(n249), 
	.CK(clk));
   SDFFRQX2M \reg_file_reg[9][0]  (.SI(\reg_file[8][7] ), 
	.SE(n607), 
	.RN(rst), 
	.Q(\reg_file[9][0] ), 
	.D(n248), 
	.CK(clk));
   SDFFRQX2M \reg_file_reg[7][7]  (.SI(\reg_file[7][6] ), 
	.SE(n607), 
	.RN(rst), 
	.Q(\reg_file[7][7] ), 
	.D(n239), 
	.CK(clk));
   SDFFRQX2M \reg_file_reg[7][6]  (.SI(\reg_file[7][5] ), 
	.SE(n631), 
	.RN(rst), 
	.Q(\reg_file[7][6] ), 
	.D(n238), 
	.CK(REF_CLK_M__L8_N9));
   SDFFRQX2M \reg_file_reg[7][5]  (.SI(\reg_file[7][4] ), 
	.SE(n631), 
	.RN(rst), 
	.Q(\reg_file[7][5] ), 
	.D(n237), 
	.CK(REF_CLK_M__L8_N9));
   SDFFRQX2M \reg_file_reg[7][4]  (.SI(\reg_file[7][3] ), 
	.SE(n678), 
	.RN(rst), 
	.Q(\reg_file[7][4] ), 
	.D(n236), 
	.CK(REF_CLK_M__L8_N9));
   SDFFRQX2M \reg_file_reg[7][3]  (.SI(\reg_file[7][2] ), 
	.SE(n606), 
	.RN(rst), 
	.Q(\reg_file[7][3] ), 
	.D(n235), 
	.CK(REF_CLK_M__L8_N9));
   SDFFRQX2M \reg_file_reg[7][2]  (.SI(\reg_file[7][1] ), 
	.SE(n606), 
	.RN(rst), 
	.Q(\reg_file[7][2] ), 
	.D(n234), 
	.CK(REF_CLK_M__L8_N9));
   SDFFRQX2M \reg_file_reg[7][1]  (.SI(\reg_file[7][0] ), 
	.SE(n605), 
	.RN(rst), 
	.Q(\reg_file[7][1] ), 
	.D(n233), 
	.CK(REF_CLK_M__L8_N9));
   SDFFRQX2M \reg_file_reg[7][0]  (.SI(\reg_file[6][7] ), 
	.SE(n605), 
	.RN(rst), 
	.Q(\reg_file[7][0] ), 
	.D(n232), 
	.CK(REF_CLK_M__L8_N9));
   SDFFRQX2M \reg_file_reg[5][7]  (.SI(\reg_file[5][6] ), 
	.SE(n630), 
	.RN(rst), 
	.Q(\reg_file[5][7] ), 
	.D(n223), 
	.CK(REF_CLK_M__L8_N9));
   SDFFRQX2M \reg_file_reg[5][6]  (.SI(\reg_file[5][5] ), 
	.SE(n630), 
	.RN(rst), 
	.Q(\reg_file[5][6] ), 
	.D(n222), 
	.CK(REF_CLK_M__L8_N9));
   SDFFRQX2M \reg_file_reg[5][5]  (.SI(\reg_file[5][4] ), 
	.SE(n675), 
	.RN(rst), 
	.Q(\reg_file[5][5] ), 
	.D(n221), 
	.CK(REF_CLK_M__L8_N9));
   SDFFRQX2M \reg_file_reg[5][4]  (.SI(\reg_file[5][3] ), 
	.SE(n604), 
	.RN(rst), 
	.Q(\reg_file[5][4] ), 
	.D(n220), 
	.CK(clk));
   SDFFRQX2M \reg_file_reg[5][3]  (.SI(\reg_file[5][2] ), 
	.SE(n604), 
	.RN(rst), 
	.Q(\reg_file[5][3] ), 
	.D(n219), 
	.CK(clk));
   SDFFRQX2M \reg_file_reg[5][2]  (.SI(\reg_file[5][1] ), 
	.SE(n603), 
	.RN(rst), 
	.Q(\reg_file[5][2] ), 
	.D(n218), 
	.CK(REF_CLK_M__L8_N12));
   SDFFRQX2M \reg_file_reg[5][1]  (.SI(\reg_file[5][0] ), 
	.SE(n603), 
	.RN(rst), 
	.Q(\reg_file[5][1] ), 
	.D(n217), 
	.CK(REF_CLK_M__L8_N12));
   SDFFRQX2M \reg_file_reg[5][0]  (.SI(\reg_file[4][7] ), 
	.SE(n629), 
	.RN(rst), 
	.Q(\reg_file[5][0] ), 
	.D(n216), 
	.CK(REF_CLK_M__L8_N12));
   SDFFRQX2M \reg_file_reg[14][7]  (.SI(\reg_file[14][6] ), 
	.SE(n629), 
	.RN(FE_OFN0_RST_Domain_1_M), 
	.Q(\reg_file[14][7] ), 
	.D(n295), 
	.CK(REF_CLK_M__L8_N7));
   SDFFRQX2M \reg_file_reg[14][6]  (.SI(\reg_file[14][5] ), 
	.SE(n672), 
	.RN(FE_OFN0_RST_Domain_1_M), 
	.Q(\reg_file[14][6] ), 
	.D(n294), 
	.CK(REF_CLK_M__L8_N7));
   SDFFRQX2M \reg_file_reg[14][5]  (.SI(\reg_file[14][4] ), 
	.SE(n602), 
	.RN(FE_OFN0_RST_Domain_1_M), 
	.Q(\reg_file[14][5] ), 
	.D(n293), 
	.CK(REF_CLK_M__L8_N7));
   SDFFRQX2M \reg_file_reg[14][4]  (.SI(\reg_file[14][3] ), 
	.SE(n602), 
	.RN(FE_OFN0_RST_Domain_1_M), 
	.Q(\reg_file[14][4] ), 
	.D(n292), 
	.CK(REF_CLK_M__L8_N7));
   SDFFRQX2M \reg_file_reg[14][3]  (.SI(\reg_file[14][2] ), 
	.SE(n670), 
	.RN(FE_OFN0_RST_Domain_1_M), 
	.Q(\reg_file[14][3] ), 
	.D(n291), 
	.CK(clk));
   SDFFRQX2M \reg_file_reg[14][2]  (.SI(\reg_file[14][1] ), 
	.SE(n601), 
	.RN(FE_OFN0_RST_Domain_1_M), 
	.Q(\reg_file[14][2] ), 
	.D(n290), 
	.CK(clk));
   SDFFRQX2M \reg_file_reg[14][1]  (.SI(\reg_file[14][0] ), 
	.SE(n628), 
	.RN(FE_OFN0_RST_Domain_1_M), 
	.Q(\reg_file[14][1] ), 
	.D(n289), 
	.CK(REF_CLK_M__L8_N7));
   SDFFRQX2M \reg_file_reg[14][0]  (.SI(\reg_file[13][7] ), 
	.SE(n628), 
	.RN(FE_OFN0_RST_Domain_1_M), 
	.Q(\reg_file[14][0] ), 
	.D(n288), 
	.CK(REF_CLK_M__L8_N7));
   SDFFRQX2M \reg_file_reg[12][7]  (.SI(\reg_file[12][6] ), 
	.SE(n669), 
	.RN(FE_OFN2_RST_Domain_1_M), 
	.Q(\reg_file[12][7] ), 
	.D(n279), 
	.CK(REF_CLK_M__L8_N4));
   SDFFRQX2M \reg_file_reg[12][6]  (.SI(\reg_file[12][5] ), 
	.SE(n600), 
	.RN(FE_OFN0_RST_Domain_1_M), 
	.Q(\reg_file[12][6] ), 
	.D(n278), 
	.CK(REF_CLK_M__L8_N4));
   SDFFRQX2M \reg_file_reg[12][5]  (.SI(\reg_file[12][4] ), 
	.SE(n600), 
	.RN(FE_OFN0_RST_Domain_1_M), 
	.Q(\reg_file[12][5] ), 
	.D(n277), 
	.CK(REF_CLK_M__L8_N4));
   SDFFRQX2M \reg_file_reg[12][4]  (.SI(\reg_file[12][3] ), 
	.SE(n599), 
	.RN(FE_OFN0_RST_Domain_1_M), 
	.Q(\reg_file[12][4] ), 
	.D(n276), 
	.CK(REF_CLK_M__L8_N4));
   SDFFRQX2M \reg_file_reg[12][3]  (.SI(\reg_file[12][2] ), 
	.SE(n599), 
	.RN(FE_OFN0_RST_Domain_1_M), 
	.Q(\reg_file[12][3] ), 
	.D(n275), 
	.CK(REF_CLK_M__L8_N4));
   SDFFRQX2M \reg_file_reg[12][2]  (.SI(\reg_file[12][1] ), 
	.SE(n627), 
	.RN(FE_OFN2_RST_Domain_1_M), 
	.Q(\reg_file[12][2] ), 
	.D(n274), 
	.CK(REF_CLK_M__L8_N4));
   SDFFRQX2M \reg_file_reg[12][1]  (.SI(\reg_file[12][0] ), 
	.SE(n627), 
	.RN(FE_OFN2_RST_Domain_1_M), 
	.Q(\reg_file[12][1] ), 
	.D(n273), 
	.CK(REF_CLK_M__L8_N4));
   SDFFRQX2M \reg_file_reg[12][0]  (.SI(\reg_file[11][7] ), 
	.SE(n666), 
	.RN(FE_OFN2_RST_Domain_1_M), 
	.Q(\reg_file[12][0] ), 
	.D(n272), 
	.CK(REF_CLK_M__L8_N4));
   SDFFRQX2M \reg_file_reg[10][7]  (.SI(\reg_file[10][6] ), 
	.SE(n598), 
	.RN(FE_OFN2_RST_Domain_1_M), 
	.Q(\reg_file[10][7] ), 
	.D(n263), 
	.CK(REF_CLK_M__L8_N8));
   SDFFRQX2M \reg_file_reg[10][6]  (.SI(\reg_file[10][5] ), 
	.SE(n598), 
	.RN(FE_OFN0_RST_Domain_1_M), 
	.Q(\reg_file[10][6] ), 
	.D(n262), 
	.CK(REF_CLK_M__L8_N8));
   SDFFRQX2M \reg_file_reg[10][5]  (.SI(\reg_file[10][4] ), 
	.SE(n597), 
	.RN(FE_OFN2_RST_Domain_1_M), 
	.Q(\reg_file[10][5] ), 
	.D(n261), 
	.CK(REF_CLK_M__L8_N8));
   SDFFRQX2M \reg_file_reg[10][4]  (.SI(\reg_file[10][3] ), 
	.SE(n597), 
	.RN(FE_OFN0_RST_Domain_1_M), 
	.Q(\reg_file[10][4] ), 
	.D(n260), 
	.CK(REF_CLK_M__L8_N8));
   SDFFRQX2M \reg_file_reg[10][3]  (.SI(\reg_file[10][2] ), 
	.SE(n626), 
	.RN(FE_OFN0_RST_Domain_1_M), 
	.Q(\reg_file[10][3] ), 
	.D(n259), 
	.CK(REF_CLK_M__L8_N8));
   SDFFRQX2M \reg_file_reg[10][2]  (.SI(\reg_file[10][1] ), 
	.SE(n626), 
	.RN(FE_OFN0_RST_Domain_1_M), 
	.Q(\reg_file[10][2] ), 
	.D(n258), 
	.CK(REF_CLK_M__L8_N8));
   SDFFRQX2M \reg_file_reg[10][1]  (.SI(\reg_file[10][0] ), 
	.SE(n663), 
	.RN(FE_OFN0_RST_Domain_1_M), 
	.Q(\reg_file[10][1] ), 
	.D(n257), 
	.CK(REF_CLK_M__L8_N8));
   SDFFRQX2M \reg_file_reg[10][0]  (.SI(\reg_file[9][7] ), 
	.SE(n596), 
	.RN(FE_OFN0_RST_Domain_1_M), 
	.Q(\reg_file[10][0] ), 
	.D(n256), 
	.CK(REF_CLK_M__L8_N8));
   SDFFRQX2M \reg_file_reg[8][7]  (.SI(\reg_file[8][6] ), 
	.SE(n596), 
	.RN(FE_OFN0_RST_Domain_1_M), 
	.Q(\reg_file[8][7] ), 
	.D(n247), 
	.CK(REF_CLK_M__L8_N8));
   SDFFRQX2M \reg_file_reg[8][6]  (.SI(\reg_file[8][5] ), 
	.SE(n595), 
	.RN(FE_OFN0_RST_Domain_1_M), 
	.Q(\reg_file[8][6] ), 
	.D(n246), 
	.CK(clk));
   SDFFRQX2M \reg_file_reg[8][5]  (.SI(\reg_file[8][4] ), 
	.SE(n595), 
	.RN(FE_OFN0_RST_Domain_1_M), 
	.Q(\reg_file[8][5] ), 
	.D(n245), 
	.CK(clk));
   SDFFRQX2M \reg_file_reg[8][4]  (.SI(\reg_file[8][3] ), 
	.SE(n625), 
	.RN(FE_OFN0_RST_Domain_1_M), 
	.Q(\reg_file[8][4] ), 
	.D(n244), 
	.CK(clk));
   SDFFRQX2M \reg_file_reg[8][3]  (.SI(\reg_file[8][2] ), 
	.SE(n625), 
	.RN(rst), 
	.Q(\reg_file[8][3] ), 
	.D(n243), 
	.CK(clk));
   SDFFRQX2M \reg_file_reg[8][2]  (.SI(\reg_file[8][1] ), 
	.SE(n660), 
	.RN(rst), 
	.Q(\reg_file[8][2] ), 
	.D(n242), 
	.CK(clk));
   SDFFRQX2M \reg_file_reg[8][1]  (.SI(\reg_file[8][0] ), 
	.SE(n601), 
	.RN(rst), 
	.Q(\reg_file[8][1] ), 
	.D(n241), 
	.CK(clk));
   SDFFRQX2M \reg_file_reg[8][0]  (.SI(\reg_file[7][7] ), 
	.SE(n659), 
	.RN(rst), 
	.Q(\reg_file[8][0] ), 
	.D(n240), 
	.CK(clk));
   SDFFRQX2M \reg_file_reg[6][7]  (.SI(\reg_file[6][6] ), 
	.SE(n624), 
	.RN(rst), 
	.Q(\reg_file[6][7] ), 
	.D(n231), 
	.CK(REF_CLK_M__L8_N9));
   SDFFRQX2M \reg_file_reg[6][6]  (.SI(\reg_file[6][5] ), 
	.SE(n624), 
	.RN(rst), 
	.Q(\reg_file[6][6] ), 
	.D(n230), 
	.CK(REF_CLK_M__L8_N9));
   SDFFRQX2M \reg_file_reg[6][5]  (.SI(\reg_file[6][4] ), 
	.SE(n658), 
	.RN(rst), 
	.Q(\reg_file[6][5] ), 
	.D(n229), 
	.CK(REF_CLK_M__L8_N9));
   SDFFRQX2M \reg_file_reg[6][4]  (.SI(\reg_file[6][3] ), 
	.SE(n594), 
	.RN(rst), 
	.Q(\reg_file[6][4] ), 
	.D(n228), 
	.CK(REF_CLK_M__L8_N9));
   SDFFRQX2M \reg_file_reg[6][3]  (.SI(\reg_file[6][2] ), 
	.SE(n594), 
	.RN(rst), 
	.Q(\reg_file[6][3] ), 
	.D(n227), 
	.CK(REF_CLK_M__L8_N9));
   SDFFRQX2M \reg_file_reg[6][2]  (.SI(\reg_file[6][1] ), 
	.SE(n623), 
	.RN(rst), 
	.Q(\reg_file[6][2] ), 
	.D(n226), 
	.CK(REF_CLK_M__L8_N9));
   SDFFRQX2M \reg_file_reg[6][1]  (.SI(\reg_file[6][0] ), 
	.SE(n623), 
	.RN(rst), 
	.Q(\reg_file[6][1] ), 
	.D(n225), 
	.CK(REF_CLK_M__L8_N9));
   SDFFRQX2M \reg_file_reg[6][0]  (.SI(\reg_file[5][7] ), 
	.SE(n656), 
	.RN(rst), 
	.Q(\reg_file[6][0] ), 
	.D(n224), 
	.CK(REF_CLK_M__L8_N9));
   SDFFRQX2M \reg_file_reg[4][7]  (.SI(\reg_file[4][6] ), 
	.SE(n593), 
	.RN(rst), 
	.Q(\reg_file[4][7] ), 
	.D(n215), 
	.CK(clk));
   SDFFRQX2M \reg_file_reg[4][6]  (.SI(\reg_file[4][5] ), 
	.SE(n593), 
	.RN(rst), 
	.Q(\reg_file[4][6] ), 
	.D(n214), 
	.CK(clk));
   SDFFRQX2M \reg_file_reg[4][5]  (.SI(\reg_file[4][4] ), 
	.SE(n622), 
	.RN(rst), 
	.Q(\reg_file[4][5] ), 
	.D(n213), 
	.CK(clk));
   SDFFRQX2M \reg_file_reg[4][4]  (.SI(\reg_file[4][3] ), 
	.SE(n622), 
	.RN(rst), 
	.Q(\reg_file[4][4] ), 
	.D(n212), 
	.CK(clk));
   SDFFRQX2M \reg_file_reg[4][3]  (.SI(\reg_file[4][2] ), 
	.SE(n654), 
	.RN(rst), 
	.Q(\reg_file[4][3] ), 
	.D(n211), 
	.CK(clk));
   SDFFRQX2M \reg_file_reg[4][2]  (.SI(\reg_file[4][1] ), 
	.SE(n592), 
	.RN(rst), 
	.Q(\reg_file[4][2] ), 
	.D(n210), 
	.CK(REF_CLK_M__L8_N12));
   SDFFRQX2M \reg_file_reg[4][1]  (.SI(\reg_file[4][0] ), 
	.SE(n592), 
	.RN(rst), 
	.Q(\reg_file[4][1] ), 
	.D(n209), 
	.CK(REF_CLK_M__L8_N12));
   SDFFRQX2M \reg_file_reg[4][0]  (.SI(REG3[7]), 
	.SE(n582), 
	.RN(FE_OFN0_RST_Domain_1_M), 
	.Q(\reg_file[4][0] ), 
	.D(n208), 
	.CK(REF_CLK_M__L8_N12));
   SDFFRQX2M \reg_file_reg[2][1]  (.SI(REG2[0]), 
	.SE(n641), 
	.RN(FE_OFN0_RST_Domain_1_M), 
	.Q(REG2[1]), 
	.D(n193), 
	.CK(REF_CLK_M__L8_N12));
   SDFFSQX4M \reg_file_reg[2][0]  (.SN(FE_OFN0_RST_Domain_1_M), 
	.SI(n554), 
	.SE(n638), 
	.Q(REG2[0]), 
	.D(n192), 
	.CK(REF_CLK_M__L8_N11));
   SDFFSQX4M \reg_file_reg[3][5]  (.SN(FE_OFN0_RST_Domain_1_M), 
	.SI(REG3[4]), 
	.SE(n638), 
	.Q(REG3[5]), 
	.D(n205), 
	.CK(REF_CLK_M__L8_N12));
   SDFFRQX2M \reg_file_reg[2][4]  (.SI(n565), 
	.SE(n580), 
	.RN(FE_OFN0_RST_Domain_1_M), 
	.Q(REG2[4]), 
	.D(n196), 
	.CK(REF_CLK_M__L8_N12));
   SDFFRQX2M \reg_file_reg[2][3]  (.SI(n566), 
	.SE(n581), 
	.RN(FE_OFN0_RST_Domain_1_M), 
	.Q(n565), 
	.D(n195), 
	.CK(REF_CLK_M__L8_N11));
   SDFFRQX2M \reg_file_reg[2][5]  (.SI(REG2[4]), 
	.SE(n583), 
	.RN(FE_OFN0_RST_Domain_1_M), 
	.Q(REG2[5]), 
	.D(n197), 
	.CK(REF_CLK_M__L8_N11));
   SDFFSQX2M \reg_file_reg[2][7]  (.SN(FE_OFN0_RST_Domain_1_M), 
	.SI(n563), 
	.SE(n708), 
	.Q(REG2[7]), 
	.D(n199), 
	.CK(REF_CLK_M__L8_N12));
   CLKINVX2M U140 (.Y(REG1[0]), 
	.A(n142));
   CLKINVX2M U142 (.Y(REG2[2]), 
	.A(n315));
   NOR2X4M U143 (.Y(n459), 
	.B(n473), 
	.A(n472));
   NOR2X4M U144 (.Y(n461), 
	.B(N12), 
	.A(n473));
   NOR2X4M U145 (.Y(n460), 
	.B(N11), 
	.A(n472));
   INVXLM U148 (.Y(n138), 
	.A(n558));
   CLKINVX2M U149 (.Y(REG1[3]), 
	.A(n138));
   INVXLM U150 (.Y(n140), 
	.A(n559));
   CLKINVX2M U151 (.Y(REG1[2]), 
	.A(n140));
   INVXLM U152 (.Y(n142), 
	.A(n561));
   INVXLM U153 (.Y(n144), 
	.A(n557));
   CLKINVX2M U154 (.Y(REG1[4]), 
	.A(n144));
   INVXLM U155 (.Y(n146), 
	.A(n556));
   CLKINVX2M U156 (.Y(REG1[5]), 
	.A(n146));
   INVXLM U157 (.Y(n148), 
	.A(n560));
   CLKINVX2M U158 (.Y(REG1[1]), 
	.A(n148));
   INVXLM U159 (.Y(n313), 
	.A(n554));
   CLKINVX2M U160 (.Y(REG1[7]), 
	.A(n313));
   INVXLM U161 (.Y(n315), 
	.A(n566));
   INVXLM U162 (.Y(n317), 
	.A(n553));
   CLKINVX2M U163 (.Y(REG0[0]), 
	.A(n317));
   INVXLM U164 (.Y(n319), 
	.A(n548));
   CLKINVX2M U165 (.Y(REG0[5]), 
	.A(n319));
   INVXLM U166 (.Y(n321), 
	.A(n549));
   CLKINVX2M U167 (.Y(REG0[4]), 
	.A(n321));
   INVXLM U168 (.Y(n323), 
	.A(n552));
   CLKINVX2M U169 (.Y(REG0[1]), 
	.A(n323));
   INVXLM U170 (.Y(n325), 
	.A(n551));
   CLKINVX2M U171 (.Y(REG0[2]), 
	.A(n325));
   INVXLM U172 (.Y(n327), 
	.A(n550));
   CLKINVX2M U173 (.Y(REG0[3]), 
	.A(n327));
   INVXLM U174 (.Y(n329), 
	.A(n555));
   CLKINVX2M U175 (.Y(REG1[6]), 
	.A(n329));
   INVXLM U176 (.Y(n331), 
	.A(n547));
   CLKINVX2M U177 (.Y(REG0[6]), 
	.A(n331));
   INVXLM U178 (.Y(n333), 
	.A(n546));
   CLKINVX2M U179 (.Y(REG0[7]), 
	.A(n333));
   INVXLM U180 (.Y(n335), 
	.A(n563));
   CLKINVX2M U181 (.Y(REG2[6]), 
	.A(n335));
   CLKINVX1M U207 (.Y(n473), 
	.A(N11));
   CLKNAND2X2M U208 (.Y(n450), 
	.B(n471), 
	.A(N14));
   CLKNAND2X2M U209 (.Y(n463), 
	.B(n470), 
	.A(N13));
   CLKINVX1M U210 (.Y(n470), 
	.A(N14));
   CLKINVX1M U211 (.Y(n536), 
	.A(N11));
   CLKNAND2X2M U212 (.Y(n453), 
	.B(N13), 
	.A(N14));
   CLKNAND2X2M U213 (.Y(n456), 
	.B(n470), 
	.A(n471));
   CLKBUFX2M U215 (.Y(REG2[3]), 
	.A(n565));
   OR2X1M U216 (.Y(n365), 
	.B(N12), 
	.A(N11));
   NOR2BX2M U217 (.Y(n165), 
	.B(N11), 
	.AN(n173));
   NOR2BX2M U218 (.Y(n151), 
	.B(N11), 
	.AN(n162));
   NOR2BX2M U219 (.Y(n173), 
	.B(N61), 
	.AN(N14));
   NOR2X2M U220 (.Y(n162), 
	.B(N14), 
	.A(N61));
   NOR2X2M U222 (.Y(n155), 
	.B(N13), 
	.A(n472));
   NOR2X2M U223 (.Y(n150), 
	.B(N13), 
	.A(N12));
   NOR2BX2M U224 (.Y(n158), 
	.B(N12), 
	.AN(N13));
   NOR2BX2M U225 (.Y(n161), 
	.B(n472), 
	.AN(N13));
   CLKINVX2M U226 (.Y(n543), 
	.A(WR_Data[6]));
   CLKINVX2M U227 (.Y(n544), 
	.A(WR_Data[7]));
   NOR2BX2M U285 (.Y(n153), 
	.B(n536), 
	.AN(n162));
   NOR2BX2M U286 (.Y(n167), 
	.B(n536), 
	.AN(n173));
   NAND2X2M U287 (.Y(n152), 
	.B(n150), 
	.A(n153));
   NAND2X2M U288 (.Y(n166), 
	.B(n150), 
	.A(n167));
   NAND2X2M U289 (.Y(n169), 
	.B(n155), 
	.A(n167));
   NAND2X2M U290 (.Y(n171), 
	.B(n158), 
	.A(n167));
   NAND2X2M U291 (.Y(n174), 
	.B(n161), 
	.A(n167));
   NAND2X2M U292 (.Y(n159), 
	.B(n153), 
	.A(n158));
   NAND2X2M U293 (.Y(n163), 
	.B(n153), 
	.A(n161));
   NAND2X2M U294 (.Y(n156), 
	.B(n153), 
	.A(n155));
   NAND2X2M U295 (.Y(n149), 
	.B(n151), 
	.A(n150));
   NAND2X2M U296 (.Y(n154), 
	.B(n151), 
	.A(n155));
   NAND2X2M U297 (.Y(n157), 
	.B(n151), 
	.A(n158));
   NAND2X2M U298 (.Y(n160), 
	.B(n151), 
	.A(n161));
   NAND2X2M U299 (.Y(n164), 
	.B(n150), 
	.A(n165));
   NAND2X2M U300 (.Y(n168), 
	.B(n155), 
	.A(n165));
   NAND2X2M U301 (.Y(n170), 
	.B(n158), 
	.A(n165));
   NAND2X2M U302 (.Y(n172), 
	.B(n161), 
	.A(n165));
   CLKINVX2M U303 (.Y(n545), 
	.A(n175));
   INVX2M U306 (.Y(n462), 
	.A(n365));
   CLKINVX1M U307 (.Y(n471), 
	.A(N13));
   INVX2M U308 (.Y(n472), 
	.A(N12));
   NAND2BX2M U309 (.Y(N61), 
	.B(WR_en), 
	.AN(RD_en));
   NAND2BX2M U310 (.Y(n175), 
	.B(RD_en), 
	.AN(WR_en));
   OAI2BB2X1M U311 (.Y(n196), 
	.B1(n154), 
	.B0(n541), 
	.A1N(n154), 
	.A0N(REG2[4]));
   CLKINVX2M U312 (.Y(n537), 
	.A(WR_Data[0]));
   CLKINVX2M U313 (.Y(n538), 
	.A(WR_Data[1]));
   CLKINVX2M U314 (.Y(n539), 
	.A(WR_Data[2]));
   CLKINVX2M U315 (.Y(n540), 
	.A(WR_Data[3]));
   CLKINVX2M U316 (.Y(n541), 
	.A(WR_Data[4]));
   CLKINVX2M U317 (.Y(n542), 
	.A(WR_Data[5]));
   AO22X1M U318 (.Y(n304), 
	.B1(n175), 
	.B0(RD_Data[0]), 
	.A1(n545), 
	.A0(N43));
   AO22X1M U319 (.Y(n305), 
	.B1(n175), 
	.B0(RD_Data[1]), 
	.A1(n545), 
	.A0(N42));
   AO22X1M U320 (.Y(n306), 
	.B1(n175), 
	.B0(RD_Data[2]), 
	.A1(n545), 
	.A0(N41));
   AO22X1M U321 (.Y(n307), 
	.B1(n175), 
	.B0(RD_Data[3]), 
	.A1(n545), 
	.A0(N40));
   AO22X1M U322 (.Y(n308), 
	.B1(n175), 
	.B0(RD_Data[4]), 
	.A1(n545), 
	.A0(N39));
   AO22X1M U323 (.Y(n309), 
	.B1(n175), 
	.B0(RD_Data[5]), 
	.A1(n545), 
	.A0(N38));
   AO22X1M U324 (.Y(n310), 
	.B1(n175), 
	.B0(RD_Data[6]), 
	.A1(n545), 
	.A0(N37));
   AO22X1M U325 (.Y(n311), 
	.B1(n175), 
	.B0(RD_Data[7]), 
	.A1(n545), 
	.A0(N36));
   OAI2BB2X1M U326 (.Y(n184), 
	.B1(n152), 
	.B0(n537), 
	.A1N(n152), 
	.A0N(REG1[0]));
   OAI2BB2X1M U327 (.Y(n200), 
	.B1(n156), 
	.B0(n537), 
	.A1N(n156), 
	.A0N(REG3[0]));
   OAI2BB2X1M U328 (.Y(n216), 
	.B1(n159), 
	.B0(n537), 
	.A1N(n159), 
	.A0N(\reg_file[5][0] ));
   OAI2BB2X1M U329 (.Y(n232), 
	.B1(n163), 
	.B0(n537), 
	.A1N(n163), 
	.A0N(\reg_file[7][0] ));
   OAI2BB2X1M U330 (.Y(n248), 
	.B1(n166), 
	.B0(n537), 
	.A1N(n166), 
	.A0N(\reg_file[9][0] ));
   OAI2BB2X1M U331 (.Y(n264), 
	.B1(n169), 
	.B0(n537), 
	.A1N(n169), 
	.A0N(\reg_file[11][0] ));
   OAI2BB2X1M U332 (.Y(n280), 
	.B1(n171), 
	.B0(n537), 
	.A1N(n171), 
	.A0N(\reg_file[13][0] ));
   OAI2BB2X1M U333 (.Y(n296), 
	.B1(n174), 
	.B0(n537), 
	.A1N(n174), 
	.A0N(\reg_file[15][0] ));
   OAI2BB2X1M U334 (.Y(n185), 
	.B1(n152), 
	.B0(n538), 
	.A1N(n152), 
	.A0N(REG1[1]));
   OAI2BB2X1M U335 (.Y(n201), 
	.B1(n156), 
	.B0(n538), 
	.A1N(n156), 
	.A0N(REG3[1]));
   OAI2BB2X1M U336 (.Y(n217), 
	.B1(n159), 
	.B0(n538), 
	.A1N(n159), 
	.A0N(\reg_file[5][1] ));
   OAI2BB2X1M U337 (.Y(n233), 
	.B1(n163), 
	.B0(n538), 
	.A1N(n163), 
	.A0N(\reg_file[7][1] ));
   OAI2BB2X1M U338 (.Y(n249), 
	.B1(n166), 
	.B0(n538), 
	.A1N(n166), 
	.A0N(\reg_file[9][1] ));
   OAI2BB2X1M U339 (.Y(n265), 
	.B1(n169), 
	.B0(n538), 
	.A1N(n169), 
	.A0N(\reg_file[11][1] ));
   OAI2BB2X1M U340 (.Y(n281), 
	.B1(n171), 
	.B0(n538), 
	.A1N(n171), 
	.A0N(\reg_file[13][1] ));
   OAI2BB2X1M U341 (.Y(n297), 
	.B1(n174), 
	.B0(n538), 
	.A1N(n174), 
	.A0N(\reg_file[15][1] ));
   OAI2BB2X1M U342 (.Y(n186), 
	.B1(n152), 
	.B0(n539), 
	.A1N(n152), 
	.A0N(REG1[2]));
   OAI2BB2X1M U343 (.Y(n202), 
	.B1(n156), 
	.B0(n539), 
	.A1N(n156), 
	.A0N(REG3[2]));
   OAI2BB2X1M U344 (.Y(n218), 
	.B1(n159), 
	.B0(n539), 
	.A1N(n159), 
	.A0N(\reg_file[5][2] ));
   OAI2BB2X1M U345 (.Y(n234), 
	.B1(n163), 
	.B0(n539), 
	.A1N(n163), 
	.A0N(\reg_file[7][2] ));
   OAI2BB2X1M U346 (.Y(n250), 
	.B1(n166), 
	.B0(n539), 
	.A1N(n166), 
	.A0N(\reg_file[9][2] ));
   OAI2BB2X1M U347 (.Y(n266), 
	.B1(n169), 
	.B0(n539), 
	.A1N(n169), 
	.A0N(\reg_file[11][2] ));
   OAI2BB2X1M U348 (.Y(n282), 
	.B1(n171), 
	.B0(n539), 
	.A1N(n171), 
	.A0N(n572));
   OAI2BB2X1M U349 (.Y(n298), 
	.B1(n174), 
	.B0(n539), 
	.A1N(n174), 
	.A0N(\reg_file[15][2] ));
   OAI2BB2X1M U350 (.Y(n187), 
	.B1(n152), 
	.B0(n540), 
	.A1N(n152), 
	.A0N(REG1[3]));
   OAI2BB2X1M U351 (.Y(n203), 
	.B1(n156), 
	.B0(n540), 
	.A1N(n156), 
	.A0N(REG3[3]));
   OAI2BB2X1M U352 (.Y(n219), 
	.B1(n159), 
	.B0(n540), 
	.A1N(n159), 
	.A0N(\reg_file[5][3] ));
   OAI2BB2X1M U353 (.Y(n235), 
	.B1(n163), 
	.B0(n540), 
	.A1N(n163), 
	.A0N(\reg_file[7][3] ));
   OAI2BB2X1M U354 (.Y(n251), 
	.B1(n166), 
	.B0(n540), 
	.A1N(n166), 
	.A0N(\reg_file[9][3] ));
   OAI2BB2X1M U355 (.Y(n267), 
	.B1(n169), 
	.B0(n540), 
	.A1N(n169), 
	.A0N(\reg_file[11][3] ));
   OAI2BB2X1M U356 (.Y(n283), 
	.B1(n171), 
	.B0(n540), 
	.A1N(n171), 
	.A0N(\reg_file[13][3] ));
   OAI2BB2X1M U357 (.Y(n299), 
	.B1(n174), 
	.B0(n540), 
	.A1N(n174), 
	.A0N(\reg_file[15][3] ));
   OAI2BB2X1M U358 (.Y(n188), 
	.B1(n152), 
	.B0(n541), 
	.A1N(n152), 
	.A0N(REG1[4]));
   OAI2BB2X1M U359 (.Y(n189), 
	.B1(n152), 
	.B0(n542), 
	.A1N(n152), 
	.A0N(REG1[5]));
   OAI2BB2X1M U360 (.Y(n204), 
	.B1(n156), 
	.B0(n541), 
	.A1N(n156), 
	.A0N(REG3[4]));
   OAI2BB2X1M U361 (.Y(n220), 
	.B1(n159), 
	.B0(n541), 
	.A1N(n159), 
	.A0N(\reg_file[5][4] ));
   OAI2BB2X1M U362 (.Y(n221), 
	.B1(n159), 
	.B0(n542), 
	.A1N(n159), 
	.A0N(\reg_file[5][5] ));
   OAI2BB2X1M U363 (.Y(n236), 
	.B1(n163), 
	.B0(n541), 
	.A1N(n163), 
	.A0N(\reg_file[7][4] ));
   OAI2BB2X1M U364 (.Y(n237), 
	.B1(n163), 
	.B0(n542), 
	.A1N(n163), 
	.A0N(\reg_file[7][5] ));
   OAI2BB2X1M U365 (.Y(n252), 
	.B1(n166), 
	.B0(n541), 
	.A1N(n166), 
	.A0N(\reg_file[9][4] ));
   OAI2BB2X1M U366 (.Y(n253), 
	.B1(n166), 
	.B0(n542), 
	.A1N(n166), 
	.A0N(\reg_file[9][5] ));
   OAI2BB2X1M U367 (.Y(n268), 
	.B1(n169), 
	.B0(n541), 
	.A1N(n169), 
	.A0N(\reg_file[11][4] ));
   OAI2BB2X1M U368 (.Y(n269), 
	.B1(n169), 
	.B0(n542), 
	.A1N(n169), 
	.A0N(\reg_file[11][5] ));
   OAI2BB2X1M U369 (.Y(n284), 
	.B1(n171), 
	.B0(n541), 
	.A1N(n171), 
	.A0N(\reg_file[13][4] ));
   OAI2BB2X1M U370 (.Y(n285), 
	.B1(n171), 
	.B0(n542), 
	.A1N(n171), 
	.A0N(\reg_file[13][5] ));
   OAI2BB2X1M U371 (.Y(n300), 
	.B1(n174), 
	.B0(n541), 
	.A1N(n174), 
	.A0N(\reg_file[15][4] ));
   OAI2BB2X1M U372 (.Y(n301), 
	.B1(n174), 
	.B0(n542), 
	.A1N(n174), 
	.A0N(\reg_file[15][5] ));
   OAI2BB2X1M U373 (.Y(n190), 
	.B1(n152), 
	.B0(n543), 
	.A1N(n152), 
	.A0N(REG1[6]));
   OAI2BB2X1M U374 (.Y(n191), 
	.B1(n152), 
	.B0(n544), 
	.A1N(n152), 
	.A0N(REG1[7]));
   OAI2BB2X1M U375 (.Y(n206), 
	.B1(n156), 
	.B0(n543), 
	.A1N(n156), 
	.A0N(REG3[6]));
   OAI2BB2X1M U376 (.Y(n207), 
	.B1(n156), 
	.B0(n544), 
	.A1N(n156), 
	.A0N(REG3[7]));
   OAI2BB2X1M U377 (.Y(n222), 
	.B1(n159), 
	.B0(n543), 
	.A1N(n159), 
	.A0N(\reg_file[5][6] ));
   OAI2BB2X1M U378 (.Y(n223), 
	.B1(n159), 
	.B0(n544), 
	.A1N(n159), 
	.A0N(\reg_file[5][7] ));
   OAI2BB2X1M U379 (.Y(n238), 
	.B1(n163), 
	.B0(n543), 
	.A1N(n163), 
	.A0N(\reg_file[7][6] ));
   OAI2BB2X1M U380 (.Y(n239), 
	.B1(n163), 
	.B0(n544), 
	.A1N(n163), 
	.A0N(\reg_file[7][7] ));
   OAI2BB2X1M U381 (.Y(n254), 
	.B1(n166), 
	.B0(n543), 
	.A1N(n166), 
	.A0N(\reg_file[9][6] ));
   OAI2BB2X1M U382 (.Y(n255), 
	.B1(n166), 
	.B0(n544), 
	.A1N(n166), 
	.A0N(\reg_file[9][7] ));
   OAI2BB2X1M U383 (.Y(n270), 
	.B1(n169), 
	.B0(n543), 
	.A1N(n169), 
	.A0N(\reg_file[11][6] ));
   OAI2BB2X1M U384 (.Y(n271), 
	.B1(n169), 
	.B0(n544), 
	.A1N(n169), 
	.A0N(\reg_file[11][7] ));
   OAI2BB2X1M U385 (.Y(n286), 
	.B1(n171), 
	.B0(n543), 
	.A1N(n171), 
	.A0N(\reg_file[13][6] ));
   OAI2BB2X1M U386 (.Y(n287), 
	.B1(n171), 
	.B0(n544), 
	.A1N(n171), 
	.A0N(\reg_file[13][7] ));
   OAI2BB2X1M U387 (.Y(n302), 
	.B1(n174), 
	.B0(n543), 
	.A1N(n174), 
	.A0N(\reg_file[15][6] ));
   OAI2BB2X1M U388 (.Y(n303), 
	.B1(n174), 
	.B0(n544), 
	.A1N(n174), 
	.A0N(\reg_file[15][7] ));
   OAI2BB2X1M U389 (.Y(n205), 
	.B1(n156), 
	.B0(n542), 
	.A1N(n156), 
	.A0N(REG3[5]));
   OAI2BB2X1M U390 (.Y(n176), 
	.B1(n537), 
	.B0(n149), 
	.A1N(n149), 
	.A0N(REG0[0]));
   OAI2BB2X1M U391 (.Y(n177), 
	.B1(n538), 
	.B0(n149), 
	.A1N(n149), 
	.A0N(REG0[1]));
   OAI2BB2X1M U392 (.Y(n178), 
	.B1(n539), 
	.B0(n149), 
	.A1N(n149), 
	.A0N(REG0[2]));
   OAI2BB2X1M U393 (.Y(n179), 
	.B1(n540), 
	.B0(n149), 
	.A1N(n149), 
	.A0N(REG0[3]));
   OAI2BB2X1M U394 (.Y(n180), 
	.B1(n541), 
	.B0(n149), 
	.A1N(n149), 
	.A0N(REG0[4]));
   OAI2BB2X1M U395 (.Y(n181), 
	.B1(n542), 
	.B0(n149), 
	.A1N(n149), 
	.A0N(REG0[5]));
   OAI2BB2X1M U396 (.Y(n208), 
	.B1(n157), 
	.B0(n537), 
	.A1N(n157), 
	.A0N(\reg_file[4][0] ));
   OAI2BB2X1M U397 (.Y(n224), 
	.B1(n160), 
	.B0(n537), 
	.A1N(n160), 
	.A0N(\reg_file[6][0] ));
   OAI2BB2X1M U398 (.Y(n240), 
	.B1(n164), 
	.B0(n537), 
	.A1N(n164), 
	.A0N(\reg_file[8][0] ));
   OAI2BB2X1M U399 (.Y(n256), 
	.B1(n168), 
	.B0(n537), 
	.A1N(n168), 
	.A0N(\reg_file[10][0] ));
   OAI2BB2X1M U400 (.Y(n272), 
	.B1(n170), 
	.B0(n537), 
	.A1N(n170), 
	.A0N(\reg_file[12][0] ));
   OAI2BB2X1M U401 (.Y(n288), 
	.B1(n172), 
	.B0(n537), 
	.A1N(n172), 
	.A0N(\reg_file[14][0] ));
   OAI2BB2X1M U402 (.Y(n193), 
	.B1(n154), 
	.B0(n538), 
	.A1N(n154), 
	.A0N(REG2[1]));
   OAI2BB2X1M U403 (.Y(n209), 
	.B1(n157), 
	.B0(n538), 
	.A1N(n157), 
	.A0N(\reg_file[4][1] ));
   OAI2BB2X1M U404 (.Y(n225), 
	.B1(n160), 
	.B0(n538), 
	.A1N(n160), 
	.A0N(\reg_file[6][1] ));
   OAI2BB2X1M U405 (.Y(n241), 
	.B1(n164), 
	.B0(n538), 
	.A1N(n164), 
	.A0N(\reg_file[8][1] ));
   OAI2BB2X1M U406 (.Y(n257), 
	.B1(n168), 
	.B0(n538), 
	.A1N(n168), 
	.A0N(\reg_file[10][1] ));
   OAI2BB2X1M U407 (.Y(n273), 
	.B1(n170), 
	.B0(n538), 
	.A1N(n170), 
	.A0N(\reg_file[12][1] ));
   OAI2BB2X1M U408 (.Y(n289), 
	.B1(n172), 
	.B0(n538), 
	.A1N(n172), 
	.A0N(\reg_file[14][1] ));
   OAI2BB2X1M U409 (.Y(n194), 
	.B1(n154), 
	.B0(n539), 
	.A1N(n154), 
	.A0N(REG2[2]));
   OAI2BB2X1M U410 (.Y(n210), 
	.B1(n157), 
	.B0(n539), 
	.A1N(n157), 
	.A0N(\reg_file[4][2] ));
   OAI2BB2X1M U411 (.Y(n226), 
	.B1(n160), 
	.B0(n539), 
	.A1N(n160), 
	.A0N(\reg_file[6][2] ));
   OAI2BB2X1M U412 (.Y(n242), 
	.B1(n164), 
	.B0(n539), 
	.A1N(n164), 
	.A0N(\reg_file[8][2] ));
   OAI2BB2X1M U413 (.Y(n258), 
	.B1(n168), 
	.B0(n539), 
	.A1N(n168), 
	.A0N(\reg_file[10][2] ));
   OAI2BB2X1M U414 (.Y(n274), 
	.B1(n170), 
	.B0(n539), 
	.A1N(n170), 
	.A0N(\reg_file[12][2] ));
   OAI2BB2X1M U415 (.Y(n290), 
	.B1(n172), 
	.B0(n539), 
	.A1N(n172), 
	.A0N(\reg_file[14][2] ));
   OAI2BB2X1M U416 (.Y(n195), 
	.B1(n154), 
	.B0(n540), 
	.A1N(n154), 
	.A0N(n565));
   OAI2BB2X1M U417 (.Y(n211), 
	.B1(n157), 
	.B0(n540), 
	.A1N(n157), 
	.A0N(\reg_file[4][3] ));
   OAI2BB2X1M U418 (.Y(n227), 
	.B1(n160), 
	.B0(n540), 
	.A1N(n160), 
	.A0N(\reg_file[6][3] ));
   OAI2BB2X1M U419 (.Y(n243), 
	.B1(n164), 
	.B0(n540), 
	.A1N(n164), 
	.A0N(\reg_file[8][3] ));
   OAI2BB2X1M U420 (.Y(n259), 
	.B1(n168), 
	.B0(n540), 
	.A1N(n168), 
	.A0N(\reg_file[10][3] ));
   OAI2BB2X1M U421 (.Y(n275), 
	.B1(n170), 
	.B0(n540), 
	.A1N(n170), 
	.A0N(\reg_file[12][3] ));
   OAI2BB2X1M U422 (.Y(n291), 
	.B1(n172), 
	.B0(n540), 
	.A1N(n172), 
	.A0N(\reg_file[14][3] ));
   OAI2BB2X1M U423 (.Y(n197), 
	.B1(n154), 
	.B0(n542), 
	.A1N(n154), 
	.A0N(REG2[5]));
   OAI2BB2X1M U424 (.Y(n212), 
	.B1(n157), 
	.B0(n541), 
	.A1N(n157), 
	.A0N(\reg_file[4][4] ));
   OAI2BB2X1M U425 (.Y(n213), 
	.B1(n157), 
	.B0(n542), 
	.A1N(n157), 
	.A0N(\reg_file[4][5] ));
   OAI2BB2X1M U426 (.Y(n228), 
	.B1(n160), 
	.B0(n541), 
	.A1N(n160), 
	.A0N(\reg_file[6][4] ));
   OAI2BB2X1M U427 (.Y(n229), 
	.B1(n160), 
	.B0(n542), 
	.A1N(n160), 
	.A0N(\reg_file[6][5] ));
   OAI2BB2X1M U428 (.Y(n244), 
	.B1(n164), 
	.B0(n541), 
	.A1N(n164), 
	.A0N(\reg_file[8][4] ));
   OAI2BB2X1M U429 (.Y(n245), 
	.B1(n164), 
	.B0(n542), 
	.A1N(n164), 
	.A0N(\reg_file[8][5] ));
   OAI2BB2X1M U430 (.Y(n260), 
	.B1(n168), 
	.B0(n541), 
	.A1N(n168), 
	.A0N(\reg_file[10][4] ));
   OAI2BB2X1M U431 (.Y(n261), 
	.B1(n168), 
	.B0(n542), 
	.A1N(n168), 
	.A0N(\reg_file[10][5] ));
   OAI2BB2X1M U432 (.Y(n276), 
	.B1(n170), 
	.B0(n541), 
	.A1N(n170), 
	.A0N(\reg_file[12][4] ));
   OAI2BB2X1M U433 (.Y(n277), 
	.B1(n170), 
	.B0(n542), 
	.A1N(n170), 
	.A0N(\reg_file[12][5] ));
   OAI2BB2X1M U434 (.Y(n292), 
	.B1(n172), 
	.B0(n541), 
	.A1N(n172), 
	.A0N(\reg_file[14][4] ));
   OAI2BB2X1M U435 (.Y(n293), 
	.B1(n172), 
	.B0(n542), 
	.A1N(n172), 
	.A0N(\reg_file[14][5] ));
   OAI2BB2X1M U436 (.Y(n182), 
	.B1(n543), 
	.B0(n149), 
	.A1N(n149), 
	.A0N(REG0[6]));
   OAI2BB2X1M U437 (.Y(n183), 
	.B1(n544), 
	.B0(n149), 
	.A1N(n149), 
	.A0N(REG0[7]));
   OAI2BB2X1M U438 (.Y(n198), 
	.B1(n154), 
	.B0(n543), 
	.A1N(n154), 
	.A0N(REG2[6]));
   OAI2BB2X1M U439 (.Y(n214), 
	.B1(n157), 
	.B0(n543), 
	.A1N(n157), 
	.A0N(\reg_file[4][6] ));
   OAI2BB2X1M U440 (.Y(n215), 
	.B1(n157), 
	.B0(n544), 
	.A1N(n157), 
	.A0N(\reg_file[4][7] ));
   OAI2BB2X1M U441 (.Y(n230), 
	.B1(n160), 
	.B0(n543), 
	.A1N(n160), 
	.A0N(\reg_file[6][6] ));
   OAI2BB2X1M U442 (.Y(n231), 
	.B1(n160), 
	.B0(n544), 
	.A1N(n160), 
	.A0N(\reg_file[6][7] ));
   OAI2BB2X1M U443 (.Y(n246), 
	.B1(n164), 
	.B0(n543), 
	.A1N(n164), 
	.A0N(\reg_file[8][6] ));
   OAI2BB2X1M U444 (.Y(n247), 
	.B1(n164), 
	.B0(n544), 
	.A1N(n164), 
	.A0N(\reg_file[8][7] ));
   OAI2BB2X1M U445 (.Y(n262), 
	.B1(n168), 
	.B0(n543), 
	.A1N(n168), 
	.A0N(\reg_file[10][6] ));
   OAI2BB2X1M U446 (.Y(n278), 
	.B1(n170), 
	.B0(n543), 
	.A1N(n170), 
	.A0N(\reg_file[12][6] ));
   OAI2BB2X1M U447 (.Y(n279), 
	.B1(n170), 
	.B0(n544), 
	.A1N(n170), 
	.A0N(\reg_file[12][7] ));
   OAI2BB2X1M U448 (.Y(n294), 
	.B1(n172), 
	.B0(n543), 
	.A1N(n172), 
	.A0N(\reg_file[14][6] ));
   OAI2BB2X1M U449 (.Y(n192), 
	.B1(n154), 
	.B0(n537), 
	.A1N(n154), 
	.A0N(REG2[0]));
   OAI2BB2X1M U450 (.Y(n263), 
	.B1(n168), 
	.B0(n544), 
	.A1N(n168), 
	.A0N(\reg_file[10][7] ));
   OAI2BB2X1M U451 (.Y(n295), 
	.B1(n172), 
	.B0(n544), 
	.A1N(n172), 
	.A0N(\reg_file[14][7] ));
   OAI2BB2X1M U452 (.Y(n199), 
	.B1(n154), 
	.B0(n544), 
	.A1N(n154), 
	.A0N(REG2[7]));
   AOI22X1M U453 (.Y(n367), 
	.B1(n459), 
	.B0(\reg_file[11][0] ), 
	.A1(n460), 
	.A0(\reg_file[10][0] ));
   AOI22X1M U454 (.Y(n366), 
	.B1(n461), 
	.B0(\reg_file[9][0] ), 
	.A1(n462), 
	.A0(\reg_file[8][0] ));
   AOI21X1M U455 (.Y(n377), 
	.B0(n450), 
	.A1(n366), 
	.A0(n367));
   AOI22X1M U456 (.Y(n369), 
	.B1(n459), 
	.B0(\reg_file[15][0] ), 
	.A1(n460), 
	.A0(\reg_file[14][0] ));
   AOI22X1M U457 (.Y(n368), 
	.B1(n461), 
	.B0(\reg_file[13][0] ), 
	.A1(n462), 
	.A0(\reg_file[12][0] ));
   AOI21X1M U458 (.Y(n376), 
	.B0(n453), 
	.A1(n368), 
	.A0(n369));
   AOI22X1M U459 (.Y(n371), 
	.B1(n459), 
	.B0(REG3[0]), 
	.A1(n460), 
	.A0(REG2[0]));
   AOI22X1M U460 (.Y(n370), 
	.B1(n461), 
	.B0(REG1[0]), 
	.A1(n462), 
	.A0(REG0[0]));
   AOI21X1M U461 (.Y(n375), 
	.B0(n456), 
	.A1(n370), 
	.A0(n371));
   AOI22X1M U462 (.Y(n373), 
	.B1(n459), 
	.B0(\reg_file[7][0] ), 
	.A1(n460), 
	.A0(\reg_file[6][0] ));
   AOI22X1M U463 (.Y(n372), 
	.B1(n461), 
	.B0(\reg_file[5][0] ), 
	.A1(n462), 
	.A0(\reg_file[4][0] ));
   AOI21X1M U464 (.Y(n374), 
	.B0(n463), 
	.A1(n372), 
	.A0(n373));
   OR4X1M U465 (.Y(N43), 
	.D(n374), 
	.C(n375), 
	.B(n376), 
	.A(n377));
   AOI22X1M U466 (.Y(n379), 
	.B1(n459), 
	.B0(\reg_file[11][1] ), 
	.A1(n460), 
	.A0(\reg_file[10][1] ));
   AOI22X1M U467 (.Y(n378), 
	.B1(n461), 
	.B0(\reg_file[9][1] ), 
	.A1(n462), 
	.A0(\reg_file[8][1] ));
   AOI21X1M U468 (.Y(n389), 
	.B0(n450), 
	.A1(n378), 
	.A0(n379));
   AOI22X1M U469 (.Y(n381), 
	.B1(n459), 
	.B0(\reg_file[15][1] ), 
	.A1(n460), 
	.A0(\reg_file[14][1] ));
   AOI22X1M U470 (.Y(n380), 
	.B1(n461), 
	.B0(\reg_file[13][1] ), 
	.A1(n462), 
	.A0(\reg_file[12][1] ));
   AOI21X1M U471 (.Y(n388), 
	.B0(n453), 
	.A1(n380), 
	.A0(n381));
   AOI22X1M U472 (.Y(n383), 
	.B1(n459), 
	.B0(REG3[1]), 
	.A1(n460), 
	.A0(REG2[1]));
   AOI22X1M U473 (.Y(n382), 
	.B1(n461), 
	.B0(REG1[1]), 
	.A1(n462), 
	.A0(REG0[1]));
   AOI21X1M U474 (.Y(n387), 
	.B0(n456), 
	.A1(n382), 
	.A0(n383));
   AOI22X1M U475 (.Y(n385), 
	.B1(n459), 
	.B0(\reg_file[7][1] ), 
	.A1(n460), 
	.A0(\reg_file[6][1] ));
   AOI22X1M U476 (.Y(n384), 
	.B1(n461), 
	.B0(\reg_file[5][1] ), 
	.A1(n462), 
	.A0(\reg_file[4][1] ));
   AOI21X1M U477 (.Y(n386), 
	.B0(n463), 
	.A1(n384), 
	.A0(n385));
   OR4X1M U478 (.Y(N42), 
	.D(n386), 
	.C(n387), 
	.B(n388), 
	.A(n389));
   AOI22X1M U479 (.Y(n391), 
	.B1(n459), 
	.B0(\reg_file[11][2] ), 
	.A1(n460), 
	.A0(\reg_file[10][2] ));
   AOI22X1M U480 (.Y(n390), 
	.B1(n461), 
	.B0(\reg_file[9][2] ), 
	.A1(n462), 
	.A0(\reg_file[8][2] ));
   AOI21X1M U481 (.Y(n401), 
	.B0(n450), 
	.A1(n390), 
	.A0(n391));
   AOI22X1M U482 (.Y(n393), 
	.B1(n459), 
	.B0(\reg_file[15][2] ), 
	.A1(n460), 
	.A0(\reg_file[14][2] ));
   AOI22X1M U483 (.Y(n392), 
	.B1(n461), 
	.B0(n572), 
	.A1(n462), 
	.A0(\reg_file[12][2] ));
   AOI21X1M U484 (.Y(n400), 
	.B0(n453), 
	.A1(n392), 
	.A0(n393));
   AOI22X1M U485 (.Y(n395), 
	.B1(n459), 
	.B0(REG3[2]), 
	.A1(n460), 
	.A0(REG2[2]));
   AOI22X1M U486 (.Y(n394), 
	.B1(n461), 
	.B0(REG1[2]), 
	.A1(n462), 
	.A0(REG0[2]));
   AOI21X1M U487 (.Y(n399), 
	.B0(n456), 
	.A1(n394), 
	.A0(n395));
   AOI22X1M U488 (.Y(n397), 
	.B1(n459), 
	.B0(\reg_file[7][2] ), 
	.A1(n460), 
	.A0(\reg_file[6][2] ));
   AOI22X1M U489 (.Y(n396), 
	.B1(n461), 
	.B0(\reg_file[5][2] ), 
	.A1(n462), 
	.A0(\reg_file[4][2] ));
   AOI21X1M U490 (.Y(n398), 
	.B0(n463), 
	.A1(n396), 
	.A0(n397));
   OR4X1M U491 (.Y(N41), 
	.D(n398), 
	.C(n399), 
	.B(n400), 
	.A(n401));
   AOI22X1M U492 (.Y(n403), 
	.B1(n459), 
	.B0(\reg_file[11][3] ), 
	.A1(n460), 
	.A0(\reg_file[10][3] ));
   AOI22X1M U493 (.Y(n402), 
	.B1(n461), 
	.B0(\reg_file[9][3] ), 
	.A1(n462), 
	.A0(\reg_file[8][3] ));
   AOI21X1M U494 (.Y(n413), 
	.B0(n450), 
	.A1(n402), 
	.A0(n403));
   AOI22X1M U495 (.Y(n405), 
	.B1(n459), 
	.B0(\reg_file[15][3] ), 
	.A1(n460), 
	.A0(\reg_file[14][3] ));
   AOI22X1M U496 (.Y(n404), 
	.B1(n461), 
	.B0(\reg_file[13][3] ), 
	.A1(n462), 
	.A0(\reg_file[12][3] ));
   AOI21X1M U497 (.Y(n412), 
	.B0(n453), 
	.A1(n404), 
	.A0(n405));
   AOI22X1M U498 (.Y(n407), 
	.B1(n459), 
	.B0(REG3[3]), 
	.A1(n460), 
	.A0(REG2[3]));
   AOI22X1M U499 (.Y(n406), 
	.B1(n461), 
	.B0(REG1[3]), 
	.A1(n462), 
	.A0(REG0[3]));
   AOI21X1M U500 (.Y(n411), 
	.B0(n456), 
	.A1(n406), 
	.A0(n407));
   AOI22X1M U501 (.Y(n409), 
	.B1(n459), 
	.B0(\reg_file[7][3] ), 
	.A1(n460), 
	.A0(\reg_file[6][3] ));
   AOI22X1M U502 (.Y(n408), 
	.B1(n461), 
	.B0(\reg_file[5][3] ), 
	.A1(n462), 
	.A0(\reg_file[4][3] ));
   AOI21X1M U503 (.Y(n410), 
	.B0(n463), 
	.A1(n408), 
	.A0(n409));
   OR4X1M U504 (.Y(N40), 
	.D(n410), 
	.C(n411), 
	.B(n412), 
	.A(n413));
   AOI22X1M U505 (.Y(n415), 
	.B1(n459), 
	.B0(\reg_file[11][4] ), 
	.A1(n460), 
	.A0(\reg_file[10][4] ));
   AOI22X1M U506 (.Y(n414), 
	.B1(n461), 
	.B0(\reg_file[9][4] ), 
	.A1(n462), 
	.A0(\reg_file[8][4] ));
   AOI21X1M U507 (.Y(n425), 
	.B0(n450), 
	.A1(n414), 
	.A0(n415));
   AOI22X1M U508 (.Y(n417), 
	.B1(n459), 
	.B0(\reg_file[15][4] ), 
	.A1(n460), 
	.A0(\reg_file[14][4] ));
   AOI22X1M U509 (.Y(n416), 
	.B1(n461), 
	.B0(\reg_file[13][4] ), 
	.A1(n462), 
	.A0(\reg_file[12][4] ));
   AOI21X1M U510 (.Y(n424), 
	.B0(n453), 
	.A1(n416), 
	.A0(n417));
   AOI22X1M U511 (.Y(n419), 
	.B1(n459), 
	.B0(REG3[4]), 
	.A1(n460), 
	.A0(REG2[4]));
   AOI22X1M U512 (.Y(n418), 
	.B1(n461), 
	.B0(REG1[4]), 
	.A1(n462), 
	.A0(REG0[4]));
   AOI21X1M U513 (.Y(n423), 
	.B0(n456), 
	.A1(n418), 
	.A0(n419));
   AOI22X1M U514 (.Y(n421), 
	.B1(n459), 
	.B0(\reg_file[7][4] ), 
	.A1(n460), 
	.A0(\reg_file[6][4] ));
   AOI22X1M U515 (.Y(n420), 
	.B1(n461), 
	.B0(\reg_file[5][4] ), 
	.A1(n462), 
	.A0(\reg_file[4][4] ));
   AOI21X1M U516 (.Y(n422), 
	.B0(n463), 
	.A1(n420), 
	.A0(n421));
   OR4X1M U517 (.Y(N39), 
	.D(n422), 
	.C(n423), 
	.B(n424), 
	.A(n425));
   AOI22X1M U518 (.Y(n427), 
	.B1(n459), 
	.B0(\reg_file[11][5] ), 
	.A1(n460), 
	.A0(\reg_file[10][5] ));
   AOI22X1M U519 (.Y(n426), 
	.B1(n461), 
	.B0(\reg_file[9][5] ), 
	.A1(n462), 
	.A0(\reg_file[8][5] ));
   AOI21X1M U520 (.Y(n437), 
	.B0(n450), 
	.A1(n426), 
	.A0(n427));
   AOI22X1M U521 (.Y(n429), 
	.B1(n459), 
	.B0(\reg_file[15][5] ), 
	.A1(n460), 
	.A0(\reg_file[14][5] ));
   AOI22X1M U522 (.Y(n428), 
	.B1(n461), 
	.B0(\reg_file[13][5] ), 
	.A1(n462), 
	.A0(\reg_file[12][5] ));
   AOI21X1M U523 (.Y(n436), 
	.B0(n453), 
	.A1(n428), 
	.A0(n429));
   AOI22X1M U524 (.Y(n431), 
	.B1(n459), 
	.B0(REG3[5]), 
	.A1(n460), 
	.A0(REG2[5]));
   AOI22X1M U525 (.Y(n430), 
	.B1(n461), 
	.B0(REG1[5]), 
	.A1(n462), 
	.A0(REG0[5]));
   AOI21X1M U526 (.Y(n435), 
	.B0(n456), 
	.A1(n430), 
	.A0(n431));
   AOI22X1M U527 (.Y(n433), 
	.B1(n459), 
	.B0(\reg_file[7][5] ), 
	.A1(n460), 
	.A0(\reg_file[6][5] ));
   AOI22X1M U528 (.Y(n432), 
	.B1(n461), 
	.B0(\reg_file[5][5] ), 
	.A1(n462), 
	.A0(\reg_file[4][5] ));
   AOI21X1M U529 (.Y(n434), 
	.B0(n463), 
	.A1(n432), 
	.A0(n433));
   OR4X1M U530 (.Y(N38), 
	.D(n434), 
	.C(n435), 
	.B(n436), 
	.A(n437));
   AOI22X1M U531 (.Y(n439), 
	.B1(n459), 
	.B0(\reg_file[11][6] ), 
	.A1(n460), 
	.A0(\reg_file[10][6] ));
   AOI22X1M U532 (.Y(n438), 
	.B1(n461), 
	.B0(\reg_file[9][6] ), 
	.A1(n462), 
	.A0(\reg_file[8][6] ));
   AOI21X1M U533 (.Y(n449), 
	.B0(n450), 
	.A1(n438), 
	.A0(n439));
   AOI22X1M U534 (.Y(n441), 
	.B1(n459), 
	.B0(\reg_file[15][6] ), 
	.A1(n460), 
	.A0(\reg_file[14][6] ));
   AOI22X1M U535 (.Y(n440), 
	.B1(n461), 
	.B0(\reg_file[13][6] ), 
	.A1(n462), 
	.A0(\reg_file[12][6] ));
   AOI21X1M U536 (.Y(n448), 
	.B0(n453), 
	.A1(n440), 
	.A0(n441));
   AOI22X1M U537 (.Y(n443), 
	.B1(n459), 
	.B0(REG3[6]), 
	.A1(n460), 
	.A0(REG2[6]));
   AOI22X1M U538 (.Y(n442), 
	.B1(n461), 
	.B0(REG1[6]), 
	.A1(n462), 
	.A0(REG0[6]));
   AOI21X1M U539 (.Y(n447), 
	.B0(n456), 
	.A1(n442), 
	.A0(n443));
   AOI22X1M U540 (.Y(n445), 
	.B1(n459), 
	.B0(\reg_file[7][6] ), 
	.A1(n460), 
	.A0(\reg_file[6][6] ));
   AOI22X1M U541 (.Y(n444), 
	.B1(n461), 
	.B0(\reg_file[5][6] ), 
	.A1(n462), 
	.A0(\reg_file[4][6] ));
   AOI21X1M U542 (.Y(n446), 
	.B0(n463), 
	.A1(n444), 
	.A0(n445));
   OR4X1M U543 (.Y(N37), 
	.D(n446), 
	.C(n447), 
	.B(n448), 
	.A(n449));
   AOI22X1M U544 (.Y(n452), 
	.B1(n459), 
	.B0(\reg_file[11][7] ), 
	.A1(n460), 
	.A0(\reg_file[10][7] ));
   AOI22X1M U545 (.Y(n451), 
	.B1(n461), 
	.B0(\reg_file[9][7] ), 
	.A1(n462), 
	.A0(\reg_file[8][7] ));
   AOI21X1M U546 (.Y(n469), 
	.B0(n450), 
	.A1(n451), 
	.A0(n452));
   AOI22X1M U547 (.Y(n455), 
	.B1(n459), 
	.B0(\reg_file[15][7] ), 
	.A1(n460), 
	.A0(\reg_file[14][7] ));
   AOI22X1M U548 (.Y(n454), 
	.B1(n461), 
	.B0(\reg_file[13][7] ), 
	.A1(n462), 
	.A0(\reg_file[12][7] ));
   AOI21X1M U549 (.Y(n468), 
	.B0(n453), 
	.A1(n454), 
	.A0(n455));
   AOI22X1M U550 (.Y(n458), 
	.B1(n459), 
	.B0(REG3[7]), 
	.A1(n460), 
	.A0(REG2[7]));
   AOI22X1M U551 (.Y(n457), 
	.B1(n461), 
	.B0(REG1[7]), 
	.A1(n462), 
	.A0(REG0[7]));
   AOI21X1M U552 (.Y(n467), 
	.B0(n456), 
	.A1(n457), 
	.A0(n458));
   AOI22X1M U553 (.Y(n465), 
	.B1(n459), 
	.B0(\reg_file[7][7] ), 
	.A1(n460), 
	.A0(\reg_file[6][7] ));
   AOI22X1M U554 (.Y(n464), 
	.B1(n461), 
	.B0(\reg_file[5][7] ), 
	.A1(n462), 
	.A0(\reg_file[4][7] ));
   AOI21X1M U555 (.Y(n466), 
	.B0(n463), 
	.A1(n464), 
	.A0(n465));
   OR4X1M U556 (.Y(N36), 
	.D(n466), 
	.C(n467), 
	.B(n468), 
	.A(n469));
   INVXLM U557 (.Y(n571), 
	.A(\reg_file[13][2] ));
   INVXLM U558 (.Y(n572), 
	.A(n571));
   DLY1X1M U559 (.Y(n573), 
	.A(n639));
   DLY1X1M U560 (.Y(n574), 
	.A(n640));
   DLY1X1M U561 (.Y(n575), 
	.A(n646));
   DLY1X1M U562 (.Y(n576), 
	.A(n648));
   DLY1X1M U563 (.Y(n577), 
	.A(n650));
   DLY1X1M U564 (.Y(n578), 
	.A(n651));
   DLY1X1M U565 (.Y(n579), 
	.A(n652));
   DLY1X1M U566 (.Y(n580), 
	.A(n642));
   DLY1X1M U567 (.Y(n581), 
	.A(n643));
   DLY1X1M U568 (.Y(n582), 
	.A(n644));
   DLY1X1M U569 (.Y(n583), 
	.A(n645));
   DLY1X1M U571 (.Y(n585), 
	.A(n698));
   DLY1X1M U572 (.Y(n586), 
	.A(n700));
   DLY1X1M U573 (.Y(n587), 
	.A(n701));
   DLY1X1M U574 (.Y(n588), 
	.A(n703));
   DLY1X1M U575 (.Y(n589), 
	.A(n704));
   DLY1X1M U576 (.Y(n590), 
	.A(n706));
   DLY1X1M U577 (.Y(n591), 
	.A(n707));
   DLY1X1M U578 (.Y(n592), 
	.A(n653));
   DLY1X1M U579 (.Y(n593), 
	.A(n655));
   DLY1X1M U580 (.Y(n594), 
	.A(n657));
   DLY1X1M U581 (.Y(n595), 
	.A(n661));
   DLY1X1M U582 (.Y(n596), 
	.A(n662));
   DLY1X1M U583 (.Y(n597), 
	.A(n664));
   DLY1X1M U584 (.Y(n598), 
	.A(n665));
   DLY1X1M U585 (.Y(n599), 
	.A(n667));
   DLY1X1M U586 (.Y(n600), 
	.A(n668));
   DLY1X1M U587 (.Y(n601), 
	.A(n574));
   DLY1X1M U588 (.Y(n602), 
	.A(n671));
   DLY1X1M U589 (.Y(n603), 
	.A(n673));
   DLY1X1M U590 (.Y(n604), 
	.A(n674));
   DLY1X1M U591 (.Y(n605), 
	.A(n676));
   DLY1X1M U592 (.Y(n606), 
	.A(n677));
   DLY1X1M U593 (.Y(n607), 
	.A(n679));
   DLY1X1M U594 (.Y(n608), 
	.A(n680));
   DLY1X1M U595 (.Y(n609), 
	.A(n682));
   DLY1X1M U596 (.Y(n610), 
	.A(n683));
   DLY1X1M U597 (.Y(n611), 
	.A(n685));
   DLY1X1M U598 (.Y(n612), 
	.A(n686));
   DLY1X1M U599 (.Y(n613), 
	.A(n688));
   DLY1X1M U600 (.Y(n614), 
	.A(n689));
   DLY1X1M U601 (.Y(n615), 
	.A(n691));
   DLY1X1M U602 (.Y(n616), 
	.A(n692));
   DLY1X1M U603 (.Y(n617), 
	.A(n694));
   DLY1X1M U604 (.Y(n618), 
	.A(n695));
   DLY1X1M U605 (.Y(n619), 
	.A(n699));
   DLY1X1M U606 (.Y(n620), 
	.A(n702));
   DLY1X1M U607 (.Y(n621), 
	.A(n705));
   DLY1X1M U608 (.Y(n622), 
	.A(n654));
   DLY1X1M U609 (.Y(n623), 
	.A(n656));
   DLY1X1M U610 (.Y(n624), 
	.A(n658));
   DLY1X1M U611 (.Y(n625), 
	.A(n660));
   DLY1X1M U612 (.Y(n626), 
	.A(n663));
   DLY1X1M U613 (.Y(n627), 
	.A(n666));
   DLY1X1M U614 (.Y(n628), 
	.A(n669));
   DLY1X1M U615 (.Y(n629), 
	.A(n672));
   DLY1X1M U616 (.Y(n630), 
	.A(n675));
   DLY1X1M U617 (.Y(n631), 
	.A(n678));
   DLY1X1M U618 (.Y(n632), 
	.A(n681));
   DLY1X1M U619 (.Y(n633), 
	.A(n684));
   DLY1X1M U621 (.Y(n635), 
	.A(n690));
   DLY1X1M U622 (.Y(n636), 
	.A(n693));
   DLY1X1M U623 (.Y(n637), 
	.A(n696));
   DLY1X1M U624 (.Y(n638), 
	.A(n708));
   DLY1X1M U625 (.Y(n639), 
	.A(n575));
   DLY1X1M U626 (.Y(n640), 
	.A(n649));
   DLY1X1M U627 (.Y(n641), 
	.A(n649));
   DLY1X1M U628 (.Y(n642), 
	.A(n648));
   DLY1X1M U629 (.Y(n643), 
	.A(n573));
   DLY1X1M U630 (.Y(n644), 
	.A(n576));
   DLY1X1M U631 (.Y(n645), 
	.A(n639));
   DLY1X1M U632 (.Y(n646), 
	.A(test_se));
   DLY1X1M U633 (.Y(n647), 
	.A(n575));
   DLY1X1M U634 (.Y(n648), 
	.A(n646));
   DLY1X1M U635 (.Y(n649), 
	.A(n647));
   DLY1X1M U636 (.Y(n650), 
	.A(n647));
   DLY1X1M U637 (.Y(n651), 
	.A(n573));
   DLY1X1M U638 (.Y(n652), 
	.A(n576));
   DLY1X1M U639 (.Y(n653), 
	.A(n578));
   DLY1X1M U640 (.Y(n654), 
	.A(n653));
   DLY1X1M U641 (.Y(n655), 
	.A(n577));
   DLY1X1M U642 (.Y(n656), 
	.A(n655));
   DLY1X1M U643 (.Y(n657), 
	.A(n579));
   DLY1X1M U644 (.Y(n658), 
	.A(n657));
   DLY1X1M U645 (.Y(n659), 
	.A(n574));
   DLY1X1M U646 (.Y(n660), 
	.A(n659));
   DLY1X1M U647 (.Y(n661), 
	.A(n645));
   DLY1X1M U648 (.Y(n662), 
	.A(n661));
   DLY1X1M U649 (.Y(n663), 
	.A(n662));
   DLY1X1M U650 (.Y(n664), 
	.A(n577));
   DLY1X1M U651 (.Y(n665), 
	.A(n664));
   DLY1X1M U652 (.Y(n666), 
	.A(n665));
   DLY1X1M U653 (.Y(n667), 
	.A(n578));
   DLY1X1M U654 (.Y(n668), 
	.A(n667));
   DLY1X1M U655 (.Y(n669), 
	.A(n668));
   DLY1X1M U656 (.Y(n670), 
	.A(n640));
   DLY1X1M U657 (.Y(n671), 
	.A(n670));
   DLY1X1M U658 (.Y(n672), 
	.A(n671));
   DLY1X1M U659 (.Y(n673), 
	.A(n641));
   DLY1X1M U660 (.Y(n674), 
	.A(n673));
   DLY1X1M U661 (.Y(n675), 
	.A(n674));
   DLY1X1M U662 (.Y(n676), 
	.A(n651));
   DLY1X1M U663 (.Y(n677), 
	.A(n676));
   DLY1X1M U664 (.Y(n678), 
	.A(n677));
   DLY1X1M U665 (.Y(n679), 
	.A(n580));
   DLY1X1M U666 (.Y(n680), 
	.A(n679));
   DLY1X1M U667 (.Y(n681), 
	.A(n680));
   DLY1X1M U668 (.Y(n682), 
	.A(n579));
   DLY1X1M U669 (.Y(n683), 
	.A(n682));
   DLY1X1M U670 (.Y(n684), 
	.A(n683));
   DLY1X1M U671 (.Y(n685), 
	.A(n652));
   DLY1X1M U672 (.Y(n686), 
	.A(n685));
   DLY1X1M U673 (.Y(n687), 
	.A(n686));
   DLY1X1M U674 (.Y(n688), 
	.A(n642));
   DLY1X1M U675 (.Y(n689), 
	.A(n688));
   DLY1X1M U676 (.Y(n690), 
	.A(n689));
   DLY1X1M U677 (.Y(n691), 
	.A(n643));
   DLY1X1M U678 (.Y(n692), 
	.A(n691));
   DLY1X1M U679 (.Y(n693), 
	.A(n692));
   DLY1X1M U680 (.Y(n694), 
	.A(n644));
   DLY1X1M U681 (.Y(n695), 
	.A(n694));
   DLY1X1M U682 (.Y(n696), 
	.A(n695));
   DLY1X1M U683 (.Y(n697), 
	.A(n582));
   DLY1X1M U684 (.Y(n698), 
	.A(n697));
   DLY1X1M U686 (.Y(n700), 
	.A(n581));
   DLY1X1M U687 (.Y(n701), 
	.A(n700));
   DLY1X1M U688 (.Y(n702), 
	.A(n701));
   DLY1X1M U689 (.Y(n703), 
	.A(n583));
   DLY1X1M U690 (.Y(n704), 
	.A(n703));
   DLY1X1M U691 (.Y(n705), 
	.A(n704));
   DLY1X1M U692 (.Y(n706), 
	.A(n650));
   DLY1X1M U693 (.Y(n707), 
	.A(n706));
   DLY1X1M U694 (.Y(n708), 
	.A(n707));
   SDFFRQX2M \reg_file_reg[1][6]  (.SI(n556), 
	.SE(n590), 
	.RN(FE_OFN0_RST_Domain_1_M), 
	.Q(n555), 
	.D(n190), 
	.CK(REF_CLK_M__L8_N6));
   SDFFRQX2M \reg_file_reg[0][6]  (.SI(n548), 
	.SE(n590), 
	.RN(FE_OFN1_RST_Domain_1_M), 
	.Q(n547), 
	.D(n182), 
	.CK(REF_CLK_M__L8_N6));
   SDFFRQX2M \reg_file_reg[2][6]  (.SI(REG2[5]), 
	.SE(n591), 
	.RN(FE_OFN0_RST_Domain_1_M), 
	.Q(n563), 
	.D(n198), 
	.CK(REF_CLK_M__L8_N11));
   SDFFRQX2M \reg_file_reg[0][7]  (.SI(n547), 
	.SE(n591), 
	.RN(FE_OFN0_RST_Domain_1_M), 
	.Q(n546), 
	.D(n183), 
	.CK(REF_CLK_M__L8_N6));
   SDFFRQX2M \reg_file_reg[2][2]  (.SI(REG2[1]), 
	.SE(n588), 
	.RN(FE_OFN0_RST_Domain_1_M), 
	.Q(n566), 
	.D(n194), 
	.CK(REF_CLK_M__L8_N11));
   SDFFRQX2M \reg_file_reg[0][0]  (.SI(RD_Valid), 
	.SE(n588), 
	.RN(FE_OFN0_RST_Domain_1_M), 
	.Q(n553), 
	.D(n176), 
	.CK(REF_CLK_M__L8_N6));
   SDFFRQX2M \reg_file_reg[0][1]  (.SI(n553), 
	.SE(n705), 
	.RN(FE_OFN1_RST_Domain_1_M), 
	.Q(n552), 
	.D(n177), 
	.CK(REF_CLK_M__L8_N6));
   SDFFRQX2M \reg_file_reg[1][3]  (.SI(n559), 
	.SE(n586), 
	.RN(FE_OFN1_RST_Domain_1_M), 
	.Q(n558), 
	.D(n187), 
	.CK(REF_CLK_M__L8_N6));
   SDFFRQX2M \reg_file_reg[1][2]  (.SI(n560), 
	.SE(n586), 
	.RN(FE_OFN0_RST_Domain_1_M), 
	.Q(n559), 
	.D(n186), 
	.CK(REF_CLK_M__L8_N6));
   SDFFRQX2M \reg_file_reg[0][5]  (.SI(n549), 
	.SE(n589), 
	.RN(FE_OFN1_RST_Domain_1_M), 
	.Q(n548), 
	.D(n181), 
	.CK(REF_CLK_M__L8_N6));
   SDFFRQX2M \reg_file_reg[0][4]  (.SI(n550), 
	.SE(n589), 
	.RN(FE_OFN1_RST_Domain_1_M), 
	.Q(n549), 
	.D(n180), 
	.CK(REF_CLK_M__L8_N6));
   SDFFRQX2M \reg_file_reg[3][2]  (.SI(REG3[1]), 
	.SE(n585), 
	.RN(rst), 
	.Q(n3), 
	.D(n202), 
	.CK(REF_CLK_M__L8_N12));
   SDFFRQX2M \reg_file_reg[1][5]  (.SI(test_si2), 
	.SE(n702), 
	.RN(FE_OFN0_RST_Domain_1_M), 
	.Q(n556), 
	.D(n189), 
	.CK(REF_CLK_M__L8_N7));
   SDFFRQX2M \reg_file_reg[1][0]  (.SI(n546), 
	.SE(n587), 
	.RN(FE_OFN0_RST_Domain_1_M), 
	.Q(n561), 
	.D(n184), 
	.CK(REF_CLK_M__L8_N6));
   SDFFRQX2M \reg_file_reg[0][3]  (.SI(n551), 
	.SE(n621), 
	.RN(FE_OFN1_RST_Domain_1_M), 
	.Q(n550), 
	.D(n179), 
	.CK(REF_CLK_M__L8_N6));
   SDFFRQX2M \reg_file_reg[0][2]  (.SI(n552), 
	.SE(n621), 
	.RN(FE_OFN1_RST_Domain_1_M), 
	.Q(n551), 
	.D(n178), 
	.CK(REF_CLK_M__L8_N6));
   SDFFRQX2M \reg_file_reg[1][7]  (.SI(n555), 
	.SE(n620), 
	.RN(FE_OFN0_RST_Domain_1_M), 
	.Q(n554), 
	.D(n191), 
	.CK(REF_CLK_M__L8_N6));
   SDFFRQX2M \reg_file_reg[1][1]  (.SI(n561), 
	.SE(n620), 
	.RN(FE_OFN0_RST_Domain_1_M), 
	.Q(n560), 
	.D(n185), 
	.CK(REF_CLK_M__L8_N6));
   SDFFRQX4M \reg_file_reg[3][6]  (.SI(REG3[5]), 
	.SE(n619), 
	.RN(rst), 
	.Q(REG3[6]), 
	.D(n206), 
	.CK(REF_CLK_M__L8_N12));
   SDFFRQX4M \reg_file_reg[3][1]  (.SI(REG3[0]), 
	.SE(n619), 
	.RN(rst), 
	.Q(REG3[1]), 
	.D(n201), 
	.CK(REF_CLK_M__L8_N12));
   SDFFRQX4M \reg_file_reg[3][4]  (.SI(REG3[3]), 
	.SE(n699), 
	.RN(rst), 
	.Q(REG3[4]), 
	.D(n204), 
	.CK(REF_CLK_M__L8_N12));
   SDFFRQX4M \reg_file_reg[3][3]  (.SI(REG3[2]), 
	.SE(n585), 
	.RN(rst), 
	.Q(REG3[3]), 
	.D(n203), 
	.CK(REF_CLK_M__L8_N12));
   SDFFRQX4M \reg_file_reg[3][7]  (.SI(REG3[6]), 
	.SE(n584), 
	.RN(rst), 
	.Q(REG3[7]), 
	.D(n207), 
	.CK(REF_CLK_M__L8_N12));
   SDFFRQX4M \reg_file_reg[3][0]  (.SI(REG2[7]), 
	.SE(n584), 
	.RN(rst), 
	.Q(REG3[0]), 
	.D(n200), 
	.CK(REF_CLK_M__L8_N12));
   SDFFRQX1M \reg_file_reg[1][4]  (.SI(n558), 
	.SE(n587), 
	.RN(FE_OFN1_RST_Domain_1_M), 
	.Q(n557), 
	.D(n188), 
	.CK(REF_CLK_M__L8_N6));
   SDFFRQX4M \reg_file_reg[13][2]  (.SI(\reg_file[13][1] ), 
	.SE(n634), 
	.RN(FE_OFN0_RST_Domain_1_M), 
	.Q(\reg_file[13][2] ), 
	.D(n282), 
	.CK(REF_CLK_M__L8_N4));
   BUFX2M U3 (.Y(n634), 
	.A(n687));
   BUFX2M U4 (.Y(n584), 
	.A(n697));
   INVXLM U5 (.Y(n1), 
	.A(n3));
   CLKINVX2M U6 (.Y(REG3[2]), 
	.A(n1));
   BUFX2M U7 (.Y(n699), 
	.A(n698));
endmodule

module decoder (
	alu_fun, 
	arith_en, 
	logic_en, 
	cmp_en, 
	shift_en, 
	n25, 
	n6);
   input [1:0] alu_fun;
   output arith_en;
   output logic_en;
   output cmp_en;
   output shift_en;
   input n25;
   input n6;

   // Internal wires
   wire n2;

   NOR2X2M U3 (.Y(shift_en), 
	.B(n2), 
	.A(n25));
   OR2X2M U4 (.Y(n2), 
	.B(cmp_en), 
	.A(n6));
   NOR2X2M U6 (.Y(arith_en), 
	.B(n2), 
	.A(alu_fun[0]));
   NOR2BX2M U7 (.Y(cmp_en), 
	.B(alu_fun[0]), 
	.AN(alu_fun[1]));
endmodule

module arithmetic_unit_DW_div_uns_0 (
	a, 
	b, 
	quotient, 
	remainder, 
	divide_by_0);
   input [7:0] a;
   input [7:0] b;
   output [7:0] quotient;
   output [7:0] remainder;
   output divide_by_0;

   // Internal wires
   wire \u_div/SumTmp[1][0] ;
   wire \u_div/SumTmp[1][1] ;
   wire \u_div/SumTmp[1][2] ;
   wire \u_div/SumTmp[1][3] ;
   wire \u_div/SumTmp[1][4] ;
   wire \u_div/SumTmp[1][5] ;
   wire \u_div/SumTmp[1][6] ;
   wire \u_div/SumTmp[2][0] ;
   wire \u_div/SumTmp[2][1] ;
   wire \u_div/SumTmp[2][2] ;
   wire \u_div/SumTmp[2][3] ;
   wire \u_div/SumTmp[2][4] ;
   wire \u_div/SumTmp[2][5] ;
   wire \u_div/SumTmp[3][0] ;
   wire \u_div/SumTmp[3][1] ;
   wire \u_div/SumTmp[3][2] ;
   wire \u_div/SumTmp[3][3] ;
   wire \u_div/SumTmp[3][4] ;
   wire \u_div/SumTmp[4][0] ;
   wire \u_div/SumTmp[4][1] ;
   wire \u_div/SumTmp[4][2] ;
   wire \u_div/SumTmp[4][3] ;
   wire \u_div/SumTmp[5][0] ;
   wire \u_div/SumTmp[5][1] ;
   wire \u_div/SumTmp[5][2] ;
   wire \u_div/SumTmp[6][0] ;
   wire \u_div/SumTmp[6][1] ;
   wire \u_div/SumTmp[7][0] ;
   wire \u_div/CryTmp[0][1] ;
   wire \u_div/CryTmp[0][2] ;
   wire \u_div/CryTmp[0][3] ;
   wire \u_div/CryTmp[0][4] ;
   wire \u_div/CryTmp[0][5] ;
   wire \u_div/CryTmp[0][6] ;
   wire \u_div/CryTmp[0][7] ;
   wire \u_div/CryTmp[1][1] ;
   wire \u_div/CryTmp[1][2] ;
   wire \u_div/CryTmp[1][3] ;
   wire \u_div/CryTmp[1][4] ;
   wire \u_div/CryTmp[1][5] ;
   wire \u_div/CryTmp[1][6] ;
   wire \u_div/CryTmp[1][7] ;
   wire \u_div/CryTmp[2][1] ;
   wire \u_div/CryTmp[2][2] ;
   wire \u_div/CryTmp[2][3] ;
   wire \u_div/CryTmp[2][4] ;
   wire \u_div/CryTmp[2][5] ;
   wire \u_div/CryTmp[2][6] ;
   wire \u_div/CryTmp[3][1] ;
   wire \u_div/CryTmp[3][2] ;
   wire \u_div/CryTmp[3][3] ;
   wire \u_div/CryTmp[3][4] ;
   wire \u_div/CryTmp[3][5] ;
   wire \u_div/CryTmp[4][1] ;
   wire \u_div/CryTmp[4][2] ;
   wire \u_div/CryTmp[4][3] ;
   wire \u_div/CryTmp[4][4] ;
   wire \u_div/CryTmp[5][1] ;
   wire \u_div/CryTmp[5][2] ;
   wire \u_div/CryTmp[5][3] ;
   wire \u_div/CryTmp[6][1] ;
   wire \u_div/CryTmp[6][2] ;
   wire \u_div/CryTmp[7][1] ;
   wire \u_div/PartRem[1][1] ;
   wire \u_div/PartRem[1][2] ;
   wire \u_div/PartRem[1][3] ;
   wire \u_div/PartRem[1][4] ;
   wire \u_div/PartRem[1][5] ;
   wire \u_div/PartRem[1][6] ;
   wire \u_div/PartRem[1][7] ;
   wire \u_div/PartRem[2][1] ;
   wire \u_div/PartRem[2][2] ;
   wire \u_div/PartRem[2][3] ;
   wire \u_div/PartRem[2][4] ;
   wire \u_div/PartRem[2][5] ;
   wire \u_div/PartRem[2][6] ;
   wire \u_div/PartRem[3][1] ;
   wire \u_div/PartRem[3][2] ;
   wire \u_div/PartRem[3][3] ;
   wire \u_div/PartRem[3][4] ;
   wire \u_div/PartRem[3][5] ;
   wire \u_div/PartRem[4][1] ;
   wire \u_div/PartRem[4][2] ;
   wire \u_div/PartRem[4][3] ;
   wire \u_div/PartRem[4][4] ;
   wire \u_div/PartRem[5][1] ;
   wire \u_div/PartRem[5][2] ;
   wire \u_div/PartRem[5][3] ;
   wire \u_div/PartRem[6][1] ;
   wire \u_div/PartRem[6][2] ;
   wire \u_div/PartRem[7][1] ;
   wire n1;
   wire n2;
   wire n3;
   wire n4;
   wire n5;
   wire n6;
   wire n7;
   wire n8;
   wire n9;
   wire n10;
   wire n11;

   ADDFX2M \u_div/u_fa_PartRem_0_6_1  (.S(\u_div/SumTmp[6][1] ), 
	.CO(\u_div/CryTmp[6][2] ), 
	.CI(\u_div/CryTmp[6][1] ), 
	.B(n7), 
	.A(\u_div/PartRem[7][1] ));
   ADDFX2M \u_div/u_fa_PartRem_0_1_1  (.S(\u_div/SumTmp[1][1] ), 
	.CO(\u_div/CryTmp[1][2] ), 
	.CI(\u_div/CryTmp[1][1] ), 
	.B(n7), 
	.A(\u_div/PartRem[2][1] ));
   ADDFX2M \u_div/u_fa_PartRem_0_2_1  (.S(\u_div/SumTmp[2][1] ), 
	.CO(\u_div/CryTmp[2][2] ), 
	.CI(\u_div/CryTmp[2][1] ), 
	.B(n7), 
	.A(\u_div/PartRem[3][1] ));
   ADDFX2M \u_div/u_fa_PartRem_0_3_1  (.S(\u_div/SumTmp[3][1] ), 
	.CO(\u_div/CryTmp[3][2] ), 
	.CI(\u_div/CryTmp[3][1] ), 
	.B(n7), 
	.A(\u_div/PartRem[4][1] ));
   ADDFX2M \u_div/u_fa_PartRem_0_4_1  (.S(\u_div/SumTmp[4][1] ), 
	.CO(\u_div/CryTmp[4][2] ), 
	.CI(\u_div/CryTmp[4][1] ), 
	.B(n7), 
	.A(\u_div/PartRem[5][1] ));
   ADDFX2M \u_div/u_fa_PartRem_0_5_1  (.S(\u_div/SumTmp[5][1] ), 
	.CO(\u_div/CryTmp[5][2] ), 
	.CI(\u_div/CryTmp[5][1] ), 
	.B(n7), 
	.A(\u_div/PartRem[6][1] ));
   ADDFX2M \u_div/u_fa_PartRem_0_1_6  (.S(\u_div/SumTmp[1][6] ), 
	.CO(\u_div/CryTmp[1][7] ), 
	.CI(\u_div/CryTmp[1][6] ), 
	.B(n2), 
	.A(\u_div/PartRem[2][6] ));
   ADDFX2M \u_div/u_fa_PartRem_0_2_5  (.S(\u_div/SumTmp[2][5] ), 
	.CO(\u_div/CryTmp[2][6] ), 
	.CI(\u_div/CryTmp[2][5] ), 
	.B(n3), 
	.A(\u_div/PartRem[3][5] ));
   ADDFX2M \u_div/u_fa_PartRem_0_4_3  (.S(\u_div/SumTmp[4][3] ), 
	.CO(\u_div/CryTmp[4][4] ), 
	.CI(\u_div/CryTmp[4][3] ), 
	.B(n5), 
	.A(\u_div/PartRem[5][3] ));
   ADDFX2M \u_div/u_fa_PartRem_0_3_4  (.S(\u_div/SumTmp[3][4] ), 
	.CO(\u_div/CryTmp[3][5] ), 
	.CI(\u_div/CryTmp[3][4] ), 
	.B(n4), 
	.A(\u_div/PartRem[4][4] ));
   ADDFX2M \u_div/u_fa_PartRem_0_5_2  (.S(\u_div/SumTmp[5][2] ), 
	.CO(\u_div/CryTmp[5][3] ), 
	.CI(\u_div/CryTmp[5][2] ), 
	.B(n6), 
	.A(\u_div/PartRem[6][2] ));
   ADDFX2M \u_div/u_fa_PartRem_0_0_4  (.CO(\u_div/CryTmp[0][5] ), 
	.CI(\u_div/CryTmp[0][4] ), 
	.B(n4), 
	.A(\u_div/PartRem[1][4] ));
   ADDFX2M \u_div/u_fa_PartRem_0_0_5  (.CO(\u_div/CryTmp[0][6] ), 
	.CI(\u_div/CryTmp[0][5] ), 
	.B(n3), 
	.A(\u_div/PartRem[1][5] ));
   ADDFX2M \u_div/u_fa_PartRem_0_0_6  (.CO(\u_div/CryTmp[0][7] ), 
	.CI(\u_div/CryTmp[0][6] ), 
	.B(n2), 
	.A(\u_div/PartRem[1][6] ));
   ADDFX2M \u_div/u_fa_PartRem_0_1_5  (.S(\u_div/SumTmp[1][5] ), 
	.CO(\u_div/CryTmp[1][6] ), 
	.CI(\u_div/CryTmp[1][5] ), 
	.B(n3), 
	.A(\u_div/PartRem[2][5] ));
   ADDFX2M \u_div/u_fa_PartRem_0_1_4  (.S(\u_div/SumTmp[1][4] ), 
	.CO(\u_div/CryTmp[1][5] ), 
	.CI(\u_div/CryTmp[1][4] ), 
	.B(n4), 
	.A(\u_div/PartRem[2][4] ));
   ADDFX2M \u_div/u_fa_PartRem_0_2_4  (.S(\u_div/SumTmp[2][4] ), 
	.CO(\u_div/CryTmp[2][5] ), 
	.CI(\u_div/CryTmp[2][4] ), 
	.B(n4), 
	.A(\u_div/PartRem[3][4] ));
   ADDFX2M \u_div/u_fa_PartRem_0_0_1  (.CO(\u_div/CryTmp[0][2] ), 
	.CI(\u_div/CryTmp[0][1] ), 
	.B(n7), 
	.A(\u_div/PartRem[1][1] ));
   ADDFX2M \u_div/u_fa_PartRem_0_0_2  (.CO(\u_div/CryTmp[0][3] ), 
	.CI(\u_div/CryTmp[0][2] ), 
	.B(n6), 
	.A(\u_div/PartRem[1][2] ));
   ADDFX2M \u_div/u_fa_PartRem_0_0_3  (.CO(\u_div/CryTmp[0][4] ), 
	.CI(\u_div/CryTmp[0][3] ), 
	.B(n5), 
	.A(\u_div/PartRem[1][3] ));
   ADDFX2M \u_div/u_fa_PartRem_0_1_3  (.S(\u_div/SumTmp[1][3] ), 
	.CO(\u_div/CryTmp[1][4] ), 
	.CI(\u_div/CryTmp[1][3] ), 
	.B(n5), 
	.A(\u_div/PartRem[2][3] ));
   ADDFX2M \u_div/u_fa_PartRem_0_2_3  (.S(\u_div/SumTmp[2][3] ), 
	.CO(\u_div/CryTmp[2][4] ), 
	.CI(\u_div/CryTmp[2][3] ), 
	.B(n5), 
	.A(\u_div/PartRem[3][3] ));
   ADDFX2M \u_div/u_fa_PartRem_0_3_3  (.S(\u_div/SumTmp[3][3] ), 
	.CO(\u_div/CryTmp[3][4] ), 
	.CI(\u_div/CryTmp[3][3] ), 
	.B(n5), 
	.A(\u_div/PartRem[4][3] ));
   ADDFX2M \u_div/u_fa_PartRem_0_1_2  (.S(\u_div/SumTmp[1][2] ), 
	.CO(\u_div/CryTmp[1][3] ), 
	.CI(\u_div/CryTmp[1][2] ), 
	.B(n6), 
	.A(\u_div/PartRem[2][2] ));
   ADDFX2M \u_div/u_fa_PartRem_0_2_2  (.S(\u_div/SumTmp[2][2] ), 
	.CO(\u_div/CryTmp[2][3] ), 
	.CI(\u_div/CryTmp[2][2] ), 
	.B(n6), 
	.A(\u_div/PartRem[3][2] ));
   ADDFX2M \u_div/u_fa_PartRem_0_3_2  (.S(\u_div/SumTmp[3][2] ), 
	.CO(\u_div/CryTmp[3][3] ), 
	.CI(\u_div/CryTmp[3][2] ), 
	.B(n6), 
	.A(\u_div/PartRem[4][2] ));
   ADDFX2M \u_div/u_fa_PartRem_0_4_2  (.S(\u_div/SumTmp[4][2] ), 
	.CO(\u_div/CryTmp[4][3] ), 
	.CI(\u_div/CryTmp[4][2] ), 
	.B(n6), 
	.A(\u_div/PartRem[5][2] ));
   ADDFX2M \u_div/u_fa_PartRem_0_0_7  (.CO(quotient[0]), 
	.CI(\u_div/CryTmp[0][7] ), 
	.B(n1), 
	.A(\u_div/PartRem[1][7] ));
   NOR2X2M U1 (.Y(n11), 
	.B(b[7]), 
	.A(b[6]));
   AND3X2M U2 (.Y(quotient[3]), 
	.C(\u_div/CryTmp[3][5] ), 
	.B(n3), 
	.A(n11));
   AND2X2M U3 (.Y(quotient[4]), 
	.B(n10), 
	.A(\u_div/CryTmp[4][4] ));
   AND2X2M U4 (.Y(quotient[2]), 
	.B(n11), 
	.A(\u_div/CryTmp[2][6] ));
   AND2X2M U5 (.Y(quotient[1]), 
	.B(n1), 
	.A(\u_div/CryTmp[1][7] ));
   AND2X2M U6 (.Y(quotient[5]), 
	.B(n9), 
	.A(\u_div/CryTmp[5][3] ));
   MX2X1M U7 (.Y(\u_div/PartRem[2][5] ), 
	.S0(quotient[2]), 
	.B(\u_div/SumTmp[2][4] ), 
	.A(\u_div/PartRem[3][4] ));
   MX2X1M U8 (.Y(\u_div/PartRem[2][3] ), 
	.S0(quotient[2]), 
	.B(\u_div/SumTmp[2][2] ), 
	.A(\u_div/PartRem[3][2] ));
   MX2X1M U9 (.Y(\u_div/PartRem[2][4] ), 
	.S0(quotient[2]), 
	.B(\u_div/SumTmp[2][3] ), 
	.A(\u_div/PartRem[3][3] ));
   MX2X1M U10 (.Y(\u_div/PartRem[2][6] ), 
	.S0(quotient[2]), 
	.B(\u_div/SumTmp[2][5] ), 
	.A(\u_div/PartRem[3][5] ));
   MX2X1M U11 (.Y(\u_div/PartRem[3][5] ), 
	.S0(quotient[3]), 
	.B(\u_div/SumTmp[3][4] ), 
	.A(\u_div/PartRem[4][4] ));
   MX2X1M U12 (.Y(\u_div/PartRem[3][4] ), 
	.S0(quotient[3]), 
	.B(\u_div/SumTmp[3][3] ), 
	.A(\u_div/PartRem[4][3] ));
   MX2X1M U13 (.Y(\u_div/PartRem[3][3] ), 
	.S0(quotient[3]), 
	.B(\u_div/SumTmp[3][2] ), 
	.A(\u_div/PartRem[4][2] ));
   MX2X1M U14 (.Y(\u_div/PartRem[4][4] ), 
	.S0(quotient[4]), 
	.B(\u_div/SumTmp[4][3] ), 
	.A(\u_div/PartRem[5][3] ));
   MX2X1M U15 (.Y(\u_div/PartRem[4][3] ), 
	.S0(quotient[4]), 
	.B(\u_div/SumTmp[4][2] ), 
	.A(\u_div/PartRem[5][2] ));
   MX2X1M U16 (.Y(\u_div/PartRem[5][3] ), 
	.S0(quotient[5]), 
	.B(\u_div/SumTmp[5][2] ), 
	.A(\u_div/PartRem[6][2] ));
   MX2XLM U17 (.Y(\u_div/PartRem[1][4] ), 
	.S0(quotient[1]), 
	.B(\u_div/SumTmp[1][3] ), 
	.A(\u_div/PartRem[2][3] ));
   MX2XLM U18 (.Y(\u_div/PartRem[1][5] ), 
	.S0(quotient[1]), 
	.B(\u_div/SumTmp[1][4] ), 
	.A(\u_div/PartRem[2][4] ));
   MX2XLM U19 (.Y(\u_div/PartRem[1][7] ), 
	.S0(quotient[1]), 
	.B(\u_div/SumTmp[1][6] ), 
	.A(\u_div/PartRem[2][6] ));
   AND3X2M U20 (.Y(quotient[6]), 
	.C(\u_div/CryTmp[6][2] ), 
	.B(n6), 
	.A(n9));
   AND2X2M U21 (.Y(n9), 
	.B(n5), 
	.A(n10));
   MX2X1M U22 (.Y(\u_div/PartRem[2][2] ), 
	.S0(quotient[2]), 
	.B(\u_div/SumTmp[2][1] ), 
	.A(\u_div/PartRem[3][1] ));
   MX2X1M U23 (.Y(\u_div/PartRem[3][2] ), 
	.S0(quotient[3]), 
	.B(\u_div/SumTmp[3][1] ), 
	.A(\u_div/PartRem[4][1] ));
   MX2X1M U24 (.Y(\u_div/PartRem[4][2] ), 
	.S0(quotient[4]), 
	.B(\u_div/SumTmp[4][1] ), 
	.A(\u_div/PartRem[5][1] ));
   MX2X1M U25 (.Y(\u_div/PartRem[5][2] ), 
	.S0(quotient[5]), 
	.B(\u_div/SumTmp[5][1] ), 
	.A(\u_div/PartRem[6][1] ));
   MX2X1M U26 (.Y(\u_div/PartRem[6][2] ), 
	.S0(quotient[6]), 
	.B(\u_div/SumTmp[6][1] ), 
	.A(\u_div/PartRem[7][1] ));
   MX2XLM U27 (.Y(\u_div/PartRem[1][2] ), 
	.S0(quotient[1]), 
	.B(\u_div/SumTmp[1][1] ), 
	.A(\u_div/PartRem[2][1] ));
   CLKINVX2M U28 (.Y(n6), 
	.A(b[2]));
   CLKINVX2M U29 (.Y(n8), 
	.A(b[0]));
   OR2X1M U30 (.Y(\u_div/CryTmp[7][1] ), 
	.B(n8), 
	.A(a[7]));
   XNOR2X2M U31 (.Y(\u_div/SumTmp[2][0] ), 
	.B(a[2]), 
	.A(n8));
   XNOR2X2M U32 (.Y(\u_div/SumTmp[3][0] ), 
	.B(a[3]), 
	.A(n8));
   XNOR2X2M U33 (.Y(\u_div/SumTmp[4][0] ), 
	.B(a[4]), 
	.A(n8));
   XNOR2X2M U34 (.Y(\u_div/SumTmp[5][0] ), 
	.B(a[5]), 
	.A(n8));
   XNOR2X1M U35 (.Y(\u_div/SumTmp[7][0] ), 
	.B(a[7]), 
	.A(n8));
   XNOR2X1M U36 (.Y(\u_div/SumTmp[6][0] ), 
	.B(a[6]), 
	.A(n8));
   CLKINVX2M U37 (.Y(n7), 
	.A(b[1]));
   CLKINVX2M U38 (.Y(n5), 
	.A(b[3]));
   CLKINVX2M U39 (.Y(n4), 
	.A(b[4]));
   XNOR2X1M U40 (.Y(\u_div/SumTmp[1][0] ), 
	.B(a[1]), 
	.A(n8));
   CLKINVX2M U41 (.Y(n3), 
	.A(b[5]));
   CLKINVX2M U42 (.Y(n2), 
	.A(b[6]));
   INVX2M U43 (.Y(n1), 
	.A(b[7]));
   OR2X2M U44 (.Y(\u_div/CryTmp[0][1] ), 
	.B(n8), 
	.A(a[0]));
   OR2X1M U45 (.Y(\u_div/CryTmp[5][1] ), 
	.B(n8), 
	.A(a[5]));
   OR2X1M U46 (.Y(\u_div/CryTmp[4][1] ), 
	.B(n8), 
	.A(a[4]));
   OR2X1M U47 (.Y(\u_div/CryTmp[3][1] ), 
	.B(n8), 
	.A(a[3]));
   OR2X1M U48 (.Y(\u_div/CryTmp[2][1] ), 
	.B(n8), 
	.A(a[2]));
   OR2X1M U49 (.Y(\u_div/CryTmp[1][1] ), 
	.B(n8), 
	.A(a[1]));
   OR2X1M U50 (.Y(\u_div/CryTmp[6][1] ), 
	.B(n8), 
	.A(a[6]));
   CLKMX2X2M U51 (.Y(\u_div/PartRem[7][1] ), 
	.S0(quotient[7]), 
	.B(\u_div/SumTmp[7][0] ), 
	.A(a[7]));
   CLKMX2X2M U52 (.Y(\u_div/PartRem[1][6] ), 
	.S0(quotient[1]), 
	.B(\u_div/SumTmp[1][5] ), 
	.A(\u_div/PartRem[2][5] ));
   CLKMX2X2M U53 (.Y(\u_div/PartRem[6][1] ), 
	.S0(quotient[6]), 
	.B(\u_div/SumTmp[6][0] ), 
	.A(a[6]));
   CLKMX2X2M U54 (.Y(\u_div/PartRem[5][1] ), 
	.S0(quotient[5]), 
	.B(\u_div/SumTmp[5][0] ), 
	.A(a[5]));
   CLKMX2X2M U55 (.Y(\u_div/PartRem[4][1] ), 
	.S0(quotient[4]), 
	.B(\u_div/SumTmp[4][0] ), 
	.A(a[4]));
   CLKMX2X2M U56 (.Y(\u_div/PartRem[1][3] ), 
	.S0(quotient[1]), 
	.B(\u_div/SumTmp[1][2] ), 
	.A(\u_div/PartRem[2][2] ));
   CLKMX2X2M U57 (.Y(\u_div/PartRem[3][1] ), 
	.S0(quotient[3]), 
	.B(\u_div/SumTmp[3][0] ), 
	.A(a[3]));
   CLKMX2X2M U58 (.Y(\u_div/PartRem[2][1] ), 
	.S0(quotient[2]), 
	.B(\u_div/SumTmp[2][0] ), 
	.A(a[2]));
   CLKMX2X2M U59 (.Y(\u_div/PartRem[1][1] ), 
	.S0(quotient[1]), 
	.B(\u_div/SumTmp[1][0] ), 
	.A(a[1]));
   AND4X1M U60 (.Y(quotient[7]), 
	.D(n6), 
	.C(n7), 
	.B(n9), 
	.A(\u_div/CryTmp[7][1] ));
   AND3X1M U61 (.Y(n10), 
	.C(n3), 
	.B(n4), 
	.A(n11));
endmodule

module arithmetic_unit_DW01_sub_0 (
	A, 
	B, 
	CI, 
	DIFF, 
	CO);
   input [8:0] A;
   input [8:0] B;
   input CI;
   output [8:0] DIFF;
   output CO;

   // Internal wires
   wire n1;
   wire n2;
   wire n3;
   wire n4;
   wire n5;
   wire n6;
   wire n7;
   wire n8;
   wire [9:0] carry;

   ADDFX2M U2_7 (.S(DIFF[7]), 
	.CO(carry[8]), 
	.CI(carry[7]), 
	.B(n1), 
	.A(A[7]));
   ADDFX2M U2_6 (.S(DIFF[6]), 
	.CO(carry[7]), 
	.CI(carry[6]), 
	.B(n2), 
	.A(A[6]));
   ADDFX2M U2_5 (.S(DIFF[5]), 
	.CO(carry[6]), 
	.CI(carry[5]), 
	.B(n3), 
	.A(A[5]));
   ADDFX2M U2_4 (.S(DIFF[4]), 
	.CO(carry[5]), 
	.CI(carry[4]), 
	.B(n4), 
	.A(A[4]));
   ADDFX2M U2_3 (.S(DIFF[3]), 
	.CO(carry[4]), 
	.CI(carry[3]), 
	.B(n5), 
	.A(A[3]));
   ADDFX2M U2_2 (.S(DIFF[2]), 
	.CO(carry[3]), 
	.CI(carry[2]), 
	.B(n6), 
	.A(A[2]));
   ADDFX2M U2_1 (.S(DIFF[1]), 
	.CO(carry[2]), 
	.CI(carry[1]), 
	.B(n7), 
	.A(A[1]));
   XOR3XLM U2_8 (.Y(DIFF[8]), 
	.C(carry[8]), 
	.B(n1), 
	.A(A[8]));
   INVX2M U1 (.Y(n1), 
	.A(B[8]));
   XNOR2X2M U2 (.Y(DIFF[0]), 
	.B(A[0]), 
	.A(n8));
   INVX2M U3 (.Y(n8), 
	.A(B[0]));
   OR2X1M U4 (.Y(carry[1]), 
	.B(n8), 
	.A(A[0]));
   INVX2M U5 (.Y(n7), 
	.A(B[1]));
   INVX2M U6 (.Y(n6), 
	.A(B[2]));
   INVX2M U7 (.Y(n5), 
	.A(B[3]));
   INVX2M U8 (.Y(n4), 
	.A(B[4]));
   INVX2M U9 (.Y(n3), 
	.A(B[5]));
   INVXLM U10 (.Y(n2), 
	.A(B[6]));
endmodule

module arithmetic_unit_DW01_add_0 (
	A, 
	B, 
	CI, 
	SUM, 
	CO);
   input [8:0] A;
   input [8:0] B;
   input CI;
   output [8:0] SUM;
   output CO;

   // Internal wires
   wire n1;
   wire [8:1] carry;

   ADDFX2M U1_2 (.S(SUM[2]), 
	.CO(carry[3]), 
	.CI(carry[2]), 
	.B(B[2]), 
	.A(A[2]));
   ADDFX2M U1_3 (.S(SUM[3]), 
	.CO(carry[4]), 
	.CI(carry[3]), 
	.B(B[3]), 
	.A(A[3]));
   ADDFX2M U1_4 (.S(SUM[4]), 
	.CO(carry[5]), 
	.CI(carry[4]), 
	.B(B[4]), 
	.A(A[4]));
   ADDFX2M U1_5 (.S(SUM[5]), 
	.CO(carry[6]), 
	.CI(carry[5]), 
	.B(B[5]), 
	.A(A[5]));
   ADDFX2M U1_1 (.S(SUM[1]), 
	.CO(carry[2]), 
	.CI(n1), 
	.B(B[1]), 
	.A(A[1]));
   ADDFX2M U1_7 (.S(SUM[7]), 
	.CO(carry[8]), 
	.CI(carry[7]), 
	.B(B[7]), 
	.A(A[7]));
   ADDFX2M U1_6 (.S(SUM[6]), 
	.CO(carry[7]), 
	.CI(carry[6]), 
	.B(B[6]), 
	.A(A[6]));
   XOR3XLM U1_8 (.Y(SUM[8]), 
	.C(carry[8]), 
	.B(B[8]), 
	.A(A[8]));
   AND2X2M U1 (.Y(n1), 
	.B(A[0]), 
	.A(B[0]));
   CLKXOR2X2M U2 (.Y(SUM[0]), 
	.B(A[0]), 
	.A(B[0]));
endmodule

module arithmetic_unit_DW01_add_1 (
	A, 
	B, 
	CI, 
	SUM, 
	CO);
   input [13:0] A;
   input [13:0] B;
   input CI;
   output [13:0] SUM;
   output CO;

   // Internal wires
   wire n7;
   wire n8;
   wire n9;
   wire n10;
   wire n11;
   wire n12;
   wire n13;
   wire n14;
   wire n15;
   wire n16;
   wire n17;
   wire n18;
   wire n19;
   wire n20;
   wire n21;
   wire n22;
   wire n23;
   wire n24;
   wire n25;
   wire n26;
   wire n27;
   wire n28;
   wire n29;

   NOR2X2M U2 (.Y(n17), 
	.B(n7), 
	.A(n8));
   OAI21BX1M U3 (.Y(n19), 
	.B0N(n23), 
	.A1(n22), 
	.A0(n21));
   AOI2BB1X2M U4 (.Y(n26), 
	.B0(n11), 
	.A1N(n12), 
	.A0N(n9));
   NOR2X2M U5 (.Y(n21), 
	.B(A[11]), 
	.A(B[11]));
   NOR2X2M U6 (.Y(n12), 
	.B(A[9]), 
	.A(B[9]));
   NOR2X2M U7 (.Y(n25), 
	.B(A[10]), 
	.A(B[10]));
   NOR2X2M U8 (.Y(n15), 
	.B(A[8]), 
	.A(B[8]));
   AOI21BX2M U9 (.Y(n14), 
	.B0N(n29), 
	.A1(A[7]), 
	.A0(n17));
   OAI2BB1XLM U10 (.Y(n18), 
	.B0(n20), 
	.A1N(A[12]), 
	.A0N(n19));
   INVX2M U11 (.Y(n7), 
	.A(A[6]));
   INVX2M U12 (.Y(n8), 
	.A(B[6]));
   BUFX2M U13 (.Y(SUM[0]), 
	.A(A[0]));
   BUFX2M U14 (.Y(SUM[1]), 
	.A(A[1]));
   BUFX2M U15 (.Y(SUM[2]), 
	.A(A[2]));
   BUFX2M U16 (.Y(SUM[3]), 
	.A(A[3]));
   BUFX2M U17 (.Y(SUM[4]), 
	.A(A[4]));
   BUFX2M U18 (.Y(SUM[5]), 
	.A(A[5]));
   XNOR2X1M U19 (.Y(SUM[9]), 
	.B(n10), 
	.A(n9));
   NOR2X1M U20 (.Y(n10), 
	.B(n12), 
	.A(n11));
   CLKXOR2X2M U21 (.Y(SUM[8]), 
	.B(n14), 
	.A(n13));
   NAND2BX1M U22 (.Y(n13), 
	.B(n16), 
	.AN(n15));
   XOR3XLM U23 (.Y(SUM[7]), 
	.C(n17), 
	.B(A[7]), 
	.A(B[7]));
   AOI21X1M U24 (.Y(SUM[6]), 
	.B0(n17), 
	.A1(n7), 
	.A0(n8));
   XOR3XLM U25 (.Y(SUM[13]), 
	.C(n18), 
	.B(A[13]), 
	.A(B[13]));
   OAI21X1M U26 (.Y(n20), 
	.B0(B[12]), 
	.A1(n19), 
	.A0(A[12]));
   XOR3XLM U27 (.Y(SUM[12]), 
	.C(n19), 
	.B(A[12]), 
	.A(B[12]));
   XNOR2X1M U28 (.Y(SUM[11]), 
	.B(n24), 
	.A(n22));
   NOR2X1M U29 (.Y(n24), 
	.B(n21), 
	.A(n23));
   AND2X1M U30 (.Y(n23), 
	.B(A[11]), 
	.A(B[11]));
   OA21X1M U31 (.Y(n22), 
	.B0(n27), 
	.A1(n26), 
	.A0(n25));
   CLKXOR2X2M U32 (.Y(SUM[10]), 
	.B(n26), 
	.A(n28));
   AND2X1M U33 (.Y(n11), 
	.B(A[9]), 
	.A(B[9]));
   OA21X1M U34 (.Y(n9), 
	.B0(n16), 
	.A1(n15), 
	.A0(n14));
   CLKNAND2X2M U35 (.Y(n16), 
	.B(A[8]), 
	.A(B[8]));
   OAI21X1M U36 (.Y(n29), 
	.B0(B[7]), 
	.A1(A[7]), 
	.A0(n17));
   NAND2BX1M U37 (.Y(n28), 
	.B(n27), 
	.AN(n25));
   CLKNAND2X2M U38 (.Y(n27), 
	.B(A[10]), 
	.A(B[10]));
endmodule

module arithmetic_unit_DW02_mult_0 (
	A, 
	B, 
	TC, 
	PRODUCT);
   input [7:0] A;
   input [7:0] B;
   input TC;
   output [15:0] PRODUCT;

   // Internal wires
   wire \ab[7][7] ;
   wire \ab[7][6] ;
   wire \ab[7][5] ;
   wire \ab[7][4] ;
   wire \ab[7][3] ;
   wire \ab[7][2] ;
   wire \ab[7][1] ;
   wire \ab[7][0] ;
   wire \ab[6][7] ;
   wire \ab[6][6] ;
   wire \ab[6][5] ;
   wire \ab[6][4] ;
   wire \ab[6][3] ;
   wire \ab[6][2] ;
   wire \ab[6][1] ;
   wire \ab[6][0] ;
   wire \ab[5][7] ;
   wire \ab[5][6] ;
   wire \ab[5][5] ;
   wire \ab[5][4] ;
   wire \ab[5][3] ;
   wire \ab[5][2] ;
   wire \ab[5][1] ;
   wire \ab[5][0] ;
   wire \ab[4][7] ;
   wire \ab[4][6] ;
   wire \ab[4][5] ;
   wire \ab[4][4] ;
   wire \ab[4][3] ;
   wire \ab[4][2] ;
   wire \ab[4][1] ;
   wire \ab[4][0] ;
   wire \ab[3][7] ;
   wire \ab[3][6] ;
   wire \ab[3][5] ;
   wire \ab[3][4] ;
   wire \ab[3][3] ;
   wire \ab[3][2] ;
   wire \ab[3][1] ;
   wire \ab[3][0] ;
   wire \ab[2][7] ;
   wire \ab[2][6] ;
   wire \ab[2][5] ;
   wire \ab[2][4] ;
   wire \ab[2][3] ;
   wire \ab[2][2] ;
   wire \ab[2][1] ;
   wire \ab[2][0] ;
   wire \ab[1][7] ;
   wire \ab[1][6] ;
   wire \ab[1][5] ;
   wire \ab[1][4] ;
   wire \ab[1][3] ;
   wire \ab[1][2] ;
   wire \ab[1][1] ;
   wire \ab[1][0] ;
   wire \ab[0][7] ;
   wire \ab[0][6] ;
   wire \ab[0][5] ;
   wire \ab[0][4] ;
   wire \ab[0][3] ;
   wire \ab[0][2] ;
   wire \ab[0][1] ;
   wire \CARRYB[7][7] ;
   wire \CARRYB[7][6] ;
   wire \CARRYB[7][5] ;
   wire \CARRYB[7][4] ;
   wire \CARRYB[7][3] ;
   wire \CARRYB[7][2] ;
   wire \CARRYB[7][1] ;
   wire \CARRYB[7][0] ;
   wire \CARRYB[6][6] ;
   wire \CARRYB[6][5] ;
   wire \CARRYB[6][4] ;
   wire \CARRYB[6][3] ;
   wire \CARRYB[6][2] ;
   wire \CARRYB[6][1] ;
   wire \CARRYB[6][0] ;
   wire \CARRYB[5][6] ;
   wire \CARRYB[5][5] ;
   wire \CARRYB[5][4] ;
   wire \CARRYB[5][3] ;
   wire \CARRYB[5][2] ;
   wire \CARRYB[5][1] ;
   wire \CARRYB[5][0] ;
   wire \CARRYB[4][6] ;
   wire \CARRYB[4][5] ;
   wire \CARRYB[4][4] ;
   wire \CARRYB[4][3] ;
   wire \CARRYB[4][2] ;
   wire \CARRYB[4][1] ;
   wire \CARRYB[4][0] ;
   wire \CARRYB[3][6] ;
   wire \CARRYB[3][5] ;
   wire \CARRYB[3][4] ;
   wire \CARRYB[3][3] ;
   wire \CARRYB[3][2] ;
   wire \CARRYB[3][1] ;
   wire \CARRYB[3][0] ;
   wire \CARRYB[2][6] ;
   wire \CARRYB[2][5] ;
   wire \CARRYB[2][4] ;
   wire \CARRYB[2][3] ;
   wire \CARRYB[2][2] ;
   wire \CARRYB[2][1] ;
   wire \CARRYB[2][0] ;
   wire \SUMB[7][7] ;
   wire \SUMB[7][6] ;
   wire \SUMB[7][5] ;
   wire \SUMB[7][4] ;
   wire \SUMB[7][3] ;
   wire \SUMB[7][2] ;
   wire \SUMB[7][1] ;
   wire \SUMB[7][0] ;
   wire \SUMB[6][6] ;
   wire \SUMB[6][5] ;
   wire \SUMB[6][4] ;
   wire \SUMB[6][3] ;
   wire \SUMB[6][2] ;
   wire \SUMB[6][1] ;
   wire \SUMB[5][6] ;
   wire \SUMB[5][5] ;
   wire \SUMB[5][4] ;
   wire \SUMB[5][3] ;
   wire \SUMB[5][2] ;
   wire \SUMB[5][1] ;
   wire \SUMB[4][6] ;
   wire \SUMB[4][5] ;
   wire \SUMB[4][4] ;
   wire \SUMB[4][3] ;
   wire \SUMB[4][2] ;
   wire \SUMB[4][1] ;
   wire \SUMB[3][6] ;
   wire \SUMB[3][5] ;
   wire \SUMB[3][4] ;
   wire \SUMB[3][3] ;
   wire \SUMB[3][2] ;
   wire \SUMB[3][1] ;
   wire \SUMB[2][6] ;
   wire \SUMB[2][5] ;
   wire \SUMB[2][4] ;
   wire \SUMB[2][3] ;
   wire \SUMB[2][2] ;
   wire \SUMB[2][1] ;
   wire \SUMB[1][6] ;
   wire \SUMB[1][5] ;
   wire \SUMB[1][4] ;
   wire \SUMB[1][3] ;
   wire \SUMB[1][2] ;
   wire \SUMB[1][1] ;
   wire ZA;
   wire ZB;
   wire \A1[13] ;
   wire \A1[12] ;
   wire \A1[11] ;
   wire \A1[10] ;
   wire \A1[9] ;
   wire \A1[8] ;
   wire \A1[7] ;
   wire \A1[6] ;
   wire \A1[5] ;
   wire \A1[4] ;
   wire \A1[3] ;
   wire \A1[2] ;
   wire \A1[1] ;
   wire \A1[0] ;
   wire \A2[6] ;
   wire n3;
   wire n4;
   wire n5;
   wire n6;
   wire n7;
   wire n8;
   wire n9;
   wire n10;
   wire n11;
   wire n12;
   wire n13;
   wire n14;
   wire n15;
   wire n16;
   wire n17;
   wire n18;
   wire n19;
   wire n20;
   wire n21;
   wire n22;
   wire n23;
   wire n24;
   wire n25;
   wire n26;
   wire n27;
   wire n28;
   wire n29;
   wire n30;
   wire n31;
   wire n32;

   assign ZA = A[7] ;
   assign ZB = B[7] ;

   ADDFX2M S14_7_0 (.S(\A1[5] ), 
	.CO(\A2[6] ), 
	.CI(\SUMB[7][0] ), 
	.B(ZB), 
	.A(ZA));
   ADDFX2M S3_6_6 (.S(\SUMB[6][6] ), 
	.CO(\CARRYB[6][6] ), 
	.CI(\ab[5][7] ), 
	.B(\CARRYB[5][6] ), 
	.A(\ab[6][6] ));
   ADDFX2M S3_5_6 (.S(\SUMB[5][6] ), 
	.CO(\CARRYB[5][6] ), 
	.CI(\ab[4][7] ), 
	.B(\CARRYB[4][6] ), 
	.A(\ab[5][6] ));
   ADDFX2M S3_4_6 (.S(\SUMB[4][6] ), 
	.CO(\CARRYB[4][6] ), 
	.CI(\ab[3][7] ), 
	.B(\CARRYB[3][6] ), 
	.A(\ab[4][6] ));
   ADDFX2M S3_3_6 (.S(\SUMB[3][6] ), 
	.CO(\CARRYB[3][6] ), 
	.CI(\ab[2][7] ), 
	.B(\CARRYB[2][6] ), 
	.A(\ab[3][6] ));
   ADDFX2M S3_2_6 (.S(\SUMB[2][6] ), 
	.CO(\CARRYB[2][6] ), 
	.CI(\ab[1][7] ), 
	.B(n9), 
	.A(\ab[2][6] ));
   ADDFX2M S4_5 (.S(\SUMB[7][5] ), 
	.CO(\CARRYB[7][5] ), 
	.CI(\SUMB[6][6] ), 
	.B(\CARRYB[6][5] ), 
	.A(\ab[7][5] ));
   ADDFX2M S4_4 (.S(\SUMB[7][4] ), 
	.CO(\CARRYB[7][4] ), 
	.CI(\SUMB[6][5] ), 
	.B(\CARRYB[6][4] ), 
	.A(\ab[7][4] ));
   ADDFX2M S4_3 (.S(\SUMB[7][3] ), 
	.CO(\CARRYB[7][3] ), 
	.CI(\SUMB[6][4] ), 
	.B(\CARRYB[6][3] ), 
	.A(\ab[7][3] ));
   ADDFX2M S4_2 (.S(\SUMB[7][2] ), 
	.CO(\CARRYB[7][2] ), 
	.CI(\SUMB[6][3] ), 
	.B(\CARRYB[6][2] ), 
	.A(\ab[7][2] ));
   ADDFX2M S4_1 (.S(\SUMB[7][1] ), 
	.CO(\CARRYB[7][1] ), 
	.CI(\SUMB[6][2] ), 
	.B(\CARRYB[6][1] ), 
	.A(\ab[7][1] ));
   ADDFX2M S4_0 (.S(\SUMB[7][0] ), 
	.CO(\CARRYB[7][0] ), 
	.CI(\SUMB[6][1] ), 
	.B(\CARRYB[6][0] ), 
	.A(\ab[7][0] ));
   ADDFX2M S5_6 (.S(\SUMB[7][6] ), 
	.CO(\CARRYB[7][6] ), 
	.CI(\ab[6][7] ), 
	.B(\CARRYB[6][6] ), 
	.A(\ab[7][6] ));
   ADDFX2M S14_7 (.S(\SUMB[7][7] ), 
	.CO(\CARRYB[7][7] ), 
	.CI(\ab[7][7] ), 
	.B(n17), 
	.A(n25));
   ADDFX2M S1_6_0 (.S(\A1[4] ), 
	.CO(\CARRYB[6][0] ), 
	.CI(\SUMB[5][1] ), 
	.B(\CARRYB[5][0] ), 
	.A(\ab[6][0] ));
   ADDFX2M S1_5_0 (.S(\A1[3] ), 
	.CO(\CARRYB[5][0] ), 
	.CI(\SUMB[4][1] ), 
	.B(\CARRYB[4][0] ), 
	.A(\ab[5][0] ));
   ADDFX2M S1_4_0 (.S(\A1[2] ), 
	.CO(\CARRYB[4][0] ), 
	.CI(\SUMB[3][1] ), 
	.B(\CARRYB[3][0] ), 
	.A(\ab[4][0] ));
   ADDFX2M S1_3_0 (.S(\A1[1] ), 
	.CO(\CARRYB[3][0] ), 
	.CI(\SUMB[2][1] ), 
	.B(\CARRYB[2][0] ), 
	.A(\ab[3][0] ));
   ADDFX2M S2_6_5 (.S(\SUMB[6][5] ), 
	.CO(\CARRYB[6][5] ), 
	.CI(\SUMB[5][6] ), 
	.B(\CARRYB[5][5] ), 
	.A(\ab[6][5] ));
   ADDFX2M S2_6_4 (.S(\SUMB[6][4] ), 
	.CO(\CARRYB[6][4] ), 
	.CI(\SUMB[5][5] ), 
	.B(\CARRYB[5][4] ), 
	.A(\ab[6][4] ));
   ADDFX2M S2_5_5 (.S(\SUMB[5][5] ), 
	.CO(\CARRYB[5][5] ), 
	.CI(\SUMB[4][6] ), 
	.B(\CARRYB[4][5] ), 
	.A(\ab[5][5] ));
   ADDFX2M S2_6_3 (.S(\SUMB[6][3] ), 
	.CO(\CARRYB[6][3] ), 
	.CI(\SUMB[5][4] ), 
	.B(\CARRYB[5][3] ), 
	.A(\ab[6][3] ));
   ADDFX2M S2_5_4 (.S(\SUMB[5][4] ), 
	.CO(\CARRYB[5][4] ), 
	.CI(\SUMB[4][5] ), 
	.B(\CARRYB[4][4] ), 
	.A(\ab[5][4] ));
   ADDFX2M S2_6_2 (.S(\SUMB[6][2] ), 
	.CO(\CARRYB[6][2] ), 
	.CI(\SUMB[5][3] ), 
	.B(\CARRYB[5][2] ), 
	.A(\ab[6][2] ));
   ADDFX2M S2_4_5 (.S(\SUMB[4][5] ), 
	.CO(\CARRYB[4][5] ), 
	.CI(\SUMB[3][6] ), 
	.B(\CARRYB[3][5] ), 
	.A(\ab[4][5] ));
   ADDFX2M S2_6_1 (.S(\SUMB[6][1] ), 
	.CO(\CARRYB[6][1] ), 
	.CI(\SUMB[5][2] ), 
	.B(\CARRYB[5][1] ), 
	.A(\ab[6][1] ));
   ADDFX2M S2_5_3 (.S(\SUMB[5][3] ), 
	.CO(\CARRYB[5][3] ), 
	.CI(\SUMB[4][4] ), 
	.B(\CARRYB[4][3] ), 
	.A(\ab[5][3] ));
   ADDFX2M S2_5_1 (.S(\SUMB[5][1] ), 
	.CO(\CARRYB[5][1] ), 
	.CI(\SUMB[4][2] ), 
	.B(\CARRYB[4][1] ), 
	.A(\ab[5][1] ));
   ADDFX2M S2_5_2 (.S(\SUMB[5][2] ), 
	.CO(\CARRYB[5][2] ), 
	.CI(\SUMB[4][3] ), 
	.B(\CARRYB[4][2] ), 
	.A(\ab[5][2] ));
   ADDFX2M S2_4_4 (.S(\SUMB[4][4] ), 
	.CO(\CARRYB[4][4] ), 
	.CI(\SUMB[3][5] ), 
	.B(\CARRYB[3][4] ), 
	.A(\ab[4][4] ));
   ADDFX2M S2_4_1 (.S(\SUMB[4][1] ), 
	.CO(\CARRYB[4][1] ), 
	.CI(\SUMB[3][2] ), 
	.B(\CARRYB[3][1] ), 
	.A(\ab[4][1] ));
   ADDFX2M S2_4_2 (.S(\SUMB[4][2] ), 
	.CO(\CARRYB[4][2] ), 
	.CI(\SUMB[3][3] ), 
	.B(\CARRYB[3][2] ), 
	.A(\ab[4][2] ));
   ADDFX2M S2_4_3 (.S(\SUMB[4][3] ), 
	.CO(\CARRYB[4][3] ), 
	.CI(\SUMB[3][4] ), 
	.B(\CARRYB[3][3] ), 
	.A(\ab[4][3] ));
   ADDFX2M S2_3_5 (.S(\SUMB[3][5] ), 
	.CO(\CARRYB[3][5] ), 
	.CI(\SUMB[2][6] ), 
	.B(\CARRYB[2][5] ), 
	.A(\ab[3][5] ));
   ADDFX2M S2_3_1 (.S(\SUMB[3][1] ), 
	.CO(\CARRYB[3][1] ), 
	.CI(\SUMB[2][2] ), 
	.B(\CARRYB[2][1] ), 
	.A(\ab[3][1] ));
   ADDFX2M S2_3_2 (.S(\SUMB[3][2] ), 
	.CO(\CARRYB[3][2] ), 
	.CI(\SUMB[2][3] ), 
	.B(\CARRYB[2][2] ), 
	.A(\ab[3][2] ));
   ADDFX2M S2_3_3 (.S(\SUMB[3][3] ), 
	.CO(\CARRYB[3][3] ), 
	.CI(\SUMB[2][4] ), 
	.B(\CARRYB[2][3] ), 
	.A(\ab[3][3] ));
   ADDFX2M S2_3_4 (.S(\SUMB[3][4] ), 
	.CO(\CARRYB[3][4] ), 
	.CI(\SUMB[2][5] ), 
	.B(\CARRYB[2][4] ), 
	.A(\ab[3][4] ));
   ADDFX2M S1_2_0 (.S(\A1[0] ), 
	.CO(\CARRYB[2][0] ), 
	.CI(\SUMB[1][1] ), 
	.B(n8), 
	.A(\ab[2][0] ));
   ADDFX2M S2_2_1 (.S(\SUMB[2][1] ), 
	.CO(\CARRYB[2][1] ), 
	.CI(\SUMB[1][2] ), 
	.B(n7), 
	.A(\ab[2][1] ));
   ADDFX2M S2_2_2 (.S(\SUMB[2][2] ), 
	.CO(\CARRYB[2][2] ), 
	.CI(\SUMB[1][3] ), 
	.B(n6), 
	.A(\ab[2][2] ));
   ADDFX2M S2_2_3 (.S(\SUMB[2][3] ), 
	.CO(\CARRYB[2][3] ), 
	.CI(\SUMB[1][4] ), 
	.B(n5), 
	.A(\ab[2][3] ));
   ADDFX2M S2_2_4 (.S(\SUMB[2][4] ), 
	.CO(\CARRYB[2][4] ), 
	.CI(\SUMB[1][5] ), 
	.B(n4), 
	.A(\ab[2][4] ));
   ADDFX2M S2_2_5 (.S(\SUMB[2][5] ), 
	.CO(\CARRYB[2][5] ), 
	.CI(\SUMB[1][6] ), 
	.B(n3), 
	.A(\ab[2][5] ));
   AND2X2M U2 (.Y(n3), 
	.B(\ab[1][5] ), 
	.A(\ab[0][6] ));
   AND2X2M U3 (.Y(n4), 
	.B(\ab[1][4] ), 
	.A(\ab[0][5] ));
   AND2X2M U4 (.Y(n5), 
	.B(\ab[1][3] ), 
	.A(\ab[0][4] ));
   AND2X2M U5 (.Y(n6), 
	.B(\ab[1][2] ), 
	.A(\ab[0][3] ));
   AND2X2M U6 (.Y(n7), 
	.B(\ab[1][1] ), 
	.A(\ab[0][2] ));
   AND2X2M U7 (.Y(n8), 
	.B(\ab[1][0] ), 
	.A(\ab[0][1] ));
   AND2X2M U8 (.Y(n9), 
	.B(\ab[1][6] ), 
	.A(\ab[0][7] ));
   AND2X2M U9 (.Y(n10), 
	.B(\SUMB[7][7] ), 
	.A(\CARRYB[7][6] ));
   NOR2X2M U10 (.Y(\ab[0][6] ), 
	.B(n32), 
	.A(n18));
   NOR2X2M U11 (.Y(\ab[0][1] ), 
	.B(n32), 
	.A(n23));
   NOR2X2M U12 (.Y(\ab[0][5] ), 
	.B(n32), 
	.A(n19));
   NOR2X2M U13 (.Y(\ab[0][4] ), 
	.B(n32), 
	.A(n20));
   NOR2X2M U14 (.Y(\ab[0][3] ), 
	.B(n32), 
	.A(n21));
   NOR2X2M U15 (.Y(\ab[0][2] ), 
	.B(n32), 
	.A(n22));
   NOR2X2M U16 (.Y(\ab[1][6] ), 
	.B(n31), 
	.A(n18));
   NOR2X2M U17 (.Y(\ab[1][0] ), 
	.B(n31), 
	.A(n24));
   NOR2X2M U18 (.Y(\ab[1][5] ), 
	.B(n31), 
	.A(n19));
   NOR2X2M U19 (.Y(\ab[1][4] ), 
	.B(n31), 
	.A(n20));
   NOR2X2M U20 (.Y(\ab[1][3] ), 
	.B(n31), 
	.A(n21));
   NOR2X2M U21 (.Y(\ab[1][2] ), 
	.B(n31), 
	.A(n22));
   NOR2X2M U22 (.Y(\ab[1][1] ), 
	.B(n31), 
	.A(n23));
   NOR2X2M U23 (.Y(\ab[0][7] ), 
	.B(n17), 
	.A(A[0]));
   CLKXOR2X2M U24 (.Y(\A1[7] ), 
	.B(\SUMB[7][2] ), 
	.A(\CARRYB[7][1] ));
   CLKXOR2X2M U25 (.Y(\A1[12] ), 
	.B(\SUMB[7][7] ), 
	.A(\CARRYB[7][6] ));
   CLKXOR2X2M U26 (.Y(\A1[8] ), 
	.B(\SUMB[7][3] ), 
	.A(\CARRYB[7][2] ));
   CLKXOR2X2M U27 (.Y(\A1[10] ), 
	.B(\SUMB[7][5] ), 
	.A(\CARRYB[7][4] ));
   CLKXOR2X2M U28 (.Y(\A1[9] ), 
	.B(\SUMB[7][4] ), 
	.A(\CARRYB[7][3] ));
   CLKXOR2X2M U29 (.Y(\A1[11] ), 
	.B(\SUMB[7][6] ), 
	.A(\CARRYB[7][5] ));
   XOR2X1M U30 (.Y(PRODUCT[1]), 
	.B(\ab[0][1] ), 
	.A(\ab[1][0] ));
   CLKXOR2X2M U31 (.Y(\A1[6] ), 
	.B(\SUMB[7][1] ), 
	.A(\CARRYB[7][0] ));
   XOR2X1M U32 (.Y(\SUMB[1][6] ), 
	.B(\ab[0][7] ), 
	.A(\ab[1][6] ));
   XOR2X1M U33 (.Y(\SUMB[1][5] ), 
	.B(\ab[0][6] ), 
	.A(\ab[1][5] ));
   XOR2X1M U34 (.Y(\SUMB[1][4] ), 
	.B(\ab[0][5] ), 
	.A(\ab[1][4] ));
   XOR2X1M U35 (.Y(\SUMB[1][3] ), 
	.B(\ab[0][4] ), 
	.A(\ab[1][3] ));
   XOR2X1M U36 (.Y(\SUMB[1][2] ), 
	.B(\ab[0][3] ), 
	.A(\ab[1][2] ));
   XOR2X1M U37 (.Y(\SUMB[1][1] ), 
	.B(\ab[0][2] ), 
	.A(\ab[1][1] ));
   AND2X2M U38 (.Y(n11), 
	.B(\SUMB[7][2] ), 
	.A(\CARRYB[7][1] ));
   AND2X2M U39 (.Y(n12), 
	.B(\SUMB[7][4] ), 
	.A(\CARRYB[7][3] ));
   AND2X2M U40 (.Y(n13), 
	.B(\SUMB[7][1] ), 
	.A(\CARRYB[7][0] ));
   AND2X2M U41 (.Y(n14), 
	.B(\SUMB[7][6] ), 
	.A(\CARRYB[7][5] ));
   AND2X2M U42 (.Y(n15), 
	.B(\SUMB[7][3] ), 
	.A(\CARRYB[7][2] ));
   AND2X2M U43 (.Y(n16), 
	.B(\SUMB[7][5] ), 
	.A(\CARRYB[7][4] ));
   CLKINVX2M U44 (.Y(n26), 
	.A(A[6]));
   CLKINVX2M U45 (.Y(n31), 
	.A(A[1]));
   CLKINVX2M U46 (.Y(n29), 
	.A(A[3]));
   CLKINVX2M U47 (.Y(n30), 
	.A(A[2]));
   CLKINVX2M U48 (.Y(n28), 
	.A(A[4]));
   CLKINVX2M U49 (.Y(n27), 
	.A(A[5]));
   CLKINVX2M U50 (.Y(n18), 
	.A(B[6]));
   CLKINVX2M U51 (.Y(n32), 
	.A(A[0]));
   CLKINVX2M U52 (.Y(n23), 
	.A(B[1]));
   CLKINVX2M U53 (.Y(n19), 
	.A(B[5]));
   CLKINVX2M U54 (.Y(n20), 
	.A(B[4]));
   CLKINVX2M U55 (.Y(n24), 
	.A(B[0]));
   CLKINVX2M U56 (.Y(n21), 
	.A(B[3]));
   CLKINVX2M U57 (.Y(n22), 
	.A(B[2]));
   CLKINVX2M U58 (.Y(n25), 
	.A(ZA));
   CLKINVX2M U59 (.Y(n17), 
	.A(ZB));
   NOR2X1M U60 (.Y(\ab[7][7] ), 
	.B(n25), 
	.A(n17));
   NOR2X1M U61 (.Y(\ab[7][6] ), 
	.B(n25), 
	.A(B[6]));
   NOR2X1M U62 (.Y(\ab[7][5] ), 
	.B(n25), 
	.A(B[5]));
   NOR2X1M U63 (.Y(\ab[7][4] ), 
	.B(n25), 
	.A(B[4]));
   NOR2X1M U64 (.Y(\ab[7][3] ), 
	.B(n25), 
	.A(B[3]));
   NOR2X1M U65 (.Y(\ab[7][2] ), 
	.B(n25), 
	.A(B[2]));
   NOR2X1M U66 (.Y(\ab[7][1] ), 
	.B(n25), 
	.A(B[1]));
   NOR2X1M U67 (.Y(\ab[7][0] ), 
	.B(n25), 
	.A(B[0]));
   NOR2X1M U68 (.Y(\ab[6][7] ), 
	.B(n17), 
	.A(A[6]));
   NOR2X1M U69 (.Y(\ab[6][6] ), 
	.B(n18), 
	.A(n26));
   NOR2X1M U70 (.Y(\ab[6][5] ), 
	.B(n19), 
	.A(n26));
   NOR2X1M U71 (.Y(\ab[6][4] ), 
	.B(n20), 
	.A(n26));
   NOR2X1M U72 (.Y(\ab[6][3] ), 
	.B(n21), 
	.A(n26));
   NOR2X1M U73 (.Y(\ab[6][2] ), 
	.B(n22), 
	.A(n26));
   NOR2X1M U74 (.Y(\ab[6][1] ), 
	.B(n23), 
	.A(n26));
   NOR2X1M U75 (.Y(\ab[6][0] ), 
	.B(n24), 
	.A(n26));
   NOR2X1M U76 (.Y(\ab[5][7] ), 
	.B(n17), 
	.A(A[5]));
   NOR2X1M U77 (.Y(\ab[5][6] ), 
	.B(n27), 
	.A(n18));
   NOR2X1M U78 (.Y(\ab[5][5] ), 
	.B(n27), 
	.A(n19));
   NOR2X1M U79 (.Y(\ab[5][4] ), 
	.B(n27), 
	.A(n20));
   NOR2X1M U80 (.Y(\ab[5][3] ), 
	.B(n27), 
	.A(n21));
   NOR2X1M U81 (.Y(\ab[5][2] ), 
	.B(n27), 
	.A(n22));
   NOR2X1M U82 (.Y(\ab[5][1] ), 
	.B(n27), 
	.A(n23));
   NOR2X1M U83 (.Y(\ab[5][0] ), 
	.B(n27), 
	.A(n24));
   NOR2X1M U84 (.Y(\ab[4][7] ), 
	.B(n17), 
	.A(A[4]));
   NOR2X1M U85 (.Y(\ab[4][6] ), 
	.B(n28), 
	.A(n18));
   NOR2X1M U86 (.Y(\ab[4][5] ), 
	.B(n28), 
	.A(n19));
   NOR2X1M U87 (.Y(\ab[4][4] ), 
	.B(n28), 
	.A(n20));
   NOR2X1M U88 (.Y(\ab[4][3] ), 
	.B(n28), 
	.A(n21));
   NOR2X1M U89 (.Y(\ab[4][2] ), 
	.B(n28), 
	.A(n22));
   NOR2X1M U90 (.Y(\ab[4][1] ), 
	.B(n28), 
	.A(n23));
   NOR2X1M U91 (.Y(\ab[4][0] ), 
	.B(n28), 
	.A(n24));
   NOR2X1M U92 (.Y(\ab[3][7] ), 
	.B(n17), 
	.A(A[3]));
   NOR2X1M U93 (.Y(\ab[3][6] ), 
	.B(n29), 
	.A(n18));
   NOR2X1M U94 (.Y(\ab[3][5] ), 
	.B(n29), 
	.A(n19));
   NOR2X1M U95 (.Y(\ab[3][4] ), 
	.B(n29), 
	.A(n20));
   NOR2X1M U96 (.Y(\ab[3][3] ), 
	.B(n29), 
	.A(n21));
   NOR2X1M U97 (.Y(\ab[3][2] ), 
	.B(n29), 
	.A(n22));
   NOR2X1M U98 (.Y(\ab[3][1] ), 
	.B(n29), 
	.A(n23));
   NOR2X1M U99 (.Y(\ab[3][0] ), 
	.B(n29), 
	.A(n24));
   NOR2X1M U100 (.Y(\ab[2][7] ), 
	.B(n17), 
	.A(A[2]));
   NOR2X1M U101 (.Y(\ab[2][6] ), 
	.B(n30), 
	.A(n18));
   NOR2X1M U102 (.Y(\ab[2][5] ), 
	.B(n30), 
	.A(n19));
   NOR2X1M U103 (.Y(\ab[2][4] ), 
	.B(n30), 
	.A(n20));
   NOR2X1M U104 (.Y(\ab[2][3] ), 
	.B(n30), 
	.A(n21));
   NOR2X1M U105 (.Y(\ab[2][2] ), 
	.B(n30), 
	.A(n22));
   NOR2X1M U106 (.Y(\ab[2][1] ), 
	.B(n30), 
	.A(n23));
   NOR2X1M U107 (.Y(\ab[2][0] ), 
	.B(n30), 
	.A(n24));
   NOR2X1M U108 (.Y(\ab[1][7] ), 
	.B(n17), 
	.A(A[1]));
   NOR2X1M U109 (.Y(PRODUCT[0]), 
	.B(n32), 
	.A(n24));
   CLKINVX1M U111 (.Y(\A1[13] ), 
	.A(\CARRYB[7][7] ));
   arithmetic_unit_DW01_add_1 FS_1 (.A({ \A1[13] ,
		\A1[12] ,
		\A1[11] ,
		\A1[10] ,
		\A1[9] ,
		\A1[8] ,
		\A1[7] ,
		\A1[6] ,
		\A1[5] ,
		\A1[4] ,
		\A1[3] ,
		\A1[2] ,
		\A1[1] ,
		\A1[0]  }), 
	.B({ n10,
		n14,
		n16,
		n12,
		n15,
		n11,
		n13,
		\A2[6] ,
		1'b0,
		1'b0,
		1'b0,
		1'b0,
		1'b0,
		1'b0 }), 
	.CI(1'b0), 
	.SUM({ PRODUCT[15],
		PRODUCT[14],
		PRODUCT[13],
		PRODUCT[12],
		PRODUCT[11],
		PRODUCT[10],
		PRODUCT[9],
		PRODUCT[8],
		PRODUCT[7],
		PRODUCT[6],
		PRODUCT[5],
		PRODUCT[4],
		PRODUCT[3],
		PRODUCT[2] }));
endmodule

module arithmetic_unit_test_1 (
	a, 
	b, 
	alu_fun, 
	arith_en, 
	clk, 
	rst, 
	arith_out, 
	ALU_Valid, 
	test_si, 
	test_se);
   input [7:0] a;
   input [7:0] b;
   input [1:0] alu_fun;
   input arith_en;
   input clk;
   input rst;
   output [15:0] arith_out;
   output ALU_Valid;
   input test_si;
   input test_se;

   // Internal wires
   wire N19;
   wire N20;
   wire N21;
   wire N22;
   wire N23;
   wire N24;
   wire N25;
   wire N26;
   wire N27;
   wire N28;
   wire N29;
   wire N30;
   wire N31;
   wire N32;
   wire N33;
   wire N34;
   wire N35;
   wire N36;
   wire N37;
   wire N38;
   wire N39;
   wire N40;
   wire N41;
   wire N42;
   wire N43;
   wire N44;
   wire N45;
   wire N46;
   wire N47;
   wire N48;
   wire N49;
   wire N50;
   wire N51;
   wire N52;
   wire N55;
   wire N56;
   wire N57;
   wire N58;
   wire N59;
   wire N60;
   wire N61;
   wire N62;
   wire N87;
   wire N88;
   wire N89;
   wire N90;
   wire N91;
   wire N92;
   wire N93;
   wire N94;
   wire N95;
   wire N96;
   wire N97;
   wire N98;
   wire N99;
   wire N100;
   wire N101;
   wire N102;
   wire n25;
   wire n26;
   wire n27;
   wire n28;
   wire n29;
   wire n30;
   wire n31;
   wire n32;
   wire n33;
   wire n34;
   wire n35;
   wire n36;
   wire n37;
   wire n38;
   wire n39;
   wire n40;
   wire n41;
   wire n42;
   wire n43;
   wire n44;
   wire n45;
   wire n46;
   wire n47;
   wire n48;
   wire n49;
   wire n50;
   wire n3;
   wire n5;
   wire n52;
   wire n56;
   wire n57;
   wire n58;
   wire n59;
   wire n60;
   wire n61;
   wire n62;
   wire n63;
   wire n64;
   wire n65;
   wire n66;
   wire n67;
   wire n68;
   wire n69;
   wire n70;

   SDFFRQX1M \arith_out_reg[7]  (.SI(arith_out[6]), 
	.SE(n69), 
	.RN(rst), 
	.Q(arith_out[7]), 
	.D(N94), 
	.CK(clk));
   SDFFRQX1M \arith_out_reg[6]  (.SI(arith_out[5]), 
	.SE(n62), 
	.RN(rst), 
	.Q(arith_out[6]), 
	.D(N93), 
	.CK(clk));
   SDFFRQX1M \arith_out_reg[5]  (.SI(arith_out[4]), 
	.SE(n64), 
	.RN(rst), 
	.Q(arith_out[5]), 
	.D(N92), 
	.CK(clk));
   SDFFRQX1M \arith_out_reg[4]  (.SI(arith_out[3]), 
	.SE(n60), 
	.RN(rst), 
	.Q(arith_out[4]), 
	.D(N91), 
	.CK(clk));
   SDFFRQX1M \arith_out_reg[3]  (.SI(arith_out[2]), 
	.SE(n59), 
	.RN(rst), 
	.Q(arith_out[3]), 
	.D(N90), 
	.CK(clk));
   SDFFRQX1M \arith_out_reg[2]  (.SI(arith_out[1]), 
	.SE(n63), 
	.RN(rst), 
	.Q(arith_out[2]), 
	.D(N89), 
	.CK(clk));
   SDFFRQX1M \arith_out_reg[8]  (.SI(arith_out[7]), 
	.SE(n58), 
	.RN(rst), 
	.Q(arith_out[8]), 
	.D(N95), 
	.CK(clk));
   SDFFRQX1M \arith_out_reg[1]  (.SI(arith_out[0]), 
	.SE(n60), 
	.RN(rst), 
	.Q(arith_out[1]), 
	.D(N88), 
	.CK(clk));
   SDFFRQX1M \arith_out_reg[0]  (.SI(ALU_Valid), 
	.SE(n58), 
	.RN(rst), 
	.Q(arith_out[0]), 
	.D(N87), 
	.CK(clk));
   SDFFRQX1M ALU_Valid_reg (.SI(test_si), 
	.SE(n68), 
	.RN(rst), 
	.Q(ALU_Valid), 
	.D(arith_en), 
	.CK(clk));
   SDFFRQX1M \arith_out_reg[15]  (.SI(arith_out[14]), 
	.SE(n61), 
	.RN(rst), 
	.Q(arith_out[15]), 
	.D(N102), 
	.CK(clk));
   SDFFRQX1M \arith_out_reg[14]  (.SI(arith_out[13]), 
	.SE(n70), 
	.RN(rst), 
	.Q(arith_out[14]), 
	.D(N101), 
	.CK(clk));
   SDFFRQX1M \arith_out_reg[13]  (.SI(arith_out[12]), 
	.SE(n61), 
	.RN(rst), 
	.Q(arith_out[13]), 
	.D(N100), 
	.CK(clk));
   SDFFRQX1M \arith_out_reg[12]  (.SI(arith_out[11]), 
	.SE(n62), 
	.RN(rst), 
	.Q(arith_out[12]), 
	.D(N99), 
	.CK(clk));
   SDFFRQX1M \arith_out_reg[11]  (.SI(arith_out[10]), 
	.SE(n67), 
	.RN(rst), 
	.Q(arith_out[11]), 
	.D(N98), 
	.CK(clk));
   SDFFRQX1M \arith_out_reg[10]  (.SI(arith_out[9]), 
	.SE(n63), 
	.RN(rst), 
	.Q(arith_out[10]), 
	.D(N97), 
	.CK(clk));
   SDFFRQX1M \arith_out_reg[9]  (.SI(arith_out[8]), 
	.SE(n59), 
	.RN(rst), 
	.Q(arith_out[9]), 
	.D(N96), 
	.CK(clk));
   NAND3X2M U22 (.Y(n3), 
	.C(arith_en), 
	.B(n52), 
	.A(alu_fun[1]));
   AND2X2M U23 (.Y(n28), 
	.B(arith_en), 
	.A(n46));
   AND2X2M U24 (.Y(n29), 
	.B(arith_en), 
	.A(n45));
   CLKINVX2M U26 (.Y(n5), 
	.A(n3));
   CLKINVX1M U29 (.Y(n52), 
	.A(alu_fun[0]));
   NOR2X2M U30 (.Y(n46), 
	.B(alu_fun[1]), 
	.A(n52));
   NOR2X2M U31 (.Y(n45), 
	.B(alu_fun[1]), 
	.A(alu_fun[0]));
   OAI2BB1X2M U33 (.Y(N95), 
	.B0(n25), 
	.A1N(n5), 
	.A0N(N45));
   OAI2BB1X2M U34 (.Y(N96), 
	.B0(n25), 
	.A1N(n5), 
	.A0N(N46));
   OAI2BB1X2M U35 (.Y(N97), 
	.B0(n25), 
	.A1N(n5), 
	.A0N(N47));
   OAI2BB1X2M U36 (.Y(N98), 
	.B0(n25), 
	.A1N(n5), 
	.A0N(N48));
   OAI2BB1X2M U37 (.Y(N99), 
	.B0(n25), 
	.A1N(n5), 
	.A0N(N49));
   OAI2BB1X2M U38 (.Y(N100), 
	.B0(n25), 
	.A1N(n5), 
	.A0N(N50));
   OAI2BB1X2M U39 (.Y(N101), 
	.B0(n25), 
	.A1N(n5), 
	.A0N(N51));
   OAI2BB1X2M U40 (.Y(N102), 
	.B0(n25), 
	.A1N(n5), 
	.A0N(N52));
   NAND2X2M U41 (.Y(N88), 
	.B(n42), 
	.A(n41));
   AOI22X1M U42 (.Y(n42), 
	.B1(n29), 
	.B0(N20), 
	.A1(n28), 
	.A0(N29));
   AOI22X1M U43 (.Y(n41), 
	.B1(n5), 
	.B0(N38), 
	.A1(n30), 
	.A0(N56));
   NAND2X2M U44 (.Y(N89), 
	.B(n40), 
	.A(n39));
   AOI22X1M U45 (.Y(n40), 
	.B1(n29), 
	.B0(N21), 
	.A1(n28), 
	.A0(N30));
   AOI22X1M U46 (.Y(n39), 
	.B1(n5), 
	.B0(N39), 
	.A1(n30), 
	.A0(N57));
   NAND2X2M U47 (.Y(N90), 
	.B(n38), 
	.A(n37));
   AOI22X1M U48 (.Y(n38), 
	.B1(n29), 
	.B0(N22), 
	.A1(n28), 
	.A0(N31));
   AOI22X1M U49 (.Y(n37), 
	.B1(n5), 
	.B0(N40), 
	.A1(n30), 
	.A0(N58));
   NAND2X2M U50 (.Y(N91), 
	.B(n36), 
	.A(n35));
   AOI22X1M U51 (.Y(n36), 
	.B1(n29), 
	.B0(N23), 
	.A1(n28), 
	.A0(N32));
   AOI22X1M U52 (.Y(n35), 
	.B1(n5), 
	.B0(N41), 
	.A1(n30), 
	.A0(N59));
   NAND2X2M U53 (.Y(N92), 
	.B(n34), 
	.A(n33));
   AOI22X1M U54 (.Y(n34), 
	.B1(n29), 
	.B0(N24), 
	.A1(n28), 
	.A0(N33));
   AOI22X1M U55 (.Y(n33), 
	.B1(n5), 
	.B0(N42), 
	.A1(n30), 
	.A0(N60));
   NAND2X2M U56 (.Y(N87), 
	.B(n44), 
	.A(n43));
   AOI22X1M U57 (.Y(n43), 
	.B1(n5), 
	.B0(N37), 
	.A1(n30), 
	.A0(N55));
   AOI22X1M U58 (.Y(n44), 
	.B1(n29), 
	.B0(N19), 
	.A1(n28), 
	.A0(N28));
   NAND2X2M U59 (.Y(N93), 
	.B(n32), 
	.A(n31));
   AOI22X1M U60 (.Y(n31), 
	.B1(n5), 
	.B0(N43), 
	.A1(n30), 
	.A0(N61));
   AOI22X1M U61 (.Y(n32), 
	.B1(n29), 
	.B0(N25), 
	.A1(n28), 
	.A0(N34));
   NAND2X2M U62 (.Y(N94), 
	.B(n27), 
	.A(n26));
   AOI22X1M U63 (.Y(n26), 
	.B1(n5), 
	.B0(N44), 
	.A1(n30), 
	.A0(N62));
   AOI22X1M U64 (.Y(n27), 
	.B1(n29), 
	.B0(N26), 
	.A1(n28), 
	.A0(N35));
   AND3X2M U65 (.Y(n30), 
	.C(n47), 
	.B(arith_en), 
	.A(alu_fun[0]));
   AOI21BX1M U66 (.Y(n47), 
	.B0N(alu_fun[1]), 
	.A1(n49), 
	.A0(n48));
   NOR4X1M U67 (.Y(n48), 
	.D(b[0]), 
	.C(b[1]), 
	.B(b[2]), 
	.A(b[3]));
   NOR4X1M U68 (.Y(n49), 
	.D(b[4]), 
	.C(b[5]), 
	.B(b[6]), 
	.A(b[7]));
   NAND2BX2M U69 (.Y(n25), 
	.B(arith_en), 
	.AN(n50));
   AOI22X1M U70 (.Y(n50), 
	.B1(n45), 
	.B0(N27), 
	.A1(n46), 
	.A0(N36));
   DLY1X1M U72 (.Y(n56), 
	.A(n65));
   DLY1X1M U73 (.Y(n57), 
	.A(n66));
   DLY1X1M U74 (.Y(n58), 
	.A(n64));
   DLY1X1M U75 (.Y(n59), 
	.A(n67));
   DLY1X1M U76 (.Y(n60), 
	.A(n68));
   DLY1X1M U77 (.Y(n61), 
	.A(n69));
   DLY1X1M U78 (.Y(n62), 
	.A(n70));
   DLY1X1M U79 (.Y(n63), 
	.A(n65));
   DLY1X1M U80 (.Y(n64), 
	.A(n66));
   DLY1X1M U81 (.Y(n65), 
	.A(test_se));
   DLY1X1M U82 (.Y(n66), 
	.A(test_se));
   DLY1X1M U83 (.Y(n67), 
	.A(n57));
   DLY1X1M U84 (.Y(n68), 
	.A(n56));
   DLY1X1M U85 (.Y(n69), 
	.A(n57));
   DLY1X1M U86 (.Y(n70), 
	.A(n56));
   arithmetic_unit_DW_div_uns_0 div_30 (.a({ a[7],
		a[6],
		a[5],
		a[4],
		a[3],
		a[2],
		a[1],
		a[0] }), 
	.b({ b[7],
		b[6],
		b[5],
		b[4],
		b[3],
		b[2],
		b[1],
		b[0] }), 
	.quotient({ N62,
		N61,
		N60,
		N59,
		N58,
		N57,
		N56,
		N55 }));
   arithmetic_unit_DW01_sub_0 sub_22 (.A({ a[7],
		a[7],
		a[6],
		a[5],
		a[4],
		a[3],
		a[2],
		a[1],
		a[0] }), 
	.B({ b[7],
		b[7],
		b[6],
		b[5],
		b[4],
		b[3],
		b[2],
		b[1],
		b[0] }), 
	.CI(1'b0), 
	.DIFF({ N36,
		N35,
		N34,
		N33,
		N32,
		N31,
		N30,
		N29,
		N28 }));
   arithmetic_unit_DW01_add_0 add_18 (.A({ a[7],
		a[7],
		a[6],
		a[5],
		a[4],
		a[3],
		a[2],
		a[1],
		a[0] }), 
	.B({ b[7],
		b[7],
		b[6],
		b[5],
		b[4],
		b[3],
		b[2],
		b[1],
		b[0] }), 
	.CI(1'b0), 
	.SUM({ N27,
		N26,
		N25,
		N24,
		N23,
		N22,
		N21,
		N20,
		N19 }));
   arithmetic_unit_DW02_mult_0 mult_26 (.A({ a[7],
		a[6],
		a[5],
		a[4],
		a[3],
		a[2],
		a[1],
		a[0] }), 
	.B({ b[7],
		b[6],
		b[5],
		b[4],
		b[3],
		b[2],
		b[1],
		b[0] }), 
	.TC(1'b1), 
	.PRODUCT({ N52,
		N51,
		N50,
		N49,
		N48,
		N47,
		N46,
		N45,
		N44,
		N43,
		N42,
		N41,
		N40,
		N39,
		N38,
		N37 }));
endmodule

module logic_unit_test_1 (
	a, 
	b, 
	alu_fun, 
	logic_en, 
	clk, 
	rst, 
	logic_out, 
	ALU_Valid, 
	test_si, 
	test_se, 
	n6, 
	ALU_CLK__L4_N1);
   input [7:0] a;
   input [7:0] b;
   input [1:0] alu_fun;
   input logic_en;
   input clk;
   input rst;
   output [7:0] logic_out;
   output ALU_Valid;
   input test_si;
   input test_se;
   input n6;
   input ALU_CLK__L4_N1;

   // Internal wires
   wire N56;
   wire N57;
   wire N58;
   wire N59;
   wire N60;
   wire N61;
   wire N62;
   wire N63;
   wire n25;
   wire n26;
   wire n27;
   wire n28;
   wire n29;
   wire n30;
   wire n31;
   wire n32;
   wire n33;
   wire n34;
   wire n35;
   wire n36;
   wire n37;
   wire n38;
   wire n39;
   wire n40;
   wire n41;
   wire n42;
   wire n43;
   wire n44;
   wire n45;
   wire n46;
   wire n47;
   wire n48;
   wire n49;
   wire n50;
   wire n51;
   wire n52;
   wire n14;
   wire n15;
   wire n16;
   wire n17;
   wire n18;
   wire n19;
   wire n20;
   wire n21;
   wire n22;
   wire n23;
   wire n24;
   wire n53;
   wire n54;
   wire n55;
   wire n56;
   wire n59;
   wire n60;
   wire n61;
   wire n62;
   wire n63;
   wire n64;
   wire n65;

   SDFFRQX1M \logic_out_reg[7]  (.SI(logic_out[6]), 
	.SE(n62), 
	.RN(rst), 
	.Q(logic_out[7]), 
	.D(N63), 
	.CK(clk));
   SDFFRQX1M \logic_out_reg[6]  (.SI(logic_out[5]), 
	.SE(n61), 
	.RN(rst), 
	.Q(logic_out[6]), 
	.D(N62), 
	.CK(clk));
   SDFFRQX1M \logic_out_reg[5]  (.SI(logic_out[4]), 
	.SE(n60), 
	.RN(rst), 
	.Q(logic_out[5]), 
	.D(N61), 
	.CK(clk));
   SDFFRQX1M \logic_out_reg[4]  (.SI(logic_out[3]), 
	.SE(n62), 
	.RN(rst), 
	.Q(logic_out[4]), 
	.D(N60), 
	.CK(clk));
   SDFFRQX1M \logic_out_reg[3]  (.SI(logic_out[2]), 
	.SE(n61), 
	.RN(rst), 
	.Q(logic_out[3]), 
	.D(N59), 
	.CK(clk));
   SDFFRQX1M \logic_out_reg[2]  (.SI(logic_out[1]), 
	.SE(n60), 
	.RN(rst), 
	.Q(logic_out[2]), 
	.D(N58), 
	.CK(ALU_CLK__L4_N1));
   SDFFRQX1M \logic_out_reg[1]  (.SI(logic_out[0]), 
	.SE(n65), 
	.RN(rst), 
	.Q(logic_out[1]), 
	.D(N57), 
	.CK(clk));
   SDFFRQX1M \logic_out_reg[0]  (.SI(ALU_Valid), 
	.SE(n64), 
	.RN(rst), 
	.Q(logic_out[0]), 
	.D(N56), 
	.CK(clk));
   SDFFRQX1M ALU_Valid_reg (.SI(test_si), 
	.SE(n63), 
	.RN(rst), 
	.Q(ALU_Valid), 
	.D(n6), 
	.CK(ALU_CLK__L4_N1));
   CLKNAND2X2M U12 (.Y(n33), 
	.B(n14), 
	.A(n6));
   CLKNAND2X2M U13 (.Y(n34), 
	.B(alu_fun[1]), 
	.A(n6));
   CLKINVX1M U14 (.Y(n14), 
	.A(alu_fun[1]));
   NAND3X2M U16 (.Y(n29), 
	.C(n6), 
	.B(n14), 
	.A(alu_fun[0]));
   NAND3BX2M U18 (.Y(n28), 
	.C(n6), 
	.B(alu_fun[1]), 
	.AN(alu_fun[0]));
   OAI221X1M U21 (.Y(N62), 
	.C0(n30), 
	.B1(n29), 
	.B0(n22), 
	.A1(n28), 
	.A0(a[6]));
   AOI22X1M U22 (.Y(n30), 
	.B1(n32), 
	.B0(b[6]), 
	.A1(n15), 
	.A0(n31));
   INVXLM U23 (.Y(n15), 
	.A(b[6]));
   OAI21X2M U24 (.Y(n32), 
	.B0(n29), 
	.A1(n22), 
	.A0(n33));
   OAI221X1M U25 (.Y(N57), 
	.C0(n47), 
	.B1(n55), 
	.B0(n29), 
	.A1(n28), 
	.A0(a[1]));
   AOI22X1M U26 (.Y(n47), 
	.B1(n49), 
	.B0(b[1]), 
	.A1(n20), 
	.A0(n48));
   INVX2M U27 (.Y(n20), 
	.A(b[1]));
   OAI21X2M U28 (.Y(n49), 
	.B0(n29), 
	.A1(n55), 
	.A0(n33));
   OAI221X1M U29 (.Y(N58), 
	.C0(n44), 
	.B1(n54), 
	.B0(n29), 
	.A1(n28), 
	.A0(a[2]));
   AOI22X1M U30 (.Y(n44), 
	.B1(n46), 
	.B0(b[2]), 
	.A1(n19), 
	.A0(n45));
   INVX2M U31 (.Y(n19), 
	.A(b[2]));
   OAI21X2M U32 (.Y(n46), 
	.B0(n29), 
	.A1(n54), 
	.A0(n33));
   OAI221X1M U33 (.Y(N59), 
	.C0(n41), 
	.B1(n53), 
	.B0(n29), 
	.A1(n28), 
	.A0(a[3]));
   AOI22X1M U34 (.Y(n41), 
	.B1(n43), 
	.B0(b[3]), 
	.A1(n18), 
	.A0(n42));
   INVX2M U35 (.Y(n18), 
	.A(b[3]));
   OAI21X2M U36 (.Y(n43), 
	.B0(n29), 
	.A1(n53), 
	.A0(n33));
   OAI221X1M U37 (.Y(N60), 
	.C0(n38), 
	.B1(n24), 
	.B0(n29), 
	.A1(n28), 
	.A0(a[4]));
   AOI22X1M U38 (.Y(n38), 
	.B1(n40), 
	.B0(b[4]), 
	.A1(n17), 
	.A0(n39));
   INVX2M U39 (.Y(n17), 
	.A(b[4]));
   OAI21X2M U40 (.Y(n40), 
	.B0(n29), 
	.A1(n24), 
	.A0(n33));
   OAI221X1M U41 (.Y(N61), 
	.C0(n35), 
	.B1(n23), 
	.B0(n29), 
	.A1(n28), 
	.A0(a[5]));
   AOI22X1M U42 (.Y(n35), 
	.B1(n37), 
	.B0(b[5]), 
	.A1(n16), 
	.A0(n36));
   INVX2M U43 (.Y(n16), 
	.A(b[5]));
   OAI21X2M U44 (.Y(n37), 
	.B0(n29), 
	.A1(n23), 
	.A0(n33));
   OAI221X1M U45 (.Y(N56), 
	.C0(n50), 
	.B1(n56), 
	.B0(n29), 
	.A1(n28), 
	.A0(a[0]));
   AOI22X1M U46 (.Y(n50), 
	.B1(n52), 
	.B0(b[0]), 
	.A1(n21), 
	.A0(n51));
   INVX2M U47 (.Y(n21), 
	.A(b[0]));
   OAI21X2M U48 (.Y(n52), 
	.B0(n29), 
	.A1(n56), 
	.A0(n33));
   CLKINVX1M U49 (.Y(n22), 
	.A(a[6]));
   CLKINVX1M U50 (.Y(n55), 
	.A(a[1]));
   CLKINVX1M U51 (.Y(n54), 
	.A(a[2]));
   CLKINVX1M U52 (.Y(n53), 
	.A(a[3]));
   CLKINVX1M U53 (.Y(n24), 
	.A(a[4]));
   CLKINVX1M U54 (.Y(n23), 
	.A(a[5]));
   INVX2M U55 (.Y(n56), 
	.A(a[0]));
   OAI21X2M U56 (.Y(n51), 
	.B0(n28), 
	.A1(n34), 
	.A0(a[0]));
   OAI21X1M U57 (.Y(n48), 
	.B0(n28), 
	.A1(n34), 
	.A0(a[1]));
   OAI21X1M U58 (.Y(n45), 
	.B0(n28), 
	.A1(n34), 
	.A0(a[2]));
   OAI21X1M U59 (.Y(n42), 
	.B0(n28), 
	.A1(n34), 
	.A0(a[3]));
   OAI21X1M U60 (.Y(n39), 
	.B0(n28), 
	.A1(n34), 
	.A0(a[4]));
   OAI21X1M U61 (.Y(n36), 
	.B0(n28), 
	.A1(n34), 
	.A0(a[5]));
   OAI21X1M U62 (.Y(n31), 
	.B0(n28), 
	.A1(n34), 
	.A0(a[6]));
   NOR2BX2M U63 (.Y(N63), 
	.B(n25), 
	.AN(logic_en));
   XNOR2X1M U64 (.Y(n25), 
	.B(n26), 
	.A(alu_fun[1]));
   OAI2BB1XLM U65 (.Y(n26), 
	.B0(n27), 
	.A1N(alu_fun[0]), 
	.A0N(a[7]));
   OAI21X1M U66 (.Y(n27), 
	.B0(b[7]), 
	.A1(alu_fun[0]), 
	.A0(a[7]));
   DLY1X1M U67 (.Y(n59), 
	.A(test_se));
   DLY1X1M U68 (.Y(n60), 
	.A(n63));
   DLY1X1M U69 (.Y(n61), 
	.A(n64));
   DLY1X1M U70 (.Y(n62), 
	.A(n65));
   DLY1X1M U71 (.Y(n63), 
	.A(n59));
   DLY1X1M U72 (.Y(n64), 
	.A(n59));
   DLY1X1M U73 (.Y(n65), 
	.A(test_se));
endmodule

module cmp_unit_test_1 (
	a, 
	b, 
	alu_fun, 
	cmp_en, 
	clk, 
	rst, 
	cmp_out, 
	ALU_Valid, 
	test_si, 
	test_se);
   input [7:0] a;
   input [7:0] b;
   input [1:0] alu_fun;
   input cmp_en;
   input clk;
   input rst;
   output [1:0] cmp_out;
   output ALU_Valid;
   input test_si;
   input test_se;

   // Internal wires
   wire N18;
   wire N20;
   wire N23;
   wire N24;
   wire n13;
   wire n14;
   wire n2;
   wire n3;
   wire n4;
   wire n5;
   wire n6;
   wire n10;
   wire n11;
   wire n12;
   wire n15;
   wire n16;
   wire n17;
   wire n18;
   wire n19;
   wire n20;
   wire n21;
   wire n22;
   wire n23;
   wire n24;
   wire n25;
   wire n26;
   wire n27;
   wire n28;
   wire n29;
   wire n30;
   wire n31;
   wire n32;
   wire n33;
   wire n34;
   wire n35;
   wire n36;
   wire n37;
   wire n38;
   wire n39;
   wire n40;
   wire n41;
   wire n42;
   wire n43;
   wire n44;
   wire n45;
   wire n48;

   SDFFRQX1M ALU_Valid_reg (.SI(test_si), 
	.SE(n48), 
	.RN(rst), 
	.Q(ALU_Valid), 
	.D(cmp_en), 
	.CK(clk));
   SDFFRQX1M \cmp_out_reg[1]  (.SI(cmp_out[0]), 
	.SE(n48), 
	.RN(rst), 
	.Q(cmp_out[1]), 
	.D(N24), 
	.CK(clk));
   SDFFRQX1M \cmp_out_reg[0]  (.SI(ALU_Valid), 
	.SE(test_se), 
	.RN(rst), 
	.Q(cmp_out[0]), 
	.D(N23), 
	.CK(clk));
   AOI2B1X1M U5 (.Y(n32), 
	.B0(n29), 
	.A1N(n31), 
	.A0(n30));
   INVX2M U7 (.Y(n42), 
	.A(n32));
   OAI21X2M U8 (.Y(N20), 
	.B0(n30), 
	.A1(n12), 
	.A0(n29));
   AOI211X2M U9 (.Y(n18), 
	.C0(n15), 
	.B0(n16), 
	.A1(n33), 
	.A0(n17));
   XNOR2X2M U10 (.Y(n26), 
	.B(b[6]), 
	.A(a[6]));
   OAI31X1M U11 (.Y(n10), 
	.B0(n20), 
	.A2(n4), 
	.A1(n5), 
	.A0(n19));
   AOI211X2M U12 (.Y(n4), 
	.C0(n3), 
	.B0(n16), 
	.A1(n36), 
	.A0(a[1]));
   NOR2X2M U13 (.Y(n29), 
	.B(a[7]), 
	.A(n41));
   NOR2X2M U14 (.Y(n19), 
	.B(a[3]), 
	.A(n39));
   NOR2X2M U15 (.Y(n5), 
	.B(a[2]), 
	.A(n37));
   NOR2X2M U16 (.Y(n2), 
	.B(a[0]), 
	.A(n35));
   NAND2X1M U17 (.Y(n30), 
	.B(n41), 
	.A(a[7]));
   INVX2M U18 (.Y(n45), 
	.A(cmp_en));
   CLKINVX1M U19 (.Y(n44), 
	.A(alu_fun[1]));
   CLKINVX1M U20 (.Y(n43), 
	.A(alu_fun[0]));
   NOR3X2M U22 (.Y(N23), 
	.C(n43), 
	.B(n14), 
	.A(n45));
   AOI22X1M U23 (.Y(n14), 
	.B1(N20), 
	.B0(alu_fun[1]), 
	.A1(n44), 
	.A0(N18));
   NOR3X2M U24 (.Y(N24), 
	.C(n44), 
	.B(n13), 
	.A(n45));
   AOI22X1M U25 (.Y(n13), 
	.B1(N20), 
	.B0(alu_fun[0]), 
	.A1(n43), 
	.A0(n42));
   INVXLM U26 (.Y(n34), 
	.A(a[6]));
   INVX2M U27 (.Y(n40), 
	.A(b[6]));
   INVXLM U28 (.Y(n36), 
	.A(n2));
   INVXLM U29 (.Y(n38), 
	.A(n18));
   CLKINVX2M U30 (.Y(n33), 
	.A(a[1]));
   INVX2M U31 (.Y(n41), 
	.A(b[7]));
   INVX2M U32 (.Y(n35), 
	.A(b[0]));
   INVX2M U33 (.Y(n39), 
	.A(b[3]));
   INVX2M U34 (.Y(n37), 
	.A(b[2]));
   NAND2BX1M U35 (.Y(n22), 
	.B(a[4]), 
	.AN(b[4]));
   NAND2BX1M U36 (.Y(n6), 
	.B(b[4]), 
	.AN(a[4]));
   CLKNAND2X2M U37 (.Y(n24), 
	.B(n6), 
	.A(n22));
   CLKNAND2X2M U38 (.Y(n21), 
	.B(n37), 
	.A(a[2]));
   NAND2BX1M U39 (.Y(n16), 
	.B(n21), 
	.AN(n5));
   AOI21X1M U40 (.Y(n3), 
	.B0(b[1]), 
	.A1(n33), 
	.A0(n2));
   CLKNAND2X2M U41 (.Y(n20), 
	.B(n39), 
	.A(a[3]));
   NAND2BX1M U42 (.Y(n27), 
	.B(b[5]), 
	.AN(a[5]));
   OAI211X1M U43 (.Y(n11), 
	.C0(n27), 
	.B0(n6), 
	.A1(n10), 
	.A0(n24));
   NAND2BX1M U44 (.Y(n23), 
	.B(a[5]), 
	.AN(b[5]));
   AOI32X1M U45 (.Y(n12), 
	.B1(n34), 
	.B0(b[6]), 
	.A2(n26), 
	.A1(n23), 
	.A0(n11));
   CLKNAND2X2M U46 (.Y(n17), 
	.B(n35), 
	.A(a[0]));
   OA21X1M U47 (.Y(n15), 
	.B0(b[1]), 
	.A1(n33), 
	.A0(n17));
   AOI31X1M U48 (.Y(n25), 
	.B0(n19), 
	.A2(n20), 
	.A1(n21), 
	.A0(n38));
   OAI2B11X1M U49 (.Y(n28), 
	.C0(n22), 
	.B0(n23), 
	.A1N(n25), 
	.A0(n24));
   AOI32X1M U50 (.Y(n31), 
	.B1(n40), 
	.B0(a[6]), 
	.A2(n26), 
	.A1(n27), 
	.A0(n28));
   NOR2X1M U51 (.Y(N18), 
	.B(n42), 
	.A(N20));
   DLY1X1M U52 (.Y(n48), 
	.A(test_se));
endmodule

module shift_unit_test_1 (
	a, 
	b, 
	alu_fun, 
	shift_en, 
	clk, 
	rst, 
	shift_out, 
	ALU_Valid, 
	test_si, 
	test_se, 
	ALU_CLK__L4_N1);
   input [7:0] a;
   input [7:0] b;
   input [1:0] alu_fun;
   input shift_en;
   input clk;
   input rst;
   output [8:0] shift_out;
   output ALU_Valid;
   input test_si;
   input test_se;
   input ALU_CLK__L4_N1;

   // Internal wires
   wire N25;
   wire N26;
   wire N27;
   wire N28;
   wire N29;
   wire N30;
   wire N31;
   wire N32;
   wire N33;
   wire n14;
   wire n15;
   wire n16;
   wire n17;
   wire n18;
   wire n19;
   wire n20;
   wire n21;
   wire n22;
   wire n23;
   wire n24;
   wire n25;
   wire n26;
   wire n27;
   wire n28;
   wire n29;
   wire n30;
   wire n31;
   wire n32;
   wire n13;
   wire n33;
   wire n34;
   wire n37;
   wire n38;
   wire n39;
   wire n40;
   wire n41;
   wire n42;
   wire n43;
   wire n44;

   SDFFRQX1M \shift_out_reg[8]  (.SI(shift_out[7]), 
	.SE(n38), 
	.RN(rst), 
	.Q(shift_out[8]), 
	.D(N33), 
	.CK(ALU_CLK__L4_N1));
   SDFFRQX1M ALU_Valid_reg (.SI(test_si), 
	.SE(n37), 
	.RN(rst), 
	.Q(ALU_Valid), 
	.D(shift_en), 
	.CK(clk));
   SDFFRQX1M \shift_out_reg[1]  (.SI(shift_out[0]), 
	.SE(n44), 
	.RN(rst), 
	.Q(shift_out[1]), 
	.D(N26), 
	.CK(clk));
   SDFFRQX1M \shift_out_reg[0]  (.SI(ALU_Valid), 
	.SE(n43), 
	.RN(rst), 
	.Q(shift_out[0]), 
	.D(N25), 
	.CK(clk));
   SDFFRQX1M \shift_out_reg[7]  (.SI(shift_out[6]), 
	.SE(n38), 
	.RN(rst), 
	.Q(shift_out[7]), 
	.D(N32), 
	.CK(clk));
   SDFFRQX1M \shift_out_reg[6]  (.SI(shift_out[5]), 
	.SE(n37), 
	.RN(rst), 
	.Q(shift_out[6]), 
	.D(N31), 
	.CK(clk));
   SDFFRQX1M \shift_out_reg[5]  (.SI(shift_out[4]), 
	.SE(n44), 
	.RN(rst), 
	.Q(shift_out[5]), 
	.D(N30), 
	.CK(clk));
   SDFFRQX1M \shift_out_reg[4]  (.SI(shift_out[3]), 
	.SE(n43), 
	.RN(rst), 
	.Q(shift_out[4]), 
	.D(N29), 
	.CK(clk));
   SDFFRQX1M \shift_out_reg[3]  (.SI(shift_out[2]), 
	.SE(n42), 
	.RN(rst), 
	.Q(shift_out[3]), 
	.D(N28), 
	.CK(clk));
   SDFFRQX1M \shift_out_reg[2]  (.SI(shift_out[1]), 
	.SE(n41), 
	.RN(rst), 
	.Q(shift_out[2]), 
	.D(N27), 
	.CK(clk));
   NOR2XLM U13 (.Y(n21), 
	.B(alu_fun[1]), 
	.A(alu_fun[0]));
   CLKINVX1M U14 (.Y(n33), 
	.A(alu_fun[1]));
   CLKINVX1M U15 (.Y(n13), 
	.A(alu_fun[0]));
   CLKINVX2M U16 (.Y(n34), 
	.A(shift_en));
   NOR2X2M U17 (.Y(n15), 
	.B(n13), 
	.A(n33));
   NOR2XLM U18 (.Y(n16), 
	.B(alu_fun[1]), 
	.A(n13));
   NOR2X2M U19 (.Y(n20), 
	.B(alu_fun[0]), 
	.A(n33));
   AOI21X2M U22 (.Y(N28), 
	.B0(n34), 
	.A1(n27), 
	.A0(n26));
   AOI22X1M U23 (.Y(n27), 
	.B1(n20), 
	.B0(b[4]), 
	.A1(n15), 
	.A0(b[2]));
   AOI22X1M U24 (.Y(n26), 
	.B1(n21), 
	.B0(a[4]), 
	.A1(n16), 
	.A0(a[2]));
   AOI21X2M U25 (.Y(N27), 
	.B0(n34), 
	.A1(n29), 
	.A0(n28));
   AOI22X1M U26 (.Y(n29), 
	.B1(n20), 
	.B0(b[3]), 
	.A1(n15), 
	.A0(b[1]));
   AOI22X1M U27 (.Y(n28), 
	.B1(n21), 
	.B0(a[3]), 
	.A1(n16), 
	.A0(a[1]));
   AOI21X2M U28 (.Y(N26), 
	.B0(n34), 
	.A1(n31), 
	.A0(n30));
   AOI22X1M U29 (.Y(n31), 
	.B1(n20), 
	.B0(b[2]), 
	.A1(n15), 
	.A0(b[0]));
   AOI22X1M U30 (.Y(n30), 
	.B1(n21), 
	.B0(a[2]), 
	.A1(n16), 
	.A0(a[0]));
   AOI21X2M U31 (.Y(N31), 
	.B0(n34), 
	.A1(n19), 
	.A0(n18));
   AOI22X1M U32 (.Y(n19), 
	.B1(b[7]), 
	.B0(n20), 
	.A1(n15), 
	.A0(b[5]));
   AOI22X1M U33 (.Y(n18), 
	.B1(a[7]), 
	.B0(n21), 
	.A1(n16), 
	.A0(a[5]));
   AOI21X2M U34 (.Y(N30), 
	.B0(n34), 
	.A1(n23), 
	.A0(n22));
   AOI22X1M U35 (.Y(n23), 
	.B1(b[6]), 
	.B0(n20), 
	.A1(n15), 
	.A0(b[4]));
   AOI22X1M U36 (.Y(n22), 
	.B1(a[6]), 
	.B0(n21), 
	.A1(n16), 
	.A0(a[4]));
   AOI21X2M U37 (.Y(N29), 
	.B0(n34), 
	.A1(n25), 
	.A0(n24));
   AOI22X1M U38 (.Y(n25), 
	.B1(b[5]), 
	.B0(n20), 
	.A1(n15), 
	.A0(b[3]));
   AOI22X1M U39 (.Y(n24), 
	.B1(a[5]), 
	.B0(n21), 
	.A1(n16), 
	.A0(a[3]));
   NOR2X2M U40 (.Y(N33), 
	.B(n34), 
	.A(n14));
   AOI22X1M U41 (.Y(n14), 
	.B1(n16), 
	.B0(a[7]), 
	.A1(n15), 
	.A0(b[7]));
   NOR2X2M U42 (.Y(N32), 
	.B(n34), 
	.A(n17));
   AOI22X1M U43 (.Y(n17), 
	.B1(n16), 
	.B0(a[6]), 
	.A1(n15), 
	.A0(b[6]));
   NOR2X2M U44 (.Y(N25), 
	.B(n34), 
	.A(n32));
   AOI22X1M U45 (.Y(n32), 
	.B1(n21), 
	.B0(a[1]), 
	.A1(n20), 
	.A0(b[1]));
   DLY1X1M U46 (.Y(n37), 
	.A(n41));
   DLY1X1M U47 (.Y(n38), 
	.A(n42));
   DLY1X1M U48 (.Y(n39), 
	.A(test_se));
   DLY1X1M U49 (.Y(n40), 
	.A(test_se));
   DLY1X1M U50 (.Y(n41), 
	.A(n40));
   DLY1X1M U51 (.Y(n42), 
	.A(n39));
   DLY1X1M U52 (.Y(n43), 
	.A(n40));
   DLY1X1M U53 (.Y(n44), 
	.A(n39));
endmodule

module alu_top_test_1 (
	a, 
	b, 
	alu_fun, 
	clk, 
	rst, 
	ALU_OUT, 
	ALU_Valid, 
	test_si, 
	test_so, 
	test_se, 
	ALU_CLK__L4_N1);
   input [7:0] a;
   input [7:0] b;
   input [3:0] alu_fun;
   input clk;
   input rst;
   output [15:0] ALU_OUT;
   output ALU_Valid;
   input test_si;
   output test_so;
   input test_se;
   input ALU_CLK__L4_N1;

   // Internal wires
   wire FE_UNCONNECTED_0;
   wire arith_en;
   wire cmp_en;
   wire shift_en;
   wire arith_valid;
   wire logic_valid;
   wire cmp_valid;
   wire shift_valid;
   wire n2;
   wire n3;
   wire n4;
   wire n6;
   wire n7;
   wire n8;
   wire n9;
   wire n10;
   wire n11;
   wire n12;
   wire n13;
   wire n14;
   wire n15;
   wire n16;
   wire n17;
   wire n18;
   wire n5;
   wire n21;
   wire n25;
   wire n28;
   wire n29;
   wire n30;
   wire n31;
   wire n32;
   wire n33;
   wire n34;
   wire [15:0] arith_out;
   wire [7:0] logic_out;
   wire [1:0] cmp_out;
   wire [8:0] shift_out;

   assign test_so = shift_out[8] ;

   AND2X2M U2 (.Y(n4), 
	.B(n25), 
	.A(alu_fun[3]));
   NOR3X2M U5 (.Y(n8), 
	.C(n6), 
	.B(n21), 
	.A(n4));
   AOI22X1M U7 (.Y(n17), 
	.B1(n7), 
	.B0(arith_out[0]), 
	.A1(n6), 
	.A0(logic_out[0]));
   AOI22X1M U8 (.Y(n15), 
	.B1(n7), 
	.B0(arith_out[1]), 
	.A1(n6), 
	.A0(logic_out[1]));
   AOI22X1M U9 (.Y(n18), 
	.B1(n21), 
	.B0(shift_out[0]), 
	.A1(n4), 
	.A0(cmp_out[0]));
   AOI22X1M U10 (.Y(n16), 
	.B1(n21), 
	.B0(shift_out[1]), 
	.A1(n4), 
	.A0(cmp_out[1]));
   CLKINVX2M U11 (.Y(n21), 
	.A(n5));
   CLKINVX1M U13 (.Y(n25), 
	.A(alu_fun[2]));
   NOR2X2M U14 (.Y(n6), 
	.B(alu_fun[3]), 
	.A(n25));
   NOR2X1M U16 (.Y(n7), 
	.B(alu_fun[3]), 
	.A(alu_fun[2]));
   NAND2X2M U17 (.Y(n5), 
	.B(alu_fun[2]), 
	.A(alu_fun[3]));
   NAND2X2M U19 (.Y(ALU_OUT[0]), 
	.B(n18), 
	.A(n17));
   NAND2X2M U20 (.Y(ALU_OUT[1]), 
	.B(n16), 
	.A(n15));
   OAI2BB1X2M U21 (.Y(ALU_OUT[2]), 
	.B0(n14), 
	.A1N(n7), 
	.A0N(arith_out[2]));
   OAI2BB1X2M U22 (.Y(ALU_OUT[3]), 
	.B0(n13), 
	.A1N(n7), 
	.A0N(arith_out[3]));
   OAI2BB1X2M U23 (.Y(ALU_OUT[4]), 
	.B0(n12), 
	.A1N(n7), 
	.A0N(arith_out[4]));
   OAI2BB1X2M U24 (.Y(ALU_OUT[5]), 
	.B0(n11), 
	.A1N(n7), 
	.A0N(arith_out[5]));
   OAI2BB1X2M U25 (.Y(ALU_OUT[6]), 
	.B0(n10), 
	.A1N(n7), 
	.A0N(arith_out[6]));
   OAI2BB1X2M U26 (.Y(ALU_OUT[7]), 
	.B0(n9), 
	.A1N(n7), 
	.A0N(arith_out[7]));
   AO22XLM U27 (.Y(ALU_OUT[8]), 
	.B1(n21), 
	.B0(shift_out[8]), 
	.A1(n8), 
	.A0(arith_out[8]));
   AND2X1M U28 (.Y(ALU_OUT[9]), 
	.B(n8), 
	.A(arith_out[9]));
   AND2X1M U29 (.Y(ALU_OUT[10]), 
	.B(n8), 
	.A(arith_out[10]));
   AND2X1M U30 (.Y(ALU_OUT[11]), 
	.B(n8), 
	.A(arith_out[11]));
   AND2X1M U31 (.Y(ALU_OUT[12]), 
	.B(n8), 
	.A(arith_out[12]));
   AND2X1M U32 (.Y(ALU_OUT[13]), 
	.B(n8), 
	.A(arith_out[13]));
   AND2X1M U33 (.Y(ALU_OUT[14]), 
	.B(n8), 
	.A(arith_out[14]));
   AND2X1M U34 (.Y(ALU_OUT[15]), 
	.B(n8), 
	.A(arith_out[15]));
   AOI22X1M U35 (.Y(n14), 
	.B1(n6), 
	.B0(logic_out[2]), 
	.A1(n21), 
	.A0(shift_out[2]));
   AOI22X1M U36 (.Y(n13), 
	.B1(n6), 
	.B0(logic_out[3]), 
	.A1(n21), 
	.A0(shift_out[3]));
   AOI22X1M U37 (.Y(n12), 
	.B1(n6), 
	.B0(logic_out[4]), 
	.A1(n21), 
	.A0(shift_out[4]));
   AOI22X1M U38 (.Y(n11), 
	.B1(n6), 
	.B0(logic_out[5]), 
	.A1(n21), 
	.A0(shift_out[5]));
   AOI22X1M U39 (.Y(n10), 
	.B1(n6), 
	.B0(logic_out[6]), 
	.A1(n21), 
	.A0(shift_out[6]));
   AOI22X1M U40 (.Y(n9), 
	.B1(n6), 
	.B0(logic_out[7]), 
	.A1(n21), 
	.A0(shift_out[7]));
   NAND2X2M U41 (.Y(ALU_Valid), 
	.B(n3), 
	.A(n2));
   AOI22X1M U42 (.Y(n3), 
	.B1(n21), 
	.B0(shift_valid), 
	.A1(n4), 
	.A0(cmp_valid));
   AOI22X1M U43 (.Y(n2), 
	.B1(n7), 
	.B0(arith_valid), 
	.A1(n6), 
	.A0(logic_valid));
   DLY1X1M U44 (.Y(n28), 
	.A(test_se));
   DLY1X1M U45 (.Y(n29), 
	.A(n28));
   DLY1X1M U46 (.Y(n30), 
	.A(n28));
   DLY1X1M U47 (.Y(n31), 
	.A(n30));
   DLY1X1M U48 (.Y(n32), 
	.A(n29));
   DLY1X1M U49 (.Y(n33), 
	.A(n30));
   DLY1X1M U50 (.Y(n34), 
	.A(n29));
   decoder u0 (.alu_fun({ alu_fun[3],
		alu_fun[2] }), 
	.arith_en(arith_en), 
	.logic_en(FE_UNCONNECTED_0), 
	.cmp_en(cmp_en), 
	.shift_en(shift_en), 
	.n25(n25), 
	.n6(n6));
   arithmetic_unit_test_1 u1 (.a({ a[7],
		a[6],
		a[5],
		a[4],
		a[3],
		a[2],
		a[1],
		a[0] }), 
	.b({ b[7],
		b[6],
		b[5],
		b[4],
		b[3],
		b[2],
		b[1],
		b[0] }), 
	.alu_fun({ alu_fun[1],
		alu_fun[0] }), 
	.arith_en(arith_en), 
	.clk(ALU_CLK__L4_N1), 
	.rst(rst), 
	.arith_out({ arith_out[15],
		arith_out[14],
		arith_out[13],
		arith_out[12],
		arith_out[11],
		arith_out[10],
		arith_out[9],
		arith_out[8],
		arith_out[7],
		arith_out[6],
		arith_out[5],
		arith_out[4],
		arith_out[3],
		arith_out[2],
		arith_out[1],
		arith_out[0] }), 
	.ALU_Valid(arith_valid), 
	.test_si(test_si), 
	.test_se(n34));
   logic_unit_test_1 u2 (.a({ a[7],
		a[6],
		a[5],
		a[4],
		a[3],
		a[2],
		a[1],
		a[0] }), 
	.b({ b[7],
		b[6],
		b[5],
		b[4],
		b[3],
		b[2],
		b[1],
		b[0] }), 
	.alu_fun({ alu_fun[1],
		alu_fun[0] }), 
	.logic_en(n6), 
	.clk(clk), 
	.rst(rst), 
	.logic_out({ logic_out[7],
		logic_out[6],
		logic_out[5],
		logic_out[4],
		logic_out[3],
		logic_out[2],
		logic_out[1],
		logic_out[0] }), 
	.ALU_Valid(logic_valid), 
	.test_si(arith_out[15]), 
	.test_se(n32), 
	.n6(n6), 
	.ALU_CLK__L4_N1(ALU_CLK__L4_N1));
   cmp_unit_test_1 u3 (.a({ a[7],
		a[6],
		a[5],
		a[4],
		a[3],
		a[2],
		a[1],
		a[0] }), 
	.b({ b[7],
		b[6],
		b[5],
		b[4],
		b[3],
		b[2],
		b[1],
		b[0] }), 
	.alu_fun({ alu_fun[1],
		alu_fun[0] }), 
	.cmp_en(cmp_en), 
	.clk(clk), 
	.rst(rst), 
	.cmp_out({ cmp_out[1],
		cmp_out[0] }), 
	.ALU_Valid(cmp_valid), 
	.test_si(logic_out[7]), 
	.test_se(n31));
   shift_unit_test_1 u4 (.a({ a[7],
		a[6],
		a[5],
		a[4],
		a[3],
		a[2],
		a[1],
		a[0] }), 
	.b({ b[7],
		b[6],
		b[5],
		b[4],
		b[3],
		b[2],
		b[1],
		b[0] }), 
	.alu_fun({ alu_fun[1],
		alu_fun[0] }), 
	.shift_en(shift_en), 
	.clk(clk), 
	.rst(rst), 
	.shift_out({ shift_out[8],
		shift_out[7],
		shift_out[6],
		shift_out[5],
		shift_out[4],
		shift_out[3],
		shift_out[2],
		shift_out[1],
		shift_out[0] }), 
	.ALU_Valid(shift_valid), 
	.test_si(cmp_out[1]), 
	.test_se(n33), 
	.ALU_CLK__L4_N1(ALU_CLK__L4_N1));
endmodule

module Data_Sync_test_1 (
	Unsync_bus, 
	bus_enable, 
	clk, 
	rst, 
	sync_bus, 
	enable_pulse, 
	test_si, 
	test_se);
   input [7:0] Unsync_bus;
   input bus_enable;
   input clk;
   input rst;
   output [7:0] sync_bus;
   output enable_pulse;
   input test_si;
   input test_se;

   // Internal wires
   wire pulse_flop;
   wire n1;
   wire n3;
   wire n5;
   wire n7;
   wire n9;
   wire n11;
   wire n13;
   wire n15;
   wire n17;
   wire n36;
   wire n39;
   wire n40;
   wire n41;
   wire n42;
   wire n43;
   wire n44;
   wire n45;
   wire n46;
   wire n47;
   wire n48;
   wire n49;
   wire n50;
   wire n51;
   wire n52;
   wire n53;
   wire n54;
   wire n55;
   wire [7:0] meta_flop;

   SDFFRQX2M pulse_flop_reg (.SI(meta_flop[7]), 
	.SE(n46), 
	.RN(rst), 
	.Q(pulse_flop), 
	.D(meta_flop[7]), 
	.CK(clk));
   SDFFRQX2M \meta_flop_reg[7]  (.SI(meta_flop[6]), 
	.SE(n45), 
	.RN(rst), 
	.Q(meta_flop[7]), 
	.D(meta_flop[6]), 
	.CK(clk));
   SDFFRQX2M \sync_bus_reg[7]  (.SI(sync_bus[6]), 
	.SE(n44), 
	.RN(rst), 
	.Q(sync_bus[7]), 
	.D(n17), 
	.CK(clk));
   SDFFRQX2M \sync_bus_reg[5]  (.SI(sync_bus[4]), 
	.SE(n43), 
	.RN(rst), 
	.Q(sync_bus[5]), 
	.D(n13), 
	.CK(clk));
   SDFFRQX2M \sync_bus_reg[3]  (.SI(sync_bus[2]), 
	.SE(n42), 
	.RN(rst), 
	.Q(sync_bus[3]), 
	.D(n9), 
	.CK(clk));
   SDFFRQX2M \sync_bus_reg[1]  (.SI(sync_bus[0]), 
	.SE(n41), 
	.RN(rst), 
	.Q(sync_bus[1]), 
	.D(n5), 
	.CK(clk));
   SDFFRQX2M \meta_flop_reg[0]  (.SI(enable_pulse), 
	.SE(n53), 
	.RN(rst), 
	.Q(meta_flop[0]), 
	.D(bus_enable), 
	.CK(clk));
   SDFFRQX2M \meta_flop_reg[1]  (.SI(meta_flop[0]), 
	.SE(n52), 
	.RN(rst), 
	.Q(meta_flop[1]), 
	.D(meta_flop[0]), 
	.CK(clk));
   SDFFRQX2M \meta_flop_reg[2]  (.SI(meta_flop[1]), 
	.SE(n44), 
	.RN(rst), 
	.Q(meta_flop[2]), 
	.D(meta_flop[1]), 
	.CK(clk));
   SDFFRQX2M \meta_flop_reg[3]  (.SI(meta_flop[2]), 
	.SE(n43), 
	.RN(rst), 
	.Q(meta_flop[3]), 
	.D(meta_flop[2]), 
	.CK(clk));
   SDFFRQX2M \meta_flop_reg[4]  (.SI(meta_flop[3]), 
	.SE(n42), 
	.RN(rst), 
	.Q(meta_flop[4]), 
	.D(meta_flop[3]), 
	.CK(clk));
   SDFFRQX2M \meta_flop_reg[5]  (.SI(meta_flop[4]), 
	.SE(n41), 
	.RN(rst), 
	.Q(meta_flop[5]), 
	.D(meta_flop[4]), 
	.CK(clk));
   SDFFRQX2M \meta_flop_reg[6]  (.SI(meta_flop[5]), 
	.SE(n46), 
	.RN(rst), 
	.Q(meta_flop[6]), 
	.D(meta_flop[5]), 
	.CK(clk));
   SDFFRQX2M \sync_bus_reg[0]  (.SI(pulse_flop), 
	.SE(n45), 
	.RN(rst), 
	.Q(sync_bus[0]), 
	.D(n3), 
	.CK(clk));
   CLKINVX2M U7 (.Y(n36), 
	.A(n1));
   NAND2BX2M U12 (.Y(n1), 
	.B(meta_flop[7]), 
	.AN(pulse_flop));
   AO22X1M U31 (.Y(n7), 
	.B1(n1), 
	.B0(sync_bus[2]), 
	.A1(n36), 
	.A0(Unsync_bus[2]));
   AO22X1M U32 (.Y(n11), 
	.B1(n1), 
	.B0(sync_bus[4]), 
	.A1(n36), 
	.A0(Unsync_bus[4]));
   AO22X1M U33 (.Y(n15), 
	.B1(n1), 
	.B0(sync_bus[6]), 
	.A1(n36), 
	.A0(Unsync_bus[6]));
   AO22X1M U34 (.Y(n3), 
	.B1(n1), 
	.B0(sync_bus[0]), 
	.A1(n36), 
	.A0(Unsync_bus[0]));
   AO22X1M U35 (.Y(n13), 
	.B1(n1), 
	.B0(sync_bus[5]), 
	.A1(n36), 
	.A0(Unsync_bus[5]));
   AO22X1M U36 (.Y(n5), 
	.B1(n1), 
	.B0(sync_bus[1]), 
	.A1(n36), 
	.A0(Unsync_bus[1]));
   AO22X1M U37 (.Y(n9), 
	.B1(n1), 
	.B0(sync_bus[3]), 
	.A1(n36), 
	.A0(Unsync_bus[3]));
   AO22X1M U38 (.Y(n17), 
	.B1(n1), 
	.B0(sync_bus[7]), 
	.A1(n36), 
	.A0(Unsync_bus[7]));
   DLY1X1M U39 (.Y(n39), 
	.A(n49));
   DLY1X1M U40 (.Y(n40), 
	.A(n39));
   DLY1X1M U41 (.Y(n41), 
	.A(n47));
   DLY1X1M U42 (.Y(n42), 
	.A(n48));
   DLY1X1M U43 (.Y(n43), 
	.A(n54));
   DLY1X1M U44 (.Y(n44), 
	.A(n55));
   DLY1X1M U45 (.Y(n45), 
	.A(n52));
   DLY1X1M U46 (.Y(n46), 
	.A(n53));
   DLY1X1M U48 (.Y(n48), 
	.A(n50));
   DLY1X1M U49 (.Y(n49), 
	.A(test_se));
   DLY1X1M U50 (.Y(n50), 
	.A(n39));
   DLY1X1M U51 (.Y(n51), 
	.A(n49));
   DLY1X1M U52 (.Y(n52), 
	.A(n51));
   DLY1X1M U53 (.Y(n53), 
	.A(n50));
   DLY1X1M U54 (.Y(n54), 
	.A(n51));
   SDFFRQX4M enable_pulse_reg (.SI(test_si), 
	.SE(n55), 
	.RN(rst), 
	.Q(enable_pulse), 
	.D(n36), 
	.CK(clk));
   SDFFRQX4M \sync_bus_reg[2]  (.SI(sync_bus[1]), 
	.SE(n54), 
	.RN(rst), 
	.Q(sync_bus[2]), 
	.D(n7), 
	.CK(clk));
   SDFFRQX4M \sync_bus_reg[4]  (.SI(sync_bus[3]), 
	.SE(n48), 
	.RN(rst), 
	.Q(sync_bus[4]), 
	.D(n11), 
	.CK(clk));
   SDFFRQX4M \sync_bus_reg[6]  (.SI(sync_bus[5]), 
	.SE(n47), 
	.RN(rst), 
	.Q(sync_bus[6]), 
	.D(n15), 
	.CK(clk));
   BUFX2M U3 (.Y(n47), 
	.A(n40));
   BUFX2M U4 (.Y(n55), 
	.A(n40));
endmodule

module Pulse_Generator_test_1 (
	bus_enable, 
	clk, 
	rst, 
	enable_pulse, 
	test_si, 
	test_so, 
	test_se);
   input bus_enable;
   input clk;
   input rst;
   output enable_pulse;
   input test_si;
   output test_so;
   input test_se;

   // Internal wires
   wire n3;
   wire [1:0] pulse_flop;

   assign test_so = pulse_flop[1] ;

   SDFFRQX2M \pulse_flop_reg[1]  (.SI(pulse_flop[0]), 
	.SE(n3), 
	.RN(rst), 
	.Q(pulse_flop[1]), 
	.D(pulse_flop[0]), 
	.CK(clk));
   SDFFRQX2M \pulse_flop_reg[0]  (.SI(test_si), 
	.SE(n3), 
	.RN(rst), 
	.Q(pulse_flop[0]), 
	.D(bus_enable), 
	.CK(clk));
   NOR2BX2M U5 (.Y(enable_pulse), 
	.B(pulse_flop[1]), 
	.AN(pulse_flop[0]));
   DLY1X1M U6 (.Y(n3), 
	.A(test_se));
endmodule

module System_Controller_test_1 (
	clk, 
	rst, 
	P_data_sync, 
	data_valid_sync, 
	RD_Data, 
	RD_Valid, 
	WR_en, 
	RD_en, 
	ADDR, 
	WR_Data_regfile, 
	ALU_OUT, 
	ALU_Valid, 
	ALU_FUNC, 
	CLK_en, 
	W_full, 
	WR_DATA_fifo, 
	W_inc, 
	test_si, 
	test_so, 
	test_se, 
	FE_OFN1_RST_Domain_1_M);
   input clk;
   input rst;
   input [7:0] P_data_sync;
   input data_valid_sync;
   input [7:0] RD_Data;
   input RD_Valid;
   output WR_en;
   output RD_en;
   output [3:0] ADDR;
   output [7:0] WR_Data_regfile;
   input [15:0] ALU_OUT;
   input ALU_Valid;
   output [3:0] ALU_FUNC;
   output CLK_en;
   input W_full;
   output [7:0] WR_DATA_fifo;
   output W_inc;
   input test_si;
   output test_so;
   input test_se;
   input FE_OFN1_RST_Domain_1_M;

   // Internal wires
   wire n116;
   wire n118;
   wire n2;
   wire n3;
   wire n4;
   wire n5;
   wire n7;
   wire n8;
   wire n9;
   wire n10;
   wire n11;
   wire n12;
   wire n13;
   wire n15;
   wire n16;
   wire n17;
   wire n19;
   wire n20;
   wire n22;
   wire n23;
   wire n24;
   wire n26;
   wire n27;
   wire n28;
   wire n29;
   wire n31;
   wire n33;
   wire n34;
   wire n35;
   wire n38;
   wire n40;
   wire n41;
   wire n42;
   wire n44;
   wire n45;
   wire n46;
   wire n53;
   wire n59;
   wire n60;
   wire n61;
   wire n62;
   wire n63;
   wire n64;
   wire n65;
   wire n66;
   wire n67;
   wire n68;
   wire n69;
   wire n70;
   wire n71;
   wire n72;
   wire n74;
   wire n75;
   wire n76;
   wire n83;
   wire n85;
   wire n87;
   wire n89;
   wire n98;
   wire n99;
   wire n100;
   wire n101;
   wire n1;
   wire n30;
   wire n32;
   wire n36;
   wire n37;
   wire n39;
   wire n54;
   wire n55;
   wire n56;
   wire n57;
   wire n58;
   wire n73;
   wire n77;
   wire n78;
   wire n79;
   wire n80;
   wire n81;
   wire n102;
   wire n103;
   wire n104;
   wire n105;
   wire n106;
   wire n107;
   wire n108;
   wire n109;
   wire n110;
   wire n111;
   wire n112;
   wire n113;
   wire n114;
   wire n115;
   wire n121;
   wire n122;
   wire n123;
   wire n125;
   wire n126;
   wire n127;
   wire n128;
   wire n129;
   wire n130;
   wire n131;
   wire n132;
   wire n133;
   wire n134;
   wire n135;
   wire n136;
   wire [3:0] store_address;
   wire [3:0] current_state;
   wire [3:0] next_state;

   OAI221X1M U17 (.Y(n19), 
	.C0(n34), 
	.B1(n33), 
	.B0(data_valid_sync), 
	.A1(n54), 
	.A0(n7));
   OAI22X1M U76 (.Y(ALU_FUNC[3]), 
	.B1(n71), 
	.B0(n103), 
	.A1(n77), 
	.A0(n112));
   OAI22X1M U78 (.Y(ALU_FUNC[2]), 
	.B1(n71), 
	.B0(n102), 
	.A1(n77), 
	.A0(n113));
   OAI22X1M U96 (.Y(ADDR[3]), 
	.B1(n106), 
	.B0(n76), 
	.A1(n33), 
	.A0(n112));
   OAI22X1M U102 (.Y(ADDR[1]), 
	.B1(n108), 
	.B0(n76), 
	.A1(n114), 
	.A0(n33));
   SDFFRX1M \store_func_reg[1]  (.SI(n123), 
	.SE(n133), 
	.RN(FE_OFN1_RST_Domain_1_M), 
	.QN(n81), 
	.Q(n122), 
	.D(n98), 
	.CK(clk));
   SDFFRX1M \store_func_reg[0]  (.SI(store_address[3]), 
	.SE(n134), 
	.RN(FE_OFN1_RST_Domain_1_M), 
	.QN(n104), 
	.Q(n123), 
	.D(n101), 
	.CK(clk));
   SDFFRQX2M \store_address_reg[1]  (.SI(store_address[0]), 
	.SE(n134), 
	.RN(rst), 
	.Q(store_address[1]), 
	.D(n83), 
	.CK(clk));
   SDFFRX1M \store_func_reg[2]  (.SI(n122), 
	.SE(n135), 
	.RN(FE_OFN1_RST_Domain_1_M), 
	.QN(n102), 
	.Q(n121), 
	.D(n99), 
	.CK(clk));
   SDFFRX1M \store_func_reg[3]  (.SI(n121), 
	.SE(n132), 
	.RN(FE_OFN1_RST_Domain_1_M), 
	.QN(n103), 
	.Q(test_so), 
	.D(n100), 
	.CK(clk));
   SDFFRQX2M \store_address_reg[0]  (.SI(current_state[3]), 
	.SE(n135), 
	.RN(FE_OFN1_RST_Domain_1_M), 
	.Q(store_address[0]), 
	.D(n89), 
	.CK(clk));
   SDFFRQX2M \store_address_reg[3]  (.SI(store_address[2]), 
	.SE(n128), 
	.RN(rst), 
	.Q(store_address[3]), 
	.D(n87), 
	.CK(clk));
   SDFFRQX2M \store_address_reg[2]  (.SI(store_address[1]), 
	.SE(n127), 
	.RN(rst), 
	.Q(store_address[2]), 
	.D(n85), 
	.CK(clk));
   SDFFRQX2M \current_state_reg[1]  (.SI(current_state[0]), 
	.SE(n132), 
	.RN(FE_OFN1_RST_Domain_1_M), 
	.Q(current_state[1]), 
	.D(next_state[1]), 
	.CK(clk));
   AND2X2M U3 (.Y(n1), 
	.B(n39), 
	.A(n37));
   AND4X1M U5 (.Y(n5), 
	.D(n44), 
	.C(data_valid_sync), 
	.B(P_data_sync[2]), 
	.A(P_data_sync[6]));
   NOR2X2M U6 (.Y(n75), 
	.B(current_state[3]), 
	.A(n80));
   NAND3X2M U7 (.Y(n2), 
	.C(current_state[2]), 
	.B(current_state[0]), 
	.A(n75));
   NAND3X2M U8 (.Y(n9), 
	.C(current_state[2]), 
	.B(current_state[0]), 
	.A(n11));
   CLKBUFX2M U12 (.Y(ADDR[2]), 
	.A(n116));
   OAI22X1M U13 (.Y(n116), 
	.B1(n107), 
	.B0(n76), 
	.A1(n33), 
	.A0(n113));
   CLKNAND2X2M U14 (.Y(ADDR[0]), 
	.B(n1), 
	.A(n20));
   OA22X2M U15 (.Y(n118), 
	.B1(n71), 
	.B0(n104), 
	.A1(n77), 
	.A0(n115));
   CLKINVX1M U16 (.Y(ALU_FUNC[0]), 
	.A(n118));
   CLKINVX1M U18 (.Y(n30), 
	.A(n33));
   CLKINVX1M U19 (.Y(n32), 
	.A(n115));
   CLKINVX1M U20 (.Y(n36), 
	.A(n76));
   CLKNAND2X2M U21 (.Y(n37), 
	.B(n32), 
	.A(n30));
   CLKNAND2X2M U22 (.Y(n39), 
	.B(n36), 
	.A(store_address[0]));
   OAI22X1M U24 (.Y(ALU_FUNC[1]), 
	.B1(n71), 
	.B0(n81), 
	.A1(n77), 
	.A0(n114));
   NOR2X2M U25 (.Y(WR_en), 
	.B(n109), 
	.A(n61));
   NOR2X2M U26 (.Y(RD_en), 
	.B(n109), 
	.A(n33));
   NOR2X2M U27 (.Y(n74), 
	.B(current_state[2]), 
	.A(n73));
   OAI21X2M U29 (.Y(n13), 
	.B0(n20), 
	.A1(n2), 
	.A0(data_valid_sync));
   CLKINVX2M U30 (.Y(n77), 
	.A(n53));
   NOR2BX2M U31 (.Y(n76), 
	.B(n79), 
	.AN(n42));
   INVX2M U32 (.Y(n79), 
	.A(n62));
   INVX2M U33 (.Y(n54), 
	.A(W_full));
   CLKINVX2M U34 (.Y(n56), 
	.A(n46));
   AOI21X2M U36 (.Y(n53), 
	.B0(n109), 
	.A1(n27), 
	.A0(n2));
   CLKNAND2X2M U37 (.Y(n33), 
	.B(n74), 
	.A(n75));
   NAND2X2M U38 (.Y(n42), 
	.B(n74), 
	.A(n11));
   NAND2X2M U39 (.Y(n62), 
	.B(n45), 
	.A(n75));
   NAND4BX1M U40 (.Y(next_state[0]), 
	.D(n24), 
	.C(n23), 
	.B(n8), 
	.AN(n22));
   AOI21BX2M U41 (.Y(n23), 
	.B0N(n2), 
	.A1(n109), 
	.A0(n41));
   AOI211X2M U42 (.Y(n24), 
	.C0(n26), 
	.B0(n19), 
	.A1(n55), 
	.A0(n58));
   NAND2X2M U43 (.Y(n41), 
	.B(n42), 
	.A(n9));
   AND3X2M U44 (.Y(n3), 
	.C(n15), 
	.B(n27), 
	.A(n40));
   NAND3X2M U45 (.Y(CLK_en), 
	.C(n3), 
	.B(n2), 
	.A(n7));
   INVX2M U46 (.Y(n55), 
	.A(ALU_Valid));
   NAND4X2M U47 (.Y(next_state[1]), 
	.D(n17), 
	.C(n16), 
	.B(n15), 
	.A(n56));
   AOI211X2M U48 (.Y(n17), 
	.C0(n13), 
	.B0(n19), 
	.A1(n109), 
	.A0(n79));
   AOI2BB2XLM U49 (.Y(n16), 
	.B1(n58), 
	.B0(ALU_Valid), 
	.A1N(n109), 
	.A0N(n9));
   OAI22X1M U50 (.Y(n101), 
	.B1(n77), 
	.B0(n115), 
	.A1(n104), 
	.A0(n53));
   OAI22X1M U51 (.Y(n100), 
	.B1(n77), 
	.B0(n112), 
	.A1(n103), 
	.A0(n53));
   OAI22X1M U52 (.Y(n99), 
	.B1(n77), 
	.B0(n113), 
	.A1(n102), 
	.A0(n53));
   OAI22X1M U53 (.Y(n98), 
	.B1(n77), 
	.B0(n114), 
	.A1(n81), 
	.A0(n53));
   NOR2X2M U55 (.Y(n59), 
	.B(W_full), 
	.A(n7));
   NOR2X2M U57 (.Y(n22), 
	.B(W_full), 
	.A(n15));
   OR3X2M U58 (.Y(W_inc), 
	.C(n22), 
	.B(n60), 
	.A(n59));
   AND3X2M U59 (.Y(n61), 
	.C(n62), 
	.B(n9), 
	.A(n20));
   NOR2X2M U60 (.Y(n46), 
	.B(n109), 
	.A(n42));
   NOR4X1M U61 (.Y(n29), 
	.D(n78), 
	.C(n38), 
	.B(n114), 
	.A(n110));
   NOR2X2M U62 (.Y(WR_Data_regfile[0]), 
	.B(n115), 
	.A(n61));
   NOR2X2M U63 (.Y(WR_Data_regfile[1]), 
	.B(n114), 
	.A(n61));
   NOR2X2M U64 (.Y(WR_Data_regfile[2]), 
	.B(n113), 
	.A(n61));
   NOR2X2M U65 (.Y(WR_Data_regfile[3]), 
	.B(n112), 
	.A(n61));
   NOR2X2M U66 (.Y(WR_Data_regfile[4]), 
	.B(n111), 
	.A(n61));
   NOR2X2M U67 (.Y(WR_Data_regfile[5]), 
	.B(n110), 
	.A(n61));
   OAI22X1M U68 (.Y(n89), 
	.B1(n56), 
	.B0(n115), 
	.A1(n105), 
	.A0(n46));
   OAI22X1M U69 (.Y(n83), 
	.B1(n56), 
	.B0(n114), 
	.A1(n108), 
	.A0(n46));
   OAI22X1M U70 (.Y(n85), 
	.B1(n56), 
	.B0(n113), 
	.A1(n107), 
	.A0(n46));
   OAI22X1M U71 (.Y(n87), 
	.B1(n56), 
	.B0(n112), 
	.A1(n106), 
	.A0(n46));
   INVX2M U72 (.Y(n78), 
	.A(n45));
   NAND3X2M U73 (.Y(n8), 
	.C(n5), 
	.B(n111), 
	.A(n115));
   INVX2M U74 (.Y(n58), 
	.A(n40));
   NOR2X2M U79 (.Y(n11), 
	.B(current_state[3]), 
	.A(current_state[1]));
   OAI2BB1X2M U80 (.Y(WR_DATA_fifo[0]), 
	.B0(n70), 
	.A1N(n22), 
	.A0N(ALU_OUT[0]));
   AOI22X1M U81 (.Y(n70), 
	.B1(n60), 
	.B0(RD_Data[0]), 
	.A1(n59), 
	.A0(ALU_OUT[8]));
   OAI2BB1X2M U82 (.Y(WR_DATA_fifo[1]), 
	.B0(n69), 
	.A1N(n22), 
	.A0N(ALU_OUT[1]));
   AOI22X1M U83 (.Y(n69), 
	.B1(n60), 
	.B0(RD_Data[1]), 
	.A1(n59), 
	.A0(ALU_OUT[9]));
   OAI2BB1X2M U84 (.Y(WR_DATA_fifo[2]), 
	.B0(n68), 
	.A1N(n22), 
	.A0N(ALU_OUT[2]));
   AOI22X1M U85 (.Y(n68), 
	.B1(n60), 
	.B0(RD_Data[2]), 
	.A1(n59), 
	.A0(ALU_OUT[10]));
   OAI2BB1X2M U86 (.Y(WR_DATA_fifo[3]), 
	.B0(n67), 
	.A1N(n22), 
	.A0N(ALU_OUT[3]));
   AOI22X1M U87 (.Y(n67), 
	.B1(n60), 
	.B0(RD_Data[3]), 
	.A1(n59), 
	.A0(ALU_OUT[11]));
   OAI2BB1X2M U88 (.Y(WR_DATA_fifo[4]), 
	.B0(n66), 
	.A1N(n22), 
	.A0N(ALU_OUT[4]));
   AOI22X1M U89 (.Y(n66), 
	.B1(n60), 
	.B0(RD_Data[4]), 
	.A1(n59), 
	.A0(ALU_OUT[12]));
   OAI2BB1X2M U90 (.Y(WR_DATA_fifo[5]), 
	.B0(n65), 
	.A1N(n22), 
	.A0N(ALU_OUT[5]));
   AOI22X1M U91 (.Y(n65), 
	.B1(n60), 
	.B0(RD_Data[5]), 
	.A1(n59), 
	.A0(ALU_OUT[13]));
   OAI2BB1X2M U92 (.Y(WR_DATA_fifo[6]), 
	.B0(n64), 
	.A1N(n22), 
	.A0N(ALU_OUT[6]));
   AOI22X1M U93 (.Y(n64), 
	.B1(n60), 
	.B0(RD_Data[6]), 
	.A1(n59), 
	.A0(ALU_OUT[14]));
   OAI2BB1X2M U94 (.Y(WR_DATA_fifo[7]), 
	.B0(n63), 
	.A1N(n22), 
	.A0N(ALU_OUT[7]));
   AOI22X1M U95 (.Y(n63), 
	.B1(n60), 
	.B0(RD_Data[7]), 
	.A1(n59), 
	.A0(ALU_OUT[15]));
   INVX2M U97 (.Y(n80), 
	.A(current_state[1]));
   CLKINVX2M U99 (.Y(n115), 
	.A(P_data_sync[0]));
   NAND3X2M U100 (.Y(n7), 
	.C(current_state[1]), 
	.B(current_state[3]), 
	.A(n74));
   CLKINVX2M U103 (.Y(n113), 
	.A(P_data_sync[2]));
   NAND3X2M U105 (.Y(n40), 
	.C(n74), 
	.B(n80), 
	.A(current_state[3]));
   CLKNAND2X2M U106 (.Y(n71), 
	.B(n72), 
	.A(CLK_en));
   NAND4X2M U107 (.Y(n72), 
	.D(n7), 
	.C(n40), 
	.B(n15), 
	.A(data_valid_sync));
   NAND3X2M U108 (.Y(n27), 
	.C(current_state[3]), 
	.B(n80), 
	.A(n45));
   CLKINVX2M U109 (.Y(n109), 
	.A(data_valid_sync));
   INVX2M U110 (.Y(n107), 
	.A(store_address[2]));
   CLKINVX2M U111 (.Y(n114), 
	.A(P_data_sync[1]));
   CLKINVX2M U112 (.Y(n112), 
	.A(P_data_sync[3]));
   INVX2M U113 (.Y(n106), 
	.A(store_address[3]));
   INVX2M U114 (.Y(n105), 
	.A(store_address[0]));
   INVX2M U115 (.Y(n108), 
	.A(store_address[1]));
   NAND2X2M U117 (.Y(n12), 
	.B(n54), 
	.A(RD_Valid));
   NAND4X2M U118 (.Y(n34), 
	.D(n35), 
	.C(n29), 
	.B(P_data_sync[0]), 
	.A(P_data_sync[4]));
   NOR3X2M U119 (.Y(n35), 
	.C(P_data_sync[2]), 
	.B(P_data_sync[6]), 
	.A(n109));
   AOI31X2M U132 (.Y(n26), 
	.B0(n109), 
	.A2(n28), 
	.A1(n27), 
	.A0(n20));
   NAND3X2M U133 (.Y(n28), 
	.C(n31), 
	.B(n115), 
	.A(n29));
   NOR2BX2M U135 (.Y(WR_Data_regfile[6]), 
	.B(n61), 
	.AN(P_data_sync[6]));
   NOR2BX2M U136 (.Y(WR_Data_regfile[7]), 
	.B(n61), 
	.AN(P_data_sync[7]));
   NOR4X1M U137 (.Y(n44), 
	.D(n38), 
	.C(n78), 
	.B(P_data_sync[1]), 
	.A(P_data_sync[5]));
   OAI211X2M U138 (.Y(next_state[3]), 
	.C0(n4), 
	.B0(n3), 
	.A1(n2), 
	.A0(n109));
   AOI32X1M U139 (.Y(n4), 
	.B1(n57), 
	.B0(W_full), 
	.A2(P_data_sync[4]), 
	.A1(n5), 
	.A0(P_data_sync[0]));
   INVX2M U140 (.Y(n57), 
	.A(n7));
   NAND4BX1M U141 (.Y(next_state[2]), 
	.D(n10), 
	.C(n9), 
	.B(n8), 
	.AN(RD_en));
   AOI31X2M U142 (.Y(n10), 
	.B0(n13), 
	.A2(current_state[2]), 
	.A1(n12), 
	.A0(n11));
   NAND3X2M U143 (.Y(n38), 
	.C(P_data_sync[7]), 
	.B(n11), 
	.A(P_data_sync[3]));
   INVX2M U144 (.Y(n111), 
	.A(P_data_sync[4]));
   INVX2M U145 (.Y(n110), 
	.A(P_data_sync[5]));
   DLY1X1M U146 (.Y(n125), 
	.A(n129));
   DLY1X1M U147 (.Y(n126), 
	.A(n129));
   DLY1X1M U148 (.Y(n127), 
	.A(n130));
   DLY1X1M U149 (.Y(n128), 
	.A(n126));
   DLY1X1M U150 (.Y(n129), 
	.A(test_se));
   DLY1X1M U151 (.Y(n130), 
	.A(n125));
   DLY1X1M U152 (.Y(n131), 
	.A(n125));
   DLY1X1M U153 (.Y(n132), 
	.A(n126));
   DLY1X1M U154 (.Y(n133), 
	.A(n131));
   DLY1X1M U155 (.Y(n134), 
	.A(n130));
   DLY1X1M U156 (.Y(n135), 
	.A(n131));
   INVXLM U157 (.Y(n136), 
	.A(n80));
   SDFFRQX4M \current_state_reg[2]  (.SI(current_state[1]), 
	.SE(n127), 
	.RN(FE_OFN1_RST_Domain_1_M), 
	.Q(current_state[2]), 
	.D(next_state[2]), 
	.CK(clk));
   SDFFRQX4M \current_state_reg[3]  (.SI(current_state[2]), 
	.SE(n128), 
	.RN(FE_OFN1_RST_Domain_1_M), 
	.Q(current_state[3]), 
	.D(next_state[3]), 
	.CK(clk));
   SDFFRQX4M \current_state_reg[0]  (.SI(test_si), 
	.SE(n133), 
	.RN(FE_OFN1_RST_Domain_1_M), 
	.Q(current_state[0]), 
	.D(next_state[0]), 
	.CK(clk));
   NOR3X2M U4 (.Y(n31), 
	.C(P_data_sync[4]), 
	.B(P_data_sync[6]), 
	.A(P_data_sync[2]));
   NOR4BBX2M U9 (.Y(n60), 
	.D(current_state[0]), 
	.C(n12), 
	.BN(current_state[2]), 
	.AN(n11));
   NOR2X2M U10 (.Y(n45), 
	.B(current_state[0]), 
	.A(current_state[2]));
   CLKINVX2M U11 (.Y(n73), 
	.A(current_state[0]));
   NAND3X2M U28 (.Y(n15), 
	.C(n136), 
	.B(n45), 
	.A(current_state[3]));
   NAND3X2M U98 (.Y(n20), 
	.C(current_state[2]), 
	.B(n73), 
	.A(n75));
endmodule

module FIFO_MEM_CONTROL_test_1 (
	W_data, 
	W_inc, 
	W_full, 
	W_addr, 
	R_addr, 
	W_clk, 
	R_data, 
	test_si2, 
	test_si1, 
	test_so2, 
	test_so1, 
	test_se, 
	REF_CLK_M__L8_N1, 
	REF_CLK_M__L8_N2, 
	REF_CLK_M__L8_N3, 
	REF_CLK_M__L8_N5);
   input [7:0] W_data;
   input W_inc;
   input W_full;
   input [2:0] W_addr;
   input [2:0] R_addr;
   input W_clk;
   output [7:0] R_data;
   input test_si2;
   input test_si1;
   output test_so2;
   output test_so1;
   input test_se;
   input REF_CLK_M__L8_N1;
   input REF_CLK_M__L8_N2;
   input REF_CLK_M__L8_N3;
   input REF_CLK_M__L8_N5;

   // Internal wires
   wire N10;
   wire N11;
   wire N12;
   wire \MEM[7][7] ;
   wire \MEM[7][6] ;
   wire \MEM[7][5] ;
   wire \MEM[7][4] ;
   wire \MEM[7][3] ;
   wire \MEM[7][2] ;
   wire \MEM[7][1] ;
   wire \MEM[7][0] ;
   wire \MEM[6][7] ;
   wire \MEM[6][6] ;
   wire \MEM[6][5] ;
   wire \MEM[6][4] ;
   wire \MEM[6][3] ;
   wire \MEM[6][2] ;
   wire \MEM[6][1] ;
   wire \MEM[6][0] ;
   wire \MEM[5][7] ;
   wire \MEM[5][6] ;
   wire \MEM[5][5] ;
   wire \MEM[5][4] ;
   wire \MEM[5][3] ;
   wire \MEM[5][2] ;
   wire \MEM[5][1] ;
   wire \MEM[5][0] ;
   wire \MEM[4][7] ;
   wire \MEM[4][6] ;
   wire \MEM[4][5] ;
   wire \MEM[4][4] ;
   wire \MEM[4][3] ;
   wire \MEM[4][2] ;
   wire \MEM[4][1] ;
   wire \MEM[4][0] ;
   wire \MEM[3][7] ;
   wire \MEM[3][6] ;
   wire \MEM[3][5] ;
   wire \MEM[3][4] ;
   wire \MEM[3][3] ;
   wire \MEM[3][2] ;
   wire \MEM[3][1] ;
   wire \MEM[3][0] ;
   wire \MEM[2][7] ;
   wire \MEM[2][6] ;
   wire \MEM[2][5] ;
   wire \MEM[2][4] ;
   wire \MEM[2][3] ;
   wire \MEM[2][2] ;
   wire \MEM[2][1] ;
   wire \MEM[2][0] ;
   wire \MEM[1][7] ;
   wire \MEM[1][6] ;
   wire \MEM[1][5] ;
   wire \MEM[1][4] ;
   wire \MEM[1][3] ;
   wire \MEM[1][2] ;
   wire \MEM[1][1] ;
   wire \MEM[1][0] ;
   wire \MEM[0][7] ;
   wire \MEM[0][6] ;
   wire \MEM[0][5] ;
   wire \MEM[0][4] ;
   wire \MEM[0][3] ;
   wire \MEM[0][2] ;
   wire \MEM[0][1] ;
   wire \MEM[0][0] ;
   wire n76;
   wire n80;
   wire n82;
   wire n86;
   wire n87;
   wire n88;
   wire n89;
   wire n90;
   wire n91;
   wire n92;
   wire n93;
   wire n94;
   wire n95;
   wire n96;
   wire n97;
   wire n98;
   wire n99;
   wire n100;
   wire n101;
   wire n102;
   wire n103;
   wire n104;
   wire n105;
   wire n106;
   wire n107;
   wire n108;
   wire n109;
   wire n110;
   wire n111;
   wire n112;
   wire n113;
   wire n114;
   wire n115;
   wire n116;
   wire n117;
   wire n118;
   wire n119;
   wire n120;
   wire n121;
   wire n122;
   wire n123;
   wire n124;
   wire n125;
   wire n126;
   wire n127;
   wire n128;
   wire n129;
   wire n130;
   wire n131;
   wire n132;
   wire n133;
   wire n134;
   wire n135;
   wire n136;
   wire n137;
   wire n138;
   wire n139;
   wire n140;
   wire n141;
   wire n142;
   wire n143;
   wire n144;
   wire n145;
   wire n146;
   wire n147;
   wire n148;
   wire n149;
   wire n65;
   wire n66;
   wire n67;
   wire n68;
   wire n69;
   wire n70;
   wire n71;
   wire n72;
   wire n73;
   wire n74;
   wire n75;
   wire n77;
   wire n78;
   wire n79;
   wire n81;
   wire n83;
   wire n84;
   wire n85;
   wire n150;
   wire n151;
   wire n152;
   wire n153;
   wire n154;
   wire n155;
   wire n156;
   wire n157;
   wire n158;
   wire n159;
   wire n160;
   wire n161;
   wire n162;
   wire n163;
   wire n164;
   wire n165;
   wire n166;
   wire n167;
   wire n168;
   wire n169;
   wire n170;
   wire n171;
   wire n172;
   wire n173;
   wire n174;
   wire n175;
   wire n176;
   wire n177;
   wire n178;
   wire n179;
   wire n188;
   wire n190;
   wire n192;
   wire n194;
   wire n196;
   wire n198;
   wire n200;
   wire n202;
   wire n203;
   wire n204;
   wire n205;
   wire n206;
   wire n207;
   wire n208;
   wire n209;
   wire n210;
   wire n211;
   wire n212;
   wire n218;
   wire n219;
   wire n220;
   wire n221;
   wire n222;
   wire n223;
   wire n224;
   wire n225;
   wire n226;
   wire n227;
   wire n228;
   wire n229;
   wire n230;
   wire n231;
   wire n232;
   wire n233;
   wire n234;
   wire n235;
   wire n236;
   wire n237;
   wire n238;
   wire n239;
   wire n240;
   wire n241;
   wire n242;
   wire n243;
   wire n244;
   wire n245;
   wire n246;
   wire n247;
   wire n248;
   wire n249;
   wire n250;
   wire n251;
   wire n252;
   wire n253;
   wire n254;
   wire n255;
   wire n256;
   wire n257;
   wire n258;
   wire n259;
   wire n260;
   wire n261;
   wire n262;
   wire n263;
   wire n264;
   wire n265;
   wire n266;
   wire n267;
   wire n268;
   wire n269;
   wire n270;
   wire n271;
   wire n272;
   wire n273;
   wire n274;
   wire n275;
   wire n276;
   wire n277;
   wire n278;
   wire n279;
   wire n1;

   assign N10 = R_addr[0] ;
   assign N11 = R_addr[1] ;
   assign N12 = R_addr[2] ;
   assign test_so2 = \MEM[7][7]  ;

   SDFFQX2M \MEM_reg[5][7]  (.SI(\MEM[5][6] ), 
	.SE(n244), 
	.Q(\MEM[5][7] ), 
	.D(n133), 
	.CK(REF_CLK_M__L8_N1));
   SDFFQX2M \MEM_reg[5][6]  (.SI(\MEM[5][5] ), 
	.SE(n244), 
	.Q(\MEM[5][6] ), 
	.D(n132), 
	.CK(REF_CLK_M__L8_N1));
   SDFFQX2M \MEM_reg[5][5]  (.SI(\MEM[5][4] ), 
	.SE(n279), 
	.Q(\MEM[5][5] ), 
	.D(n131), 
	.CK(REF_CLK_M__L8_N1));
   SDFFQX2M \MEM_reg[5][4]  (.SI(\MEM[5][3] ), 
	.SE(n243), 
	.Q(\MEM[5][4] ), 
	.D(n130), 
	.CK(REF_CLK_M__L8_N1));
   SDFFQX2M \MEM_reg[5][3]  (.SI(\MEM[5][2] ), 
	.SE(n243), 
	.Q(\MEM[5][3] ), 
	.D(n129), 
	.CK(REF_CLK_M__L8_N1));
   SDFFQX2M \MEM_reg[5][2]  (.SI(\MEM[5][1] ), 
	.SE(n278), 
	.Q(\MEM[5][2] ), 
	.D(n128), 
	.CK(W_clk));
   SDFFQX2M \MEM_reg[5][1]  (.SI(\MEM[5][0] ), 
	.SE(n242), 
	.Q(\MEM[5][1] ), 
	.D(n127), 
	.CK(W_clk));
   SDFFQX2M \MEM_reg[5][0]  (.SI(\MEM[4][7] ), 
	.SE(n242), 
	.Q(\MEM[5][0] ), 
	.D(n126), 
	.CK(W_clk));
   SDFFQX2M \MEM_reg[4][7]  (.SI(\MEM[4][6] ), 
	.SE(n277), 
	.Q(\MEM[4][7] ), 
	.D(n125), 
	.CK(REF_CLK_M__L8_N2));
   SDFFQX2M \MEM_reg[4][6]  (.SI(\MEM[4][5] ), 
	.SE(n241), 
	.Q(\MEM[4][6] ), 
	.D(n124), 
	.CK(REF_CLK_M__L8_N2));
   SDFFQX2M \MEM_reg[4][5]  (.SI(\MEM[4][4] ), 
	.SE(n241), 
	.Q(\MEM[4][5] ), 
	.D(n123), 
	.CK(REF_CLK_M__L8_N2));
   SDFFQX2M \MEM_reg[4][4]  (.SI(\MEM[4][3] ), 
	.SE(n276), 
	.Q(\MEM[4][4] ), 
	.D(n122), 
	.CK(REF_CLK_M__L8_N2));
   SDFFQX2M \MEM_reg[4][3]  (.SI(\MEM[4][2] ), 
	.SE(n240), 
	.Q(\MEM[4][3] ), 
	.D(n121), 
	.CK(REF_CLK_M__L8_N2));
   SDFFQX2M \MEM_reg[4][2]  (.SI(\MEM[4][1] ), 
	.SE(n240), 
	.Q(\MEM[4][2] ), 
	.D(n120), 
	.CK(REF_CLK_M__L8_N2));
   SDFFQX2M \MEM_reg[4][1]  (.SI(\MEM[4][0] ), 
	.SE(n275), 
	.Q(\MEM[4][1] ), 
	.D(n119), 
	.CK(REF_CLK_M__L8_N2));
   SDFFQX2M \MEM_reg[4][0]  (.SI(\MEM[3][7] ), 
	.SE(n239), 
	.Q(\MEM[4][0] ), 
	.D(n118), 
	.CK(W_clk));
   SDFFQX2M \MEM_reg[7][7]  (.SI(\MEM[7][6] ), 
	.SE(n239), 
	.Q(\MEM[7][7] ), 
	.D(n149), 
	.CK(W_clk));
   SDFFQX2M \MEM_reg[7][6]  (.SI(\MEM[7][5] ), 
	.SE(n274), 
	.Q(\MEM[7][6] ), 
	.D(n148), 
	.CK(W_clk));
   SDFFQX2M \MEM_reg[7][5]  (.SI(\MEM[7][4] ), 
	.SE(n238), 
	.Q(\MEM[7][5] ), 
	.D(n147), 
	.CK(REF_CLK_M__L8_N5));
   SDFFQX2M \MEM_reg[7][4]  (.SI(\MEM[7][3] ), 
	.SE(n238), 
	.Q(\MEM[7][4] ), 
	.D(n146), 
	.CK(REF_CLK_M__L8_N5));
   SDFFQX2M \MEM_reg[7][3]  (.SI(\MEM[7][2] ), 
	.SE(n273), 
	.Q(\MEM[7][3] ), 
	.D(n145), 
	.CK(W_clk));
   SDFFQX2M \MEM_reg[7][2]  (.SI(\MEM[7][1] ), 
	.SE(n237), 
	.Q(\MEM[7][2] ), 
	.D(n144), 
	.CK(W_clk));
   SDFFQX2M \MEM_reg[7][1]  (.SI(\MEM[7][0] ), 
	.SE(n272), 
	.Q(\MEM[7][1] ), 
	.D(n143), 
	.CK(W_clk));
   SDFFQX2M \MEM_reg[7][0]  (.SI(\MEM[6][7] ), 
	.SE(n271), 
	.Q(\MEM[7][0] ), 
	.D(n142), 
	.CK(W_clk));
   SDFFQX2M \MEM_reg[6][7]  (.SI(\MEM[6][6] ), 
	.SE(n271), 
	.Q(\MEM[6][7] ), 
	.D(n141), 
	.CK(REF_CLK_M__L8_N2));
   SDFFQX2M \MEM_reg[6][6]  (.SI(\MEM[6][5] ), 
	.SE(n237), 
	.Q(\MEM[6][6] ), 
	.D(n140), 
	.CK(REF_CLK_M__L8_N2));
   SDFFQX2M \MEM_reg[6][5]  (.SI(\MEM[6][4] ), 
	.SE(n272), 
	.Q(\MEM[6][5] ), 
	.D(n139), 
	.CK(REF_CLK_M__L8_N2));
   SDFFQX2M \MEM_reg[6][4]  (.SI(\MEM[6][3] ), 
	.SE(n236), 
	.Q(\MEM[6][4] ), 
	.D(n138), 
	.CK(REF_CLK_M__L8_N2));
   SDFFQX2M \MEM_reg[6][3]  (.SI(test_si2), 
	.SE(n236), 
	.Q(\MEM[6][3] ), 
	.D(n137), 
	.CK(REF_CLK_M__L8_N2));
   SDFFQX2M \MEM_reg[6][2]  (.SI(\MEM[6][1] ), 
	.SE(n270), 
	.Q(\MEM[6][2] ), 
	.D(n136), 
	.CK(REF_CLK_M__L8_N2));
   SDFFQX2M \MEM_reg[6][1]  (.SI(\MEM[6][0] ), 
	.SE(n235), 
	.Q(\MEM[6][1] ), 
	.D(n135), 
	.CK(REF_CLK_M__L8_N2));
   SDFFQX2M \MEM_reg[6][0]  (.SI(\MEM[5][7] ), 
	.SE(n235), 
	.Q(\MEM[6][0] ), 
	.D(n134), 
	.CK(REF_CLK_M__L8_N2));
   SDFFQX2M \MEM_reg[1][7]  (.SI(\MEM[1][6] ), 
	.SE(n269), 
	.Q(\MEM[1][7] ), 
	.D(n101), 
	.CK(W_clk));
   SDFFQX2M \MEM_reg[1][6]  (.SI(\MEM[1][5] ), 
	.SE(n234), 
	.Q(\MEM[1][6] ), 
	.D(n100), 
	.CK(REF_CLK_M__L8_N1));
   SDFFQX2M \MEM_reg[1][5]  (.SI(\MEM[1][4] ), 
	.SE(n234), 
	.Q(\MEM[1][5] ), 
	.D(n99), 
	.CK(REF_CLK_M__L8_N1));
   SDFFQX2M \MEM_reg[1][4]  (.SI(\MEM[1][3] ), 
	.SE(n268), 
	.Q(\MEM[1][4] ), 
	.D(n98), 
	.CK(REF_CLK_M__L8_N1));
   SDFFQX2M \MEM_reg[1][3]  (.SI(\MEM[1][2] ), 
	.SE(n233), 
	.Q(\MEM[1][3] ), 
	.D(n97), 
	.CK(REF_CLK_M__L8_N1));
   SDFFQX2M \MEM_reg[1][2]  (.SI(\MEM[1][1] ), 
	.SE(n233), 
	.Q(\MEM[1][2] ), 
	.D(n96), 
	.CK(REF_CLK_M__L8_N1));
   SDFFQX2M \MEM_reg[1][1]  (.SI(\MEM[1][0] ), 
	.SE(n267), 
	.Q(\MEM[1][1] ), 
	.D(n95), 
	.CK(REF_CLK_M__L8_N3));
   SDFFQX2M \MEM_reg[1][0]  (.SI(\MEM[0][7] ), 
	.SE(n232), 
	.Q(\MEM[1][0] ), 
	.D(n94), 
	.CK(REF_CLK_M__L8_N3));
   SDFFQX2M \MEM_reg[0][7]  (.SI(\MEM[0][6] ), 
	.SE(n232), 
	.Q(\MEM[0][7] ), 
	.D(n93), 
	.CK(REF_CLK_M__L8_N3));
   SDFFQX2M \MEM_reg[0][6]  (.SI(\MEM[0][5] ), 
	.SE(n266), 
	.Q(\MEM[0][6] ), 
	.D(n92), 
	.CK(REF_CLK_M__L8_N3));
   SDFFQX2M \MEM_reg[0][5]  (.SI(\MEM[0][4] ), 
	.SE(n231), 
	.Q(\MEM[0][5] ), 
	.D(n91), 
	.CK(REF_CLK_M__L8_N3));
   SDFFQX2M \MEM_reg[0][4]  (.SI(\MEM[0][3] ), 
	.SE(n231), 
	.Q(\MEM[0][4] ), 
	.D(n90), 
	.CK(REF_CLK_M__L8_N3));
   SDFFQX2M \MEM_reg[0][3]  (.SI(\MEM[0][2] ), 
	.SE(n265), 
	.Q(\MEM[0][3] ), 
	.D(n89), 
	.CK(REF_CLK_M__L8_N3));
   SDFFQX2M \MEM_reg[0][2]  (.SI(\MEM[0][1] ), 
	.SE(n230), 
	.Q(\MEM[0][2] ), 
	.D(n88), 
	.CK(W_clk));
   SDFFQX2M \MEM_reg[0][1]  (.SI(\MEM[0][0] ), 
	.SE(n230), 
	.Q(\MEM[0][1] ), 
	.D(n87), 
	.CK(W_clk));
   SDFFQX2M \MEM_reg[0][0]  (.SI(test_si1), 
	.SE(n264), 
	.Q(\MEM[0][0] ), 
	.D(n86), 
	.CK(W_clk));
   SDFFQX2M \MEM_reg[3][7]  (.SI(\MEM[3][6] ), 
	.SE(n229), 
	.Q(\MEM[3][7] ), 
	.D(n117), 
	.CK(REF_CLK_M__L8_N1));
   SDFFQX2M \MEM_reg[3][6]  (.SI(\MEM[3][5] ), 
	.SE(n229), 
	.Q(\MEM[3][6] ), 
	.D(n116), 
	.CK(REF_CLK_M__L8_N1));
   SDFFQX2M \MEM_reg[3][5]  (.SI(\MEM[3][4] ), 
	.SE(n263), 
	.Q(\MEM[3][5] ), 
	.D(n115), 
	.CK(REF_CLK_M__L8_N1));
   SDFFQX2M \MEM_reg[3][4]  (.SI(\MEM[3][3] ), 
	.SE(n228), 
	.Q(\MEM[3][4] ), 
	.D(n114), 
	.CK(REF_CLK_M__L8_N1));
   SDFFQX2M \MEM_reg[3][3]  (.SI(\MEM[3][2] ), 
	.SE(n228), 
	.Q(\MEM[3][3] ), 
	.D(n113), 
	.CK(REF_CLK_M__L8_N1));
   SDFFQX2M \MEM_reg[3][2]  (.SI(\MEM[3][1] ), 
	.SE(n262), 
	.Q(\MEM[3][2] ), 
	.D(n112), 
	.CK(REF_CLK_M__L8_N3));
   SDFFQX2M \MEM_reg[3][1]  (.SI(\MEM[3][0] ), 
	.SE(n227), 
	.Q(\MEM[3][1] ), 
	.D(n111), 
	.CK(REF_CLK_M__L8_N3));
   SDFFQX2M \MEM_reg[3][0]  (.SI(\MEM[2][7] ), 
	.SE(n227), 
	.Q(\MEM[3][0] ), 
	.D(n110), 
	.CK(REF_CLK_M__L8_N3));
   SDFFQX2M \MEM_reg[2][7]  (.SI(\MEM[2][6] ), 
	.SE(n261), 
	.Q(\MEM[2][7] ), 
	.D(n109), 
	.CK(REF_CLK_M__L8_N3));
   SDFFQX2M \MEM_reg[2][6]  (.SI(\MEM[2][5] ), 
	.SE(n226), 
	.Q(\MEM[2][6] ), 
	.D(n108), 
	.CK(REF_CLK_M__L8_N3));
   SDFFQX2M \MEM_reg[2][5]  (.SI(\MEM[2][4] ), 
	.SE(n226), 
	.Q(\MEM[2][5] ), 
	.D(n107), 
	.CK(REF_CLK_M__L8_N3));
   SDFFQX2M \MEM_reg[2][4]  (.SI(\MEM[2][3] ), 
	.SE(n260), 
	.Q(\MEM[2][4] ), 
	.D(n106), 
	.CK(REF_CLK_M__L8_N2));
   SDFFQX2M \MEM_reg[2][3]  (.SI(\MEM[2][2] ), 
	.SE(n225), 
	.Q(\MEM[2][3] ), 
	.D(n105), 
	.CK(REF_CLK_M__L8_N3));
   SDFFQX2M \MEM_reg[2][2]  (.SI(\MEM[2][1] ), 
	.SE(n225), 
	.Q(\MEM[2][2] ), 
	.D(n104), 
	.CK(REF_CLK_M__L8_N3));
   SDFFQX2M \MEM_reg[2][1]  (.SI(\MEM[2][0] ), 
	.SE(n259), 
	.Q(\MEM[2][1] ), 
	.D(n103), 
	.CK(REF_CLK_M__L8_N3));
   SDFFQX2M \MEM_reg[2][0]  (.SI(\MEM[1][7] ), 
	.SE(n258), 
	.Q(\MEM[2][0] ), 
	.D(n102), 
	.CK(W_clk));
   AND3X1M U66 (.Y(n68), 
	.C(n82), 
	.B(W_addr[0]), 
	.A(W_addr[1]));
   AND3X1M U67 (.Y(n69), 
	.C(W_addr[1]), 
	.B(n76), 
	.A(W_addr[0]));
   AOI221XLM U68 (.Y(n75), 
	.C0(n74), 
	.B1(n172), 
	.B0(\MEM[6][0] ), 
	.A1(n173), 
	.A0(\MEM[4][0] ));
   AOI221XLM U69 (.Y(n77), 
	.C0(n73), 
	.B1(n172), 
	.B0(\MEM[7][0] ), 
	.A1(n173), 
	.A0(\MEM[5][0] ));
   AOI221XLM U70 (.Y(n166), 
	.C0(n165), 
	.B1(n172), 
	.B0(\MEM[6][6] ), 
	.A1(n173), 
	.A0(\MEM[4][6] ));
   AOI221XLM U71 (.Y(n167), 
	.C0(n164), 
	.B1(n172), 
	.B0(\MEM[7][6] ), 
	.A1(n173), 
	.A0(\MEM[5][6] ));
   AOI221XLM U72 (.Y(n162), 
	.C0(n161), 
	.B1(n172), 
	.B0(\MEM[6][5] ), 
	.A1(n173), 
	.A0(\MEM[4][5] ));
   AOI221XLM U73 (.Y(n163), 
	.C0(n160), 
	.B1(n172), 
	.B0(\MEM[7][5] ), 
	.A1(n173), 
	.A0(\MEM[5][5] ));
   AOI221XLM U74 (.Y(n158), 
	.C0(n157), 
	.B1(n172), 
	.B0(\MEM[6][4] ), 
	.A1(n173), 
	.A0(\MEM[4][4] ));
   AOI221XLM U75 (.Y(n159), 
	.C0(n156), 
	.B1(n172), 
	.B0(\MEM[7][4] ), 
	.A1(n173), 
	.A0(\MEM[5][4] ));
   AOI221XLM U76 (.Y(n154), 
	.C0(n153), 
	.B1(n172), 
	.B0(\MEM[6][3] ), 
	.A1(n173), 
	.A0(\MEM[4][3] ));
   AOI221XLM U77 (.Y(n155), 
	.C0(n152), 
	.B1(n172), 
	.B0(\MEM[7][3] ), 
	.A1(n173), 
	.A0(\MEM[5][3] ));
   AOI221XLM U78 (.Y(n150), 
	.C0(n85), 
	.B1(n172), 
	.B0(test_so1), 
	.A1(n173), 
	.A0(\MEM[4][2] ));
   AOI221XLM U79 (.Y(n151), 
	.C0(n84), 
	.B1(n172), 
	.B0(\MEM[7][2] ), 
	.A1(n173), 
	.A0(\MEM[5][2] ));
   AOI221XLM U80 (.Y(n81), 
	.C0(n79), 
	.B1(n172), 
	.B0(\MEM[6][1] ), 
	.A1(n173), 
	.A0(\MEM[4][1] ));
   AOI221XLM U81 (.Y(n83), 
	.C0(n78), 
	.B1(n172), 
	.B0(\MEM[7][1] ), 
	.A1(n173), 
	.A0(\MEM[5][1] ));
   AOI221XLM U82 (.Y(n174), 
	.C0(n171), 
	.B1(n172), 
	.B0(\MEM[6][7] ), 
	.A1(n173), 
	.A0(\MEM[4][7] ));
   AOI221XLM U83 (.Y(n175), 
	.C0(n168), 
	.B1(n172), 
	.B0(\MEM[7][7] ), 
	.A1(n173), 
	.A0(\MEM[5][7] ));
   NOR2BX2M U84 (.Y(n76), 
	.B(W_addr[2]), 
	.AN(n80));
   NOR2X2M U86 (.Y(n170), 
	.B(N12), 
	.A(n177));
   NOR2X2M U87 (.Y(n173), 
	.B(N11), 
	.A(n176));
   INVX2M U88 (.Y(n212), 
	.A(W_addr[1]));
   NOR2BX2M U90 (.Y(n80), 
	.B(W_full), 
	.AN(W_inc));
   CLKINVX2M U91 (.Y(n194), 
	.A(n65));
   CLKINVX2M U93 (.Y(n202), 
	.A(n66));
   NOR2X2M U100 (.Y(n172), 
	.B(n177), 
	.A(n176));
   AND3X2M U101 (.Y(n65), 
	.C(n82), 
	.B(n212), 
	.A(n211));
   CLKINVX2M U102 (.Y(n200), 
	.A(n71));
   CLKINVX2M U104 (.Y(n198), 
	.A(n72));
   CLKINVX2M U106 (.Y(n196), 
	.A(n69));
   CLKINVX2M U108 (.Y(n192), 
	.A(n70));
   CLKINVX2M U110 (.Y(n190), 
	.A(n67));
   CLKINVX2M U112 (.Y(n188), 
	.A(n68));
   AND3X2M U116 (.Y(n66), 
	.C(n76), 
	.B(n212), 
	.A(n211));
   CLKINVX2M U117 (.Y(n178), 
	.A(n179));
   CLKINVX2M U118 (.Y(n203), 
	.A(W_data[0]));
   CLKINVX2M U119 (.Y(n204), 
	.A(W_data[1]));
   CLKINVX2M U120 (.Y(n205), 
	.A(W_data[2]));
   CLKINVX2M U121 (.Y(n206), 
	.A(W_data[3]));
   CLKINVX2M U122 (.Y(n207), 
	.A(W_data[4]));
   CLKINVX2M U123 (.Y(n208), 
	.A(W_data[5]));
   CLKINVX2M U124 (.Y(n209), 
	.A(W_data[6]));
   CLKINVX2M U125 (.Y(n210), 
	.A(W_data[7]));
   OAI2BB2X1M U126 (.Y(n94), 
	.B1(n200), 
	.B0(n203), 
	.A1N(n200), 
	.A0N(\MEM[1][0] ));
   OAI2BB2X1M U127 (.Y(n95), 
	.B1(n200), 
	.B0(n204), 
	.A1N(n200), 
	.A0N(\MEM[1][1] ));
   OAI2BB2X1M U128 (.Y(n96), 
	.B1(n200), 
	.B0(n205), 
	.A1N(n200), 
	.A0N(\MEM[1][2] ));
   OAI2BB2X1M U129 (.Y(n97), 
	.B1(n200), 
	.B0(n206), 
	.A1N(n200), 
	.A0N(\MEM[1][3] ));
   OAI2BB2X1M U130 (.Y(n98), 
	.B1(n200), 
	.B0(n207), 
	.A1N(n200), 
	.A0N(\MEM[1][4] ));
   OAI2BB2X1M U131 (.Y(n99), 
	.B1(n200), 
	.B0(n208), 
	.A1N(n200), 
	.A0N(\MEM[1][5] ));
   OAI2BB2X1M U132 (.Y(n100), 
	.B1(n200), 
	.B0(n209), 
	.A1N(n200), 
	.A0N(\MEM[1][6] ));
   OAI2BB2X1M U133 (.Y(n101), 
	.B1(n200), 
	.B0(n210), 
	.A1N(n200), 
	.A0N(\MEM[1][7] ));
   OAI2BB2X1M U134 (.Y(n102), 
	.B1(n198), 
	.B0(n203), 
	.A1N(n198), 
	.A0N(\MEM[2][0] ));
   OAI2BB2X1M U135 (.Y(n103), 
	.B1(n198), 
	.B0(n204), 
	.A1N(n198), 
	.A0N(\MEM[2][1] ));
   OAI2BB2X1M U136 (.Y(n104), 
	.B1(n198), 
	.B0(n205), 
	.A1N(n198), 
	.A0N(\MEM[2][2] ));
   OAI2BB2X1M U137 (.Y(n105), 
	.B1(n198), 
	.B0(n206), 
	.A1N(n198), 
	.A0N(\MEM[2][3] ));
   OAI2BB2X1M U138 (.Y(n106), 
	.B1(n198), 
	.B0(n207), 
	.A1N(n198), 
	.A0N(\MEM[2][4] ));
   OAI2BB2X1M U139 (.Y(n107), 
	.B1(n198), 
	.B0(n208), 
	.A1N(n198), 
	.A0N(\MEM[2][5] ));
   OAI2BB2X1M U140 (.Y(n108), 
	.B1(n198), 
	.B0(n209), 
	.A1N(n198), 
	.A0N(\MEM[2][6] ));
   OAI2BB2X1M U141 (.Y(n109), 
	.B1(n198), 
	.B0(n210), 
	.A1N(n198), 
	.A0N(\MEM[2][7] ));
   OAI2BB2X1M U142 (.Y(n110), 
	.B1(n196), 
	.B0(n203), 
	.A1N(n196), 
	.A0N(\MEM[3][0] ));
   OAI2BB2X1M U143 (.Y(n111), 
	.B1(n196), 
	.B0(n204), 
	.A1N(n196), 
	.A0N(\MEM[3][1] ));
   OAI2BB2X1M U144 (.Y(n112), 
	.B1(n196), 
	.B0(n205), 
	.A1N(n196), 
	.A0N(\MEM[3][2] ));
   OAI2BB2X1M U145 (.Y(n113), 
	.B1(n196), 
	.B0(n206), 
	.A1N(n196), 
	.A0N(\MEM[3][3] ));
   OAI2BB2X1M U146 (.Y(n114), 
	.B1(n196), 
	.B0(n207), 
	.A1N(n196), 
	.A0N(\MEM[3][4] ));
   OAI2BB2X1M U147 (.Y(n115), 
	.B1(n196), 
	.B0(n208), 
	.A1N(n196), 
	.A0N(\MEM[3][5] ));
   OAI2BB2X1M U148 (.Y(n116), 
	.B1(n196), 
	.B0(n209), 
	.A1N(n196), 
	.A0N(\MEM[3][6] ));
   OAI2BB2X1M U149 (.Y(n117), 
	.B1(n196), 
	.B0(n210), 
	.A1N(n196), 
	.A0N(\MEM[3][7] ));
   OAI2BB2X1M U150 (.Y(n118), 
	.B1(n194), 
	.B0(n203), 
	.A1N(n194), 
	.A0N(\MEM[4][0] ));
   OAI2BB2X1M U151 (.Y(n119), 
	.B1(n194), 
	.B0(n204), 
	.A1N(n194), 
	.A0N(\MEM[4][1] ));
   OAI2BB2X1M U152 (.Y(n120), 
	.B1(n194), 
	.B0(n205), 
	.A1N(n194), 
	.A0N(\MEM[4][2] ));
   OAI2BB2X1M U153 (.Y(n121), 
	.B1(n194), 
	.B0(n206), 
	.A1N(n194), 
	.A0N(\MEM[4][3] ));
   OAI2BB2X1M U154 (.Y(n122), 
	.B1(n194), 
	.B0(n207), 
	.A1N(n194), 
	.A0N(\MEM[4][4] ));
   OAI2BB2X1M U155 (.Y(n123), 
	.B1(n194), 
	.B0(n208), 
	.A1N(n194), 
	.A0N(\MEM[4][5] ));
   OAI2BB2X1M U156 (.Y(n124), 
	.B1(n194), 
	.B0(n209), 
	.A1N(n194), 
	.A0N(\MEM[4][6] ));
   OAI2BB2X1M U157 (.Y(n125), 
	.B1(n194), 
	.B0(n210), 
	.A1N(n194), 
	.A0N(\MEM[4][7] ));
   OAI2BB2X1M U158 (.Y(n126), 
	.B1(n192), 
	.B0(n203), 
	.A1N(n192), 
	.A0N(\MEM[5][0] ));
   OAI2BB2X1M U159 (.Y(n127), 
	.B1(n192), 
	.B0(n204), 
	.A1N(n192), 
	.A0N(\MEM[5][1] ));
   OAI2BB2X1M U160 (.Y(n128), 
	.B1(n192), 
	.B0(n205), 
	.A1N(n192), 
	.A0N(\MEM[5][2] ));
   OAI2BB2X1M U161 (.Y(n129), 
	.B1(n192), 
	.B0(n206), 
	.A1N(n192), 
	.A0N(\MEM[5][3] ));
   OAI2BB2X1M U162 (.Y(n130), 
	.B1(n192), 
	.B0(n207), 
	.A1N(n192), 
	.A0N(\MEM[5][4] ));
   OAI2BB2X1M U163 (.Y(n131), 
	.B1(n192), 
	.B0(n208), 
	.A1N(n192), 
	.A0N(\MEM[5][5] ));
   OAI2BB2X1M U164 (.Y(n132), 
	.B1(n192), 
	.B0(n209), 
	.A1N(n192), 
	.A0N(\MEM[5][6] ));
   OAI2BB2X1M U165 (.Y(n133), 
	.B1(n192), 
	.B0(n210), 
	.A1N(n192), 
	.A0N(\MEM[5][7] ));
   OAI2BB2X1M U166 (.Y(n134), 
	.B1(n190), 
	.B0(n203), 
	.A1N(n190), 
	.A0N(\MEM[6][0] ));
   OAI2BB2X1M U167 (.Y(n135), 
	.B1(n190), 
	.B0(n204), 
	.A1N(n190), 
	.A0N(\MEM[6][1] ));
   OAI2BB2X1M U168 (.Y(n136), 
	.B1(n190), 
	.B0(n205), 
	.A1N(n190), 
	.A0N(test_so1));
   OAI2BB2X1M U169 (.Y(n137), 
	.B1(n190), 
	.B0(n206), 
	.A1N(n190), 
	.A0N(\MEM[6][3] ));
   OAI2BB2X1M U170 (.Y(n138), 
	.B1(n190), 
	.B0(n207), 
	.A1N(n190), 
	.A0N(\MEM[6][4] ));
   OAI2BB2X1M U171 (.Y(n139), 
	.B1(n190), 
	.B0(n208), 
	.A1N(n190), 
	.A0N(\MEM[6][5] ));
   OAI2BB2X1M U172 (.Y(n140), 
	.B1(n190), 
	.B0(n209), 
	.A1N(n190), 
	.A0N(\MEM[6][6] ));
   OAI2BB2X1M U173 (.Y(n141), 
	.B1(n190), 
	.B0(n210), 
	.A1N(n190), 
	.A0N(\MEM[6][7] ));
   OAI2BB2X1M U174 (.Y(n142), 
	.B1(n188), 
	.B0(n203), 
	.A1N(n188), 
	.A0N(\MEM[7][0] ));
   OAI2BB2X1M U175 (.Y(n143), 
	.B1(n188), 
	.B0(n204), 
	.A1N(n188), 
	.A0N(\MEM[7][1] ));
   OAI2BB2X1M U176 (.Y(n144), 
	.B1(n188), 
	.B0(n205), 
	.A1N(n188), 
	.A0N(\MEM[7][2] ));
   OAI2BB2X1M U177 (.Y(n145), 
	.B1(n188), 
	.B0(n206), 
	.A1N(n188), 
	.A0N(\MEM[7][3] ));
   OAI2BB2X1M U178 (.Y(n146), 
	.B1(n188), 
	.B0(n207), 
	.A1N(n188), 
	.A0N(\MEM[7][4] ));
   OAI2BB2X1M U179 (.Y(n147), 
	.B1(n188), 
	.B0(n208), 
	.A1N(n188), 
	.A0N(\MEM[7][5] ));
   OAI2BB2X1M U180 (.Y(n148), 
	.B1(n188), 
	.B0(n209), 
	.A1N(n188), 
	.A0N(\MEM[7][6] ));
   OAI2BB2X1M U181 (.Y(n149), 
	.B1(n188), 
	.B0(n210), 
	.A1N(n188), 
	.A0N(\MEM[7][7] ));
   OAI2BB2X1M U182 (.Y(n86), 
	.B1(n203), 
	.B0(n202), 
	.A1N(n202), 
	.A0N(\MEM[0][0] ));
   OAI2BB2X1M U183 (.Y(n87), 
	.B1(n204), 
	.B0(n202), 
	.A1N(n202), 
	.A0N(\MEM[0][1] ));
   OAI2BB2X1M U184 (.Y(n88), 
	.B1(n205), 
	.B0(n202), 
	.A1N(n202), 
	.A0N(\MEM[0][2] ));
   OAI2BB2X1M U185 (.Y(n89), 
	.B1(n206), 
	.B0(n202), 
	.A1N(n202), 
	.A0N(\MEM[0][3] ));
   OAI2BB2X1M U186 (.Y(n90), 
	.B1(n207), 
	.B0(n202), 
	.A1N(n202), 
	.A0N(\MEM[0][4] ));
   OAI2BB2X1M U187 (.Y(n91), 
	.B1(n208), 
	.B0(n202), 
	.A1N(n202), 
	.A0N(\MEM[0][5] ));
   OAI2BB2X1M U188 (.Y(n92), 
	.B1(n209), 
	.B0(n202), 
	.A1N(n202), 
	.A0N(\MEM[0][6] ));
   OAI2BB2X1M U189 (.Y(n93), 
	.B1(n210), 
	.B0(n202), 
	.A1N(n202), 
	.A0N(\MEM[0][7] ));
   INVX2M U190 (.Y(n177), 
	.A(N11));
   AND2X2M U191 (.Y(n82), 
	.B(n80), 
	.A(W_addr[2]));
   INVX2M U192 (.Y(n176), 
	.A(N12));
   AND3X2M U193 (.Y(n67), 
	.C(n82), 
	.B(n211), 
	.A(W_addr[1]));
   AND3X2M U196 (.Y(n72), 
	.C(W_addr[1]), 
	.B(n211), 
	.A(n76));
   CLKBUFX2M U197 (.Y(n179), 
	.A(N10));
   AO22X1M U198 (.Y(n73), 
	.B1(n169), 
	.B0(\MEM[1][0] ), 
	.A1(n170), 
	.A0(\MEM[3][0] ));
   AO22X1M U199 (.Y(n74), 
	.B1(n169), 
	.B0(\MEM[0][0] ), 
	.A1(n170), 
	.A0(\MEM[2][0] ));
   OAI22X1M U200 (.Y(R_data[0]), 
	.B1(n75), 
	.B0(n179), 
	.A1(n77), 
	.A0(n178));
   AO22X1M U201 (.Y(n78), 
	.B1(n169), 
	.B0(\MEM[1][1] ), 
	.A1(n170), 
	.A0(\MEM[3][1] ));
   AO22X1M U202 (.Y(n79), 
	.B1(n169), 
	.B0(\MEM[0][1] ), 
	.A1(n170), 
	.A0(\MEM[2][1] ));
   OAI22X1M U203 (.Y(R_data[1]), 
	.B1(n81), 
	.B0(n179), 
	.A1(n83), 
	.A0(n178));
   AO22X1M U204 (.Y(n84), 
	.B1(n169), 
	.B0(\MEM[1][2] ), 
	.A1(n170), 
	.A0(\MEM[3][2] ));
   AO22X1M U205 (.Y(n85), 
	.B1(n169), 
	.B0(\MEM[0][2] ), 
	.A1(n170), 
	.A0(\MEM[2][2] ));
   OAI22X1M U206 (.Y(R_data[2]), 
	.B1(n150), 
	.B0(n179), 
	.A1(n151), 
	.A0(n178));
   AO22X1M U207 (.Y(n152), 
	.B1(n169), 
	.B0(\MEM[1][3] ), 
	.A1(n170), 
	.A0(\MEM[3][3] ));
   AO22X1M U208 (.Y(n153), 
	.B1(n169), 
	.B0(\MEM[0][3] ), 
	.A1(n170), 
	.A0(\MEM[2][3] ));
   OAI22X1M U209 (.Y(R_data[3]), 
	.B1(n154), 
	.B0(n179), 
	.A1(n155), 
	.A0(n178));
   AO22X1M U210 (.Y(n156), 
	.B1(n169), 
	.B0(\MEM[1][4] ), 
	.A1(n170), 
	.A0(\MEM[3][4] ));
   AO22X1M U211 (.Y(n157), 
	.B1(n169), 
	.B0(\MEM[0][4] ), 
	.A1(n170), 
	.A0(\MEM[2][4] ));
   OAI22X1M U212 (.Y(R_data[4]), 
	.B1(n158), 
	.B0(n179), 
	.A1(n159), 
	.A0(n178));
   AO22X1M U213 (.Y(n160), 
	.B1(n169), 
	.B0(\MEM[1][5] ), 
	.A1(n170), 
	.A0(\MEM[3][5] ));
   AO22X1M U214 (.Y(n161), 
	.B1(n169), 
	.B0(\MEM[0][5] ), 
	.A1(n170), 
	.A0(\MEM[2][5] ));
   OAI22X1M U215 (.Y(R_data[5]), 
	.B1(n162), 
	.B0(n179), 
	.A1(n163), 
	.A0(n178));
   AO22X1M U216 (.Y(n164), 
	.B1(n169), 
	.B0(\MEM[1][6] ), 
	.A1(n170), 
	.A0(\MEM[3][6] ));
   AO22X1M U217 (.Y(n165), 
	.B1(n169), 
	.B0(\MEM[0][6] ), 
	.A1(n170), 
	.A0(\MEM[2][6] ));
   OAI22X1M U218 (.Y(R_data[6]), 
	.B1(n166), 
	.B0(n179), 
	.A1(n167), 
	.A0(n178));
   AO22X1M U219 (.Y(n168), 
	.B1(n169), 
	.B0(\MEM[1][7] ), 
	.A1(n170), 
	.A0(\MEM[3][7] ));
   AO22X1M U220 (.Y(n171), 
	.B1(n169), 
	.B0(\MEM[0][7] ), 
	.A1(n170), 
	.A0(\MEM[2][7] ));
   OAI22X1M U221 (.Y(R_data[7]), 
	.B1(n174), 
	.B0(n179), 
	.A1(n178), 
	.A0(n175));
   DLY1X1M U224 (.Y(n218), 
	.A(n249));
   DLY1X1M U225 (.Y(n219), 
	.A(n250));
   DLY1X1M U226 (.Y(n220), 
	.A(n251));
   DLY1X1M U227 (.Y(n221), 
	.A(n252));
   DLY1X1M U228 (.Y(n222), 
	.A(n255));
   DLY1X1M U229 (.Y(n223), 
	.A(n256));
   DLY1X1M U230 (.Y(n224), 
	.A(n257));
   DLY1X1M U231 (.Y(n225), 
	.A(n259));
   DLY1X1M U232 (.Y(n226), 
	.A(n260));
   DLY1X1M U233 (.Y(n227), 
	.A(n261));
   DLY1X1M U234 (.Y(n228), 
	.A(n262));
   DLY1X1M U235 (.Y(n229), 
	.A(n263));
   DLY1X1M U236 (.Y(n230), 
	.A(n264));
   DLY1X1M U237 (.Y(n231), 
	.A(n265));
   DLY1X1M U238 (.Y(n232), 
	.A(n266));
   DLY1X1M U239 (.Y(n233), 
	.A(n267));
   DLY1X1M U240 (.Y(n234), 
	.A(n268));
   DLY1X1M U241 (.Y(n235), 
	.A(n269));
   DLY1X1M U242 (.Y(n236), 
	.A(n270));
   DLY1X1M U243 (.Y(n237), 
	.A(n250));
   DLY1X1M U244 (.Y(n238), 
	.A(n273));
   DLY1X1M U245 (.Y(n239), 
	.A(n274));
   DLY1X1M U246 (.Y(n240), 
	.A(n275));
   DLY1X1M U247 (.Y(n241), 
	.A(n276));
   DLY1X1M U248 (.Y(n242), 
	.A(n277));
   DLY1X1M U249 (.Y(n243), 
	.A(n278));
   DLY1X1M U250 (.Y(n244), 
	.A(n279));
   DLY1X1M U251 (.Y(n245), 
	.A(n253));
   DLY1X1M U252 (.Y(n246), 
	.A(n253));
   DLY1X1M U253 (.Y(n247), 
	.A(n254));
   DLY1X1M U254 (.Y(n248), 
	.A(n254));
   DLY1X1M U255 (.Y(n249), 
	.A(n247));
   DLY1X1M U256 (.Y(n250), 
	.A(n248));
   DLY1X1M U257 (.Y(n251), 
	.A(n246));
   DLY1X1M U258 (.Y(n252), 
	.A(n245));
   DLY1X1M U259 (.Y(n253), 
	.A(test_se));
   DLY1X1M U260 (.Y(n254), 
	.A(test_se));
   DLY1X1M U261 (.Y(n255), 
	.A(n245));
   DLY1X1M U262 (.Y(n256), 
	.A(n248));
   DLY1X1M U263 (.Y(n257), 
	.A(n247));
   DLY1X1M U264 (.Y(n258), 
	.A(n246));
   DLY1X1M U265 (.Y(n259), 
	.A(n249));
   DLY1X1M U266 (.Y(n260), 
	.A(n223));
   DLY1X1M U267 (.Y(n261), 
	.A(n222));
   DLY1X1M U268 (.Y(n262), 
	.A(n258));
   DLY1X1M U269 (.Y(n263), 
	.A(n224));
   DLY1X1M U270 (.Y(n264), 
	.A(n224));
   DLY1X1M U271 (.Y(n265), 
	.A(n255));
   DLY1X1M U272 (.Y(n266), 
	.A(n221));
   DLY1X1M U273 (.Y(n267), 
	.A(n218));
   DLY1X1M U274 (.Y(n268), 
	.A(n218));
   DLY1X1M U275 (.Y(n269), 
	.A(n222));
   DLY1X1M U276 (.Y(n270), 
	.A(n220));
   DLY1X1M U277 (.Y(n271), 
	.A(n219));
   DLY1X1M U278 (.Y(n272), 
	.A(n219));
   DLY1X1M U279 (.Y(n273), 
	.A(n221));
   DLY1X1M U280 (.Y(n274), 
	.A(n252));
   DLY1X1M U281 (.Y(n275), 
	.A(n223));
   DLY1X1M U282 (.Y(n276), 
	.A(n256));
   DLY1X1M U283 (.Y(n277), 
	.A(n220));
   DLY1X1M U284 (.Y(n278), 
	.A(n251));
   DLY1X1M U285 (.Y(n279), 
	.A(n257));
   INVXLM U2 (.Y(n1), 
	.A(\MEM[6][2] ));
   INVX2M U3 (.Y(test_so1), 
	.A(n1));
   NOR2X2M U4 (.Y(n169), 
	.B(N12), 
	.A(N11));
   AND3X1M U5 (.Y(n70), 
	.C(n82), 
	.B(n212), 
	.A(W_addr[0]));
   AND3X1M U6 (.Y(n71), 
	.C(W_addr[0]), 
	.B(n212), 
	.A(n76));
   CLKINVX2M U7 (.Y(n211), 
	.A(W_addr[0]));
endmodule

module FIFO_WR_test_1 (
	W_inc, 
	W_clk, 
	W_rst, 
	SYNC_R_ptr, 
	W_ptr, 
	W_addr, 
	W_full, 
	test_si, 
	test_se);
   input W_inc;
   input W_clk;
   input W_rst;
   input [3:0] SYNC_R_ptr;
   output [3:0] W_ptr;
   output [2:0] W_addr;
   output W_full;
   input test_si;
   input test_se;

   // Internal wires
   wire \W_counter[3] ;
   wire n12;
   wire n13;
   wire n14;
   wire n16;
   wire n17;
   wire n18;
   wire n19;
   wire n20;
   wire n21;
   wire n1;
   wire n25;
   wire n26;
   wire n27;
   wire n28;
   wire n29;
   wire n30;
   wire n31;
   wire [3:0] W_counter_next;
   wire [2:0] W_ptr_next;

   SDFFRQX2M \W_counter_reg[3]  (.SI(W_addr[2]), 
	.SE(n31), 
	.RN(W_rst), 
	.Q(\W_counter[3] ), 
	.D(W_counter_next[3]), 
	.CK(W_clk));
   SDFFRQX2M \W_ptr_reg[0]  (.SI(\W_counter[3] ), 
	.SE(n27), 
	.RN(W_rst), 
	.Q(W_ptr[0]), 
	.D(W_ptr_next[0]), 
	.CK(W_clk));
   SDFFRQX2M \W_ptr_reg[1]  (.SI(W_ptr[0]), 
	.SE(n26), 
	.RN(W_rst), 
	.Q(W_ptr[1]), 
	.D(W_ptr_next[1]), 
	.CK(W_clk));
   SDFFRQX2M \W_ptr_reg[3]  (.SI(W_ptr[2]), 
	.SE(n31), 
	.RN(W_rst), 
	.Q(W_ptr[3]), 
	.D(W_counter_next[3]), 
	.CK(W_clk));
   SDFFRQX2M \W_ptr_reg[2]  (.SI(W_ptr[1]), 
	.SE(n27), 
	.RN(W_rst), 
	.Q(W_ptr[2]), 
	.D(W_ptr_next[2]), 
	.CK(W_clk));
   SDFFRQX2M \W_counter_reg[2]  (.SI(W_addr[1]), 
	.SE(n26), 
	.RN(W_rst), 
	.Q(W_addr[2]), 
	.D(n1), 
	.CK(W_clk));
   XNOR2X2M U11 (.Y(n1), 
	.B(n14), 
	.A(W_addr[2]));
   CLKINVX2M U16 (.Y(W_full), 
	.A(n12));
   CLKXOR2X2M U17 (.Y(W_ptr_next[1]), 
	.B(W_counter_next[1]), 
	.A(n1));
   CLKXOR2X2M U18 (.Y(W_ptr_next[0]), 
	.B(W_counter_next[0]), 
	.A(W_counter_next[1]));
   CLKXOR2X2M U19 (.Y(W_ptr_next[2]), 
	.B(n1), 
	.A(W_counter_next[3]));
   CLKXOR2X2M U21 (.Y(W_counter_next[1]), 
	.B(W_addr[1]), 
	.A(n16));
   XNOR2X2M U22 (.Y(W_counter_next[3]), 
	.B(\W_counter[3] ), 
	.A(n13));
   NAND2BX2M U23 (.Y(n13), 
	.B(W_addr[2]), 
	.AN(n14));
   CLKXOR2X2M U24 (.Y(n21), 
	.B(SYNC_R_ptr[3]), 
	.A(W_ptr[3]));
   NAND4X2M U26 (.Y(n12), 
	.D(n21), 
	.C(n20), 
	.B(n19), 
	.A(n18));
   XNOR2X2M U27 (.Y(n18), 
	.B(SYNC_R_ptr[1]), 
	.A(W_ptr[1]));
   XNOR2X2M U28 (.Y(n19), 
	.B(SYNC_R_ptr[0]), 
	.A(W_ptr[0]));
   CLKXOR2X2M U29 (.Y(n20), 
	.B(SYNC_R_ptr[2]), 
	.A(W_ptr[2]));
   NAND2X2M U30 (.Y(n14), 
	.B(n16), 
	.A(W_addr[1]));
   DLY1X1M U32 (.Y(n25), 
	.A(n28));
   DLY1X1M U33 (.Y(n26), 
	.A(n29));
   DLY1X1M U34 (.Y(n27), 
	.A(n30));
   DLY1X1M U35 (.Y(n28), 
	.A(test_se));
   DLY1X1M U36 (.Y(n29), 
	.A(n28));
   DLY1X1M U37 (.Y(n30), 
	.A(n25));
   DLY1X1M U38 (.Y(n31), 
	.A(n25));
   SDFFRQX4M \W_counter_reg[0]  (.SI(test_si), 
	.SE(n30), 
	.RN(W_rst), 
	.Q(W_addr[0]), 
	.D(W_counter_next[0]), 
	.CK(W_clk));
   SDFFRQX4M \W_counter_reg[1]  (.SI(W_addr[0]), 
	.SE(n29), 
	.RN(W_rst), 
	.Q(W_addr[1]), 
	.D(W_counter_next[1]), 
	.CK(W_clk));
   NOR2BX2M U3 (.Y(n16), 
	.B(n17), 
	.AN(W_addr[0]));
   CLKNAND2X2M U4 (.Y(n17), 
	.B(n12), 
	.A(W_inc));
   XNOR2X2M U9 (.Y(W_counter_next[0]), 
	.B(W_addr[0]), 
	.A(n17));
endmodule

module FIFO_RD_test_1 (
	R_inc, 
	R_clk, 
	R_rst, 
	SYNC_W_ptr, 
	R_ptr, 
	R_addr, 
	R_empty, 
	test_si, 
	test_se);
   input R_inc;
   input R_clk;
   input R_rst;
   input [3:0] SYNC_W_ptr;
   output [3:0] R_ptr;
   output [2:0] R_addr;
   output R_empty;
   input test_si;
   input test_se;

   // Internal wires
   wire \R_counter[3] ;
   wire n12;
   wire n13;
   wire n14;
   wire n15;
   wire n16;
   wire n17;
   wire n18;
   wire n19;
   wire n24;
   wire n25;
   wire n26;
   wire n27;
   wire n28;
   wire n29;
   wire [3:0] R_counter_next;
   wire [2:0] R_ptr_next;

   SDFFRQX2M \R_counter_reg[3]  (.SI(R_addr[2]), 
	.SE(n29), 
	.RN(R_rst), 
	.Q(\R_counter[3] ), 
	.D(R_counter_next[3]), 
	.CK(R_clk));
   SDFFRQX2M \R_ptr_reg[0]  (.SI(\R_counter[3] ), 
	.SE(n26), 
	.RN(R_rst), 
	.Q(R_ptr[0]), 
	.D(R_ptr_next[0]), 
	.CK(R_clk));
   SDFFRQX2M \R_ptr_reg[3]  (.SI(R_ptr[2]), 
	.SE(n25), 
	.RN(R_rst), 
	.Q(R_ptr[3]), 
	.D(R_counter_next[3]), 
	.CK(R_clk));
   SDFFRQX2M \R_ptr_reg[2]  (.SI(R_ptr[1]), 
	.SE(n29), 
	.RN(R_rst), 
	.Q(R_ptr[2]), 
	.D(R_ptr_next[2]), 
	.CK(R_clk));
   SDFFRQX2M \R_ptr_reg[1]  (.SI(R_ptr[0]), 
	.SE(n26), 
	.RN(R_rst), 
	.Q(R_ptr[1]), 
	.D(R_ptr_next[1]), 
	.CK(R_clk));
   SDFFRQX2M \R_counter_reg[0]  (.SI(test_si), 
	.SE(n25), 
	.RN(R_rst), 
	.Q(R_addr[0]), 
	.D(R_counter_next[0]), 
	.CK(R_clk));
   NOR2BX2M U13 (.Y(n14), 
	.B(n15), 
	.AN(R_addr[0]));
   CLKXOR2X2M U16 (.Y(R_ptr_next[1]), 
	.B(R_counter_next[1]), 
	.A(R_counter_next[2]));
   CLKXOR2X2M U17 (.Y(R_ptr_next[2]), 
	.B(R_counter_next[2]), 
	.A(R_counter_next[3]));
   CLKXOR2X2M U18 (.Y(R_ptr_next[0]), 
	.B(R_counter_next[0]), 
	.A(R_counter_next[1]));
   CLKXOR2X2M U20 (.Y(R_counter_next[1]), 
	.B(n14), 
	.A(R_addr[1]));
   XNOR2X2M U21 (.Y(R_counter_next[2]), 
	.B(R_addr[2]), 
	.A(n13));
   XNOR2X2M U22 (.Y(R_counter_next[3]), 
	.B(\R_counter[3] ), 
	.A(n12));
   NAND2BX2M U23 (.Y(n12), 
	.B(R_addr[2]), 
	.AN(n13));
   XNOR2X2M U24 (.Y(R_counter_next[0]), 
	.B(R_addr[0]), 
	.A(n15));
   XNOR2X2M U25 (.Y(n19), 
	.B(R_ptr[2]), 
	.A(SYNC_W_ptr[2]));
   NAND4X2M U26 (.Y(R_empty), 
	.D(n19), 
	.C(n18), 
	.B(n17), 
	.A(n16));
   XNOR2X2M U27 (.Y(n16), 
	.B(R_ptr[1]), 
	.A(SYNC_W_ptr[1]));
   XNOR2X2M U28 (.Y(n17), 
	.B(R_ptr[0]), 
	.A(SYNC_W_ptr[0]));
   XNOR2X2M U29 (.Y(n18), 
	.B(R_ptr[3]), 
	.A(SYNC_W_ptr[3]));
   NAND2X2M U30 (.Y(n13), 
	.B(n14), 
	.A(R_addr[1]));
   NAND2X2M U31 (.Y(n15), 
	.B(R_empty), 
	.A(R_inc));
   DLY1X1M U32 (.Y(n24), 
	.A(test_se));
   DLY1X1M U33 (.Y(n25), 
	.A(n27));
   DLY1X1M U34 (.Y(n26), 
	.A(n28));
   DLY1X1M U35 (.Y(n27), 
	.A(n24));
   DLY1X1M U36 (.Y(n28), 
	.A(test_se));
   DLY1X1M U37 (.Y(n29), 
	.A(n24));
   SDFFRQX4M \R_counter_reg[2]  (.SI(R_addr[1]), 
	.SE(n28), 
	.RN(R_rst), 
	.Q(R_addr[2]), 
	.D(R_counter_next[2]), 
	.CK(R_clk));
   SDFFRQX4M \R_counter_reg[1]  (.SI(R_addr[0]), 
	.SE(n27), 
	.RN(R_rst), 
	.Q(R_addr[1]), 
	.D(R_counter_next[1]), 
	.CK(R_clk));
endmodule

module DF_SYNC_test_0 (
	ASYNC_data, 
	clk, 
	rst, 
	SYNC_data, 
	test_se);
   input [3:0] ASYNC_data;
   input clk;
   input rst;
   output [3:0] SYNC_data;
   input test_se;

   // Internal wires
   wire n12;
   wire n13;
   wire n14;
   wire n15;
   wire n16;
   wire n17;
   wire [3:0] stage1;

   SDFFRQX2M \stage2_reg[1]  (.SI(SYNC_data[0]), 
	.SE(n14), 
	.RN(rst), 
	.Q(SYNC_data[1]), 
	.D(stage1[1]), 
	.CK(clk));
   SDFFRQX2M \stage2_reg[0]  (.SI(stage1[3]), 
	.SE(n13), 
	.RN(rst), 
	.Q(SYNC_data[0]), 
	.D(stage1[0]), 
	.CK(clk));
   SDFFRQX2M \stage2_reg[3]  (.SI(SYNC_data[2]), 
	.SE(n17), 
	.RN(rst), 
	.Q(SYNC_data[3]), 
	.D(stage1[3]), 
	.CK(clk));
   SDFFRQX2M \stage2_reg[2]  (.SI(SYNC_data[1]), 
	.SE(n14), 
	.RN(rst), 
	.Q(SYNC_data[2]), 
	.D(stage1[2]), 
	.CK(clk));
   SDFFRQX2M \stage1_reg[3]  (.SI(stage1[2]), 
	.SE(n13), 
	.RN(rst), 
	.Q(stage1[3]), 
	.D(ASYNC_data[3]), 
	.CK(clk));
   SDFFRQX2M \stage1_reg[2]  (.SI(stage1[1]), 
	.SE(n17), 
	.RN(rst), 
	.Q(stage1[2]), 
	.D(ASYNC_data[2]), 
	.CK(clk));
   SDFFRQX2M \stage1_reg[1]  (.SI(stage1[0]), 
	.SE(n16), 
	.RN(rst), 
	.Q(stage1[1]), 
	.D(ASYNC_data[1]), 
	.CK(clk));
   SDFFRQX2M \stage1_reg[0]  (.SI(ASYNC_data[3]), 
	.SE(n15), 
	.RN(rst), 
	.Q(stage1[0]), 
	.D(ASYNC_data[0]), 
	.CK(clk));
   DLY1X1M U13 (.Y(n12), 
	.A(test_se));
   DLY1X1M U14 (.Y(n13), 
	.A(n15));
   DLY1X1M U15 (.Y(n14), 
	.A(n16));
   DLY1X1M U16 (.Y(n15), 
	.A(n12));
   DLY1X1M U17 (.Y(n16), 
	.A(test_se));
   DLY1X1M U18 (.Y(n17), 
	.A(n12));
endmodule

module DF_SYNC_test_1 (
	ASYNC_data, 
	clk, 
	rst, 
	SYNC_data, 
	test_si, 
	test_se);
   input [3:0] ASYNC_data;
   input clk;
   input rst;
   output [3:0] SYNC_data;
   input test_si;
   input test_se;

   // Internal wires
   wire n21;
   wire n22;
   wire n23;
   wire n24;
   wire n25;
   wire n26;
   wire [3:0] stage1;

   SDFFRQX2M \stage2_reg[3]  (.SI(SYNC_data[2]), 
	.SE(n23), 
	.RN(rst), 
	.Q(SYNC_data[3]), 
	.D(stage1[3]), 
	.CK(clk));
   SDFFRQX2M \stage2_reg[2]  (.SI(SYNC_data[1]), 
	.SE(n22), 
	.RN(rst), 
	.Q(SYNC_data[2]), 
	.D(stage1[2]), 
	.CK(clk));
   SDFFRQX2M \stage2_reg[1]  (.SI(SYNC_data[0]), 
	.SE(n26), 
	.RN(rst), 
	.Q(SYNC_data[1]), 
	.D(stage1[1]), 
	.CK(clk));
   SDFFRQX2M \stage2_reg[0]  (.SI(stage1[3]), 
	.SE(n23), 
	.RN(rst), 
	.Q(SYNC_data[0]), 
	.D(stage1[0]), 
	.CK(clk));
   SDFFRQX2M \stage1_reg[3]  (.SI(stage1[2]), 
	.SE(n22), 
	.RN(rst), 
	.Q(stage1[3]), 
	.D(ASYNC_data[3]), 
	.CK(clk));
   SDFFRQX2M \stage1_reg[2]  (.SI(stage1[1]), 
	.SE(n26), 
	.RN(rst), 
	.Q(stage1[2]), 
	.D(ASYNC_data[2]), 
	.CK(clk));
   SDFFRQX2M \stage1_reg[1]  (.SI(stage1[0]), 
	.SE(n25), 
	.RN(rst), 
	.Q(stage1[1]), 
	.D(ASYNC_data[1]), 
	.CK(clk));
   SDFFRQX2M \stage1_reg[0]  (.SI(test_si), 
	.SE(n24), 
	.RN(rst), 
	.Q(stage1[0]), 
	.D(ASYNC_data[0]), 
	.CK(clk));
   DLY1X1M U13 (.Y(n21), 
	.A(test_se));
   DLY1X1M U14 (.Y(n22), 
	.A(n24));
   DLY1X1M U15 (.Y(n23), 
	.A(n25));
   DLY1X1M U16 (.Y(n24), 
	.A(n21));
   DLY1X1M U17 (.Y(n25), 
	.A(test_se));
   DLY1X1M U18 (.Y(n26), 
	.A(n21));
endmodule

module ASYC_FIFO_test_1 (
	W_clk, 
	W_rst, 
	W_inc, 
	R_clk, 
	R_rst, 
	R_inc, 
	W_data, 
	W_full, 
	R_empty, 
	R_data, 
	test_si2, 
	test_si1, 
	test_so2, 
	test_so1, 
	test_se, 
	REF_CLK_M__L8_N1, 
	REF_CLK_M__L8_N2, 
	REF_CLK_M__L8_N3, 
	REF_CLK_M__L8_N5);
   input W_clk;
   input W_rst;
   input W_inc;
   input R_clk;
   input R_rst;
   input R_inc;
   input [7:0] W_data;
   output W_full;
   output R_empty;
   output [7:0] R_data;
   input test_si2;
   input test_si1;
   output test_so2;
   output test_so1;
   input test_se;
   input REF_CLK_M__L8_N1;
   input REF_CLK_M__L8_N2;
   input REF_CLK_M__L8_N3;
   input REF_CLK_M__L8_N5;

   // Internal wires
   wire n6;
   wire n10;
   wire n11;
   wire n12;
   wire n13;
   wire n14;
   wire n15;
   wire n16;
   wire n17;
   wire n18;
   wire [2:0] W_addr;
   wire [2:0] R_addr;
   wire [3:0] SYNC_R_ptr;
   wire [3:0] W_ptr;
   wire [3:0] SYNC_W_ptr;
   wire [3:0] R_ptr;

   assign test_so2 = SYNC_W_ptr[3] ;

   DLY1X1M U7 (.Y(n10), 
	.A(n15));
   DLY1X1M U8 (.Y(n11), 
	.A(n15));
   DLY1X1M U9 (.Y(n12), 
	.A(test_se));
   DLY1X1M U10 (.Y(n13), 
	.A(n12));
   DLY1X1M U11 (.Y(n14), 
	.A(n12));
   DLY1X1M U12 (.Y(n15), 
	.A(n13));
   DLY1X1M U13 (.Y(n16), 
	.A(n14));
   DLY1X1M U14 (.Y(n17), 
	.A(n13));
   DLY1X1M U15 (.Y(n18), 
	.A(n14));
   FIFO_MEM_CONTROL_test_1 U0 (.W_data({ W_data[7],
		W_data[6],
		W_data[5],
		W_data[4],
		W_data[3],
		W_data[2],
		W_data[1],
		W_data[0] }), 
	.W_inc(W_inc), 
	.W_full(W_full), 
	.W_addr({ W_addr[2],
		W_addr[1],
		W_addr[0] }), 
	.R_addr({ R_addr[2],
		R_addr[1],
		R_addr[0] }), 
	.W_clk(W_clk), 
	.R_data({ R_data[7],
		R_data[6],
		R_data[5],
		R_data[4],
		R_data[3],
		R_data[2],
		R_data[1],
		R_data[0] }), 
	.test_si2(test_si2), 
	.test_si1(test_si1), 
	.test_so2(n6), 
	.test_so1(test_so1), 
	.test_se(n10), 
	.REF_CLK_M__L8_N1(REF_CLK_M__L8_N1), 
	.REF_CLK_M__L8_N2(REF_CLK_M__L8_N2), 
	.REF_CLK_M__L8_N3(REF_CLK_M__L8_N3), 
	.REF_CLK_M__L8_N5(REF_CLK_M__L8_N5));
   FIFO_WR_test_1 U1 (.W_inc(W_inc), 
	.W_clk(REF_CLK_M__L8_N5), 
	.W_rst(W_rst), 
	.SYNC_R_ptr({ SYNC_R_ptr[3],
		SYNC_R_ptr[2],
		SYNC_R_ptr[1],
		SYNC_R_ptr[0] }), 
	.W_ptr({ W_ptr[3],
		W_ptr[2],
		W_ptr[1],
		W_ptr[0] }), 
	.W_addr({ W_addr[2],
		W_addr[1],
		W_addr[0] }), 
	.W_full(W_full), 
	.test_si(n6), 
	.test_se(n11));
   FIFO_RD_test_1 U2 (.R_inc(R_inc), 
	.R_clk(R_clk), 
	.R_rst(R_rst), 
	.SYNC_W_ptr({ SYNC_W_ptr[3],
		SYNC_W_ptr[2],
		SYNC_W_ptr[1],
		SYNC_W_ptr[0] }), 
	.R_ptr({ R_ptr[3],
		R_ptr[2],
		R_ptr[1],
		R_ptr[0] }), 
	.R_addr({ R_addr[2],
		R_addr[1],
		R_addr[0] }), 
	.R_empty(R_empty), 
	.test_si(W_ptr[3]), 
	.test_se(n18));
   DF_SYNC_test_0 U3_FIFO_WR (.ASYNC_data({ R_ptr[3],
		R_ptr[2],
		R_ptr[1],
		R_ptr[0] }), 
	.clk(REF_CLK_M__L8_N5), 
	.rst(W_rst), 
	.SYNC_data({ SYNC_R_ptr[3],
		SYNC_R_ptr[2],
		SYNC_R_ptr[1],
		SYNC_R_ptr[0] }), 
	.test_se(n17));
   DF_SYNC_test_1 U4_FIFO_RD (.ASYNC_data({ W_ptr[3],
		W_ptr[2],
		W_ptr[1],
		W_ptr[0] }), 
	.clk(R_clk), 
	.rst(R_rst), 
	.SYNC_data({ SYNC_W_ptr[3],
		SYNC_W_ptr[2],
		SYNC_W_ptr[1],
		SYNC_W_ptr[0] }), 
	.test_si(SYNC_R_ptr[3]), 
	.test_se(n16));
endmodule

module FSM_test_1 (
	Data_valid, 
	PAR_EN, 
	ser_done, 
	clk, 
	rst, 
	mux_sel, 
	busy, 
	ser_en, 
	test_si, 
	test_so, 
	test_se);
   input Data_valid;
   input PAR_EN;
   input ser_done;
   input clk;
   input rst;
   output [1:0] mux_sel;
   output busy;
   output ser_en;
   input test_si;
   output test_so;
   input test_se;

   // Internal wires
   wire n9;
   wire n10;
   wire n11;
   wire n12;
   wire n13;
   wire n14;
   wire n15;
   wire n5;
   wire n6;
   wire n7;
   wire n8;
   wire n16;
   wire n19;
   wire n20;
   wire n21;
   wire [2:0] current_state;
   wire [2:0] next_state;

   assign test_so = current_state[2] ;

   SDFFRQX2M \current_state_reg[2]  (.SI(current_state[1]), 
	.SE(n19), 
	.RN(rst), 
	.Q(current_state[2]), 
	.D(next_state[2]), 
	.CK(clk));
   SDFFRQX2M \current_state_reg[1]  (.SI(current_state[0]), 
	.SE(n19), 
	.RN(rst), 
	.Q(current_state[1]), 
	.D(next_state[1]), 
	.CK(clk));
   SDFFRQX2M \current_state_reg[0]  (.SI(test_si), 
	.SE(test_se), 
	.RN(rst), 
	.Q(current_state[0]), 
	.D(next_state[0]), 
	.CK(clk));
   OAI211X2M U6 (.Y(busy), 
	.C0(n11), 
	.B0(n12), 
	.A1(n8), 
	.A0(n15));
   NAND2X2M U7 (.Y(n11), 
	.B(n8), 
	.A(current_state[1]));
   AOI21X2M U8 (.Y(n10), 
	.B0(current_state[0]), 
	.A1(ser_done), 
	.A0(n16));
   INVX2M U10 (.Y(ser_en), 
	.A(n9));
   AND2X2M U11 (.Y(n14), 
	.B(n8), 
	.A(n12));
   OAI31X1M U12 (.Y(next_state[0]), 
	.B0(n13), 
	.A2(n9), 
	.A1(n5), 
	.A0(n16));
   NAND3X2M U13 (.Y(n13), 
	.C(Data_valid), 
	.B(n7), 
	.A(n14));
   INVX2M U14 (.Y(n5), 
	.A(ser_done));
   NAND2X2M U15 (.Y(n15), 
	.B(n7), 
	.A(n6));
   NOR2X2M U16 (.Y(next_state[2]), 
	.B(n11), 
	.A(n10));
   INVX2M U17 (.Y(n8), 
	.A(current_state[2]));
   NAND2X2M U18 (.Y(n12), 
	.B(n8), 
	.A(n20));
   NAND2X2M U19 (.Y(n9), 
	.B(n14), 
	.A(n21));
   OAI2B2X1M U20 (.Y(next_state[1]), 
	.B1(current_state[1]), 
	.B0(n12), 
	.A1N(n10), 
	.A0(n11));
   INVX2M U21 (.Y(n7), 
	.A(current_state[1]));
   INVX2M U22 (.Y(n6), 
	.A(current_state[0]));
   INVX2M U23 (.Y(n16), 
	.A(PAR_EN));
   OAI21X2M U24 (.Y(mux_sel[0]), 
	.B0(n15), 
	.A1(current_state[0]), 
	.A0(current_state[2]));
   OAI21X2M U25 (.Y(mux_sel[1]), 
	.B0(n15), 
	.A1(n11), 
	.A0(n6));
   DLY1X1M U26 (.Y(n19), 
	.A(test_se));
   INVXLM U27 (.Y(n20), 
	.A(n6));
   INVXLM U28 (.Y(n21), 
	.A(n7));
endmodule

module MUX (
	mux_sel, 
	ser_data, 
	par_bit, 
	TX_OUT);
   input [1:0] mux_sel;
   input ser_data;
   input par_bit;
   output TX_OUT;

   // Internal wires
   wire n1;

   OAI2BB1X2M U3 (.Y(TX_OUT), 
	.B0(n1), 
	.A1N(mux_sel[0]), 
	.A0N(ser_data));
   OAI21X2M U4 (.Y(n1), 
	.B0(mux_sel[1]), 
	.A1(par_bit), 
	.A0(mux_sel[0]));
endmodule

module Parity_Calculator_test_1 (
	P_data, 
	PAR_type, 
	Data_valid, 
	clk, 
	rst, 
	par_bit, 
	test_si, 
	test_se);
   input [7:0] P_data;
   input PAR_type;
   input Data_valid;
   input clk;
   input rst;
   output par_bit;
   input test_si;
   input test_se;

   // Internal wires
   wire n1;
   wire n3;
   wire n4;
   wire n5;
   wire n6;
   wire n8;
   wire n2;

   SDFFRQX2M par_bit_reg (.SI(test_si), 
	.SE(test_se), 
	.RN(rst), 
	.Q(par_bit), 
	.D(n8), 
	.CK(clk));
   XOR3XLM U2 (.Y(n3), 
	.C(n6), 
	.B(P_data[4]), 
	.A(P_data[5]));
   CLKXOR2X2M U3 (.Y(n6), 
	.B(P_data[6]), 
	.A(P_data[7]));
   XNOR2X2M U4 (.Y(n5), 
	.B(P_data[2]), 
	.A(P_data[3]));
   OAI2BB2X1M U5 (.Y(n8), 
	.B1(n2), 
	.B0(n1), 
	.A1N(n2), 
	.A0N(par_bit));
   INVX2M U6 (.Y(n2), 
	.A(Data_valid));
   XOR3XLM U7 (.Y(n1), 
	.C(n4), 
	.B(PAR_type), 
	.A(n3));
   XOR3XLM U8 (.Y(n4), 
	.C(n5), 
	.B(P_data[0]), 
	.A(P_data[1]));
endmodule

module Serializer_test_1 (
	P_data, 
	ser_en, 
	clk, 
	rst, 
	ser_done, 
	ser_data, 
	test_si, 
	test_se);
   input [7:0] P_data;
   input ser_en;
   input clk;
   input rst;
   output ser_done;
   output ser_data;
   input test_si;
   input test_se;

   // Internal wires
   wire n14;
   wire n15;
   wire n16;
   wire n17;
   wire n18;
   wire n19;
   wire n20;
   wire n21;
   wire n22;
   wire n23;
   wire n24;
   wire n25;
   wire n26;
   wire n27;
   wire n28;
   wire n29;
   wire n30;
   wire n8;
   wire n9;
   wire n10;
   wire n11;
   wire n12;
   wire n13;
   wire n34;
   wire n35;
   wire [3:0] counter;

   SDFFRQX2M ser_data_reg (.SI(counter[2]), 
	.SE(n35), 
	.RN(rst), 
	.Q(ser_data), 
	.D(n27), 
	.CK(clk));
   SDFFRQX2M \counter_reg[2]  (.SI(counter[1]), 
	.SE(n34), 
	.RN(rst), 
	.Q(counter[2]), 
	.D(n28), 
	.CK(clk));
   AOI21X2M U11 (.Y(n25), 
	.B0(n14), 
	.A1(n10), 
	.A0(n8));
   NAND2X2M U12 (.Y(n23), 
	.B(ser_en), 
	.A(n26));
   NOR2X2M U13 (.Y(n14), 
	.B(n10), 
	.A(n13));
   INVX2M U15 (.Y(n10), 
	.A(n23));
   INVX2M U16 (.Y(n13), 
	.A(ser_en));
   OAI32X1M U17 (.Y(n28), 
	.B1(n12), 
	.B0(n24), 
	.A2(n11), 
	.A1(n8), 
	.A0(n23));
   AND2X2M U18 (.Y(n24), 
	.B(n23), 
	.A(n25));
   OAI2BB2X1M U19 (.Y(n29), 
	.B1(n11), 
	.B0(n25), 
	.A1N(n10), 
	.A0N(n19));
   INVX2M U20 (.Y(ser_done), 
	.A(n26));
   AOI222X1M U21 (.Y(n17), 
	.C1(n22), 
	.C0(counter[1]), 
	.B1(P_data[1]), 
	.B0(n21), 
	.A1(n19), 
	.A0(P_data[2]));
   AO22X1M U22 (.Y(n22), 
	.B1(n8), 
	.B0(P_data[3]), 
	.A1(counter[0]), 
	.A0(P_data[4]));
   AOI22X1M U23 (.Y(n20), 
	.B1(counter[1]), 
	.B0(P_data[7]), 
	.A1(n11), 
	.A0(P_data[5]));
   CLKINVX2M U24 (.Y(n8), 
	.A(counter[0]));
   OAI22X1M U25 (.Y(n30), 
	.B1(n23), 
	.B0(counter[0]), 
	.A1(n9), 
	.A0(n8));
   INVX2M U26 (.Y(n9), 
	.A(n14));
   INVX2M U27 (.Y(n11), 
	.A(counter[1]));
   OAI2BB1X2M U28 (.Y(n27), 
	.B0(n15), 
	.A1N(n14), 
	.A0N(ser_data));
   AOI22X1M U29 (.Y(n15), 
	.B1(n13), 
	.B0(P_data[0]), 
	.A1(n16), 
	.A0(n10));
   OAI22X1M U30 (.Y(n16), 
	.B1(n12), 
	.B0(n18), 
	.A1(n17), 
	.A0(counter[2]));
   AOI2BB2XLM U31 (.Y(n18), 
	.B1(n19), 
	.B0(P_data[6]), 
	.A1N(n20), 
	.A0N(counter[0]));
   NOR2X2M U32 (.Y(n19), 
	.B(counter[1]), 
	.A(n8));
   INVX2M U33 (.Y(n12), 
	.A(counter[2]));
   DLY1X1M U34 (.Y(n34), 
	.A(test_se));
   DLY1X1M U35 (.Y(n35), 
	.A(test_se));
   SDFFRQX4M \counter_reg[1]  (.SI(counter[0]), 
	.SE(n35), 
	.RN(rst), 
	.Q(counter[1]), 
	.D(n29), 
	.CK(clk));
   SDFFRQX4M \counter_reg[0]  (.SI(test_si), 
	.SE(n34), 
	.RN(rst), 
	.Q(counter[0]), 
	.D(n30), 
	.CK(clk));
   NAND3X2M U3 (.Y(n26), 
	.C(counter[2]), 
	.B(counter[0]), 
	.A(counter[1]));
   NOR2X2M U4 (.Y(n21), 
	.B(counter[0]), 
	.A(counter[1]));
endmodule

module UART_TX_top_test_1 (
	P_data, 
	Data_valid, 
	PAR_EN, 
	PAR_type, 
	clk, 
	rst, 
	TX_OUT, 
	busy, 
	test_si, 
	test_so, 
	test_se, 
	TX_CLK_M__L4_N1);
   input [7:0] P_data;
   input Data_valid;
   input PAR_EN;
   input PAR_type;
   input clk;
   input rst;
   output TX_OUT;
   output busy;
   input test_si;
   output test_so;
   input test_se;
   input TX_CLK_M__L4_N1;

   // Internal wires
   wire ser_done;
   wire ser_en;
   wire ser_data;
   wire par_bit;
   wire n1;
   wire n4;
   wire n6;
   wire n8;
   wire n10;
   wire n12;
   wire n14;
   wire n16;
   wire n18;
   wire n21;
   wire n23;
   wire n25;
   wire n26;
   wire n27;
   wire n28;
   wire n29;
   wire n30;
   wire n31;
   wire n32;
   wire n33;
   wire n34;
   wire n35;
   wire n36;
   wire [7:0] P_data_reg;
   wire [1:0] mux_sel;

   assign test_so = ser_data ;

   SDFFRQX2M \P_data_reg_reg[1]  (.SI(P_data_reg[0]), 
	.SE(n29), 
	.RN(rst), 
	.Q(P_data_reg[1]), 
	.D(n4), 
	.CK(clk));
   SDFFRQX2M \P_data_reg_reg[4]  (.SI(P_data_reg[3]), 
	.SE(n26), 
	.RN(rst), 
	.Q(P_data_reg[4]), 
	.D(n10), 
	.CK(TX_CLK_M__L4_N1));
   SDFFRQX2M \P_data_reg_reg[0]  (.SI(test_si), 
	.SE(n36), 
	.RN(rst), 
	.Q(P_data_reg[0]), 
	.D(n18), 
	.CK(clk));
   SDFFRQX2M \P_data_reg_reg[5]  (.SI(P_data_reg[4]), 
	.SE(n27), 
	.RN(rst), 
	.Q(P_data_reg[5]), 
	.D(n12), 
	.CK(clk));
   SDFFRQX2M \P_data_reg_reg[3]  (.SI(P_data_reg[2]), 
	.SE(n26), 
	.RN(rst), 
	.Q(P_data_reg[3]), 
	.D(n8), 
	.CK(TX_CLK_M__L4_N1));
   SDFFRQX2M \P_data_reg_reg[7]  (.SI(P_data_reg[6]), 
	.SE(n29), 
	.RN(rst), 
	.Q(P_data_reg[7]), 
	.D(n16), 
	.CK(clk));
   SDFFRQX2M \P_data_reg_reg[2]  (.SI(P_data_reg[1]), 
	.SE(n27), 
	.RN(rst), 
	.Q(P_data_reg[2]), 
	.D(n6), 
	.CK(clk));
   SDFFRQX2M \P_data_reg_reg[6]  (.SI(P_data_reg[5]), 
	.SE(n35), 
	.RN(rst), 
	.Q(P_data_reg[6]), 
	.D(n14), 
	.CK(TX_CLK_M__L4_N1));
   CLKINVX2M U7 (.Y(n21), 
	.A(n1));
   NAND2BX2M U8 (.Y(n1), 
	.B(Data_valid), 
	.AN(busy));
   AO22X1M U11 (.Y(n4), 
	.B1(n21), 
	.B0(P_data[1]), 
	.A1(n1), 
	.A0(P_data_reg[1]));
   AO22X1M U12 (.Y(n6), 
	.B1(n21), 
	.B0(P_data[2]), 
	.A1(n1), 
	.A0(P_data_reg[2]));
   AO22X1M U13 (.Y(n8), 
	.B1(n21), 
	.B0(P_data[3]), 
	.A1(n1), 
	.A0(P_data_reg[3]));
   AO22X1M U14 (.Y(n10), 
	.B1(n21), 
	.B0(P_data[4]), 
	.A1(n1), 
	.A0(P_data_reg[4]));
   AO22X1M U15 (.Y(n12), 
	.B1(n21), 
	.B0(P_data[5]), 
	.A1(n1), 
	.A0(P_data_reg[5]));
   AO22X1M U24 (.Y(n14), 
	.B1(n21), 
	.B0(P_data[6]), 
	.A1(n1), 
	.A0(P_data_reg[6]));
   AO22X1M U25 (.Y(n16), 
	.B1(n21), 
	.B0(P_data[7]), 
	.A1(n1), 
	.A0(P_data_reg[7]));
   AO22X1M U26 (.Y(n18), 
	.B1(n21), 
	.B0(P_data[0]), 
	.A1(n1), 
	.A0(P_data_reg[0]));
   DLY1X1M U27 (.Y(n25), 
	.A(n34));
   DLY1X1M U28 (.Y(n26), 
	.A(n35));
   DLY1X1M U29 (.Y(n27), 
	.A(n25));
   DLY1X1M U30 (.Y(n28), 
	.A(n34));
   DLY1X1M U31 (.Y(n29), 
	.A(n25));
   DLY1X1M U32 (.Y(n30), 
	.A(test_se));
   DLY1X1M U33 (.Y(n31), 
	.A(n30));
   DLY1X1M U34 (.Y(n32), 
	.A(n30));
   DLY1X1M U35 (.Y(n33), 
	.A(n32));
   DLY1X1M U36 (.Y(n34), 
	.A(n31));
   DLY1X1M U37 (.Y(n35), 
	.A(n32));
   DLY1X1M U38 (.Y(n36), 
	.A(n31));
   FSM_test_1 U1 (.Data_valid(Data_valid), 
	.PAR_EN(PAR_EN), 
	.ser_done(ser_done), 
	.clk(clk), 
	.rst(rst), 
	.mux_sel({ mux_sel[1],
		mux_sel[0] }), 
	.busy(busy), 
	.ser_en(ser_en), 
	.test_si(P_data_reg[7]), 
	.test_so(n23), 
	.test_se(n28));
   MUX U2 (.mux_sel({ mux_sel[1],
		mux_sel[0] }), 
	.ser_data(ser_data), 
	.par_bit(par_bit), 
	.TX_OUT(TX_OUT));
   Parity_Calculator_test_1 U3 (.P_data({ P_data_reg[7],
		P_data_reg[6],
		P_data_reg[5],
		P_data_reg[4],
		P_data_reg[3],
		P_data_reg[2],
		P_data_reg[1],
		P_data_reg[0] }), 
	.PAR_type(PAR_type), 
	.Data_valid(Data_valid), 
	.clk(clk), 
	.rst(rst), 
	.par_bit(par_bit), 
	.test_si(n23), 
	.test_se(n36));
   Serializer_test_1 U4 (.P_data({ P_data_reg[7],
		P_data_reg[6],
		P_data_reg[5],
		P_data_reg[4],
		P_data_reg[3],
		P_data_reg[2],
		P_data_reg[1],
		P_data_reg[0] }), 
	.ser_en(ser_en), 
	.clk(clk), 
	.rst(rst), 
	.ser_done(ser_done), 
	.ser_data(ser_data), 
	.test_si(par_bit), 
	.test_se(n33));
endmodule

module FSM_RX_test_1 (
	RX_IN, 
	PAR_EN, 
	edge_count, 
	bit_count, 
	PAR_err, 
	STOP_err, 
	START_err, 
	prescale, 
	clk, 
	rst, 
	data_valid, 
	edge_bit_EN, 
	data_sample_EN, 
	deser_EN, 
	in_data_state, 
	in_start_state, 
	start_check_EN, 
	parity_check_EN, 
	stop_check_EN, 
	test_si, 
	test_se, 
	RX_CLK_M__L3_N1);
   input RX_IN;
   input PAR_EN;
   input [4:0] edge_count;
   input [3:0] bit_count;
   input PAR_err;
   input STOP_err;
   input START_err;
   input [5:0] prescale;
   input clk;
   input rst;
   output data_valid;
   output edge_bit_EN;
   output data_sample_EN;
   output deser_EN;
   output in_data_state;
   output in_start_state;
   output start_check_EN;
   output parity_check_EN;
   output stop_check_EN;
   input test_si;
   input test_se;
   input RX_CLK_M__L3_N1;

   // Internal wires
   wire N37;
   wire N38;
   wire N39;
   wire N40;
   wire N41;
   wire N42;
   wire N43;
   wire N123;
   wire n27;
   wire n28;
   wire n29;
   wire n30;
   wire n31;
   wire n32;
   wire n33;
   wire n34;
   wire n35;
   wire n36;
   wire n37;
   wire n38;
   wire n39;
   wire n1;
   wire n7;
   wire n8;
   wire n9;
   wire n10;
   wire n11;
   wire n12;
   wire n13;
   wire n14;
   wire n19;
   wire n20;
   wire n21;
   wire n22;
   wire n23;
   wire n24;
   wire n25;
   wire n26;
   wire n40;
   wire n41;
   wire n42;
   wire n43;
   wire n46;
   wire n47;
   wire n48;
   wire [2:0] current_state;
   wire [2:0] next_state;

   NAND4BX1M U22 (.Y(n31), 
	.D(bit_count[1]), 
	.C(bit_count[2]), 
	.B(bit_count[0]), 
	.AN(bit_count[3]));
   OAI21BX1M U24 (.Y(edge_bit_EN), 
	.B0N(data_sample_EN), 
	.A1(RX_IN), 
	.A0(current_state[2]));
   SDFFRQX2M \current_state_reg[0]  (.SI(test_si), 
	.SE(n47), 
	.RN(rst), 
	.Q(current_state[0]), 
	.D(next_state[0]), 
	.CK(clk));
   SDFFRQX2M data_valid_reg (.SI(current_state[2]), 
	.SE(n46), 
	.RN(rst), 
	.Q(data_valid), 
	.D(N123), 
	.CK(clk));
   BUFX2M U6 (.Y(start_check_EN), 
	.A(in_start_state));
   INVX2M U7 (.Y(n41), 
	.A(current_state[1]));
   OR2X2M U9 (.Y(n1), 
	.B(n48), 
	.A(current_state[1]));
   NAND2BX2M U10 (.Y(n7), 
	.B(n11), 
	.AN(prescale[1]));
   OR2X2M U11 (.Y(n10), 
	.B(prescale[4]), 
	.A(n9));
   CLKINVX2M U12 (.Y(n24), 
	.A(N43));
   NOR4X1M U13 (.Y(N43), 
	.D(n20), 
	.C(n21), 
	.B(n22), 
	.A(n23));
   NOR4X1M U14 (.Y(N123), 
	.D(n27), 
	.C(n24), 
	.B(PAR_err), 
	.A(STOP_err));
   OR2X2M U17 (.Y(n9), 
	.B(prescale[3]), 
	.A(n8));
   NOR2BX2M U18 (.Y(n12), 
	.B(n11), 
	.AN(edge_count[0]));
   NOR2BX2M U19 (.Y(n13), 
	.B(edge_count[0]), 
	.AN(n11));
   NOR2X2M U20 (.Y(in_start_state), 
	.B(n1), 
	.A(n40));
   NOR2X2M U21 (.Y(N42), 
	.B(prescale[5]), 
	.A(n10));
   OR2X2M U23 (.Y(n8), 
	.B(prescale[2]), 
	.A(n7));
   NAND2BX1M U25 (.Y(n35), 
	.B(N43), 
	.AN(n33));
   OAI2BB1XLM U26 (.Y(N38), 
	.B0(n8), 
	.A1N(prescale[2]), 
	.A0N(n7));
   OAI2BB1XLM U27 (.Y(N40), 
	.B0(n10), 
	.A1N(prescale[4]), 
	.A0N(n9));
   OAI2BB1XLM U28 (.Y(N39), 
	.B0(n9), 
	.A1N(prescale[3]), 
	.A0N(n8));
   NAND3X2M U29 (.Y(n33), 
	.C(current_state[1]), 
	.B(n42), 
	.A(n40));
   NOR2X2M U30 (.Y(n39), 
	.B(current_state[1]), 
	.A(current_state[0]));
   INVX2M U33 (.Y(deser_EN), 
	.A(n35));
   INVX2M U34 (.Y(in_data_state), 
	.A(n33));
   NOR2X2M U35 (.Y(n28), 
	.B(n40), 
	.A(n41));
   AND2X2M U36 (.Y(parity_check_EN), 
	.B(n42), 
	.A(n28));
   INVX2M U37 (.Y(n11), 
	.A(prescale[0]));
   OAI21BX1M U38 (.Y(next_state[1]), 
	.B0N(n34), 
	.A1(n33), 
	.A0(n32));
   NOR2X2M U39 (.Y(n32), 
	.B(n31), 
	.A(PAR_EN));
   OAI33X2M U40 (.Y(n34), 
	.B2(n24), 
	.B1(START_err), 
	.B0(n26), 
	.A2(N43), 
	.A1(current_state[2]), 
	.A0(n41));
   INVXLM U41 (.Y(n26), 
	.A(in_start_state));
   OAI31X1M U42 (.Y(next_state[2]), 
	.B0(n30), 
	.A2(n29), 
	.A1(current_state[2]), 
	.A0(n24));
   AOI31X2M U43 (.Y(n29), 
	.B0(n28), 
	.A2(n25), 
	.A1(n43), 
	.A0(current_state[1]));
   NAND4X1M U44 (.Y(n30), 
	.D(n41), 
	.C(n40), 
	.B(n24), 
	.A(current_state[2]));
   INVX2M U45 (.Y(n25), 
	.A(n31));
   OAI31X1M U46 (.Y(next_state[0]), 
	.B0(n36), 
	.A2(n35), 
	.A1(n31), 
	.A0(n43));
   AOI31X1M U47 (.Y(n36), 
	.B0(n38), 
	.A2(n37), 
	.A1(n42), 
	.A0(n24));
   OAI21X2M U48 (.Y(n37), 
	.B0(n40), 
	.A1(RX_IN), 
	.A0(current_state[1]));
   INVX2M U50 (.Y(stop_check_EN), 
	.A(n27));
   OAI21X2M U51 (.Y(data_sample_EN), 
	.B0(n27), 
	.A1(n39), 
	.A0(current_state[2]));
   CLKINVX2M U52 (.Y(n40), 
	.A(current_state[0]));
   NAND2X2M U53 (.Y(n27), 
	.B(n39), 
	.A(current_state[2]));
   INVX2M U54 (.Y(n42), 
	.A(current_state[2]));
   INVX2M U55 (.Y(n43), 
	.A(PAR_EN));
   OAI2BB1X1M U56 (.Y(N37), 
	.B0(n7), 
	.A1N(prescale[1]), 
	.A0N(prescale[0]));
   AO21XLM U57 (.Y(N41), 
	.B0(N42), 
	.A1(prescale[5]), 
	.A0(n10));
   OAI2B2X1M U58 (.Y(n19), 
	.B1(n12), 
	.B0(edge_count[1]), 
	.A1N(N37), 
	.A0(n12));
   OAI2B2X1M U59 (.Y(n14), 
	.B1(n13), 
	.B0(N37), 
	.A1N(edge_count[1]), 
	.A0(n13));
   NAND4BBX1M U60 (.Y(n23), 
	.D(n14), 
	.C(n19), 
	.BN(N41), 
	.AN(N42));
   CLKXOR2X2M U61 (.Y(n22), 
	.B(edge_count[4]), 
	.A(N40));
   CLKXOR2X2M U62 (.Y(n21), 
	.B(edge_count[2]), 
	.A(N38));
   CLKXOR2X2M U63 (.Y(n20), 
	.B(edge_count[3]), 
	.A(N39));
   DLY1X1M U64 (.Y(n46), 
	.A(test_se));
   INVXLM U66 (.Y(n48), 
	.A(n42));
   SDFFRQX4M \current_state_reg[2]  (.SI(current_state[1]), 
	.SE(n47), 
	.RN(rst), 
	.Q(current_state[2]), 
	.D(next_state[2]), 
	.CK(clk));
   SDFFRQX4M \current_state_reg[1]  (.SI(current_state[0]), 
	.SE(n46), 
	.RN(rst), 
	.Q(current_state[1]), 
	.D(next_state[1]), 
	.CK(RX_CLK_M__L3_N1));
   NOR4X1M U3 (.Y(n38), 
	.D(n24), 
	.C(RX_IN), 
	.B(current_state[0]), 
	.A(current_state[1]));
   BUFX2M U4 (.Y(n47), 
	.A(test_se));
endmodule

module Edge_Bit_Counter_test_1 (
	edge_bit_EN, 
	in_data_state, 
	in_start_state, 
	prescale, 
	clk, 
	rst, 
	edge_count, 
	bit_count, 
	test_si, 
	test_so, 
	test_se);
   input edge_bit_EN;
   input in_data_state;
   input in_start_state;
   input [5:0] prescale;
   input clk;
   input rst;
   output [4:0] edge_count;
   output [3:0] bit_count;
   input test_si;
   output test_so;
   input test_se;

   // Internal wires
   wire n64;
   wire n65;
   wire n66;
   wire n68;
   wire n82;
   wire n69;
   wire N10;
   wire N11;
   wire N12;
   wire N13;
   wire N14;
   wire N15;
   wire N17;
   wire N18;
   wire N19;
   wire N20;
   wire N27;
   wire N41;
   wire N42;
   wire N43;
   wire N44;
   wire N45;
   wire n23;
   wire n24;
   wire n25;
   wire n26;
   wire n27;
   wire n28;
   wire n29;
   wire n30;
   wire n31;
   wire n32;
   wire n33;
   wire n34;
   wire n35;
   wire n36;
   wire n37;
   wire \add_23/carry[4] ;
   wire \add_23/carry[3] ;
   wire \add_23/carry[2] ;
   wire n1;
   wire n2;
   wire n4;
   wire n15;
   wire n17;
   wire n41;
   wire n45;
   wire n46;
   wire n47;
   wire n48;
   wire n49;
   wire n50;
   wire n51;
   wire n52;
   wire n53;
   wire n54;
   wire n55;
   wire n56;
   wire n57;
   wire n58;
   wire n59;
   wire n60;
   wire n61;
   wire n62;
   wire n63;
   wire n72;
   wire n73;
   wire n74;
   wire n75;
   wire n76;
   wire n77;
   wire n78;
   wire n79;
   wire n81;

   assign test_so = n64 ;

   SDFFRX1M \bit_count_reg[3]  (.SI(n82), 
	.SE(n77), 
	.RN(rst), 
	.QN(n81), 
	.Q(bit_count[3]), 
	.D(n60), 
	.CK(clk));
   SDFFRQX2M \bit_count_reg[1]  (.SI(n69), 
	.SE(n74), 
	.RN(rst), 
	.Q(bit_count[1]), 
	.D(n36), 
	.CK(clk));
   SDFFRQX2M \bit_count_reg[2]  (.SI(bit_count[1]), 
	.SE(n73), 
	.RN(rst), 
	.Q(n82), 
	.D(n35), 
	.CK(clk));
   SDFFRQX2M \edge_count_reg[0]  (.SI(n81), 
	.SE(n75), 
	.RN(rst), 
	.Q(n68), 
	.D(N41), 
	.CK(clk));
   SDFFRQX2M \edge_count_reg[1]  (.SI(n68), 
	.SE(n79), 
	.RN(rst), 
	.Q(edge_count[1]), 
	.D(N42), 
	.CK(clk));
   SDFFRQX2M \bit_count_reg[0]  (.SI(test_si), 
	.SE(n78), 
	.RN(rst), 
	.Q(n69), 
	.D(n37), 
	.CK(clk));
   AOI21BX1M U6 (.Y(n1), 
	.B0N(n45), 
	.A1(prescale[1]), 
	.A0(prescale[0]));
   INVX2M U7 (.Y(bit_count[0]), 
	.A(n2));
   INVX2M U14 (.Y(n2), 
	.A(n69));
   NOR4BX1M U15 (.Y(n54), 
	.D(n52), 
	.C(N13), 
	.B(N14), 
	.AN(n53));
   NAND2BX2M U17 (.Y(n45), 
	.B(n49), 
	.AN(prescale[1]));
   OR2X2M U18 (.Y(n48), 
	.B(prescale[4]), 
	.A(n47));
   INVXLM U19 (.Y(n4), 
	.A(n64));
   CLKINVX2M U20 (.Y(edge_count[4]), 
	.A(n4));
   INVXLM U21 (.Y(n15), 
	.A(n65));
   CLKINVX2M U22 (.Y(edge_count[3]), 
	.A(n15));
   INVXLM U23 (.Y(n17), 
	.A(n66));
   CLKINVX2M U24 (.Y(edge_count[2]), 
	.A(n17));
   INVX2M U30 (.Y(n63), 
	.A(in_start_state));
   CLKINVX2M U31 (.Y(edge_count[0]), 
	.A(N17));
   INVX2M U32 (.Y(N17), 
	.A(n68));
   OR2X2M U33 (.Y(n47), 
	.B(prescale[3]), 
	.A(n46));
   NOR2X2M U34 (.Y(N14), 
	.B(prescale[5]), 
	.A(n48));
   CLKNAND2X2M U35 (.Y(n34), 
	.B(edge_bit_EN), 
	.A(N15));
   OR2X2M U36 (.Y(n46), 
	.B(prescale[2]), 
	.A(n45));
   OAI2BB1XLM U37 (.Y(N10), 
	.B0(n46), 
	.A1N(prescale[2]), 
	.A0N(n45));
   NOR2X2M U38 (.Y(n50), 
	.B(n49), 
	.A(N17));
   NAND4X2M U39 (.Y(N15), 
	.D(n54), 
	.C(n55), 
	.B(n56), 
	.A(n57));
   OAI2BB1XLM U40 (.Y(N12), 
	.B0(n48), 
	.A1N(prescale[4]), 
	.A0N(n47));
   OAI2BB1XLM U41 (.Y(N11), 
	.B0(n47), 
	.A1N(prescale[3]), 
	.A0N(n46));
   NOR2BX1M U42 (.Y(N41), 
	.B(n34), 
	.AN(N17));
   NOR2X1M U43 (.Y(N45), 
	.B(n34), 
	.A(n41));
   OAI21X2M U44 (.Y(n31), 
	.B0(n32), 
	.A1(n29), 
	.A0(bit_count[0]));
   INVX2M U45 (.Y(n61), 
	.A(bit_count[1]));
   NAND3X2M U48 (.Y(n33), 
	.C(in_data_state), 
	.B(n63), 
	.A(N27));
   INVX2M U49 (.Y(n59), 
	.A(n29));
   AND2X2M U50 (.Y(n26), 
	.B(N27), 
	.A(in_data_state));
   NAND2BX2M U51 (.Y(n29), 
	.B(edge_bit_EN), 
	.AN(n33));
   NAND3X2M U52 (.Y(n32), 
	.C(edge_bit_EN), 
	.B(n63), 
	.A(n33));
   NOR2BX2M U53 (.Y(N42), 
	.B(n34), 
	.AN(N18));
   NOR2BX2M U54 (.Y(N43), 
	.B(n34), 
	.AN(N19));
   NOR2BX2M U55 (.Y(N44), 
	.B(n34), 
	.AN(N20));
   NOR2X2M U56 (.Y(n27), 
	.B(n2), 
	.A(n61));
   INVX2M U57 (.Y(n49), 
	.A(prescale[0]));
   OAI32X1M U58 (.Y(n35), 
	.B1(n62), 
	.B0(n30), 
	.A2(n29), 
	.A1(n61), 
	.A0(n28));
   NAND2X2M U59 (.Y(n28), 
	.B(n62), 
	.A(bit_count[0]));
   AOI21X2M U60 (.Y(n30), 
	.B0(n31), 
	.A1(n61), 
	.A0(n59));
   INVX2M U61 (.Y(n62), 
	.A(n82));
   OAI32X1M U62 (.Y(n36), 
	.B1(n61), 
	.B0(n58), 
	.A2(n2), 
	.A1(bit_count[1]), 
	.A0(n29));
   INVX2M U63 (.Y(n58), 
	.A(n31));
   OAI22X1M U64 (.Y(n37), 
	.B1(n29), 
	.B0(bit_count[0]), 
	.A1(n32), 
	.A0(n2));
   INVX2M U65 (.Y(n60), 
	.A(n23));
   OAI2B11X2M U66 (.Y(n23), 
	.C0(n63), 
	.B0(edge_bit_EN), 
	.A1N(n24), 
	.A0(n25));
   NAND4X2M U67 (.Y(n24), 
	.D(n81), 
	.C(n26), 
	.B(n27), 
	.A(n82));
   AOI31X2M U68 (.Y(n25), 
	.B0(n81), 
	.A2(n27), 
	.A1(n26), 
	.A0(n82));
   XNOR2X2M U69 (.Y(n41), 
	.B(edge_count[4]), 
	.A(\add_23/carry[4] ));
   ADDHX1M U70 (.S(N18), 
	.CO(\add_23/carry[2] ), 
	.B(n68), 
	.A(edge_count[1]));
   ADDHX1M U71 (.S(N19), 
	.CO(\add_23/carry[3] ), 
	.B(\add_23/carry[2] ), 
	.A(edge_count[2]));
   ADDHX1M U72 (.S(N20), 
	.CO(\add_23/carry[4] ), 
	.B(\add_23/carry[3] ), 
	.A(edge_count[3]));
   AO21XLM U73 (.Y(N13), 
	.B0(N14), 
	.A1(prescale[5]), 
	.A0(n48));
   XNOR2X1M U74 (.Y(n57), 
	.B(edge_count[3]), 
	.A(N11));
   XNOR2X1M U75 (.Y(n56), 
	.B(edge_count[2]), 
	.A(N10));
   XNOR2X1M U76 (.Y(n55), 
	.B(edge_count[4]), 
	.A(N12));
   OAI22X1M U77 (.Y(n53), 
	.B1(n1), 
	.B0(n50), 
	.A1(n50), 
	.A0(edge_count[1]));
   CLKNAND2X2M U78 (.Y(n51), 
	.B(N17), 
	.A(n49));
   AOI22X1M U79 (.Y(n52), 
	.B1(edge_count[1]), 
	.B0(n51), 
	.A1(n1), 
	.A0(n51));
   CLKINVX1M U80 (.Y(N27), 
	.A(N15));
   DLY1X1M U81 (.Y(n72), 
	.A(n76));
   DLY1X1M U82 (.Y(n73), 
	.A(n78));
   DLY1X1M U83 (.Y(n74), 
	.A(n79));
   DLY1X1M U84 (.Y(n75), 
	.A(n77));
   DLY1X1M U85 (.Y(n76), 
	.A(test_se));
   DLY1X1M U86 (.Y(n77), 
	.A(n76));
   DLY1X1M U87 (.Y(n78), 
	.A(n72));
   DLY1X1M U88 (.Y(n79), 
	.A(n72));
   INVXLM U89 (.Y(bit_count[2]), 
	.A(n62));
   SDFFRQX2M \edge_count_reg[4]  (.SI(n65), 
	.SE(n75), 
	.RN(rst), 
	.Q(n64), 
	.D(N45), 
	.CK(clk));
   SDFFRQX2M \edge_count_reg[3]  (.SI(n66), 
	.SE(n73), 
	.RN(rst), 
	.Q(n65), 
	.D(N44), 
	.CK(clk));
   SDFFRQX2M \edge_count_reg[2]  (.SI(edge_count[1]), 
	.SE(n74), 
	.RN(rst), 
	.Q(n66), 
	.D(N43), 
	.CK(clk));
endmodule

module Data_Sampler_test_1 (
	RX_IN, 
	prescale, 
	edge_count, 
	data_sample_EN, 
	clk, 
	rst, 
	sampled_bit, 
	test_si, 
	test_so, 
	test_se);
   input RX_IN;
   input [5:0] prescale;
   input [4:0] edge_count;
   input data_sample_EN;
   input clk;
   input rst;
   output sampled_bit;
   input test_si;
   output test_so;
   input test_se;

   // Internal wires
   wire N11;
   wire N13;
   wire N14;
   wire N15;
   wire N17;
   wire N18;
   wire N19;
   wire N20;
   wire N21;
   wire N22;
   wire N23;
   wire N24;
   wire N25;
   wire N27;
   wire N28;
   wire N29;
   wire N30;
   wire N31;
   wire N32;
   wire n26;
   wire n27;
   wire n28;
   wire n29;
   wire n31;
   wire n32;
   wire n33;
   wire n34;
   wire n35;
   wire n36;
   wire n37;
   wire n38;
   wire n39;
   wire \add_22/carry[4] ;
   wire \add_22/carry[3] ;
   wire \add_22/carry[2] ;
   wire \sub_20/carry[4] ;
   wire \sub_20/carry[3] ;
   wire n1;
   wire n2;
   wire n3;
   wire n4;
   wire n7;
   wire n8;
   wire n9;
   wire n10;
   wire n11;
   wire n12;
   wire n13;
   wire n14;
   wire n20;
   wire n21;
   wire n22;
   wire n23;
   wire n24;
   wire n25;
   wire n30;
   wire n40;
   wire n41;
   wire n42;
   wire n43;
   wire n44;
   wire n45;
   wire n46;
   wire n47;
   wire n48;
   wire n49;
   wire n50;
   wire n51;
   wire n52;
   wire n53;
   wire n56;
   wire n57;
   wire n58;
   wire n59;
   wire n60;
   wire n61;
   wire n62;
   wire n63;
   wire n64;
   wire n65;
   wire n66;
   wire n69;
   wire n70;
   wire n71;
   wire n72;
   wire [1:0] counter;
   wire [2:0] compare;

   assign test_so = counter[1] ;
   assign N11 = prescale[1] ;

   OAI2BB1X2M U15 (.Y(sampled_bit), 
	.B0(n26), 
	.A1N(compare[1]), 
	.A0N(compare[0]));
   NOR3BX2M U21 (.Y(n28), 
	.C(counter[1]), 
	.B(n1), 
	.AN(data_sample_EN));
   SDFFRQX2M \counter_reg[0]  (.SI(compare[2]), 
	.SE(n70), 
	.RN(rst), 
	.Q(counter[0]), 
	.D(n39), 
	.CK(clk));
   SDFFRQX2M \compare_reg[2]  (.SI(compare[1]), 
	.SE(n72), 
	.RN(rst), 
	.Q(compare[2]), 
	.D(n37), 
	.CK(clk));
   SDFFRQX2M \counter_reg[1]  (.SI(counter[0]), 
	.SE(n70), 
	.RN(rst), 
	.Q(counter[1]), 
	.D(n38), 
	.CK(clk));
   SDFFRQX2M \compare_reg[1]  (.SI(compare[0]), 
	.SE(n72), 
	.RN(rst), 
	.Q(compare[1]), 
	.D(n36), 
	.CK(clk));
   SDFFRQX2M \compare_reg[0]  (.SI(test_si), 
	.SE(n71), 
	.RN(rst), 
	.Q(compare[0]), 
	.D(n35), 
	.CK(clk));
   OR2X2M U5 (.Y(n1), 
	.B(N17), 
	.A(n4));
   INVX2M U6 (.Y(N18), 
	.A(N11));
   OR2X2M U7 (.Y(n2), 
	.B(N32), 
	.A(N24));
   NOR2X2M U8 (.Y(n3), 
	.B(\sub_20/carry[4] ), 
	.A(prescale[5]));
   NOR2X1M U9 (.Y(n4), 
	.B(n2), 
	.A(N25));
   NOR2BX2M U10 (.Y(n30), 
	.B(N18), 
	.AN(edge_count[0]));
   NOR2BX2M U11 (.Y(n25), 
	.B(edge_count[0]), 
	.AN(N18));
   NOR4X1M U16 (.Y(N17), 
	.D(n21), 
	.C(n22), 
	.B(n23), 
	.A(n24));
   OR2X2M U17 (.Y(n9), 
	.B(N11), 
	.A(n7));
   NOR3X2M U19 (.Y(N23), 
	.C(n10), 
	.B(prescale[5]), 
	.A(prescale[4]));
   NOR2BX2M U20 (.Y(n46), 
	.B(edge_count[0]), 
	.AN(N11));
   NOR2BX2M U22 (.Y(n12), 
	.B(edge_count[0]), 
	.AN(N11));
   NOR2BX2M U23 (.Y(n13), 
	.B(N11), 
	.AN(edge_count[0]));
   OR2X2M U24 (.Y(n10), 
	.B(prescale[3]), 
	.A(n9));
   OAI2BB1XLM U25 (.Y(N20), 
	.B0(n10), 
	.A1N(prescale[3]), 
	.A0N(n9));
   NOR2BX2M U27 (.Y(n47), 
	.B(N11), 
	.AN(edge_count[0]));
   XOR2X1M U28 (.Y(n53), 
	.B(edge_count[2]), 
	.A(prescale[3]));
   XOR2X1M U29 (.Y(n51), 
	.B(edge_count[3]), 
	.A(prescale[4]));
   XOR2X1M U30 (.Y(n50), 
	.B(edge_count[4]), 
	.A(prescale[5]));
   NAND2XLM U31 (.Y(n32), 
	.B(n65), 
	.A(n63));
   AOI21X1M U32 (.Y(n34), 
	.B0(n33), 
	.A1(n64), 
	.A0(n63));
   INVXLM U33 (.Y(n62), 
	.A(n33));
   CLKINVX2M U34 (.Y(n7), 
	.A(n8));
   INVX2M U35 (.Y(n8), 
	.A(prescale[2]));
   CLKINVX2M U38 (.Y(n63), 
	.A(n1));
   OAI21X2M U39 (.Y(n33), 
	.B0(data_sample_EN), 
	.A1(N17), 
	.A0(n63));
   INVX2M U40 (.Y(n66), 
	.A(RX_IN));
   OAI32X1M U41 (.Y(n38), 
	.B1(n65), 
	.B0(n34), 
	.A2(n33), 
	.A1(n64), 
	.A0(n32));
   INVX2M U42 (.Y(n65), 
	.A(counter[1]));
   OAI32X1M U43 (.Y(n39), 
	.B1(n64), 
	.B0(n62), 
	.A2(n1), 
	.A1(counter[0]), 
	.A0(n33));
   OAI2BB2X1M U44 (.Y(n35), 
	.B1(n66), 
	.B0(n27), 
	.A1N(compare[0]), 
	.A0N(n27));
   NAND2X2M U45 (.Y(n27), 
	.B(n64), 
	.A(n28));
   OAI2BB2X1M U46 (.Y(n36), 
	.B1(n29), 
	.B0(n66), 
	.A1N(compare[1]), 
	.A0N(n29));
   NAND2X1M U47 (.Y(n29), 
	.B(n28), 
	.A(counter[0]));
   OAI2BB2X1M U48 (.Y(n37), 
	.B1(n31), 
	.B0(n66), 
	.A1N(compare[2]), 
	.A0N(n31));
   NAND4X2M U49 (.Y(n31), 
	.D(n64), 
	.C(n63), 
	.B(data_sample_EN), 
	.A(counter[1]));
   ADDHX1M U50 (.S(N27), 
	.CO(\add_22/carry[2] ), 
	.B(N11), 
	.A(n7));
   ADDHX1M U51 (.S(N29), 
	.CO(\add_22/carry[4] ), 
	.B(\add_22/carry[3] ), 
	.A(prescale[4]));
   ADDHX1M U52 (.S(N28), 
	.CO(\add_22/carry[3] ), 
	.B(\add_22/carry[2] ), 
	.A(prescale[3]));
   ADDHX1M U53 (.S(N30), 
	.CO(N31), 
	.B(\add_22/carry[4] ), 
	.A(prescale[5]));
   OAI21X2M U54 (.Y(n26), 
	.B0(compare[2]), 
	.A1(compare[1]), 
	.A0(compare[0]));
   CLKINVX2M U55 (.Y(n64), 
	.A(counter[0]));
   XNOR2X1M U56 (.Y(N15), 
	.B(prescale[5]), 
	.A(\sub_20/carry[4] ));
   OR2X1M U57 (.Y(\sub_20/carry[4] ), 
	.B(\sub_20/carry[3] ), 
	.A(prescale[4]));
   XNOR2X1M U58 (.Y(N14), 
	.B(prescale[4]), 
	.A(\sub_20/carry[3] ));
   OR2X1M U59 (.Y(\sub_20/carry[3] ), 
	.B(n7), 
	.A(prescale[3]));
   XNOR2X1M U60 (.Y(N13), 
	.B(prescale[3]), 
	.A(n7));
   OAI2BB1X1M U61 (.Y(N19), 
	.B0(n9), 
	.A1N(n7), 
	.A0N(N11));
   XNOR2X1M U62 (.Y(N21), 
	.B(n10), 
	.A(prescale[4]));
   OAI21X1M U63 (.Y(n11), 
	.B0(prescale[5]), 
	.A1(n10), 
	.A0(prescale[4]));
   NAND2BX1M U64 (.Y(N22), 
	.B(n11), 
	.AN(N23));
   OAI2B2X1M U65 (.Y(n20), 
	.B1(n12), 
	.B0(n8), 
	.A1N(edge_count[1]), 
	.A0(n12));
   OAI2B2X1M U66 (.Y(n14), 
	.B1(n13), 
	.B0(edge_count[1]), 
	.A1N(n8), 
	.A0(n13));
   NAND3BX1M U67 (.Y(n24), 
	.C(n14), 
	.B(n20), 
	.AN(n3));
   CLKXOR2X2M U68 (.Y(n23), 
	.B(edge_count[4]), 
	.A(N15));
   CLKXOR2X2M U69 (.Y(n22), 
	.B(edge_count[2]), 
	.A(N13));
   CLKXOR2X2M U70 (.Y(n21), 
	.B(edge_count[3]), 
	.A(N14));
   OAI2B2X1M U71 (.Y(n41), 
	.B1(n25), 
	.B0(N19), 
	.A1N(edge_count[1]), 
	.A0(n25));
   OAI2B2X1M U72 (.Y(n40), 
	.B1(n30), 
	.B0(edge_count[1]), 
	.A1N(N19), 
	.A0(n30));
   NAND3BX1M U73 (.Y(n45), 
	.C(n40), 
	.B(n41), 
	.AN(N23));
   CLKXOR2X2M U74 (.Y(n44), 
	.B(edge_count[4]), 
	.A(N22));
   CLKXOR2X2M U75 (.Y(n43), 
	.B(edge_count[2]), 
	.A(N20));
   CLKXOR2X2M U76 (.Y(n42), 
	.B(edge_count[3]), 
	.A(N21));
   NOR4X1M U77 (.Y(N24), 
	.D(n42), 
	.C(n43), 
	.B(n44), 
	.A(n45));
   OAI2B2X1M U78 (.Y(n49), 
	.B1(n46), 
	.B0(n7), 
	.A1N(edge_count[1]), 
	.A0(n46));
   OAI2B2X1M U79 (.Y(n48), 
	.B1(n47), 
	.B0(edge_count[1]), 
	.A1N(n7), 
	.A0(n47));
   CLKNAND2X2M U80 (.Y(n52), 
	.B(n48), 
	.A(n49));
   NOR4X1M U81 (.Y(N25), 
	.D(n50), 
	.C(n51), 
	.B(n52), 
	.A(n53));
   OAI2B2X1M U82 (.Y(n57), 
	.B1(n25), 
	.B0(N27), 
	.A1N(edge_count[1]), 
	.A0(n25));
   OAI2B2X1M U83 (.Y(n56), 
	.B1(n30), 
	.B0(edge_count[1]), 
	.A1N(N27), 
	.A0(n30));
   NAND3BX1M U84 (.Y(n61), 
	.C(n56), 
	.B(n57), 
	.AN(N31));
   CLKXOR2X2M U85 (.Y(n60), 
	.B(edge_count[4]), 
	.A(N30));
   CLKXOR2X2M U86 (.Y(n59), 
	.B(edge_count[2]), 
	.A(N28));
   CLKXOR2X2M U87 (.Y(n58), 
	.B(edge_count[3]), 
	.A(N29));
   NOR4X1M U88 (.Y(N32), 
	.D(n58), 
	.C(n59), 
	.B(n60), 
	.A(n61));
   DLY1X1M U89 (.Y(n69), 
	.A(test_se));
   DLY1X1M U90 (.Y(n70), 
	.A(n71));
   DLY1X1M U91 (.Y(n71), 
	.A(n69));
   DLY1X1M U92 (.Y(n72), 
	.A(n69));
endmodule

module Deserializer_test_1 (
	sampled_bit, 
	deser_EN, 
	in_start_state, 
	clk, 
	rst, 
	P_DATA, 
	test_si, 
	test_so, 
	test_se);
   input sampled_bit;
   input deser_EN;
   input in_start_state;
   input clk;
   input rst;
   output [7:0] P_DATA;
   input test_si;
   output test_so;
   input test_se;

   // Internal wires
   wire n19;
   wire n20;
   wire n21;
   wire n22;
   wire n23;
   wire n24;
   wire n25;
   wire n26;
   wire n27;
   wire n28;
   wire n29;
   wire n30;
   wire n31;
   wire n32;
   wire n33;
   wire n34;
   wire n35;
   wire n36;
   wire n37;
   wire n38;
   wire n39;
   wire n40;
   wire n41;
   wire n42;
   wire n43;
   wire n44;
   wire n45;
   wire n46;
   wire n47;
   wire n48;
   wire n14;
   wire n15;
   wire n16;
   wire n17;
   wire n18;
   wire n49;
   wire n50;
   wire n53;
   wire n54;
   wire n55;
   wire n56;
   wire n57;
   wire n58;
   wire n59;
   wire n60;
   wire n61;
   wire n62;
   wire n63;
   wire [2:0] counter;

   assign test_so = counter[2] ;

   SDFFRQX2M \counter_reg[1]  (.SI(counter[0]), 
	.SE(n56), 
	.RN(rst), 
	.Q(counter[1]), 
	.D(n47), 
	.CK(clk));
   SDFFRQX2M \counter_reg[2]  (.SI(counter[1]), 
	.SE(n55), 
	.RN(rst), 
	.Q(counter[2]), 
	.D(n46), 
	.CK(clk));
   SDFFRQX2M \P_DATA_reg[5]  (.SI(P_DATA[4]), 
	.SE(n59), 
	.RN(rst), 
	.Q(P_DATA[5]), 
	.D(n43), 
	.CK(clk));
   SDFFRQX2M \P_DATA_reg[1]  (.SI(P_DATA[0]), 
	.SE(n62), 
	.RN(rst), 
	.Q(P_DATA[1]), 
	.D(n39), 
	.CK(clk));
   SDFFRQX2M \P_DATA_reg[4]  (.SI(P_DATA[3]), 
	.SE(n61), 
	.RN(rst), 
	.Q(P_DATA[4]), 
	.D(n42), 
	.CK(clk));
   SDFFRQX2M \P_DATA_reg[0]  (.SI(test_si), 
	.SE(n55), 
	.RN(rst), 
	.Q(P_DATA[0]), 
	.D(n38), 
	.CK(clk));
   SDFFRQX2M \P_DATA_reg[7]  (.SI(P_DATA[6]), 
	.SE(n56), 
	.RN(rst), 
	.Q(P_DATA[7]), 
	.D(n45), 
	.CK(clk));
   SDFFRQX2M \P_DATA_reg[3]  (.SI(P_DATA[2]), 
	.SE(n62), 
	.RN(rst), 
	.Q(P_DATA[3]), 
	.D(n41), 
	.CK(clk));
   SDFFRQX2M \P_DATA_reg[6]  (.SI(P_DATA[5]), 
	.SE(n59), 
	.RN(rst), 
	.Q(P_DATA[6]), 
	.D(n44), 
	.CK(clk));
   SDFFRQX2M \P_DATA_reg[2]  (.SI(P_DATA[1]), 
	.SE(n60), 
	.RN(rst), 
	.Q(P_DATA[2]), 
	.D(n40), 
	.CK(clk));
   SDFFRQX2M \counter_reg[0]  (.SI(P_DATA[7]), 
	.SE(n61), 
	.RN(rst), 
	.Q(counter[0]), 
	.D(n48), 
	.CK(clk));
   CLKINVX1M U14 (.Y(n50), 
	.A(in_start_state));
   NOR2X2M U15 (.Y(n34), 
	.B(n36), 
	.A(n18));
   NOR2X2M U16 (.Y(n28), 
	.B(counter[2]), 
	.A(n36));
   CLKNAND2X2M U19 (.Y(n36), 
	.B(n50), 
	.A(deser_EN));
   CLKINVX2M U20 (.Y(n17), 
	.A(n34));
   NAND2X2M U21 (.Y(n35), 
	.B(n36), 
	.A(n50));
   OAI222X1M U22 (.Y(n46), 
	.C1(n35), 
	.C0(n18), 
	.B1(n26), 
	.B0(n49), 
	.A1(n17), 
	.A0(n15));
   INVX2M U23 (.Y(n15), 
	.A(n26));
   NAND2X2M U24 (.Y(n20), 
	.B(n28), 
	.A(sampled_bit));
   NAND2X2M U25 (.Y(n29), 
	.B(sampled_bit), 
	.A(n34));
   CLKINVX2M U26 (.Y(n49), 
	.A(n28));
   OAI21X2M U27 (.Y(n47), 
	.B0(n37), 
	.A1(n35), 
	.A0(n16));
   AO21XLM U28 (.Y(n37), 
	.B0(n36), 
	.A1(n24), 
	.A0(n22));
   NAND2X2M U29 (.Y(n19), 
	.B(n14), 
	.A(n16));
   OAI21X2M U30 (.Y(n45), 
	.B0(n33), 
	.A1(n29), 
	.A0(n26));
   OAI21X2M U31 (.Y(n33), 
	.B0(P_DATA[7]), 
	.A1(n17), 
	.A0(n26));
   OAI21X2M U32 (.Y(n39), 
	.B0(n23), 
	.A1(n22), 
	.A0(n20));
   OAI21X2M U33 (.Y(n23), 
	.B0(P_DATA[1]), 
	.A1(n22), 
	.A0(n49));
   OAI21X2M U34 (.Y(n40), 
	.B0(n25), 
	.A1(n24), 
	.A0(n20));
   OAI21X2M U35 (.Y(n25), 
	.B0(P_DATA[2]), 
	.A1(n24), 
	.A0(n49));
   OAI21X2M U36 (.Y(n41), 
	.B0(n27), 
	.A1(n26), 
	.A0(n20));
   OAI21X2M U37 (.Y(n27), 
	.B0(P_DATA[3]), 
	.A1(n26), 
	.A0(n49));
   OAI21X2M U38 (.Y(n38), 
	.B0(n21), 
	.A1(n20), 
	.A0(n19));
   OAI21X2M U39 (.Y(n21), 
	.B0(P_DATA[0]), 
	.A1(n19), 
	.A0(n49));
   OAI21X2M U40 (.Y(n42), 
	.B0(n30), 
	.A1(n29), 
	.A0(n19));
   OAI21X2M U41 (.Y(n30), 
	.B0(P_DATA[4]), 
	.A1(n17), 
	.A0(n19));
   OAI21X2M U42 (.Y(n43), 
	.B0(n31), 
	.A1(n29), 
	.A0(n22));
   OAI21X2M U43 (.Y(n31), 
	.B0(P_DATA[5]), 
	.A1(n17), 
	.A0(n22));
   OAI21X2M U44 (.Y(n44), 
	.B0(n32), 
	.A1(n29), 
	.A0(n24));
   OAI21X2M U45 (.Y(n32), 
	.B0(P_DATA[6]), 
	.A1(n17), 
	.A0(n24));
   OAI22X1M U46 (.Y(n48), 
	.B1(n36), 
	.B0(counter[0]), 
	.A1(n35), 
	.A0(n14));
   CLKNAND2X2M U47 (.Y(n26), 
	.B(n63), 
	.A(counter[1]));
   INVX2M U48 (.Y(n18), 
	.A(counter[2]));
   CLKNAND2X2M U49 (.Y(n22), 
	.B(n16), 
	.A(counter[0]));
   CLKNAND2X2M U50 (.Y(n24), 
	.B(n14), 
	.A(counter[1]));
   INVX2M U51 (.Y(n14), 
	.A(counter[0]));
   INVX2M U52 (.Y(n16), 
	.A(counter[1]));
   DLY1X1M U53 (.Y(n53), 
	.A(n57));
   DLY1X1M U54 (.Y(n54), 
	.A(test_se));
   DLY1X1M U55 (.Y(n55), 
	.A(n60));
   DLY1X1M U56 (.Y(n56), 
	.A(n57));
   DLY1X1M U57 (.Y(n57), 
	.A(n54));
   DLY1X1M U58 (.Y(n58), 
	.A(n54));
   DLY1X1M U59 (.Y(n59), 
	.A(n53));
   DLY1X1M U60 (.Y(n60), 
	.A(n58));
   DLY1X1M U61 (.Y(n61), 
	.A(n53));
   DLY1X1M U62 (.Y(n62), 
	.A(n58));
   INVXLM U63 (.Y(n63), 
	.A(n14));
endmodule

module Start_Checker_test_1 (
	sampled_bit, 
	start_check_EN, 
	in_start_state, 
	prescale, 
	edge_count, 
	clk, 
	rst, 
	START_err, 
	test_si, 
	test_se);
   input sampled_bit;
   input start_check_EN;
   input in_start_state;
   input [5:0] prescale;
   input [4:0] edge_count;
   input clk;
   input rst;
   output START_err;
   input test_si;
   input test_se;

   // Internal wires
   wire N4;
   wire N5;
   wire N6;
   wire N7;
   wire N8;
   wire N9;
   wire N10;
   wire n8;
   wire n9;
   wire n10;
   wire n11;
   wire n1;
   wire n2;
   wire n3;
   wire n4;
   wire n6;
   wire n7;
   wire n12;
   wire n13;
   wire n14;
   wire n15;
   wire n16;
   wire n17;
   wire n18;
   wire n19;
   wire n20;

   SDFFRQX2M START_err_reg (.SI(test_si), 
	.SE(test_se), 
	.RN(rst), 
	.Q(START_err), 
	.D(n19), 
	.CK(clk));
   NAND2BX2M U4 (.Y(n1), 
	.B(n6), 
	.AN(prescale[1]));
   OR2X2M U5 (.Y(n4), 
	.B(prescale[4]), 
	.A(n3));
   OR2X2M U6 (.Y(n3), 
	.B(prescale[3]), 
	.A(n2));
   NOR2BX2M U7 (.Y(n12), 
	.B(edge_count[0]), 
	.AN(n6));
   NOR2X2M U8 (.Y(N9), 
	.B(prescale[5]), 
	.A(n4));
   NOR2BX2M U9 (.Y(n7), 
	.B(n6), 
	.AN(edge_count[0]));
   OR2X2M U10 (.Y(n2), 
	.B(prescale[2]), 
	.A(n1));
   OAI2BB1XLM U11 (.Y(N5), 
	.B0(n2), 
	.A1N(prescale[2]), 
	.A0N(n1));
   OAI2BB1XLM U12 (.Y(N7), 
	.B0(n4), 
	.A1N(prescale[4]), 
	.A0N(n3));
   OAI2BB1XLM U13 (.Y(N6), 
	.B0(n3), 
	.A1N(prescale[3]), 
	.A0N(n2));
   INVX2M U14 (.Y(n6), 
	.A(prescale[0]));
   INVX2M U15 (.Y(n19), 
	.A(n8));
   AOI32X1M U16 (.Y(n8), 
	.B1(n20), 
	.B0(START_err), 
	.A2(sampled_bit), 
	.A1(n10), 
	.A0(n9));
   INVX2M U17 (.Y(n20), 
	.A(n9));
   OAI2BB1X2M U18 (.Y(n9), 
	.B0(n10), 
	.A1N(N10), 
	.A0N(start_check_EN));
   NAND4BBX1M U19 (.Y(n10), 
	.D(n11), 
	.C(in_start_state), 
	.BN(edge_count[0]), 
	.AN(edge_count[1]));
   NOR3X2M U20 (.Y(n11), 
	.C(edge_count[3]), 
	.B(edge_count[4]), 
	.A(edge_count[2]));
   OAI2BB1X1M U21 (.Y(N4), 
	.B0(n1), 
	.A1N(prescale[1]), 
	.A0N(prescale[0]));
   AO21XLM U22 (.Y(N8), 
	.B0(N9), 
	.A1(prescale[5]), 
	.A0(n4));
   OAI2B2X1M U23 (.Y(n14), 
	.B1(n7), 
	.B0(edge_count[1]), 
	.A1N(N4), 
	.A0(n7));
   OAI2B2X1M U24 (.Y(n13), 
	.B1(n12), 
	.B0(N4), 
	.A1N(edge_count[1]), 
	.A0(n12));
   NAND4BBX1M U25 (.Y(n18), 
	.D(n13), 
	.C(n14), 
	.BN(N8), 
	.AN(N9));
   CLKXOR2X2M U26 (.Y(n17), 
	.B(edge_count[4]), 
	.A(N7));
   CLKXOR2X2M U27 (.Y(n16), 
	.B(edge_count[2]), 
	.A(N5));
   CLKXOR2X2M U28 (.Y(n15), 
	.B(edge_count[3]), 
	.A(N6));
   NOR4X1M U29 (.Y(N10), 
	.D(n15), 
	.C(n16), 
	.B(n17), 
	.A(n18));
endmodule

module Parity_Checker_test_1 (
	sampled_bit, 
	parity_check_EN, 
	PAR_TYPE, 
	P_DATA, 
	in_start_state, 
	prescale, 
	edge_count, 
	clk, 
	rst, 
	PAR_err, 
	test_si, 
	test_se);
   input sampled_bit;
   input parity_check_EN;
   input PAR_TYPE;
   input [7:0] P_DATA;
   input in_start_state;
   input [5:0] prescale;
   input [4:0] edge_count;
   input clk;
   input rst;
   output PAR_err;
   input test_si;
   input test_se;

   // Internal wires
   wire N2;
   wire N4;
   wire N5;
   wire N6;
   wire N7;
   wire N8;
   wire n8;
   wire n9;
   wire n10;
   wire n11;
   wire n12;
   wire n13;
   wire n14;
   wire n15;
   wire n16;
   wire \add_19/carry[4] ;
   wire \add_19/carry[3] ;
   wire n2;
   wire n3;
   wire n4;
   wire n5;
   wire n6;
   wire n17;
   wire n18;
   wire n19;
   wire n20;
   wire n21;
   wire n22;
   wire n23;

   assign N2 = prescale[1] ;

   CLKXOR2X2M U4 (.Y(N4), 
	.B(prescale[2]), 
	.A(prescale[3]));
   CLKXOR2X2M U5 (.Y(N6), 
	.B(\add_19/carry[4] ), 
	.A(prescale[5]));
   OAI31X1M U7 (.Y(n16), 
	.B0(n10), 
	.A2(n9), 
	.A1(in_start_state), 
	.A0(n8));
   AOI221XLM U8 (.Y(n6), 
	.C0(n5), 
	.B1(n20), 
	.B0(N5), 
	.A1(n21), 
	.A0(N6));
   AOI221XLM U9 (.Y(n5), 
	.C0(n4), 
	.B1(n22), 
	.B0(edge_count[2]), 
	.A1(n23), 
	.A0(edge_count[3]));
   AOI222X1M U10 (.Y(n4), 
	.C1(n18), 
	.C0(n2), 
	.B1(N2), 
	.B0(n3), 
	.A1(n19), 
	.A0(N4));
   INVX2M U11 (.Y(n2), 
	.A(prescale[2]));
   INVX2M U12 (.Y(n22), 
	.A(N4));
   INVX2M U13 (.Y(n23), 
	.A(N5));
   XOR3XLM U14 (.Y(n8), 
	.C(n13), 
	.B(n12), 
	.A(n11));
   NAND2X2M U15 (.Y(n10), 
	.B(n9), 
	.A(PAR_err));
   AOI21X2M U16 (.Y(n9), 
	.B0(in_start_state), 
	.A1(N8), 
	.A0(parity_check_EN));
   CLKINVX1M U17 (.Y(n18), 
	.A(edge_count[1]));
   INVX2M U18 (.Y(n19), 
	.A(edge_count[2]));
   INVX2M U19 (.Y(n21), 
	.A(edge_count[4]));
   INVX2M U20 (.Y(n20), 
	.A(edge_count[3]));
   XNOR2X2M U21 (.Y(n13), 
	.B(PAR_TYPE), 
	.A(sampled_bit));
   XOR3XLM U22 (.Y(n12), 
	.C(n14), 
	.B(P_DATA[4]), 
	.A(P_DATA[5]));
   XNOR2X2M U23 (.Y(n14), 
	.B(P_DATA[6]), 
	.A(P_DATA[7]));
   XOR3XLM U24 (.Y(n11), 
	.C(n15), 
	.B(P_DATA[0]), 
	.A(P_DATA[1]));
   XNOR2X2M U25 (.Y(n15), 
	.B(P_DATA[2]), 
	.A(P_DATA[3]));
   AND2X1M U26 (.Y(N7), 
	.B(prescale[5]), 
	.A(\add_19/carry[4] ));
   AND2X1M U27 (.Y(\add_19/carry[4] ), 
	.B(prescale[4]), 
	.A(\add_19/carry[3] ));
   CLKXOR2X2M U28 (.Y(N5), 
	.B(\add_19/carry[3] ), 
	.A(prescale[4]));
   AND2X1M U29 (.Y(\add_19/carry[3] ), 
	.B(prescale[3]), 
	.A(prescale[2]));
   AOI2BB1X1M U30 (.Y(n3), 
	.B0(edge_count[0]), 
	.A1N(n18), 
	.A0N(n2));
   AOI2BB1X1M U31 (.Y(n17), 
	.B0(n6), 
	.A1N(n21), 
	.A0N(N6));
   NOR2X1M U32 (.Y(N8), 
	.B(n17), 
	.A(N7));
   SDFFRQX4M PAR_err_reg (.SI(test_si), 
	.SE(test_se), 
	.RN(rst), 
	.Q(PAR_err), 
	.D(n16), 
	.CK(clk));
endmodule

module Stop_Checker_test_1 (
	sampled_bit, 
	stop_check_EN, 
	in_start_state, 
	prescale, 
	edge_count, 
	clk, 
	rst, 
	STOP_err, 
	test_si, 
	test_se);
   input sampled_bit;
   input stop_check_EN;
   input in_start_state;
   input [5:0] prescale;
   input [4:0] edge_count;
   input clk;
   input rst;
   output STOP_err;
   input test_si;
   input test_se;

   // Internal wires
   wire N2;
   wire N4;
   wire N5;
   wire N6;
   wire N7;
   wire N8;
   wire n8;
   wire n9;
   wire n10;
   wire \add_17/carry[4] ;
   wire \add_17/carry[3] ;
   wire n2;
   wire n4;
   wire n5;
   wire n6;
   wire n11;
   wire n12;
   wire n13;
   wire n14;
   wire n15;
   wire n16;
   wire n17;
   wire n18;

   assign N2 = prescale[1] ;

   CLKXOR2X2M U4 (.Y(N4), 
	.B(prescale[2]), 
	.A(prescale[3]));
   CLKXOR2X2M U5 (.Y(N6), 
	.B(\add_17/carry[4] ), 
	.A(prescale[5]));
   AOI221XLM U7 (.Y(n11), 
	.C0(n6), 
	.B1(n15), 
	.B0(N5), 
	.A1(n16), 
	.A0(N6));
   AOI221XLM U8 (.Y(n6), 
	.C0(n5), 
	.B1(n17), 
	.B0(edge_count[2]), 
	.A1(n18), 
	.A0(edge_count[3]));
   AOI222X1M U9 (.Y(n5), 
	.C1(n13), 
	.C0(n2), 
	.B1(N2), 
	.B0(n4), 
	.A1(n14), 
	.A0(N4));
   INVX2M U10 (.Y(n2), 
	.A(prescale[2]));
   INVX2M U12 (.Y(n17), 
	.A(N4));
   INVX2M U13 (.Y(n18), 
	.A(N5));
   CLKINVX1M U14 (.Y(n13), 
	.A(edge_count[1]));
   NOR2X1M U15 (.Y(n10), 
	.B(n8), 
	.A(in_start_state));
   AOI2BB2XLM U16 (.Y(n8), 
	.B1(STOP_err), 
	.B0(n9), 
	.A1N(n9), 
	.A0N(sampled_bit));
   NAND2X2M U17 (.Y(n9), 
	.B(N8), 
	.A(stop_check_EN));
   INVX2M U18 (.Y(n14), 
	.A(edge_count[2]));
   INVX2M U19 (.Y(n16), 
	.A(edge_count[4]));
   INVX2M U20 (.Y(n15), 
	.A(edge_count[3]));
   AND2X1M U21 (.Y(N7), 
	.B(prescale[5]), 
	.A(\add_17/carry[4] ));
   AND2X1M U22 (.Y(\add_17/carry[4] ), 
	.B(prescale[4]), 
	.A(\add_17/carry[3] ));
   CLKXOR2X2M U23 (.Y(N5), 
	.B(\add_17/carry[3] ), 
	.A(prescale[4]));
   AND2X1M U24 (.Y(\add_17/carry[3] ), 
	.B(prescale[3]), 
	.A(prescale[2]));
   AOI2BB1X1M U25 (.Y(n4), 
	.B0(edge_count[0]), 
	.A1N(n13), 
	.A0N(n2));
   AOI2BB1X1M U26 (.Y(n12), 
	.B0(n11), 
	.A1N(n16), 
	.A0N(N6));
   NOR2X1M U27 (.Y(N8), 
	.B(n12), 
	.A(N7));
   SDFFRQX4M STOP_err_reg (.SI(test_si), 
	.SE(test_se), 
	.RN(rst), 
	.Q(STOP_err), 
	.D(n10), 
	.CK(clk));
endmodule

module UART_RX_top_test_1 (
	RX_IN, 
	prescale, 
	PAR_EN, 
	PAR_TYPE, 
	clk, 
	rst, 
	PAR_err, 
	STOP_err, 
	data_valid, 
	P_DATA, 
	test_si2, 
	test_si1, 
	test_se, 
	RX_CLK_M__L3_N1);
   input RX_IN;
   input [5:0] prescale;
   input PAR_EN;
   input PAR_TYPE;
   input clk;
   input rst;
   output PAR_err;
   output STOP_err;
   output data_valid;
   output [7:0] P_DATA;
   input test_si2;
   input test_si1;
   input test_se;
   input RX_CLK_M__L3_N1;

   // Internal wires
   wire START_err;
   wire edge_bit_EN;
   wire data_sample_EN;
   wire deser_EN;
   wire in_data_state;
   wire in_start_state;
   wire start_check_EN;
   wire parity_check_EN;
   wire stop_check_EN;
   wire sampled_bit;
   wire n6;
   wire n7;
   wire n8;
   wire n13;
   wire n14;
   wire n15;
   wire n16;
   wire n17;
   wire n18;
   wire n19;
   wire [4:0] edge_count;
   wire [3:0] bit_count;

   DLY1X1M U13 (.Y(n13), 
	.A(test_se));
   DLY1X1M U14 (.Y(n14), 
	.A(n13));
   DLY1X1M U15 (.Y(n15), 
	.A(n13));
   DLY1X1M U16 (.Y(n16), 
	.A(n15));
   DLY1X1M U17 (.Y(n17), 
	.A(n14));
   DLY1X1M U19 (.Y(n19), 
	.A(n15));
   FSM_RX_test_1 U0 (.RX_IN(RX_IN), 
	.PAR_EN(PAR_EN), 
	.edge_count({ edge_count[4],
		edge_count[3],
		edge_count[2],
		edge_count[1],
		edge_count[0] }), 
	.bit_count({ bit_count[3],
		bit_count[2],
		bit_count[1],
		bit_count[0] }), 
	.PAR_err(PAR_err), 
	.STOP_err(STOP_err), 
	.START_err(START_err), 
	.prescale({ prescale[5],
		prescale[4],
		prescale[3],
		prescale[2],
		prescale[1],
		prescale[0] }), 
	.clk(clk), 
	.rst(rst), 
	.data_valid(data_valid), 
	.edge_bit_EN(edge_bit_EN), 
	.data_sample_EN(data_sample_EN), 
	.deser_EN(deser_EN), 
	.in_data_state(in_data_state), 
	.in_start_state(in_start_state), 
	.start_check_EN(start_check_EN), 
	.parity_check_EN(parity_check_EN), 
	.stop_check_EN(stop_check_EN), 
	.test_si(test_si1), 
	.test_se(n19), 
	.RX_CLK_M__L3_N1(RX_CLK_M__L3_N1));
   Edge_Bit_Counter_test_1 U1 (.edge_bit_EN(edge_bit_EN), 
	.in_data_state(in_data_state), 
	.in_start_state(in_start_state), 
	.prescale({ prescale[5],
		prescale[4],
		prescale[3],
		prescale[2],
		prescale[1],
		prescale[0] }), 
	.clk(RX_CLK_M__L3_N1), 
	.rst(rst), 
	.edge_count({ edge_count[4],
		edge_count[3],
		edge_count[2],
		edge_count[1],
		edge_count[0] }), 
	.bit_count({ bit_count[3],
		bit_count[2],
		bit_count[1],
		bit_count[0] }), 
	.test_si(data_valid), 
	.test_so(n8), 
	.test_se(n16));
   Data_Sampler_test_1 U2 (.RX_IN(RX_IN), 
	.prescale({ prescale[5],
		prescale[4],
		prescale[3],
		prescale[2],
		prescale[1],
		prescale[0] }), 
	.edge_count({ edge_count[4],
		edge_count[3],
		edge_count[2],
		edge_count[1],
		edge_count[0] }), 
	.data_sample_EN(data_sample_EN), 
	.clk(RX_CLK_M__L3_N1), 
	.rst(rst), 
	.sampled_bit(sampled_bit), 
	.test_si(n8), 
	.test_so(n7), 
	.test_se(n18));
   Deserializer_test_1 U3 (.sampled_bit(sampled_bit), 
	.deser_EN(deser_EN), 
	.in_start_state(in_start_state), 
	.clk(clk), 
	.rst(rst), 
	.P_DATA({ P_DATA[7],
		P_DATA[6],
		P_DATA[5],
		P_DATA[4],
		P_DATA[3],
		P_DATA[2],
		P_DATA[1],
		P_DATA[0] }), 
	.test_si(n7), 
	.test_so(n6), 
	.test_se(n17));
   Start_Checker_test_1 U4 (.sampled_bit(sampled_bit), 
	.start_check_EN(start_check_EN), 
	.in_start_state(in_start_state), 
	.prescale({ prescale[5],
		prescale[4],
		prescale[3],
		prescale[2],
		prescale[1],
		prescale[0] }), 
	.edge_count({ edge_count[4],
		edge_count[3],
		edge_count[2],
		edge_count[1],
		edge_count[0] }), 
	.clk(RX_CLK_M__L3_N1), 
	.rst(rst), 
	.START_err(START_err), 
	.test_si(n6), 
	.test_se(n16));
   Parity_Checker_test_1 U5 (.sampled_bit(sampled_bit), 
	.parity_check_EN(parity_check_EN), 
	.PAR_TYPE(PAR_TYPE), 
	.P_DATA({ P_DATA[7],
		P_DATA[6],
		P_DATA[5],
		P_DATA[4],
		P_DATA[3],
		P_DATA[2],
		P_DATA[1],
		P_DATA[0] }), 
	.in_start_state(in_start_state), 
	.prescale({ prescale[5],
		prescale[4],
		prescale[3],
		prescale[2],
		prescale[1],
		prescale[0] }), 
	.edge_count({ edge_count[4],
		edge_count[3],
		edge_count[2],
		edge_count[1],
		edge_count[0] }), 
	.clk(clk), 
	.rst(rst), 
	.PAR_err(PAR_err), 
	.test_si(START_err), 
	.test_se(n18));
   Stop_Checker_test_1 U6 (.sampled_bit(sampled_bit), 
	.stop_check_EN(stop_check_EN), 
	.in_start_state(in_start_state), 
	.prescale({ prescale[5],
		prescale[4],
		prescale[3],
		prescale[2],
		prescale[1],
		prescale[0] }), 
	.edge_count({ edge_count[4],
		edge_count[3],
		edge_count[2],
		edge_count[1],
		edge_count[0] }), 
	.clk(clk), 
	.rst(rst), 
	.STOP_err(STOP_err), 
	.test_si(test_si2), 
	.test_se(n17));
   BUFX2M U18 (.Y(n18), 
	.A(n14));
endmodule

module UART_TOP_test_1 (
	rst, 
	PAR_EN, 
	PAR_type, 
	TX_P_data, 
	TX_Data_valid, 
	TX_CLK, 
	TX_OUT, 
	TX_busy, 
	RX_IN, 
	prescale, 
	RX_CLK, 
	RX_data_valid, 
	PAR_err, 
	STOP_err, 
	RX_P_DATA, 
	test_si, 
	test_se, 
	RX_CLK_M__L3_N1, 
	TX_CLK_M__L4_N1);
   input rst;
   input PAR_EN;
   input PAR_type;
   input [7:0] TX_P_data;
   input TX_Data_valid;
   input TX_CLK;
   output TX_OUT;
   output TX_busy;
   input RX_IN;
   input [5:0] prescale;
   input RX_CLK;
   output RX_data_valid;
   output PAR_err;
   output STOP_err;
   output [7:0] RX_P_DATA;
   input test_si;
   input test_se;
   input RX_CLK_M__L3_N1;
   input TX_CLK_M__L4_N1;

   // Internal wires
   wire n5;
   wire n7;

   DLY1X1M U4 (.Y(n7), 
	.A(test_se));
   UART_TX_top_test_1 TX_INST (.P_data({ TX_P_data[7],
		TX_P_data[6],
		TX_P_data[5],
		TX_P_data[4],
		TX_P_data[3],
		TX_P_data[2],
		TX_P_data[1],
		TX_P_data[0] }), 
	.Data_valid(TX_Data_valid), 
	.PAR_EN(PAR_EN), 
	.PAR_type(PAR_type), 
	.clk(TX_CLK), 
	.rst(rst), 
	.TX_OUT(TX_OUT), 
	.busy(TX_busy), 
	.test_si(PAR_err), 
	.test_so(n5), 
	.test_se(n7), 
	.TX_CLK_M__L4_N1(TX_CLK_M__L4_N1));
   UART_RX_top_test_1 RX_INST (.RX_IN(RX_IN), 
	.prescale({ prescale[5],
		prescale[4],
		prescale[3],
		prescale[2],
		prescale[1],
		prescale[0] }), 
	.PAR_EN(PAR_EN), 
	.PAR_TYPE(PAR_type), 
	.clk(RX_CLK), 
	.rst(rst), 
	.PAR_err(PAR_err), 
	.STOP_err(STOP_err), 
	.data_valid(RX_data_valid), 
	.P_DATA({ RX_P_DATA[7],
		RX_P_DATA[6],
		RX_P_DATA[5],
		RX_P_DATA[4],
		RX_P_DATA[3],
		RX_P_DATA[2],
		RX_P_DATA[1],
		RX_P_DATA[0] }), 
	.test_si2(n5), 
	.test_si1(test_si), 
	.test_se(n7), 
	.RX_CLK_M__L3_N1(RX_CLK_M__L3_N1));
endmodule

module mux2X1_1 (
	IN_0, 
	IN_1, 
	SEL, 
	OUT);
   input IN_0;
   input IN_1;
   input SEL;
   output OUT;

   // Internal wires
   wire N0;

   assign N0 = SEL ;

   MX2X6M U1 (.Y(OUT), 
	.S0(N0), 
	.B(IN_1), 
	.A(IN_0));
endmodule

module mux2X1_4 (
	IN_0, 
	IN_1, 
	SEL, 
	OUT);
   input IN_0;
   input IN_1;
   input SEL;
   output OUT;

   // Internal wires
   wire N0;

   assign N0 = SEL ;

   MX2X6M U1 (.Y(OUT), 
	.S0(N0), 
	.B(IN_1), 
	.A(IN_0));
endmodule

module mux2X1_3 (
	IN_0, 
	IN_1, 
	SEL, 
	OUT);
   input IN_0;
   input IN_1;
   input SEL;
   output OUT;

   // Internal wires
   wire N0;

   assign N0 = SEL ;

   MX2X6M U1 (.Y(OUT), 
	.S0(N0), 
	.B(IN_1), 
	.A(IN_0));
endmodule

module mux2X1_2 (
	IN_0, 
	IN_1, 
	SEL, 
	OUT);
   input IN_0;
   input IN_1;
   input SEL;
   output OUT;

   // Internal wires
   wire N0;

   assign N0 = SEL ;

   MX2X6M U1 (.Y(OUT), 
	.S0(N0), 
	.B(IN_1), 
	.A(IN_0));
endmodule

module mux2X1_0 (
	IN_0, 
	IN_1, 
	SEL, 
	OUT);
   input IN_0;
   input IN_1;
   input SEL;
   output OUT;

   // Internal wires
   wire N0;

   assign N0 = SEL ;

   MX2X2M U1 (.Y(OUT), 
	.S0(N0), 
	.B(IN_1), 
	.A(IN_0));
endmodule

module mux2X1_6 (
	IN_0, 
	IN_1, 
	SEL, 
	OUT);
   input IN_0;
   input IN_1;
   input SEL;
   output OUT;

   // Internal wires
   wire N0;

   assign N0 = SEL ;

   MX2X6M U1 (.Y(OUT), 
	.S0(N0), 
	.B(IN_1), 
	.A(IN_0));
endmodule

module mux2X1_5 (
	IN_0, 
	IN_1, 
	SEL, 
	OUT);
   input IN_0;
   input IN_1;
   input SEL;
   output OUT;

   // Internal wires
   wire N0;

   assign N0 = SEL ;

   MX2X2M U1 (.Y(OUT), 
	.S0(N0), 
	.B(IN_1), 
	.A(IN_0));
endmodule

