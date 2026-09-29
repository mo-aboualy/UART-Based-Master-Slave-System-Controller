/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : O-2018.06-SP1
// Date      : Tue Sep 29 21:32:32 2026
/////////////////////////////////////////////////////////////


module Reset_SYNC_0 ( clk, rst, sync_rst );
  input clk, rst;
  output sync_rst;
  wire   memory_0_;

  DFFRQX2M memory_reg_1_ ( .D(memory_0_), .CK(clk), .RN(rst), .Q(sync_rst) );
  DFFRQX2M memory_reg_0_ ( .D(1'b1), .CK(clk), .RN(rst), .Q(memory_0_) );
endmodule


module Reset_SYNC_1 ( clk, rst, sync_rst );
  input clk, rst;
  output sync_rst;
  wire   memory_0_;

  DFFRQX2M memory_reg_1_ ( .D(memory_0_), .CK(clk), .RN(rst), .Q(sync_rst) );
  DFFRQX2M memory_reg_0_ ( .D(1'b1), .CK(clk), .RN(rst), .Q(memory_0_) );
endmodule


module Prescale_MUX ( prescale, Div_ratio );
  input [5:0] prescale;
  output [7:0] Div_ratio;
  wire   n5, n6, n7, n8, n9, n14, n15, n16, n17;

  NOR3X12M U6 ( .A(n7), .B(prescale[1]), .C(prescale[0]), .Y(Div_ratio[1]) );
  INVX2M U3 ( .A(1'b1), .Y(Div_ratio[7]) );
  INVX2M U5 ( .A(1'b1), .Y(Div_ratio[6]) );
  INVX2M U8 ( .A(1'b1), .Y(Div_ratio[5]) );
  INVX2M U10 ( .A(1'b1), .Y(Div_ratio[4]) );
  NOR3X12M U12 ( .A(n6), .B(prescale[1]), .C(prescale[0]), .Y(Div_ratio[2]) );
  NOR4X2M U13 ( .A(prescale[5]), .B(prescale[4]), .C(prescale[3]), .D(n14), 
        .Y(n8) );
  CLKINVX1M U14 ( .A(prescale[1]), .Y(n16) );
  INVX2M U15 ( .A(prescale[2]), .Y(n14) );
  NOR4X6M U16 ( .A(n5), .B(prescale[3]), .C(prescale[5]), .D(prescale[4]), .Y(
        Div_ratio[3]) );
  NAND3X2M U17 ( .A(n17), .B(n16), .C(prescale[2]), .Y(n5) );
  NAND4BX2M U18 ( .AN(prescale[3]), .B(prescale[4]), .C(n14), .D(n15), .Y(n7)
         );
  NAND4BX2M U19 ( .AN(prescale[4]), .B(prescale[3]), .C(n14), .D(n15), .Y(n6)
         );
  OAI211X4M U20 ( .A0(n8), .A1(n9), .B0(n17), .C0(n16), .Y(Div_ratio[0]) );
  NAND2X2M U21 ( .A(n7), .B(n6), .Y(n9) );
  CLKINVX1M U22 ( .A(prescale[5]), .Y(n15) );
  INVX2M U23 ( .A(prescale[0]), .Y(n17) );
endmodule


module Clock_Divider_0_DW01_inc_0 ( A, SUM );
  input [7:0] A;
  output [7:0] SUM;

  wire   [7:2] carry;

  ADDHX1M U1_1_6 ( .A(A[6]), .B(carry[6]), .CO(carry[7]), .S(SUM[6]) );
  ADDHX1M U1_1_5 ( .A(A[5]), .B(carry[5]), .CO(carry[6]), .S(SUM[5]) );
  ADDHX1M U1_1_4 ( .A(A[4]), .B(carry[4]), .CO(carry[5]), .S(SUM[4]) );
  ADDHX1M U1_1_3 ( .A(A[3]), .B(carry[3]), .CO(carry[4]), .S(SUM[3]) );
  ADDHX1M U1_1_2 ( .A(A[2]), .B(carry[2]), .CO(carry[3]), .S(SUM[2]) );
  ADDHX1M U1_1_1 ( .A(A[1]), .B(A[0]), .CO(carry[2]), .S(SUM[1]) );
  CLKXOR2X2M U1 ( .A(carry[7]), .B(A[7]), .Y(SUM[7]) );
  CLKINVX1M U2 ( .A(A[0]), .Y(SUM[0]) );
endmodule


module Clock_Divider_0 ( i_ref_clk, i_clk_en, i_rst_n, i_div_ratio, o_div_clk
 );
  input [7:0] i_div_ratio;
  input i_ref_clk, i_clk_en, i_rst_n;
  output o_div_clk;
  wire   clk_div_reg, N7, N8, N9, N10, N11, N12, N13, N14, N17, N18, N19, N20,
         N21, N22, N23, N24, N27, N28, N29, N30, N31, N32, N33, N45, N46, N47,
         N48, N49, N50, N51, N52, n9, n10, n11, n12, n13, n14, n1, n2, n3, n4,
         n5, n6, n7, n8, n15, n16, n17, n18, n19, n20, n21, n22, n23, n24, n25,
         n26, n27, n28, n29, n30, n31, n32, n33, n34, n35, n36, n37, n38, n39,
         n40, n41, n42, n43, n44, n45, n46, n47, n48, n49;
  wire   [7:0] counter;

  Clock_Divider_0_DW01_inc_0 add_24 ( .A(counter), .SUM({N24, N23, N22, N21, 
        N20, N19, N18, N17}) );
  DFFRQX2M clk_div_reg_reg ( .D(n14), .CK(i_ref_clk), .RN(n4), .Q(clk_div_reg)
         );
  DFFRQX2M counter_reg_7_ ( .D(N52), .CK(i_ref_clk), .RN(n4), .Q(counter[7])
         );
  DFFRQX2M counter_reg_2_ ( .D(N47), .CK(i_ref_clk), .RN(n4), .Q(counter[2])
         );
  DFFRQX2M counter_reg_6_ ( .D(N51), .CK(i_ref_clk), .RN(n4), .Q(counter[6])
         );
  DFFRQX2M counter_reg_5_ ( .D(N50), .CK(i_ref_clk), .RN(n4), .Q(counter[5])
         );
  DFFRQX2M counter_reg_4_ ( .D(N49), .CK(i_ref_clk), .RN(n4), .Q(counter[4])
         );
  DFFRQX2M counter_reg_3_ ( .D(N48), .CK(i_ref_clk), .RN(n4), .Q(counter[3])
         );
  DFFRQX4M counter_reg_0_ ( .D(N45), .CK(i_ref_clk), .RN(n4), .Q(counter[0])
         );
  DFFRQX4M counter_reg_1_ ( .D(N46), .CK(i_ref_clk), .RN(n4), .Q(counter[1])
         );
  AOI21BX2M U3 ( .A0(i_div_ratio[1]), .A1(i_div_ratio[2]), .B0N(n2), .Y(n1) );
  OR2X2M U4 ( .A(n6), .B(i_div_ratio[2]), .Y(n7) );
  NAND2BX1M U5 ( .AN(i_div_ratio[2]), .B(n24), .Y(n2) );
  NOR3X2M U6 ( .A(n39), .B(N32), .C(counter[7]), .Y(n45) );
  NOR3X4M U7 ( .A(i_div_ratio[6]), .B(i_div_ratio[7]), .C(n22), .Y(N32) );
  NOR2X4M U8 ( .A(n8), .B(i_div_ratio[4]), .Y(n15) );
  OR2X2M U9 ( .A(n7), .B(i_div_ratio[3]), .Y(n8) );
  OR2X2M U10 ( .A(n19), .B(i_div_ratio[3]), .Y(n20) );
  OAI2BB1XLM U11 ( .A0N(n2), .A1N(i_div_ratio[3]), .B0(n20), .Y(N27) );
  NOR2BX2M U12 ( .AN(N7), .B(counter[0]), .Y(n26) );
  NOR2BX2M U13 ( .AN(counter[0]), .B(N7), .Y(n25) );
  NOR2X2M U14 ( .A(n48), .B(n24), .Y(n37) );
  OAI2BB1XLM U15 ( .A0N(n6), .A1N(i_div_ratio[2]), .B0(n7), .Y(N9) );
  OAI2BB1XLM U16 ( .A0N(n7), .A1N(i_div_ratio[3]), .B0(n8), .Y(N10) );
  OR2X2M U17 ( .A(n21), .B(i_div_ratio[5]), .Y(n22) );
  OR2X2M U18 ( .A(n20), .B(i_div_ratio[4]), .Y(n21) );
  OAI2BB1XLM U19 ( .A0N(n21), .A1N(i_div_ratio[5]), .B0(n22), .Y(N29) );
  OAI2BB1XLM U20 ( .A0N(n20), .A1N(i_div_ratio[4]), .B0(n21), .Y(N28) );
  NAND2X4M U21 ( .A(n49), .B(n3), .Y(n11) );
  INVX2M U22 ( .A(n10), .Y(n49) );
  OR2X2M U23 ( .A(n36), .B(n35), .Y(n3) );
  NOR2BX2M U24 ( .AN(N18), .B(n11), .Y(N46) );
  NOR2BX2M U25 ( .AN(N19), .B(n11), .Y(N47) );
  NOR2BX2M U26 ( .AN(N20), .B(n11), .Y(N48) );
  NOR2BX2M U27 ( .AN(N21), .B(n11), .Y(N49) );
  NOR2BX2M U28 ( .AN(N22), .B(n11), .Y(N50) );
  NOR2BX2M U29 ( .AN(N23), .B(n11), .Y(N51) );
  OR2X2M U30 ( .A(i_div_ratio[1]), .B(i_div_ratio[0]), .Y(n6) );
  INVX2M U31 ( .A(i_div_ratio[1]), .Y(n24) );
  INVX6M U32 ( .A(n5), .Y(n4) );
  INVX2M U33 ( .A(i_rst_n), .Y(n5) );
  AOI21X2M U34 ( .A0(n3), .A1(n9), .B0(n10), .Y(n14) );
  NAND2BX2M U35 ( .AN(N33), .B(clk_div_reg), .Y(n9) );
  NOR2BX2M U36 ( .AN(N24), .B(n11), .Y(N52) );
  NOR2BX2M U37 ( .AN(N17), .B(n11), .Y(N45) );
  INVX2M U38 ( .A(counter[0]), .Y(n48) );
  OAI2BB1X2M U39 ( .A0N(n12), .A1N(n13), .B0(i_clk_en), .Y(n10) );
  NOR4X2M U40 ( .A(i_div_ratio[7]), .B(i_div_ratio[6]), .C(i_div_ratio[5]), 
        .D(i_div_ratio[4]), .Y(n13) );
  NOR3X2M U41 ( .A(i_div_ratio[1]), .B(i_div_ratio[3]), .C(i_div_ratio[2]), 
        .Y(n12) );
  INVX2M U42 ( .A(i_div_ratio[5]), .Y(n18) );
  CLKINVX1M U43 ( .A(i_div_ratio[0]), .Y(N7) );
  OAI2BB1X1M U44 ( .A0N(i_div_ratio[0]), .A1N(i_div_ratio[1]), .B0(n6), .Y(N8)
         );
  AO21XLM U45 ( .A0(n8), .A1(i_div_ratio[4]), .B0(n15), .Y(N11) );
  CLKNAND2X2M U46 ( .A(n15), .B(n18), .Y(n16) );
  OAI21X1M U47 ( .A0(n15), .A1(n18), .B0(n16), .Y(N12) );
  XNOR2X1M U48 ( .A(i_div_ratio[6]), .B(n16), .Y(N13) );
  NOR2X1M U49 ( .A(i_div_ratio[6]), .B(n16), .Y(n17) );
  CLKXOR2X2M U50 ( .A(i_div_ratio[7]), .B(n17), .Y(N14) );
  NAND2BX1M U51 ( .AN(i_div_ratio[2]), .B(n24), .Y(n19) );
  XNOR2X1M U52 ( .A(i_div_ratio[6]), .B(n22), .Y(N30) );
  OAI21X1M U53 ( .A0(i_div_ratio[6]), .A1(n22), .B0(i_div_ratio[7]), .Y(n23)
         );
  NAND2BX1M U54 ( .AN(N32), .B(n23), .Y(N31) );
  MX2X6M U55 ( .A(i_ref_clk), .B(clk_div_reg), .S0(n49), .Y(o_div_clk) );
  XNOR2X1M U56 ( .A(N9), .B(counter[2]), .Y(n30) );
  XNOR2X1M U57 ( .A(N14), .B(counter[7]), .Y(n29) );
  OAI2B2X1M U58 ( .A1N(N8), .A0(n25), .B0(counter[1]), .B1(n25), .Y(n28) );
  OAI2B2X1M U59 ( .A1N(counter[1]), .A0(n26), .B0(N8), .B1(n26), .Y(n27) );
  NAND4X1M U60 ( .A(n30), .B(n29), .C(n28), .D(n27), .Y(n36) );
  XNOR2X1M U61 ( .A(N13), .B(counter[6]), .Y(n34) );
  XNOR2X1M U62 ( .A(N12), .B(counter[5]), .Y(n33) );
  XNOR2X1M U63 ( .A(N11), .B(counter[4]), .Y(n32) );
  XNOR2X1M U64 ( .A(N10), .B(counter[3]), .Y(n31) );
  NAND4X1M U65 ( .A(n34), .B(n33), .C(n32), .D(n31), .Y(n35) );
  XNOR2X1M U66 ( .A(N27), .B(counter[2]), .Y(n47) );
  OAI22X1M U67 ( .A0(counter[1]), .A1(n37), .B0(n37), .B1(n1), .Y(n46) );
  CLKNAND2X2M U68 ( .A(n24), .B(n48), .Y(n38) );
  AOI22X1M U69 ( .A0(n38), .A1(n1), .B0(n38), .B1(counter[1]), .Y(n39) );
  CLKXOR2X2M U70 ( .A(N28), .B(counter[3]), .Y(n43) );
  CLKXOR2X2M U71 ( .A(N29), .B(counter[4]), .Y(n42) );
  CLKXOR2X2M U72 ( .A(N30), .B(counter[5]), .Y(n41) );
  CLKXOR2X2M U73 ( .A(N31), .B(counter[6]), .Y(n40) );
  NOR4X1M U74 ( .A(n43), .B(n42), .C(n41), .D(n40), .Y(n44) );
  AND4X1M U75 ( .A(n47), .B(n46), .C(n45), .D(n44), .Y(N33) );
endmodule


module Clock_Divider_1_DW01_inc_0 ( A, SUM );
  input [7:0] A;
  output [7:0] SUM;

  wire   [7:2] carry;

  ADDHX1M U1_1_6 ( .A(A[6]), .B(carry[6]), .CO(carry[7]), .S(SUM[6]) );
  ADDHX1M U1_1_5 ( .A(A[5]), .B(carry[5]), .CO(carry[6]), .S(SUM[5]) );
  ADDHX1M U1_1_4 ( .A(A[4]), .B(carry[4]), .CO(carry[5]), .S(SUM[4]) );
  ADDHX1M U1_1_3 ( .A(A[3]), .B(carry[3]), .CO(carry[4]), .S(SUM[3]) );
  ADDHX1M U1_1_2 ( .A(A[2]), .B(carry[2]), .CO(carry[3]), .S(SUM[2]) );
  ADDHX1M U1_1_1 ( .A(A[1]), .B(A[0]), .CO(carry[2]), .S(SUM[1]) );
  CLKXOR2X2M U1 ( .A(carry[7]), .B(A[7]), .Y(SUM[7]) );
  CLKINVX1M U2 ( .A(A[0]), .Y(SUM[0]) );
endmodule


module Clock_Divider_1 ( i_ref_clk, i_clk_en, i_rst_n, i_div_ratio, o_div_clk
 );
  input [7:0] i_div_ratio;
  input i_ref_clk, i_clk_en, i_rst_n;
  output o_div_clk;
  wire   clk_div_reg, N7, N8, N9, N10, N11, N12, N13, N14, N17, N18, N19, N20,
         N21, N22, N23, N24, N25, N27, N28, N29, N30, N31, N32, N33, N45, N46,
         N47, N48, N49, N50, N51, N52, n1, n2, n3, n4, n5, n6, n7, n8, n15,
         n16, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29,
         n30, n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43,
         n44, n45, n46, n47, n48, n49, n50, n51, n52, n53;
  wire   [7:0] counter;

  Clock_Divider_1_DW01_inc_0 add_24 ( .A(counter), .SUM({N24, N23, N22, N21, 
        N20, N19, N18, N17}) );
  DFFRQX2M clk_div_reg_reg ( .D(n48), .CK(i_ref_clk), .RN(n3), .Q(clk_div_reg)
         );
  DFFRQX2M counter_reg_7_ ( .D(N52), .CK(i_ref_clk), .RN(n3), .Q(counter[7])
         );
  DFFRQX2M counter_reg_2_ ( .D(N47), .CK(i_ref_clk), .RN(n3), .Q(counter[2])
         );
  DFFRQX2M counter_reg_6_ ( .D(N51), .CK(i_ref_clk), .RN(n3), .Q(counter[6])
         );
  DFFRQX2M counter_reg_5_ ( .D(N50), .CK(i_ref_clk), .RN(n3), .Q(counter[5])
         );
  DFFRQX2M counter_reg_4_ ( .D(N49), .CK(i_ref_clk), .RN(n3), .Q(counter[4])
         );
  DFFRQX2M counter_reg_3_ ( .D(N48), .CK(i_ref_clk), .RN(n3), .Q(counter[3])
         );
  DFFRQX4M counter_reg_0_ ( .D(N45), .CK(i_ref_clk), .RN(n3), .Q(counter[0])
         );
  DFFRQX4M counter_reg_1_ ( .D(N46), .CK(i_ref_clk), .RN(n3), .Q(counter[1])
         );
  AOI21BX2M U3 ( .A0(i_div_ratio[1]), .A1(i_div_ratio[2]), .B0N(n18), .Y(n1)
         );
  NOR3X4M U4 ( .A(i_div_ratio[6]), .B(i_div_ratio[7]), .C(n21), .Y(N32) );
  NOR2X4M U5 ( .A(n7), .B(i_div_ratio[4]), .Y(n8) );
  NOR2BX2M U6 ( .AN(counter[0]), .B(N7), .Y(n23) );
  NOR3X2M U7 ( .A(n37), .B(N32), .C(counter[7]), .Y(n43) );
  NOR2BX2M U8 ( .AN(N7), .B(counter[0]), .Y(n24) );
  NOR2X2M U9 ( .A(n46), .B(N25), .Y(n35) );
  OR2X2M U10 ( .A(n20), .B(i_div_ratio[5]), .Y(n21) );
  OR2X2M U11 ( .A(n6), .B(i_div_ratio[3]), .Y(n7) );
  OR2X2M U12 ( .A(n5), .B(i_div_ratio[2]), .Y(n6) );
  OR2X2M U13 ( .A(n19), .B(i_div_ratio[4]), .Y(n20) );
  OR2X2M U14 ( .A(n18), .B(i_div_ratio[3]), .Y(n19) );
  OAI2BB1XLM U15 ( .A0N(n20), .A1N(i_div_ratio[5]), .B0(n21), .Y(N29) );
  OAI2BB1XLM U16 ( .A0N(n19), .A1N(i_div_ratio[4]), .B0(n20), .Y(N28) );
  OAI2BB1XLM U17 ( .A0N(n18), .A1N(i_div_ratio[3]), .B0(n19), .Y(N27) );
  NAND2X4M U18 ( .A(n47), .B(n2), .Y(n51) );
  INVX2M U19 ( .A(n52), .Y(n47) );
  OR2X2M U20 ( .A(n34), .B(n33), .Y(n2) );
  NOR2BX2M U21 ( .AN(N18), .B(n51), .Y(N46) );
  NOR2BX2M U22 ( .AN(N19), .B(n51), .Y(N47) );
  NOR2BX2M U23 ( .AN(N20), .B(n51), .Y(N48) );
  NOR2BX2M U24 ( .AN(N21), .B(n51), .Y(N49) );
  NOR2BX2M U25 ( .AN(N22), .B(n51), .Y(N50) );
  NOR2BX2M U26 ( .AN(N23), .B(n51), .Y(N51) );
  INVX6M U27 ( .A(n4), .Y(n3) );
  INVX2M U28 ( .A(i_rst_n), .Y(n4) );
  AOI21X2M U29 ( .A0(n2), .A1(n53), .B0(n52), .Y(n48) );
  NAND2BX2M U30 ( .AN(N33), .B(clk_div_reg), .Y(n53) );
  NOR2BX2M U31 ( .AN(N24), .B(n51), .Y(N52) );
  NOR2BX2M U32 ( .AN(N17), .B(n51), .Y(N45) );
  INVX2M U33 ( .A(counter[0]), .Y(n46) );
  OR2X2M U34 ( .A(i_div_ratio[1]), .B(i_div_ratio[0]), .Y(n5) );
  OR2X2M U35 ( .A(i_div_ratio[2]), .B(i_div_ratio[1]), .Y(n18) );
  OAI2BB1X2M U36 ( .A0N(n50), .A1N(n49), .B0(i_clk_en), .Y(n52) );
  NOR3X2M U37 ( .A(i_div_ratio[1]), .B(i_div_ratio[3]), .C(i_div_ratio[2]), 
        .Y(n50) );
  NOR4X2M U38 ( .A(i_div_ratio[7]), .B(i_div_ratio[6]), .C(i_div_ratio[5]), 
        .D(i_div_ratio[4]), .Y(n49) );
  INVX2M U39 ( .A(i_div_ratio[5]), .Y(n17) );
  CLKINVX1M U40 ( .A(i_div_ratio[0]), .Y(N7) );
  OAI2BB1X1M U41 ( .A0N(i_div_ratio[0]), .A1N(i_div_ratio[1]), .B0(n5), .Y(N8)
         );
  OAI2BB1X1M U42 ( .A0N(n5), .A1N(i_div_ratio[2]), .B0(n6), .Y(N9) );
  OAI2BB1X1M U43 ( .A0N(n6), .A1N(i_div_ratio[3]), .B0(n7), .Y(N10) );
  AO21XLM U44 ( .A0(n7), .A1(i_div_ratio[4]), .B0(n8), .Y(N11) );
  CLKNAND2X2M U45 ( .A(n8), .B(n17), .Y(n15) );
  OAI21X1M U46 ( .A0(n8), .A1(n17), .B0(n15), .Y(N12) );
  XNOR2X1M U47 ( .A(i_div_ratio[6]), .B(n15), .Y(N13) );
  NOR2X1M U48 ( .A(i_div_ratio[6]), .B(n15), .Y(n16) );
  CLKXOR2X2M U49 ( .A(i_div_ratio[7]), .B(n16), .Y(N14) );
  CLKINVX1M U50 ( .A(i_div_ratio[1]), .Y(N25) );
  XNOR2X1M U51 ( .A(i_div_ratio[6]), .B(n21), .Y(N30) );
  OAI21X1M U52 ( .A0(i_div_ratio[6]), .A1(n21), .B0(i_div_ratio[7]), .Y(n22)
         );
  NAND2BX1M U53 ( .AN(N32), .B(n22), .Y(N31) );
  MX2X6M U54 ( .A(i_ref_clk), .B(clk_div_reg), .S0(n47), .Y(o_div_clk) );
  XNOR2X1M U55 ( .A(N9), .B(counter[2]), .Y(n28) );
  XNOR2X1M U56 ( .A(N14), .B(counter[7]), .Y(n27) );
  OAI2B2X1M U57 ( .A1N(N8), .A0(n23), .B0(counter[1]), .B1(n23), .Y(n26) );
  OAI2B2X1M U58 ( .A1N(counter[1]), .A0(n24), .B0(N8), .B1(n24), .Y(n25) );
  NAND4X1M U59 ( .A(n28), .B(n27), .C(n26), .D(n25), .Y(n34) );
  XNOR2X1M U60 ( .A(N13), .B(counter[6]), .Y(n32) );
  XNOR2X1M U61 ( .A(N12), .B(counter[5]), .Y(n31) );
  XNOR2X1M U62 ( .A(N11), .B(counter[4]), .Y(n30) );
  XNOR2X1M U63 ( .A(N10), .B(counter[3]), .Y(n29) );
  NAND4X1M U64 ( .A(n32), .B(n31), .C(n30), .D(n29), .Y(n33) );
  XNOR2X1M U65 ( .A(N27), .B(counter[2]), .Y(n45) );
  OAI22X1M U66 ( .A0(counter[1]), .A1(n35), .B0(n35), .B1(n1), .Y(n44) );
  CLKNAND2X2M U67 ( .A(N25), .B(n46), .Y(n36) );
  AOI22X1M U68 ( .A0(n36), .A1(n1), .B0(n36), .B1(counter[1]), .Y(n37) );
  CLKXOR2X2M U69 ( .A(N28), .B(counter[3]), .Y(n41) );
  CLKXOR2X2M U70 ( .A(N29), .B(counter[4]), .Y(n40) );
  CLKXOR2X2M U71 ( .A(N30), .B(counter[5]), .Y(n39) );
  CLKXOR2X2M U72 ( .A(N31), .B(counter[6]), .Y(n38) );
  NOR4X1M U73 ( .A(n41), .B(n40), .C(n39), .D(n38), .Y(n42) );
  AND4X1M U74 ( .A(n45), .B(n44), .C(n43), .D(n42), .Y(N33) );
endmodule


module Clock_Gating ( CLK_en, clk, Gated_CLK );
  input CLK_en, clk;
  output Gated_CLK;


  TLATNCAX12M U0_TLATNCAX12M ( .E(CLK_en), .CK(clk), .ECK(Gated_CLK) );
endmodule


module register_file ( WR_Data, address, WR_en, RD_en, clk, rst, RD_Valid, 
        RD_Data, REG0, REG1, REG2, REG3 );
  input [7:0] WR_Data;
  input [3:0] address;
  output [7:0] RD_Data;
  output [7:0] REG0;
  output [7:0] REG1;
  output [7:0] REG2;
  output [7:0] REG3;
  input WR_en, RD_en, clk, rst;
  output RD_Valid;
  wire   n356, n357, n358, n359, n360, n361, n362, n363, n364, reg_file_15__7_,
         reg_file_15__6_, reg_file_15__5_, reg_file_15__4_, reg_file_15__3_,
         reg_file_15__2_, reg_file_15__1_, reg_file_15__0_, reg_file_14__7_,
         reg_file_14__6_, reg_file_14__5_, reg_file_14__4_, reg_file_14__3_,
         reg_file_14__2_, reg_file_14__1_, reg_file_14__0_, reg_file_13__7_,
         reg_file_13__6_, reg_file_13__5_, reg_file_13__4_, reg_file_13__3_,
         reg_file_13__2_, reg_file_13__1_, reg_file_13__0_, reg_file_12__7_,
         reg_file_12__6_, reg_file_12__5_, reg_file_12__4_, reg_file_12__3_,
         reg_file_12__2_, reg_file_12__1_, reg_file_12__0_, reg_file_11__7_,
         reg_file_11__6_, reg_file_11__5_, reg_file_11__4_, reg_file_11__3_,
         reg_file_11__2_, reg_file_11__1_, reg_file_11__0_, reg_file_10__7_,
         reg_file_10__6_, reg_file_10__5_, reg_file_10__4_, reg_file_10__3_,
         reg_file_10__2_, reg_file_10__1_, reg_file_10__0_, reg_file_9__7_,
         reg_file_9__6_, reg_file_9__5_, reg_file_9__4_, reg_file_9__3_,
         reg_file_9__2_, reg_file_9__1_, reg_file_9__0_, reg_file_8__7_,
         reg_file_8__6_, reg_file_8__5_, reg_file_8__4_, reg_file_8__3_,
         reg_file_8__2_, reg_file_8__1_, reg_file_8__0_, reg_file_7__7_,
         reg_file_7__6_, reg_file_7__5_, reg_file_7__4_, reg_file_7__3_,
         reg_file_7__2_, reg_file_7__1_, reg_file_7__0_, reg_file_6__7_,
         reg_file_6__6_, reg_file_6__5_, reg_file_6__4_, reg_file_6__3_,
         reg_file_6__2_, reg_file_6__1_, reg_file_6__0_, reg_file_5__7_,
         reg_file_5__6_, reg_file_5__5_, reg_file_5__4_, reg_file_5__3_,
         reg_file_5__2_, reg_file_5__1_, reg_file_5__0_, reg_file_4__7_,
         reg_file_4__6_, reg_file_4__5_, reg_file_4__4_, reg_file_4__3_,
         reg_file_4__2_, reg_file_4__1_, reg_file_4__0_, N36, N37, N38, N39,
         N40, N41, N42, N43, N61, n12, n13, n14, n15, n16, n17, n18, n19, n20,
         n21, n22, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32, n33, n34,
         n35, n36, n37, n38, n39, n40, n41, n42, n43, n44, n45, n46, n47, n48,
         n49, n50, n51, n52, n53, n54, n55, n56, n57, n58, n59, n60, n61, n62,
         n63, n64, n65, n66, n67, n68, n69, n70, n71, n72, n73, n74, n75, n76,
         n77, n78, n79, n80, n81, n82, n83, n84, n85, n86, n87, n88, n89, n90,
         n91, n92, n93, n94, n95, n96, n97, n98, n99, n100, n101, n102, n103,
         n104, n105, n106, n107, n108, n109, n110, n111, n112, n113, n114,
         n115, n116, n117, n118, n119, n120, n121, n122, n123, n124, n125,
         n126, n127, n128, n129, n130, n131, n132, n133, n134, n135, n136,
         n137, n138, n139, n140, n141, n142, n143, n144, n145, n146, n147,
         n148, n149, n150, n151, n152, n153, n154, n155, n156, n157, n158,
         n159, n160, n161, n162, n163, n164, n165, n166, n167, n168, n169,
         n170, n171, n172, n173, n174, n2, n3, n5, n7, n177, n178, n179, n180,
         n181, n182, n183, n184, n185, n186, n187, n188, n189, n190, n191,
         n192, n193, n194, n195, n196, n197, n198, n199, n200, n201, n202,
         n203, n204, n205, n206, n207, n208, n209, n210, n211, n212, n213,
         n214, n215, n216, n217, n218, n219, n220, n221, n222, n223, n224,
         n225, n226, n227, n228, n229, n230, n231, n232, n233, n234, n235,
         n236, n237, n238, n239, n240, n241, n242, n243, n244, n245, n246,
         n247, n248, n249, n250, n251, n252, n253, n254, n255, n256, n257,
         n258, n259, n260, n261, n262, n263, n264, n265, n266, n267, n268,
         n269, n270, n271, n272, n273, n274, n275, n276, n277, n278, n279,
         n280, n281, n282, n283, n284, n285, n286, n287, n288, n289, n290,
         n291, n292, n293, n294, n295, n296, n297, n298, n299, n300, n301,
         n302, n303, n304, n305, n306, n307, n308, n309, n310, n311, n312,
         n313, n314, n315, n316, n317, n318, n319, n320, n321, n322, n323,
         n324, n325, n326, n327, n328, n329, n330, n331, n332, n333, n334,
         n335, n336, n337, n338, n339, n340, n341, n342, n343, n344, n345,
         n346, n347, n348, n349, n350, n351, n352, n353, n354, n355;

  DFFRHQX8M reg_file_reg_2__2_ ( .D(n57), .CK(clk), .RN(n334), .Q(REG2[2]) );
  DFFRHQX8M reg_file_reg_1__3_ ( .D(n50), .CK(clk), .RN(n334), .Q(REG1[3]) );
  DFFRHQX8M reg_file_reg_1__2_ ( .D(n49), .CK(clk), .RN(n334), .Q(REG1[2]) );
  DFFRHQX8M reg_file_reg_1__1_ ( .D(n48), .CK(clk), .RN(n333), .Q(REG1[1]) );
  DFFRHQX8M reg_file_reg_0__7_ ( .D(n46), .CK(clk), .RN(n333), .Q(REG0[7]) );
  DFFRHQX8M reg_file_reg_0__6_ ( .D(n45), .CK(clk), .RN(n334), .Q(REG0[6]) );
  DFFRHQX8M reg_file_reg_0__5_ ( .D(n44), .CK(clk), .RN(n333), .Q(REG0[5]) );
  DFFRHQX8M reg_file_reg_0__4_ ( .D(n43), .CK(clk), .RN(n333), .Q(REG0[4]) );
  DFFRHQX8M reg_file_reg_0__3_ ( .D(n42), .CK(clk), .RN(n333), .Q(REG0[3]) );
  DFFRHQX8M reg_file_reg_0__2_ ( .D(n41), .CK(clk), .RN(n333), .Q(REG0[2]) );
  DFFRHQX8M reg_file_reg_0__1_ ( .D(n40), .CK(clk), .RN(n333), .Q(REG0[1]) );
  DFFRHQX8M reg_file_reg_0__0_ ( .D(n39), .CK(clk), .RN(n333), .Q(REG0[0]) );
  DFFRQX2M RD_Data_reg_7_ ( .D(n174), .CK(clk), .RN(n333), .Q(RD_Data[7]) );
  DFFRQX2M RD_Data_reg_6_ ( .D(n173), .CK(clk), .RN(n343), .Q(RD_Data[6]) );
  DFFRQX2M RD_Data_reg_5_ ( .D(n172), .CK(clk), .RN(n343), .Q(RD_Data[5]) );
  DFFRQX2M RD_Data_reg_4_ ( .D(n171), .CK(clk), .RN(n343), .Q(RD_Data[4]) );
  DFFRQX2M RD_Data_reg_3_ ( .D(n170), .CK(clk), .RN(n343), .Q(RD_Data[3]) );
  DFFRQX2M RD_Data_reg_2_ ( .D(n169), .CK(clk), .RN(n343), .Q(RD_Data[2]) );
  DFFRQX2M RD_Data_reg_1_ ( .D(n168), .CK(clk), .RN(n343), .Q(RD_Data[1]) );
  DFFRQX2M RD_Data_reg_0_ ( .D(n167), .CK(clk), .RN(n343), .Q(RD_Data[0]) );
  DFFRQX2M RD_Valid_reg ( .D(N61), .CK(clk), .RN(n338), .Q(RD_Valid) );
  DFFRQX2M reg_file_reg_15__7_ ( .D(n166), .CK(clk), .RN(n342), .Q(
        reg_file_15__7_) );
  DFFRQX2M reg_file_reg_15__6_ ( .D(n165), .CK(clk), .RN(n342), .Q(
        reg_file_15__6_) );
  DFFRQX2M reg_file_reg_15__5_ ( .D(n164), .CK(clk), .RN(n342), .Q(
        reg_file_15__5_) );
  DFFRQX2M reg_file_reg_15__4_ ( .D(n163), .CK(clk), .RN(n342), .Q(
        reg_file_15__4_) );
  DFFRQX2M reg_file_reg_15__3_ ( .D(n162), .CK(clk), .RN(n342), .Q(
        reg_file_15__3_) );
  DFFRQX2M reg_file_reg_15__2_ ( .D(n161), .CK(clk), .RN(n342), .Q(
        reg_file_15__2_) );
  DFFRQX2M reg_file_reg_15__1_ ( .D(n160), .CK(clk), .RN(n342), .Q(
        reg_file_15__1_) );
  DFFRQX2M reg_file_reg_15__0_ ( .D(n159), .CK(clk), .RN(n342), .Q(
        reg_file_15__0_) );
  DFFRQX2M reg_file_reg_13__7_ ( .D(n150), .CK(clk), .RN(n341), .Q(
        reg_file_13__7_) );
  DFFRQX2M reg_file_reg_13__6_ ( .D(n149), .CK(clk), .RN(n341), .Q(
        reg_file_13__6_) );
  DFFRQX2M reg_file_reg_13__5_ ( .D(n148), .CK(clk), .RN(n341), .Q(
        reg_file_13__5_) );
  DFFRQX2M reg_file_reg_13__4_ ( .D(n147), .CK(clk), .RN(n341), .Q(
        reg_file_13__4_) );
  DFFRQX2M reg_file_reg_13__3_ ( .D(n146), .CK(clk), .RN(n341), .Q(
        reg_file_13__3_) );
  DFFRQX2M reg_file_reg_13__2_ ( .D(n145), .CK(clk), .RN(n341), .Q(
        reg_file_13__2_) );
  DFFRQX2M reg_file_reg_13__1_ ( .D(n144), .CK(clk), .RN(n341), .Q(
        reg_file_13__1_) );
  DFFRQX2M reg_file_reg_13__0_ ( .D(n143), .CK(clk), .RN(n341), .Q(
        reg_file_13__0_) );
  DFFRQX2M reg_file_reg_11__7_ ( .D(n134), .CK(clk), .RN(n340), .Q(
        reg_file_11__7_) );
  DFFRQX2M reg_file_reg_11__6_ ( .D(n133), .CK(clk), .RN(n340), .Q(
        reg_file_11__6_) );
  DFFRQX2M reg_file_reg_11__5_ ( .D(n132), .CK(clk), .RN(n340), .Q(
        reg_file_11__5_) );
  DFFRQX2M reg_file_reg_11__4_ ( .D(n131), .CK(clk), .RN(n340), .Q(
        reg_file_11__4_) );
  DFFRQX2M reg_file_reg_11__3_ ( .D(n130), .CK(clk), .RN(n340), .Q(
        reg_file_11__3_) );
  DFFRQX2M reg_file_reg_11__2_ ( .D(n129), .CK(clk), .RN(n340), .Q(
        reg_file_11__2_) );
  DFFRQX2M reg_file_reg_11__1_ ( .D(n128), .CK(clk), .RN(n340), .Q(
        reg_file_11__1_) );
  DFFRQX2M reg_file_reg_11__0_ ( .D(n127), .CK(clk), .RN(n339), .Q(
        reg_file_11__0_) );
  DFFRQX2M reg_file_reg_9__7_ ( .D(n118), .CK(clk), .RN(n339), .Q(
        reg_file_9__7_) );
  DFFRQX2M reg_file_reg_9__6_ ( .D(n117), .CK(clk), .RN(n339), .Q(
        reg_file_9__6_) );
  DFFRQX2M reg_file_reg_9__5_ ( .D(n116), .CK(clk), .RN(n339), .Q(
        reg_file_9__5_) );
  DFFRQX2M reg_file_reg_9__4_ ( .D(n115), .CK(clk), .RN(n339), .Q(
        reg_file_9__4_) );
  DFFRQX2M reg_file_reg_9__3_ ( .D(n114), .CK(clk), .RN(n338), .Q(
        reg_file_9__3_) );
  DFFRQX2M reg_file_reg_9__2_ ( .D(n113), .CK(clk), .RN(n338), .Q(
        reg_file_9__2_) );
  DFFRQX2M reg_file_reg_9__1_ ( .D(n112), .CK(clk), .RN(n338), .Q(
        reg_file_9__1_) );
  DFFRQX2M reg_file_reg_9__0_ ( .D(n111), .CK(clk), .RN(n338), .Q(
        reg_file_9__0_) );
  DFFRQX2M reg_file_reg_7__7_ ( .D(n102), .CK(clk), .RN(n337), .Q(
        reg_file_7__7_) );
  DFFRQX2M reg_file_reg_7__6_ ( .D(n101), .CK(clk), .RN(n337), .Q(
        reg_file_7__6_) );
  DFFRQX2M reg_file_reg_7__5_ ( .D(n100), .CK(clk), .RN(n337), .Q(
        reg_file_7__5_) );
  DFFRQX2M reg_file_reg_7__4_ ( .D(n99), .CK(clk), .RN(n337), .Q(
        reg_file_7__4_) );
  DFFRQX2M reg_file_reg_7__3_ ( .D(n98), .CK(clk), .RN(n337), .Q(
        reg_file_7__3_) );
  DFFRQX2M reg_file_reg_7__2_ ( .D(n97), .CK(clk), .RN(n337), .Q(
        reg_file_7__2_) );
  DFFRQX2M reg_file_reg_7__1_ ( .D(n96), .CK(clk), .RN(n337), .Q(
        reg_file_7__1_) );
  DFFRQX2M reg_file_reg_7__0_ ( .D(n95), .CK(clk), .RN(n337), .Q(
        reg_file_7__0_) );
  DFFRQX2M reg_file_reg_5__7_ ( .D(n86), .CK(clk), .RN(n336), .Q(
        reg_file_5__7_) );
  DFFRQX2M reg_file_reg_5__6_ ( .D(n85), .CK(clk), .RN(n336), .Q(
        reg_file_5__6_) );
  DFFRQX2M reg_file_reg_5__5_ ( .D(n84), .CK(clk), .RN(n336), .Q(
        reg_file_5__5_) );
  DFFRQX2M reg_file_reg_5__4_ ( .D(n83), .CK(clk), .RN(n336), .Q(
        reg_file_5__4_) );
  DFFRQX2M reg_file_reg_5__3_ ( .D(n82), .CK(clk), .RN(n336), .Q(
        reg_file_5__3_) );
  DFFRQX2M reg_file_reg_5__2_ ( .D(n81), .CK(clk), .RN(n336), .Q(
        reg_file_5__2_) );
  DFFRQX2M reg_file_reg_5__1_ ( .D(n80), .CK(clk), .RN(n336), .Q(
        reg_file_5__1_) );
  DFFRQX2M reg_file_reg_5__0_ ( .D(n79), .CK(clk), .RN(n336), .Q(
        reg_file_5__0_) );
  DFFRQX2M reg_file_reg_14__7_ ( .D(n158), .CK(clk), .RN(n342), .Q(
        reg_file_14__7_) );
  DFFRQX2M reg_file_reg_14__6_ ( .D(n157), .CK(clk), .RN(n342), .Q(
        reg_file_14__6_) );
  DFFRQX2M reg_file_reg_14__5_ ( .D(n156), .CK(clk), .RN(n342), .Q(
        reg_file_14__5_) );
  DFFRQX2M reg_file_reg_14__4_ ( .D(n155), .CK(clk), .RN(n342), .Q(
        reg_file_14__4_) );
  DFFRQX2M reg_file_reg_14__3_ ( .D(n154), .CK(clk), .RN(n342), .Q(
        reg_file_14__3_) );
  DFFRQX2M reg_file_reg_14__2_ ( .D(n153), .CK(clk), .RN(n341), .Q(
        reg_file_14__2_) );
  DFFRQX2M reg_file_reg_14__1_ ( .D(n152), .CK(clk), .RN(n341), .Q(
        reg_file_14__1_) );
  DFFRQX2M reg_file_reg_14__0_ ( .D(n151), .CK(clk), .RN(n341), .Q(
        reg_file_14__0_) );
  DFFRQX2M reg_file_reg_12__7_ ( .D(n142), .CK(clk), .RN(n341), .Q(
        reg_file_12__7_) );
  DFFRQX2M reg_file_reg_12__6_ ( .D(n141), .CK(clk), .RN(n341), .Q(
        reg_file_12__6_) );
  DFFRQX2M reg_file_reg_12__5_ ( .D(n140), .CK(clk), .RN(n340), .Q(
        reg_file_12__5_) );
  DFFRQX2M reg_file_reg_12__4_ ( .D(n139), .CK(clk), .RN(n340), .Q(
        reg_file_12__4_) );
  DFFRQX2M reg_file_reg_12__3_ ( .D(n138), .CK(clk), .RN(n340), .Q(
        reg_file_12__3_) );
  DFFRQX2M reg_file_reg_12__2_ ( .D(n137), .CK(clk), .RN(n340), .Q(
        reg_file_12__2_) );
  DFFRQX2M reg_file_reg_12__1_ ( .D(n136), .CK(clk), .RN(n340), .Q(
        reg_file_12__1_) );
  DFFRQX2M reg_file_reg_12__0_ ( .D(n135), .CK(clk), .RN(n340), .Q(
        reg_file_12__0_) );
  DFFRQX2M reg_file_reg_10__7_ ( .D(n126), .CK(clk), .RN(n339), .Q(
        reg_file_10__7_) );
  DFFRQX2M reg_file_reg_10__6_ ( .D(n125), .CK(clk), .RN(n339), .Q(
        reg_file_10__6_) );
  DFFRQX2M reg_file_reg_10__5_ ( .D(n124), .CK(clk), .RN(n339), .Q(
        reg_file_10__5_) );
  DFFRQX2M reg_file_reg_10__4_ ( .D(n123), .CK(clk), .RN(n339), .Q(
        reg_file_10__4_) );
  DFFRQX2M reg_file_reg_10__3_ ( .D(n122), .CK(clk), .RN(n339), .Q(
        reg_file_10__3_) );
  DFFRQX2M reg_file_reg_10__2_ ( .D(n121), .CK(clk), .RN(n339), .Q(
        reg_file_10__2_) );
  DFFRQX2M reg_file_reg_10__1_ ( .D(n120), .CK(clk), .RN(n339), .Q(
        reg_file_10__1_) );
  DFFRQX2M reg_file_reg_10__0_ ( .D(n119), .CK(clk), .RN(n339), .Q(
        reg_file_10__0_) );
  DFFRQX2M reg_file_reg_8__7_ ( .D(n110), .CK(clk), .RN(n338), .Q(
        reg_file_8__7_) );
  DFFRQX2M reg_file_reg_8__6_ ( .D(n109), .CK(clk), .RN(n338), .Q(
        reg_file_8__6_) );
  DFFRQX2M reg_file_reg_8__5_ ( .D(n108), .CK(clk), .RN(n338), .Q(
        reg_file_8__5_) );
  DFFRQX2M reg_file_reg_8__4_ ( .D(n107), .CK(clk), .RN(n338), .Q(
        reg_file_8__4_) );
  DFFRQX2M reg_file_reg_8__3_ ( .D(n106), .CK(clk), .RN(n338), .Q(
        reg_file_8__3_) );
  DFFRQX2M reg_file_reg_8__2_ ( .D(n105), .CK(clk), .RN(n338), .Q(
        reg_file_8__2_) );
  DFFRQX2M reg_file_reg_8__1_ ( .D(n104), .CK(clk), .RN(n338), .Q(
        reg_file_8__1_) );
  DFFRQX2M reg_file_reg_8__0_ ( .D(n103), .CK(clk), .RN(n338), .Q(
        reg_file_8__0_) );
  DFFRQX2M reg_file_reg_6__7_ ( .D(n94), .CK(clk), .RN(n337), .Q(
        reg_file_6__7_) );
  DFFRQX2M reg_file_reg_6__6_ ( .D(n93), .CK(clk), .RN(n337), .Q(
        reg_file_6__6_) );
  DFFRQX2M reg_file_reg_6__5_ ( .D(n92), .CK(clk), .RN(n337), .Q(
        reg_file_6__5_) );
  DFFRQX2M reg_file_reg_6__4_ ( .D(n91), .CK(clk), .RN(n337), .Q(
        reg_file_6__4_) );
  DFFRQX2M reg_file_reg_6__3_ ( .D(n90), .CK(clk), .RN(n337), .Q(
        reg_file_6__3_) );
  DFFRQX2M reg_file_reg_6__2_ ( .D(n89), .CK(clk), .RN(n336), .Q(
        reg_file_6__2_) );
  DFFRQX2M reg_file_reg_6__1_ ( .D(n88), .CK(clk), .RN(n336), .Q(
        reg_file_6__1_) );
  DFFRQX2M reg_file_reg_6__0_ ( .D(n87), .CK(clk), .RN(n336), .Q(
        reg_file_6__0_) );
  DFFRQX2M reg_file_reg_4__7_ ( .D(n78), .CK(clk), .RN(n336), .Q(
        reg_file_4__7_) );
  DFFRQX2M reg_file_reg_4__6_ ( .D(n77), .CK(clk), .RN(n336), .Q(
        reg_file_4__6_) );
  DFFRQX2M reg_file_reg_4__5_ ( .D(n76), .CK(clk), .RN(n335), .Q(
        reg_file_4__5_) );
  DFFRQX2M reg_file_reg_4__4_ ( .D(n75), .CK(clk), .RN(n335), .Q(
        reg_file_4__4_) );
  DFFRQX2M reg_file_reg_4__3_ ( .D(n74), .CK(clk), .RN(n335), .Q(
        reg_file_4__3_) );
  DFFRQX2M reg_file_reg_4__2_ ( .D(n73), .CK(clk), .RN(n335), .Q(
        reg_file_4__2_) );
  DFFRQX2M reg_file_reg_4__1_ ( .D(n72), .CK(clk), .RN(n335), .Q(
        reg_file_4__1_) );
  DFFRQX2M reg_file_reg_4__0_ ( .D(n71), .CK(clk), .RN(n335), .Q(
        reg_file_4__0_) );
  DFFRQX2M reg_file_reg_2__1_ ( .D(n56), .CK(clk), .RN(n334), .Q(REG2[1]) );
  DFFRQX4M reg_file_reg_3__0_ ( .D(n63), .CK(clk), .RN(n335), .Q(REG3[0]) );
  DFFSQX4M reg_file_reg_2__0_ ( .D(n55), .CK(clk), .SN(n333), .Q(REG2[0]) );
  DFFSQX4M reg_file_reg_3__5_ ( .D(n68), .CK(clk), .SN(n333), .Q(REG3[5]) );
  DFFRQX4M reg_file_reg_3__7_ ( .D(n70), .CK(clk), .RN(n335), .Q(REG3[7]) );
  DFFRQX4M reg_file_reg_3__3_ ( .D(n66), .CK(clk), .RN(n335), .Q(REG3[3]) );
  DFFRQX4M reg_file_reg_3__2_ ( .D(n65), .CK(clk), .RN(n335), .Q(REG3[2]) );
  DFFRQX4M reg_file_reg_3__4_ ( .D(n67), .CK(clk), .RN(n335), .Q(REG3[4]) );
  DFFRQX4M reg_file_reg_3__6_ ( .D(n69), .CK(clk), .RN(n335), .Q(REG3[6]) );
  DFFRQX4M reg_file_reg_3__1_ ( .D(n64), .CK(clk), .RN(n335), .Q(REG3[1]) );
  DFFRQX2M reg_file_reg_2__4_ ( .D(n59), .CK(clk), .RN(n334), .Q(REG2[4]) );
  DFFRQX2M reg_file_reg_2__6_ ( .D(n61), .CK(clk), .RN(n334), .Q(n362) );
  DFFRQX2M reg_file_reg_2__3_ ( .D(n58), .CK(clk), .RN(n334), .Q(n364) );
  DFFRQX2M reg_file_reg_2__5_ ( .D(n60), .CK(clk), .RN(n334), .Q(n363) );
  DFFSQX2M reg_file_reg_2__7_ ( .D(n62), .CK(clk), .SN(n333), .Q(n361) );
  DFFRHQX4M reg_file_reg_1__7_ ( .D(n54), .CK(clk), .RN(n334), .Q(n356) );
  DFFRHQX4M reg_file_reg_1__6_ ( .D(n53), .CK(clk), .RN(n334), .Q(n357) );
  DFFRHQX2M reg_file_reg_1__5_ ( .D(n52), .CK(clk), .RN(n334), .Q(n358) );
  DFFRQX2M reg_file_reg_1__0_ ( .D(n47), .CK(clk), .RN(n333), .Q(n360) );
  DFFRHQX2M reg_file_reg_1__4_ ( .D(n51), .CK(clk), .RN(n334), .Q(n359) );
  BUFX16M U3 ( .A(n357), .Y(REG1[6]) );
  BUFX32M U4 ( .A(n360), .Y(REG1[0]) );
  BUFX10M U5 ( .A(n361), .Y(REG2[7]) );
  BUFX14M U6 ( .A(n356), .Y(REG1[7]) );
  NOR2X2M U7 ( .A(address[0]), .B(address[1]), .Y(n2) );
  NOR2X2M U8 ( .A(n283), .B(address[1]), .Y(n272) );
  NOR2X2M U9 ( .A(n282), .B(n283), .Y(n270) );
  OAI2BB2X1M U10 ( .B0(n353), .B1(n329), .A0N(REG1[6]), .A1N(n330), .Y(n53) );
  CLKINVX40M U11 ( .A(n5), .Y(REG1[4]) );
  AOI22X1M U12 ( .A0(REG0[4]), .A1(n298), .B0(REG1[4]), .B1(n294), .Y(n229) );
  AO22XLM U13 ( .A0(REG0[6]), .A1(n297), .B0(REG1[6]), .B1(n293), .Y(n253) );
  INVXLM U14 ( .A(n253), .Y(n3) );
  OAI2BB2X1M U15 ( .B0(n351), .B1(n329), .A0N(REG1[4]), .A1N(n330), .Y(n51) );
  CLKINVX32M U16 ( .A(n359), .Y(n5) );
  CLKINVX32M U17 ( .A(n358), .Y(n7) );
  INVX32M U18 ( .A(n7), .Y(REG1[5]) );
  CLKINVX1M U19 ( .A(address[0]), .Y(n283) );
  NAND2X4M U20 ( .A(address[3]), .B(n281), .Y(n261) );
  NAND2X4M U21 ( .A(address[2]), .B(n280), .Y(n273) );
  CLKINVX1M U22 ( .A(address[3]), .Y(n280) );
  CLKBUFX12M U23 ( .A(n363), .Y(REG2[5]) );
  NAND2X4M U24 ( .A(address[3]), .B(address[2]), .Y(n264) );
  NAND2X4M U25 ( .A(n281), .B(n280), .Y(n267) );
  BUFX10M U26 ( .A(n364), .Y(REG2[3]) );
  BUFX10M U27 ( .A(n362), .Y(REG2[6]) );
  CLKINVX1M U28 ( .A(address[0]), .Y(n346) );
  NOR2BX4M U29 ( .AN(n36), .B(address[0]), .Y(n28) );
  NOR2BX4M U30 ( .AN(n25), .B(address[0]), .Y(n14) );
  NOR2BX2M U31 ( .AN(address[3]), .B(N61), .Y(n36) );
  NOR2X2M U32 ( .A(N61), .B(address[3]), .Y(n25) );
  NOR2X4M U33 ( .A(n282), .B(address[2]), .Y(n18) );
  NOR2BX4M U34 ( .AN(address[2]), .B(address[1]), .Y(n21) );
  NOR2BX4M U35 ( .AN(address[2]), .B(n282), .Y(n24) );
  BUFX4M U36 ( .A(n38), .Y(n300) );
  NOR2X4M U37 ( .A(address[1]), .B(address[2]), .Y(n13) );
  INVX8M U38 ( .A(WR_Data[6]), .Y(n353) );
  INVX8M U39 ( .A(WR_Data[7]), .Y(n354) );
  CLKBUFX6M U40 ( .A(n284), .Y(n286) );
  BUFX4M U41 ( .A(n270), .Y(n285) );
  CLKBUFX6M U42 ( .A(n288), .Y(n290) );
  CLKBUFX6M U43 ( .A(n296), .Y(n298) );
  CLKBUFX6M U44 ( .A(n284), .Y(n287) );
  BUFX2M U45 ( .A(n270), .Y(n284) );
  CLKBUFX6M U46 ( .A(n292), .Y(n294) );
  BUFX4M U47 ( .A(n272), .Y(n293) );
  BUFX4M U48 ( .A(n296), .Y(n297) );
  BUFX4M U49 ( .A(n288), .Y(n289) );
  BUFX4M U50 ( .A(n15), .Y(n330) );
  BUFX4M U51 ( .A(n19), .Y(n325) );
  BUFX4M U52 ( .A(n15), .Y(n329) );
  BUFX4M U53 ( .A(n17), .Y(n328) );
  BUFX4M U54 ( .A(n20), .Y(n324) );
  BUFX4M U55 ( .A(n23), .Y(n320) );
  BUFX4M U56 ( .A(n27), .Y(n316) );
  BUFX4M U57 ( .A(n31), .Y(n312) );
  BUFX4M U58 ( .A(n33), .Y(n308) );
  BUFX4M U59 ( .A(n35), .Y(n304) );
  BUFX4M U60 ( .A(n12), .Y(n332) );
  BUFX4M U61 ( .A(n29), .Y(n314) );
  BUFX4M U62 ( .A(n32), .Y(n310) );
  BUFX4M U63 ( .A(n19), .Y(n326) );
  BUFX4M U64 ( .A(n34), .Y(n306) );
  BUFX4M U65 ( .A(n22), .Y(n322) );
  BUFX4M U66 ( .A(n26), .Y(n318) );
  BUFX4M U67 ( .A(n37), .Y(n302) );
  BUFX4M U68 ( .A(n17), .Y(n327) );
  BUFX4M U69 ( .A(n20), .Y(n323) );
  BUFX4M U70 ( .A(n23), .Y(n319) );
  BUFX4M U71 ( .A(n27), .Y(n315) );
  BUFX4M U72 ( .A(n31), .Y(n311) );
  BUFX4M U73 ( .A(n33), .Y(n307) );
  BUFX4M U74 ( .A(n35), .Y(n303) );
  BUFX4M U75 ( .A(n29), .Y(n313) );
  BUFX4M U76 ( .A(n32), .Y(n309) );
  BUFX4M U77 ( .A(n34), .Y(n305) );
  BUFX4M U78 ( .A(n22), .Y(n321) );
  BUFX4M U79 ( .A(n26), .Y(n317) );
  BUFX4M U80 ( .A(n37), .Y(n301) );
  BUFX4M U81 ( .A(n12), .Y(n331) );
  BUFX6M U82 ( .A(rst), .Y(n333) );
  CLKBUFX8M U83 ( .A(n345), .Y(n335) );
  CLKBUFX8M U84 ( .A(n345), .Y(n336) );
  CLKBUFX8M U85 ( .A(n345), .Y(n337) );
  CLKBUFX8M U86 ( .A(n344), .Y(n338) );
  CLKBUFX8M U87 ( .A(n344), .Y(n339) );
  CLKBUFX8M U88 ( .A(n344), .Y(n340) );
  CLKBUFX8M U89 ( .A(n343), .Y(n341) );
  CLKBUFX8M U90 ( .A(n344), .Y(n342) );
  BUFX6M U91 ( .A(rst), .Y(n334) );
  BUFX4M U92 ( .A(n345), .Y(n343) );
  CLKBUFX6M U93 ( .A(n292), .Y(n295) );
  BUFX2M U94 ( .A(n272), .Y(n292) );
  BUFX2M U95 ( .A(n2), .Y(n296) );
  BUFX2M U96 ( .A(n271), .Y(n288) );
  CLKBUFX6M U97 ( .A(n2), .Y(n299) );
  CLKBUFX6M U98 ( .A(n288), .Y(n291) );
  NOR2BX4M U99 ( .AN(n25), .B(n346), .Y(n16) );
  NAND2X2M U100 ( .A(n16), .B(n13), .Y(n15) );
  NAND2X2M U101 ( .A(n18), .B(n16), .Y(n19) );
  NOR2BX4M U102 ( .AN(n36), .B(n346), .Y(n30) );
  NAND2X2M U103 ( .A(n13), .B(n14), .Y(n12) );
  NAND2X2M U104 ( .A(n18), .B(n14), .Y(n17) );
  NAND2X2M U105 ( .A(n21), .B(n14), .Y(n20) );
  NAND2X2M U106 ( .A(n24), .B(n14), .Y(n23) );
  NAND2X2M U107 ( .A(n28), .B(n13), .Y(n27) );
  NAND2X2M U108 ( .A(n28), .B(n18), .Y(n31) );
  NAND2X2M U109 ( .A(n28), .B(n21), .Y(n33) );
  NAND2X2M U110 ( .A(n28), .B(n24), .Y(n35) );
  NAND2X2M U111 ( .A(n30), .B(n13), .Y(n29) );
  NAND2X2M U112 ( .A(n30), .B(n18), .Y(n32) );
  NAND2X2M U113 ( .A(n30), .B(n21), .Y(n34) );
  NAND2X2M U114 ( .A(n30), .B(n24), .Y(n37) );
  NAND2X2M U115 ( .A(n21), .B(n16), .Y(n22) );
  NAND2X2M U116 ( .A(n24), .B(n16), .Y(n26) );
  INVX4M U117 ( .A(n300), .Y(n355) );
  BUFX2M U118 ( .A(rst), .Y(n345) );
  BUFX2M U119 ( .A(rst), .Y(n344) );
  CLKINVX1M U120 ( .A(address[2]), .Y(n281) );
  INVX2M U121 ( .A(address[1]), .Y(n282) );
  NAND2BX2M U122 ( .AN(RD_en), .B(WR_en), .Y(N61) );
  NAND2BX2M U123 ( .AN(WR_en), .B(RD_en), .Y(n38) );
  OAI2BB2X1M U124 ( .B0(n351), .B1(n327), .A0N(REG2[4]), .A1N(n328), .Y(n59)
         );
  INVX8M U125 ( .A(WR_Data[0]), .Y(n347) );
  INVX8M U126 ( .A(WR_Data[1]), .Y(n348) );
  INVX8M U127 ( .A(WR_Data[5]), .Y(n352) );
  INVX8M U128 ( .A(WR_Data[2]), .Y(n349) );
  INVX8M U129 ( .A(WR_Data[3]), .Y(n350) );
  INVX8M U130 ( .A(WR_Data[4]), .Y(n351) );
  AO22X1M U131 ( .A0(N43), .A1(n355), .B0(RD_Data[0]), .B1(n300), .Y(n167) );
  AO22X1M U132 ( .A0(N42), .A1(n355), .B0(RD_Data[1]), .B1(n300), .Y(n168) );
  AO22X1M U133 ( .A0(N41), .A1(n355), .B0(RD_Data[2]), .B1(n300), .Y(n169) );
  AO22X1M U134 ( .A0(N40), .A1(n355), .B0(RD_Data[3]), .B1(n300), .Y(n170) );
  AO22X1M U135 ( .A0(N39), .A1(n355), .B0(RD_Data[4]), .B1(n300), .Y(n171) );
  AO22X1M U136 ( .A0(N38), .A1(n355), .B0(RD_Data[5]), .B1(n300), .Y(n172) );
  AO22X1M U137 ( .A0(N37), .A1(n355), .B0(RD_Data[6]), .B1(n300), .Y(n173) );
  AO22X1M U138 ( .A0(N36), .A1(n355), .B0(RD_Data[7]), .B1(n300), .Y(n174) );
  OAI2BB2X1M U139 ( .B0(n347), .B1(n330), .A0N(REG1[0]), .A1N(n330), .Y(n47)
         );
  OAI2BB2X1M U140 ( .B0(n352), .B1(n325), .A0N(REG3[5]), .A1N(n326), .Y(n68)
         );
  OAI2BB2X1M U141 ( .B0(n332), .B1(n347), .A0N(REG0[0]), .A1N(n332), .Y(n39)
         );
  OAI2BB2X1M U142 ( .B0(n331), .B1(n348), .A0N(REG0[1]), .A1N(n332), .Y(n40)
         );
  OAI2BB2X1M U143 ( .B0(n331), .B1(n349), .A0N(REG0[2]), .A1N(n332), .Y(n41)
         );
  OAI2BB2X1M U144 ( .B0(n331), .B1(n350), .A0N(REG0[3]), .A1N(n332), .Y(n42)
         );
  OAI2BB2X1M U145 ( .B0(n331), .B1(n352), .A0N(REG0[5]), .A1N(n332), .Y(n44)
         );
  OAI2BB2X1M U146 ( .B0(n331), .B1(n351), .A0N(REG0[4]), .A1N(n332), .Y(n43)
         );
  OAI2BB2X1M U147 ( .B0(n347), .B1(n326), .A0N(REG3[0]), .A1N(n326), .Y(n63)
         );
  OAI2BB2X1M U148 ( .B0(n347), .B1(n324), .A0N(reg_file_4__0_), .A1N(n324), 
        .Y(n71) );
  OAI2BB2X1M U149 ( .B0(n347), .B1(n322), .A0N(reg_file_5__0_), .A1N(n322), 
        .Y(n79) );
  OAI2BB2X1M U150 ( .B0(n347), .B1(n320), .A0N(reg_file_6__0_), .A1N(n320), 
        .Y(n87) );
  OAI2BB2X1M U151 ( .B0(n347), .B1(n318), .A0N(reg_file_7__0_), .A1N(n318), 
        .Y(n95) );
  OAI2BB2X1M U152 ( .B0(n347), .B1(n316), .A0N(reg_file_8__0_), .A1N(n316), 
        .Y(n103) );
  OAI2BB2X1M U153 ( .B0(n347), .B1(n314), .A0N(reg_file_9__0_), .A1N(n314), 
        .Y(n111) );
  OAI2BB2X1M U154 ( .B0(n347), .B1(n312), .A0N(reg_file_10__0_), .A1N(n312), 
        .Y(n119) );
  OAI2BB2X1M U155 ( .B0(n347), .B1(n310), .A0N(reg_file_11__0_), .A1N(n310), 
        .Y(n127) );
  OAI2BB2X1M U156 ( .B0(n347), .B1(n308), .A0N(reg_file_12__0_), .A1N(n308), 
        .Y(n135) );
  OAI2BB2X1M U157 ( .B0(n347), .B1(n306), .A0N(reg_file_13__0_), .A1N(n306), 
        .Y(n143) );
  OAI2BB2X1M U158 ( .B0(n347), .B1(n304), .A0N(reg_file_14__0_), .A1N(n304), 
        .Y(n151) );
  OAI2BB2X1M U159 ( .B0(n347), .B1(n302), .A0N(reg_file_15__0_), .A1N(n302), 
        .Y(n159) );
  OAI2BB2X1M U160 ( .B0(n348), .B1(n329), .A0N(REG1[1]), .A1N(n330), .Y(n48)
         );
  OAI2BB2X1M U161 ( .B0(n348), .B1(n327), .A0N(REG2[1]), .A1N(n328), .Y(n56)
         );
  OAI2BB2X1M U162 ( .B0(n348), .B1(n325), .A0N(REG3[1]), .A1N(n326), .Y(n64)
         );
  OAI2BB2X1M U163 ( .B0(n348), .B1(n323), .A0N(reg_file_4__1_), .A1N(n324), 
        .Y(n72) );
  OAI2BB2X1M U164 ( .B0(n348), .B1(n321), .A0N(reg_file_5__1_), .A1N(n322), 
        .Y(n80) );
  OAI2BB2X1M U165 ( .B0(n348), .B1(n319), .A0N(reg_file_6__1_), .A1N(n320), 
        .Y(n88) );
  OAI2BB2X1M U166 ( .B0(n348), .B1(n317), .A0N(reg_file_7__1_), .A1N(n318), 
        .Y(n96) );
  OAI2BB2X1M U167 ( .B0(n348), .B1(n315), .A0N(reg_file_8__1_), .A1N(n316), 
        .Y(n104) );
  OAI2BB2X1M U168 ( .B0(n348), .B1(n313), .A0N(reg_file_9__1_), .A1N(n314), 
        .Y(n112) );
  OAI2BB2X1M U169 ( .B0(n348), .B1(n311), .A0N(reg_file_10__1_), .A1N(n312), 
        .Y(n120) );
  OAI2BB2X1M U170 ( .B0(n348), .B1(n309), .A0N(reg_file_11__1_), .A1N(n310), 
        .Y(n128) );
  OAI2BB2X1M U171 ( .B0(n348), .B1(n307), .A0N(reg_file_12__1_), .A1N(n308), 
        .Y(n136) );
  OAI2BB2X1M U172 ( .B0(n348), .B1(n305), .A0N(reg_file_13__1_), .A1N(n306), 
        .Y(n144) );
  OAI2BB2X1M U173 ( .B0(n348), .B1(n303), .A0N(reg_file_14__1_), .A1N(n304), 
        .Y(n152) );
  OAI2BB2X1M U174 ( .B0(n348), .B1(n301), .A0N(reg_file_15__1_), .A1N(n302), 
        .Y(n160) );
  OAI2BB2X1M U175 ( .B0(n349), .B1(n329), .A0N(REG1[2]), .A1N(n330), .Y(n49)
         );
  OAI2BB2X1M U176 ( .B0(n349), .B1(n327), .A0N(REG2[2]), .A1N(n328), .Y(n57)
         );
  OAI2BB2X1M U177 ( .B0(n349), .B1(n325), .A0N(REG3[2]), .A1N(n326), .Y(n65)
         );
  OAI2BB2X1M U178 ( .B0(n349), .B1(n323), .A0N(reg_file_4__2_), .A1N(n324), 
        .Y(n73) );
  OAI2BB2X1M U179 ( .B0(n349), .B1(n321), .A0N(reg_file_5__2_), .A1N(n322), 
        .Y(n81) );
  OAI2BB2X1M U180 ( .B0(n349), .B1(n319), .A0N(reg_file_6__2_), .A1N(n320), 
        .Y(n89) );
  OAI2BB2X1M U181 ( .B0(n349), .B1(n317), .A0N(reg_file_7__2_), .A1N(n318), 
        .Y(n97) );
  OAI2BB2X1M U182 ( .B0(n349), .B1(n315), .A0N(reg_file_8__2_), .A1N(n316), 
        .Y(n105) );
  OAI2BB2X1M U183 ( .B0(n349), .B1(n313), .A0N(reg_file_9__2_), .A1N(n314), 
        .Y(n113) );
  OAI2BB2X1M U184 ( .B0(n349), .B1(n311), .A0N(reg_file_10__2_), .A1N(n312), 
        .Y(n121) );
  OAI2BB2X1M U185 ( .B0(n349), .B1(n309), .A0N(reg_file_11__2_), .A1N(n310), 
        .Y(n129) );
  OAI2BB2X1M U186 ( .B0(n349), .B1(n307), .A0N(reg_file_12__2_), .A1N(n308), 
        .Y(n137) );
  OAI2BB2X1M U187 ( .B0(n349), .B1(n305), .A0N(reg_file_13__2_), .A1N(n306), 
        .Y(n145) );
  OAI2BB2X1M U188 ( .B0(n349), .B1(n303), .A0N(reg_file_14__2_), .A1N(n304), 
        .Y(n153) );
  OAI2BB2X1M U189 ( .B0(n349), .B1(n301), .A0N(reg_file_15__2_), .A1N(n302), 
        .Y(n161) );
  OAI2BB2X1M U190 ( .B0(n350), .B1(n329), .A0N(REG1[3]), .A1N(n330), .Y(n50)
         );
  OAI2BB2X1M U191 ( .B0(n350), .B1(n327), .A0N(n364), .A1N(n328), .Y(n58) );
  OAI2BB2X1M U192 ( .B0(n350), .B1(n325), .A0N(REG3[3]), .A1N(n326), .Y(n66)
         );
  OAI2BB2X1M U193 ( .B0(n350), .B1(n323), .A0N(reg_file_4__3_), .A1N(n324), 
        .Y(n74) );
  OAI2BB2X1M U194 ( .B0(n350), .B1(n321), .A0N(reg_file_5__3_), .A1N(n322), 
        .Y(n82) );
  OAI2BB2X1M U195 ( .B0(n350), .B1(n319), .A0N(reg_file_6__3_), .A1N(n320), 
        .Y(n90) );
  OAI2BB2X1M U196 ( .B0(n350), .B1(n317), .A0N(reg_file_7__3_), .A1N(n318), 
        .Y(n98) );
  OAI2BB2X1M U197 ( .B0(n350), .B1(n315), .A0N(reg_file_8__3_), .A1N(n316), 
        .Y(n106) );
  OAI2BB2X1M U198 ( .B0(n350), .B1(n313), .A0N(reg_file_9__3_), .A1N(n314), 
        .Y(n114) );
  OAI2BB2X1M U199 ( .B0(n350), .B1(n311), .A0N(reg_file_10__3_), .A1N(n312), 
        .Y(n122) );
  OAI2BB2X1M U200 ( .B0(n350), .B1(n309), .A0N(reg_file_11__3_), .A1N(n310), 
        .Y(n130) );
  OAI2BB2X1M U201 ( .B0(n350), .B1(n307), .A0N(reg_file_12__3_), .A1N(n308), 
        .Y(n138) );
  OAI2BB2X1M U202 ( .B0(n350), .B1(n305), .A0N(reg_file_13__3_), .A1N(n306), 
        .Y(n146) );
  OAI2BB2X1M U203 ( .B0(n350), .B1(n303), .A0N(reg_file_14__3_), .A1N(n304), 
        .Y(n154) );
  OAI2BB2X1M U204 ( .B0(n350), .B1(n301), .A0N(reg_file_15__3_), .A1N(n302), 
        .Y(n162) );
  OAI2BB2X1M U205 ( .B0(n352), .B1(n329), .A0N(REG1[5]), .A1N(n330), .Y(n52)
         );
  OAI2BB2X1M U206 ( .B0(n352), .B1(n327), .A0N(REG2[5]), .A1N(n328), .Y(n60)
         );
  OAI2BB2X1M U207 ( .B0(n352), .B1(n323), .A0N(reg_file_4__5_), .A1N(n324), 
        .Y(n76) );
  OAI2BB2X1M U208 ( .B0(n352), .B1(n321), .A0N(reg_file_5__5_), .A1N(n322), 
        .Y(n84) );
  OAI2BB2X1M U209 ( .B0(n352), .B1(n319), .A0N(reg_file_6__5_), .A1N(n320), 
        .Y(n92) );
  OAI2BB2X1M U210 ( .B0(n352), .B1(n317), .A0N(reg_file_7__5_), .A1N(n318), 
        .Y(n100) );
  OAI2BB2X1M U211 ( .B0(n352), .B1(n315), .A0N(reg_file_8__5_), .A1N(n316), 
        .Y(n108) );
  OAI2BB2X1M U212 ( .B0(n352), .B1(n313), .A0N(reg_file_9__5_), .A1N(n314), 
        .Y(n116) );
  OAI2BB2X1M U213 ( .B0(n352), .B1(n311), .A0N(reg_file_10__5_), .A1N(n312), 
        .Y(n124) );
  OAI2BB2X1M U214 ( .B0(n352), .B1(n309), .A0N(reg_file_11__5_), .A1N(n310), 
        .Y(n132) );
  OAI2BB2X1M U215 ( .B0(n352), .B1(n307), .A0N(reg_file_12__5_), .A1N(n308), 
        .Y(n140) );
  OAI2BB2X1M U216 ( .B0(n352), .B1(n305), .A0N(reg_file_13__5_), .A1N(n306), 
        .Y(n148) );
  OAI2BB2X1M U217 ( .B0(n352), .B1(n303), .A0N(reg_file_14__5_), .A1N(n304), 
        .Y(n156) );
  OAI2BB2X1M U218 ( .B0(n352), .B1(n301), .A0N(reg_file_15__5_), .A1N(n302), 
        .Y(n164) );
  OAI2BB2X1M U219 ( .B0(n351), .B1(n325), .A0N(REG3[4]), .A1N(n326), .Y(n67)
         );
  OAI2BB2X1M U220 ( .B0(n351), .B1(n323), .A0N(reg_file_4__4_), .A1N(n324), 
        .Y(n75) );
  OAI2BB2X1M U221 ( .B0(n351), .B1(n321), .A0N(reg_file_5__4_), .A1N(n322), 
        .Y(n83) );
  OAI2BB2X1M U222 ( .B0(n351), .B1(n319), .A0N(reg_file_6__4_), .A1N(n320), 
        .Y(n91) );
  OAI2BB2X1M U223 ( .B0(n351), .B1(n317), .A0N(reg_file_7__4_), .A1N(n318), 
        .Y(n99) );
  OAI2BB2X1M U224 ( .B0(n351), .B1(n315), .A0N(reg_file_8__4_), .A1N(n316), 
        .Y(n107) );
  OAI2BB2X1M U225 ( .B0(n351), .B1(n313), .A0N(reg_file_9__4_), .A1N(n314), 
        .Y(n115) );
  OAI2BB2X1M U226 ( .B0(n351), .B1(n311), .A0N(reg_file_10__4_), .A1N(n312), 
        .Y(n123) );
  OAI2BB2X1M U227 ( .B0(n351), .B1(n309), .A0N(reg_file_11__4_), .A1N(n310), 
        .Y(n131) );
  OAI2BB2X1M U228 ( .B0(n351), .B1(n307), .A0N(reg_file_12__4_), .A1N(n308), 
        .Y(n139) );
  OAI2BB2X1M U229 ( .B0(n351), .B1(n305), .A0N(reg_file_13__4_), .A1N(n306), 
        .Y(n147) );
  OAI2BB2X1M U230 ( .B0(n351), .B1(n303), .A0N(reg_file_14__4_), .A1N(n304), 
        .Y(n155) );
  OAI2BB2X1M U231 ( .B0(n351), .B1(n301), .A0N(reg_file_15__4_), .A1N(n302), 
        .Y(n163) );
  OAI2BB2X1M U232 ( .B0(n331), .B1(n353), .A0N(REG0[6]), .A1N(n332), .Y(n45)
         );
  OAI2BB2X1M U233 ( .B0(n331), .B1(n354), .A0N(REG0[7]), .A1N(n332), .Y(n46)
         );
  OAI2BB2X1M U234 ( .B0(n354), .B1(n329), .A0N(REG1[7]), .A1N(n330), .Y(n54)
         );
  OAI2BB2X1M U235 ( .B0(n353), .B1(n327), .A0N(n362), .A1N(n328), .Y(n61) );
  OAI2BB2X1M U236 ( .B0(n353), .B1(n325), .A0N(REG3[6]), .A1N(n326), .Y(n69)
         );
  OAI2BB2X1M U237 ( .B0(n354), .B1(n325), .A0N(REG3[7]), .A1N(n326), .Y(n70)
         );
  OAI2BB2X1M U238 ( .B0(n353), .B1(n323), .A0N(reg_file_4__6_), .A1N(n324), 
        .Y(n77) );
  OAI2BB2X1M U239 ( .B0(n354), .B1(n323), .A0N(reg_file_4__7_), .A1N(n324), 
        .Y(n78) );
  OAI2BB2X1M U240 ( .B0(n353), .B1(n321), .A0N(reg_file_5__6_), .A1N(n322), 
        .Y(n85) );
  OAI2BB2X1M U241 ( .B0(n354), .B1(n321), .A0N(reg_file_5__7_), .A1N(n322), 
        .Y(n86) );
  OAI2BB2X1M U242 ( .B0(n353), .B1(n319), .A0N(reg_file_6__6_), .A1N(n320), 
        .Y(n93) );
  OAI2BB2X1M U243 ( .B0(n354), .B1(n319), .A0N(reg_file_6__7_), .A1N(n320), 
        .Y(n94) );
  OAI2BB2X1M U244 ( .B0(n353), .B1(n317), .A0N(reg_file_7__6_), .A1N(n318), 
        .Y(n101) );
  OAI2BB2X1M U245 ( .B0(n354), .B1(n317), .A0N(reg_file_7__7_), .A1N(n318), 
        .Y(n102) );
  OAI2BB2X1M U246 ( .B0(n353), .B1(n315), .A0N(reg_file_8__6_), .A1N(n316), 
        .Y(n109) );
  OAI2BB2X1M U247 ( .B0(n354), .B1(n315), .A0N(reg_file_8__7_), .A1N(n316), 
        .Y(n110) );
  OAI2BB2X1M U248 ( .B0(n353), .B1(n313), .A0N(reg_file_9__6_), .A1N(n314), 
        .Y(n117) );
  OAI2BB2X1M U249 ( .B0(n354), .B1(n313), .A0N(reg_file_9__7_), .A1N(n314), 
        .Y(n118) );
  OAI2BB2X1M U250 ( .B0(n353), .B1(n311), .A0N(reg_file_10__6_), .A1N(n312), 
        .Y(n125) );
  OAI2BB2X1M U251 ( .B0(n354), .B1(n311), .A0N(reg_file_10__7_), .A1N(n312), 
        .Y(n126) );
  OAI2BB2X1M U252 ( .B0(n353), .B1(n309), .A0N(reg_file_11__6_), .A1N(n310), 
        .Y(n133) );
  OAI2BB2X1M U253 ( .B0(n354), .B1(n309), .A0N(reg_file_11__7_), .A1N(n310), 
        .Y(n134) );
  OAI2BB2X1M U254 ( .B0(n353), .B1(n307), .A0N(reg_file_12__6_), .A1N(n308), 
        .Y(n141) );
  OAI2BB2X1M U255 ( .B0(n354), .B1(n307), .A0N(reg_file_12__7_), .A1N(n308), 
        .Y(n142) );
  OAI2BB2X1M U256 ( .B0(n353), .B1(n305), .A0N(reg_file_13__6_), .A1N(n306), 
        .Y(n149) );
  OAI2BB2X1M U257 ( .B0(n354), .B1(n305), .A0N(reg_file_13__7_), .A1N(n306), 
        .Y(n150) );
  OAI2BB2X1M U258 ( .B0(n353), .B1(n303), .A0N(reg_file_14__6_), .A1N(n304), 
        .Y(n157) );
  OAI2BB2X1M U259 ( .B0(n354), .B1(n303), .A0N(reg_file_14__7_), .A1N(n304), 
        .Y(n158) );
  OAI2BB2X1M U260 ( .B0(n353), .B1(n301), .A0N(reg_file_15__6_), .A1N(n302), 
        .Y(n165) );
  OAI2BB2X1M U261 ( .B0(n354), .B1(n301), .A0N(reg_file_15__7_), .A1N(n302), 
        .Y(n166) );
  OAI2BB2X1M U262 ( .B0(n347), .B1(n328), .A0N(REG2[0]), .A1N(n328), .Y(n55)
         );
  OAI2BB2X1M U263 ( .B0(n354), .B1(n327), .A0N(REG2[7]), .A1N(n328), .Y(n62)
         );
  NOR2X1M U264 ( .A(n282), .B(address[0]), .Y(n271) );
  AOI22X1M U265 ( .A0(reg_file_10__0_), .A1(n291), .B0(reg_file_11__0_), .B1(
        n287), .Y(n178) );
  AOI22X1M U266 ( .A0(reg_file_8__0_), .A1(n299), .B0(reg_file_9__0_), .B1(
        n295), .Y(n177) );
  AOI21X1M U267 ( .A0(n178), .A1(n177), .B0(n261), .Y(n188) );
  AOI22X1M U268 ( .A0(reg_file_14__0_), .A1(n291), .B0(reg_file_15__0_), .B1(
        n287), .Y(n180) );
  AOI22X1M U269 ( .A0(reg_file_12__0_), .A1(n299), .B0(reg_file_13__0_), .B1(
        n295), .Y(n179) );
  AOI21X1M U270 ( .A0(n180), .A1(n179), .B0(n264), .Y(n187) );
  AOI22X1M U271 ( .A0(REG2[0]), .A1(n291), .B0(REG3[0]), .B1(n287), .Y(n182)
         );
  AOI22X1M U272 ( .A0(REG0[0]), .A1(n299), .B0(REG1[0]), .B1(n295), .Y(n181)
         );
  AOI21X1M U273 ( .A0(n182), .A1(n181), .B0(n267), .Y(n186) );
  AOI22X1M U274 ( .A0(reg_file_6__0_), .A1(n291), .B0(reg_file_7__0_), .B1(
        n287), .Y(n184) );
  AOI22X1M U275 ( .A0(reg_file_4__0_), .A1(n299), .B0(reg_file_5__0_), .B1(
        n295), .Y(n183) );
  AOI21X1M U276 ( .A0(n184), .A1(n183), .B0(n273), .Y(n185) );
  OR4X1M U277 ( .A(n188), .B(n187), .C(n186), .D(n185), .Y(N43) );
  AOI22X1M U278 ( .A0(reg_file_10__1_), .A1(n291), .B0(reg_file_11__1_), .B1(
        n287), .Y(n190) );
  AOI22X1M U279 ( .A0(reg_file_8__1_), .A1(n299), .B0(reg_file_9__1_), .B1(
        n295), .Y(n189) );
  AOI21X1M U280 ( .A0(n190), .A1(n189), .B0(n261), .Y(n200) );
  AOI22X1M U281 ( .A0(reg_file_14__1_), .A1(n291), .B0(reg_file_15__1_), .B1(
        n287), .Y(n192) );
  AOI22X1M U282 ( .A0(reg_file_12__1_), .A1(n299), .B0(reg_file_13__1_), .B1(
        n295), .Y(n191) );
  AOI21X1M U283 ( .A0(n192), .A1(n191), .B0(n264), .Y(n199) );
  AOI22X1M U284 ( .A0(REG2[1]), .A1(n291), .B0(REG3[1]), .B1(n287), .Y(n194)
         );
  AOI22X1M U285 ( .A0(REG0[1]), .A1(n299), .B0(REG1[1]), .B1(n295), .Y(n193)
         );
  AOI21X1M U286 ( .A0(n194), .A1(n193), .B0(n267), .Y(n198) );
  AOI22X1M U287 ( .A0(reg_file_6__1_), .A1(n291), .B0(reg_file_7__1_), .B1(
        n287), .Y(n196) );
  AOI22X1M U288 ( .A0(reg_file_4__1_), .A1(n299), .B0(reg_file_5__1_), .B1(
        n295), .Y(n195) );
  AOI21X1M U289 ( .A0(n196), .A1(n195), .B0(n273), .Y(n197) );
  OR4X1M U290 ( .A(n200), .B(n199), .C(n198), .D(n197), .Y(N42) );
  AOI22X1M U291 ( .A0(reg_file_10__2_), .A1(n291), .B0(reg_file_11__2_), .B1(
        n287), .Y(n202) );
  AOI22X1M U292 ( .A0(reg_file_8__2_), .A1(n299), .B0(reg_file_9__2_), .B1(
        n295), .Y(n201) );
  AOI21X1M U293 ( .A0(n202), .A1(n201), .B0(n261), .Y(n212) );
  AOI22X1M U294 ( .A0(reg_file_14__2_), .A1(n291), .B0(reg_file_15__2_), .B1(
        n287), .Y(n204) );
  AOI22X1M U295 ( .A0(reg_file_12__2_), .A1(n299), .B0(reg_file_13__2_), .B1(
        n295), .Y(n203) );
  AOI21X1M U296 ( .A0(n204), .A1(n203), .B0(n264), .Y(n211) );
  AOI22X1M U297 ( .A0(REG2[2]), .A1(n291), .B0(REG3[2]), .B1(n287), .Y(n206)
         );
  AOI22X1M U298 ( .A0(REG0[2]), .A1(n299), .B0(REG1[2]), .B1(n295), .Y(n205)
         );
  AOI21X1M U299 ( .A0(n206), .A1(n205), .B0(n267), .Y(n210) );
  AOI22X1M U300 ( .A0(reg_file_6__2_), .A1(n291), .B0(reg_file_7__2_), .B1(
        n287), .Y(n208) );
  AOI22X1M U301 ( .A0(reg_file_4__2_), .A1(n299), .B0(reg_file_5__2_), .B1(
        n295), .Y(n207) );
  AOI21X1M U302 ( .A0(n208), .A1(n207), .B0(n273), .Y(n209) );
  OR4X1M U303 ( .A(n212), .B(n211), .C(n210), .D(n209), .Y(N41) );
  AOI22X1M U304 ( .A0(reg_file_10__3_), .A1(n290), .B0(reg_file_11__3_), .B1(
        n286), .Y(n214) );
  AOI22X1M U305 ( .A0(reg_file_8__3_), .A1(n298), .B0(reg_file_9__3_), .B1(
        n294), .Y(n213) );
  AOI21X1M U306 ( .A0(n214), .A1(n213), .B0(n261), .Y(n224) );
  AOI22X1M U307 ( .A0(reg_file_14__3_), .A1(n290), .B0(reg_file_15__3_), .B1(
        n286), .Y(n216) );
  AOI22X1M U308 ( .A0(reg_file_12__3_), .A1(n298), .B0(reg_file_13__3_), .B1(
        n294), .Y(n215) );
  AOI21X1M U309 ( .A0(n216), .A1(n215), .B0(n264), .Y(n223) );
  AOI22X1M U310 ( .A0(n364), .A1(n290), .B0(REG3[3]), .B1(n286), .Y(n218) );
  AOI22X1M U311 ( .A0(REG0[3]), .A1(n298), .B0(REG1[3]), .B1(n294), .Y(n217)
         );
  AOI21X1M U312 ( .A0(n218), .A1(n217), .B0(n267), .Y(n222) );
  AOI22X1M U313 ( .A0(reg_file_6__3_), .A1(n290), .B0(reg_file_7__3_), .B1(
        n286), .Y(n220) );
  AOI22X1M U314 ( .A0(reg_file_4__3_), .A1(n298), .B0(reg_file_5__3_), .B1(
        n294), .Y(n219) );
  AOI21X1M U315 ( .A0(n220), .A1(n219), .B0(n273), .Y(n221) );
  OR4X1M U316 ( .A(n224), .B(n223), .C(n222), .D(n221), .Y(N40) );
  AOI22X1M U317 ( .A0(reg_file_10__4_), .A1(n290), .B0(reg_file_11__4_), .B1(
        n286), .Y(n226) );
  AOI22X1M U318 ( .A0(reg_file_8__4_), .A1(n298), .B0(reg_file_9__4_), .B1(
        n294), .Y(n225) );
  AOI21X1M U319 ( .A0(n226), .A1(n225), .B0(n261), .Y(n236) );
  AOI22X1M U320 ( .A0(reg_file_14__4_), .A1(n290), .B0(reg_file_15__4_), .B1(
        n286), .Y(n228) );
  AOI22X1M U321 ( .A0(reg_file_12__4_), .A1(n298), .B0(reg_file_13__4_), .B1(
        n294), .Y(n227) );
  AOI21X1M U322 ( .A0(n228), .A1(n227), .B0(n264), .Y(n235) );
  AOI22X1M U323 ( .A0(REG2[4]), .A1(n290), .B0(REG3[4]), .B1(n286), .Y(n230)
         );
  AOI21X1M U324 ( .A0(n230), .A1(n229), .B0(n267), .Y(n234) );
  AOI22X1M U325 ( .A0(reg_file_6__4_), .A1(n290), .B0(reg_file_7__4_), .B1(
        n286), .Y(n232) );
  AOI22X1M U326 ( .A0(reg_file_4__4_), .A1(n298), .B0(reg_file_5__4_), .B1(
        n294), .Y(n231) );
  AOI21X1M U327 ( .A0(n232), .A1(n231), .B0(n273), .Y(n233) );
  OR4X1M U328 ( .A(n236), .B(n235), .C(n234), .D(n233), .Y(N39) );
  AOI22X1M U329 ( .A0(reg_file_10__5_), .A1(n290), .B0(reg_file_11__5_), .B1(
        n286), .Y(n238) );
  AOI22X1M U330 ( .A0(reg_file_8__5_), .A1(n298), .B0(reg_file_9__5_), .B1(
        n294), .Y(n237) );
  AOI21X1M U331 ( .A0(n238), .A1(n237), .B0(n261), .Y(n248) );
  AOI22X1M U332 ( .A0(reg_file_14__5_), .A1(n290), .B0(reg_file_15__5_), .B1(
        n286), .Y(n240) );
  AOI22X1M U333 ( .A0(reg_file_12__5_), .A1(n298), .B0(reg_file_13__5_), .B1(
        n294), .Y(n239) );
  AOI21X1M U334 ( .A0(n240), .A1(n239), .B0(n264), .Y(n247) );
  AOI22X1M U335 ( .A0(REG2[5]), .A1(n290), .B0(REG3[5]), .B1(n286), .Y(n242)
         );
  AOI22X1M U336 ( .A0(REG0[5]), .A1(n298), .B0(REG1[5]), .B1(n294), .Y(n241)
         );
  AOI21X1M U337 ( .A0(n242), .A1(n241), .B0(n267), .Y(n246) );
  AOI22X1M U338 ( .A0(reg_file_6__5_), .A1(n290), .B0(reg_file_7__5_), .B1(
        n286), .Y(n244) );
  AOI22X1M U339 ( .A0(reg_file_4__5_), .A1(n298), .B0(reg_file_5__5_), .B1(
        n294), .Y(n243) );
  AOI21X1M U340 ( .A0(n244), .A1(n243), .B0(n273), .Y(n245) );
  OR4X1M U341 ( .A(n248), .B(n247), .C(n246), .D(n245), .Y(N38) );
  AOI22X1M U342 ( .A0(reg_file_10__6_), .A1(n289), .B0(reg_file_11__6_), .B1(
        n285), .Y(n250) );
  AOI22X1M U343 ( .A0(reg_file_8__6_), .A1(n297), .B0(reg_file_9__6_), .B1(
        n293), .Y(n249) );
  AOI21X1M U344 ( .A0(n250), .A1(n249), .B0(n261), .Y(n260) );
  AOI22X1M U345 ( .A0(reg_file_14__6_), .A1(n289), .B0(reg_file_15__6_), .B1(
        n285), .Y(n252) );
  AOI22X1M U346 ( .A0(reg_file_12__6_), .A1(n297), .B0(reg_file_13__6_), .B1(
        n293), .Y(n251) );
  AOI21X1M U347 ( .A0(n252), .A1(n251), .B0(n264), .Y(n259) );
  AOI22X1M U348 ( .A0(n362), .A1(n289), .B0(REG3[6]), .B1(n285), .Y(n254) );
  AOI21X1M U349 ( .A0(n254), .A1(n3), .B0(n267), .Y(n258) );
  AOI22X1M U350 ( .A0(reg_file_6__6_), .A1(n289), .B0(reg_file_7__6_), .B1(
        n285), .Y(n256) );
  AOI22X1M U351 ( .A0(reg_file_4__6_), .A1(n297), .B0(reg_file_5__6_), .B1(
        n293), .Y(n255) );
  AOI21X1M U352 ( .A0(n256), .A1(n255), .B0(n273), .Y(n257) );
  OR4X1M U353 ( .A(n260), .B(n259), .C(n258), .D(n257), .Y(N37) );
  AOI22X1M U354 ( .A0(reg_file_10__7_), .A1(n289), .B0(reg_file_11__7_), .B1(
        n285), .Y(n263) );
  AOI22X1M U355 ( .A0(reg_file_8__7_), .A1(n297), .B0(reg_file_9__7_), .B1(
        n293), .Y(n262) );
  AOI21X1M U356 ( .A0(n263), .A1(n262), .B0(n261), .Y(n279) );
  AOI22X1M U357 ( .A0(reg_file_14__7_), .A1(n289), .B0(reg_file_15__7_), .B1(
        n285), .Y(n266) );
  AOI22X1M U358 ( .A0(reg_file_12__7_), .A1(n297), .B0(reg_file_13__7_), .B1(
        n293), .Y(n265) );
  AOI21X1M U359 ( .A0(n266), .A1(n265), .B0(n264), .Y(n278) );
  AOI22X1M U360 ( .A0(REG2[7]), .A1(n289), .B0(REG3[7]), .B1(n285), .Y(n269)
         );
  AOI22X1M U361 ( .A0(REG0[7]), .A1(n297), .B0(REG1[7]), .B1(n293), .Y(n268)
         );
  AOI21X1M U362 ( .A0(n269), .A1(n268), .B0(n267), .Y(n277) );
  AOI22X1M U363 ( .A0(reg_file_6__7_), .A1(n289), .B0(reg_file_7__7_), .B1(
        n285), .Y(n275) );
  AOI22X1M U364 ( .A0(reg_file_4__7_), .A1(n297), .B0(reg_file_5__7_), .B1(
        n293), .Y(n274) );
  AOI21X1M U365 ( .A0(n275), .A1(n274), .B0(n273), .Y(n276) );
  OR4X1M U366 ( .A(n279), .B(n278), .C(n277), .D(n276), .Y(N36) );
endmodule


module decoder ( alu_fun, arith_en, logic_en, cmp_en, shift_en );
  input [1:0] alu_fun;
  output arith_en, logic_en, cmp_en, shift_en;
  wire   n2, n1;

  NOR2X2M U3 ( .A(n1), .B(n2), .Y(shift_en) );
  OR2X2M U4 ( .A(logic_en), .B(cmp_en), .Y(n2) );
  NOR2X8M U5 ( .A(n1), .B(alu_fun[1]), .Y(logic_en) );
  NOR2X6M U6 ( .A(alu_fun[0]), .B(n2), .Y(arith_en) );
  CLKINVX2M U7 ( .A(alu_fun[0]), .Y(n1) );
  NOR2BX4M U8 ( .AN(alu_fun[1]), .B(alu_fun[0]), .Y(cmp_en) );
endmodule


module arithmetic_unit_DW_div_uns_0 ( a, b, quotient, remainder, divide_by_0
 );
  input [7:0] a;
  input [7:0] b;
  output [7:0] quotient;
  output [7:0] remainder;
  output divide_by_0;
  wire   n32, n33, u_div_SumTmp_1__0_, u_div_SumTmp_1__1_, u_div_SumTmp_1__2_,
         u_div_SumTmp_1__3_, u_div_SumTmp_1__4_, u_div_SumTmp_1__5_,
         u_div_SumTmp_1__6_, u_div_SumTmp_2__0_, u_div_SumTmp_2__1_,
         u_div_SumTmp_2__2_, u_div_SumTmp_2__3_, u_div_SumTmp_2__4_,
         u_div_SumTmp_2__5_, u_div_SumTmp_3__0_, u_div_SumTmp_3__1_,
         u_div_SumTmp_3__2_, u_div_SumTmp_3__3_, u_div_SumTmp_3__4_,
         u_div_SumTmp_4__0_, u_div_SumTmp_4__1_, u_div_SumTmp_4__2_,
         u_div_SumTmp_4__3_, u_div_SumTmp_5__0_, u_div_SumTmp_5__1_,
         u_div_SumTmp_5__2_, u_div_SumTmp_6__0_, u_div_SumTmp_6__1_,
         u_div_SumTmp_7__0_, u_div_CryTmp_0__1_, u_div_CryTmp_0__2_,
         u_div_CryTmp_0__3_, u_div_CryTmp_0__4_, u_div_CryTmp_0__5_,
         u_div_CryTmp_0__6_, u_div_CryTmp_0__7_, u_div_CryTmp_1__1_,
         u_div_CryTmp_1__2_, u_div_CryTmp_1__3_, u_div_CryTmp_1__4_,
         u_div_CryTmp_1__5_, u_div_CryTmp_1__6_, u_div_CryTmp_1__7_,
         u_div_CryTmp_2__1_, u_div_CryTmp_2__2_, u_div_CryTmp_2__3_,
         u_div_CryTmp_2__4_, u_div_CryTmp_2__5_, u_div_CryTmp_2__6_,
         u_div_CryTmp_3__1_, u_div_CryTmp_3__2_, u_div_CryTmp_3__3_,
         u_div_CryTmp_3__4_, u_div_CryTmp_3__5_, u_div_CryTmp_4__1_,
         u_div_CryTmp_4__2_, u_div_CryTmp_4__3_, u_div_CryTmp_4__4_,
         u_div_CryTmp_5__1_, u_div_CryTmp_5__2_, u_div_CryTmp_5__3_,
         u_div_CryTmp_6__1_, u_div_CryTmp_6__2_, u_div_CryTmp_7__1_,
         u_div_PartRem_1__1_, u_div_PartRem_1__2_, u_div_PartRem_1__3_,
         u_div_PartRem_1__4_, u_div_PartRem_1__5_, u_div_PartRem_1__6_,
         u_div_PartRem_1__7_, u_div_PartRem_2__1_, u_div_PartRem_2__2_,
         u_div_PartRem_2__3_, u_div_PartRem_2__4_, u_div_PartRem_2__5_,
         u_div_PartRem_2__6_, u_div_PartRem_3__1_, u_div_PartRem_3__2_,
         u_div_PartRem_3__3_, u_div_PartRem_3__4_, u_div_PartRem_3__5_,
         u_div_PartRem_4__1_, u_div_PartRem_4__2_, u_div_PartRem_4__3_,
         u_div_PartRem_4__4_, u_div_PartRem_5__1_, u_div_PartRem_5__2_,
         u_div_PartRem_5__3_, u_div_PartRem_6__1_, u_div_PartRem_6__2_,
         u_div_PartRem_7__1_, n1, n2, n4, n5, n6, n7, n8, n9, n10, n11, n12,
         n13, n14, n15, n16, n17, n18, n20, n21, n22, n23, n24, n25, n26, n27,
         n28, n29, n30, n31;

  ADDFX2M u_div_u_fa_PartRem_0_0_6 ( .A(u_div_PartRem_1__6_), .B(n22), .CI(
        u_div_CryTmp_0__6_), .CO(u_div_CryTmp_0__7_) );
  ADDFX2M u_div_u_fa_PartRem_0_1_3 ( .A(u_div_PartRem_2__3_), .B(n25), .CI(
        u_div_CryTmp_1__3_), .CO(u_div_CryTmp_1__4_), .S(u_div_SumTmp_1__3_)
         );
  ADDFX2M u_div_u_fa_PartRem_0_0_3 ( .A(u_div_PartRem_1__3_), .B(n25), .CI(
        u_div_CryTmp_0__3_), .CO(u_div_CryTmp_0__4_) );
  ADDFX2M u_div_u_fa_PartRem_0_2_4 ( .A(u_div_PartRem_3__4_), .B(n24), .CI(
        u_div_CryTmp_2__4_), .CO(u_div_CryTmp_2__5_), .S(u_div_SumTmp_2__4_)
         );
  ADDFX2M u_div_u_fa_PartRem_0_2_3 ( .A(u_div_PartRem_3__3_), .B(n25), .CI(
        u_div_CryTmp_2__3_), .CO(u_div_CryTmp_2__4_), .S(u_div_SumTmp_2__3_)
         );
  ADDFX2M u_div_u_fa_PartRem_0_0_4 ( .A(u_div_PartRem_1__4_), .B(n24), .CI(
        u_div_CryTmp_0__4_), .CO(u_div_CryTmp_0__5_) );
  ADDFX2M u_div_u_fa_PartRem_0_3_3 ( .A(u_div_PartRem_4__3_), .B(n25), .CI(
        u_div_CryTmp_3__3_), .CO(u_div_CryTmp_3__4_), .S(u_div_SumTmp_3__3_)
         );
  ADDFX2M u_div_u_fa_PartRem_0_1_5 ( .A(u_div_PartRem_2__5_), .B(n23), .CI(
        u_div_CryTmp_1__5_), .CO(u_div_CryTmp_1__6_), .S(u_div_SumTmp_1__5_)
         );
  ADDFX2M u_div_u_fa_PartRem_0_3_4 ( .A(u_div_PartRem_4__4_), .B(n24), .CI(
        u_div_CryTmp_3__4_), .CO(u_div_CryTmp_3__5_), .S(u_div_SumTmp_3__4_)
         );
  ADDFX2M u_div_u_fa_PartRem_0_3_2 ( .A(u_div_PartRem_4__2_), .B(n26), .CI(
        u_div_CryTmp_3__2_), .CO(u_div_CryTmp_3__3_), .S(u_div_SumTmp_3__2_)
         );
  ADDFHX8M u_div_u_fa_PartRem_0_4_2 ( .A(u_div_PartRem_5__2_), .B(n26), .CI(
        u_div_CryTmp_4__2_), .CO(u_div_CryTmp_4__3_), .S(u_div_SumTmp_4__2_)
         );
  ADDFHX8M u_div_u_fa_PartRem_0_0_7 ( .A(u_div_PartRem_1__7_), .B(n21), .CI(
        u_div_CryTmp_0__7_), .CO(quotient[0]) );
  ADDFHX8M u_div_u_fa_PartRem_0_1_1 ( .A(u_div_PartRem_2__1_), .B(n27), .CI(
        u_div_CryTmp_1__1_), .CO(u_div_CryTmp_1__2_), .S(u_div_SumTmp_1__1_)
         );
  ADDFHX8M u_div_u_fa_PartRem_0_1_2 ( .A(u_div_PartRem_2__2_), .B(n26), .CI(
        u_div_CryTmp_1__2_), .CO(u_div_CryTmp_1__3_), .S(u_div_SumTmp_1__2_)
         );
  ADDFHX8M u_div_u_fa_PartRem_0_1_6 ( .A(u_div_PartRem_2__6_), .B(n22), .CI(
        u_div_CryTmp_1__6_), .CO(u_div_CryTmp_1__7_), .S(u_div_SumTmp_1__6_)
         );
  ADDFHX4M u_div_u_fa_PartRem_0_0_2 ( .A(u_div_PartRem_1__2_), .B(n26), .CI(
        u_div_CryTmp_0__2_), .CO(u_div_CryTmp_0__3_) );
  ADDFHX4M u_div_u_fa_PartRem_0_6_1 ( .A(n1), .B(n27), .CI(u_div_CryTmp_6__1_), 
        .CO(u_div_CryTmp_6__2_), .S(u_div_SumTmp_6__1_) );
  ADDFHX8M u_div_u_fa_PartRem_0_5_1 ( .A(u_div_PartRem_6__1_), .B(n27), .CI(
        u_div_CryTmp_5__1_), .CO(u_div_CryTmp_5__2_), .S(u_div_SumTmp_5__1_)
         );
  ADDFHX8M u_div_u_fa_PartRem_0_5_2 ( .A(u_div_PartRem_6__2_), .B(n26), .CI(
        u_div_CryTmp_5__2_), .CO(u_div_CryTmp_5__3_), .S(u_div_SumTmp_5__2_)
         );
  ADDFHX8M u_div_u_fa_PartRem_0_4_3 ( .A(n2), .B(n25), .CI(u_div_CryTmp_4__3_), 
        .CO(u_div_CryTmp_4__4_), .S(u_div_SumTmp_4__3_) );
  ADDFHX8M u_div_u_fa_PartRem_0_2_2 ( .A(u_div_PartRem_3__2_), .B(n26), .CI(
        u_div_CryTmp_2__2_), .CO(u_div_CryTmp_2__3_), .S(u_div_SumTmp_2__2_)
         );
  ADDFX4M u_div_u_fa_PartRem_0_2_5 ( .A(u_div_PartRem_3__5_), .B(n23), .CI(
        u_div_CryTmp_2__5_), .CO(u_div_CryTmp_2__6_), .S(u_div_SumTmp_2__5_)
         );
  ADDFX4M u_div_u_fa_PartRem_0_0_5 ( .A(u_div_PartRem_1__5_), .B(n23), .CI(
        u_div_CryTmp_0__5_), .CO(u_div_CryTmp_0__6_) );
  ADDFX2M u_div_u_fa_PartRem_0_1_4 ( .A(u_div_PartRem_2__4_), .B(n24), .CI(
        u_div_CryTmp_1__4_), .CO(u_div_CryTmp_1__5_), .S(u_div_SumTmp_1__4_)
         );
  CLKMX2X4M U1 ( .A(a[1]), .B(u_div_SumTmp_1__0_), .S0(quotient[1]), .Y(
        u_div_PartRem_1__1_) );
  BUFX16M U2 ( .A(u_div_PartRem_7__1_), .Y(n1) );
  INVX32M U3 ( .A(b[0]), .Y(n28) );
  NAND2X4M U4 ( .A(u_div_PartRem_3__1_), .B(u_div_CryTmp_2__1_), .Y(n8) );
  INVX10M U5 ( .A(b[5]), .Y(n23) );
  MX2X8M U6 ( .A(a[3]), .B(u_div_SumTmp_3__0_), .S0(quotient[3]), .Y(
        u_div_PartRem_3__1_) );
  MX2X4M U7 ( .A(a[6]), .B(u_div_SumTmp_6__0_), .S0(quotient[6]), .Y(
        u_div_PartRem_6__1_) );
  CLKINVX32M U8 ( .A(b[4]), .Y(n24) );
  INVX18M U9 ( .A(b[1]), .Y(n27) );
  INVX8M U10 ( .A(b[2]), .Y(n26) );
  MX2XLM U11 ( .A(u_div_PartRem_2__5_), .B(u_div_SumTmp_1__5_), .S0(
        quotient[1]), .Y(u_div_PartRem_1__6_) );
  OR2X2M U12 ( .A(a[2]), .B(n28), .Y(u_div_CryTmp_2__1_) );
  MX2X4M U13 ( .A(a[2]), .B(u_div_SumTmp_2__0_), .S0(quotient[2]), .Y(
        u_div_PartRem_2__1_) );
  NAND2X4M U14 ( .A(u_div_PartRem_4__1_), .B(u_div_CryTmp_3__1_), .Y(n15) );
  NAND2X4M U15 ( .A(u_div_PartRem_5__1_), .B(n27), .Y(n12) );
  NAND2X2M U16 ( .A(u_div_CryTmp_2__1_), .B(n27), .Y(n10) );
  CLKXOR2X2M U17 ( .A(u_div_PartRem_3__1_), .B(n7), .Y(u_div_SumTmp_2__1_) );
  MX2X2M U18 ( .A(u_div_PartRem_2__4_), .B(u_div_SumTmp_1__4_), .S0(
        quotient[1]), .Y(u_div_PartRem_1__5_) );
  MX2X2M U19 ( .A(u_div_PartRem_2__3_), .B(u_div_SumTmp_1__3_), .S0(
        quotient[1]), .Y(u_div_PartRem_1__4_) );
  BUFX20M U20 ( .A(n32), .Y(quotient[5]) );
  AND2X2M U21 ( .A(n29), .B(n26), .Y(n20) );
  CLKMX2X6M U22 ( .A(u_div_PartRem_4__1_), .B(u_div_SumTmp_3__1_), .S0(
        quotient[3]), .Y(u_div_PartRem_3__2_) );
  MX2X2M U23 ( .A(n1), .B(u_div_SumTmp_6__1_), .S0(quotient[6]), .Y(
        u_div_PartRem_6__2_) );
  BUFX10M U24 ( .A(n33), .Y(quotient[4]) );
  NAND2X4M U25 ( .A(u_div_PartRem_4__1_), .B(n27), .Y(n16) );
  AND2X2M U26 ( .A(u_div_CryTmp_4__4_), .B(n30), .Y(n33) );
  AND3X4M U27 ( .A(n31), .B(n24), .C(n23), .Y(n30) );
  AND4X6M U28 ( .A(u_div_CryTmp_7__1_), .B(n29), .C(n27), .D(n26), .Y(
        quotient[7]) );
  MX2X2M U29 ( .A(n2), .B(u_div_SumTmp_4__3_), .S0(quotient[4]), .Y(
        u_div_PartRem_4__4_) );
  INVX2M U30 ( .A(b[6]), .Y(n22) );
  MX2X1M U31 ( .A(u_div_PartRem_3__2_), .B(u_div_SumTmp_2__2_), .S0(
        quotient[2]), .Y(u_div_PartRem_2__3_) );
  AND2X12M U32 ( .A(u_div_CryTmp_3__5_), .B(n18), .Y(quotient[3]) );
  AND2X8M U33 ( .A(u_div_CryTmp_2__6_), .B(n31), .Y(quotient[2]) );
  BUFX16M U34 ( .A(u_div_PartRem_5__3_), .Y(n2) );
  AND2X12M U35 ( .A(u_div_CryTmp_5__3_), .B(n29), .Y(n32) );
  AND2X12M U36 ( .A(n30), .B(n25), .Y(n29) );
  MX2X1M U37 ( .A(u_div_PartRem_6__2_), .B(u_div_SumTmp_5__2_), .S0(
        quotient[5]), .Y(u_div_PartRem_5__3_) );
  CLKMX2X12M U38 ( .A(u_div_PartRem_6__1_), .B(u_div_SumTmp_5__1_), .S0(
        quotient[5]), .Y(u_div_PartRem_5__2_) );
  AND2X12M U39 ( .A(u_div_CryTmp_6__2_), .B(n20), .Y(quotient[6]) );
  MX2X8M U40 ( .A(a[4]), .B(u_div_SumTmp_4__0_), .S0(quotient[4]), .Y(
        u_div_PartRem_4__1_) );
  NOR2X12M U41 ( .A(b[6]), .B(b[7]), .Y(n31) );
  NAND2X2M U42 ( .A(u_div_PartRem_1__1_), .B(u_div_CryTmp_0__1_), .Y(n4) );
  NAND2X2M U43 ( .A(u_div_PartRem_1__1_), .B(n27), .Y(n5) );
  CLKNAND2X2M U44 ( .A(u_div_CryTmp_0__1_), .B(n27), .Y(n6) );
  NAND3X12M U45 ( .A(n6), .B(n5), .C(n4), .Y(u_div_CryTmp_0__2_) );
  MX2XLM U46 ( .A(u_div_PartRem_2__1_), .B(u_div_SumTmp_1__1_), .S0(
        quotient[1]), .Y(u_div_PartRem_1__2_) );
  MX2X6M U47 ( .A(u_div_PartRem_2__2_), .B(u_div_SumTmp_1__2_), .S0(
        quotient[1]), .Y(u_div_PartRem_1__3_) );
  AND2X12M U48 ( .A(u_div_CryTmp_1__7_), .B(n21), .Y(quotient[1]) );
  CLKXOR2X2M U49 ( .A(u_div_CryTmp_2__1_), .B(n27), .Y(n7) );
  CLKNAND2X8M U50 ( .A(u_div_PartRem_3__1_), .B(n27), .Y(n9) );
  NAND3X12M U51 ( .A(n10), .B(n9), .C(n8), .Y(u_div_CryTmp_2__2_) );
  MX2X12M U52 ( .A(a[5]), .B(u_div_SumTmp_5__0_), .S0(quotient[5]), .Y(
        u_div_PartRem_5__1_) );
  MX2X1M U53 ( .A(u_div_PartRem_4__3_), .B(u_div_SumTmp_3__3_), .S0(
        quotient[3]), .Y(u_div_PartRem_3__4_) );
  XOR2X1M U54 ( .A(u_div_PartRem_4__1_), .B(n14), .Y(u_div_SumTmp_3__1_) );
  XOR3X2M U55 ( .A(u_div_PartRem_5__1_), .B(u_div_CryTmp_4__1_), .C(n27), .Y(
        u_div_SumTmp_4__1_) );
  NAND2X8M U56 ( .A(u_div_PartRem_5__1_), .B(u_div_CryTmp_4__1_), .Y(n11) );
  NAND2X2M U57 ( .A(u_div_CryTmp_4__1_), .B(n27), .Y(n13) );
  NAND3X12M U58 ( .A(n13), .B(n12), .C(n11), .Y(u_div_CryTmp_4__2_) );
  OR2X2M U59 ( .A(a[3]), .B(n28), .Y(u_div_CryTmp_3__1_) );
  NAND2X1M U60 ( .A(u_div_CryTmp_3__1_), .B(n27), .Y(n17) );
  NAND3X2M U61 ( .A(n17), .B(n16), .C(n15), .Y(u_div_CryTmp_3__2_) );
  CLKXOR2X2M U62 ( .A(u_div_CryTmp_3__1_), .B(n27), .Y(n14) );
  MX2X1M U63 ( .A(u_div_PartRem_4__2_), .B(u_div_SumTmp_3__2_), .S0(
        quotient[3]), .Y(u_div_PartRem_3__3_) );
  MX2X1M U64 ( .A(u_div_PartRem_4__4_), .B(u_div_SumTmp_3__4_), .S0(
        quotient[3]), .Y(u_div_PartRem_3__5_) );
  CLKAND2X2M U65 ( .A(n23), .B(n31), .Y(n18) );
  INVX8M U66 ( .A(b[3]), .Y(n25) );
  OR2X1M U67 ( .A(a[0]), .B(n28), .Y(u_div_CryTmp_0__1_) );
  MX2X1M U68 ( .A(u_div_PartRem_3__5_), .B(u_div_SumTmp_2__5_), .S0(
        quotient[2]), .Y(u_div_PartRem_2__6_) );
  MX2X1M U69 ( .A(u_div_PartRem_3__4_), .B(u_div_SumTmp_2__4_), .S0(
        quotient[2]), .Y(u_div_PartRem_2__5_) );
  MX2X1M U70 ( .A(u_div_PartRem_5__1_), .B(u_div_SumTmp_4__1_), .S0(
        quotient[4]), .Y(u_div_PartRem_4__2_) );
  XNOR2X1M U71 ( .A(n28), .B(a[5]), .Y(u_div_SumTmp_5__0_) );
  XNOR2X1M U72 ( .A(n28), .B(a[4]), .Y(u_div_SumTmp_4__0_) );
  MX2X2M U73 ( .A(u_div_PartRem_3__1_), .B(u_div_SumTmp_2__1_), .S0(
        quotient[2]), .Y(u_div_PartRem_2__2_) );
  XNOR2X1M U74 ( .A(n28), .B(a[7]), .Y(u_div_SumTmp_7__0_) );
  XNOR2X2M U75 ( .A(n28), .B(a[3]), .Y(u_div_SumTmp_3__0_) );
  XNOR2X1M U76 ( .A(n28), .B(a[6]), .Y(u_div_SumTmp_6__0_) );
  OR2X2M U77 ( .A(a[1]), .B(n28), .Y(u_div_CryTmp_1__1_) );
  XNOR2X2M U78 ( .A(n28), .B(a[2]), .Y(u_div_SumTmp_2__0_) );
  OR2X1M U79 ( .A(a[7]), .B(n28), .Y(u_div_CryTmp_7__1_) );
  OR2X2M U80 ( .A(a[5]), .B(n28), .Y(u_div_CryTmp_5__1_) );
  OR2X2M U81 ( .A(a[4]), .B(n28), .Y(u_div_CryTmp_4__1_) );
  OR2X1M U82 ( .A(a[6]), .B(n28), .Y(u_div_CryTmp_6__1_) );
  XNOR2X1M U83 ( .A(n28), .B(a[1]), .Y(u_div_SumTmp_1__0_) );
  CLKINVX1M U84 ( .A(b[7]), .Y(n21) );
  MX2X1M U85 ( .A(u_div_PartRem_2__6_), .B(u_div_SumTmp_1__6_), .S0(
        quotient[1]), .Y(u_div_PartRem_1__7_) );
  CLKMX2X2M U86 ( .A(a[7]), .B(u_div_SumTmp_7__0_), .S0(quotient[7]), .Y(
        u_div_PartRem_7__1_) );
  CLKMX2X2M U87 ( .A(u_div_PartRem_5__2_), .B(u_div_SumTmp_4__2_), .S0(
        quotient[4]), .Y(u_div_PartRem_4__3_) );
  CLKMX2X2M U88 ( .A(u_div_PartRem_3__3_), .B(u_div_SumTmp_2__3_), .S0(
        quotient[2]), .Y(u_div_PartRem_2__4_) );
endmodule


module arithmetic_unit_DW01_sub_0 ( A, B, CI, DIFF, CO );
  input [8:0] A;
  input [8:0] B;
  output [8:0] DIFF;
  input CI;
  output CO;
  wire   n1, n2, n3, n4, n5, n6, n7, n8;
  wire   [8:1] carry;

  ADDFX2M U2_7 ( .A(A[7]), .B(n1), .CI(carry[7]), .CO(carry[8]), .S(DIFF[7])
         );
  ADDFX2M U2_6 ( .A(A[6]), .B(n2), .CI(carry[6]), .CO(carry[7]), .S(DIFF[6])
         );
  ADDFX2M U2_5 ( .A(A[5]), .B(n3), .CI(carry[5]), .CO(carry[6]), .S(DIFF[5])
         );
  ADDFX2M U2_4 ( .A(A[4]), .B(n4), .CI(carry[4]), .CO(carry[5]), .S(DIFF[4])
         );
  ADDFX2M U2_3 ( .A(A[3]), .B(n5), .CI(carry[3]), .CO(carry[4]), .S(DIFF[3])
         );
  ADDFX2M U2_2 ( .A(A[2]), .B(n6), .CI(carry[2]), .CO(carry[3]), .S(DIFF[2])
         );
  ADDFX2M U2_1 ( .A(A[1]), .B(n7), .CI(carry[1]), .CO(carry[2]), .S(DIFF[1])
         );
  XOR3XLM U2_8 ( .A(A[8]), .B(n1), .C(carry[8]), .Y(DIFF[8]) );
  CLKINVX1M U1 ( .A(B[0]), .Y(n8) );
  INVXLM U2 ( .A(B[1]), .Y(n7) );
  INVXLM U3 ( .A(B[4]), .Y(n4) );
  INVXLM U4 ( .A(B[5]), .Y(n3) );
  INVXLM U5 ( .A(B[2]), .Y(n6) );
  INVXLM U6 ( .A(B[3]), .Y(n5) );
  CLKINVX1M U7 ( .A(B[8]), .Y(n1) );
  OR2X1M U8 ( .A(A[0]), .B(n8), .Y(carry[1]) );
  INVXLM U9 ( .A(B[6]), .Y(n2) );
  XNOR2X1M U10 ( .A(n8), .B(A[0]), .Y(DIFF[0]) );
endmodule


module arithmetic_unit_DW01_add_0 ( A, B, CI, SUM, CO );
  input [8:0] A;
  input [8:0] B;
  output [8:0] SUM;
  input CI;
  output CO;
  wire   n1;
  wire   [8:2] carry;

  ADDFX2M U1_3 ( .A(A[3]), .B(B[3]), .CI(carry[3]), .CO(carry[4]), .S(SUM[3])
         );
  ADDFX2M U1_2 ( .A(A[2]), .B(B[2]), .CI(carry[2]), .CO(carry[3]), .S(SUM[2])
         );
  ADDFX2M U1_5 ( .A(A[5]), .B(B[5]), .CI(carry[5]), .CO(carry[6]), .S(SUM[5])
         );
  ADDFX2M U1_1 ( .A(A[1]), .B(B[1]), .CI(n1), .CO(carry[2]), .S(SUM[1]) );
  ADDFX2M U1_7 ( .A(A[7]), .B(B[7]), .CI(carry[7]), .CO(carry[8]), .S(SUM[7])
         );
  ADDFX2M U1_6 ( .A(A[6]), .B(B[6]), .CI(carry[6]), .CO(carry[7]), .S(SUM[6])
         );
  ADDFX2M U1_4 ( .A(A[4]), .B(B[4]), .CI(carry[4]), .CO(carry[5]), .S(SUM[4])
         );
  XOR3XLM U1_8 ( .A(A[8]), .B(B[8]), .C(carry[8]), .Y(SUM[8]) );
  AND2X2M U1 ( .A(B[0]), .B(A[0]), .Y(n1) );
  CLKXOR2X2M U2 ( .A(B[0]), .B(A[0]), .Y(SUM[0]) );
endmodule


module arithmetic_unit_DW01_add_1 ( A, B, CI, SUM, CO );
  input [13:0] A;
  input [13:0] B;
  output [13:0] SUM;
  input CI;
  output CO;
  wire   n1, n8, n9, n10, n11, n12, n13, n14, n15, n16, n17, n18, n19, n20,
         n21, n22, n23, n24, n25, n26, n27, n28, n29, n30;

  AOI2BB1X2M U2 ( .A0N(n10), .A1N(n13), .B0(n12), .Y(n27) );
  NOR2X2M U3 ( .A(B[9]), .B(A[9]), .Y(n13) );
  NOR2X2M U4 ( .A(B[8]), .B(A[8]), .Y(n16) );
  NOR2X2M U5 ( .A(B[11]), .B(A[11]), .Y(n22) );
  NOR2X2M U6 ( .A(B[10]), .B(A[10]), .Y(n26) );
  BUFX2M U7 ( .A(n20), .Y(n1) );
  NOR2X4M U8 ( .A(n9), .B(n8), .Y(n18) );
  INVX2M U9 ( .A(A[6]), .Y(n8) );
  INVX2M U10 ( .A(B[6]), .Y(n9) );
  BUFX2M U11 ( .A(A[0]), .Y(SUM[0]) );
  BUFX2M U12 ( .A(A[1]), .Y(SUM[1]) );
  BUFX2M U13 ( .A(A[2]), .Y(SUM[2]) );
  BUFX2M U14 ( .A(A[3]), .Y(SUM[3]) );
  BUFX2M U15 ( .A(A[4]), .Y(SUM[4]) );
  BUFX2M U16 ( .A(A[5]), .Y(SUM[5]) );
  XNOR2X1M U17 ( .A(n10), .B(n11), .Y(SUM[9]) );
  NOR2X1M U18 ( .A(n12), .B(n13), .Y(n11) );
  CLKXOR2X2M U19 ( .A(n14), .B(n15), .Y(SUM[8]) );
  NAND2BX1M U20 ( .AN(n16), .B(n17), .Y(n14) );
  XOR3XLM U21 ( .A(B[7]), .B(A[7]), .C(n18), .Y(SUM[7]) );
  AOI21X1M U22 ( .A0(n9), .A1(n8), .B0(n18), .Y(SUM[6]) );
  XOR3XLM U23 ( .A(B[13]), .B(A[13]), .C(n19), .Y(SUM[13]) );
  OAI2BB1X1M U24 ( .A0N(n1), .A1N(A[12]), .B0(n21), .Y(n19) );
  OAI21X1M U25 ( .A0(A[12]), .A1(n1), .B0(B[12]), .Y(n21) );
  XOR3XLM U26 ( .A(B[12]), .B(A[12]), .C(n1), .Y(SUM[12]) );
  OAI21BX1M U27 ( .A0(n22), .A1(n23), .B0N(n24), .Y(n20) );
  XNOR2X1M U28 ( .A(n23), .B(n25), .Y(SUM[11]) );
  NOR2X1M U29 ( .A(n24), .B(n22), .Y(n25) );
  AND2X1M U30 ( .A(B[11]), .B(A[11]), .Y(n24) );
  OA21X1M U31 ( .A0(n26), .A1(n27), .B0(n28), .Y(n23) );
  CLKXOR2X2M U32 ( .A(n29), .B(n27), .Y(SUM[10]) );
  AND2X1M U33 ( .A(B[9]), .B(A[9]), .Y(n12) );
  OA21X1M U34 ( .A0(n15), .A1(n16), .B0(n17), .Y(n10) );
  CLKNAND2X2M U35 ( .A(B[8]), .B(A[8]), .Y(n17) );
  AOI21BX1M U36 ( .A0(n18), .A1(A[7]), .B0N(n30), .Y(n15) );
  OAI21X1M U37 ( .A0(n18), .A1(A[7]), .B0(B[7]), .Y(n30) );
  NAND2BX1M U38 ( .AN(n26), .B(n28), .Y(n29) );
  CLKNAND2X2M U39 ( .A(B[10]), .B(A[10]), .Y(n28) );
endmodule


module arithmetic_unit_DW02_mult_0 ( A, B, TC, PRODUCT );
  input [7:0] A;
  input [7:0] B;
  output [15:0] PRODUCT;
  input TC;
  wire   ab_7__7_, ab_7__6_, ab_7__5_, ab_7__4_, ab_7__3_, ab_7__2_, ab_7__1_,
         ab_7__0_, ab_6__7_, ab_6__6_, ab_6__5_, ab_6__4_, ab_6__3_, ab_6__2_,
         ab_6__1_, ab_6__0_, ab_5__7_, ab_5__6_, ab_5__5_, ab_5__4_, ab_5__3_,
         ab_5__2_, ab_5__1_, ab_5__0_, ab_4__7_, ab_4__6_, ab_4__5_, ab_4__4_,
         ab_4__3_, ab_4__2_, ab_4__1_, ab_4__0_, ab_3__7_, ab_3__6_, ab_3__5_,
         ab_3__4_, ab_3__3_, ab_3__2_, ab_3__1_, ab_3__0_, ab_2__7_, ab_2__6_,
         ab_2__5_, ab_2__4_, ab_2__3_, ab_2__2_, ab_2__1_, ab_2__0_, ab_1__7_,
         ab_1__6_, ab_1__5_, ab_1__4_, ab_1__3_, ab_1__2_, ab_1__1_, ab_1__0_,
         ab_0__7_, ab_0__6_, ab_0__5_, ab_0__4_, ab_0__3_, ab_0__2_, ab_0__1_,
         CARRYB_7__7_, CARRYB_7__6_, CARRYB_7__5_, CARRYB_7__4_, CARRYB_7__3_,
         CARRYB_7__2_, CARRYB_7__1_, CARRYB_7__0_, CARRYB_6__6_, CARRYB_6__5_,
         CARRYB_6__4_, CARRYB_6__3_, CARRYB_6__2_, CARRYB_6__1_, CARRYB_6__0_,
         CARRYB_5__6_, CARRYB_5__5_, CARRYB_5__4_, CARRYB_5__3_, CARRYB_5__2_,
         CARRYB_5__1_, CARRYB_5__0_, CARRYB_4__6_, CARRYB_4__5_, CARRYB_4__4_,
         CARRYB_4__3_, CARRYB_4__2_, CARRYB_4__1_, CARRYB_4__0_, CARRYB_3__6_,
         CARRYB_3__5_, CARRYB_3__4_, CARRYB_3__3_, CARRYB_3__2_, CARRYB_3__1_,
         CARRYB_3__0_, CARRYB_2__6_, CARRYB_2__5_, CARRYB_2__4_, CARRYB_2__3_,
         CARRYB_2__2_, CARRYB_2__1_, CARRYB_2__0_, SUMB_7__7_, SUMB_7__6_,
         SUMB_7__5_, SUMB_7__4_, SUMB_7__3_, SUMB_7__2_, SUMB_7__1_,
         SUMB_7__0_, SUMB_6__6_, SUMB_6__5_, SUMB_6__4_, SUMB_6__3_,
         SUMB_6__2_, SUMB_6__1_, SUMB_5__6_, SUMB_5__5_, SUMB_5__4_,
         SUMB_5__3_, SUMB_5__2_, SUMB_5__1_, SUMB_4__6_, SUMB_4__5_,
         SUMB_4__4_, SUMB_4__3_, SUMB_4__2_, SUMB_4__1_, SUMB_3__6_,
         SUMB_3__5_, SUMB_3__4_, SUMB_3__3_, SUMB_3__2_, SUMB_3__1_,
         SUMB_2__6_, SUMB_2__5_, SUMB_2__4_, SUMB_2__3_, SUMB_2__2_,
         SUMB_2__1_, SUMB_1__6_, SUMB_1__5_, SUMB_1__4_, SUMB_1__3_,
         SUMB_1__2_, SUMB_1__1_, A1_13_, A1_12_, A1_11_, A1_10_, A1_9_, A1_8_,
         A1_7_, A1_6_, A1_5_, A1_4_, A1_3_, A1_2_, A1_1_, A1_0_, A2_6_, n3, n4,
         n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16, n17, n18, n19,
         n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32;

  arithmetic_unit_DW01_add_1 FS_1 ( .A({A1_13_, A1_12_, A1_11_, A1_10_, A1_9_, 
        A1_8_, A1_7_, A1_6_, A1_5_, A1_4_, A1_3_, A1_2_, A1_1_, A1_0_}), .B({
        n10, n16, n15, n14, n13, n11, n12, A2_6_, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 
        1'b0}), .CI(1'b0), .SUM(PRODUCT[15:2]) );
  ADDFX2M S5_6 ( .A(ab_7__6_), .B(CARRYB_6__6_), .CI(ab_6__7_), .CO(
        CARRYB_7__6_), .S(SUMB_7__6_) );
  ADDFX2M S3_6_6 ( .A(ab_6__6_), .B(CARRYB_5__6_), .CI(ab_5__7_), .CO(
        CARRYB_6__6_), .S(SUMB_6__6_) );
  ADDFX2M S4_5 ( .A(ab_7__5_), .B(CARRYB_6__5_), .CI(SUMB_6__6_), .CO(
        CARRYB_7__5_), .S(SUMB_7__5_) );
  ADDFX2M S3_5_6 ( .A(ab_5__6_), .B(CARRYB_4__6_), .CI(ab_4__7_), .CO(
        CARRYB_5__6_), .S(SUMB_5__6_) );
  ADDFX2M S4_4 ( .A(ab_7__4_), .B(CARRYB_6__4_), .CI(SUMB_6__5_), .CO(
        CARRYB_7__4_), .S(SUMB_7__4_) );
  ADDFX2M S3_4_6 ( .A(ab_4__6_), .B(CARRYB_3__6_), .CI(ab_3__7_), .CO(
        CARRYB_4__6_), .S(SUMB_4__6_) );
  ADDFX2M S3_3_6 ( .A(ab_3__6_), .B(CARRYB_2__6_), .CI(ab_2__7_), .CO(
        CARRYB_3__6_), .S(SUMB_3__6_) );
  ADDFX2M S4_3 ( .A(ab_7__3_), .B(CARRYB_6__3_), .CI(SUMB_6__4_), .CO(
        CARRYB_7__3_), .S(SUMB_7__3_) );
  ADDFX2M S4_2 ( .A(ab_7__2_), .B(CARRYB_6__2_), .CI(SUMB_6__3_), .CO(
        CARRYB_7__2_), .S(SUMB_7__2_) );
  ADDFX2M S14_7_0 ( .A(A[7]), .B(B[7]), .CI(SUMB_7__0_), .CO(A2_6_), .S(A1_5_)
         );
  ADDFX2M S3_2_6 ( .A(ab_2__6_), .B(n9), .CI(ab_1__7_), .CO(CARRYB_2__6_), .S(
        SUMB_2__6_) );
  ADDFX2M S4_0 ( .A(ab_7__0_), .B(CARRYB_6__0_), .CI(SUMB_6__1_), .CO(
        CARRYB_7__0_), .S(SUMB_7__0_) );
  ADDFX2M S4_1 ( .A(ab_7__1_), .B(CARRYB_6__1_), .CI(SUMB_6__2_), .CO(
        CARRYB_7__1_), .S(SUMB_7__1_) );
  ADDFX2M S14_7 ( .A(n25), .B(n17), .CI(ab_7__7_), .CO(CARRYB_7__7_), .S(
        SUMB_7__7_) );
  ADDFX2M S2_6_5 ( .A(ab_6__5_), .B(CARRYB_5__5_), .CI(SUMB_5__6_), .CO(
        CARRYB_6__5_), .S(SUMB_6__5_) );
  ADDFX2M S2_6_4 ( .A(ab_6__4_), .B(CARRYB_5__4_), .CI(SUMB_5__5_), .CO(
        CARRYB_6__4_), .S(SUMB_6__4_) );
  ADDFX2M S2_5_5 ( .A(ab_5__5_), .B(CARRYB_4__5_), .CI(SUMB_4__6_), .CO(
        CARRYB_5__5_), .S(SUMB_5__5_) );
  ADDFX2M S2_6_3 ( .A(ab_6__3_), .B(CARRYB_5__3_), .CI(SUMB_5__4_), .CO(
        CARRYB_6__3_), .S(SUMB_6__3_) );
  ADDFX2M S2_5_4 ( .A(ab_5__4_), .B(CARRYB_4__4_), .CI(SUMB_4__5_), .CO(
        CARRYB_5__4_), .S(SUMB_5__4_) );
  ADDFX2M S2_4_5 ( .A(ab_4__5_), .B(CARRYB_3__5_), .CI(SUMB_3__6_), .CO(
        CARRYB_4__5_), .S(SUMB_4__5_) );
  ADDFX2M S1_6_0 ( .A(ab_6__0_), .B(CARRYB_5__0_), .CI(SUMB_5__1_), .CO(
        CARRYB_6__0_), .S(A1_4_) );
  ADDFX2M S1_5_0 ( .A(ab_5__0_), .B(CARRYB_4__0_), .CI(SUMB_4__1_), .CO(
        CARRYB_5__0_), .S(A1_3_) );
  ADDFX2M S1_4_0 ( .A(ab_4__0_), .B(CARRYB_3__0_), .CI(SUMB_3__1_), .CO(
        CARRYB_4__0_), .S(A1_2_) );
  ADDFX2M S1_3_0 ( .A(ab_3__0_), .B(CARRYB_2__0_), .CI(SUMB_2__1_), .CO(
        CARRYB_3__0_), .S(A1_1_) );
  ADDFX2M S2_6_1 ( .A(ab_6__1_), .B(CARRYB_5__1_), .CI(SUMB_5__2_), .CO(
        CARRYB_6__1_), .S(SUMB_6__1_) );
  ADDFX2M S2_5_1 ( .A(ab_5__1_), .B(CARRYB_4__1_), .CI(SUMB_4__2_), .CO(
        CARRYB_5__1_), .S(SUMB_5__1_) );
  ADDFX2M S2_5_2 ( .A(ab_5__2_), .B(CARRYB_4__2_), .CI(SUMB_4__3_), .CO(
        CARRYB_5__2_), .S(SUMB_5__2_) );
  ADDFX2M S2_4_1 ( .A(ab_4__1_), .B(CARRYB_3__1_), .CI(SUMB_3__2_), .CO(
        CARRYB_4__1_), .S(SUMB_4__1_) );
  ADDFX2M S2_4_2 ( .A(ab_4__2_), .B(CARRYB_3__2_), .CI(SUMB_3__3_), .CO(
        CARRYB_4__2_), .S(SUMB_4__2_) );
  ADDFX2M S2_3_1 ( .A(ab_3__1_), .B(CARRYB_2__1_), .CI(SUMB_2__2_), .CO(
        CARRYB_3__1_), .S(SUMB_3__1_) );
  ADDFX2M S2_3_2 ( .A(ab_3__2_), .B(CARRYB_2__2_), .CI(SUMB_2__3_), .CO(
        CARRYB_3__2_), .S(SUMB_3__2_) );
  ADDFX2M S2_3_4 ( .A(ab_3__4_), .B(CARRYB_2__4_), .CI(SUMB_2__5_), .CO(
        CARRYB_3__4_), .S(SUMB_3__4_) );
  ADDFX2M S1_2_0 ( .A(ab_2__0_), .B(n4), .CI(SUMB_1__1_), .CO(CARRYB_2__0_), 
        .S(A1_0_) );
  ADDFX2M S2_6_2 ( .A(ab_6__2_), .B(CARRYB_5__2_), .CI(SUMB_5__3_), .CO(
        CARRYB_6__2_), .S(SUMB_6__2_) );
  ADDFX2M S2_5_3 ( .A(ab_5__3_), .B(CARRYB_4__3_), .CI(SUMB_4__4_), .CO(
        CARRYB_5__3_), .S(SUMB_5__3_) );
  ADDFX2M S2_4_4 ( .A(ab_4__4_), .B(CARRYB_3__4_), .CI(SUMB_3__5_), .CO(
        CARRYB_4__4_), .S(SUMB_4__4_) );
  ADDFX2M S2_3_5 ( .A(ab_3__5_), .B(CARRYB_2__5_), .CI(SUMB_2__6_), .CO(
        CARRYB_3__5_), .S(SUMB_3__5_) );
  ADDFX2M S2_4_3 ( .A(ab_4__3_), .B(CARRYB_3__3_), .CI(SUMB_3__4_), .CO(
        CARRYB_4__3_), .S(SUMB_4__3_) );
  ADDFX2M S2_3_3 ( .A(ab_3__3_), .B(CARRYB_2__3_), .CI(SUMB_2__4_), .CO(
        CARRYB_3__3_), .S(SUMB_3__3_) );
  ADDFX2M S2_2_1 ( .A(ab_2__1_), .B(n3), .CI(SUMB_1__2_), .CO(CARRYB_2__1_), 
        .S(SUMB_2__1_) );
  ADDFX2M S2_2_2 ( .A(ab_2__2_), .B(n6), .CI(SUMB_1__3_), .CO(CARRYB_2__2_), 
        .S(SUMB_2__2_) );
  ADDFX2M S2_2_3 ( .A(ab_2__3_), .B(n7), .CI(SUMB_1__4_), .CO(CARRYB_2__3_), 
        .S(SUMB_2__3_) );
  ADDFX2M S2_2_4 ( .A(ab_2__4_), .B(n5), .CI(SUMB_1__5_), .CO(CARRYB_2__4_), 
        .S(SUMB_2__4_) );
  ADDFX2M S2_2_5 ( .A(ab_2__5_), .B(n8), .CI(SUMB_1__6_), .CO(CARRYB_2__5_), 
        .S(SUMB_2__5_) );
  AND2X2M U2 ( .A(ab_0__2_), .B(ab_1__1_), .Y(n3) );
  AND2X2M U3 ( .A(ab_0__1_), .B(ab_1__0_), .Y(n4) );
  AND2X2M U4 ( .A(ab_0__5_), .B(ab_1__4_), .Y(n5) );
  AND2X2M U5 ( .A(ab_0__3_), .B(ab_1__2_), .Y(n6) );
  AND2X2M U6 ( .A(ab_0__4_), .B(ab_1__3_), .Y(n7) );
  AND2X2M U7 ( .A(ab_0__6_), .B(ab_1__5_), .Y(n8) );
  AND2X2M U8 ( .A(ab_0__7_), .B(ab_1__6_), .Y(n9) );
  AND2X2M U9 ( .A(CARRYB_7__6_), .B(SUMB_7__7_), .Y(n10) );
  NOR2X1M U10 ( .A(B[6]), .B(n25), .Y(ab_7__6_) );
  INVX4M U11 ( .A(B[4]), .Y(n20) );
  NOR2X2M U12 ( .A(B[4]), .B(n25), .Y(ab_7__4_) );
  INVX4M U13 ( .A(B[6]), .Y(n18) );
  INVX4M U14 ( .A(A[1]), .Y(n31) );
  INVX4M U15 ( .A(A[0]), .Y(n32) );
  CLKINVX4M U16 ( .A(B[2]), .Y(n22) );
  NOR2X2M U17 ( .A(n22), .B(n32), .Y(ab_0__2_) );
  NOR2X2M U18 ( .A(n23), .B(n32), .Y(ab_0__1_) );
  NOR2X2M U19 ( .A(n21), .B(n32), .Y(ab_0__3_) );
  NOR2X2M U20 ( .A(n20), .B(n32), .Y(ab_0__4_) );
  NOR2X2M U21 ( .A(n18), .B(n32), .Y(ab_0__6_) );
  NOR2X2M U22 ( .A(n19), .B(n32), .Y(ab_0__5_) );
  NOR2X2M U23 ( .A(n23), .B(n31), .Y(ab_1__1_) );
  NOR2X2M U24 ( .A(n24), .B(n31), .Y(ab_1__0_) );
  NOR2X2M U25 ( .A(n22), .B(n31), .Y(ab_1__2_) );
  NOR2X2M U26 ( .A(n21), .B(n31), .Y(ab_1__3_) );
  NOR2X2M U27 ( .A(n18), .B(n31), .Y(ab_1__6_) );
  NOR2X2M U28 ( .A(n19), .B(n31), .Y(ab_1__5_) );
  NOR2X2M U29 ( .A(n20), .B(n31), .Y(ab_1__4_) );
  AND2X1M U30 ( .A(CARRYB_7__0_), .B(SUMB_7__1_), .Y(n12) );
  NOR2X2M U31 ( .A(A[0]), .B(n17), .Y(ab_0__7_) );
  CLKINVX4M U32 ( .A(B[1]), .Y(n23) );
  CLKINVX4M U33 ( .A(B[0]), .Y(n24) );
  CLKINVX4M U34 ( .A(B[5]), .Y(n19) );
  CLKINVX4M U35 ( .A(B[3]), .Y(n21) );
  INVX4M U36 ( .A(B[7]), .Y(n17) );
  CLKINVX4M U37 ( .A(A[4]), .Y(n28) );
  CLKINVX4M U38 ( .A(A[5]), .Y(n27) );
  XOR2X1M U39 ( .A(ab_1__0_), .B(ab_0__1_), .Y(PRODUCT[1]) );
  XOR2X1M U40 ( .A(ab_1__6_), .B(ab_0__7_), .Y(SUMB_1__6_) );
  XOR2X1M U41 ( .A(ab_1__5_), .B(ab_0__6_), .Y(SUMB_1__5_) );
  XOR2X1M U42 ( .A(ab_1__4_), .B(ab_0__5_), .Y(SUMB_1__4_) );
  XOR2X1M U43 ( .A(ab_1__3_), .B(ab_0__4_), .Y(SUMB_1__3_) );
  XOR2X1M U44 ( .A(ab_1__2_), .B(ab_0__3_), .Y(SUMB_1__2_) );
  CLKXOR2X2M U45 ( .A(CARRYB_7__0_), .B(SUMB_7__1_), .Y(A1_6_) );
  XOR2X1M U46 ( .A(ab_1__1_), .B(ab_0__2_), .Y(SUMB_1__1_) );
  CLKXOR2X2M U47 ( .A(CARRYB_7__1_), .B(SUMB_7__2_), .Y(A1_7_) );
  CLKXOR2X2M U48 ( .A(CARRYB_7__2_), .B(SUMB_7__3_), .Y(A1_8_) );
  AND2X2M U49 ( .A(CARRYB_7__1_), .B(SUMB_7__2_), .Y(n11) );
  CLKXOR2X2M U50 ( .A(CARRYB_7__3_), .B(SUMB_7__4_), .Y(A1_9_) );
  AND2X2M U51 ( .A(CARRYB_7__2_), .B(SUMB_7__3_), .Y(n13) );
  CLKXOR2X2M U52 ( .A(CARRYB_7__4_), .B(SUMB_7__5_), .Y(A1_10_) );
  AND2X2M U53 ( .A(CARRYB_7__3_), .B(SUMB_7__4_), .Y(n14) );
  CLKXOR2X2M U54 ( .A(CARRYB_7__5_), .B(SUMB_7__6_), .Y(A1_11_) );
  AND2X2M U55 ( .A(CARRYB_7__4_), .B(SUMB_7__5_), .Y(n15) );
  CLKXOR2X2M U56 ( .A(CARRYB_7__6_), .B(SUMB_7__7_), .Y(A1_12_) );
  AND2X2M U57 ( .A(CARRYB_7__5_), .B(SUMB_7__6_), .Y(n16) );
  INVX4M U58 ( .A(A[2]), .Y(n30) );
  INVX4M U59 ( .A(A[3]), .Y(n29) );
  CLKINVX4M U60 ( .A(A[6]), .Y(n26) );
  INVX4M U61 ( .A(A[7]), .Y(n25) );
  NOR2X1M U62 ( .A(n17), .B(n25), .Y(ab_7__7_) );
  NOR2X1M U63 ( .A(B[5]), .B(n25), .Y(ab_7__5_) );
  NOR2X1M U64 ( .A(B[3]), .B(n25), .Y(ab_7__3_) );
  NOR2X1M U65 ( .A(B[2]), .B(n25), .Y(ab_7__2_) );
  NOR2X1M U66 ( .A(B[1]), .B(n25), .Y(ab_7__1_) );
  NOR2X1M U67 ( .A(B[0]), .B(n25), .Y(ab_7__0_) );
  NOR2X1M U68 ( .A(A[6]), .B(n17), .Y(ab_6__7_) );
  NOR2X1M U69 ( .A(n26), .B(n18), .Y(ab_6__6_) );
  NOR2X1M U70 ( .A(n26), .B(n19), .Y(ab_6__5_) );
  NOR2X1M U71 ( .A(n26), .B(n20), .Y(ab_6__4_) );
  NOR2X1M U72 ( .A(n26), .B(n21), .Y(ab_6__3_) );
  NOR2X1M U73 ( .A(n26), .B(n22), .Y(ab_6__2_) );
  NOR2X1M U74 ( .A(n26), .B(n23), .Y(ab_6__1_) );
  NOR2X1M U75 ( .A(n26), .B(n24), .Y(ab_6__0_) );
  NOR2X1M U76 ( .A(A[5]), .B(n17), .Y(ab_5__7_) );
  NOR2X1M U77 ( .A(n18), .B(n27), .Y(ab_5__6_) );
  NOR2X1M U78 ( .A(n19), .B(n27), .Y(ab_5__5_) );
  NOR2X1M U79 ( .A(n20), .B(n27), .Y(ab_5__4_) );
  NOR2X1M U80 ( .A(n21), .B(n27), .Y(ab_5__3_) );
  NOR2X1M U81 ( .A(n22), .B(n27), .Y(ab_5__2_) );
  NOR2X1M U82 ( .A(n23), .B(n27), .Y(ab_5__1_) );
  NOR2X1M U83 ( .A(n24), .B(n27), .Y(ab_5__0_) );
  NOR2X1M U84 ( .A(A[4]), .B(n17), .Y(ab_4__7_) );
  NOR2X1M U85 ( .A(n18), .B(n28), .Y(ab_4__6_) );
  NOR2X1M U86 ( .A(n19), .B(n28), .Y(ab_4__5_) );
  NOR2X1M U87 ( .A(n20), .B(n28), .Y(ab_4__4_) );
  NOR2X1M U88 ( .A(n21), .B(n28), .Y(ab_4__3_) );
  NOR2X1M U89 ( .A(n22), .B(n28), .Y(ab_4__2_) );
  NOR2X1M U90 ( .A(n23), .B(n28), .Y(ab_4__1_) );
  NOR2X1M U91 ( .A(n24), .B(n28), .Y(ab_4__0_) );
  NOR2X1M U92 ( .A(A[3]), .B(n17), .Y(ab_3__7_) );
  NOR2X1M U93 ( .A(n18), .B(n29), .Y(ab_3__6_) );
  NOR2X1M U94 ( .A(n19), .B(n29), .Y(ab_3__5_) );
  NOR2X1M U95 ( .A(n20), .B(n29), .Y(ab_3__4_) );
  NOR2X1M U96 ( .A(n21), .B(n29), .Y(ab_3__3_) );
  NOR2X1M U97 ( .A(n22), .B(n29), .Y(ab_3__2_) );
  NOR2X1M U98 ( .A(n23), .B(n29), .Y(ab_3__1_) );
  NOR2X1M U99 ( .A(n24), .B(n29), .Y(ab_3__0_) );
  NOR2X1M U100 ( .A(A[2]), .B(n17), .Y(ab_2__7_) );
  NOR2X1M U101 ( .A(n18), .B(n30), .Y(ab_2__6_) );
  NOR2X1M U102 ( .A(n19), .B(n30), .Y(ab_2__5_) );
  NOR2X1M U103 ( .A(n20), .B(n30), .Y(ab_2__4_) );
  NOR2X1M U104 ( .A(n21), .B(n30), .Y(ab_2__3_) );
  NOR2X1M U105 ( .A(n22), .B(n30), .Y(ab_2__2_) );
  NOR2X1M U106 ( .A(n23), .B(n30), .Y(ab_2__1_) );
  NOR2X1M U107 ( .A(n24), .B(n30), .Y(ab_2__0_) );
  NOR2X1M U108 ( .A(A[1]), .B(n17), .Y(ab_1__7_) );
  NOR2X1M U109 ( .A(n24), .B(n32), .Y(PRODUCT[0]) );
  CLKINVX1M U111 ( .A(CARRYB_7__7_), .Y(A1_13_) );
endmodule


module arithmetic_unit ( a, b, alu_fun, arith_en, clk, rst, arith_out, 
        ALU_Valid );
  input [7:0] a;
  input [7:0] b;
  input [1:0] alu_fun;
  output [15:0] arith_out;
  input arith_en, clk, rst;
  output ALU_Valid;
  wire   N19, N20, N21, N22, N23, N24, N25, N26, N27, N28, N29, N30, N31, N32,
         N33, N34, N35, N36, N37, N38, N39, N40, N41, N42, N43, N44, N45, N46,
         N47, N48, N49, N50, N51, N52, N55, N56, N57, N58, N59, N60, N61, N62,
         N87, N88, N89, N90, N91, N92, N93, N94, N95, N96, N97, N98, N99, N100,
         N101, N102, n8, n9, n10, n11, n12, n13, n14, n15, n16, n17, n18, n19,
         n20, n21, n22, n23, n24, n25, n28, n29, n30, n31, n32, n33, n3, n4,
         n5, n6, n7, n26, n27, n34, n35, n36, n37, n38, n39,
         SYNOPSYS_UNCONNECTED_1, SYNOPSYS_UNCONNECTED_2,
         SYNOPSYS_UNCONNECTED_3, SYNOPSYS_UNCONNECTED_4,
         SYNOPSYS_UNCONNECTED_5, SYNOPSYS_UNCONNECTED_6,
         SYNOPSYS_UNCONNECTED_7, SYNOPSYS_UNCONNECTED_8;

  arithmetic_unit_DW_div_uns_0 div_30 ( .a(a), .b(b), .quotient({N62, N61, N60, 
        N59, N58, N57, N56, N55}), .remainder({SYNOPSYS_UNCONNECTED_1, 
        SYNOPSYS_UNCONNECTED_2, SYNOPSYS_UNCONNECTED_3, SYNOPSYS_UNCONNECTED_4, 
        SYNOPSYS_UNCONNECTED_5, SYNOPSYS_UNCONNECTED_6, SYNOPSYS_UNCONNECTED_7, 
        SYNOPSYS_UNCONNECTED_8}) );
  arithmetic_unit_DW01_sub_0 sub_22 ( .A({a[7], a}), .B({b[7], b}), .CI(1'b0), 
        .DIFF({N36, N35, N34, N33, N32, N31, N30, N29, N28}) );
  arithmetic_unit_DW01_add_0 add_18 ( .A({a[7], a}), .B({b[7], b}), .CI(1'b0), 
        .SUM({N27, N26, N25, N24, N23, N22, N21, N20, N19}) );
  arithmetic_unit_DW02_mult_0 mult_26 ( .A(a), .B(b), .TC(1'b1), .PRODUCT({N52, 
        N51, N50, N49, N48, N47, N46, N45, N44, N43, N42, N41, N40, N39, N38, 
        N37}) );
  DFFRQX1M arith_out_reg_0_ ( .D(N87), .CK(clk), .RN(n37), .Q(arith_out[0]) );
  DFFRQX1M arith_out_reg_7_ ( .D(N94), .CK(clk), .RN(n36), .Q(arith_out[7]) );
  DFFRQX1M arith_out_reg_6_ ( .D(N93), .CK(clk), .RN(n36), .Q(arith_out[6]) );
  DFFRQX1M arith_out_reg_5_ ( .D(N92), .CK(clk), .RN(n36), .Q(arith_out[5]) );
  DFFRQX1M arith_out_reg_4_ ( .D(N91), .CK(clk), .RN(n36), .Q(arith_out[4]) );
  DFFRQX1M arith_out_reg_3_ ( .D(N90), .CK(clk), .RN(n37), .Q(arith_out[3]) );
  DFFRQX1M arith_out_reg_2_ ( .D(N89), .CK(clk), .RN(n37), .Q(arith_out[2]) );
  DFFRQX1M arith_out_reg_8_ ( .D(N95), .CK(clk), .RN(n36), .Q(arith_out[8]) );
  DFFRQX1M arith_out_reg_1_ ( .D(N88), .CK(clk), .RN(n37), .Q(arith_out[1]) );
  DFFRQX1M ALU_Valid_reg ( .D(arith_en), .CK(clk), .RN(n37), .Q(ALU_Valid) );
  DFFRQX1M arith_out_reg_15_ ( .D(N102), .CK(clk), .RN(n36), .Q(arith_out[15])
         );
  DFFRQX1M arith_out_reg_14_ ( .D(N101), .CK(clk), .RN(n36), .Q(arith_out[14])
         );
  DFFRQX1M arith_out_reg_13_ ( .D(N100), .CK(clk), .RN(n36), .Q(arith_out[13])
         );
  DFFRQX1M arith_out_reg_12_ ( .D(N99), .CK(clk), .RN(n36), .Q(arith_out[12])
         );
  DFFRQX1M arith_out_reg_11_ ( .D(N98), .CK(clk), .RN(n36), .Q(arith_out[11])
         );
  DFFRQX1M arith_out_reg_10_ ( .D(N97), .CK(clk), .RN(n36), .Q(arith_out[10])
         );
  DFFRQX1M arith_out_reg_9_ ( .D(N96), .CK(clk), .RN(n36), .Q(arith_out[9]) );
  NAND2X2M U3 ( .A(n24), .B(n25), .Y(N88) );
  NOR2X2M U4 ( .A(n26), .B(n27), .Y(n24) );
  CLKNAND2X12M U5 ( .A(n5), .B(n6), .Y(N87) );
  NAND3X2M U8 ( .A(alu_fun[1]), .B(n39), .C(arith_en), .Y(n3) );
  AO22X1M U9 ( .A0(N28), .A1(n11), .B0(N19), .B1(n12), .Y(n4) );
  NOR4X1M U10 ( .A(b[7]), .B(b[6]), .C(b[5]), .D(b[4]), .Y(n32) );
  NAND2X2M U11 ( .A(n22), .B(n23), .Y(N89) );
  AOI22X1M U12 ( .A0(N57), .A1(n13), .B0(N39), .B1(n34), .Y(n22) );
  AOI22X1M U13 ( .A0(N59), .A1(n13), .B0(N41), .B1(n34), .Y(n18) );
  NAND2X12M U14 ( .A(N55), .B(n13), .Y(n5) );
  NOR2X2M U15 ( .A(n7), .B(n4), .Y(n6) );
  AND2X1M U16 ( .A(N56), .B(n13), .Y(n26) );
  AND2X2M U17 ( .A(N37), .B(n34), .Y(n7) );
  AND2X2M U18 ( .A(N38), .B(n35), .Y(n27) );
  AOI22X1M U19 ( .A0(N61), .A1(n13), .B0(N43), .B1(n34), .Y(n14) );
  INVX4M U20 ( .A(n3), .Y(n35) );
  INVX4M U21 ( .A(n3), .Y(n34) );
  CLKAND2X4M U22 ( .A(n29), .B(arith_en), .Y(n11) );
  CLKAND2X4M U23 ( .A(n28), .B(arith_en), .Y(n12) );
  INVX6M U24 ( .A(n38), .Y(n36) );
  INVX4M U25 ( .A(n38), .Y(n37) );
  CLKINVX1M U26 ( .A(alu_fun[0]), .Y(n39) );
  NOR2X2M U27 ( .A(n39), .B(alu_fun[1]), .Y(n29) );
  NOR2X2M U28 ( .A(alu_fun[0]), .B(alu_fun[1]), .Y(n28) );
  INVX2M U29 ( .A(rst), .Y(n38) );
  AOI22X1M U30 ( .A0(N29), .A1(n11), .B0(N20), .B1(n12), .Y(n25) );
  OAI2BB1X2M U31 ( .A0N(N52), .A1N(n34), .B0(n8), .Y(N102) );
  AOI22X1M U32 ( .A0(N30), .A1(n11), .B0(N21), .B1(n12), .Y(n23) );
  OAI2BB1X2M U33 ( .A0N(N51), .A1N(n35), .B0(n8), .Y(N101) );
  OAI2BB1X2M U34 ( .A0N(N50), .A1N(n34), .B0(n8), .Y(N100) );
  OAI2BB1X2M U35 ( .A0N(N49), .A1N(n35), .B0(n8), .Y(N99) );
  OAI2BB1X2M U36 ( .A0N(N48), .A1N(n34), .B0(n8), .Y(N98) );
  NAND2X2M U37 ( .A(n20), .B(n21), .Y(N90) );
  AOI22X1M U38 ( .A0(N31), .A1(n11), .B0(N22), .B1(n12), .Y(n21) );
  AOI22X1M U39 ( .A0(N58), .A1(n13), .B0(N40), .B1(n35), .Y(n20) );
  NAND2XLM U40 ( .A(n18), .B(n19), .Y(N91) );
  AOI22X1M U41 ( .A0(N32), .A1(n11), .B0(N23), .B1(n12), .Y(n19) );
  OAI2BB1X2M U42 ( .A0N(N47), .A1N(n35), .B0(n8), .Y(N97) );
  OAI2BB1X2M U43 ( .A0N(N45), .A1N(n35), .B0(n8), .Y(N95) );
  OAI2BB1X2M U44 ( .A0N(N46), .A1N(n34), .B0(n8), .Y(N96) );
  NAND2XLM U45 ( .A(n14), .B(n15), .Y(N93) );
  AOI22X1M U46 ( .A0(N34), .A1(n11), .B0(N25), .B1(n12), .Y(n15) );
  NAND2X2M U47 ( .A(n9), .B(n10), .Y(N94) );
  AOI22X1M U48 ( .A0(N35), .A1(n11), .B0(N26), .B1(n12), .Y(n10) );
  AOI22X1M U49 ( .A0(N62), .A1(n13), .B0(N44), .B1(n35), .Y(n9) );
  NAND2X2M U50 ( .A(n16), .B(n17), .Y(N92) );
  AOI22X1M U51 ( .A0(N33), .A1(n11), .B0(N24), .B1(n12), .Y(n17) );
  AOI22X1M U52 ( .A0(N60), .A1(n13), .B0(N42), .B1(n35), .Y(n16) );
  AND3X4M U53 ( .A(alu_fun[0]), .B(arith_en), .C(n30), .Y(n13) );
  AOI21BX1M U54 ( .A0(n31), .A1(n32), .B0N(alu_fun[1]), .Y(n30) );
  NOR4X2M U55 ( .A(b[3]), .B(b[2]), .C(b[1]), .D(b[0]), .Y(n31) );
  NAND2BX4M U56 ( .AN(n33), .B(arith_en), .Y(n8) );
  AOI22X1M U57 ( .A0(N36), .A1(n29), .B0(N27), .B1(n28), .Y(n33) );
endmodule


module logic_unit ( a, b, alu_fun, logic_en, clk, rst, logic_out, ALU_Valid );
  input [7:0] a;
  input [7:0] b;
  input [1:0] alu_fun;
  output [7:0] logic_out;
  input logic_en, clk, rst;
  output ALU_Valid;
  wire   N56, N57, N58, N59, N60, N61, N62, N63, n16, n17, n18, n19, n20, n22,
         n23, n24, n25, n26, n27, n28, n29, n30, n31, n32, n33, n34, n35, n36,
         n37, n38, n39, n40, n41, n42, n43, n1, n2, n3, n4, n5, n6, n7, n8, n9,
         n10, n11, n12, n13, n14, n15, n21, n44, n45, n46, n47;

  DFFRQX1M logic_out_reg_7_ ( .D(N63), .CK(clk), .RN(n4), .Q(logic_out[7]) );
  DFFRQX1M logic_out_reg_6_ ( .D(N62), .CK(clk), .RN(n4), .Q(logic_out[6]) );
  DFFRQX1M logic_out_reg_5_ ( .D(N61), .CK(clk), .RN(n4), .Q(logic_out[5]) );
  DFFRQX1M logic_out_reg_4_ ( .D(N60), .CK(clk), .RN(n4), .Q(logic_out[4]) );
  DFFRQX1M logic_out_reg_3_ ( .D(N59), .CK(clk), .RN(n4), .Q(logic_out[3]) );
  DFFRQX1M logic_out_reg_2_ ( .D(N58), .CK(clk), .RN(n4), .Q(logic_out[2]) );
  DFFRQX1M logic_out_reg_1_ ( .D(N57), .CK(clk), .RN(n4), .Q(logic_out[1]) );
  DFFRQX1M logic_out_reg_0_ ( .D(N56), .CK(clk), .RN(n4), .Q(logic_out[0]) );
  DFFRQX1M ALU_Valid_reg ( .D(logic_en), .CK(clk), .RN(n4), .Q(ALU_Valid) );
  AOI22X1M U3 ( .A0(n22), .A1(n7), .B0(b[6]), .B1(n23), .Y(n1) );
  AOI22X1M U4 ( .A0(n30), .A1(n9), .B0(b[4]), .B1(n31), .Y(n29) );
  INVXLM U5 ( .A(b[0]), .Y(n13) );
  OAI21X1M U6 ( .A0(a[0]), .A1(n25), .B0(n2), .Y(n42) );
  INVXLM U7 ( .A(b[1]), .Y(n12) );
  INVXLM U8 ( .A(b[2]), .Y(n11) );
  INVXLM U9 ( .A(b[3]), .Y(n10) );
  INVXLM U10 ( .A(b[4]), .Y(n9) );
  INVXLM U11 ( .A(b[5]), .Y(n8) );
  NAND2X4M U12 ( .A(logic_en), .B(n6), .Y(n24) );
  NAND2X4M U13 ( .A(logic_en), .B(alu_fun[1]), .Y(n25) );
  CLKINVX1M U14 ( .A(alu_fun[1]), .Y(n6) );
  CLKBUFX8M U15 ( .A(n20), .Y(n3) );
  NAND3XLM U16 ( .A(alu_fun[0]), .B(n6), .C(logic_en), .Y(n20) );
  CLKBUFX8M U17 ( .A(n19), .Y(n2) );
  NAND3BXLM U18 ( .AN(alu_fun[0]), .B(alu_fun[1]), .C(logic_en), .Y(n19) );
  INVX6M U19 ( .A(n5), .Y(n4) );
  INVX2M U20 ( .A(rst), .Y(n5) );
  OAI21X2M U21 ( .A0(n24), .A1(n21), .B0(n3), .Y(n31) );
  OAI21X2M U22 ( .A0(n24), .A1(n47), .B0(n3), .Y(n43) );
  OAI21X2M U23 ( .A0(n24), .A1(n46), .B0(n3), .Y(n40) );
  OAI21X2M U24 ( .A0(n24), .A1(n45), .B0(n3), .Y(n37) );
  OAI21X2M U25 ( .A0(n24), .A1(n44), .B0(n3), .Y(n34) );
  OAI21X2M U26 ( .A0(n24), .A1(n15), .B0(n3), .Y(n28) );
  OAI21X2M U27 ( .A0(n24), .A1(n14), .B0(n3), .Y(n23) );
  OAI221X1M U28 ( .A0(a[4]), .A1(n2), .B0(n3), .B1(n21), .C0(n29), .Y(N60) );
  OAI21X1M U29 ( .A0(a[4]), .A1(n25), .B0(n2), .Y(n30) );
  OAI221X1M U30 ( .A0(a[6]), .A1(n2), .B0(n14), .B1(n3), .C0(n1), .Y(N62) );
  INVXLM U31 ( .A(b[6]), .Y(n7) );
  OAI21X1M U32 ( .A0(a[6]), .A1(n25), .B0(n2), .Y(n22) );
  OAI221X1M U33 ( .A0(a[1]), .A1(n2), .B0(n3), .B1(n46), .C0(n38), .Y(N57) );
  AOI22X1M U34 ( .A0(n39), .A1(n12), .B0(b[1]), .B1(n40), .Y(n38) );
  OAI21X1M U35 ( .A0(a[1]), .A1(n25), .B0(n2), .Y(n39) );
  OAI221X1M U36 ( .A0(a[2]), .A1(n2), .B0(n3), .B1(n45), .C0(n35), .Y(N58) );
  AOI22X1M U37 ( .A0(n36), .A1(n11), .B0(b[2]), .B1(n37), .Y(n35) );
  OAI21X1M U38 ( .A0(a[2]), .A1(n25), .B0(n2), .Y(n36) );
  OAI221X1M U39 ( .A0(a[3]), .A1(n2), .B0(n3), .B1(n44), .C0(n32), .Y(N59) );
  AOI22X1M U40 ( .A0(n33), .A1(n10), .B0(b[3]), .B1(n34), .Y(n32) );
  OAI21X1M U41 ( .A0(a[3]), .A1(n25), .B0(n2), .Y(n33) );
  OAI221X1M U42 ( .A0(a[5]), .A1(n2), .B0(n3), .B1(n15), .C0(n26), .Y(N61) );
  AOI22X1M U43 ( .A0(n27), .A1(n8), .B0(b[5]), .B1(n28), .Y(n26) );
  OAI21X1M U44 ( .A0(a[5]), .A1(n25), .B0(n2), .Y(n27) );
  OAI221X1M U45 ( .A0(a[0]), .A1(n2), .B0(n3), .B1(n47), .C0(n41), .Y(N56) );
  AOI22X1M U46 ( .A0(n42), .A1(n13), .B0(b[0]), .B1(n43), .Y(n41) );
  NOR2BX2M U47 ( .AN(logic_en), .B(n16), .Y(N63) );
  XNOR2X1M U48 ( .A(alu_fun[1]), .B(n17), .Y(n16) );
  OAI2BB1XLM U49 ( .A0N(a[7]), .A1N(alu_fun[0]), .B0(n18), .Y(n17) );
  OAI21X1M U50 ( .A0(a[7]), .A1(alu_fun[0]), .B0(b[7]), .Y(n18) );
  CLKINVX1M U51 ( .A(a[4]), .Y(n21) );
  CLKINVX1M U52 ( .A(a[6]), .Y(n14) );
  CLKINVX1M U53 ( .A(a[1]), .Y(n46) );
  CLKINVX1M U54 ( .A(a[2]), .Y(n45) );
  CLKINVX1M U55 ( .A(a[3]), .Y(n44) );
  CLKINVX1M U56 ( .A(a[5]), .Y(n15) );
  CLKINVX1M U57 ( .A(a[0]), .Y(n47) );
endmodule


module cmp_unit ( a, b, alu_fun, cmp_en, clk, rst, cmp_out, ALU_Valid );
  input [7:0] a;
  input [7:0] b;
  input [1:0] alu_fun;
  output [1:0] cmp_out;
  input cmp_en, clk, rst;
  output ALU_Valid;
  wire   N18, N20, N23, N24, n10, n11, n1, n2, n3, n4, n5, n6, n7, n8, n9, n12,
         n13, n14, n15, n16, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26,
         n27, n28, n29, n30, n31, n32, n33, n34, n35, n36, n37, n38, n39, n40,
         n41, n42, n43, n44, n45, n46, n47, n48, n49, n50;

  DFFRQX1M ALU_Valid_reg ( .D(cmp_en), .CK(clk), .RN(n9), .Q(ALU_Valid) );
  DFFRQX1M cmp_out_reg_1_ ( .D(N24), .CK(clk), .RN(n9), .Q(cmp_out[1]) );
  DFFRQX1M cmp_out_reg_0_ ( .D(N23), .CK(clk), .RN(n9), .Q(cmp_out[0]) );
  OR2X2M U3 ( .A(n7), .B(n4), .Y(n1) );
  AOI2B1X1M U4 ( .A1N(n36), .A0(n35), .B0(n34), .Y(n37) );
  INVX2M U5 ( .A(n37), .Y(n47) );
  INVX2M U6 ( .A(n31), .Y(n7) );
  INVX2M U7 ( .A(b[6]), .Y(n45) );
  XNOR2X1M U8 ( .A(a[6]), .B(b[6]), .Y(n31) );
  NOR2X1M U9 ( .A(n2), .B(n3), .Y(n19) );
  CLKINVX1M U10 ( .A(n28), .Y(n4) );
  CLKINVX1M U11 ( .A(n18), .Y(n5) );
  NOR2X1M U12 ( .A(n5), .B(n1), .Y(n2) );
  CLKINVX1M U13 ( .A(n39), .Y(n6) );
  NOR2X1M U14 ( .A(n6), .B(n45), .Y(n3) );
  INVX2M U15 ( .A(n7), .Y(n8) );
  NAND2BX2M U16 ( .AN(a[4]), .B(b[4]), .Y(n16) );
  OAI31X2M U17 ( .A0(n24), .A1(n15), .A2(n14), .B0(n25), .Y(n17) );
  AOI211X2M U18 ( .A0(a[1]), .A1(n41), .B0(n21), .C0(n13), .Y(n14) );
  AOI211X2M U19 ( .A0(n22), .A1(n38), .B0(n21), .C0(n20), .Y(n23) );
  OAI21X4M U20 ( .A0(n34), .A1(n19), .B0(n35), .Y(N20) );
  NOR2X2M U21 ( .A(n46), .B(a[7]), .Y(n34) );
  NOR2X2M U22 ( .A(n40), .B(a[0]), .Y(n12) );
  NAND2X1M U23 ( .A(n27), .B(n16), .Y(n29) );
  NOR2X2M U24 ( .A(n42), .B(a[2]), .Y(n15) );
  NOR2X2M U25 ( .A(n44), .B(a[3]), .Y(n24) );
  CLKINVX1M U26 ( .A(b[2]), .Y(n42) );
  NAND2X1M U27 ( .A(a[0]), .B(n40), .Y(n22) );
  CLKINVX1M U28 ( .A(b[0]), .Y(n40) );
  CLKINVX2M U29 ( .A(a[1]), .Y(n38) );
  CLKINVX1M U30 ( .A(b[3]), .Y(n44) );
  NAND2X1M U31 ( .A(a[7]), .B(n46), .Y(n35) );
  INVX2M U32 ( .A(cmp_en), .Y(n50) );
  CLKINVX1M U33 ( .A(alu_fun[1]), .Y(n49) );
  CLKINVX1M U34 ( .A(alu_fun[0]), .Y(n48) );
  BUFX2M U35 ( .A(rst), .Y(n9) );
  NOR3X2M U36 ( .A(n50), .B(n11), .C(n48), .Y(N23) );
  AOI22X1M U37 ( .A0(N18), .A1(n49), .B0(alu_fun[1]), .B1(N20), .Y(n11) );
  NOR3X2M U38 ( .A(n50), .B(n10), .C(n49), .Y(N24) );
  AOI22X1M U39 ( .A0(n47), .A1(n48), .B0(alu_fun[0]), .B1(N20), .Y(n10) );
  INVXLM U40 ( .A(a[6]), .Y(n39) );
  INVXLM U41 ( .A(n12), .Y(n41) );
  INVXLM U42 ( .A(n23), .Y(n43) );
  CLKINVX1M U43 ( .A(b[7]), .Y(n46) );
  NAND2BX1M U44 ( .AN(b[4]), .B(a[4]), .Y(n27) );
  CLKNAND2X2M U45 ( .A(a[2]), .B(n42), .Y(n26) );
  NAND2BX1M U46 ( .AN(n15), .B(n26), .Y(n21) );
  AOI21X1M U47 ( .A0(n12), .A1(n38), .B0(b[1]), .Y(n13) );
  CLKNAND2X2M U48 ( .A(a[3]), .B(n44), .Y(n25) );
  NAND2BX1M U49 ( .AN(a[5]), .B(b[5]), .Y(n32) );
  OAI211X1M U50 ( .A0(n29), .A1(n17), .B0(n16), .C0(n32), .Y(n18) );
  NAND2BX1M U51 ( .AN(b[5]), .B(a[5]), .Y(n28) );
  OA21X1M U52 ( .A0(n22), .A1(n38), .B0(b[1]), .Y(n20) );
  AOI31X1M U53 ( .A0(n43), .A1(n26), .A2(n25), .B0(n24), .Y(n30) );
  OAI2B11X1M U54 ( .A1N(n30), .A0(n29), .B0(n28), .C0(n27), .Y(n33) );
  AOI32X1M U55 ( .A0(n33), .A1(n32), .A2(n8), .B0(a[6]), .B1(n45), .Y(n36) );
  NOR2X1M U56 ( .A(N20), .B(n47), .Y(N18) );
endmodule


module shift_unit ( a, b, alu_fun, shift_en, clk, rst, shift_out, ALU_Valid );
  input [7:0] a;
  input [7:0] b;
  input [1:0] alu_fun;
  output [8:0] shift_out;
  input shift_en, clk, rst;
  output ALU_Valid;
  wire   N25, N26, N27, N28, N29, N30, N31, N32, N33, n4, n5, n6, n7, n8, n9,
         n10, n11, n12, n14, n15, n16, n17, n18, n19, n20, n21, n22, n1, n2,
         n3, n13, n23, n24, n25;

  DFFRQX1M shift_out_reg_8_ ( .D(N33), .CK(clk), .RN(n3), .Q(shift_out[8]) );
  DFFRQX1M ALU_Valid_reg ( .D(shift_en), .CK(clk), .RN(n3), .Q(ALU_Valid) );
  DFFRQX1M shift_out_reg_1_ ( .D(N26), .CK(clk), .RN(n3), .Q(shift_out[1]) );
  DFFRQX1M shift_out_reg_0_ ( .D(N25), .CK(clk), .RN(n3), .Q(shift_out[0]) );
  DFFRQX1M shift_out_reg_7_ ( .D(N32), .CK(clk), .RN(n3), .Q(shift_out[7]) );
  DFFRQX1M shift_out_reg_6_ ( .D(N31), .CK(clk), .RN(n3), .Q(shift_out[6]) );
  DFFRQX1M shift_out_reg_5_ ( .D(N30), .CK(clk), .RN(n3), .Q(shift_out[5]) );
  DFFRQX1M shift_out_reg_4_ ( .D(N29), .CK(clk), .RN(n3), .Q(shift_out[4]) );
  DFFRQX1M shift_out_reg_3_ ( .D(N28), .CK(clk), .RN(n3), .Q(shift_out[3]) );
  DFFRQX1M shift_out_reg_2_ ( .D(N27), .CK(clk), .RN(n3), .Q(shift_out[2]) );
  AOI22X1M U3 ( .A0(b[4]), .A1(n5), .B0(n10), .B1(b[6]), .Y(n1) );
  AOI22X1M U4 ( .A0(b[2]), .A1(n5), .B0(b[4]), .B1(n10), .Y(n17) );
  AO22XLM U5 ( .A0(b[6]), .A1(n5), .B0(a[6]), .B1(n6), .Y(n7) );
  INVXLM U6 ( .A(n7), .Y(n2) );
  NOR2X8M U7 ( .A(alu_fun[0]), .B(alu_fun[1]), .Y(n11) );
  CLKINVX1M U8 ( .A(alu_fun[1]), .Y(n24) );
  CLKINVX1M U9 ( .A(alu_fun[0]), .Y(n23) );
  INVX4M U10 ( .A(shift_en), .Y(n25) );
  NOR2X8M U11 ( .A(n24), .B(n23), .Y(n5) );
  NOR2X8M U12 ( .A(n24), .B(alu_fun[0]), .Y(n10) );
  NOR2X8M U13 ( .A(n23), .B(alu_fun[1]), .Y(n6) );
  INVX6M U14 ( .A(n13), .Y(n3) );
  INVX2M U15 ( .A(rst), .Y(n13) );
  AOI21X1M U16 ( .A0(n16), .A1(n17), .B0(n25), .Y(N28) );
  AOI22X1M U17 ( .A0(a[2]), .A1(n6), .B0(a[4]), .B1(n11), .Y(n16) );
  AOI21X1M U18 ( .A0(n12), .A1(n1), .B0(n25), .Y(N30) );
  AOI22X1M U19 ( .A0(a[4]), .A1(n6), .B0(n11), .B1(a[6]), .Y(n12) );
  AOI21X2M U20 ( .A0(n18), .A1(n19), .B0(n25), .Y(N27) );
  AOI22X1M U21 ( .A0(a[1]), .A1(n6), .B0(a[3]), .B1(n11), .Y(n18) );
  AOI22X1M U22 ( .A0(b[1]), .A1(n5), .B0(b[3]), .B1(n10), .Y(n19) );
  AOI21X2M U23 ( .A0(n20), .A1(n21), .B0(n25), .Y(N26) );
  AOI22X1M U24 ( .A0(a[0]), .A1(n6), .B0(a[2]), .B1(n11), .Y(n20) );
  AOI22X1M U25 ( .A0(b[0]), .A1(n5), .B0(b[2]), .B1(n10), .Y(n21) );
  AOI21X2M U26 ( .A0(n8), .A1(n9), .B0(n25), .Y(N31) );
  AOI22X1M U27 ( .A0(a[5]), .A1(n6), .B0(n11), .B1(a[7]), .Y(n8) );
  AOI22X1M U28 ( .A0(b[5]), .A1(n5), .B0(n10), .B1(b[7]), .Y(n9) );
  AOI21X2M U29 ( .A0(n14), .A1(n15), .B0(n25), .Y(N29) );
  AOI22X1M U30 ( .A0(a[3]), .A1(n6), .B0(n11), .B1(a[5]), .Y(n14) );
  AOI22X1M U31 ( .A0(b[3]), .A1(n5), .B0(n10), .B1(b[5]), .Y(n15) );
  NOR2X2M U32 ( .A(n4), .B(n25), .Y(N33) );
  AOI22X1M U33 ( .A0(b[7]), .A1(n5), .B0(a[7]), .B1(n6), .Y(n4) );
  NOR2X2M U34 ( .A(n2), .B(n25), .Y(N32) );
  NOR2X2M U35 ( .A(n22), .B(n25), .Y(N25) );
  AOI22X1M U36 ( .A0(b[1]), .A1(n10), .B0(a[1]), .B1(n11), .Y(n22) );
endmodule


module alu_top ( a, b, alu_fun, clk, rst, ALU_OUT, ALU_Valid );
  input [7:0] a;
  input [7:0] b;
  input [3:0] alu_fun;
  output [15:0] ALU_OUT;
  input clk, rst;
  output ALU_Valid;
  wire   arith_en, logic_en, cmp_en, shift_en, arith_valid, logic_valid,
         cmp_valid, shift_valid, n2, n3, n4, n6, n7, n8, n9, n10, n11, n12,
         n13, n14, n15, n16, n17, n18, n1, n5, n19, n20, n21, n22, n23, n24,
         n25;
  wire   [15:0] arith_out;
  wire   [7:0] logic_out;
  wire   [1:0] cmp_out;
  wire   [8:0] shift_out;

  decoder u0 ( .alu_fun(alu_fun[3:2]), .arith_en(arith_en), .logic_en(logic_en), .cmp_en(cmp_en), .shift_en(shift_en) );
  arithmetic_unit u1 ( .a(a), .b(b), .alu_fun(alu_fun[1:0]), .arith_en(
        arith_en), .clk(clk), .rst(n23), .arith_out(arith_out), .ALU_Valid(
        arith_valid) );
  logic_unit u2 ( .a(a), .b(b), .alu_fun(alu_fun[1:0]), .logic_en(logic_en), 
        .clk(clk), .rst(n23), .logic_out(logic_out), .ALU_Valid(logic_valid)
         );
  cmp_unit u3 ( .a(a), .b(b), .alu_fun(alu_fun[1:0]), .cmp_en(cmp_en), .clk(
        clk), .rst(n23), .cmp_out(cmp_out), .ALU_Valid(cmp_valid) );
  shift_unit u4 ( .a(a), .b(b), .alu_fun(alu_fun[1:0]), .shift_en(shift_en), 
        .clk(clk), .rst(n23), .shift_out(shift_out), .ALU_Valid(shift_valid)
         );
  AND2X2M U2 ( .A(alu_fun[3]), .B(n25), .Y(n4) );
  BUFX4M U3 ( .A(n8), .Y(n1) );
  BUFX5M U4 ( .A(n6), .Y(n19) );
  NOR3X2M U5 ( .A(n4), .B(n21), .C(n19), .Y(n8) );
  INVX2M U6 ( .A(n24), .Y(n23) );
  AOI22X1M U7 ( .A0(logic_out[0]), .A1(n19), .B0(arith_out[0]), .B1(n20), .Y(
        n17) );
  AOI22X1M U8 ( .A0(logic_out[1]), .A1(n19), .B0(arith_out[1]), .B1(n20), .Y(
        n15) );
  AOI22X1M U9 ( .A0(cmp_out[0]), .A1(n4), .B0(shift_out[0]), .B1(n22), .Y(n18)
         );
  AOI22X1M U10 ( .A0(cmp_out[1]), .A1(n4), .B0(shift_out[1]), .B1(n22), .Y(n16) );
  INVX4M U11 ( .A(n5), .Y(n21) );
  INVX4M U12 ( .A(n5), .Y(n22) );
  CLKINVX1M U13 ( .A(alu_fun[2]), .Y(n25) );
  NOR2X2M U14 ( .A(n25), .B(alu_fun[3]), .Y(n6) );
  NAND2X2M U15 ( .A(alu_fun[3]), .B(alu_fun[2]), .Y(n5) );
  BUFX4M U16 ( .A(n7), .Y(n20) );
  NOR2X1M U17 ( .A(alu_fun[2]), .B(alu_fun[3]), .Y(n7) );
  INVX2M U18 ( .A(rst), .Y(n24) );
  NAND2X2M U19 ( .A(n17), .B(n18), .Y(ALU_OUT[0]) );
  NAND2X2M U20 ( .A(n15), .B(n16), .Y(ALU_OUT[1]) );
  OAI2BB1X2M U21 ( .A0N(arith_out[2]), .A1N(n20), .B0(n14), .Y(ALU_OUT[2]) );
  OAI2BB1X2M U22 ( .A0N(arith_out[3]), .A1N(n20), .B0(n13), .Y(ALU_OUT[3]) );
  OAI2BB1X2M U23 ( .A0N(arith_out[4]), .A1N(n20), .B0(n12), .Y(ALU_OUT[4]) );
  OAI2BB1X2M U24 ( .A0N(arith_out[5]), .A1N(n20), .B0(n11), .Y(ALU_OUT[5]) );
  OAI2BB1X2M U25 ( .A0N(arith_out[6]), .A1N(n20), .B0(n10), .Y(ALU_OUT[6]) );
  OAI2BB1X2M U26 ( .A0N(arith_out[7]), .A1N(n20), .B0(n9), .Y(ALU_OUT[7]) );
  AO22XLM U27 ( .A0(arith_out[8]), .A1(n1), .B0(shift_out[8]), .B1(n21), .Y(
        ALU_OUT[8]) );
  AND2X1M U28 ( .A(arith_out[9]), .B(n1), .Y(ALU_OUT[9]) );
  AND2X1M U29 ( .A(arith_out[10]), .B(n1), .Y(ALU_OUT[10]) );
  AND2X1M U30 ( .A(arith_out[11]), .B(n1), .Y(ALU_OUT[11]) );
  AND2X1M U31 ( .A(arith_out[12]), .B(n1), .Y(ALU_OUT[12]) );
  AND2X1M U32 ( .A(arith_out[13]), .B(n1), .Y(ALU_OUT[13]) );
  AND2X1M U33 ( .A(arith_out[14]), .B(n1), .Y(ALU_OUT[14]) );
  AND2X1M U34 ( .A(arith_out[15]), .B(n1), .Y(ALU_OUT[15]) );
  AOI22X1M U35 ( .A0(shift_out[2]), .A1(n21), .B0(logic_out[2]), .B1(n19), .Y(
        n14) );
  AOI22X1M U36 ( .A0(shift_out[3]), .A1(n21), .B0(logic_out[3]), .B1(n19), .Y(
        n13) );
  AOI22X1M U37 ( .A0(shift_out[4]), .A1(n21), .B0(logic_out[4]), .B1(n19), .Y(
        n12) );
  AOI22X1M U38 ( .A0(shift_out[5]), .A1(n22), .B0(logic_out[5]), .B1(n19), .Y(
        n11) );
  AOI22X1M U39 ( .A0(shift_out[6]), .A1(n22), .B0(logic_out[6]), .B1(n19), .Y(
        n10) );
  AOI22X1M U40 ( .A0(shift_out[7]), .A1(n22), .B0(logic_out[7]), .B1(n19), .Y(
        n9) );
  NAND2X2M U41 ( .A(n2), .B(n3), .Y(ALU_Valid) );
  AOI22X1M U42 ( .A0(cmp_valid), .A1(n4), .B0(shift_valid), .B1(n22), .Y(n3)
         );
  AOI22X1M U43 ( .A0(logic_valid), .A1(n19), .B0(arith_valid), .B1(n20), .Y(n2) );
endmodule


module Data_Sync ( Unsync_bus, bus_enable, clk, rst, sync_bus, enable_pulse );
  input [7:0] Unsync_bus;
  output [7:0] sync_bus;
  input bus_enable, clk, rst;
  output enable_pulse;
  wire   pulse_flop, n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13,
         n14;
  wire   [7:0] meta_flop;

  DFFRQX2M pulse_flop_reg ( .D(meta_flop[7]), .CK(clk), .RN(n11), .Q(
        pulse_flop) );
  DFFRQX2M meta_flop_reg_7_ ( .D(meta_flop[6]), .CK(clk), .RN(n11), .Q(
        meta_flop[7]) );
  DFFRQX2M sync_bus_reg_7_ ( .D(n9), .CK(clk), .RN(n11), .Q(sync_bus[7]) );
  DFFRQX2M sync_bus_reg_5_ ( .D(n7), .CK(clk), .RN(n12), .Q(sync_bus[5]) );
  DFFRQX4M sync_bus_reg_6_ ( .D(n8), .CK(clk), .RN(n11), .Q(sync_bus[6]) );
  DFFRQX4M sync_bus_reg_4_ ( .D(n6), .CK(clk), .RN(n12), .Q(sync_bus[4]) );
  DFFRQX2M sync_bus_reg_3_ ( .D(n5), .CK(clk), .RN(n12), .Q(sync_bus[3]) );
  DFFRQX2M sync_bus_reg_1_ ( .D(n3), .CK(clk), .RN(n12), .Q(sync_bus[1]) );
  DFFRQX4M sync_bus_reg_2_ ( .D(n4), .CK(clk), .RN(n12), .Q(sync_bus[2]) );
  DFFRQX4M enable_pulse_reg ( .D(n14), .CK(clk), .RN(n11), .Q(enable_pulse) );
  DFFRQX2M meta_flop_reg_0_ ( .D(bus_enable), .CK(clk), .RN(n11), .Q(
        meta_flop[0]) );
  DFFRQX2M sync_bus_reg_0_ ( .D(n2), .CK(clk), .RN(n12), .Q(sync_bus[0]) );
  DFFRQX2M meta_flop_reg_1_ ( .D(meta_flop[0]), .CK(clk), .RN(n11), .Q(
        meta_flop[1]) );
  DFFRQX2M meta_flop_reg_2_ ( .D(meta_flop[1]), .CK(clk), .RN(n11), .Q(
        meta_flop[2]) );
  DFFRQX2M meta_flop_reg_3_ ( .D(meta_flop[2]), .CK(clk), .RN(n11), .Q(
        meta_flop[3]) );
  DFFRQX2M meta_flop_reg_4_ ( .D(meta_flop[3]), .CK(clk), .RN(n11), .Q(
        meta_flop[4]) );
  DFFRQX2M meta_flop_reg_5_ ( .D(meta_flop[4]), .CK(clk), .RN(n11), .Q(
        meta_flop[5]) );
  DFFRQX2M meta_flop_reg_6_ ( .D(meta_flop[5]), .CK(clk), .RN(n11), .Q(
        meta_flop[6]) );
  INVX4M U3 ( .A(n1), .Y(n14) );
  INVX6M U4 ( .A(n13), .Y(n11) );
  INVX4M U5 ( .A(n13), .Y(n12) );
  BUFX4M U6 ( .A(n1), .Y(n10) );
  INVX2M U7 ( .A(rst), .Y(n13) );
  NAND2BX2M U8 ( .AN(pulse_flop), .B(meta_flop[7]), .Y(n1) );
  AO22X1M U9 ( .A0(Unsync_bus[2]), .A1(n14), .B0(sync_bus[2]), .B1(n10), .Y(n4) );
  AO22X1M U10 ( .A0(Unsync_bus[4]), .A1(n14), .B0(sync_bus[4]), .B1(n10), .Y(
        n6) );
  AO22X1M U11 ( .A0(Unsync_bus[6]), .A1(n14), .B0(sync_bus[6]), .B1(n10), .Y(
        n8) );
  AO22X1M U12 ( .A0(Unsync_bus[0]), .A1(n14), .B0(sync_bus[0]), .B1(n10), .Y(
        n2) );
  AO22X1M U13 ( .A0(Unsync_bus[5]), .A1(n14), .B0(sync_bus[5]), .B1(n10), .Y(
        n7) );
  AO22X1M U14 ( .A0(Unsync_bus[1]), .A1(n14), .B0(sync_bus[1]), .B1(n10), .Y(
        n3) );
  AO22X1M U15 ( .A0(Unsync_bus[3]), .A1(n14), .B0(sync_bus[3]), .B1(n10), .Y(
        n5) );
  AO22X1M U16 ( .A0(Unsync_bus[7]), .A1(n14), .B0(sync_bus[7]), .B1(n10), .Y(
        n9) );
endmodule


module Pulse_Generator ( bus_enable, clk, rst, enable_pulse );
  input bus_enable, clk, rst;
  output enable_pulse;

  wire   [1:0] pulse_flop;

  DFFRQX1M pulse_flop_reg_1_ ( .D(pulse_flop[0]), .CK(clk), .RN(rst), .Q(
        pulse_flop[1]) );
  DFFRQX1M pulse_flop_reg_0_ ( .D(bus_enable), .CK(clk), .RN(rst), .Q(
        pulse_flop[0]) );
  NOR2BX2M U3 ( .AN(pulse_flop[0]), .B(pulse_flop[1]), .Y(enable_pulse) );
endmodule


module System_Controller ( clk, rst, P_data_sync, data_valid_sync, RD_Data, 
        RD_Valid, WR_en, RD_en, ADDR, WR_Data_regfile, ALU_OUT, ALU_Valid, 
        ALU_FUNC, CLK_en, W_full, WR_DATA_fifo, W_inc );
  input [7:0] P_data_sync;
  input [7:0] RD_Data;
  output [3:0] ADDR;
  output [7:0] WR_Data_regfile;
  input [15:0] ALU_OUT;
  output [3:0] ALU_FUNC;
  output [7:0] WR_DATA_fifo;
  input clk, rst, data_valid_sync, RD_Valid, ALU_Valid, W_full;
  output WR_en, RD_en, CLK_en, W_inc;
  wire   n101, n102, n103, n2, n3, n4, n5, n7, n8, n9, n10, n11, n12, n13, n15,
         n16, n17, n19, n20, n22, n23, n24, n26, n27, n28, n29, n31, n33, n34,
         n35, n38, n40, n41, n42, n44, n45, n46, n53, n59, n60, n61, n62, n63,
         n64, n65, n66, n67, n68, n69, n70, n71, n72, n74, n75, n76, n82, n83,
         n84, n85, n86, n87, n88, n89, n1, n18, n21, n25, n30, n32, n37, n39,
         n43, n47, n48, n49, n50, n51, n52, n54, n55, n56, n57, n58, n73, n77,
         n78, n79, n80, n81, n90, n91, n92, n93, n94, n95, n96, n97, n98, n99,
         n100;
  wire   [3:0] store_address;
  wire   [3:0] current_state;
  wire   [3:0] next_state;

  OAI221X4M U17 ( .A0(n7), .A1(n50), .B0(data_valid_sync), .B1(n33), .C0(n34), 
        .Y(n19) );
  OAI22X8M U76 ( .A0(n97), .A1(n57), .B0(n80), .B1(n71), .Y(ALU_FUNC[3]) );
  OAI22X8M U78 ( .A0(n98), .A1(n57), .B0(n79), .B1(n71), .Y(ALU_FUNC[2]) );
  OAI22X8M U96 ( .A0(n97), .A1(n33), .B0(n76), .B1(n91), .Y(ADDR[3]) );
  OAI22X8M U102 ( .A0(n33), .A1(n99), .B0(n76), .B1(n93), .Y(ADDR[1]) );
  DFFRQX2M store_address_reg_1_ ( .D(n82), .CK(clk), .RN(n48), .Q(
        store_address[1]) );
  DFFRX1M store_func_reg_3_ ( .D(n88), .CK(clk), .RN(n48), .QN(n80) );
  DFFRQX2M store_address_reg_0_ ( .D(n85), .CK(clk), .RN(n48), .Q(
        store_address[0]) );
  DFFRQX2M store_address_reg_3_ ( .D(n84), .CK(clk), .RN(n48), .Q(
        store_address[3]) );
  DFFRQX2M store_address_reg_2_ ( .D(n83), .CK(clk), .RN(n48), .Q(
        store_address[2]) );
  DFFRX1M store_func_reg_1_ ( .D(n86), .CK(clk), .RN(n48), .QN(n78) );
  DFFRX1M store_func_reg_2_ ( .D(n87), .CK(clk), .RN(n48), .QN(n79) );
  DFFRX1M store_func_reg_0_ ( .D(n89), .CK(clk), .RN(n48), .QN(n81) );
  DFFRQX4M current_state_reg_0_ ( .D(next_state[0]), .CK(clk), .RN(n48), .Q(
        current_state[0]) );
  DFFRQX4M current_state_reg_3_ ( .D(next_state[3]), .CK(clk), .RN(n48), .Q(
        current_state[3]) );
  DFFRQX2M current_state_reg_1_ ( .D(next_state[1]), .CK(clk), .RN(n48), .Q(
        current_state[1]) );
  DFFRQX4M current_state_reg_2_ ( .D(next_state[2]), .CK(clk), .RN(n48), .Q(
        current_state[2]) );
  AND2X2M U3 ( .A(n30), .B(n32), .Y(n1) );
  BUFX4M U4 ( .A(n101), .Y(ADDR[2]) );
  OAI22X1M U5 ( .A0(n98), .A1(n33), .B0(n76), .B1(n92), .Y(n101) );
  NAND2X3M U6 ( .A(n20), .B(n1), .Y(ADDR[0]) );
  OA22X2M U7 ( .A0(n100), .A1(n57), .B0(n81), .B1(n71), .Y(n103) );
  INVX6M U8 ( .A(n103), .Y(ALU_FUNC[0]) );
  CLKINVX1M U9 ( .A(n33), .Y(n18) );
  CLKINVX1M U10 ( .A(n100), .Y(n21) );
  CLKINVX1M U11 ( .A(n76), .Y(n25) );
  CLKNAND2X2M U12 ( .A(n18), .B(n21), .Y(n30) );
  CLKNAND2X2M U13 ( .A(store_address[0]), .B(n25), .Y(n32) );
  CLKBUFX8M U14 ( .A(n102), .Y(ALU_FUNC[1]) );
  OAI22X1M U15 ( .A0(n99), .A1(n57), .B0(n78), .B1(n71), .Y(n102) );
  NOR2X2M U16 ( .A(n61), .B(n94), .Y(WR_en) );
  NOR2X3M U18 ( .A(n33), .B(n94), .Y(RD_en) );
  NOR2X4M U19 ( .A(n56), .B(current_state[2]), .Y(n74) );
  NOR2X4M U20 ( .A(current_state[2]), .B(current_state[0]), .Y(n45) );
  OAI21X2M U21 ( .A0(data_valid_sync), .A1(n2), .B0(n20), .Y(n13) );
  INVX4M U22 ( .A(n53), .Y(n57) );
  NOR2BX8M U23 ( .AN(n42), .B(n73), .Y(n76) );
  INVX2M U24 ( .A(n62), .Y(n73) );
  INVX2M U25 ( .A(W_full), .Y(n50) );
  INVX4M U26 ( .A(n46), .Y(n52) );
  BUFX4M U27 ( .A(n61), .Y(n47) );
  AOI21X6M U28 ( .A0(n2), .A1(n27), .B0(n94), .Y(n53) );
  NAND2X4M U29 ( .A(n75), .B(n74), .Y(n33) );
  NAND2X2M U30 ( .A(n11), .B(n74), .Y(n42) );
  AND3X2M U31 ( .A(n40), .B(n27), .C(n15), .Y(n3) );
  NAND2X2M U32 ( .A(n75), .B(n45), .Y(n62) );
  NAND3X2M U33 ( .A(n7), .B(n2), .C(n3), .Y(CLK_en) );
  NAND4BX1M U34 ( .AN(n37), .B(n8), .C(n23), .D(n24), .Y(next_state[0]) );
  AOI21BX2M U35 ( .A0(n41), .A1(n94), .B0N(n2), .Y(n23) );
  AOI211X2M U36 ( .A0(n55), .A1(n51), .B0(n19), .C0(n26), .Y(n24) );
  NAND2X2M U37 ( .A(n9), .B(n42), .Y(n41) );
  INVX2M U38 ( .A(ALU_Valid), .Y(n51) );
  NAND4X2M U39 ( .A(n52), .B(n15), .C(n16), .D(n17), .Y(next_state[1]) );
  AOI211X2M U40 ( .A0(n73), .A1(n94), .B0(n19), .C0(n13), .Y(n17) );
  AOI2BB2X2M U41 ( .B0(ALU_Valid), .B1(n55), .A0N(n9), .A1N(n94), .Y(n16) );
  OR3X2M U42 ( .A(n39), .B(n43), .C(n37), .Y(W_inc) );
  AND3X2M U43 ( .A(n20), .B(n9), .C(n62), .Y(n61) );
  OAI22X1M U44 ( .A0(n53), .A1(n81), .B0(n100), .B1(n57), .Y(n89) );
  OAI22X1M U45 ( .A0(n53), .A1(n80), .B0(n97), .B1(n57), .Y(n88) );
  OAI22X1M U46 ( .A0(n53), .A1(n79), .B0(n98), .B1(n57), .Y(n87) );
  OAI22X1M U47 ( .A0(n53), .A1(n78), .B0(n99), .B1(n57), .Y(n86) );
  CLKBUFX6M U48 ( .A(n59), .Y(n39) );
  NOR2X2M U49 ( .A(n7), .B(W_full), .Y(n59) );
  CLKBUFX6M U50 ( .A(n22), .Y(n37) );
  NOR2X2M U51 ( .A(n15), .B(W_full), .Y(n22) );
  NOR2X6M U52 ( .A(n42), .B(n94), .Y(n46) );
  NOR4X4M U53 ( .A(n95), .B(n99), .C(n38), .D(n58), .Y(n29) );
  NOR2X2M U54 ( .A(n47), .B(n100), .Y(WR_Data_regfile[0]) );
  NOR2X2M U55 ( .A(n47), .B(n99), .Y(WR_Data_regfile[1]) );
  NOR2X2M U56 ( .A(n47), .B(n95), .Y(WR_Data_regfile[5]) );
  OAI22X1M U57 ( .A0(n46), .A1(n90), .B0(n100), .B1(n52), .Y(n85) );
  OAI22X1M U58 ( .A0(n46), .A1(n93), .B0(n99), .B1(n52), .Y(n82) );
  OAI22X1M U59 ( .A0(n46), .A1(n92), .B0(n98), .B1(n52), .Y(n83) );
  OAI22X1M U60 ( .A0(n46), .A1(n91), .B0(n97), .B1(n52), .Y(n84) );
  NOR2X2M U61 ( .A(n47), .B(n98), .Y(WR_Data_regfile[2]) );
  NOR2X2M U62 ( .A(n47), .B(n97), .Y(WR_Data_regfile[3]) );
  NOR2X2M U63 ( .A(n47), .B(n96), .Y(WR_Data_regfile[4]) );
  INVX2M U64 ( .A(n45), .Y(n58) );
  NAND3X2M U65 ( .A(n100), .B(n96), .C(n5), .Y(n8) );
  INVX2M U66 ( .A(n40), .Y(n55) );
  INVX6M U67 ( .A(n49), .Y(n48) );
  INVX2M U68 ( .A(rst), .Y(n49) );
  NOR2X6M U69 ( .A(n77), .B(current_state[3]), .Y(n75) );
  NAND3X4M U70 ( .A(n75), .B(current_state[0]), .C(current_state[2]), .Y(n2)
         );
  INVX2M U71 ( .A(current_state[1]), .Y(n77) );
  NOR2X6M U72 ( .A(current_state[1]), .B(current_state[3]), .Y(n11) );
  OAI2BB1X2M U73 ( .A0N(ALU_OUT[0]), .A1N(n37), .B0(n70), .Y(WR_DATA_fifo[0])
         );
  AOI22X1M U74 ( .A0(ALU_OUT[8]), .A1(n39), .B0(RD_Data[0]), .B1(n43), .Y(n70)
         );
  OAI2BB1X2M U75 ( .A0N(ALU_OUT[1]), .A1N(n37), .B0(n69), .Y(WR_DATA_fifo[1])
         );
  AOI22X1M U77 ( .A0(ALU_OUT[9]), .A1(n39), .B0(RD_Data[1]), .B1(n43), .Y(n69)
         );
  OAI2BB1X2M U79 ( .A0N(ALU_OUT[2]), .A1N(n37), .B0(n68), .Y(WR_DATA_fifo[2])
         );
  AOI22X1M U80 ( .A0(ALU_OUT[10]), .A1(n39), .B0(RD_Data[2]), .B1(n43), .Y(n68) );
  OAI2BB1X2M U81 ( .A0N(ALU_OUT[3]), .A1N(n37), .B0(n67), .Y(WR_DATA_fifo[3])
         );
  AOI22X1M U82 ( .A0(ALU_OUT[11]), .A1(n39), .B0(RD_Data[3]), .B1(n43), .Y(n67) );
  OAI2BB1X2M U83 ( .A0N(ALU_OUT[4]), .A1N(n37), .B0(n66), .Y(WR_DATA_fifo[4])
         );
  AOI22X1M U84 ( .A0(ALU_OUT[12]), .A1(n39), .B0(RD_Data[4]), .B1(n43), .Y(n66) );
  OAI2BB1X2M U85 ( .A0N(ALU_OUT[5]), .A1N(n37), .B0(n65), .Y(WR_DATA_fifo[5])
         );
  AOI22X1M U86 ( .A0(ALU_OUT[13]), .A1(n39), .B0(RD_Data[5]), .B1(n43), .Y(n65) );
  OAI2BB1X2M U87 ( .A0N(ALU_OUT[6]), .A1N(n37), .B0(n64), .Y(WR_DATA_fifo[6])
         );
  AOI22X1M U88 ( .A0(ALU_OUT[14]), .A1(n39), .B0(RD_Data[6]), .B1(n43), .Y(n64) );
  OAI2BB1X2M U89 ( .A0N(ALU_OUT[7]), .A1N(n37), .B0(n63), .Y(WR_DATA_fifo[7])
         );
  AOI22X1M U90 ( .A0(ALU_OUT[15]), .A1(n39), .B0(RD_Data[7]), .B1(n43), .Y(n63) );
  NAND3X4M U91 ( .A(n74), .B(current_state[3]), .C(current_state[1]), .Y(n7)
         );
  NAND3X4M U92 ( .A(current_state[3]), .B(n45), .C(current_state[1]), .Y(n15)
         );
  NAND3X2M U93 ( .A(current_state[3]), .B(n77), .C(n74), .Y(n40) );
  NAND2X4M U94 ( .A(CLK_en), .B(n72), .Y(n71) );
  NAND4X2M U95 ( .A(data_valid_sync), .B(n15), .C(n40), .D(n7), .Y(n72) );
  NAND3X2M U97 ( .A(n45), .B(n77), .C(current_state[3]), .Y(n27) );
  INVX6M U98 ( .A(data_valid_sync), .Y(n94) );
  INVX2M U99 ( .A(current_state[0]), .Y(n56) );
  INVX4M U100 ( .A(P_data_sync[0]), .Y(n100) );
  INVX4M U101 ( .A(P_data_sync[2]), .Y(n98) );
  NAND3X4M U103 ( .A(n75), .B(n56), .C(current_state[2]), .Y(n20) );
  INVX4M U104 ( .A(P_data_sync[1]), .Y(n99) );
  INVX4M U105 ( .A(P_data_sync[3]), .Y(n97) );
  INVX2M U106 ( .A(store_address[2]), .Y(n92) );
  INVX2M U107 ( .A(store_address[3]), .Y(n91) );
  INVX2M U108 ( .A(store_address[0]), .Y(n90) );
  CLKBUFX6M U109 ( .A(n60), .Y(n43) );
  NOR4BBX2M U110 ( .AN(n11), .BN(current_state[2]), .C(n12), .D(
        current_state[0]), .Y(n60) );
  NAND2X2M U111 ( .A(RD_Valid), .B(n50), .Y(n12) );
  INVX2M U112 ( .A(store_address[1]), .Y(n93) );
  NAND3X4M U113 ( .A(n11), .B(current_state[0]), .C(current_state[2]), .Y(n9)
         );
  NAND4X2M U114 ( .A(P_data_sync[4]), .B(P_data_sync[0]), .C(n29), .D(n35), 
        .Y(n34) );
  NOR3X2M U115 ( .A(n94), .B(P_data_sync[6]), .C(P_data_sync[2]), .Y(n35) );
  AOI31X2M U116 ( .A0(n20), .A1(n27), .A2(n28), .B0(n94), .Y(n26) );
  NAND3X2M U117 ( .A(n29), .B(n100), .C(n31), .Y(n28) );
  NOR3X2M U118 ( .A(P_data_sync[2]), .B(P_data_sync[6]), .C(P_data_sync[4]), 
        .Y(n31) );
  NOR2BX2M U119 ( .AN(P_data_sync[7]), .B(n47), .Y(WR_Data_regfile[7]) );
  OAI211X2M U120 ( .A0(n94), .A1(n2), .B0(n3), .C0(n4), .Y(next_state[3]) );
  AOI32X1M U121 ( .A0(P_data_sync[0]), .A1(n5), .A2(P_data_sync[4]), .B0(
        W_full), .B1(n54), .Y(n4) );
  INVX2M U122 ( .A(n7), .Y(n54) );
  NOR2BX2M U123 ( .AN(P_data_sync[6]), .B(n47), .Y(WR_Data_regfile[6]) );
  NAND4BX1M U124 ( .AN(RD_en), .B(n8), .C(n9), .D(n10), .Y(next_state[2]) );
  AOI31X2M U125 ( .A0(n11), .A1(n12), .A2(current_state[2]), .B0(n13), .Y(n10)
         );
  NAND3X2M U126 ( .A(P_data_sync[3]), .B(n11), .C(P_data_sync[7]), .Y(n38) );
  AND4X2M U127 ( .A(P_data_sync[6]), .B(P_data_sync[2]), .C(data_valid_sync), 
        .D(n44), .Y(n5) );
  NOR4X2M U128 ( .A(P_data_sync[5]), .B(P_data_sync[1]), .C(n58), .D(n38), .Y(
        n44) );
  INVX2M U129 ( .A(P_data_sync[4]), .Y(n96) );
  INVX2M U130 ( .A(P_data_sync[5]), .Y(n95) );
endmodule


module FIFO_MEM_CONTROL ( W_data, W_inc, W_full, W_addr, R_addr, W_clk, R_data
 );
  input [7:0] W_data;
  input [2:0] W_addr;
  input [2:0] R_addr;
  output [7:0] R_data;
  input W_inc, W_full, W_clk;
  wire   n12, n15, n16, n18, n19, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44,
         n45, n46, n47, n48, n49, n50, n51, n52, n53, n54, n55, n56, n57, n58,
         n59, n60, n61, n62, n63, n64, n65, n66, n67, n68, n69, n70, n71, n72,
         n73, n74, n75, n76, n77, n78, n79, n80, n81, n82, n83, n84, n85, n1,
         n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n13, n14, n17, n20, n21,
         n86, n87, n88, n89, n90, n91, n92, n93, n94, n95, n96, n97, n98, n99,
         n100, n101, n102, n103, n104, n105, n106, n107, n108, n109, n110,
         n111, n112, n113, n114, n115, n116, n117, n118, n119, n120, n121,
         n122, n123, n124, n125, n126, n127, n128, n129, n130, n131, n132,
         n133, n134, n135, n136, n137, n138, n139, n140, n141, n142, n143,
         n144, n145;
  wire   [63:0] MEM;

  DFFQX2M MEM_reg_1__7_ ( .D(n37), .CK(W_clk), .Q(MEM[15]) );
  DFFQX2M MEM_reg_1__6_ ( .D(n36), .CK(W_clk), .Q(MEM[14]) );
  DFFQX2M MEM_reg_1__5_ ( .D(n35), .CK(W_clk), .Q(MEM[13]) );
  DFFQX2M MEM_reg_1__4_ ( .D(n34), .CK(W_clk), .Q(MEM[12]) );
  DFFQX2M MEM_reg_1__3_ ( .D(n33), .CK(W_clk), .Q(MEM[11]) );
  DFFQX2M MEM_reg_1__2_ ( .D(n32), .CK(W_clk), .Q(MEM[10]) );
  DFFQX2M MEM_reg_1__1_ ( .D(n31), .CK(W_clk), .Q(MEM[9]) );
  DFFQX2M MEM_reg_1__0_ ( .D(n30), .CK(W_clk), .Q(MEM[8]) );
  DFFQX2M MEM_reg_0__7_ ( .D(n29), .CK(W_clk), .Q(MEM[7]) );
  DFFQX2M MEM_reg_0__6_ ( .D(n28), .CK(W_clk), .Q(MEM[6]) );
  DFFQX2M MEM_reg_0__5_ ( .D(n27), .CK(W_clk), .Q(MEM[5]) );
  DFFQX2M MEM_reg_0__4_ ( .D(n26), .CK(W_clk), .Q(MEM[4]) );
  DFFQX2M MEM_reg_0__3_ ( .D(n25), .CK(W_clk), .Q(MEM[3]) );
  DFFQX2M MEM_reg_0__2_ ( .D(n24), .CK(W_clk), .Q(MEM[2]) );
  DFFQX2M MEM_reg_0__1_ ( .D(n23), .CK(W_clk), .Q(MEM[1]) );
  DFFQX2M MEM_reg_0__0_ ( .D(n22), .CK(W_clk), .Q(MEM[0]) );
  DFFQX2M MEM_reg_5__7_ ( .D(n69), .CK(W_clk), .Q(MEM[47]) );
  DFFQX2M MEM_reg_5__6_ ( .D(n68), .CK(W_clk), .Q(MEM[46]) );
  DFFQX2M MEM_reg_5__5_ ( .D(n67), .CK(W_clk), .Q(MEM[45]) );
  DFFQX2M MEM_reg_5__4_ ( .D(n66), .CK(W_clk), .Q(MEM[44]) );
  DFFQX2M MEM_reg_5__3_ ( .D(n65), .CK(W_clk), .Q(MEM[43]) );
  DFFQX2M MEM_reg_5__2_ ( .D(n64), .CK(W_clk), .Q(MEM[42]) );
  DFFQX2M MEM_reg_5__1_ ( .D(n63), .CK(W_clk), .Q(MEM[41]) );
  DFFQX2M MEM_reg_5__0_ ( .D(n62), .CK(W_clk), .Q(MEM[40]) );
  DFFQX2M MEM_reg_4__7_ ( .D(n61), .CK(W_clk), .Q(MEM[39]) );
  DFFQX2M MEM_reg_4__6_ ( .D(n60), .CK(W_clk), .Q(MEM[38]) );
  DFFQX2M MEM_reg_4__5_ ( .D(n59), .CK(W_clk), .Q(MEM[37]) );
  DFFQX2M MEM_reg_4__4_ ( .D(n58), .CK(W_clk), .Q(MEM[36]) );
  DFFQX2M MEM_reg_4__3_ ( .D(n57), .CK(W_clk), .Q(MEM[35]) );
  DFFQX2M MEM_reg_4__2_ ( .D(n56), .CK(W_clk), .Q(MEM[34]) );
  DFFQX2M MEM_reg_4__1_ ( .D(n55), .CK(W_clk), .Q(MEM[33]) );
  DFFQX2M MEM_reg_4__0_ ( .D(n54), .CK(W_clk), .Q(MEM[32]) );
  DFFQX2M MEM_reg_7__7_ ( .D(n85), .CK(W_clk), .Q(MEM[63]) );
  DFFQX2M MEM_reg_7__6_ ( .D(n84), .CK(W_clk), .Q(MEM[62]) );
  DFFQX2M MEM_reg_7__5_ ( .D(n83), .CK(W_clk), .Q(MEM[61]) );
  DFFQX2M MEM_reg_7__4_ ( .D(n82), .CK(W_clk), .Q(MEM[60]) );
  DFFQX2M MEM_reg_7__3_ ( .D(n81), .CK(W_clk), .Q(MEM[59]) );
  DFFQX2M MEM_reg_7__2_ ( .D(n80), .CK(W_clk), .Q(MEM[58]) );
  DFFQX2M MEM_reg_7__1_ ( .D(n79), .CK(W_clk), .Q(MEM[57]) );
  DFFQX2M MEM_reg_7__0_ ( .D(n78), .CK(W_clk), .Q(MEM[56]) );
  DFFQX2M MEM_reg_6__7_ ( .D(n77), .CK(W_clk), .Q(MEM[55]) );
  DFFQX2M MEM_reg_6__6_ ( .D(n76), .CK(W_clk), .Q(MEM[54]) );
  DFFQX2M MEM_reg_6__5_ ( .D(n75), .CK(W_clk), .Q(MEM[53]) );
  DFFQX2M MEM_reg_6__4_ ( .D(n74), .CK(W_clk), .Q(MEM[52]) );
  DFFQX2M MEM_reg_6__3_ ( .D(n73), .CK(W_clk), .Q(MEM[51]) );
  DFFQX2M MEM_reg_6__2_ ( .D(n72), .CK(W_clk), .Q(MEM[50]) );
  DFFQX2M MEM_reg_6__1_ ( .D(n71), .CK(W_clk), .Q(MEM[49]) );
  DFFQX2M MEM_reg_6__0_ ( .D(n70), .CK(W_clk), .Q(MEM[48]) );
  DFFQX2M MEM_reg_3__7_ ( .D(n53), .CK(W_clk), .Q(MEM[31]) );
  DFFQX2M MEM_reg_3__6_ ( .D(n52), .CK(W_clk), .Q(MEM[30]) );
  DFFQX2M MEM_reg_3__5_ ( .D(n51), .CK(W_clk), .Q(MEM[29]) );
  DFFQX2M MEM_reg_3__4_ ( .D(n50), .CK(W_clk), .Q(MEM[28]) );
  DFFQX2M MEM_reg_3__3_ ( .D(n49), .CK(W_clk), .Q(MEM[27]) );
  DFFQX2M MEM_reg_3__2_ ( .D(n48), .CK(W_clk), .Q(MEM[26]) );
  DFFQX2M MEM_reg_3__1_ ( .D(n47), .CK(W_clk), .Q(MEM[25]) );
  DFFQX2M MEM_reg_3__0_ ( .D(n46), .CK(W_clk), .Q(MEM[24]) );
  DFFQX2M MEM_reg_2__7_ ( .D(n45), .CK(W_clk), .Q(MEM[23]) );
  DFFQX2M MEM_reg_2__6_ ( .D(n44), .CK(W_clk), .Q(MEM[22]) );
  DFFQX2M MEM_reg_2__5_ ( .D(n43), .CK(W_clk), .Q(MEM[21]) );
  DFFQX2M MEM_reg_2__4_ ( .D(n42), .CK(W_clk), .Q(MEM[20]) );
  DFFQX2M MEM_reg_2__3_ ( .D(n41), .CK(W_clk), .Q(MEM[19]) );
  DFFQX2M MEM_reg_2__2_ ( .D(n40), .CK(W_clk), .Q(MEM[18]) );
  DFFQX2M MEM_reg_2__1_ ( .D(n39), .CK(W_clk), .Q(MEM[17]) );
  DFFQX2M MEM_reg_2__0_ ( .D(n38), .CK(W_clk), .Q(MEM[16]) );
  NOR2X2M U2 ( .A(R_addr[1]), .B(R_addr[2]), .Y(n105) );
  AOI221X2M U3 ( .A0(MEM[32]), .A1(n116), .B0(MEM[48]), .B1(n117), .C0(n8), 
        .Y(n9) );
  AOI221X2M U4 ( .A0(MEM[40]), .A1(n116), .B0(MEM[56]), .B1(n117), .C0(n7), 
        .Y(n10) );
  AOI221X2M U5 ( .A0(MEM[38]), .A1(n115), .B0(MEM[54]), .B1(n117), .C0(n101), 
        .Y(n102) );
  AOI221X2M U6 ( .A0(MEM[46]), .A1(n115), .B0(MEM[62]), .B1(n117), .C0(n100), 
        .Y(n103) );
  AOI221X2M U7 ( .A0(MEM[37]), .A1(n115), .B0(MEM[53]), .B1(n117), .C0(n97), 
        .Y(n98) );
  AOI221X2M U8 ( .A0(MEM[45]), .A1(n115), .B0(MEM[61]), .B1(n117), .C0(n96), 
        .Y(n99) );
  AOI221X2M U9 ( .A0(MEM[36]), .A1(n115), .B0(MEM[52]), .B1(n117), .C0(n93), 
        .Y(n94) );
  AOI221X2M U10 ( .A0(MEM[44]), .A1(n115), .B0(MEM[60]), .B1(n117), .C0(n92), 
        .Y(n95) );
  AOI221X2M U11 ( .A0(MEM[35]), .A1(n116), .B0(MEM[51]), .B1(n117), .C0(n89), 
        .Y(n90) );
  AOI221X2M U12 ( .A0(MEM[43]), .A1(n116), .B0(MEM[59]), .B1(n117), .C0(n88), 
        .Y(n91) );
  AOI221X2M U13 ( .A0(MEM[34]), .A1(n116), .B0(MEM[50]), .B1(n117), .C0(n21), 
        .Y(n86) );
  AOI221X2M U14 ( .A0(MEM[42]), .A1(n116), .B0(MEM[58]), .B1(n117), .C0(n20), 
        .Y(n87) );
  AOI221X2M U15 ( .A0(MEM[33]), .A1(n116), .B0(MEM[49]), .B1(n117), .C0(n13), 
        .Y(n14) );
  AOI221X2M U16 ( .A0(MEM[41]), .A1(n116), .B0(MEM[57]), .B1(n117), .C0(n11), 
        .Y(n17) );
  AOI221X2M U17 ( .A0(MEM[39]), .A1(n115), .B0(MEM[55]), .B1(n117), .C0(n107), 
        .Y(n110) );
  AOI221X2M U18 ( .A0(MEM[47]), .A1(n115), .B0(MEM[63]), .B1(n117), .C0(n104), 
        .Y(n111) );
  NOR2BX4M U19 ( .AN(n16), .B(W_addr[2]), .Y(n12) );
  AND2X2M U20 ( .A(W_addr[2]), .B(n16), .Y(n18) );
  CLKBUFX8M U21 ( .A(n19), .Y(n126) );
  CLKBUFX8M U22 ( .A(n15), .Y(n129) );
  INVX2M U23 ( .A(W_addr[1]), .Y(n145) );
  INVX2M U24 ( .A(W_addr[0]), .Y(n144) );
  NOR2X2M U25 ( .A(n113), .B(R_addr[2]), .Y(n106) );
  NOR2X2M U26 ( .A(n112), .B(R_addr[1]), .Y(n109) );
  NOR2BX2M U27 ( .AN(W_inc), .B(W_full), .Y(n16) );
  INVX4M U28 ( .A(n2), .Y(n128) );
  INVX4M U29 ( .A(n2), .Y(n127) );
  INVX4M U30 ( .A(n1), .Y(n135) );
  INVX4M U31 ( .A(n1), .Y(n134) );
  AND3X2M U32 ( .A(n144), .B(n145), .C(n12), .Y(n1) );
  AND3X2M U33 ( .A(n144), .B(n145), .C(n18), .Y(n2) );
  INVX4M U34 ( .A(n5), .Y(n133) );
  INVX4M U35 ( .A(n5), .Y(n132) );
  INVX4M U36 ( .A(n4), .Y(n123) );
  INVX4M U37 ( .A(n4), .Y(n122) );
  INVX4M U38 ( .A(n6), .Y(n131) );
  INVX4M U39 ( .A(n6), .Y(n130) );
  INVX4M U40 ( .A(n3), .Y(n125) );
  INVX4M U41 ( .A(n3), .Y(n124) );
  CLKBUFX8M U42 ( .A(n108), .Y(n117) );
  NOR2X2M U43 ( .A(n112), .B(n113), .Y(n108) );
  BUFX4M U44 ( .A(n106), .Y(n118) );
  BUFX4M U45 ( .A(n106), .Y(n119) );
  BUFX4M U46 ( .A(n109), .Y(n115) );
  BUFX4M U47 ( .A(n109), .Y(n116) );
  BUFX4M U48 ( .A(n105), .Y(n120) );
  BUFX4M U49 ( .A(n105), .Y(n121) );
  INVX4M U50 ( .A(R_addr[0]), .Y(n114) );
  INVX4M U51 ( .A(W_data[0]), .Y(n136) );
  INVX4M U52 ( .A(W_data[1]), .Y(n137) );
  INVX4M U53 ( .A(W_data[2]), .Y(n138) );
  INVX4M U54 ( .A(W_data[3]), .Y(n139) );
  INVX4M U55 ( .A(W_data[4]), .Y(n140) );
  INVX4M U56 ( .A(W_data[5]), .Y(n141) );
  INVX4M U57 ( .A(W_data[6]), .Y(n142) );
  INVX4M U58 ( .A(W_data[7]), .Y(n143) );
  OAI2BB2X1M U59 ( .B0(n136), .B1(n133), .A0N(MEM[8]), .A1N(n133), .Y(n30) );
  OAI2BB2X1M U60 ( .B0(n137), .B1(n132), .A0N(MEM[9]), .A1N(n132), .Y(n31) );
  OAI2BB2X1M U61 ( .B0(n138), .B1(n133), .A0N(MEM[10]), .A1N(n133), .Y(n32) );
  OAI2BB2X1M U62 ( .B0(n139), .B1(n132), .A0N(MEM[11]), .A1N(n132), .Y(n33) );
  OAI2BB2X1M U63 ( .B0(n140), .B1(n133), .A0N(MEM[12]), .A1N(n133), .Y(n34) );
  OAI2BB2X1M U64 ( .B0(n141), .B1(n132), .A0N(MEM[13]), .A1N(n132), .Y(n35) );
  OAI2BB2X1M U65 ( .B0(n142), .B1(n133), .A0N(MEM[14]), .A1N(n133), .Y(n36) );
  OAI2BB2X1M U66 ( .B0(n143), .B1(n132), .A0N(MEM[15]), .A1N(n132), .Y(n37) );
  OAI2BB2X1M U67 ( .B0(n136), .B1(n131), .A0N(MEM[16]), .A1N(n131), .Y(n38) );
  OAI2BB2X1M U68 ( .B0(n137), .B1(n130), .A0N(MEM[17]), .A1N(n130), .Y(n39) );
  OAI2BB2X1M U69 ( .B0(n138), .B1(n131), .A0N(MEM[18]), .A1N(n131), .Y(n40) );
  OAI2BB2X1M U70 ( .B0(n139), .B1(n130), .A0N(MEM[19]), .A1N(n130), .Y(n41) );
  OAI2BB2X1M U71 ( .B0(n140), .B1(n131), .A0N(MEM[20]), .A1N(n131), .Y(n42) );
  OAI2BB2X1M U72 ( .B0(n141), .B1(n130), .A0N(MEM[21]), .A1N(n130), .Y(n43) );
  OAI2BB2X1M U73 ( .B0(n142), .B1(n131), .A0N(MEM[22]), .A1N(n131), .Y(n44) );
  OAI2BB2X1M U74 ( .B0(n143), .B1(n130), .A0N(MEM[23]), .A1N(n130), .Y(n45) );
  OAI2BB2X1M U75 ( .B0(n136), .B1(n129), .A0N(MEM[24]), .A1N(n129), .Y(n46) );
  OAI2BB2X1M U76 ( .B0(n137), .B1(n129), .A0N(MEM[25]), .A1N(n129), .Y(n47) );
  OAI2BB2X1M U77 ( .B0(n138), .B1(n129), .A0N(MEM[26]), .A1N(n129), .Y(n48) );
  OAI2BB2X1M U78 ( .B0(n139), .B1(n129), .A0N(MEM[27]), .A1N(n129), .Y(n49) );
  OAI2BB2X1M U79 ( .B0(n140), .B1(n129), .A0N(MEM[28]), .A1N(n129), .Y(n50) );
  OAI2BB2X1M U80 ( .B0(n141), .B1(n129), .A0N(MEM[29]), .A1N(n129), .Y(n51) );
  OAI2BB2X1M U81 ( .B0(n142), .B1(n129), .A0N(MEM[30]), .A1N(n129), .Y(n52) );
  OAI2BB2X1M U82 ( .B0(n143), .B1(n129), .A0N(MEM[31]), .A1N(n129), .Y(n53) );
  OAI2BB2X1M U83 ( .B0(n136), .B1(n128), .A0N(MEM[32]), .A1N(n128), .Y(n54) );
  OAI2BB2X1M U84 ( .B0(n137), .B1(n127), .A0N(MEM[33]), .A1N(n127), .Y(n55) );
  OAI2BB2X1M U85 ( .B0(n138), .B1(n128), .A0N(MEM[34]), .A1N(n128), .Y(n56) );
  OAI2BB2X1M U86 ( .B0(n139), .B1(n127), .A0N(MEM[35]), .A1N(n127), .Y(n57) );
  OAI2BB2X1M U87 ( .B0(n140), .B1(n128), .A0N(MEM[36]), .A1N(n128), .Y(n58) );
  OAI2BB2X1M U88 ( .B0(n141), .B1(n127), .A0N(MEM[37]), .A1N(n127), .Y(n59) );
  OAI2BB2X1M U89 ( .B0(n142), .B1(n128), .A0N(MEM[38]), .A1N(n128), .Y(n60) );
  OAI2BB2X1M U90 ( .B0(n143), .B1(n127), .A0N(MEM[39]), .A1N(n127), .Y(n61) );
  OAI2BB2X1M U91 ( .B0(n136), .B1(n126), .A0N(MEM[40]), .A1N(n126), .Y(n62) );
  OAI2BB2X1M U92 ( .B0(n137), .B1(n126), .A0N(MEM[41]), .A1N(n126), .Y(n63) );
  OAI2BB2X1M U93 ( .B0(n138), .B1(n126), .A0N(MEM[42]), .A1N(n126), .Y(n64) );
  OAI2BB2X1M U94 ( .B0(n139), .B1(n126), .A0N(MEM[43]), .A1N(n126), .Y(n65) );
  OAI2BB2X1M U95 ( .B0(n140), .B1(n126), .A0N(MEM[44]), .A1N(n126), .Y(n66) );
  OAI2BB2X1M U96 ( .B0(n141), .B1(n126), .A0N(MEM[45]), .A1N(n126), .Y(n67) );
  OAI2BB2X1M U97 ( .B0(n142), .B1(n126), .A0N(MEM[46]), .A1N(n126), .Y(n68) );
  OAI2BB2X1M U98 ( .B0(n143), .B1(n126), .A0N(MEM[47]), .A1N(n126), .Y(n69) );
  OAI2BB2X1M U99 ( .B0(n136), .B1(n125), .A0N(MEM[48]), .A1N(n125), .Y(n70) );
  OAI2BB2X1M U100 ( .B0(n137), .B1(n124), .A0N(MEM[49]), .A1N(n124), .Y(n71)
         );
  OAI2BB2X1M U101 ( .B0(n138), .B1(n125), .A0N(MEM[50]), .A1N(n125), .Y(n72)
         );
  OAI2BB2X1M U102 ( .B0(n139), .B1(n124), .A0N(MEM[51]), .A1N(n124), .Y(n73)
         );
  OAI2BB2X1M U103 ( .B0(n140), .B1(n125), .A0N(MEM[52]), .A1N(n125), .Y(n74)
         );
  OAI2BB2X1M U104 ( .B0(n141), .B1(n124), .A0N(MEM[53]), .A1N(n124), .Y(n75)
         );
  OAI2BB2X1M U105 ( .B0(n142), .B1(n125), .A0N(MEM[54]), .A1N(n125), .Y(n76)
         );
  OAI2BB2X1M U106 ( .B0(n143), .B1(n124), .A0N(MEM[55]), .A1N(n124), .Y(n77)
         );
  OAI2BB2X1M U107 ( .B0(n136), .B1(n123), .A0N(MEM[56]), .A1N(n123), .Y(n78)
         );
  OAI2BB2X1M U108 ( .B0(n137), .B1(n122), .A0N(MEM[57]), .A1N(n122), .Y(n79)
         );
  OAI2BB2X1M U109 ( .B0(n138), .B1(n123), .A0N(MEM[58]), .A1N(n123), .Y(n80)
         );
  OAI2BB2X1M U110 ( .B0(n139), .B1(n122), .A0N(MEM[59]), .A1N(n122), .Y(n81)
         );
  OAI2BB2X1M U111 ( .B0(n140), .B1(n123), .A0N(MEM[60]), .A1N(n123), .Y(n82)
         );
  OAI2BB2X1M U112 ( .B0(n141), .B1(n122), .A0N(MEM[61]), .A1N(n122), .Y(n83)
         );
  OAI2BB2X1M U113 ( .B0(n142), .B1(n123), .A0N(MEM[62]), .A1N(n123), .Y(n84)
         );
  OAI2BB2X1M U114 ( .B0(n143), .B1(n122), .A0N(MEM[63]), .A1N(n122), .Y(n85)
         );
  OAI2BB2X1M U115 ( .B0(n135), .B1(n136), .A0N(MEM[0]), .A1N(n135), .Y(n22) );
  OAI2BB2X1M U116 ( .B0(n134), .B1(n137), .A0N(MEM[1]), .A1N(n134), .Y(n23) );
  OAI2BB2X1M U117 ( .B0(n135), .B1(n138), .A0N(MEM[2]), .A1N(n135), .Y(n24) );
  OAI2BB2X1M U118 ( .B0(n134), .B1(n139), .A0N(MEM[3]), .A1N(n134), .Y(n25) );
  OAI2BB2X1M U119 ( .B0(n135), .B1(n140), .A0N(MEM[4]), .A1N(n135), .Y(n26) );
  OAI2BB2X1M U120 ( .B0(n134), .B1(n141), .A0N(MEM[5]), .A1N(n134), .Y(n27) );
  OAI2BB2X1M U121 ( .B0(n135), .B1(n142), .A0N(MEM[6]), .A1N(n135), .Y(n28) );
  OAI2BB2X1M U122 ( .B0(n134), .B1(n143), .A0N(MEM[7]), .A1N(n134), .Y(n29) );
  NAND3X2M U123 ( .A(W_addr[0]), .B(n12), .C(W_addr[1]), .Y(n15) );
  NAND3X2M U124 ( .A(W_addr[0]), .B(n145), .C(n18), .Y(n19) );
  AND3X2M U125 ( .A(W_addr[1]), .B(n144), .C(n18), .Y(n3) );
  AND3X2M U126 ( .A(W_addr[1]), .B(W_addr[0]), .C(n18), .Y(n4) );
  AND3X2M U127 ( .A(n12), .B(n145), .C(W_addr[0]), .Y(n5) );
  AND3X2M U128 ( .A(n12), .B(n144), .C(W_addr[1]), .Y(n6) );
  INVX2M U129 ( .A(R_addr[1]), .Y(n113) );
  INVX2M U130 ( .A(R_addr[2]), .Y(n112) );
  AO22X1M U131 ( .A0(MEM[24]), .A1(n119), .B0(MEM[8]), .B1(n121), .Y(n7) );
  AO22X1M U132 ( .A0(MEM[16]), .A1(n119), .B0(MEM[0]), .B1(n121), .Y(n8) );
  OAI22X1M U133 ( .A0(n114), .A1(n10), .B0(R_addr[0]), .B1(n9), .Y(R_data[0])
         );
  AO22X1M U134 ( .A0(MEM[25]), .A1(n119), .B0(MEM[9]), .B1(n121), .Y(n11) );
  AO22X1M U135 ( .A0(MEM[17]), .A1(n119), .B0(MEM[1]), .B1(n121), .Y(n13) );
  OAI22X1M U136 ( .A0(n114), .A1(n17), .B0(R_addr[0]), .B1(n14), .Y(R_data[1])
         );
  AO22X1M U137 ( .A0(MEM[26]), .A1(n119), .B0(MEM[10]), .B1(n121), .Y(n20) );
  AO22X1M U138 ( .A0(MEM[18]), .A1(n119), .B0(MEM[2]), .B1(n121), .Y(n21) );
  OAI22X1M U139 ( .A0(n114), .A1(n87), .B0(R_addr[0]), .B1(n86), .Y(R_data[2])
         );
  AO22X1M U140 ( .A0(MEM[27]), .A1(n119), .B0(MEM[11]), .B1(n121), .Y(n88) );
  AO22X1M U141 ( .A0(MEM[19]), .A1(n119), .B0(MEM[3]), .B1(n121), .Y(n89) );
  OAI22X1M U142 ( .A0(n114), .A1(n91), .B0(R_addr[0]), .B1(n90), .Y(R_data[3])
         );
  AO22X1M U143 ( .A0(MEM[28]), .A1(n118), .B0(MEM[12]), .B1(n120), .Y(n92) );
  AO22X1M U144 ( .A0(MEM[20]), .A1(n118), .B0(MEM[4]), .B1(n120), .Y(n93) );
  OAI22X1M U145 ( .A0(n114), .A1(n95), .B0(R_addr[0]), .B1(n94), .Y(R_data[4])
         );
  AO22X1M U146 ( .A0(MEM[29]), .A1(n118), .B0(MEM[13]), .B1(n120), .Y(n96) );
  AO22X1M U147 ( .A0(MEM[21]), .A1(n118), .B0(MEM[5]), .B1(n120), .Y(n97) );
  OAI22X1M U148 ( .A0(n114), .A1(n99), .B0(R_addr[0]), .B1(n98), .Y(R_data[5])
         );
  AO22X1M U149 ( .A0(MEM[30]), .A1(n118), .B0(MEM[14]), .B1(n120), .Y(n100) );
  AO22X1M U150 ( .A0(MEM[22]), .A1(n118), .B0(MEM[6]), .B1(n120), .Y(n101) );
  OAI22X1M U151 ( .A0(n114), .A1(n103), .B0(R_addr[0]), .B1(n102), .Y(
        R_data[6]) );
  AO22X1M U152 ( .A0(MEM[31]), .A1(n118), .B0(MEM[15]), .B1(n120), .Y(n104) );
  AO22X1M U153 ( .A0(MEM[23]), .A1(n118), .B0(MEM[7]), .B1(n120), .Y(n107) );
  OAI22X1M U154 ( .A0(n111), .A1(n114), .B0(R_addr[0]), .B1(n110), .Y(
        R_data[7]) );
endmodule


module FIFO_WR ( W_inc, W_clk, W_rst, SYNC_R_ptr, W_ptr, W_addr, W_full );
  input [3:0] SYNC_R_ptr;
  output [3:0] W_ptr;
  output [2:0] W_addr;
  input W_inc, W_clk, W_rst;
  output W_full;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15;

  DFFRHQX8M W_counter_reg_1_ ( .D(n13), .CK(W_clk), .RN(n15), .Q(W_addr[1]) );
  DFFRQX2M W_counter_reg_3_ ( .D(n11), .CK(W_clk), .RN(n15), .Q(W_ptr[3]) );
  DFFRQX4M W_counter_reg_2_ ( .D(n12), .CK(W_clk), .RN(n15), .Q(W_addr[2]) );
  DFFRX4M W_counter_reg_0_ ( .D(n14), .CK(W_clk), .RN(n15), .Q(W_addr[0]), 
        .QN(n1) );
  BUFX2M U3 ( .A(W_rst), .Y(n15) );
  INVX4M U4 ( .A(n6), .Y(W_full) );
  NAND2X2M U5 ( .A(W_inc), .B(n6), .Y(n5) );
  CLKXOR2X2M U6 ( .A(W_ptr[3]), .B(W_addr[2]), .Y(W_ptr[2]) );
  CLKXOR2X2M U7 ( .A(W_addr[1]), .B(W_addr[2]), .Y(W_ptr[1]) );
  XNOR2X4M U8 ( .A(n1), .B(W_addr[1]), .Y(W_ptr[0]) );
  XNOR2X2M U9 ( .A(W_ptr[1]), .B(SYNC_R_ptr[1]), .Y(n7) );
  NAND4X2M U10 ( .A(n7), .B(n8), .C(n9), .D(n10), .Y(n6) );
  CLKXOR2X2M U11 ( .A(W_ptr[3]), .B(SYNC_R_ptr[3]), .Y(n10) );
  CLKXOR2X2M U12 ( .A(SYNC_R_ptr[2]), .B(W_ptr[2]), .Y(n9) );
  XNOR2X2M U13 ( .A(W_ptr[0]), .B(SYNC_R_ptr[0]), .Y(n8) );
  NOR2X2M U14 ( .A(n5), .B(n1), .Y(n4) );
  CLKXOR2X2M U15 ( .A(W_addr[1]), .B(n4), .Y(n13) );
  CLKXOR2X2M U16 ( .A(n1), .B(n5), .Y(n14) );
  XNOR2X2M U17 ( .A(W_addr[2]), .B(n3), .Y(n12) );
  XNOR2X2M U18 ( .A(W_ptr[3]), .B(n2), .Y(n11) );
  NAND2BX2M U19 ( .AN(n3), .B(W_addr[2]), .Y(n2) );
  NAND2X2M U20 ( .A(n4), .B(W_addr[1]), .Y(n3) );
endmodule


module FIFO_RD ( R_inc, R_clk, R_rst, SYNC_W_ptr, R_ptr, R_addr, R_empty );
  input [3:0] SYNC_W_ptr;
  output [3:0] R_ptr;
  output [2:0] R_addr;
  input R_inc, R_clk, R_rst;
  output R_empty;
  wire   n18, n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15,
         n17;

  DFFRQX2M R_counter_reg_3_ ( .D(n11), .CK(R_clk), .RN(n17), .Q(R_ptr[3]) );
  DFFRQX4M R_counter_reg_1_ ( .D(n13), .CK(R_clk), .RN(n17), .Q(R_addr[1]) );
  DFFRQX1M R_counter_reg_2_ ( .D(n12), .CK(R_clk), .RN(n17), .Q(n18) );
  DFFRX4M R_counter_reg_0_ ( .D(n14), .CK(R_clk), .RN(n17), .Q(R_addr[0]), 
        .QN(n1) );
  XNOR2X4M U3 ( .A(n1), .B(R_addr[1]), .Y(R_ptr[0]) );
  INVXLM U4 ( .A(n18), .Y(n15) );
  INVX4M U5 ( .A(n15), .Y(R_addr[2]) );
  BUFX2M U6 ( .A(R_rst), .Y(n17) );
  INVX2M U7 ( .A(n6), .Y(R_empty) );
  CLKXOR2X2M U8 ( .A(R_addr[1]), .B(R_addr[2]), .Y(R_ptr[1]) );
  CLKXOR2X2M U9 ( .A(R_ptr[3]), .B(R_addr[2]), .Y(R_ptr[2]) );
  XNOR2X2M U10 ( .A(R_ptr[1]), .B(SYNC_W_ptr[1]), .Y(n7) );
  NAND4X2M U11 ( .A(n7), .B(n8), .C(n9), .D(n10), .Y(n6) );
  XNOR2X2M U12 ( .A(R_ptr[3]), .B(SYNC_W_ptr[3]), .Y(n9) );
  XNOR2X2M U13 ( .A(R_ptr[2]), .B(SYNC_W_ptr[2]), .Y(n10) );
  XNOR2X2M U14 ( .A(R_ptr[0]), .B(SYNC_W_ptr[0]), .Y(n8) );
  NOR2X2M U15 ( .A(n5), .B(n1), .Y(n4) );
  CLKXOR2X2M U16 ( .A(R_addr[1]), .B(n4), .Y(n13) );
  CLKXOR2X2M U17 ( .A(n1), .B(n5), .Y(n14) );
  XNOR2X2M U18 ( .A(R_addr[2]), .B(n3), .Y(n12) );
  XNOR2X2M U19 ( .A(R_ptr[3]), .B(n2), .Y(n11) );
  NAND2BX2M U20 ( .AN(n3), .B(R_addr[2]), .Y(n2) );
  NAND2X2M U21 ( .A(n4), .B(R_addr[1]), .Y(n3) );
  NAND2X2M U22 ( .A(R_inc), .B(n6), .Y(n5) );
endmodule


module DF_SYNC_0 ( ASYNC_data, clk, rst, SYNC_data );
  input [3:0] ASYNC_data;
  output [3:0] SYNC_data;
  input clk, rst;
  wire   n1, n2;
  wire   [3:0] stage1;

  DFFRQX2M stage2_reg_2_ ( .D(stage1[2]), .CK(clk), .RN(n1), .Q(SYNC_data[2])
         );
  DFFRQX2M stage2_reg_1_ ( .D(stage1[1]), .CK(clk), .RN(n1), .Q(SYNC_data[1])
         );
  DFFRQX2M stage2_reg_0_ ( .D(stage1[0]), .CK(clk), .RN(n1), .Q(SYNC_data[0])
         );
  DFFRQX2M stage2_reg_3_ ( .D(stage1[3]), .CK(clk), .RN(n1), .Q(SYNC_data[3])
         );
  DFFRQX2M stage1_reg_2_ ( .D(ASYNC_data[2]), .CK(clk), .RN(n1), .Q(stage1[2])
         );
  DFFRQX2M stage1_reg_1_ ( .D(ASYNC_data[1]), .CK(clk), .RN(n1), .Q(stage1[1])
         );
  DFFRQX2M stage1_reg_0_ ( .D(ASYNC_data[0]), .CK(clk), .RN(n1), .Q(stage1[0])
         );
  DFFRQX2M stage1_reg_3_ ( .D(ASYNC_data[3]), .CK(clk), .RN(n1), .Q(stage1[3])
         );
  INVX4M U3 ( .A(n2), .Y(n1) );
  INVX2M U4 ( .A(rst), .Y(n2) );
endmodule


module DF_SYNC_1 ( ASYNC_data, clk, rst, SYNC_data );
  input [3:0] ASYNC_data;
  output [3:0] SYNC_data;
  input clk, rst;
  wire   n1, n2;
  wire   [3:0] stage1;

  DFFRQX1M stage2_reg_3_ ( .D(stage1[3]), .CK(clk), .RN(n1), .Q(SYNC_data[3])
         );
  DFFRQX1M stage2_reg_2_ ( .D(stage1[2]), .CK(clk), .RN(n1), .Q(SYNC_data[2])
         );
  DFFRQX1M stage2_reg_1_ ( .D(stage1[1]), .CK(clk), .RN(n1), .Q(SYNC_data[1])
         );
  DFFRQX1M stage2_reg_0_ ( .D(stage1[0]), .CK(clk), .RN(n1), .Q(SYNC_data[0])
         );
  DFFRQX1M stage1_reg_2_ ( .D(ASYNC_data[2]), .CK(clk), .RN(n1), .Q(stage1[2])
         );
  DFFRQX1M stage1_reg_1_ ( .D(ASYNC_data[1]), .CK(clk), .RN(n1), .Q(stage1[1])
         );
  DFFRQX1M stage1_reg_0_ ( .D(ASYNC_data[0]), .CK(clk), .RN(n1), .Q(stage1[0])
         );
  DFFRQX1M stage1_reg_3_ ( .D(ASYNC_data[3]), .CK(clk), .RN(n1), .Q(stage1[3])
         );
  INVX4M U3 ( .A(n2), .Y(n1) );
  INVX2M U4 ( .A(rst), .Y(n2) );
endmodule


module ASYC_FIFO ( W_clk, W_rst, W_inc, R_clk, R_rst, R_inc, W_data, W_full, 
        R_empty, R_data );
  input [7:0] W_data;
  output [7:0] R_data;
  input W_clk, W_rst, W_inc, R_clk, R_rst, R_inc;
  output W_full, R_empty;
  wire   n1, n2, n3, n4;
  wire   [2:0] W_addr;
  wire   [2:0] R_addr;
  wire   [3:0] SYNC_R_ptr;
  wire   [3:0] W_ptr;
  wire   [3:0] SYNC_W_ptr;
  wire   [3:0] R_ptr;

  FIFO_MEM_CONTROL U0 ( .W_data(W_data), .W_inc(W_inc), .W_full(W_full), 
        .W_addr(W_addr), .R_addr(R_addr), .W_clk(W_clk), .R_data(R_data) );
  FIFO_WR U1 ( .W_inc(W_inc), .W_clk(W_clk), .W_rst(n3), .SYNC_R_ptr(
        SYNC_R_ptr), .W_ptr(W_ptr), .W_addr(W_addr), .W_full(W_full) );
  FIFO_RD U2 ( .R_inc(R_inc), .R_clk(R_clk), .R_rst(n1), .SYNC_W_ptr(
        SYNC_W_ptr), .R_ptr(R_ptr), .R_addr(R_addr), .R_empty(R_empty) );
  DF_SYNC_0 U3_FIFO_WR ( .ASYNC_data(R_ptr), .clk(W_clk), .rst(n3), 
        .SYNC_data(SYNC_R_ptr) );
  DF_SYNC_1 U4_FIFO_RD ( .ASYNC_data(W_ptr), .clk(R_clk), .rst(n1), 
        .SYNC_data(SYNC_W_ptr) );
  INVX2M U3 ( .A(n2), .Y(n1) );
  INVX2M U4 ( .A(R_rst), .Y(n2) );
  INVX2M U5 ( .A(n4), .Y(n3) );
  INVX2M U6 ( .A(W_rst), .Y(n4) );
endmodule


module FSM ( Data_valid, PAR_EN, ser_done, clk, rst, mux_sel, busy, ser_en );
  output [1:0] mux_sel;
  input Data_valid, PAR_EN, ser_done, clk, rst;
  output busy, ser_en;
  wire   n6, n7, n8, n9, n10, n11, n12, n1, n2, n3, n4, n5, n13;
  wire   [2:0] current_state;
  wire   [2:0] next_state;

  DFFRQX1M current_state_reg_2_ ( .D(next_state[2]), .CK(clk), .RN(n1), .Q(
        current_state[2]) );
  DFFRQX2M current_state_reg_0_ ( .D(next_state[0]), .CK(clk), .RN(n1), .Q(
        current_state[0]) );
  DFFRX4M current_state_reg_1_ ( .D(next_state[1]), .CK(clk), .RN(n1), .Q(
        current_state[1]), .QN(n4) );
  OAI211X2M U3 ( .A0(n12), .A1(n5), .B0(n9), .C0(n8), .Y(busy) );
  NAND2X2M U4 ( .A(current_state[1]), .B(n5), .Y(n8) );
  INVX2M U5 ( .A(current_state[2]), .Y(n5) );
  AOI21X2M U6 ( .A0(n13), .A1(ser_done), .B0(current_state[0]), .Y(n7) );
  BUFX2M U7 ( .A(rst), .Y(n1) );
  NAND2X2M U8 ( .A(n3), .B(n4), .Y(n12) );
  OAI31X2M U9 ( .A0(n13), .A1(n2), .A2(n6), .B0(n10), .Y(next_state[0]) );
  INVX2M U10 ( .A(ser_done), .Y(n2) );
  NAND3X2M U11 ( .A(n11), .B(n4), .C(Data_valid), .Y(n10) );
  INVX2M U12 ( .A(n6), .Y(ser_en) );
  AND2X2M U13 ( .A(n9), .B(n5), .Y(n11) );
  NOR2X2M U14 ( .A(n7), .B(n8), .Y(next_state[2]) );
  OAI21X2M U15 ( .A0(current_state[2]), .A1(current_state[0]), .B0(n12), .Y(
        mux_sel[0]) );
  OAI21X2M U16 ( .A0(n3), .A1(n8), .B0(n12), .Y(mux_sel[1]) );
  INVX2M U17 ( .A(current_state[0]), .Y(n3) );
  NAND2X2M U18 ( .A(current_state[0]), .B(n5), .Y(n9) );
  NAND2X2M U19 ( .A(current_state[1]), .B(n11), .Y(n6) );
  OAI2B2X1M U20 ( .A1N(n7), .A0(n8), .B0(current_state[1]), .B1(n9), .Y(
        next_state[1]) );
  INVX2M U21 ( .A(PAR_EN), .Y(n13) );
endmodule


module MUX ( mux_sel, ser_data, par_bit, TX_OUT );
  input [1:0] mux_sel;
  input ser_data, par_bit;
  output TX_OUT;
  wire   n1;

  OAI2BB1X2M U3 ( .A0N(ser_data), .A1N(mux_sel[0]), .B0(n1), .Y(TX_OUT) );
  OAI21X2M U4 ( .A0(mux_sel[0]), .A1(par_bit), .B0(mux_sel[1]), .Y(n1) );
endmodule


module Parity_Calculator ( P_data, PAR_type, Data_valid, clk, rst, par_bit );
  input [7:0] P_data;
  input PAR_type, Data_valid, clk, rst;
  output par_bit;
  wire   n1, n3, n4, n5, n6, n7, n2;

  DFFRQX1M par_bit_reg ( .D(n7), .CK(clk), .RN(rst), .Q(par_bit) );
  OAI2BB2X1M U2 ( .B0(n1), .B1(n2), .A0N(par_bit), .A1N(n2), .Y(n7) );
  XOR3XLM U3 ( .A(n3), .B(PAR_type), .C(n4), .Y(n1) );
  INVX2M U4 ( .A(Data_valid), .Y(n2) );
  XOR3XLM U5 ( .A(P_data[1]), .B(P_data[0]), .C(n5), .Y(n4) );
  XNOR2X2M U6 ( .A(P_data[3]), .B(P_data[2]), .Y(n5) );
  XOR3XLM U7 ( .A(P_data[5]), .B(P_data[4]), .C(n6), .Y(n3) );
  CLKXOR2X2M U8 ( .A(P_data[7]), .B(P_data[6]), .Y(n6) );
endmodule


module Serializer ( P_data, ser_en, clk, rst, ser_done, ser_data );
  input [7:0] P_data;
  input ser_en, clk, rst;
  output ser_done, ser_data;
  wire   n10, n11, n12, n13, n14, n15, n16, n17, n18, n19, n20, n21, n22, n23,
         n24, n25, n26, n1, n2, n3, n4, n5, n6, n7;
  wire   [2:0] counter;

  DFFRQX2M counter_reg_2_ ( .D(n24), .CK(clk), .RN(n1), .Q(counter[2]) );
  DFFRQX4M counter_reg_0_ ( .D(n26), .CK(clk), .RN(n1), .Q(counter[0]) );
  DFFRQX4M counter_reg_1_ ( .D(n25), .CK(clk), .RN(n1), .Q(counter[1]) );
  DFFRQX1M ser_data_reg ( .D(n23), .CK(clk), .RN(n1), .Q(ser_data) );
  NOR2X4M U3 ( .A(n7), .B(n4), .Y(n10) );
  BUFX2M U4 ( .A(rst), .Y(n1) );
  INVX2M U5 ( .A(n19), .Y(n4) );
  INVX2M U6 ( .A(ser_en), .Y(n7) );
  AOI21X2M U7 ( .A0(n2), .A1(n4), .B0(n10), .Y(n21) );
  NAND2X2M U8 ( .A(n22), .B(ser_en), .Y(n19) );
  OAI2BB2X1M U9 ( .B0(n21), .B1(n5), .A0N(n15), .A1N(n4), .Y(n25) );
  OAI32X2M U10 ( .A0(n19), .A1(n2), .A2(n5), .B0(n20), .B1(n6), .Y(n24) );
  AND2X2M U11 ( .A(n21), .B(n19), .Y(n20) );
  INVX2M U12 ( .A(n22), .Y(ser_done) );
  AOI222X2M U13 ( .A0(P_data[2]), .A1(n15), .B0(n17), .B1(P_data[1]), .C0(
        counter[1]), .C1(n18), .Y(n13) );
  NOR2X2M U14 ( .A(counter[1]), .B(counter[0]), .Y(n17) );
  AO22X1M U15 ( .A0(P_data[4]), .A1(counter[0]), .B0(P_data[3]), .B1(n2), .Y(
        n18) );
  AOI22X1M U16 ( .A0(P_data[5]), .A1(n5), .B0(P_data[7]), .B1(counter[1]), .Y(
        n16) );
  OAI2BB1X2M U17 ( .A0N(ser_data), .A1N(n10), .B0(n11), .Y(n23) );
  AOI22X1M U18 ( .A0(n4), .A1(n12), .B0(P_data[0]), .B1(n7), .Y(n11) );
  OAI22X1M U19 ( .A0(counter[2]), .A1(n13), .B0(n14), .B1(n6), .Y(n12) );
  AOI2BB2X2M U20 ( .B0(P_data[6]), .B1(n15), .A0N(counter[0]), .A1N(n16), .Y(
        n14) );
  NOR2X4M U21 ( .A(n2), .B(counter[1]), .Y(n15) );
  INVX4M U22 ( .A(counter[0]), .Y(n2) );
  OAI22X1M U23 ( .A0(n2), .A1(n3), .B0(counter[0]), .B1(n19), .Y(n26) );
  INVX2M U24 ( .A(n10), .Y(n3) );
  NAND3X2M U25 ( .A(counter[1]), .B(counter[0]), .C(counter[2]), .Y(n22) );
  INVX2M U26 ( .A(counter[1]), .Y(n5) );
  INVX2M U27 ( .A(counter[2]), .Y(n6) );
endmodule


module UART_TX_top ( P_data, Data_valid, PAR_EN, PAR_type, clk, rst, TX_OUT, 
        busy );
  input [7:0] P_data;
  input Data_valid, PAR_EN, PAR_type, clk, rst;
  output TX_OUT, busy;
  wire   ser_done, ser_en, ser_data, par_bit, n1, n3, n4, n5, n6, n7, n8, n9,
         n10, n2, n11, n12, n13;
  wire   [7:0] P_data_reg;
  wire   [1:0] mux_sel;

  FSM U1 ( .Data_valid(Data_valid), .PAR_EN(PAR_EN), .ser_done(ser_done), 
        .clk(clk), .rst(n11), .mux_sel(mux_sel), .busy(busy), .ser_en(ser_en)
         );
  MUX U2 ( .mux_sel(mux_sel), .ser_data(ser_data), .par_bit(par_bit), .TX_OUT(
        TX_OUT) );
  Parity_Calculator U3 ( .P_data(P_data_reg), .PAR_type(PAR_type), 
        .Data_valid(Data_valid), .clk(clk), .rst(n11), .par_bit(par_bit) );
  Serializer U4 ( .P_data(P_data_reg), .ser_en(ser_en), .clk(clk), .rst(n11), 
        .ser_done(ser_done), .ser_data(ser_data) );
  DFFRQX2M P_data_reg_reg_1_ ( .D(n3), .CK(clk), .RN(n11), .Q(P_data_reg[1])
         );
  DFFRQX2M P_data_reg_reg_0_ ( .D(n10), .CK(clk), .RN(n11), .Q(P_data_reg[0])
         );
  DFFRQX2M P_data_reg_reg_5_ ( .D(n7), .CK(clk), .RN(n11), .Q(P_data_reg[5])
         );
  DFFRQX2M P_data_reg_reg_7_ ( .D(n9), .CK(clk), .RN(n11), .Q(P_data_reg[7])
         );
  DFFRQX2M P_data_reg_reg_2_ ( .D(n4), .CK(clk), .RN(n11), .Q(P_data_reg[2])
         );
  DFFRQX2M P_data_reg_reg_6_ ( .D(n8), .CK(clk), .RN(n11), .Q(P_data_reg[6])
         );
  DFFRQX2M P_data_reg_reg_4_ ( .D(n6), .CK(clk), .RN(n11), .Q(P_data_reg[4])
         );
  DFFRQX2M P_data_reg_reg_3_ ( .D(n5), .CK(clk), .RN(n11), .Q(P_data_reg[3])
         );
  BUFX4M U6 ( .A(n1), .Y(n2) );
  INVX4M U7 ( .A(n2), .Y(n13) );
  NAND2BX2M U8 ( .AN(busy), .B(Data_valid), .Y(n1) );
  INVX6M U9 ( .A(n12), .Y(n11) );
  INVX2M U10 ( .A(rst), .Y(n12) );
  AO22X1M U11 ( .A0(P_data_reg[7]), .A1(n2), .B0(P_data[7]), .B1(n13), .Y(n9)
         );
  AO22X1M U12 ( .A0(P_data_reg[1]), .A1(n2), .B0(P_data[1]), .B1(n13), .Y(n3)
         );
  AO22X1M U13 ( .A0(P_data_reg[2]), .A1(n2), .B0(P_data[2]), .B1(n13), .Y(n4)
         );
  AO22X1M U14 ( .A0(P_data_reg[3]), .A1(n2), .B0(P_data[3]), .B1(n13), .Y(n5)
         );
  AO22X1M U15 ( .A0(P_data_reg[4]), .A1(n2), .B0(P_data[4]), .B1(n13), .Y(n6)
         );
  AO22X1M U16 ( .A0(P_data_reg[5]), .A1(n2), .B0(P_data[5]), .B1(n13), .Y(n7)
         );
  AO22X1M U17 ( .A0(P_data_reg[6]), .A1(n2), .B0(P_data[6]), .B1(n13), .Y(n8)
         );
  AO22X1M U18 ( .A0(P_data_reg[0]), .A1(n2), .B0(P_data[0]), .B1(n13), .Y(n10)
         );
endmodule


module FSM_RX ( RX_IN, PAR_EN, edge_count, bit_count, PAR_err, STOP_err, 
        START_err, prescale, clk, rst, data_valid, edge_bit_EN, data_sample_EN, 
        deser_EN, in_data_state, in_start_state, start_check_EN, 
        parity_check_EN, stop_check_EN );
  input [4:0] edge_count;
  input [3:0] bit_count;
  input [5:0] prescale;
  input RX_IN, PAR_EN, PAR_err, STOP_err, START_err, clk, rst;
  output data_valid, edge_bit_EN, data_sample_EN, deser_EN, in_data_state,
         in_start_state, start_check_EN, parity_check_EN, stop_check_EN;
  wire   N38, N39, N40, N41, N42, N43, N44, n23, n24, n25, n26, n27, n28, n29,
         n30, n31, n32, n33, n34, n35, n1, n3, n4, n5, n6, n7, n8, n9, n10,
         n11, n12, n13, n14, n15, n16, n17, n18, n19, n20, n21, n22, n36;
  wire   [2:0] current_state;
  wire   [2:0] next_state;

  NAND4BX4M U18 ( .AN(bit_count[3]), .B(bit_count[0]), .C(bit_count[2]), .D(
        bit_count[1]), .Y(n27) );
  OAI21BX8M U20 ( .A0(current_state[2]), .A1(RX_IN), .B0N(data_sample_EN), .Y(
        edge_bit_EN) );
  DFFRQX2M current_state_reg_0_ ( .D(next_state[0]), .CK(clk), .RN(n3), .Q(
        current_state[0]) );
  DFFRQX4M current_state_reg_2_ ( .D(next_state[2]), .CK(clk), .RN(n3), .Q(
        current_state[2]) );
  DFFRQX4M current_state_reg_1_ ( .D(next_state[1]), .CK(clk), .RN(n3), .Q(
        current_state[1]) );
  BUFX2M U3 ( .A(in_start_state), .Y(start_check_EN) );
  OR2X2M U4 ( .A(current_state[1]), .B(current_state[2]), .Y(n1) );
  INVX4M U5 ( .A(N44), .Y(n17) );
  NOR4X4M U6 ( .A(n16), .B(n15), .C(n14), .D(n13), .Y(N44) );
  OR2X2M U7 ( .A(n5), .B(prescale[3]), .Y(n6) );
  NAND2BX2M U8 ( .AN(prescale[1]), .B(n8), .Y(n4) );
  NOR2X2M U9 ( .A(n7), .B(prescale[5]), .Y(N43) );
  OR2X2M U10 ( .A(n6), .B(prescale[4]), .Y(n7) );
  NOR2X8M U11 ( .A(n20), .B(n1), .Y(in_start_state) );
  NOR2BX2M U12 ( .AN(n8), .B(edge_count[0]), .Y(n10) );
  NOR2BX2M U13 ( .AN(edge_count[0]), .B(n8), .Y(n9) );
  OR2X2M U14 ( .A(n4), .B(prescale[2]), .Y(n5) );
  OAI2BB1XLM U15 ( .A0N(n4), .A1N(prescale[2]), .B0(n5), .Y(N39) );
  NAND2BX1M U16 ( .AN(n29), .B(N44), .Y(n31) );
  OAI2BB1XLM U17 ( .A0N(n6), .A1N(prescale[4]), .B0(n7), .Y(N41) );
  OAI2BB1XLM U19 ( .A0N(n5), .A1N(prescale[3]), .B0(n6), .Y(N40) );
  NOR2X2M U21 ( .A(current_state[0]), .B(current_state[1]), .Y(n35) );
  NAND3X2M U22 ( .A(n20), .B(n22), .C(current_state[1]), .Y(n29) );
  BUFX2M U23 ( .A(rst), .Y(n3) );
  INVX2M U24 ( .A(n31), .Y(deser_EN) );
  INVX2M U25 ( .A(n29), .Y(in_data_state) );
  NOR2X2M U26 ( .A(n21), .B(n20), .Y(n24) );
  AND2X2M U27 ( .A(n24), .B(n22), .Y(parity_check_EN) );
  INVX2M U28 ( .A(prescale[0]), .Y(n8) );
  NOR4X1M U29 ( .A(STOP_err), .B(PAR_err), .C(n17), .D(n23), .Y(data_valid) );
  OAI31X2M U30 ( .A0(n17), .A1(current_state[2]), .A2(n25), .B0(n26), .Y(
        next_state[2]) );
  AOI31X2M U31 ( .A0(current_state[1]), .A1(n36), .A2(n18), .B0(n24), .Y(n25)
         );
  NAND4X1M U32 ( .A(current_state[2]), .B(n17), .C(n20), .D(n21), .Y(n26) );
  INVX2M U33 ( .A(n27), .Y(n18) );
  OAI31X2M U34 ( .A0(n36), .A1(n27), .A2(n31), .B0(n32), .Y(next_state[0]) );
  AOI31X1M U35 ( .A0(n17), .A1(n22), .A2(n33), .B0(n34), .Y(n32) );
  OAI21X2M U36 ( .A0(current_state[1]), .A1(RX_IN), .B0(n20), .Y(n33) );
  NOR4X1M U37 ( .A(current_state[1]), .B(current_state[0]), .C(RX_IN), .D(n17), 
        .Y(n34) );
  OAI21BX1M U38 ( .A0(n28), .A1(n29), .B0N(n30), .Y(next_state[1]) );
  NOR2X2M U39 ( .A(PAR_EN), .B(n27), .Y(n28) );
  OAI33X2M U40 ( .A0(n21), .A1(current_state[2]), .A2(N44), .B0(n19), .B1(
        START_err), .B2(n17), .Y(n30) );
  INVXLM U41 ( .A(in_start_state), .Y(n19) );
  INVX2M U42 ( .A(n23), .Y(stop_check_EN) );
  INVX4M U43 ( .A(current_state[0]), .Y(n20) );
  OAI21X6M U44 ( .A0(current_state[2]), .A1(n35), .B0(n23), .Y(data_sample_EN)
         );
  NAND2X2M U45 ( .A(current_state[2]), .B(n35), .Y(n23) );
  INVX2M U46 ( .A(current_state[2]), .Y(n22) );
  INVX2M U47 ( .A(current_state[1]), .Y(n21) );
  INVX2M U48 ( .A(PAR_EN), .Y(n36) );
  OAI2BB1X1M U49 ( .A0N(prescale[0]), .A1N(prescale[1]), .B0(n4), .Y(N38) );
  AO21XLM U50 ( .A0(n7), .A1(prescale[5]), .B0(N43), .Y(N42) );
  OAI2B2X1M U51 ( .A1N(N38), .A0(n9), .B0(edge_count[1]), .B1(n9), .Y(n12) );
  OAI2B2X1M U52 ( .A1N(edge_count[1]), .A0(n10), .B0(N38), .B1(n10), .Y(n11)
         );
  NAND4BBX1M U53 ( .AN(N43), .BN(N42), .C(n12), .D(n11), .Y(n16) );
  CLKXOR2X2M U54 ( .A(N41), .B(edge_count[4]), .Y(n15) );
  CLKXOR2X2M U55 ( .A(N39), .B(edge_count[2]), .Y(n14) );
  CLKXOR2X2M U56 ( .A(N40), .B(edge_count[3]), .Y(n13) );
endmodule


module Edge_Bit_Counter ( edge_bit_EN, in_data_state, in_start_state, prescale, 
        clk, rst, edge_count, bit_count );
  input [5:0] prescale;
  output [4:0] edge_count;
  output [3:0] bit_count;
  input edge_bit_EN, in_data_state, in_start_state, clk, rst;
  wire   n49, n50, n51, n52, n53, N8, N10, N11, N12, N13, N14, N15, N17, N18,
         N19, N20, N27, N41, N42, N43, N44, N45, n9, n14, n15, n16, n17, n18,
         n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n1, n2, n4, n6, n11,
         n12, n13, n29, n30, n31, n32, n33, n34, n35, n36, n37, n38, n39, n40,
         n41, n42, n43, n44, n45, n46, n47, n48;
  wire   [4:2] add_23_carry;

  DFFRQX2M bit_count_reg_1_ ( .D(n27), .CK(clk), .RN(n12), .Q(bit_count[1]) );
  DFFRQX4M bit_count_reg_0_ ( .D(n28), .CK(clk), .RN(n12), .Q(bit_count[0]) );
  DFFRQX2M bit_count_reg_2_ ( .D(n26), .CK(clk), .RN(n12), .Q(bit_count[2]) );
  DFFRQX1M edge_count_reg_0_ ( .D(N41), .CK(clk), .RN(n12), .Q(n53) );
  DFFRQX1M edge_count_reg_1_ ( .D(N42), .CK(clk), .RN(n12), .Q(n52) );
  DFFRX1M bit_count_reg_3_ ( .D(n44), .CK(clk), .RN(n12), .Q(bit_count[3]), 
        .QN(n9) );
  DFFRQX1M edge_count_reg_2_ ( .D(N43), .CK(clk), .RN(n12), .Q(n51) );
  DFFRQX1M edge_count_reg_3_ ( .D(N44), .CK(clk), .RN(n12), .Q(n50) );
  DFFRQX1M edge_count_reg_4_ ( .D(N45), .CK(clk), .RN(n12), .Q(n49) );
  AOI21BX2M U3 ( .A0(prescale[0]), .A1(prescale[1]), .B0N(n29), .Y(n1) );
  INVX2M U4 ( .A(prescale[0]), .Y(N8) );
  NOR4BX2M U5 ( .AN(n36), .B(N14), .C(N13), .D(n35), .Y(n37) );
  INVX6M U6 ( .A(n13), .Y(n12) );
  INVXLM U7 ( .A(n49), .Y(n2) );
  INVX6M U8 ( .A(n2), .Y(edge_count[4]) );
  INVXLM U9 ( .A(n50), .Y(n4) );
  INVX6M U10 ( .A(n4), .Y(edge_count[3]) );
  INVXLM U11 ( .A(n51), .Y(n6) );
  INVX6M U12 ( .A(n6), .Y(edge_count[2]) );
  BUFX10M U13 ( .A(n52), .Y(edge_count[1]) );
  NAND2BX2M U14 ( .AN(prescale[1]), .B(N8), .Y(n29) );
  OR2X2M U15 ( .A(n31), .B(prescale[4]), .Y(n32) );
  OR2X2M U16 ( .A(n30), .B(prescale[3]), .Y(n31) );
  NOR2X2M U17 ( .A(n32), .B(prescale[5]), .Y(N14) );
  INVX2M U18 ( .A(in_start_state), .Y(n48) );
  BUFX10M U19 ( .A(n53), .Y(edge_count[0]) );
  INVXLM U20 ( .A(edge_count[0]), .Y(N17) );
  NAND2X4M U21 ( .A(N15), .B(edge_bit_EN), .Y(n25) );
  NOR2BX1M U22 ( .AN(N18), .B(n25), .Y(N42) );
  NOR2BX1M U23 ( .AN(N19), .B(n25), .Y(N43) );
  NOR2BX1M U24 ( .AN(N20), .B(n25), .Y(N44) );
  NOR2X2M U25 ( .A(n41), .B(N8), .Y(n33) );
  OR2X2M U26 ( .A(n29), .B(prescale[2]), .Y(n30) );
  OAI2BB1XLM U27 ( .A0N(n29), .A1N(prescale[2]), .B0(n30), .Y(N10) );
  NAND4X2M U28 ( .A(n40), .B(n39), .C(n38), .D(n37), .Y(N15) );
  NOR2BX1M U29 ( .AN(N17), .B(n25), .Y(N41) );
  NOR2X1M U30 ( .A(n11), .B(n25), .Y(N45) );
  OAI2BB1XLM U31 ( .A0N(n31), .A1N(prescale[4]), .B0(n32), .Y(N12) );
  OAI2BB1XLM U32 ( .A0N(n30), .A1N(prescale[3]), .B0(n31), .Y(N11) );
  OAI21X2M U33 ( .A0(bit_count[0]), .A1(n20), .B0(n23), .Y(n22) );
  INVX2M U34 ( .A(bit_count[1]), .Y(n46) );
  INVX2M U35 ( .A(rst), .Y(n13) );
  NAND3X2M U36 ( .A(N27), .B(n48), .C(in_data_state), .Y(n24) );
  INVX2M U37 ( .A(n20), .Y(n43) );
  AND2X2M U38 ( .A(in_data_state), .B(N27), .Y(n17) );
  NAND2BX4M U39 ( .AN(n24), .B(edge_bit_EN), .Y(n20) );
  NAND3X2M U40 ( .A(n24), .B(n48), .C(edge_bit_EN), .Y(n23) );
  NOR2X2M U41 ( .A(n46), .B(n45), .Y(n18) );
  OAI32X2M U42 ( .A0(n19), .A1(n46), .A2(n20), .B0(n21), .B1(n47), .Y(n26) );
  NAND2X2M U43 ( .A(bit_count[0]), .B(n47), .Y(n19) );
  AOI21X2M U44 ( .A0(n43), .A1(n46), .B0(n22), .Y(n21) );
  INVX2M U45 ( .A(bit_count[2]), .Y(n47) );
  OAI32X2M U46 ( .A0(n20), .A1(bit_count[1]), .A2(n45), .B0(n42), .B1(n46), 
        .Y(n27) );
  INVX2M U47 ( .A(n22), .Y(n42) );
  CLKINVX1M U48 ( .A(edge_count[0]), .Y(n41) );
  OAI22X1M U49 ( .A0(n45), .A1(n23), .B0(bit_count[0]), .B1(n20), .Y(n28) );
  INVX2M U50 ( .A(n14), .Y(n44) );
  OAI2B11X2M U51 ( .A1N(n15), .A0(n16), .B0(edge_bit_EN), .C0(n48), .Y(n14) );
  NAND4X2M U52 ( .A(bit_count[2]), .B(n18), .C(n17), .D(n9), .Y(n15) );
  AOI31X2M U53 ( .A0(bit_count[2]), .A1(n17), .A2(n18), .B0(n9), .Y(n16) );
  XNOR2X2M U54 ( .A(add_23_carry[4]), .B(edge_count[4]), .Y(n11) );
  INVX2M U55 ( .A(bit_count[0]), .Y(n45) );
  ADDHX1M U56 ( .A(edge_count[1]), .B(edge_count[0]), .CO(add_23_carry[2]), 
        .S(N18) );
  ADDHX1M U57 ( .A(edge_count[2]), .B(add_23_carry[2]), .CO(add_23_carry[3]), 
        .S(N19) );
  ADDHX1M U58 ( .A(edge_count[3]), .B(add_23_carry[3]), .CO(add_23_carry[4]), 
        .S(N20) );
  AO21XLM U59 ( .A0(n32), .A1(prescale[5]), .B0(N14), .Y(N13) );
  XNOR2X1M U60 ( .A(N11), .B(edge_count[3]), .Y(n40) );
  XNOR2X1M U61 ( .A(N10), .B(edge_count[2]), .Y(n39) );
  XNOR2X1M U62 ( .A(N12), .B(edge_count[4]), .Y(n38) );
  OAI22X1M U63 ( .A0(edge_count[1]), .A1(n33), .B0(n33), .B1(n1), .Y(n36) );
  CLKNAND2X2M U64 ( .A(N8), .B(n41), .Y(n34) );
  AOI22X1M U65 ( .A0(n34), .A1(n1), .B0(n34), .B1(edge_count[1]), .Y(n35) );
  CLKINVX1M U66 ( .A(N15), .Y(N27) );
endmodule


module Data_Sampler ( RX_IN, prescale, edge_count, data_sample_EN, clk, rst, 
        sampled_bit );
  input [5:0] prescale;
  input [4:0] edge_count;
  input RX_IN, data_sample_EN, clk, rst;
  output sampled_bit;
  wire   N13, N14, N15, N17, N18, N19, N20, N21, N22, N23, N24, N25, N26, N27,
         N28, N29, N30, N31, N32, n21, n22, n23, n24, n26, n27, n28, n29, n30,
         n31, n32, n33, n34, n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12,
         n13, n14, n15, n16, n17, n18, n19, n20, n25, n35, n36, n37, n38, n39,
         n40, n41, n42, n43, n44, n45, n46, n47, n48, n49, n50, n51, n52, n53,
         n54, n55, n56, n57, n58, n59, n60, n61;
  wire   [1:0] counter;
  wire   [2:0] compare;
  wire   [4:2] add_22_carry;
  wire   [4:3] sub_20_carry;

  OAI2BB1X4M U3 ( .A0N(compare[0]), .A1N(compare[1]), .B0(n21), .Y(sampled_bit) );
  NOR3BX4M U16 ( .AN(data_sample_EN), .B(n1), .C(counter[1]), .Y(n23) );
  DFFRQX2M counter_reg_0_ ( .D(n34), .CK(clk), .RN(n7), .Q(counter[0]) );
  DFFRQX1M compare_reg_2_ ( .D(n32), .CK(clk), .RN(n7), .Q(compare[2]) );
  DFFRQX2M compare_reg_1_ ( .D(n31), .CK(clk), .RN(n7), .Q(compare[1]) );
  DFFRQX2M compare_reg_0_ ( .D(n30), .CK(clk), .RN(n7), .Q(compare[0]) );
  DFFRQX2M counter_reg_1_ ( .D(n33), .CK(clk), .RN(n7), .Q(counter[1]) );
  OR2X2M U4 ( .A(n4), .B(N17), .Y(n1) );
  OR2X2M U5 ( .A(N24), .B(N32), .Y(n2) );
  NOR2X2M U6 ( .A(prescale[5]), .B(sub_20_carry[4]), .Y(n3) );
  NOR2X1M U7 ( .A(N25), .B(n2), .Y(n4) );
  OR2X2M U8 ( .A(n5), .B(prescale[1]), .Y(n9) );
  NOR4X4M U9 ( .A(n19), .B(n18), .C(n17), .D(n16), .Y(N17) );
  NOR3X4M U10 ( .A(prescale[4]), .B(prescale[5]), .C(n10), .Y(N23) );
  NOR2BX2M U11 ( .AN(edge_count[0]), .B(N26), .Y(n50) );
  NOR2BX2M U12 ( .AN(edge_count[0]), .B(N18), .Y(n25) );
  NAND3BXLM U13 ( .AN(N23), .B(n36), .C(n35), .Y(n40) );
  NOR2BX2M U14 ( .AN(N18), .B(edge_count[0]), .Y(n20) );
  NOR2BX2M U15 ( .AN(prescale[1]), .B(edge_count[0]), .Y(n12) );
  NOR2BX2M U17 ( .AN(edge_count[0]), .B(prescale[1]), .Y(n13) );
  NOR2BX2M U18 ( .AN(edge_count[0]), .B(prescale[1]), .Y(n42) );
  NOR2BX2M U19 ( .AN(prescale[1]), .B(edge_count[0]), .Y(n41) );
  NOR2BX2M U20 ( .AN(N26), .B(edge_count[0]), .Y(n49) );
  XOR2X1M U21 ( .A(prescale[3]), .B(edge_count[2]), .Y(n48) );
  XOR2X1M U22 ( .A(prescale[4]), .B(edge_count[3]), .Y(n46) );
  OAI2BB1XLM U23 ( .A0N(n9), .A1N(prescale[3]), .B0(n10), .Y(N20) );
  XOR2X1M U24 ( .A(prescale[5]), .B(edge_count[4]), .Y(n45) );
  OR2X2M U25 ( .A(n9), .B(prescale[3]), .Y(n10) );
  NAND2XLM U26 ( .A(n58), .B(n60), .Y(n27) );
  AOI21X1M U27 ( .A0(n58), .A1(n59), .B0(n28), .Y(n29) );
  INVXLM U28 ( .A(n28), .Y(n57) );
  INVX4M U29 ( .A(n6), .Y(n5) );
  INVX2M U30 ( .A(prescale[2]), .Y(n6) );
  INVX4M U31 ( .A(n8), .Y(n7) );
  INVX2M U32 ( .A(rst), .Y(n8) );
  CLKINVX2M U33 ( .A(n1), .Y(n58) );
  OAI21X4M U34 ( .A0(n58), .A1(N17), .B0(data_sample_EN), .Y(n28) );
  INVX2M U35 ( .A(RX_IN), .Y(n61) );
  OAI32X2M U36 ( .A0(n27), .A1(n59), .A2(n28), .B0(n29), .B1(n60), .Y(n33) );
  INVX2M U37 ( .A(counter[1]), .Y(n60) );
  OAI32X2M U38 ( .A0(n28), .A1(counter[0]), .A2(n1), .B0(n57), .B1(n59), .Y(
        n34) );
  OAI2BB2X1M U39 ( .B0(n22), .B1(n61), .A0N(n22), .A1N(compare[0]), .Y(n30) );
  NAND2X2M U40 ( .A(n23), .B(n59), .Y(n22) );
  OAI2BB2X1M U41 ( .B0(n61), .B1(n26), .A0N(n26), .A1N(compare[2]), .Y(n32) );
  NAND4X2M U42 ( .A(counter[1]), .B(data_sample_EN), .C(n58), .D(n59), .Y(n26)
         );
  OAI2BB2X1M U43 ( .B0(n61), .B1(n24), .A0N(n24), .A1N(compare[1]), .Y(n31) );
  NAND2X1M U44 ( .A(counter[0]), .B(n23), .Y(n24) );
  OAI21X2M U45 ( .A0(compare[0]), .A1(compare[1]), .B0(compare[2]), .Y(n21) );
  INVX4M U46 ( .A(counter[0]), .Y(n59) );
  ADDHX1M U47 ( .A(prescale[4]), .B(add_22_carry[3]), .CO(add_22_carry[4]), 
        .S(N29) );
  ADDHX1M U48 ( .A(prescale[3]), .B(add_22_carry[2]), .CO(add_22_carry[3]), 
        .S(N28) );
  ADDHX2M U49 ( .A(n5), .B(prescale[1]), .CO(add_22_carry[2]), .S(N27) );
  ADDHX1M U50 ( .A(prescale[5]), .B(add_22_carry[4]), .CO(N31), .S(N30) );
  XNOR2X1M U51 ( .A(sub_20_carry[4]), .B(prescale[5]), .Y(N15) );
  OR2X1M U52 ( .A(prescale[4]), .B(sub_20_carry[3]), .Y(sub_20_carry[4]) );
  XNOR2X1M U53 ( .A(sub_20_carry[3]), .B(prescale[4]), .Y(N14) );
  OR2X1M U54 ( .A(prescale[3]), .B(n5), .Y(sub_20_carry[3]) );
  XNOR2X1M U55 ( .A(n5), .B(prescale[3]), .Y(N13) );
  CLKINVX1M U56 ( .A(prescale[1]), .Y(N18) );
  OAI2BB1X1M U57 ( .A0N(prescale[1]), .A1N(n5), .B0(n9), .Y(N19) );
  XNOR2X1M U58 ( .A(prescale[4]), .B(n10), .Y(N21) );
  OAI21X1M U59 ( .A0(prescale[4]), .A1(n10), .B0(prescale[5]), .Y(n11) );
  NAND2BX1M U60 ( .AN(N23), .B(n11), .Y(N22) );
  CLKINVX1M U61 ( .A(prescale[1]), .Y(N26) );
  OAI2B2X1M U62 ( .A1N(edge_count[1]), .A0(n12), .B0(n6), .B1(n12), .Y(n15) );
  OAI2B2X1M U63 ( .A1N(n6), .A0(n13), .B0(edge_count[1]), .B1(n13), .Y(n14) );
  NAND3BX1M U64 ( .AN(n3), .B(n15), .C(n14), .Y(n19) );
  CLKXOR2X2M U65 ( .A(N15), .B(edge_count[4]), .Y(n18) );
  CLKXOR2X2M U66 ( .A(N13), .B(edge_count[2]), .Y(n17) );
  CLKXOR2X2M U67 ( .A(N14), .B(edge_count[3]), .Y(n16) );
  OAI2B2X1M U68 ( .A1N(edge_count[1]), .A0(n20), .B0(N19), .B1(n20), .Y(n36)
         );
  OAI2B2X1M U69 ( .A1N(N19), .A0(n25), .B0(edge_count[1]), .B1(n25), .Y(n35)
         );
  CLKXOR2X2M U70 ( .A(N22), .B(edge_count[4]), .Y(n39) );
  CLKXOR2X2M U71 ( .A(N20), .B(edge_count[2]), .Y(n38) );
  CLKXOR2X2M U72 ( .A(N21), .B(edge_count[3]), .Y(n37) );
  NOR4X1M U73 ( .A(n40), .B(n39), .C(n38), .D(n37), .Y(N24) );
  OAI2B2X1M U74 ( .A1N(edge_count[1]), .A0(n41), .B0(n5), .B1(n41), .Y(n44) );
  OAI2B2X1M U75 ( .A1N(n5), .A0(n42), .B0(edge_count[1]), .B1(n42), .Y(n43) );
  CLKNAND2X2M U76 ( .A(n44), .B(n43), .Y(n47) );
  NOR4X1M U77 ( .A(n48), .B(n47), .C(n46), .D(n45), .Y(N25) );
  OAI2B2X1M U78 ( .A1N(edge_count[1]), .A0(n49), .B0(N27), .B1(n49), .Y(n52)
         );
  OAI2B2X1M U79 ( .A1N(N27), .A0(n50), .B0(edge_count[1]), .B1(n50), .Y(n51)
         );
  NAND3BX1M U80 ( .AN(N31), .B(n52), .C(n51), .Y(n56) );
  CLKXOR2X2M U81 ( .A(N30), .B(edge_count[4]), .Y(n55) );
  CLKXOR2X2M U82 ( .A(N28), .B(edge_count[2]), .Y(n54) );
  CLKXOR2X2M U83 ( .A(N29), .B(edge_count[3]), .Y(n53) );
  NOR4X1M U84 ( .A(n56), .B(n55), .C(n54), .D(n53), .Y(N32) );
endmodule


module Deserializer ( sampled_bit, deser_EN, in_start_state, clk, rst, P_DATA
 );
  output [7:0] P_DATA;
  input sampled_bit, deser_EN, in_start_state, clk, rst;
  wire   n8, n9, n10, n11, n12, n13, n14, n15, n16, n17, n18, n19, n20, n21,
         n22, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32, n33, n34, n35,
         n36, n37, n1, n2, n3, n4, n5, n6, n7, n38, n39;
  wire   [2:0] counter;

  DFFRQX2M counter_reg_1_ ( .D(n36), .CK(clk), .RN(n1), .Q(counter[1]) );
  DFFRQX2M P_DATA_reg_5_ ( .D(n32), .CK(clk), .RN(n1), .Q(P_DATA[5]) );
  DFFRQX2M P_DATA_reg_1_ ( .D(n28), .CK(clk), .RN(n1), .Q(P_DATA[1]) );
  DFFRQX2M P_DATA_reg_4_ ( .D(n31), .CK(clk), .RN(n1), .Q(P_DATA[4]) );
  DFFRQX2M P_DATA_reg_0_ ( .D(n27), .CK(clk), .RN(n1), .Q(P_DATA[0]) );
  DFFRQX2M P_DATA_reg_7_ ( .D(n34), .CK(clk), .RN(n1), .Q(P_DATA[7]) );
  DFFRQX2M P_DATA_reg_3_ ( .D(n30), .CK(clk), .RN(n1), .Q(P_DATA[3]) );
  DFFRQX2M P_DATA_reg_6_ ( .D(n33), .CK(clk), .RN(n1), .Q(P_DATA[6]) );
  DFFRQX2M P_DATA_reg_2_ ( .D(n29), .CK(clk), .RN(n1), .Q(P_DATA[2]) );
  DFFRQX2M counter_reg_0_ ( .D(n37), .CK(clk), .RN(n1), .Q(counter[0]) );
  DFFRQX1M counter_reg_2_ ( .D(n35), .CK(clk), .RN(n1), .Q(counter[2]) );
  CLKINVX1M U3 ( .A(in_start_state), .Y(n39) );
  NOR2X2M U4 ( .A(n7), .B(n25), .Y(n23) );
  NOR2X2M U5 ( .A(n25), .B(counter[2]), .Y(n17) );
  INVX6M U6 ( .A(n2), .Y(n1) );
  INVX2M U7 ( .A(rst), .Y(n2) );
  NAND2X4M U8 ( .A(deser_EN), .B(n39), .Y(n25) );
  INVX4M U9 ( .A(n23), .Y(n6) );
  NAND2X2M U10 ( .A(n39), .B(n25), .Y(n24) );
  OAI222X1M U11 ( .A0(n4), .A1(n6), .B0(n38), .B1(n15), .C0(n7), .C1(n24), .Y(
        n35) );
  INVX2M U12 ( .A(n15), .Y(n4) );
  NAND2X2M U13 ( .A(sampled_bit), .B(n17), .Y(n9) );
  NAND2X2M U14 ( .A(n23), .B(sampled_bit), .Y(n18) );
  INVX4M U15 ( .A(n17), .Y(n38) );
  OAI21X2M U16 ( .A0(n5), .A1(n24), .B0(n26), .Y(n36) );
  AO21XLM U17 ( .A0(n11), .A1(n13), .B0(n25), .Y(n26) );
  NAND2X2M U18 ( .A(n5), .B(n3), .Y(n8) );
  OAI21X2M U19 ( .A0(n15), .A1(n18), .B0(n22), .Y(n34) );
  OAI21X2M U20 ( .A0(n15), .A1(n6), .B0(P_DATA[7]), .Y(n22) );
  OAI21X2M U21 ( .A0(n9), .A1(n13), .B0(n14), .Y(n29) );
  OAI21X2M U22 ( .A0(n38), .A1(n13), .B0(P_DATA[2]), .Y(n14) );
  OAI21X2M U23 ( .A0(n13), .A1(n18), .B0(n21), .Y(n33) );
  OAI21X2M U24 ( .A0(n13), .A1(n6), .B0(P_DATA[6]), .Y(n21) );
  OAI21X2M U25 ( .A0(n8), .A1(n18), .B0(n19), .Y(n31) );
  OAI21X2M U26 ( .A0(n8), .A1(n6), .B0(P_DATA[4]), .Y(n19) );
  OAI21X2M U27 ( .A0(n9), .A1(n11), .B0(n12), .Y(n28) );
  OAI21X2M U28 ( .A0(n38), .A1(n11), .B0(P_DATA[1]), .Y(n12) );
  OAI21X2M U29 ( .A0(n9), .A1(n15), .B0(n16), .Y(n30) );
  OAI21X2M U30 ( .A0(n38), .A1(n15), .B0(P_DATA[3]), .Y(n16) );
  OAI21X2M U31 ( .A0(n8), .A1(n9), .B0(n10), .Y(n27) );
  OAI21X2M U32 ( .A0(n38), .A1(n8), .B0(P_DATA[0]), .Y(n10) );
  OAI21X2M U33 ( .A0(n11), .A1(n18), .B0(n20), .Y(n32) );
  OAI21X2M U34 ( .A0(n11), .A1(n6), .B0(P_DATA[5]), .Y(n20) );
  OAI22X1M U35 ( .A0(n3), .A1(n24), .B0(counter[0]), .B1(n25), .Y(n37) );
  NAND2X4M U36 ( .A(counter[1]), .B(counter[0]), .Y(n15) );
  NAND2X4M U37 ( .A(counter[0]), .B(n5), .Y(n11) );
  NAND2X4M U38 ( .A(counter[1]), .B(n3), .Y(n13) );
  INVX2M U39 ( .A(counter[0]), .Y(n3) );
  INVX2M U40 ( .A(counter[1]), .Y(n5) );
  INVX2M U41 ( .A(counter[2]), .Y(n7) );
endmodule


module Start_Checker ( sampled_bit, start_check_EN, in_start_state, prescale, 
        edge_count, clk, rst, START_err );
  input [5:0] prescale;
  input [4:0] edge_count;
  input sampled_bit, start_check_EN, in_start_state, clk, rst;
  output START_err;
  wire   N3, N4, N5, N6, N7, N8, N9, N10, n7, n8, n9, n10, n1, n2, n3, n4, n5,
         n6, n11, n12, n13, n14, n15, n16, n17, n18;

  DFFRQX1M START_err_reg ( .D(n17), .CK(clk), .RN(rst), .Q(START_err) );
  INVX2M U3 ( .A(prescale[0]), .Y(N3) );
  OR2X2M U4 ( .A(n2), .B(prescale[3]), .Y(n3) );
  OR2X2M U5 ( .A(n3), .B(prescale[4]), .Y(n4) );
  NAND2BX2M U6 ( .AN(prescale[1]), .B(N3), .Y(n1) );
  NOR2X2M U7 ( .A(n4), .B(prescale[5]), .Y(N9) );
  NOR2BX2M U8 ( .AN(edge_count[0]), .B(N3), .Y(n5) );
  OR2X2M U9 ( .A(n1), .B(prescale[2]), .Y(n2) );
  OAI2BB1XLM U10 ( .A0N(n1), .A1N(prescale[2]), .B0(n2), .Y(N5) );
  NOR2BX2M U11 ( .AN(N3), .B(edge_count[0]), .Y(n6) );
  OAI2BB1XLM U12 ( .A0N(n3), .A1N(prescale[4]), .B0(n4), .Y(N7) );
  OAI2BB1XLM U13 ( .A0N(n2), .A1N(prescale[3]), .B0(n3), .Y(N6) );
  INVX2M U14 ( .A(n7), .Y(n17) );
  AOI32X1M U15 ( .A0(n8), .A1(n9), .A2(sampled_bit), .B0(START_err), .B1(n18), 
        .Y(n7) );
  INVX2M U16 ( .A(n8), .Y(n18) );
  OAI2BB1X2M U17 ( .A0N(start_check_EN), .A1N(N10), .B0(n9), .Y(n8) );
  NAND4BBX2M U18 ( .AN(edge_count[1]), .BN(edge_count[0]), .C(in_start_state), 
        .D(n10), .Y(n9) );
  NOR3X2M U19 ( .A(edge_count[2]), .B(edge_count[4]), .C(edge_count[3]), .Y(
        n10) );
  OAI2BB1X1M U20 ( .A0N(prescale[0]), .A1N(prescale[1]), .B0(n1), .Y(N4) );
  AO21XLM U21 ( .A0(n4), .A1(prescale[5]), .B0(N9), .Y(N8) );
  OAI2B2X1M U22 ( .A1N(N4), .A0(n5), .B0(edge_count[1]), .B1(n5), .Y(n12) );
  OAI2B2X1M U23 ( .A1N(edge_count[1]), .A0(n6), .B0(N4), .B1(n6), .Y(n11) );
  NAND4BBX1M U24 ( .AN(N9), .BN(N8), .C(n12), .D(n11), .Y(n16) );
  CLKXOR2X2M U25 ( .A(N7), .B(edge_count[4]), .Y(n15) );
  CLKXOR2X2M U26 ( .A(N5), .B(edge_count[2]), .Y(n14) );
  CLKXOR2X2M U27 ( .A(N6), .B(edge_count[3]), .Y(n13) );
  NOR4X1M U28 ( .A(n16), .B(n15), .C(n14), .D(n13), .Y(N10) );
endmodule


module Parity_Checker ( sampled_bit, parity_check_EN, PAR_TYPE, P_DATA, 
        in_start_state, prescale, edge_count, clk, rst, PAR_err );
  input [7:0] P_DATA;
  input [5:0] prescale;
  input [4:0] edge_count;
  input sampled_bit, parity_check_EN, PAR_TYPE, in_start_state, clk, rst;
  output PAR_err;
  wire   N4, N5, N6, N7, N8, n7, n8, n9, n10, n11, n12, n13, n14, n15, n1, n2,
         n3, n4, n5, n6, n16, n17, n18, n19, n20, n21, n22;
  wire   [4:3] add_19_carry;

  DFFRQX4M PAR_err_reg ( .D(n15), .CK(clk), .RN(rst), .Q(PAR_err) );
  CLKXOR2X2M U3 ( .A(prescale[3]), .B(n2), .Y(N4) );
  CLKXOR2X2M U4 ( .A(prescale[4]), .B(add_19_carry[3]), .Y(N5) );
  CLKXOR2X2M U5 ( .A(prescale[5]), .B(add_19_carry[4]), .Y(N6) );
  AOI221X2M U6 ( .A0(N6), .A1(n20), .B0(N5), .B1(n19), .C0(n5), .Y(n6) );
  AOI221X2M U7 ( .A0(edge_count[3]), .A1(n22), .B0(edge_count[2]), .B1(n21), 
        .C0(n4), .Y(n5) );
  OAI31X2M U8 ( .A0(n7), .A1(in_start_state), .A2(n8), .B0(n9), .Y(n15) );
  AOI222X2M U9 ( .A0(N4), .A1(n18), .B0(n3), .B1(prescale[1]), .C0(n1), .C1(
        n17), .Y(n4) );
  INVX2M U10 ( .A(n2), .Y(n1) );
  BUFX2M U11 ( .A(prescale[2]), .Y(n2) );
  INVX2M U12 ( .A(N5), .Y(n22) );
  INVX2M U13 ( .A(N4), .Y(n21) );
  XOR3XLM U14 ( .A(n10), .B(n11), .C(n12), .Y(n7) );
  NAND2X2M U15 ( .A(PAR_err), .B(n8), .Y(n9) );
  AOI21X2M U16 ( .A0(parity_check_EN), .A1(N8), .B0(in_start_state), .Y(n8) );
  CLKINVX1M U17 ( .A(edge_count[1]), .Y(n17) );
  INVX2M U18 ( .A(edge_count[2]), .Y(n18) );
  INVX2M U19 ( .A(edge_count[4]), .Y(n20) );
  INVX2M U20 ( .A(edge_count[3]), .Y(n19) );
  XNOR2X2M U21 ( .A(sampled_bit), .B(PAR_TYPE), .Y(n12) );
  XOR3XLM U22 ( .A(P_DATA[5]), .B(P_DATA[4]), .C(n13), .Y(n11) );
  XNOR2X2M U23 ( .A(P_DATA[7]), .B(P_DATA[6]), .Y(n13) );
  XOR3XLM U24 ( .A(P_DATA[1]), .B(P_DATA[0]), .C(n14), .Y(n10) );
  XNOR2X2M U25 ( .A(P_DATA[3]), .B(P_DATA[2]), .Y(n14) );
  AND2X1M U26 ( .A(add_19_carry[4]), .B(prescale[5]), .Y(N7) );
  AND2X1M U27 ( .A(add_19_carry[3]), .B(prescale[4]), .Y(add_19_carry[4]) );
  AND2X1M U28 ( .A(n2), .B(prescale[3]), .Y(add_19_carry[3]) );
  AOI2BB1X1M U29 ( .A0N(n1), .A1N(n17), .B0(edge_count[0]), .Y(n3) );
  AOI2BB1X1M U30 ( .A0N(N6), .A1N(n20), .B0(n6), .Y(n16) );
  NOR2X1M U31 ( .A(N7), .B(n16), .Y(N8) );
endmodule


module Stop_Checker ( sampled_bit, stop_check_EN, in_start_state, prescale, 
        edge_count, clk, rst, STOP_err );
  input [5:0] prescale;
  input [4:0] edge_count;
  input sampled_bit, stop_check_EN, in_start_state, clk, rst;
  output STOP_err;
  wire   N4, N5, N6, N7, N8, n7, n8, n9, n1, n2, n3, n4, n5, n6, n10, n11, n12,
         n13, n14, n15, n16;
  wire   [4:3] add_17_carry;

  DFFRQX4M STOP_err_reg ( .D(n9), .CK(clk), .RN(rst), .Q(STOP_err) );
  CLKXOR2X2M U3 ( .A(prescale[3]), .B(n2), .Y(N4) );
  CLKXOR2X2M U4 ( .A(prescale[4]), .B(add_17_carry[3]), .Y(N5) );
  CLKXOR2X2M U5 ( .A(prescale[5]), .B(add_17_carry[4]), .Y(N6) );
  AOI221X2M U6 ( .A0(N6), .A1(n14), .B0(N5), .B1(n13), .C0(n5), .Y(n6) );
  AOI221X2M U7 ( .A0(edge_count[3]), .A1(n16), .B0(edge_count[2]), .B1(n15), 
        .C0(n4), .Y(n5) );
  AOI222X2M U8 ( .A0(N4), .A1(n12), .B0(n3), .B1(prescale[1]), .C0(n1), .C1(
        n11), .Y(n4) );
  INVX2M U9 ( .A(n2), .Y(n1) );
  BUFX2M U10 ( .A(prescale[2]), .Y(n2) );
  INVX2M U11 ( .A(N5), .Y(n16) );
  INVX2M U12 ( .A(N4), .Y(n15) );
  CLKINVX1M U13 ( .A(edge_count[1]), .Y(n11) );
  NOR2X1M U14 ( .A(in_start_state), .B(n7), .Y(n9) );
  AOI2BB2X2M U15 ( .B0(STOP_err), .B1(n8), .A0N(sampled_bit), .A1N(n8), .Y(n7)
         );
  NAND2X2M U16 ( .A(stop_check_EN), .B(N8), .Y(n8) );
  INVX2M U17 ( .A(edge_count[2]), .Y(n12) );
  INVX2M U18 ( .A(edge_count[4]), .Y(n14) );
  INVX2M U19 ( .A(edge_count[3]), .Y(n13) );
  AND2X1M U20 ( .A(add_17_carry[4]), .B(prescale[5]), .Y(N7) );
  AND2X1M U21 ( .A(add_17_carry[3]), .B(prescale[4]), .Y(add_17_carry[4]) );
  AND2X1M U22 ( .A(n2), .B(prescale[3]), .Y(add_17_carry[3]) );
  AOI2BB1X1M U23 ( .A0N(n1), .A1N(n11), .B0(edge_count[0]), .Y(n3) );
  AOI2BB1X1M U24 ( .A0N(N6), .A1N(n14), .B0(n6), .Y(n10) );
  NOR2X1M U25 ( .A(N7), .B(n10), .Y(N8) );
endmodule


module UART_RX_top ( RX_IN, prescale, PAR_EN, PAR_TYPE, clk, rst, PAR_err, 
        STOP_err, data_valid, P_DATA );
  input [5:0] prescale;
  output [7:0] P_DATA;
  input RX_IN, PAR_EN, PAR_TYPE, clk, rst;
  output PAR_err, STOP_err, data_valid;
  wire   START_err, edge_bit_EN, data_sample_EN, deser_EN, in_data_state,
         in_start_state, start_check_EN, parity_check_EN, stop_check_EN,
         sampled_bit, n1, n2, n3, n4;
  wire   [4:0] edge_count;
  wire   [3:0] bit_count;

  FSM_RX U0 ( .RX_IN(RX_IN), .PAR_EN(PAR_EN), .edge_count(edge_count), 
        .bit_count(bit_count), .PAR_err(PAR_err), .STOP_err(STOP_err), 
        .START_err(START_err), .prescale({prescale[5:3], n1, prescale[1:0]}), 
        .clk(clk), .rst(n3), .data_valid(data_valid), .edge_bit_EN(edge_bit_EN), .data_sample_EN(data_sample_EN), .deser_EN(deser_EN), .in_data_state(
        in_data_state), .in_start_state(in_start_state), .start_check_EN(
        start_check_EN), .parity_check_EN(parity_check_EN), .stop_check_EN(
        stop_check_EN) );
  Edge_Bit_Counter U1 ( .edge_bit_EN(edge_bit_EN), .in_data_state(
        in_data_state), .in_start_state(in_start_state), .prescale({
        prescale[5:3], n1, prescale[1:0]}), .clk(clk), .rst(n3), .edge_count(
        edge_count), .bit_count(bit_count) );
  Data_Sampler U2 ( .RX_IN(RX_IN), .prescale({prescale[5:3], n1, prescale[1:0]}), .edge_count(edge_count), .data_sample_EN(data_sample_EN), .clk(clk), .rst(
        n3), .sampled_bit(sampled_bit) );
  Deserializer U3 ( .sampled_bit(sampled_bit), .deser_EN(deser_EN), 
        .in_start_state(in_start_state), .clk(clk), .rst(n3), .P_DATA(P_DATA)
         );
  Start_Checker U4 ( .sampled_bit(sampled_bit), .start_check_EN(start_check_EN), .in_start_state(in_start_state), .prescale({prescale[5:3], n1, prescale[1:0]}), .edge_count(edge_count), .clk(clk), .rst(n3), .START_err(START_err) );
  Parity_Checker U5 ( .sampled_bit(sampled_bit), .parity_check_EN(
        parity_check_EN), .PAR_TYPE(PAR_TYPE), .P_DATA(P_DATA), 
        .in_start_state(in_start_state), .prescale({prescale[5:3], n1, 
        prescale[1:0]}), .edge_count(edge_count), .clk(clk), .rst(n3), 
        .PAR_err(PAR_err) );
  Stop_Checker U6 ( .sampled_bit(sampled_bit), .stop_check_EN(stop_check_EN), 
        .in_start_state(in_start_state), .prescale({prescale[5:3], n1, 
        prescale[1:0]}), .edge_count(edge_count), .clk(clk), .rst(n3), 
        .STOP_err(STOP_err) );
  INVX4M U7 ( .A(n4), .Y(n3) );
  INVX4M U8 ( .A(n2), .Y(n1) );
  INVX2M U9 ( .A(prescale[2]), .Y(n2) );
  INVX2M U10 ( .A(rst), .Y(n4) );
endmodule


module UART_TOP ( rst, PAR_EN, PAR_type, TX_P_data, TX_Data_valid, TX_CLK, 
        TX_OUT, TX_busy, RX_IN, prescale, RX_CLK, RX_data_valid, PAR_err, 
        STOP_err, RX_P_DATA );
  input [7:0] TX_P_data;
  input [5:0] prescale;
  output [7:0] RX_P_DATA;
  input rst, PAR_EN, PAR_type, TX_Data_valid, TX_CLK, RX_IN, RX_CLK;
  output TX_OUT, TX_busy, RX_data_valid, PAR_err, STOP_err;
  wire   n1, n2, n3;

  UART_TX_top TX_INST ( .P_data(TX_P_data), .Data_valid(TX_Data_valid), 
        .PAR_EN(PAR_EN), .PAR_type(PAR_type), .clk(TX_CLK), .rst(n2), .TX_OUT(
        TX_OUT), .busy(TX_busy) );
  UART_RX_top RX_INST ( .RX_IN(RX_IN), .prescale({prescale[5:3], n1, 
        prescale[1:0]}), .PAR_EN(PAR_EN), .PAR_TYPE(PAR_type), .clk(RX_CLK), 
        .rst(n2), .PAR_err(PAR_err), .STOP_err(STOP_err), .data_valid(
        RX_data_valid), .P_DATA(RX_P_DATA) );
  BUFX2M U1 ( .A(prescale[2]), .Y(n1) );
  INVX2M U2 ( .A(n3), .Y(n2) );
  INVX2M U3 ( .A(rst), .Y(n3) );
endmodule


module System_TOP ( REF_CLK, UART_CLK, RST, RX_IN, TX_OUT, PAR_err, STOP_err
 );
  input REF_CLK, UART_CLK, RST, RX_IN;
  output TX_OUT, PAR_err, STOP_err;
  wire   RST_Domain_1, RST_Domain_2, RX_CLK, TX_CLK, CLK_en, ALU_CLK, WR_en,
         RD_en, RD_Valid, ALU_Valid, RX_data_valid, RX_data_valid_synced, busy,
         R_inc, W_full, W_inc, R_empty, n1, n2, n3, n4, n5, n6, n7, n8,
         SYNOPSYS_UNCONNECTED_1, SYNOPSYS_UNCONNECTED_2,
         SYNOPSYS_UNCONNECTED_3, SYNOPSYS_UNCONNECTED_4;
  wire   [7:0] UART_CONFIG;
  wire   [7:0] RX_DIV_Ratio;
  wire   [7:0] TX_DIV_Ratio;
  wire   [3:0] address;
  wire   [7:0] WR_Data;
  wire   [7:0] RD_Data;
  wire   [7:0] OP_A;
  wire   [7:0] OP_B;
  wire   [3:0] ALU_FUNC;
  wire   [15:0] ALU_OUT;
  wire   [7:0] RX_P_DATA;
  wire   [7:0] RX_P_DATA_synced;
  wire   [7:0] WR_DATA_fifo;
  wire   [7:0] TX_P_data;

  Reset_SYNC_0 Domain_1_Reset ( .clk(REF_CLK), .rst(RST), .sync_rst(
        RST_Domain_1) );
  Reset_SYNC_1 Domain_2_Reset ( .clk(UART_CLK), .rst(RST), .sync_rst(
        RST_Domain_2) );
  Prescale_MUX Prescale_MUX ( .prescale({UART_CONFIG[7:5], n3, 
        UART_CONFIG[3:2]}), .Div_ratio({SYNOPSYS_UNCONNECTED_1, 
        SYNOPSYS_UNCONNECTED_2, SYNOPSYS_UNCONNECTED_3, SYNOPSYS_UNCONNECTED_4, 
        RX_DIV_Ratio[3:0]}) );
  Clock_Divider_0 RX_Clock_Divider ( .i_ref_clk(UART_CLK), .i_clk_en(1'b1), 
        .i_rst_n(n5), .i_div_ratio({1'b0, 1'b0, 1'b0, 1'b0, RX_DIV_Ratio[3:0]}), .o_div_clk(RX_CLK) );
  Clock_Divider_1 TX_Clock_Divider ( .i_ref_clk(UART_CLK), .i_clk_en(1'b1), 
        .i_rst_n(n5), .i_div_ratio(TX_DIV_Ratio), .o_div_clk(TX_CLK) );
  Clock_Gating Clock_Gating ( .CLK_en(CLK_en), .clk(REF_CLK), .Gated_CLK(
        ALU_CLK) );
  register_file Register_File ( .WR_Data(WR_Data), .address(address), .WR_en(
        WR_en), .RD_en(RD_en), .clk(REF_CLK), .rst(n7), .RD_Valid(RD_Valid), 
        .RD_Data(RD_Data), .REG0(OP_A), .REG1(OP_B), .REG2(UART_CONFIG), 
        .REG3(TX_DIV_Ratio) );
  alu_top ALU ( .a(OP_A), .b(OP_B), .alu_fun(ALU_FUNC), .clk(ALU_CLK), .rst(n7), .ALU_OUT(ALU_OUT), .ALU_Valid(ALU_Valid) );
  Data_Sync Data_Synchronizer ( .Unsync_bus(RX_P_DATA), .bus_enable(
        RX_data_valid), .clk(REF_CLK), .rst(n7), .sync_bus(RX_P_DATA_synced), 
        .enable_pulse(RX_data_valid_synced) );
  Pulse_Generator Pulse_Generator ( .bus_enable(busy), .clk(TX_CLK), .rst(n5), 
        .enable_pulse(R_inc) );
  System_Controller SYS_CTRL ( .clk(REF_CLK), .rst(n7), .P_data_sync(
        RX_P_DATA_synced), .data_valid_sync(RX_data_valid_synced), .RD_Data(
        RD_Data), .RD_Valid(RD_Valid), .WR_en(WR_en), .RD_en(RD_en), .ADDR(
        address), .WR_Data_regfile(WR_Data), .ALU_OUT(ALU_OUT), .ALU_Valid(
        ALU_Valid), .ALU_FUNC(ALU_FUNC), .CLK_en(CLK_en), .W_full(W_full), 
        .WR_DATA_fifo(WR_DATA_fifo), .W_inc(W_inc) );
  ASYC_FIFO TX_FIFO ( .W_clk(REF_CLK), .W_rst(n7), .W_inc(W_inc), .R_clk(
        TX_CLK), .R_rst(n5), .R_inc(R_inc), .W_data(WR_DATA_fifo), .W_full(
        W_full), .R_empty(R_empty), .R_data(TX_P_data) );
  UART_TOP UART ( .rst(n5), .PAR_EN(UART_CONFIG[0]), .PAR_type(UART_CONFIG[1]), 
        .TX_P_data(TX_P_data), .TX_Data_valid(n1), .TX_CLK(TX_CLK), .TX_OUT(
        TX_OUT), .TX_busy(busy), .RX_IN(n2), .prescale({UART_CONFIG[7:5], n3, 
        UART_CONFIG[3:2]}), .RX_CLK(RX_CLK), .RX_data_valid(RX_data_valid), 
        .PAR_err(PAR_err), .STOP_err(STOP_err), .RX_P_DATA(RX_P_DATA) );
  BUFX2M U3 ( .A(RX_IN), .Y(n2) );
  INVX4M U4 ( .A(n8), .Y(n7) );
  INVX4M U5 ( .A(n6), .Y(n5) );
  INVX2M U6 ( .A(n4), .Y(n3) );
  INVX2M U7 ( .A(UART_CONFIG[4]), .Y(n4) );
  INVX2M U8 ( .A(R_empty), .Y(n1) );
  INVX2M U9 ( .A(RST_Domain_1), .Y(n8) );
  INVX2M U10 ( .A(RST_Domain_2), .Y(n6) );
endmodule

