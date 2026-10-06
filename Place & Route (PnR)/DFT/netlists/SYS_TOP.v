/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : O-2018.06-SP1
// Date      : Tue Oct  6 23:23:15 2026
/////////////////////////////////////////////////////////////


module Reset_SYNC_test_0 ( clk, rst, sync_rst, test_si, test_se );
  input clk, rst, test_si, test_se;
  output sync_rst;
  wire   \memory[0] , n3;

  SDFFRQX2M \memory_reg[1]  ( .D(\memory[0] ), .SI(\memory[0] ), .SE(n3), .CK(
        clk), .RN(rst), .Q(sync_rst) );
  SDFFRQX2M \memory_reg[0]  ( .D(1'b1), .SI(test_si), .SE(n3), .CK(clk), .RN(
        rst), .Q(\memory[0] ) );
  DLY1X1M U5 ( .A(test_se), .Y(n3) );
endmodule


module Reset_SYNC_test_1 ( clk, rst, sync_rst, test_si, test_se );
  input clk, rst, test_si, test_se;
  output sync_rst;
  wire   \memory[0] , n7;

  SDFFRQX1M \memory_reg[1]  ( .D(\memory[0] ), .SI(\memory[0] ), .SE(n7), .CK(
        clk), .RN(rst), .Q(sync_rst) );
  SDFFRQX1M \memory_reg[0]  ( .D(1'b1), .SI(test_si), .SE(n7), .CK(clk), .RN(
        rst), .Q(\memory[0] ) );
  DLY1X1M U5 ( .A(test_se), .Y(n7) );
endmodule


module Prescale_MUX ( prescale, Div_ratio );
  input [5:0] prescale;
  output [7:0] Div_ratio;
  wire   n5, n6, n7, n8, n9, n14, n15, n16, n17;

  NOR3X12M U6 ( .A(n7), .B(prescale[1]), .C(prescale[0]), .Y(Div_ratio[1]) );
  NOR4X2M U12 ( .A(prescale[5]), .B(prescale[4]), .C(prescale[3]), .D(n14), 
        .Y(n8) );
  INVX2M U13 ( .A(prescale[2]), .Y(n14) );
  NAND4BX2M U14 ( .AN(prescale[3]), .B(prescale[4]), .C(n14), .D(n15), .Y(n7)
         );
  NAND4BX2M U15 ( .AN(prescale[4]), .B(prescale[3]), .C(n14), .D(n15), .Y(n6)
         );
  OAI211X4M U16 ( .A0(n8), .A1(n9), .B0(n17), .C0(n16), .Y(Div_ratio[0]) );
  NAND2X2M U17 ( .A(n7), .B(n6), .Y(n9) );
  CLKINVX1M U18 ( .A(prescale[5]), .Y(n15) );
  NOR3X8M U19 ( .A(n6), .B(prescale[1]), .C(prescale[0]), .Y(Div_ratio[2]) );
  CLKINVX1M U20 ( .A(prescale[1]), .Y(n16) );
  INVX2M U21 ( .A(prescale[0]), .Y(n17) );
  NOR4X6M U22 ( .A(n5), .B(prescale[3]), .C(prescale[5]), .D(prescale[4]), .Y(
        Div_ratio[3]) );
  NAND3X2M U23 ( .A(n17), .B(n16), .C(prescale[2]), .Y(n5) );
  INVX2M U3 ( .A(1'b1), .Y(Div_ratio[7]) );
  INVX2M U5 ( .A(1'b1), .Y(Div_ratio[6]) );
  INVX2M U8 ( .A(1'b1), .Y(Div_ratio[5]) );
  INVX2M U10 ( .A(1'b1), .Y(Div_ratio[4]) );
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


module Clock_Divider_test_0 ( i_ref_clk, i_clk_en, i_rst_n, i_div_ratio, 
        o_div_clk, test_si, test_so, test_se );
  input [7:0] i_div_ratio;
  input i_ref_clk, i_clk_en, i_rst_n, test_si, test_se;
  output o_div_clk, test_so;
  wire   clk_div_reg, N7, N8, N9, N10, N11, N12, N13, N14, N17, N18, N19, N20,
         N21, N22, N23, N24, N26, N27, N28, N29, N30, N31, N32, N33, N45, N46,
         N47, N48, N49, N50, N51, N52, n18, n19, n20, n21, n22, n23, n1, n2,
         n3, n4, n17, n24, n25, n26, n27, n28, n29, n30, n31, n32, n33, n34,
         n35, n36, n37, n38, n39, n40, n41, n42, n43, n44, n45, n46, n47, n48,
         n49, n50, n51, n52, n53, n54, n55, n56, n57, n58, n59, n60, n61, n62,
         n63, n64, n65, n68, n69, n70, n71, n72, n73, n74, n75;
  wire   [7:0] counter;
  assign test_so = counter[7];

  SDFFRQX2M \counter_reg[7]  ( .D(N52), .SI(counter[6]), .SE(n71), .CK(
        i_ref_clk), .RN(n26), .Q(counter[7]) );
  SDFFRQX2M \counter_reg[2]  ( .D(N47), .SI(counter[1]), .SE(n70), .CK(
        i_ref_clk), .RN(n26), .Q(counter[2]) );
  SDFFRQX2M \counter_reg[6]  ( .D(N51), .SI(counter[5]), .SE(n69), .CK(
        i_ref_clk), .RN(n26), .Q(counter[6]) );
  SDFFRQX2M \counter_reg[5]  ( .D(N50), .SI(counter[4]), .SE(n71), .CK(
        i_ref_clk), .RN(n26), .Q(counter[5]) );
  SDFFRQX2M \counter_reg[4]  ( .D(N49), .SI(counter[3]), .SE(n75), .CK(
        i_ref_clk), .RN(n26), .Q(counter[4]) );
  SDFFRQX2M \counter_reg[3]  ( .D(N48), .SI(counter[2]), .SE(n74), .CK(
        i_ref_clk), .RN(n26), .Q(counter[3]) );
  SDFFRQX2M clk_div_reg_reg ( .D(n23), .SI(test_si), .SE(n73), .CK(i_ref_clk), 
        .RN(n26), .Q(clk_div_reg) );
  INVX2M U7 ( .A(n3), .Y(n4) );
  INVX2M U8 ( .A(counter[0]), .Y(n3) );
  INVXLM U9 ( .A(counter[1]), .Y(n1) );
  INVX4M U12 ( .A(n1), .Y(n2) );
  BUFX2M U19 ( .A(n29), .Y(n17) );
  BUFX2M U20 ( .A(n35), .Y(n24) );
  OAI2BB1XLM U21 ( .A0N(i_div_ratio[1]), .A1N(i_div_ratio[2]), .B0(n24), .Y(
        N26) );
  NOR3X2M U22 ( .A(n55), .B(N32), .C(counter[7]), .Y(n61) );
  NOR3X4M U23 ( .A(i_div_ratio[6]), .B(i_div_ratio[7]), .C(n38), .Y(N32) );
  NOR2X4M U24 ( .A(n30), .B(i_div_ratio[4]), .Y(n31) );
  OR2X2M U25 ( .A(n17), .B(i_div_ratio[3]), .Y(n30) );
  OR2X2M U26 ( .A(n24), .B(i_div_ratio[3]), .Y(n36) );
  OAI2BB1XLM U27 ( .A0N(n24), .A1N(i_div_ratio[3]), .B0(n36), .Y(N27) );
  OR2X2M U28 ( .A(n37), .B(i_div_ratio[5]), .Y(n38) );
  OR2X2M U29 ( .A(n36), .B(i_div_ratio[4]), .Y(n37) );
  OAI2BB1XLM U30 ( .A0N(n37), .A1N(i_div_ratio[5]), .B0(n38), .Y(N29) );
  OAI2BB1XLM U31 ( .A0N(n17), .A1N(i_div_ratio[3]), .B0(n30), .Y(N10) );
  OAI2BB1XLM U32 ( .A0N(n36), .A1N(i_div_ratio[4]), .B0(n37), .Y(N28) );
  NOR2BX2M U33 ( .AN(N7), .B(n4), .Y(n42) );
  NOR2BX2M U34 ( .AN(n4), .B(N7), .Y(n41) );
  OAI2BB1XLM U35 ( .A0N(n28), .A1N(i_div_ratio[2]), .B0(n17), .Y(N9) );
  NOR2X2M U36 ( .A(n3), .B(n40), .Y(n53) );
  OR2X2M U37 ( .A(i_div_ratio[1]), .B(i_div_ratio[0]), .Y(n28) );
  NAND2X4M U38 ( .A(n65), .B(n25), .Y(n20) );
  INVX2M U39 ( .A(n19), .Y(n65) );
  OR2X2M U40 ( .A(n52), .B(n51), .Y(n25) );
  NOR2BX2M U41 ( .AN(N18), .B(n20), .Y(N46) );
  NOR2BX2M U42 ( .AN(N19), .B(n20), .Y(N47) );
  NOR2BX2M U43 ( .AN(N20), .B(n20), .Y(N48) );
  NOR2BX2M U44 ( .AN(N21), .B(n20), .Y(N49) );
  NOR2BX2M U45 ( .AN(N22), .B(n20), .Y(N50) );
  NOR2BX2M U46 ( .AN(N23), .B(n20), .Y(N51) );
  INVX2M U47 ( .A(i_div_ratio[1]), .Y(n40) );
  INVX2M U48 ( .A(N26), .Y(n64) );
  INVX6M U49 ( .A(n27), .Y(n26) );
  INVX2M U50 ( .A(i_rst_n), .Y(n27) );
  NOR2BX2M U51 ( .AN(N24), .B(n20), .Y(N52) );
  NOR2BX2M U52 ( .AN(N17), .B(n20), .Y(N45) );
  AOI21X2M U53 ( .A0(n25), .A1(n18), .B0(n19), .Y(n23) );
  NAND2BX2M U54 ( .AN(N33), .B(clk_div_reg), .Y(n18) );
  OAI2BB1X2M U55 ( .A0N(n21), .A1N(n22), .B0(i_clk_en), .Y(n19) );
  NOR4X2M U56 ( .A(i_div_ratio[7]), .B(i_div_ratio[6]), .C(i_div_ratio[5]), 
        .D(i_div_ratio[4]), .Y(n22) );
  NOR3X2M U57 ( .A(i_div_ratio[1]), .B(i_div_ratio[3]), .C(i_div_ratio[2]), 
        .Y(n21) );
  INVX2M U58 ( .A(i_div_ratio[5]), .Y(n34) );
  MX2XLM U59 ( .A(i_ref_clk), .B(clk_div_reg), .S0(n65), .Y(o_div_clk) );
  CLKINVX1M U60 ( .A(i_div_ratio[0]), .Y(N7) );
  OAI2BB1X1M U61 ( .A0N(i_div_ratio[0]), .A1N(i_div_ratio[1]), .B0(n28), .Y(N8) );
  OR2X1M U62 ( .A(n28), .B(i_div_ratio[2]), .Y(n29) );
  AO21XLM U63 ( .A0(n30), .A1(i_div_ratio[4]), .B0(n31), .Y(N11) );
  CLKNAND2X2M U64 ( .A(n31), .B(n34), .Y(n32) );
  OAI21X1M U65 ( .A0(n31), .A1(n34), .B0(n32), .Y(N12) );
  XNOR2X1M U66 ( .A(i_div_ratio[6]), .B(n32), .Y(N13) );
  NOR2X1M U67 ( .A(i_div_ratio[6]), .B(n32), .Y(n33) );
  CLKXOR2X2M U68 ( .A(i_div_ratio[7]), .B(n33), .Y(N14) );
  NAND2BX1M U69 ( .AN(i_div_ratio[2]), .B(n40), .Y(n35) );
  XNOR2X1M U70 ( .A(i_div_ratio[6]), .B(n38), .Y(N30) );
  OAI21X1M U71 ( .A0(i_div_ratio[6]), .A1(n38), .B0(i_div_ratio[7]), .Y(n39)
         );
  NAND2BX1M U72 ( .AN(N32), .B(n39), .Y(N31) );
  XNOR2X1M U73 ( .A(N9), .B(counter[2]), .Y(n46) );
  XNOR2X1M U74 ( .A(N14), .B(counter[7]), .Y(n45) );
  OAI2B2X1M U75 ( .A1N(N8), .A0(n41), .B0(n2), .B1(n41), .Y(n44) );
  OAI2B2X1M U76 ( .A1N(n2), .A0(n42), .B0(N8), .B1(n42), .Y(n43) );
  NAND4X1M U77 ( .A(n46), .B(n45), .C(n44), .D(n43), .Y(n52) );
  XNOR2X1M U78 ( .A(N13), .B(counter[6]), .Y(n50) );
  XNOR2X1M U79 ( .A(N12), .B(counter[5]), .Y(n49) );
  XNOR2X1M U80 ( .A(N11), .B(counter[4]), .Y(n48) );
  XNOR2X1M U81 ( .A(N10), .B(counter[3]), .Y(n47) );
  NAND4X1M U82 ( .A(n50), .B(n49), .C(n48), .D(n47), .Y(n51) );
  XNOR2X1M U83 ( .A(N27), .B(counter[2]), .Y(n63) );
  OAI22X1M U84 ( .A0(n2), .A1(n53), .B0(n53), .B1(n64), .Y(n62) );
  CLKNAND2X2M U85 ( .A(n40), .B(n3), .Y(n54) );
  AOI22X1M U86 ( .A0(n54), .A1(n64), .B0(n54), .B1(n2), .Y(n55) );
  CLKXOR2X2M U87 ( .A(N28), .B(counter[3]), .Y(n59) );
  CLKXOR2X2M U88 ( .A(N29), .B(counter[4]), .Y(n58) );
  CLKXOR2X2M U89 ( .A(N30), .B(counter[5]), .Y(n57) );
  CLKXOR2X2M U90 ( .A(N31), .B(counter[6]), .Y(n56) );
  NOR4X1M U91 ( .A(n59), .B(n58), .C(n57), .D(n56), .Y(n60) );
  AND4X1M U92 ( .A(n63), .B(n62), .C(n61), .D(n60), .Y(N33) );
  DLY1X1M U93 ( .A(n72), .Y(n68) );
  DLY1X1M U94 ( .A(n74), .Y(n69) );
  DLY1X1M U95 ( .A(n75), .Y(n70) );
  DLY1X1M U96 ( .A(n73), .Y(n71) );
  DLY1X1M U97 ( .A(test_se), .Y(n72) );
  DLY1X1M U98 ( .A(n72), .Y(n73) );
  DLY1X1M U99 ( .A(n68), .Y(n74) );
  DLY1X1M U100 ( .A(n68), .Y(n75) );
  Clock_Divider_0_DW01_inc_0 add_24 ( .A({counter[7:2], n2, n4}), .SUM({N24, 
        N23, N22, N21, N20, N19, N18, N17}) );
  SDFFRQX2M \counter_reg[1]  ( .D(N46), .SI(counter[0]), .SE(n69), .CK(
        i_ref_clk), .RN(n26), .Q(counter[1]) );
  SDFFRQX2M \counter_reg[0]  ( .D(N45), .SI(clk_div_reg), .SE(n70), .CK(
        i_ref_clk), .RN(n26), .Q(counter[0]) );
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


module Clock_Divider_test_1 ( i_ref_clk, i_clk_en, i_rst_n, i_div_ratio, 
        o_div_clk, test_si, test_so, test_se );
  input [7:0] i_div_ratio;
  input i_ref_clk, i_clk_en, i_rst_n, test_si, test_se;
  output o_div_clk, test_so;
  wire   clk_div_reg, N7, N8, N9, N10, N11, N12, N13, N14, N17, N18, N19, N20,
         N21, N22, N23, N24, N25, N27, N28, N29, N30, N31, N32, N33, N45, N46,
         N47, N48, N49, N50, N51, N52, n1, n2, n3, n4, n5, n6, n16, n17, n24,
         n25, n26, n27, n28, n29, n30, n31, n32, n33, n34, n35, n36, n37, n38,
         n39, n40, n41, n42, n43, n44, n45, n46, n47, n48, n49, n50, n51, n52,
         n53, n54, n55, n56, n57, n58, n59, n60, n61, n62, n74, n75, n76, n77,
         n78, n79, n80, n81, n82;
  wire   [7:0] counter;
  assign test_so = counter[7];

  SDFFRQX1M clk_div_reg_reg ( .D(n57), .SI(test_si), .SE(n77), .CK(i_ref_clk), 
        .RN(n3), .Q(clk_div_reg) );
  SDFFRQX2M \counter_reg[7]  ( .D(N52), .SI(counter[6]), .SE(n77), .CK(
        i_ref_clk), .RN(n3), .Q(counter[7]) );
  SDFFRQX2M \counter_reg[2]  ( .D(N47), .SI(counter[1]), .SE(n76), .CK(
        i_ref_clk), .RN(n3), .Q(counter[2]) );
  SDFFRQX2M \counter_reg[6]  ( .D(N51), .SI(counter[5]), .SE(n75), .CK(
        i_ref_clk), .RN(n3), .Q(counter[6]) );
  SDFFRQX2M \counter_reg[5]  ( .D(N50), .SI(counter[4]), .SE(n81), .CK(
        i_ref_clk), .RN(n3), .Q(counter[5]) );
  SDFFRQX2M \counter_reg[4]  ( .D(N49), .SI(counter[3]), .SE(n76), .CK(
        i_ref_clk), .RN(n3), .Q(counter[4]) );
  SDFFRQX2M \counter_reg[3]  ( .D(N48), .SI(counter[2]), .SE(n75), .CK(
        i_ref_clk), .RN(n3), .Q(counter[3]) );
  SDFFRQX4M \counter_reg[0]  ( .D(N45), .SI(n82), .SE(n80), .CK(i_ref_clk), 
        .RN(n3), .Q(counter[0]) );
  SDFFRQX4M \counter_reg[1]  ( .D(N46), .SI(counter[0]), .SE(n79), .CK(
        i_ref_clk), .RN(n3), .Q(counter[1]) );
  NOR2X4M U12 ( .A(n16), .B(i_div_ratio[4]), .Y(n17) );
  NOR4X1M U16 ( .A(i_div_ratio[7]), .B(i_div_ratio[6]), .C(i_div_ratio[5]), 
        .D(i_div_ratio[4]), .Y(n58) );
  NOR3X2M U17 ( .A(n46), .B(N32), .C(counter[7]), .Y(n52) );
  NOR2X2M U18 ( .A(n55), .B(N25), .Y(n44) );
  OR2X2M U19 ( .A(n6), .B(i_div_ratio[3]), .Y(n16) );
  OR2X2M U20 ( .A(n5), .B(i_div_ratio[2]), .Y(n6) );
  OR2X2M U21 ( .A(n29), .B(i_div_ratio[5]), .Y(n30) );
  OR2X2M U22 ( .A(n27), .B(i_div_ratio[3]), .Y(n28) );
  OR2X2M U23 ( .A(n28), .B(i_div_ratio[4]), .Y(n29) );
  OAI2BB1XLM U24 ( .A0N(n29), .A1N(i_div_ratio[5]), .B0(n30), .Y(N29) );
  OAI2BB1XLM U25 ( .A0N(n5), .A1N(i_div_ratio[2]), .B0(n6), .Y(N9) );
  OAI2BB1XLM U26 ( .A0N(n6), .A1N(i_div_ratio[3]), .B0(n16), .Y(N10) );
  OAI2BB1XLM U27 ( .A0N(n28), .A1N(i_div_ratio[4]), .B0(n29), .Y(N28) );
  NOR2BX2M U28 ( .AN(N7), .B(counter[0]), .Y(n33) );
  NOR2BX2M U29 ( .AN(counter[0]), .B(N7), .Y(n32) );
  OAI2BB1XLM U30 ( .A0N(n27), .A1N(i_div_ratio[3]), .B0(n28), .Y(N27) );
  NAND2X4M U31 ( .A(n56), .B(n2), .Y(n60) );
  INVX2M U32 ( .A(n61), .Y(n56) );
  OR2X2M U33 ( .A(n43), .B(n42), .Y(n2) );
  NOR2BX2M U34 ( .AN(N18), .B(n60), .Y(N46) );
  NOR2BX2M U35 ( .AN(N19), .B(n60), .Y(N47) );
  NOR2BX2M U36 ( .AN(N20), .B(n60), .Y(N48) );
  NOR2BX2M U37 ( .AN(N21), .B(n60), .Y(N49) );
  NOR2BX2M U38 ( .AN(N22), .B(n60), .Y(N50) );
  NOR2BX2M U39 ( .AN(N23), .B(n60), .Y(N51) );
  INVX6M U40 ( .A(n4), .Y(n3) );
  INVX2M U41 ( .A(i_rst_n), .Y(n4) );
  OR2X2M U42 ( .A(i_div_ratio[1]), .B(i_div_ratio[0]), .Y(n5) );
  NOR2BX2M U43 ( .AN(N24), .B(n60), .Y(N52) );
  NOR2BX2M U44 ( .AN(N17), .B(n60), .Y(N45) );
  AOI21X2M U45 ( .A0(n2), .A1(n62), .B0(n61), .Y(n57) );
  NAND2BX2M U46 ( .AN(N33), .B(clk_div_reg), .Y(n62) );
  OR2X2M U47 ( .A(i_div_ratio[2]), .B(i_div_ratio[1]), .Y(n27) );
  INVX2M U48 ( .A(i_div_ratio[5]), .Y(n26) );
  INVX2M U49 ( .A(counter[0]), .Y(n55) );
  OAI2BB1X2M U50 ( .A0N(n59), .A1N(n58), .B0(i_clk_en), .Y(n61) );
  MX2XLM U51 ( .A(i_ref_clk), .B(n82), .S0(n56), .Y(o_div_clk) );
  CLKINVX1M U52 ( .A(i_div_ratio[0]), .Y(N7) );
  OAI2BB1X1M U53 ( .A0N(i_div_ratio[0]), .A1N(i_div_ratio[1]), .B0(n5), .Y(N8)
         );
  AO21XLM U54 ( .A0(n16), .A1(i_div_ratio[4]), .B0(n17), .Y(N11) );
  CLKNAND2X2M U55 ( .A(n17), .B(n26), .Y(n24) );
  OAI21X1M U56 ( .A0(n17), .A1(n26), .B0(n24), .Y(N12) );
  XNOR2X1M U57 ( .A(i_div_ratio[6]), .B(n24), .Y(N13) );
  NOR2X1M U58 ( .A(i_div_ratio[6]), .B(n24), .Y(n25) );
  CLKINVX1M U60 ( .A(i_div_ratio[1]), .Y(N25) );
  XNOR2X1M U61 ( .A(i_div_ratio[6]), .B(n30), .Y(N30) );
  OAI21X1M U62 ( .A0(i_div_ratio[6]), .A1(n30), .B0(i_div_ratio[7]), .Y(n31)
         );
  NAND2BX1M U63 ( .AN(N32), .B(n31), .Y(N31) );
  XNOR2X1M U64 ( .A(N9), .B(counter[2]), .Y(n37) );
  XNOR2X1M U65 ( .A(N14), .B(counter[7]), .Y(n36) );
  OAI2B2X1M U66 ( .A1N(N8), .A0(n32), .B0(counter[1]), .B1(n32), .Y(n35) );
  OAI2B2X1M U67 ( .A1N(counter[1]), .A0(n33), .B0(N8), .B1(n33), .Y(n34) );
  NAND4X1M U68 ( .A(n37), .B(n36), .C(n35), .D(n34), .Y(n43) );
  XNOR2X1M U69 ( .A(N13), .B(counter[6]), .Y(n41) );
  XNOR2X1M U70 ( .A(N12), .B(counter[5]), .Y(n40) );
  XNOR2X1M U71 ( .A(N11), .B(counter[4]), .Y(n39) );
  XNOR2X1M U72 ( .A(N10), .B(counter[3]), .Y(n38) );
  NAND4X1M U73 ( .A(n41), .B(n40), .C(n39), .D(n38), .Y(n42) );
  XNOR2X1M U74 ( .A(N27), .B(counter[2]), .Y(n54) );
  OAI22X1M U75 ( .A0(counter[1]), .A1(n44), .B0(n44), .B1(n1), .Y(n53) );
  CLKNAND2X2M U76 ( .A(N25), .B(n55), .Y(n45) );
  AOI22X1M U77 ( .A0(n45), .A1(n1), .B0(n45), .B1(counter[1]), .Y(n46) );
  CLKXOR2X2M U78 ( .A(N28), .B(counter[3]), .Y(n50) );
  CLKXOR2X2M U79 ( .A(N29), .B(counter[4]), .Y(n49) );
  CLKXOR2X2M U80 ( .A(N30), .B(counter[5]), .Y(n48) );
  CLKXOR2X2M U81 ( .A(N31), .B(counter[6]), .Y(n47) );
  NOR4X1M U82 ( .A(n50), .B(n49), .C(n48), .D(n47), .Y(n51) );
  AND4X1M U83 ( .A(n54), .B(n53), .C(n52), .D(n51), .Y(N33) );
  DLY1X1M U84 ( .A(n78), .Y(n74) );
  DLY1X1M U85 ( .A(n79), .Y(n75) );
  DLY1X1M U86 ( .A(n80), .Y(n76) );
  DLY1X1M U87 ( .A(n81), .Y(n77) );
  DLY1X1M U88 ( .A(test_se), .Y(n78) );
  DLY1X1M U89 ( .A(n74), .Y(n79) );
  DLY1X1M U90 ( .A(n74), .Y(n80) );
  DLY1X1M U91 ( .A(n78), .Y(n81) );
  DLY1X1M U92 ( .A(clk_div_reg), .Y(n82) );
  Clock_Divider_1_DW01_inc_0 add_24 ( .A(counter), .SUM({N24, N23, N22, N21, 
        N20, N19, N18, N17}) );
  NOR3X4M U3 ( .A(i_div_ratio[6]), .B(i_div_ratio[7]), .C(n30), .Y(N32) );
  XOR2X2M U4 ( .A(i_div_ratio[7]), .B(n25), .Y(N14) );
  NOR3X2M U5 ( .A(i_div_ratio[1]), .B(i_div_ratio[3]), .C(i_div_ratio[2]), .Y(
        n59) );
  AOI21BX1M U6 ( .A0(i_div_ratio[1]), .A1(i_div_ratio[2]), .B0N(n27), .Y(n1)
         );
endmodule


module Clock_Gating ( CLK_en, test_mode, clk, Gated_CLK );
  input CLK_en, test_mode, clk;
  output Gated_CLK;
  wire   _0_net_;

  TLATNCAX12M U0_TLATNCAX12M ( .E(_0_net_), .CK(clk), .ECK(Gated_CLK) );
  OR2X2M U1 ( .A(CLK_en), .B(test_mode), .Y(_0_net_) );
endmodule


module register_file_test_1 ( WR_Data, address, WR_en, RD_en, clk, rst, 
        RD_Valid, RD_Data, REG0, REG1, REG2, REG3, test_si3, test_si2, 
        test_si1, test_so3, test_so2, test_so1, test_se );
  input [7:0] WR_Data;
  input [3:0] address;
  output [7:0] RD_Data;
  output [7:0] REG0;
  output [7:0] REG1;
  output [7:0] REG2;
  output [7:0] REG3;
  input WR_en, RD_en, clk, rst, test_si3, test_si2, test_si1, test_se;
  output RD_Valid, test_so3, test_so2, test_so1;
  wire   N11, N12, N13, N14, n546, n547, n548, n549, n550, n551, n552, n553,
         n554, n555, n556, n557, n558, n559, n560, n561, n562, n563, n564,
         n565, n566, n3, \reg_file[15][7] , \reg_file[15][6] ,
         \reg_file[15][5] , \reg_file[15][4] , \reg_file[15][3] ,
         \reg_file[15][2] , \reg_file[15][1] , \reg_file[15][0] ,
         \reg_file[14][7] , \reg_file[14][6] , \reg_file[14][5] ,
         \reg_file[14][4] , \reg_file[14][3] , \reg_file[14][2] ,
         \reg_file[14][1] , \reg_file[14][0] , \reg_file[13][7] ,
         \reg_file[13][6] , \reg_file[13][5] , \reg_file[13][4] ,
         \reg_file[13][3] , \reg_file[13][2] , \reg_file[13][1] ,
         \reg_file[13][0] , \reg_file[12][7] , \reg_file[12][6] ,
         \reg_file[12][5] , \reg_file[12][4] , \reg_file[12][3] ,
         \reg_file[12][2] , \reg_file[12][1] , \reg_file[12][0] ,
         \reg_file[11][7] , \reg_file[11][6] , \reg_file[11][5] ,
         \reg_file[11][4] , \reg_file[11][3] , \reg_file[11][2] ,
         \reg_file[11][1] , \reg_file[11][0] , \reg_file[10][7] ,
         \reg_file[10][6] , \reg_file[10][5] , \reg_file[10][4] ,
         \reg_file[10][3] , \reg_file[10][2] , \reg_file[10][1] ,
         \reg_file[10][0] , \reg_file[9][7] , \reg_file[9][6] ,
         \reg_file[9][5] , \reg_file[9][4] , \reg_file[9][3] ,
         \reg_file[9][2] , \reg_file[9][1] , \reg_file[9][0] ,
         \reg_file[8][7] , \reg_file[8][6] , \reg_file[8][5] ,
         \reg_file[8][4] , \reg_file[8][3] , \reg_file[8][2] ,
         \reg_file[8][1] , \reg_file[8][0] , \reg_file[7][7] ,
         \reg_file[7][6] , \reg_file[7][5] , \reg_file[7][4] ,
         \reg_file[7][3] , \reg_file[7][2] , \reg_file[7][1] ,
         \reg_file[7][0] , \reg_file[6][7] , \reg_file[6][6] ,
         \reg_file[6][5] , \reg_file[6][4] , \reg_file[6][3] ,
         \reg_file[6][2] , \reg_file[6][1] , \reg_file[6][0] ,
         \reg_file[5][7] , \reg_file[5][6] , \reg_file[5][5] ,
         \reg_file[5][4] , \reg_file[5][3] , \reg_file[5][2] ,
         \reg_file[5][1] , \reg_file[5][0] , \reg_file[4][7] ,
         \reg_file[4][6] , \reg_file[4][5] , \reg_file[4][4] ,
         \reg_file[4][3] , \reg_file[4][2] , \reg_file[4][1] ,
         \reg_file[4][0] , N36, N37, N38, N39, N40, N41, N42, N43, N61, n149,
         n150, n151, n152, n153, n154, n155, n156, n157, n158, n159, n160,
         n161, n162, n163, n164, n165, n166, n167, n168, n169, n170, n171,
         n172, n173, n174, n175, n176, n177, n178, n179, n180, n181, n182,
         n183, n184, n185, n186, n187, n188, n189, n190, n191, n192, n193,
         n194, n195, n196, n197, n198, n199, n200, n201, n202, n203, n204,
         n205, n206, n207, n208, n209, n210, n211, n212, n213, n214, n215,
         n216, n217, n218, n219, n220, n221, n222, n223, n224, n225, n226,
         n227, n228, n229, n230, n231, n232, n233, n234, n235, n236, n237,
         n238, n239, n240, n241, n242, n243, n244, n245, n246, n247, n248,
         n249, n250, n251, n252, n253, n254, n255, n256, n257, n258, n259,
         n260, n261, n262, n263, n264, n265, n266, n267, n268, n269, n270,
         n271, n272, n273, n274, n275, n276, n277, n278, n279, n280, n281,
         n282, n283, n284, n285, n286, n287, n288, n289, n290, n291, n292,
         n293, n294, n295, n296, n297, n298, n299, n300, n301, n302, n303,
         n304, n305, n306, n307, n308, n309, n310, n311, n138, n140, n142,
         n144, n146, n148, n313, n315, n317, n319, n321, n323, n325, n327,
         n329, n331, n333, n335, n365, n366, n367, n368, n369, n370, n371,
         n372, n373, n374, n375, n376, n377, n378, n379, n380, n381, n382,
         n383, n384, n385, n386, n387, n388, n389, n390, n391, n392, n393,
         n394, n395, n396, n397, n398, n399, n400, n401, n402, n403, n404,
         n405, n406, n407, n408, n409, n410, n411, n412, n413, n414, n415,
         n416, n417, n418, n419, n420, n421, n422, n423, n424, n425, n426,
         n427, n428, n429, n430, n431, n432, n433, n434, n435, n436, n437,
         n438, n439, n440, n441, n442, n443, n444, n445, n446, n447, n448,
         n449, n450, n451, n452, n453, n454, n455, n456, n457, n458, n459,
         n460, n461, n462, n463, n464, n465, n466, n467, n468, n469, n470,
         n471, n472, n473, n474, n475, n476, n477, n478, n479, n480, n481,
         n482, n483, n484, n485, n486, n487, n488, n489, n490, n491, n492,
         n493, n494, n495, n496, n497, n498, n499, n500, n501, n502, n503,
         n504, n505, n506, n507, n508, n509, n510, n511, n512, n513, n514,
         n515, n516, n517, n518, n519, n520, n521, n522, n523, n524, n525,
         n526, n527, n528, n529, n530, n531, n532, n533, n534, n535, n536,
         n537, n538, n539, n540, n541, n542, n543, n544, n545, n571, n572,
         n573, n574, n575, n576, n577, n578, n579, n580, n581, n582, n583,
         n584, n585, n586, n587, n588, n589, n590, n591, n592, n593, n594,
         n595, n596, n597, n598, n599, n600, n601, n602, n603, n604, n605,
         n606, n607, n608, n609, n610, n611, n612, n613, n614, n615, n616,
         n617, n618, n619, n620, n621, n622, n623, n624, n625, n626, n627,
         n628, n629, n630, n631, n632, n633, n634, n635, n636, n637, n638,
         n639, n640, n641, n642, n643, n644, n645, n646, n647, n648, n649,
         n650, n651, n652, n653, n654, n655, n656, n657, n658, n659, n660,
         n661, n662, n663, n664, n665, n666, n667, n668, n669, n670, n671,
         n672, n673, n674, n675, n676, n677, n678, n679, n680, n681, n682,
         n683, n684, n685, n686, n687, n688, n689, n690, n691, n692, n693,
         n694, n695, n696, n697, n698, n699, n700, n701, n702, n703, n704,
         n705, n706, n707, n708, n709, n710, n1;
  assign N11 = address[0];
  assign N12 = address[1];
  assign N13 = address[2];
  assign N14 = address[3];
  assign test_so1 = n557;
  assign test_so3 = \reg_file[15][7] ;
  assign test_so2 = \reg_file[13][2] ;

  SDFFRQX2M \RD_Data_reg[7]  ( .D(n311), .SI(RD_Data[6]), .SE(n637), .CK(clk), 
        .RN(n524), .Q(RD_Data[7]) );
  SDFFRQX2M \RD_Data_reg[6]  ( .D(n310), .SI(RD_Data[5]), .SE(n637), .CK(clk), 
        .RN(n533), .Q(RD_Data[6]) );
  SDFFRQX2M \RD_Data_reg[5]  ( .D(n309), .SI(RD_Data[4]), .SE(n696), .CK(clk), 
        .RN(n533), .Q(RD_Data[5]) );
  SDFFRQX2M \RD_Data_reg[4]  ( .D(n308), .SI(RD_Data[3]), .SE(n618), .CK(clk), 
        .RN(n533), .Q(RD_Data[4]) );
  SDFFRQX2M \RD_Data_reg[3]  ( .D(n307), .SI(RD_Data[2]), .SE(n618), .CK(clk), 
        .RN(n533), .Q(RD_Data[3]) );
  SDFFRQX2M \RD_Data_reg[2]  ( .D(n306), .SI(RD_Data[1]), .SE(n617), .CK(clk), 
        .RN(n533), .Q(RD_Data[2]) );
  SDFFRQX2M \RD_Data_reg[1]  ( .D(n305), .SI(RD_Data[0]), .SE(n617), .CK(clk), 
        .RN(n533), .Q(RD_Data[1]) );
  SDFFRQX2M \RD_Data_reg[0]  ( .D(n304), .SI(test_si1), .SE(n636), .CK(clk), 
        .RN(n533), .Q(RD_Data[0]) );
  SDFFRQX2M RD_Valid_reg ( .D(N61), .SI(RD_Data[7]), .SE(n636), .CK(clk), .RN(
        n528), .Q(RD_Valid) );
  SDFFRQX2M \reg_file_reg[15][7]  ( .D(n303), .SI(\reg_file[15][6] ), .SE(n693), .CK(clk), .RN(n532), .Q(\reg_file[15][7] ) );
  SDFFRQX2M \reg_file_reg[15][6]  ( .D(n302), .SI(\reg_file[15][5] ), .SE(n616), .CK(clk), .RN(n532), .Q(\reg_file[15][6] ) );
  SDFFRQX2M \reg_file_reg[15][5]  ( .D(n301), .SI(\reg_file[15][4] ), .SE(n616), .CK(clk), .RN(n532), .Q(\reg_file[15][5] ) );
  SDFFRQX2M \reg_file_reg[15][4]  ( .D(n300), .SI(\reg_file[15][3] ), .SE(n615), .CK(clk), .RN(n532), .Q(\reg_file[15][4] ) );
  SDFFRQX2M \reg_file_reg[15][3]  ( .D(n299), .SI(\reg_file[15][2] ), .SE(n615), .CK(clk), .RN(n532), .Q(\reg_file[15][3] ) );
  SDFFRQX2M \reg_file_reg[15][2]  ( .D(n298), .SI(\reg_file[15][1] ), .SE(n635), .CK(clk), .RN(n532), .Q(\reg_file[15][2] ) );
  SDFFRQX2M \reg_file_reg[15][1]  ( .D(n297), .SI(\reg_file[15][0] ), .SE(n635), .CK(clk), .RN(n532), .Q(\reg_file[15][1] ) );
  SDFFRQX2M \reg_file_reg[15][0]  ( .D(n296), .SI(\reg_file[14][7] ), .SE(n690), .CK(clk), .RN(n532), .Q(\reg_file[15][0] ) );
  SDFFRQX2M \reg_file_reg[13][7]  ( .D(n287), .SI(\reg_file[13][6] ), .SE(n614), .CK(clk), .RN(n531), .Q(\reg_file[13][7] ) );
  SDFFRQX2M \reg_file_reg[13][6]  ( .D(n286), .SI(\reg_file[13][5] ), .SE(n614), .CK(clk), .RN(n531), .Q(\reg_file[13][6] ) );
  SDFFRQX2M \reg_file_reg[13][5]  ( .D(n285), .SI(\reg_file[13][4] ), .SE(n613), .CK(clk), .RN(n531), .Q(\reg_file[13][5] ) );
  SDFFRQX2M \reg_file_reg[13][4]  ( .D(n284), .SI(\reg_file[13][3] ), .SE(n613), .CK(clk), .RN(n531), .Q(\reg_file[13][4] ) );
  SDFFRQX2M \reg_file_reg[13][3]  ( .D(n283), .SI(test_si3), .SE(n634), .CK(
        clk), .RN(n531), .Q(\reg_file[13][3] ) );
  SDFFRQX2M \reg_file_reg[13][1]  ( .D(n281), .SI(\reg_file[13][0] ), .SE(n687), .CK(clk), .RN(n531), .Q(\reg_file[13][1] ) );
  SDFFRQX2M \reg_file_reg[13][0]  ( .D(n280), .SI(\reg_file[12][7] ), .SE(n612), .CK(clk), .RN(n531), .Q(\reg_file[13][0] ) );
  SDFFRQX2M \reg_file_reg[11][7]  ( .D(n271), .SI(\reg_file[11][6] ), .SE(n612), .CK(clk), .RN(n530), .Q(\reg_file[11][7] ) );
  SDFFRQX2M \reg_file_reg[11][6]  ( .D(n270), .SI(\reg_file[11][5] ), .SE(n611), .CK(clk), .RN(n530), .Q(\reg_file[11][6] ) );
  SDFFRQX2M \reg_file_reg[11][5]  ( .D(n269), .SI(\reg_file[11][4] ), .SE(n611), .CK(clk), .RN(n530), .Q(\reg_file[11][5] ) );
  SDFFRQX2M \reg_file_reg[11][4]  ( .D(n268), .SI(\reg_file[11][3] ), .SE(n633), .CK(clk), .RN(n530), .Q(\reg_file[11][4] ) );
  SDFFRQX2M \reg_file_reg[11][3]  ( .D(n267), .SI(\reg_file[11][2] ), .SE(n633), .CK(clk), .RN(n530), .Q(\reg_file[11][3] ) );
  SDFFRQX2M \reg_file_reg[11][2]  ( .D(n266), .SI(\reg_file[11][1] ), .SE(n684), .CK(clk), .RN(n530), .Q(\reg_file[11][2] ) );
  SDFFRQX2M \reg_file_reg[11][1]  ( .D(n265), .SI(\reg_file[11][0] ), .SE(n610), .CK(clk), .RN(n530), .Q(\reg_file[11][1] ) );
  SDFFRQX2M \reg_file_reg[11][0]  ( .D(n264), .SI(\reg_file[10][7] ), .SE(n610), .CK(clk), .RN(n529), .Q(\reg_file[11][0] ) );
  SDFFRQX2M \reg_file_reg[9][7]  ( .D(n255), .SI(\reg_file[9][6] ), .SE(n609), 
        .CK(clk), .RN(n529), .Q(\reg_file[9][7] ) );
  SDFFRQX2M \reg_file_reg[9][6]  ( .D(n254), .SI(\reg_file[9][5] ), .SE(n609), 
        .CK(clk), .RN(n529), .Q(\reg_file[9][6] ) );
  SDFFRQX2M \reg_file_reg[9][5]  ( .D(n253), .SI(\reg_file[9][4] ), .SE(n632), 
        .CK(clk), .RN(n529), .Q(\reg_file[9][5] ) );
  SDFFRQX2M \reg_file_reg[9][4]  ( .D(n252), .SI(\reg_file[9][3] ), .SE(n632), 
        .CK(clk), .RN(n529), .Q(\reg_file[9][4] ) );
  SDFFRQX2M \reg_file_reg[9][3]  ( .D(n251), .SI(\reg_file[9][2] ), .SE(n681), 
        .CK(clk), .RN(n528), .Q(\reg_file[9][3] ) );
  SDFFRQX2M \reg_file_reg[9][2]  ( .D(n250), .SI(\reg_file[9][1] ), .SE(n608), 
        .CK(clk), .RN(n528), .Q(\reg_file[9][2] ) );
  SDFFRQX2M \reg_file_reg[9][1]  ( .D(n249), .SI(\reg_file[9][0] ), .SE(n608), 
        .CK(clk), .RN(n528), .Q(\reg_file[9][1] ) );
  SDFFRQX2M \reg_file_reg[9][0]  ( .D(n248), .SI(\reg_file[8][7] ), .SE(n607), 
        .CK(clk), .RN(n528), .Q(\reg_file[9][0] ) );
  SDFFRQX2M \reg_file_reg[7][7]  ( .D(n239), .SI(\reg_file[7][6] ), .SE(n607), 
        .CK(clk), .RN(n527), .Q(\reg_file[7][7] ) );
  SDFFRQX2M \reg_file_reg[7][6]  ( .D(n238), .SI(\reg_file[7][5] ), .SE(n631), 
        .CK(clk), .RN(n527), .Q(\reg_file[7][6] ) );
  SDFFRQX2M \reg_file_reg[7][5]  ( .D(n237), .SI(\reg_file[7][4] ), .SE(n631), 
        .CK(clk), .RN(n527), .Q(\reg_file[7][5] ) );
  SDFFRQX2M \reg_file_reg[7][4]  ( .D(n236), .SI(\reg_file[7][3] ), .SE(n678), 
        .CK(clk), .RN(n527), .Q(\reg_file[7][4] ) );
  SDFFRQX2M \reg_file_reg[7][3]  ( .D(n235), .SI(\reg_file[7][2] ), .SE(n606), 
        .CK(clk), .RN(n527), .Q(\reg_file[7][3] ) );
  SDFFRQX2M \reg_file_reg[7][2]  ( .D(n234), .SI(\reg_file[7][1] ), .SE(n606), 
        .CK(clk), .RN(n527), .Q(\reg_file[7][2] ) );
  SDFFRQX2M \reg_file_reg[7][1]  ( .D(n233), .SI(\reg_file[7][0] ), .SE(n605), 
        .CK(clk), .RN(n527), .Q(\reg_file[7][1] ) );
  SDFFRQX2M \reg_file_reg[7][0]  ( .D(n232), .SI(\reg_file[6][7] ), .SE(n605), 
        .CK(clk), .RN(n527), .Q(\reg_file[7][0] ) );
  SDFFRQX2M \reg_file_reg[5][7]  ( .D(n223), .SI(\reg_file[5][6] ), .SE(n630), 
        .CK(clk), .RN(n526), .Q(\reg_file[5][7] ) );
  SDFFRQX2M \reg_file_reg[5][6]  ( .D(n222), .SI(\reg_file[5][5] ), .SE(n630), 
        .CK(clk), .RN(n526), .Q(\reg_file[5][6] ) );
  SDFFRQX2M \reg_file_reg[5][5]  ( .D(n221), .SI(\reg_file[5][4] ), .SE(n675), 
        .CK(clk), .RN(n526), .Q(\reg_file[5][5] ) );
  SDFFRQX2M \reg_file_reg[5][4]  ( .D(n220), .SI(\reg_file[5][3] ), .SE(n604), 
        .CK(clk), .RN(n526), .Q(\reg_file[5][4] ) );
  SDFFRQX2M \reg_file_reg[5][3]  ( .D(n219), .SI(\reg_file[5][2] ), .SE(n604), 
        .CK(clk), .RN(n526), .Q(\reg_file[5][3] ) );
  SDFFRQX2M \reg_file_reg[5][2]  ( .D(n218), .SI(\reg_file[5][1] ), .SE(n603), 
        .CK(clk), .RN(n526), .Q(\reg_file[5][2] ) );
  SDFFRQX2M \reg_file_reg[5][1]  ( .D(n217), .SI(\reg_file[5][0] ), .SE(n603), 
        .CK(clk), .RN(n526), .Q(\reg_file[5][1] ) );
  SDFFRQX2M \reg_file_reg[5][0]  ( .D(n216), .SI(\reg_file[4][7] ), .SE(n629), 
        .CK(clk), .RN(n526), .Q(\reg_file[5][0] ) );
  SDFFRQX2M \reg_file_reg[14][7]  ( .D(n295), .SI(\reg_file[14][6] ), .SE(n629), .CK(clk), .RN(n532), .Q(\reg_file[14][7] ) );
  SDFFRQX2M \reg_file_reg[14][6]  ( .D(n294), .SI(\reg_file[14][5] ), .SE(n672), .CK(clk), .RN(n532), .Q(\reg_file[14][6] ) );
  SDFFRQX2M \reg_file_reg[14][5]  ( .D(n293), .SI(\reg_file[14][4] ), .SE(n602), .CK(clk), .RN(n532), .Q(\reg_file[14][5] ) );
  SDFFRQX2M \reg_file_reg[14][4]  ( .D(n292), .SI(\reg_file[14][3] ), .SE(n602), .CK(clk), .RN(n532), .Q(\reg_file[14][4] ) );
  SDFFRQX2M \reg_file_reg[14][3]  ( .D(n291), .SI(\reg_file[14][2] ), .SE(n670), .CK(clk), .RN(n532), .Q(\reg_file[14][3] ) );
  SDFFRQX2M \reg_file_reg[14][2]  ( .D(n290), .SI(\reg_file[14][1] ), .SE(n601), .CK(clk), .RN(n531), .Q(\reg_file[14][2] ) );
  SDFFRQX2M \reg_file_reg[14][1]  ( .D(n289), .SI(\reg_file[14][0] ), .SE(n628), .CK(clk), .RN(n531), .Q(\reg_file[14][1] ) );
  SDFFRQX2M \reg_file_reg[14][0]  ( .D(n288), .SI(\reg_file[13][7] ), .SE(n628), .CK(clk), .RN(n531), .Q(\reg_file[14][0] ) );
  SDFFRQX2M \reg_file_reg[12][7]  ( .D(n279), .SI(\reg_file[12][6] ), .SE(n669), .CK(clk), .RN(n531), .Q(\reg_file[12][7] ) );
  SDFFRQX2M \reg_file_reg[12][6]  ( .D(n278), .SI(\reg_file[12][5] ), .SE(n600), .CK(clk), .RN(n531), .Q(\reg_file[12][6] ) );
  SDFFRQX2M \reg_file_reg[12][5]  ( .D(n277), .SI(\reg_file[12][4] ), .SE(n600), .CK(clk), .RN(n530), .Q(\reg_file[12][5] ) );
  SDFFRQX2M \reg_file_reg[12][4]  ( .D(n276), .SI(\reg_file[12][3] ), .SE(n599), .CK(clk), .RN(n530), .Q(\reg_file[12][4] ) );
  SDFFRQX2M \reg_file_reg[12][3]  ( .D(n275), .SI(\reg_file[12][2] ), .SE(n599), .CK(clk), .RN(n530), .Q(\reg_file[12][3] ) );
  SDFFRQX2M \reg_file_reg[12][2]  ( .D(n274), .SI(\reg_file[12][1] ), .SE(n627), .CK(clk), .RN(n530), .Q(\reg_file[12][2] ) );
  SDFFRQX2M \reg_file_reg[12][1]  ( .D(n273), .SI(\reg_file[12][0] ), .SE(n627), .CK(clk), .RN(n530), .Q(\reg_file[12][1] ) );
  SDFFRQX2M \reg_file_reg[12][0]  ( .D(n272), .SI(\reg_file[11][7] ), .SE(n666), .CK(clk), .RN(n530), .Q(\reg_file[12][0] ) );
  SDFFRQX2M \reg_file_reg[10][7]  ( .D(n263), .SI(\reg_file[10][6] ), .SE(n598), .CK(clk), .RN(n529), .Q(\reg_file[10][7] ) );
  SDFFRQX2M \reg_file_reg[10][6]  ( .D(n262), .SI(\reg_file[10][5] ), .SE(n598), .CK(clk), .RN(n529), .Q(\reg_file[10][6] ) );
  SDFFRQX2M \reg_file_reg[10][5]  ( .D(n261), .SI(\reg_file[10][4] ), .SE(n597), .CK(clk), .RN(n529), .Q(\reg_file[10][5] ) );
  SDFFRQX2M \reg_file_reg[10][4]  ( .D(n260), .SI(\reg_file[10][3] ), .SE(n597), .CK(clk), .RN(n529), .Q(\reg_file[10][4] ) );
  SDFFRQX2M \reg_file_reg[10][3]  ( .D(n259), .SI(\reg_file[10][2] ), .SE(n626), .CK(clk), .RN(n529), .Q(\reg_file[10][3] ) );
  SDFFRQX2M \reg_file_reg[10][2]  ( .D(n258), .SI(\reg_file[10][1] ), .SE(n626), .CK(clk), .RN(n529), .Q(\reg_file[10][2] ) );
  SDFFRQX2M \reg_file_reg[10][1]  ( .D(n257), .SI(\reg_file[10][0] ), .SE(n663), .CK(clk), .RN(n529), .Q(\reg_file[10][1] ) );
  SDFFRQX2M \reg_file_reg[10][0]  ( .D(n256), .SI(\reg_file[9][7] ), .SE(n596), 
        .CK(clk), .RN(n529), .Q(\reg_file[10][0] ) );
  SDFFRQX2M \reg_file_reg[8][7]  ( .D(n247), .SI(\reg_file[8][6] ), .SE(n596), 
        .CK(clk), .RN(n528), .Q(\reg_file[8][7] ) );
  SDFFRQX2M \reg_file_reg[8][6]  ( .D(n246), .SI(\reg_file[8][5] ), .SE(n595), 
        .CK(clk), .RN(n528), .Q(\reg_file[8][6] ) );
  SDFFRQX2M \reg_file_reg[8][5]  ( .D(n245), .SI(\reg_file[8][4] ), .SE(n595), 
        .CK(clk), .RN(n528), .Q(\reg_file[8][5] ) );
  SDFFRQX2M \reg_file_reg[8][4]  ( .D(n244), .SI(\reg_file[8][3] ), .SE(n625), 
        .CK(clk), .RN(n528), .Q(\reg_file[8][4] ) );
  SDFFRQX2M \reg_file_reg[8][3]  ( .D(n243), .SI(\reg_file[8][2] ), .SE(n625), 
        .CK(clk), .RN(n528), .Q(\reg_file[8][3] ) );
  SDFFRQX2M \reg_file_reg[8][2]  ( .D(n242), .SI(\reg_file[8][1] ), .SE(n660), 
        .CK(clk), .RN(n528), .Q(\reg_file[8][2] ) );
  SDFFRQX2M \reg_file_reg[8][1]  ( .D(n241), .SI(\reg_file[8][0] ), .SE(n601), 
        .CK(clk), .RN(n528), .Q(\reg_file[8][1] ) );
  SDFFRQX2M \reg_file_reg[8][0]  ( .D(n240), .SI(\reg_file[7][7] ), .SE(n659), 
        .CK(clk), .RN(n528), .Q(\reg_file[8][0] ) );
  SDFFRQX2M \reg_file_reg[6][7]  ( .D(n231), .SI(\reg_file[6][6] ), .SE(n624), 
        .CK(clk), .RN(n527), .Q(\reg_file[6][7] ) );
  SDFFRQX2M \reg_file_reg[6][6]  ( .D(n230), .SI(\reg_file[6][5] ), .SE(n624), 
        .CK(clk), .RN(n527), .Q(\reg_file[6][6] ) );
  SDFFRQX2M \reg_file_reg[6][5]  ( .D(n229), .SI(\reg_file[6][4] ), .SE(n658), 
        .CK(clk), .RN(n527), .Q(\reg_file[6][5] ) );
  SDFFRQX2M \reg_file_reg[6][4]  ( .D(n228), .SI(\reg_file[6][3] ), .SE(n594), 
        .CK(clk), .RN(n527), .Q(\reg_file[6][4] ) );
  SDFFRQX2M \reg_file_reg[6][3]  ( .D(n227), .SI(\reg_file[6][2] ), .SE(n594), 
        .CK(clk), .RN(n527), .Q(\reg_file[6][3] ) );
  SDFFRQX2M \reg_file_reg[6][2]  ( .D(n226), .SI(\reg_file[6][1] ), .SE(n623), 
        .CK(clk), .RN(n526), .Q(\reg_file[6][2] ) );
  SDFFRQX2M \reg_file_reg[6][1]  ( .D(n225), .SI(\reg_file[6][0] ), .SE(n623), 
        .CK(clk), .RN(n526), .Q(\reg_file[6][1] ) );
  SDFFRQX2M \reg_file_reg[6][0]  ( .D(n224), .SI(\reg_file[5][7] ), .SE(n656), 
        .CK(clk), .RN(n526), .Q(\reg_file[6][0] ) );
  SDFFRQX2M \reg_file_reg[4][7]  ( .D(n215), .SI(\reg_file[4][6] ), .SE(n593), 
        .CK(clk), .RN(n526), .Q(\reg_file[4][7] ) );
  SDFFRQX2M \reg_file_reg[4][6]  ( .D(n214), .SI(\reg_file[4][5] ), .SE(n593), 
        .CK(clk), .RN(n526), .Q(\reg_file[4][6] ) );
  SDFFRQX2M \reg_file_reg[4][5]  ( .D(n213), .SI(\reg_file[4][4] ), .SE(n622), 
        .CK(clk), .RN(n525), .Q(\reg_file[4][5] ) );
  SDFFRQX2M \reg_file_reg[4][4]  ( .D(n212), .SI(\reg_file[4][3] ), .SE(n622), 
        .CK(clk), .RN(n525), .Q(\reg_file[4][4] ) );
  SDFFRQX2M \reg_file_reg[4][3]  ( .D(n211), .SI(\reg_file[4][2] ), .SE(n654), 
        .CK(clk), .RN(n525), .Q(\reg_file[4][3] ) );
  SDFFRQX2M \reg_file_reg[4][2]  ( .D(n210), .SI(\reg_file[4][1] ), .SE(n592), 
        .CK(clk), .RN(n525), .Q(\reg_file[4][2] ) );
  SDFFRQX2M \reg_file_reg[4][1]  ( .D(n209), .SI(\reg_file[4][0] ), .SE(n592), 
        .CK(clk), .RN(n525), .Q(\reg_file[4][1] ) );
  SDFFRQX2M \reg_file_reg[4][0]  ( .D(n208), .SI(REG3[7]), .SE(n582), .CK(clk), 
        .RN(n525), .Q(\reg_file[4][0] ) );
  SDFFRQX2M \reg_file_reg[2][1]  ( .D(n193), .SI(REG2[0]), .SE(n641), .CK(clk), 
        .RN(n524), .Q(REG2[1]) );
  SDFFSQX4M \reg_file_reg[2][0]  ( .D(n192), .SI(n554), .SE(n638), .CK(clk), 
        .SN(n523), .Q(REG2[0]) );
  SDFFSQX4M \reg_file_reg[3][5]  ( .D(n205), .SI(REG3[4]), .SE(n638), .CK(clk), 
        .SN(n523), .Q(REG3[5]) );
  SDFFRQX2M \reg_file_reg[2][4]  ( .D(n196), .SI(n565), .SE(n580), .CK(clk), 
        .RN(n524), .Q(REG2[4]) );
  SDFFRQX2M \reg_file_reg[2][3]  ( .D(n195), .SI(n566), .SE(n581), .CK(clk), 
        .RN(n524), .Q(n565) );
  SDFFRQX2M \reg_file_reg[2][5]  ( .D(n197), .SI(REG2[4]), .SE(n583), .CK(clk), 
        .RN(n524), .Q(n564) );
  SDFFSQX2M \reg_file_reg[2][7]  ( .D(n199), .SI(n563), .SE(n708), .CK(clk), 
        .SN(n523), .Q(n562) );
  INVX6M U140 ( .A(n142), .Y(REG1[0]) );
  BUFX10M U141 ( .A(n562), .Y(REG2[7]) );
  INVX6M U142 ( .A(n315), .Y(REG2[2]) );
  NOR2X2M U143 ( .A(n472), .B(n473), .Y(n459) );
  NOR2X2M U144 ( .A(n473), .B(N12), .Y(n461) );
  NOR2X2M U145 ( .A(n472), .B(N11), .Y(n460) );
  CLKBUFX8M U146 ( .A(n535), .Y(n524) );
  CLKBUFX8M U147 ( .A(n534), .Y(n523) );
  INVXLM U148 ( .A(n558), .Y(n138) );
  INVX6M U149 ( .A(n138), .Y(REG1[3]) );
  INVXLM U150 ( .A(n559), .Y(n140) );
  INVX6M U151 ( .A(n140), .Y(REG1[2]) );
  INVXLM U152 ( .A(n561), .Y(n142) );
  INVXLM U153 ( .A(n557), .Y(n144) );
  INVX8M U154 ( .A(n144), .Y(REG1[4]) );
  INVXLM U155 ( .A(n556), .Y(n146) );
  INVX8M U156 ( .A(n146), .Y(REG1[5]) );
  INVXLM U157 ( .A(n560), .Y(n148) );
  INVX8M U158 ( .A(n148), .Y(REG1[1]) );
  INVXLM U159 ( .A(n554), .Y(n313) );
  INVX8M U160 ( .A(n313), .Y(REG1[7]) );
  INVXLM U161 ( .A(n566), .Y(n315) );
  INVXLM U162 ( .A(n553), .Y(n317) );
  INVX8M U163 ( .A(n317), .Y(REG0[0]) );
  INVXLM U164 ( .A(n548), .Y(n319) );
  INVX8M U165 ( .A(n319), .Y(REG0[5]) );
  INVXLM U166 ( .A(n549), .Y(n321) );
  INVX8M U167 ( .A(n321), .Y(REG0[4]) );
  INVXLM U168 ( .A(n552), .Y(n323) );
  INVX8M U169 ( .A(n323), .Y(REG0[1]) );
  INVXLM U170 ( .A(n551), .Y(n325) );
  INVX8M U171 ( .A(n325), .Y(REG0[2]) );
  INVXLM U172 ( .A(n550), .Y(n327) );
  INVX8M U173 ( .A(n327), .Y(REG0[3]) );
  INVXLM U174 ( .A(n555), .Y(n329) );
  INVX8M U175 ( .A(n329), .Y(REG1[6]) );
  INVXLM U176 ( .A(n547), .Y(n331) );
  INVX8M U177 ( .A(n331), .Y(REG0[6]) );
  INVXLM U178 ( .A(n546), .Y(n333) );
  INVX8M U179 ( .A(n333), .Y(REG0[7]) );
  INVXLM U180 ( .A(n563), .Y(n335) );
  CLKINVX12M U181 ( .A(n335), .Y(REG2[6]) );
  CLKINVX1M U207 ( .A(N11), .Y(n473) );
  NAND2X4M U208 ( .A(N14), .B(n471), .Y(n450) );
  NAND2X4M U209 ( .A(N13), .B(n470), .Y(n463) );
  CLKINVX1M U210 ( .A(N14), .Y(n470) );
  CLKINVX1M U211 ( .A(N11), .Y(n536) );
  NAND2X4M U212 ( .A(N14), .B(N13), .Y(n453) );
  NAND2X4M U213 ( .A(n471), .B(n470), .Y(n456) );
  BUFX10M U214 ( .A(n564), .Y(REG2[5]) );
  BUFX10M U215 ( .A(n565), .Y(REG2[3]) );
  OR2X1M U216 ( .A(N11), .B(N12), .Y(n365) );
  NOR2BX4M U217 ( .AN(n173), .B(N11), .Y(n165) );
  NOR2BX4M U218 ( .AN(n162), .B(N11), .Y(n151) );
  NOR2BX2M U219 ( .AN(N14), .B(N61), .Y(n173) );
  NOR2X2M U220 ( .A(N61), .B(N14), .Y(n162) );
  BUFX4M U221 ( .A(n175), .Y(n490) );
  NOR2X4M U222 ( .A(n472), .B(N13), .Y(n155) );
  NOR2X4M U223 ( .A(N12), .B(N13), .Y(n150) );
  NOR2BX4M U224 ( .AN(N13), .B(N12), .Y(n158) );
  NOR2BX4M U225 ( .AN(N13), .B(n472), .Y(n161) );
  INVX8M U226 ( .A(WR_Data[6]), .Y(n543) );
  INVX8M U227 ( .A(WR_Data[7]), .Y(n544) );
  CLKBUFX6M U228 ( .A(n474), .Y(n476) );
  BUFX4M U229 ( .A(n459), .Y(n475) );
  CLKBUFX6M U230 ( .A(n487), .Y(n488) );
  CLKBUFX6M U231 ( .A(n478), .Y(n480) );
  CLKBUFX6M U232 ( .A(n482), .Y(n484) );
  BUFX4M U233 ( .A(n460), .Y(n479) );
  BUFX4M U234 ( .A(n461), .Y(n483) );
  CLKBUFX6M U235 ( .A(n474), .Y(n477) );
  BUFX2M U236 ( .A(n459), .Y(n474) );
  BUFX4M U237 ( .A(n152), .Y(n520) );
  BUFX4M U238 ( .A(n166), .Y(n504) );
  BUFX4M U239 ( .A(n169), .Y(n500) );
  BUFX4M U240 ( .A(n156), .Y(n516) );
  BUFX4M U241 ( .A(n171), .Y(n496) );
  BUFX4M U242 ( .A(n159), .Y(n512) );
  BUFX4M U243 ( .A(n163), .Y(n508) );
  BUFX4M U244 ( .A(n174), .Y(n492) );
  BUFX4M U245 ( .A(n152), .Y(n519) );
  BUFX4M U246 ( .A(n166), .Y(n503) );
  BUFX4M U247 ( .A(n169), .Y(n499) );
  BUFX4M U248 ( .A(n156), .Y(n515) );
  BUFX4M U249 ( .A(n171), .Y(n495) );
  BUFX4M U250 ( .A(n159), .Y(n511) );
  BUFX4M U251 ( .A(n163), .Y(n507) );
  BUFX4M U252 ( .A(n174), .Y(n491) );
  BUFX4M U253 ( .A(n154), .Y(n518) );
  BUFX4M U254 ( .A(n157), .Y(n514) );
  BUFX4M U255 ( .A(n160), .Y(n510) );
  BUFX4M U256 ( .A(n164), .Y(n506) );
  BUFX4M U257 ( .A(n168), .Y(n502) );
  BUFX4M U258 ( .A(n170), .Y(n498) );
  BUFX4M U259 ( .A(n172), .Y(n494) );
  BUFX4M U260 ( .A(n149), .Y(n522) );
  BUFX4M U261 ( .A(n154), .Y(n517) );
  BUFX4M U262 ( .A(n157), .Y(n513) );
  BUFX4M U263 ( .A(n160), .Y(n509) );
  BUFX4M U264 ( .A(n164), .Y(n505) );
  BUFX4M U265 ( .A(n168), .Y(n501) );
  BUFX4M U266 ( .A(n170), .Y(n497) );
  BUFX4M U267 ( .A(n172), .Y(n493) );
  BUFX4M U268 ( .A(n149), .Y(n521) );
  CLKBUFX8M U269 ( .A(n535), .Y(n525) );
  CLKBUFX8M U270 ( .A(n535), .Y(n526) );
  CLKBUFX8M U271 ( .A(n535), .Y(n527) );
  CLKBUFX8M U272 ( .A(n534), .Y(n528) );
  CLKBUFX8M U273 ( .A(n534), .Y(n529) );
  CLKBUFX8M U274 ( .A(n534), .Y(n530) );
  CLKBUFX8M U275 ( .A(rst), .Y(n531) );
  CLKBUFX8M U276 ( .A(rst), .Y(n532) );
  BUFX4M U277 ( .A(rst), .Y(n533) );
  CLKBUFX6M U278 ( .A(n486), .Y(n489) );
  BUFX2M U279 ( .A(n462), .Y(n486) );
  CLKBUFX6M U280 ( .A(n478), .Y(n481) );
  BUFX2M U281 ( .A(n460), .Y(n478) );
  CLKBUFX6M U282 ( .A(n482), .Y(n485) );
  BUFX2M U283 ( .A(n461), .Y(n482) );
  BUFX2M U284 ( .A(n462), .Y(n487) );
  NOR2BX4M U285 ( .AN(n162), .B(n536), .Y(n153) );
  NOR2BX4M U286 ( .AN(n173), .B(n536), .Y(n167) );
  NAND2X2M U287 ( .A(n153), .B(n150), .Y(n152) );
  NAND2X2M U288 ( .A(n167), .B(n150), .Y(n166) );
  NAND2X2M U289 ( .A(n167), .B(n155), .Y(n169) );
  NAND2X2M U290 ( .A(n167), .B(n158), .Y(n171) );
  NAND2X2M U291 ( .A(n167), .B(n161), .Y(n174) );
  NAND2X2M U292 ( .A(n158), .B(n153), .Y(n159) );
  NAND2X2M U293 ( .A(n161), .B(n153), .Y(n163) );
  NAND2X2M U294 ( .A(n155), .B(n153), .Y(n156) );
  NAND2X2M U295 ( .A(n150), .B(n151), .Y(n149) );
  NAND2X2M U296 ( .A(n155), .B(n151), .Y(n154) );
  NAND2X2M U297 ( .A(n158), .B(n151), .Y(n157) );
  NAND2X2M U298 ( .A(n161), .B(n151), .Y(n160) );
  NAND2X2M U299 ( .A(n165), .B(n150), .Y(n164) );
  NAND2X2M U300 ( .A(n165), .B(n155), .Y(n168) );
  NAND2X2M U301 ( .A(n165), .B(n158), .Y(n170) );
  NAND2X2M U302 ( .A(n165), .B(n161), .Y(n172) );
  INVX4M U303 ( .A(n490), .Y(n545) );
  BUFX2M U304 ( .A(rst), .Y(n535) );
  BUFX2M U305 ( .A(rst), .Y(n534) );
  INVX2M U306 ( .A(n365), .Y(n462) );
  CLKINVX1M U307 ( .A(N13), .Y(n471) );
  INVX2M U308 ( .A(N12), .Y(n472) );
  NAND2BX2M U309 ( .AN(RD_en), .B(WR_en), .Y(N61) );
  NAND2BX2M U310 ( .AN(WR_en), .B(RD_en), .Y(n175) );
  OAI2BB2X1M U311 ( .B0(n541), .B1(n517), .A0N(REG2[4]), .A1N(n518), .Y(n196)
         );
  INVX8M U312 ( .A(WR_Data[0]), .Y(n537) );
  INVX8M U313 ( .A(WR_Data[1]), .Y(n538) );
  INVX8M U314 ( .A(WR_Data[2]), .Y(n539) );
  INVX8M U315 ( .A(WR_Data[3]), .Y(n540) );
  INVX8M U316 ( .A(WR_Data[4]), .Y(n541) );
  INVX8M U317 ( .A(WR_Data[5]), .Y(n542) );
  AO22X1M U318 ( .A0(N43), .A1(n545), .B0(RD_Data[0]), .B1(n490), .Y(n304) );
  AO22X1M U319 ( .A0(N42), .A1(n545), .B0(RD_Data[1]), .B1(n490), .Y(n305) );
  AO22X1M U320 ( .A0(N41), .A1(n545), .B0(RD_Data[2]), .B1(n490), .Y(n306) );
  AO22X1M U321 ( .A0(N40), .A1(n545), .B0(RD_Data[3]), .B1(n490), .Y(n307) );
  AO22X1M U322 ( .A0(N39), .A1(n545), .B0(RD_Data[4]), .B1(n490), .Y(n308) );
  AO22X1M U323 ( .A0(N38), .A1(n545), .B0(RD_Data[5]), .B1(n490), .Y(n309) );
  AO22X1M U324 ( .A0(N37), .A1(n545), .B0(RD_Data[6]), .B1(n490), .Y(n310) );
  AO22X1M U325 ( .A0(N36), .A1(n545), .B0(RD_Data[7]), .B1(n490), .Y(n311) );
  OAI2BB2X1M U326 ( .B0(n537), .B1(n520), .A0N(REG1[0]), .A1N(n520), .Y(n184)
         );
  OAI2BB2X1M U327 ( .B0(n537), .B1(n516), .A0N(REG3[0]), .A1N(n516), .Y(n200)
         );
  OAI2BB2X1M U328 ( .B0(n537), .B1(n512), .A0N(\reg_file[5][0] ), .A1N(n512), 
        .Y(n216) );
  OAI2BB2X1M U329 ( .B0(n537), .B1(n508), .A0N(\reg_file[7][0] ), .A1N(n508), 
        .Y(n232) );
  OAI2BB2X1M U330 ( .B0(n537), .B1(n504), .A0N(\reg_file[9][0] ), .A1N(n504), 
        .Y(n248) );
  OAI2BB2X1M U331 ( .B0(n537), .B1(n500), .A0N(\reg_file[11][0] ), .A1N(n500), 
        .Y(n264) );
  OAI2BB2X1M U332 ( .B0(n537), .B1(n496), .A0N(\reg_file[13][0] ), .A1N(n496), 
        .Y(n280) );
  OAI2BB2X1M U333 ( .B0(n537), .B1(n492), .A0N(\reg_file[15][0] ), .A1N(n492), 
        .Y(n296) );
  OAI2BB2X1M U334 ( .B0(n538), .B1(n519), .A0N(REG1[1]), .A1N(n520), .Y(n185)
         );
  OAI2BB2X1M U335 ( .B0(n538), .B1(n515), .A0N(REG3[1]), .A1N(n516), .Y(n201)
         );
  OAI2BB2X1M U336 ( .B0(n538), .B1(n511), .A0N(\reg_file[5][1] ), .A1N(n512), 
        .Y(n217) );
  OAI2BB2X1M U337 ( .B0(n538), .B1(n507), .A0N(\reg_file[7][1] ), .A1N(n508), 
        .Y(n233) );
  OAI2BB2X1M U338 ( .B0(n538), .B1(n503), .A0N(\reg_file[9][1] ), .A1N(n504), 
        .Y(n249) );
  OAI2BB2X1M U339 ( .B0(n538), .B1(n499), .A0N(\reg_file[11][1] ), .A1N(n500), 
        .Y(n265) );
  OAI2BB2X1M U340 ( .B0(n538), .B1(n495), .A0N(\reg_file[13][1] ), .A1N(n496), 
        .Y(n281) );
  OAI2BB2X1M U341 ( .B0(n538), .B1(n491), .A0N(\reg_file[15][1] ), .A1N(n492), 
        .Y(n297) );
  OAI2BB2X1M U342 ( .B0(n539), .B1(n519), .A0N(REG1[2]), .A1N(n520), .Y(n186)
         );
  OAI2BB2X1M U343 ( .B0(n539), .B1(n515), .A0N(REG3[2]), .A1N(n516), .Y(n202)
         );
  OAI2BB2X1M U344 ( .B0(n539), .B1(n511), .A0N(\reg_file[5][2] ), .A1N(n512), 
        .Y(n218) );
  OAI2BB2X1M U345 ( .B0(n539), .B1(n507), .A0N(\reg_file[7][2] ), .A1N(n508), 
        .Y(n234) );
  OAI2BB2X1M U346 ( .B0(n539), .B1(n503), .A0N(\reg_file[9][2] ), .A1N(n504), 
        .Y(n250) );
  OAI2BB2X1M U347 ( .B0(n539), .B1(n499), .A0N(\reg_file[11][2] ), .A1N(n500), 
        .Y(n266) );
  OAI2BB2X1M U348 ( .B0(n539), .B1(n495), .A0N(n710), .A1N(n496), .Y(n282) );
  OAI2BB2X1M U349 ( .B0(n539), .B1(n491), .A0N(\reg_file[15][2] ), .A1N(n492), 
        .Y(n298) );
  OAI2BB2X1M U350 ( .B0(n540), .B1(n519), .A0N(REG1[3]), .A1N(n520), .Y(n187)
         );
  OAI2BB2X1M U351 ( .B0(n540), .B1(n515), .A0N(REG3[3]), .A1N(n516), .Y(n203)
         );
  OAI2BB2X1M U352 ( .B0(n540), .B1(n511), .A0N(\reg_file[5][3] ), .A1N(n512), 
        .Y(n219) );
  OAI2BB2X1M U353 ( .B0(n540), .B1(n507), .A0N(\reg_file[7][3] ), .A1N(n508), 
        .Y(n235) );
  OAI2BB2X1M U354 ( .B0(n540), .B1(n503), .A0N(\reg_file[9][3] ), .A1N(n504), 
        .Y(n251) );
  OAI2BB2X1M U355 ( .B0(n540), .B1(n499), .A0N(\reg_file[11][3] ), .A1N(n500), 
        .Y(n267) );
  OAI2BB2X1M U356 ( .B0(n540), .B1(n495), .A0N(\reg_file[13][3] ), .A1N(n496), 
        .Y(n283) );
  OAI2BB2X1M U357 ( .B0(n540), .B1(n491), .A0N(\reg_file[15][3] ), .A1N(n492), 
        .Y(n299) );
  OAI2BB2X1M U358 ( .B0(n541), .B1(n519), .A0N(REG1[4]), .A1N(n520), .Y(n188)
         );
  OAI2BB2X1M U359 ( .B0(n542), .B1(n519), .A0N(REG1[5]), .A1N(n520), .Y(n189)
         );
  OAI2BB2X1M U360 ( .B0(n541), .B1(n515), .A0N(REG3[4]), .A1N(n516), .Y(n204)
         );
  OAI2BB2X1M U361 ( .B0(n541), .B1(n511), .A0N(\reg_file[5][4] ), .A1N(n512), 
        .Y(n220) );
  OAI2BB2X1M U362 ( .B0(n542), .B1(n511), .A0N(\reg_file[5][5] ), .A1N(n512), 
        .Y(n221) );
  OAI2BB2X1M U363 ( .B0(n541), .B1(n507), .A0N(\reg_file[7][4] ), .A1N(n508), 
        .Y(n236) );
  OAI2BB2X1M U364 ( .B0(n542), .B1(n507), .A0N(\reg_file[7][5] ), .A1N(n508), 
        .Y(n237) );
  OAI2BB2X1M U365 ( .B0(n541), .B1(n503), .A0N(\reg_file[9][4] ), .A1N(n504), 
        .Y(n252) );
  OAI2BB2X1M U366 ( .B0(n542), .B1(n503), .A0N(\reg_file[9][5] ), .A1N(n504), 
        .Y(n253) );
  OAI2BB2X1M U367 ( .B0(n541), .B1(n499), .A0N(\reg_file[11][4] ), .A1N(n500), 
        .Y(n268) );
  OAI2BB2X1M U368 ( .B0(n542), .B1(n499), .A0N(\reg_file[11][5] ), .A1N(n500), 
        .Y(n269) );
  OAI2BB2X1M U369 ( .B0(n541), .B1(n495), .A0N(\reg_file[13][4] ), .A1N(n496), 
        .Y(n284) );
  OAI2BB2X1M U370 ( .B0(n542), .B1(n495), .A0N(\reg_file[13][5] ), .A1N(n496), 
        .Y(n285) );
  OAI2BB2X1M U371 ( .B0(n541), .B1(n491), .A0N(\reg_file[15][4] ), .A1N(n492), 
        .Y(n300) );
  OAI2BB2X1M U372 ( .B0(n542), .B1(n491), .A0N(\reg_file[15][5] ), .A1N(n492), 
        .Y(n301) );
  OAI2BB2X1M U373 ( .B0(n543), .B1(n519), .A0N(REG1[6]), .A1N(n520), .Y(n190)
         );
  OAI2BB2X1M U374 ( .B0(n544), .B1(n519), .A0N(REG1[7]), .A1N(n520), .Y(n191)
         );
  OAI2BB2X1M U375 ( .B0(n543), .B1(n515), .A0N(REG3[6]), .A1N(n516), .Y(n206)
         );
  OAI2BB2X1M U376 ( .B0(n544), .B1(n515), .A0N(REG3[7]), .A1N(n516), .Y(n207)
         );
  OAI2BB2X1M U377 ( .B0(n543), .B1(n511), .A0N(\reg_file[5][6] ), .A1N(n512), 
        .Y(n222) );
  OAI2BB2X1M U378 ( .B0(n544), .B1(n511), .A0N(\reg_file[5][7] ), .A1N(n512), 
        .Y(n223) );
  OAI2BB2X1M U379 ( .B0(n543), .B1(n507), .A0N(\reg_file[7][6] ), .A1N(n508), 
        .Y(n238) );
  OAI2BB2X1M U380 ( .B0(n544), .B1(n507), .A0N(\reg_file[7][7] ), .A1N(n508), 
        .Y(n239) );
  OAI2BB2X1M U381 ( .B0(n543), .B1(n503), .A0N(\reg_file[9][6] ), .A1N(n504), 
        .Y(n254) );
  OAI2BB2X1M U382 ( .B0(n544), .B1(n503), .A0N(\reg_file[9][7] ), .A1N(n504), 
        .Y(n255) );
  OAI2BB2X1M U383 ( .B0(n543), .B1(n499), .A0N(\reg_file[11][6] ), .A1N(n500), 
        .Y(n270) );
  OAI2BB2X1M U384 ( .B0(n544), .B1(n499), .A0N(\reg_file[11][7] ), .A1N(n500), 
        .Y(n271) );
  OAI2BB2X1M U385 ( .B0(n543), .B1(n495), .A0N(\reg_file[13][6] ), .A1N(n496), 
        .Y(n286) );
  OAI2BB2X1M U386 ( .B0(n544), .B1(n495), .A0N(\reg_file[13][7] ), .A1N(n496), 
        .Y(n287) );
  OAI2BB2X1M U387 ( .B0(n543), .B1(n491), .A0N(\reg_file[15][6] ), .A1N(n492), 
        .Y(n302) );
  OAI2BB2X1M U388 ( .B0(n544), .B1(n491), .A0N(\reg_file[15][7] ), .A1N(n492), 
        .Y(n303) );
  OAI2BB2X1M U389 ( .B0(n542), .B1(n515), .A0N(REG3[5]), .A1N(n516), .Y(n205)
         );
  OAI2BB2X1M U390 ( .B0(n522), .B1(n537), .A0N(REG0[0]), .A1N(n522), .Y(n176)
         );
  OAI2BB2X1M U391 ( .B0(n521), .B1(n538), .A0N(REG0[1]), .A1N(n522), .Y(n177)
         );
  OAI2BB2X1M U392 ( .B0(n521), .B1(n539), .A0N(REG0[2]), .A1N(n522), .Y(n178)
         );
  OAI2BB2X1M U393 ( .B0(n521), .B1(n540), .A0N(REG0[3]), .A1N(n522), .Y(n179)
         );
  OAI2BB2X1M U394 ( .B0(n521), .B1(n541), .A0N(REG0[4]), .A1N(n522), .Y(n180)
         );
  OAI2BB2X1M U395 ( .B0(n521), .B1(n542), .A0N(REG0[5]), .A1N(n522), .Y(n181)
         );
  OAI2BB2X1M U396 ( .B0(n537), .B1(n514), .A0N(\reg_file[4][0] ), .A1N(n514), 
        .Y(n208) );
  OAI2BB2X1M U397 ( .B0(n537), .B1(n510), .A0N(\reg_file[6][0] ), .A1N(n510), 
        .Y(n224) );
  OAI2BB2X1M U398 ( .B0(n537), .B1(n506), .A0N(\reg_file[8][0] ), .A1N(n506), 
        .Y(n240) );
  OAI2BB2X1M U399 ( .B0(n537), .B1(n502), .A0N(\reg_file[10][0] ), .A1N(n502), 
        .Y(n256) );
  OAI2BB2X1M U400 ( .B0(n537), .B1(n498), .A0N(\reg_file[12][0] ), .A1N(n498), 
        .Y(n272) );
  OAI2BB2X1M U401 ( .B0(n537), .B1(n494), .A0N(\reg_file[14][0] ), .A1N(n494), 
        .Y(n288) );
  OAI2BB2X1M U402 ( .B0(n538), .B1(n517), .A0N(n709), .A1N(n518), .Y(n193) );
  OAI2BB2X1M U403 ( .B0(n538), .B1(n513), .A0N(\reg_file[4][1] ), .A1N(n514), 
        .Y(n209) );
  OAI2BB2X1M U404 ( .B0(n538), .B1(n509), .A0N(\reg_file[6][1] ), .A1N(n510), 
        .Y(n225) );
  OAI2BB2X1M U405 ( .B0(n538), .B1(n505), .A0N(\reg_file[8][1] ), .A1N(n506), 
        .Y(n241) );
  OAI2BB2X1M U406 ( .B0(n538), .B1(n501), .A0N(\reg_file[10][1] ), .A1N(n502), 
        .Y(n257) );
  OAI2BB2X1M U407 ( .B0(n538), .B1(n497), .A0N(\reg_file[12][1] ), .A1N(n498), 
        .Y(n273) );
  OAI2BB2X1M U408 ( .B0(n538), .B1(n493), .A0N(\reg_file[14][1] ), .A1N(n494), 
        .Y(n289) );
  OAI2BB2X1M U409 ( .B0(n539), .B1(n517), .A0N(REG2[2]), .A1N(n518), .Y(n194)
         );
  OAI2BB2X1M U410 ( .B0(n539), .B1(n513), .A0N(\reg_file[4][2] ), .A1N(n514), 
        .Y(n210) );
  OAI2BB2X1M U411 ( .B0(n539), .B1(n509), .A0N(\reg_file[6][2] ), .A1N(n510), 
        .Y(n226) );
  OAI2BB2X1M U412 ( .B0(n539), .B1(n505), .A0N(\reg_file[8][2] ), .A1N(n506), 
        .Y(n242) );
  OAI2BB2X1M U413 ( .B0(n539), .B1(n501), .A0N(\reg_file[10][2] ), .A1N(n502), 
        .Y(n258) );
  OAI2BB2X1M U414 ( .B0(n539), .B1(n497), .A0N(\reg_file[12][2] ), .A1N(n498), 
        .Y(n274) );
  OAI2BB2X1M U415 ( .B0(n539), .B1(n493), .A0N(\reg_file[14][2] ), .A1N(n494), 
        .Y(n290) );
  OAI2BB2X1M U416 ( .B0(n540), .B1(n517), .A0N(n565), .A1N(n518), .Y(n195) );
  OAI2BB2X1M U417 ( .B0(n540), .B1(n513), .A0N(\reg_file[4][3] ), .A1N(n514), 
        .Y(n211) );
  OAI2BB2X1M U418 ( .B0(n540), .B1(n509), .A0N(\reg_file[6][3] ), .A1N(n510), 
        .Y(n227) );
  OAI2BB2X1M U419 ( .B0(n540), .B1(n505), .A0N(\reg_file[8][3] ), .A1N(n506), 
        .Y(n243) );
  OAI2BB2X1M U420 ( .B0(n540), .B1(n501), .A0N(\reg_file[10][3] ), .A1N(n502), 
        .Y(n259) );
  OAI2BB2X1M U421 ( .B0(n540), .B1(n497), .A0N(\reg_file[12][3] ), .A1N(n498), 
        .Y(n275) );
  OAI2BB2X1M U422 ( .B0(n540), .B1(n493), .A0N(\reg_file[14][3] ), .A1N(n494), 
        .Y(n291) );
  OAI2BB2X1M U423 ( .B0(n542), .B1(n517), .A0N(n564), .A1N(n518), .Y(n197) );
  OAI2BB2X1M U424 ( .B0(n541), .B1(n513), .A0N(\reg_file[4][4] ), .A1N(n514), 
        .Y(n212) );
  OAI2BB2X1M U425 ( .B0(n542), .B1(n513), .A0N(\reg_file[4][5] ), .A1N(n514), 
        .Y(n213) );
  OAI2BB2X1M U426 ( .B0(n541), .B1(n509), .A0N(\reg_file[6][4] ), .A1N(n510), 
        .Y(n228) );
  OAI2BB2X1M U427 ( .B0(n542), .B1(n509), .A0N(\reg_file[6][5] ), .A1N(n510), 
        .Y(n229) );
  OAI2BB2X1M U428 ( .B0(n541), .B1(n505), .A0N(\reg_file[8][4] ), .A1N(n506), 
        .Y(n244) );
  OAI2BB2X1M U429 ( .B0(n542), .B1(n505), .A0N(\reg_file[8][5] ), .A1N(n506), 
        .Y(n245) );
  OAI2BB2X1M U430 ( .B0(n541), .B1(n501), .A0N(\reg_file[10][4] ), .A1N(n502), 
        .Y(n260) );
  OAI2BB2X1M U431 ( .B0(n542), .B1(n501), .A0N(\reg_file[10][5] ), .A1N(n502), 
        .Y(n261) );
  OAI2BB2X1M U432 ( .B0(n541), .B1(n497), .A0N(\reg_file[12][4] ), .A1N(n498), 
        .Y(n276) );
  OAI2BB2X1M U433 ( .B0(n542), .B1(n497), .A0N(\reg_file[12][5] ), .A1N(n498), 
        .Y(n277) );
  OAI2BB2X1M U434 ( .B0(n541), .B1(n493), .A0N(\reg_file[14][4] ), .A1N(n494), 
        .Y(n292) );
  OAI2BB2X1M U435 ( .B0(n542), .B1(n493), .A0N(\reg_file[14][5] ), .A1N(n494), 
        .Y(n293) );
  OAI2BB2X1M U436 ( .B0(n521), .B1(n543), .A0N(REG0[6]), .A1N(n522), .Y(n182)
         );
  OAI2BB2X1M U437 ( .B0(n521), .B1(n544), .A0N(REG0[7]), .A1N(n522), .Y(n183)
         );
  OAI2BB2X1M U438 ( .B0(n543), .B1(n517), .A0N(REG2[6]), .A1N(n518), .Y(n198)
         );
  OAI2BB2X1M U439 ( .B0(n543), .B1(n513), .A0N(\reg_file[4][6] ), .A1N(n514), 
        .Y(n214) );
  OAI2BB2X1M U440 ( .B0(n544), .B1(n513), .A0N(\reg_file[4][7] ), .A1N(n514), 
        .Y(n215) );
  OAI2BB2X1M U441 ( .B0(n543), .B1(n509), .A0N(\reg_file[6][6] ), .A1N(n510), 
        .Y(n230) );
  OAI2BB2X1M U442 ( .B0(n544), .B1(n509), .A0N(\reg_file[6][7] ), .A1N(n510), 
        .Y(n231) );
  OAI2BB2X1M U443 ( .B0(n543), .B1(n505), .A0N(\reg_file[8][6] ), .A1N(n506), 
        .Y(n246) );
  OAI2BB2X1M U444 ( .B0(n544), .B1(n505), .A0N(\reg_file[8][7] ), .A1N(n506), 
        .Y(n247) );
  OAI2BB2X1M U445 ( .B0(n543), .B1(n501), .A0N(\reg_file[10][6] ), .A1N(n502), 
        .Y(n262) );
  OAI2BB2X1M U446 ( .B0(n543), .B1(n497), .A0N(\reg_file[12][6] ), .A1N(n498), 
        .Y(n278) );
  OAI2BB2X1M U447 ( .B0(n544), .B1(n497), .A0N(\reg_file[12][7] ), .A1N(n498), 
        .Y(n279) );
  OAI2BB2X1M U448 ( .B0(n543), .B1(n493), .A0N(\reg_file[14][6] ), .A1N(n494), 
        .Y(n294) );
  OAI2BB2X1M U449 ( .B0(n537), .B1(n518), .A0N(REG2[0]), .A1N(n518), .Y(n192)
         );
  OAI2BB2X1M U450 ( .B0(n544), .B1(n501), .A0N(\reg_file[10][7] ), .A1N(n502), 
        .Y(n263) );
  OAI2BB2X1M U451 ( .B0(n544), .B1(n493), .A0N(\reg_file[14][7] ), .A1N(n494), 
        .Y(n295) );
  OAI2BB2X1M U452 ( .B0(n544), .B1(n517), .A0N(REG2[7]), .A1N(n518), .Y(n199)
         );
  AOI22X1M U453 ( .A0(\reg_file[10][0] ), .A1(n481), .B0(\reg_file[11][0] ), 
        .B1(n477), .Y(n367) );
  AOI22X1M U454 ( .A0(\reg_file[8][0] ), .A1(n489), .B0(\reg_file[9][0] ), 
        .B1(n485), .Y(n366) );
  AOI21X1M U455 ( .A0(n367), .A1(n366), .B0(n450), .Y(n377) );
  AOI22X1M U456 ( .A0(\reg_file[14][0] ), .A1(n481), .B0(\reg_file[15][0] ), 
        .B1(n477), .Y(n369) );
  AOI22X1M U457 ( .A0(\reg_file[12][0] ), .A1(n489), .B0(\reg_file[13][0] ), 
        .B1(n485), .Y(n368) );
  AOI21X1M U458 ( .A0(n369), .A1(n368), .B0(n453), .Y(n376) );
  AOI22X1M U459 ( .A0(REG2[0]), .A1(n481), .B0(REG3[0]), .B1(n477), .Y(n371)
         );
  AOI22X1M U460 ( .A0(REG0[0]), .A1(n489), .B0(REG1[0]), .B1(n485), .Y(n370)
         );
  AOI21X1M U461 ( .A0(n371), .A1(n370), .B0(n456), .Y(n375) );
  AOI22X1M U462 ( .A0(\reg_file[6][0] ), .A1(n481), .B0(\reg_file[7][0] ), 
        .B1(n477), .Y(n373) );
  AOI22X1M U463 ( .A0(\reg_file[4][0] ), .A1(n489), .B0(\reg_file[5][0] ), 
        .B1(n485), .Y(n372) );
  AOI21X1M U464 ( .A0(n373), .A1(n372), .B0(n463), .Y(n374) );
  OR4X1M U465 ( .A(n377), .B(n376), .C(n375), .D(n374), .Y(N43) );
  AOI22X1M U466 ( .A0(\reg_file[10][1] ), .A1(n481), .B0(\reg_file[11][1] ), 
        .B1(n477), .Y(n379) );
  AOI22X1M U467 ( .A0(\reg_file[8][1] ), .A1(n489), .B0(\reg_file[9][1] ), 
        .B1(n485), .Y(n378) );
  AOI21X1M U468 ( .A0(n379), .A1(n378), .B0(n450), .Y(n389) );
  AOI22X1M U469 ( .A0(\reg_file[14][1] ), .A1(n481), .B0(\reg_file[15][1] ), 
        .B1(n477), .Y(n381) );
  AOI22X1M U470 ( .A0(\reg_file[12][1] ), .A1(n489), .B0(\reg_file[13][1] ), 
        .B1(n485), .Y(n380) );
  AOI21X1M U471 ( .A0(n381), .A1(n380), .B0(n453), .Y(n388) );
  AOI22X1M U472 ( .A0(REG2[1]), .A1(n481), .B0(REG3[1]), .B1(n477), .Y(n383)
         );
  AOI22X1M U473 ( .A0(REG0[1]), .A1(n489), .B0(REG1[1]), .B1(n485), .Y(n382)
         );
  AOI21X1M U474 ( .A0(n383), .A1(n382), .B0(n456), .Y(n387) );
  AOI22X1M U475 ( .A0(\reg_file[6][1] ), .A1(n481), .B0(\reg_file[7][1] ), 
        .B1(n477), .Y(n385) );
  AOI22X1M U476 ( .A0(\reg_file[4][1] ), .A1(n489), .B0(\reg_file[5][1] ), 
        .B1(n485), .Y(n384) );
  AOI21X1M U477 ( .A0(n385), .A1(n384), .B0(n463), .Y(n386) );
  OR4X1M U478 ( .A(n389), .B(n388), .C(n387), .D(n386), .Y(N42) );
  AOI22X1M U479 ( .A0(\reg_file[10][2] ), .A1(n481), .B0(\reg_file[11][2] ), 
        .B1(n477), .Y(n391) );
  AOI22X1M U480 ( .A0(\reg_file[8][2] ), .A1(n489), .B0(\reg_file[9][2] ), 
        .B1(n485), .Y(n390) );
  AOI21X1M U481 ( .A0(n391), .A1(n390), .B0(n450), .Y(n401) );
  AOI22X1M U482 ( .A0(\reg_file[14][2] ), .A1(n481), .B0(\reg_file[15][2] ), 
        .B1(n477), .Y(n393) );
  AOI22X1M U483 ( .A0(\reg_file[12][2] ), .A1(n489), .B0(n710), .B1(n485), .Y(
        n392) );
  AOI21X1M U484 ( .A0(n393), .A1(n392), .B0(n453), .Y(n400) );
  AOI22X1M U485 ( .A0(REG2[2]), .A1(n481), .B0(REG3[2]), .B1(n477), .Y(n395)
         );
  AOI22X1M U486 ( .A0(REG0[2]), .A1(n489), .B0(REG1[2]), .B1(n485), .Y(n394)
         );
  AOI21X1M U487 ( .A0(n395), .A1(n394), .B0(n456), .Y(n399) );
  AOI22X1M U488 ( .A0(\reg_file[6][2] ), .A1(n481), .B0(\reg_file[7][2] ), 
        .B1(n477), .Y(n397) );
  AOI22X1M U489 ( .A0(\reg_file[4][2] ), .A1(n489), .B0(\reg_file[5][2] ), 
        .B1(n485), .Y(n396) );
  AOI21X1M U490 ( .A0(n397), .A1(n396), .B0(n463), .Y(n398) );
  OR4X1M U491 ( .A(n401), .B(n400), .C(n399), .D(n398), .Y(N41) );
  AOI22X1M U492 ( .A0(\reg_file[10][3] ), .A1(n480), .B0(\reg_file[11][3] ), 
        .B1(n476), .Y(n403) );
  AOI22X1M U493 ( .A0(\reg_file[8][3] ), .A1(n488), .B0(\reg_file[9][3] ), 
        .B1(n484), .Y(n402) );
  AOI21X1M U494 ( .A0(n403), .A1(n402), .B0(n450), .Y(n413) );
  AOI22X1M U495 ( .A0(\reg_file[14][3] ), .A1(n480), .B0(\reg_file[15][3] ), 
        .B1(n476), .Y(n405) );
  AOI22X1M U496 ( .A0(\reg_file[12][3] ), .A1(n488), .B0(\reg_file[13][3] ), 
        .B1(n484), .Y(n404) );
  AOI21X1M U497 ( .A0(n405), .A1(n404), .B0(n453), .Y(n412) );
  AOI22X1M U498 ( .A0(REG2[3]), .A1(n480), .B0(REG3[3]), .B1(n476), .Y(n407)
         );
  AOI22X1M U499 ( .A0(REG0[3]), .A1(n488), .B0(REG1[3]), .B1(n484), .Y(n406)
         );
  AOI21X1M U500 ( .A0(n407), .A1(n406), .B0(n456), .Y(n411) );
  AOI22X1M U501 ( .A0(\reg_file[6][3] ), .A1(n480), .B0(\reg_file[7][3] ), 
        .B1(n476), .Y(n409) );
  AOI22X1M U502 ( .A0(\reg_file[4][3] ), .A1(n488), .B0(\reg_file[5][3] ), 
        .B1(n484), .Y(n408) );
  AOI21X1M U503 ( .A0(n409), .A1(n408), .B0(n463), .Y(n410) );
  OR4X1M U504 ( .A(n413), .B(n412), .C(n411), .D(n410), .Y(N40) );
  AOI22X1M U505 ( .A0(\reg_file[10][4] ), .A1(n480), .B0(\reg_file[11][4] ), 
        .B1(n476), .Y(n415) );
  AOI22X1M U506 ( .A0(\reg_file[8][4] ), .A1(n488), .B0(\reg_file[9][4] ), 
        .B1(n484), .Y(n414) );
  AOI21X1M U507 ( .A0(n415), .A1(n414), .B0(n450), .Y(n425) );
  AOI22X1M U508 ( .A0(\reg_file[14][4] ), .A1(n480), .B0(\reg_file[15][4] ), 
        .B1(n476), .Y(n417) );
  AOI22X1M U509 ( .A0(\reg_file[12][4] ), .A1(n488), .B0(\reg_file[13][4] ), 
        .B1(n484), .Y(n416) );
  AOI21X1M U510 ( .A0(n417), .A1(n416), .B0(n453), .Y(n424) );
  AOI22X1M U511 ( .A0(REG2[4]), .A1(n480), .B0(REG3[4]), .B1(n476), .Y(n419)
         );
  AOI22X1M U512 ( .A0(REG0[4]), .A1(n488), .B0(REG1[4]), .B1(n484), .Y(n418)
         );
  AOI21X1M U513 ( .A0(n419), .A1(n418), .B0(n456), .Y(n423) );
  AOI22X1M U514 ( .A0(\reg_file[6][4] ), .A1(n480), .B0(\reg_file[7][4] ), 
        .B1(n476), .Y(n421) );
  AOI22X1M U515 ( .A0(\reg_file[4][4] ), .A1(n488), .B0(\reg_file[5][4] ), 
        .B1(n484), .Y(n420) );
  AOI21X1M U516 ( .A0(n421), .A1(n420), .B0(n463), .Y(n422) );
  OR4X1M U517 ( .A(n425), .B(n424), .C(n423), .D(n422), .Y(N39) );
  AOI22X1M U518 ( .A0(\reg_file[10][5] ), .A1(n480), .B0(\reg_file[11][5] ), 
        .B1(n476), .Y(n427) );
  AOI22X1M U519 ( .A0(\reg_file[8][5] ), .A1(n488), .B0(\reg_file[9][5] ), 
        .B1(n484), .Y(n426) );
  AOI21X1M U520 ( .A0(n427), .A1(n426), .B0(n450), .Y(n437) );
  AOI22X1M U521 ( .A0(\reg_file[14][5] ), .A1(n480), .B0(\reg_file[15][5] ), 
        .B1(n476), .Y(n429) );
  AOI22X1M U522 ( .A0(\reg_file[12][5] ), .A1(n488), .B0(\reg_file[13][5] ), 
        .B1(n484), .Y(n428) );
  AOI21X1M U523 ( .A0(n429), .A1(n428), .B0(n453), .Y(n436) );
  AOI22X1M U524 ( .A0(REG2[5]), .A1(n480), .B0(REG3[5]), .B1(n476), .Y(n431)
         );
  AOI22X1M U525 ( .A0(REG0[5]), .A1(n488), .B0(REG1[5]), .B1(n484), .Y(n430)
         );
  AOI21X1M U526 ( .A0(n431), .A1(n430), .B0(n456), .Y(n435) );
  AOI22X1M U527 ( .A0(\reg_file[6][5] ), .A1(n480), .B0(\reg_file[7][5] ), 
        .B1(n476), .Y(n433) );
  AOI22X1M U528 ( .A0(\reg_file[4][5] ), .A1(n488), .B0(\reg_file[5][5] ), 
        .B1(n484), .Y(n432) );
  AOI21X1M U529 ( .A0(n433), .A1(n432), .B0(n463), .Y(n434) );
  OR4X1M U530 ( .A(n437), .B(n436), .C(n435), .D(n434), .Y(N38) );
  AOI22X1M U531 ( .A0(\reg_file[10][6] ), .A1(n479), .B0(\reg_file[11][6] ), 
        .B1(n475), .Y(n439) );
  AOI22X1M U532 ( .A0(\reg_file[8][6] ), .A1(n487), .B0(\reg_file[9][6] ), 
        .B1(n483), .Y(n438) );
  AOI21X1M U533 ( .A0(n439), .A1(n438), .B0(n450), .Y(n449) );
  AOI22X1M U534 ( .A0(\reg_file[14][6] ), .A1(n479), .B0(\reg_file[15][6] ), 
        .B1(n475), .Y(n441) );
  AOI22X1M U535 ( .A0(\reg_file[12][6] ), .A1(n487), .B0(\reg_file[13][6] ), 
        .B1(n483), .Y(n440) );
  AOI21X1M U536 ( .A0(n441), .A1(n440), .B0(n453), .Y(n448) );
  AOI22X1M U537 ( .A0(REG2[6]), .A1(n479), .B0(REG3[6]), .B1(n475), .Y(n443)
         );
  AOI22X1M U538 ( .A0(REG0[6]), .A1(n462), .B0(REG1[6]), .B1(n483), .Y(n442)
         );
  AOI21X1M U539 ( .A0(n443), .A1(n442), .B0(n456), .Y(n447) );
  AOI22X1M U540 ( .A0(\reg_file[6][6] ), .A1(n479), .B0(\reg_file[7][6] ), 
        .B1(n475), .Y(n445) );
  AOI22X1M U541 ( .A0(\reg_file[4][6] ), .A1(n486), .B0(\reg_file[5][6] ), 
        .B1(n483), .Y(n444) );
  AOI21X1M U542 ( .A0(n445), .A1(n444), .B0(n463), .Y(n446) );
  OR4X1M U543 ( .A(n449), .B(n448), .C(n447), .D(n446), .Y(N37) );
  AOI22X1M U544 ( .A0(\reg_file[10][7] ), .A1(n479), .B0(\reg_file[11][7] ), 
        .B1(n475), .Y(n452) );
  AOI22X1M U545 ( .A0(\reg_file[8][7] ), .A1(n486), .B0(\reg_file[9][7] ), 
        .B1(n483), .Y(n451) );
  AOI21X1M U546 ( .A0(n452), .A1(n451), .B0(n450), .Y(n469) );
  AOI22X1M U547 ( .A0(\reg_file[14][7] ), .A1(n479), .B0(\reg_file[15][7] ), 
        .B1(n475), .Y(n455) );
  AOI22X1M U548 ( .A0(\reg_file[12][7] ), .A1(n462), .B0(\reg_file[13][7] ), 
        .B1(n483), .Y(n454) );
  AOI21X1M U549 ( .A0(n455), .A1(n454), .B0(n453), .Y(n468) );
  AOI22X1M U550 ( .A0(REG2[7]), .A1(n479), .B0(REG3[7]), .B1(n475), .Y(n458)
         );
  AOI22X1M U551 ( .A0(REG0[7]), .A1(n462), .B0(REG1[7]), .B1(n483), .Y(n457)
         );
  AOI21X1M U552 ( .A0(n458), .A1(n457), .B0(n456), .Y(n467) );
  AOI22X1M U553 ( .A0(\reg_file[6][7] ), .A1(n479), .B0(\reg_file[7][7] ), 
        .B1(n475), .Y(n465) );
  AOI22X1M U554 ( .A0(\reg_file[4][7] ), .A1(n487), .B0(\reg_file[5][7] ), 
        .B1(n483), .Y(n464) );
  AOI21X1M U555 ( .A0(n465), .A1(n464), .B0(n463), .Y(n466) );
  OR4X1M U556 ( .A(n469), .B(n468), .C(n467), .D(n466), .Y(N36) );
  INVXLM U557 ( .A(\reg_file[13][2] ), .Y(n571) );
  INVXLM U558 ( .A(n571), .Y(n572) );
  DLY1X1M U559 ( .A(n639), .Y(n573) );
  DLY1X1M U560 ( .A(n640), .Y(n574) );
  DLY1X1M U561 ( .A(n646), .Y(n575) );
  DLY1X1M U562 ( .A(n648), .Y(n576) );
  DLY1X1M U563 ( .A(n650), .Y(n577) );
  DLY1X1M U564 ( .A(n651), .Y(n578) );
  DLY1X1M U565 ( .A(n652), .Y(n579) );
  DLY1X1M U566 ( .A(n642), .Y(n580) );
  DLY1X1M U567 ( .A(n643), .Y(n581) );
  DLY1X1M U568 ( .A(n644), .Y(n582) );
  DLY1X1M U569 ( .A(n645), .Y(n583) );
  DLY1X1M U571 ( .A(n698), .Y(n585) );
  DLY1X1M U572 ( .A(n700), .Y(n586) );
  DLY1X1M U573 ( .A(n701), .Y(n587) );
  DLY1X1M U574 ( .A(n703), .Y(n588) );
  DLY1X1M U575 ( .A(n704), .Y(n589) );
  DLY1X1M U576 ( .A(n706), .Y(n590) );
  DLY1X1M U577 ( .A(n707), .Y(n591) );
  DLY1X1M U578 ( .A(n653), .Y(n592) );
  DLY1X1M U579 ( .A(n655), .Y(n593) );
  DLY1X1M U580 ( .A(n657), .Y(n594) );
  DLY1X1M U581 ( .A(n661), .Y(n595) );
  DLY1X1M U582 ( .A(n662), .Y(n596) );
  DLY1X1M U583 ( .A(n664), .Y(n597) );
  DLY1X1M U584 ( .A(n665), .Y(n598) );
  DLY1X1M U585 ( .A(n667), .Y(n599) );
  DLY1X1M U586 ( .A(n668), .Y(n600) );
  DLY1X1M U587 ( .A(n574), .Y(n601) );
  DLY1X1M U588 ( .A(n671), .Y(n602) );
  DLY1X1M U589 ( .A(n673), .Y(n603) );
  DLY1X1M U590 ( .A(n674), .Y(n604) );
  DLY1X1M U591 ( .A(n676), .Y(n605) );
  DLY1X1M U592 ( .A(n677), .Y(n606) );
  DLY1X1M U593 ( .A(n679), .Y(n607) );
  DLY1X1M U594 ( .A(n680), .Y(n608) );
  DLY1X1M U595 ( .A(n682), .Y(n609) );
  DLY1X1M U596 ( .A(n683), .Y(n610) );
  DLY1X1M U597 ( .A(n685), .Y(n611) );
  DLY1X1M U598 ( .A(n686), .Y(n612) );
  DLY1X1M U599 ( .A(n688), .Y(n613) );
  DLY1X1M U600 ( .A(n689), .Y(n614) );
  DLY1X1M U601 ( .A(n691), .Y(n615) );
  DLY1X1M U602 ( .A(n692), .Y(n616) );
  DLY1X1M U603 ( .A(n694), .Y(n617) );
  DLY1X1M U604 ( .A(n695), .Y(n618) );
  DLY1X1M U605 ( .A(n699), .Y(n619) );
  DLY1X1M U606 ( .A(n702), .Y(n620) );
  DLY1X1M U607 ( .A(n705), .Y(n621) );
  DLY1X1M U608 ( .A(n654), .Y(n622) );
  DLY1X1M U609 ( .A(n656), .Y(n623) );
  DLY1X1M U610 ( .A(n658), .Y(n624) );
  DLY1X1M U611 ( .A(n660), .Y(n625) );
  DLY1X1M U612 ( .A(n663), .Y(n626) );
  DLY1X1M U613 ( .A(n666), .Y(n627) );
  DLY1X1M U614 ( .A(n669), .Y(n628) );
  DLY1X1M U615 ( .A(n672), .Y(n629) );
  DLY1X1M U616 ( .A(n675), .Y(n630) );
  DLY1X1M U617 ( .A(n678), .Y(n631) );
  DLY1X1M U618 ( .A(n681), .Y(n632) );
  DLY1X1M U619 ( .A(n684), .Y(n633) );
  DLY1X1M U621 ( .A(n690), .Y(n635) );
  DLY1X1M U622 ( .A(n693), .Y(n636) );
  DLY1X1M U623 ( .A(n696), .Y(n637) );
  DLY1X1M U624 ( .A(n708), .Y(n638) );
  DLY1X1M U625 ( .A(n575), .Y(n639) );
  DLY1X1M U626 ( .A(n649), .Y(n640) );
  DLY1X1M U627 ( .A(n649), .Y(n641) );
  DLY1X1M U628 ( .A(n648), .Y(n642) );
  DLY1X1M U629 ( .A(n573), .Y(n643) );
  DLY1X1M U630 ( .A(n576), .Y(n644) );
  DLY1X1M U631 ( .A(n639), .Y(n645) );
  DLY1X1M U632 ( .A(test_se), .Y(n646) );
  DLY1X1M U633 ( .A(n575), .Y(n647) );
  DLY1X1M U634 ( .A(n646), .Y(n648) );
  DLY1X1M U635 ( .A(n647), .Y(n649) );
  DLY1X1M U636 ( .A(n647), .Y(n650) );
  DLY1X1M U637 ( .A(n573), .Y(n651) );
  DLY1X1M U638 ( .A(n576), .Y(n652) );
  DLY1X1M U639 ( .A(n578), .Y(n653) );
  DLY1X1M U640 ( .A(n653), .Y(n654) );
  DLY1X1M U641 ( .A(n577), .Y(n655) );
  DLY1X1M U642 ( .A(n655), .Y(n656) );
  DLY1X1M U643 ( .A(n579), .Y(n657) );
  DLY1X1M U644 ( .A(n657), .Y(n658) );
  DLY1X1M U645 ( .A(n574), .Y(n659) );
  DLY1X1M U646 ( .A(n659), .Y(n660) );
  DLY1X1M U647 ( .A(n645), .Y(n661) );
  DLY1X1M U648 ( .A(n661), .Y(n662) );
  DLY1X1M U649 ( .A(n662), .Y(n663) );
  DLY1X1M U650 ( .A(n577), .Y(n664) );
  DLY1X1M U651 ( .A(n664), .Y(n665) );
  DLY1X1M U652 ( .A(n665), .Y(n666) );
  DLY1X1M U653 ( .A(n578), .Y(n667) );
  DLY1X1M U654 ( .A(n667), .Y(n668) );
  DLY1X1M U655 ( .A(n668), .Y(n669) );
  DLY1X1M U656 ( .A(n640), .Y(n670) );
  DLY1X1M U657 ( .A(n670), .Y(n671) );
  DLY1X1M U658 ( .A(n671), .Y(n672) );
  DLY1X1M U659 ( .A(n641), .Y(n673) );
  DLY1X1M U660 ( .A(n673), .Y(n674) );
  DLY1X1M U661 ( .A(n674), .Y(n675) );
  DLY1X1M U662 ( .A(n651), .Y(n676) );
  DLY1X1M U663 ( .A(n676), .Y(n677) );
  DLY1X1M U664 ( .A(n677), .Y(n678) );
  DLY1X1M U665 ( .A(n580), .Y(n679) );
  DLY1X1M U666 ( .A(n679), .Y(n680) );
  DLY1X1M U667 ( .A(n680), .Y(n681) );
  DLY1X1M U668 ( .A(n579), .Y(n682) );
  DLY1X1M U669 ( .A(n682), .Y(n683) );
  DLY1X1M U670 ( .A(n683), .Y(n684) );
  DLY1X1M U671 ( .A(n652), .Y(n685) );
  DLY1X1M U672 ( .A(n685), .Y(n686) );
  DLY1X1M U673 ( .A(n686), .Y(n687) );
  DLY1X1M U674 ( .A(n642), .Y(n688) );
  DLY1X1M U675 ( .A(n688), .Y(n689) );
  DLY1X1M U676 ( .A(n689), .Y(n690) );
  DLY1X1M U677 ( .A(n643), .Y(n691) );
  DLY1X1M U678 ( .A(n691), .Y(n692) );
  DLY1X1M U679 ( .A(n692), .Y(n693) );
  DLY1X1M U680 ( .A(n644), .Y(n694) );
  DLY1X1M U681 ( .A(n694), .Y(n695) );
  DLY1X1M U682 ( .A(n695), .Y(n696) );
  DLY1X1M U683 ( .A(n582), .Y(n697) );
  DLY1X1M U684 ( .A(n697), .Y(n698) );
  DLY1X1M U686 ( .A(n581), .Y(n700) );
  DLY1X1M U687 ( .A(n700), .Y(n701) );
  DLY1X1M U688 ( .A(n701), .Y(n702) );
  DLY1X1M U689 ( .A(n583), .Y(n703) );
  DLY1X1M U690 ( .A(n703), .Y(n704) );
  DLY1X1M U691 ( .A(n704), .Y(n705) );
  DLY1X1M U692 ( .A(n650), .Y(n706) );
  DLY1X1M U693 ( .A(n706), .Y(n707) );
  DLY1X1M U694 ( .A(n707), .Y(n708) );
  DLY1X1M U695 ( .A(REG2[1]), .Y(n709) );
  DLY1X1M U696 ( .A(n572), .Y(n710) );
  SDFFRQX2M \reg_file_reg[1][6]  ( .D(n190), .SI(n556), .SE(n590), .CK(clk), 
        .RN(n524), .Q(n555) );
  SDFFRQX2M \reg_file_reg[0][6]  ( .D(n182), .SI(n548), .SE(n590), .CK(clk), 
        .RN(n524), .Q(n547) );
  SDFFRQX2M \reg_file_reg[2][6]  ( .D(n198), .SI(n564), .SE(n591), .CK(clk), 
        .RN(n523), .Q(n563) );
  SDFFRQX2M \reg_file_reg[0][7]  ( .D(n183), .SI(n547), .SE(n591), .CK(clk), 
        .RN(n523), .Q(n546) );
  SDFFRQX2M \reg_file_reg[2][2]  ( .D(n194), .SI(n709), .SE(n588), .CK(clk), 
        .RN(n524), .Q(n566) );
  SDFFRQX2M \reg_file_reg[0][0]  ( .D(n176), .SI(RD_Valid), .SE(n588), .CK(clk), .RN(n523), .Q(n553) );
  SDFFRQX2M \reg_file_reg[0][1]  ( .D(n177), .SI(n553), .SE(n705), .CK(clk), 
        .RN(n523), .Q(n552) );
  SDFFRQX2M \reg_file_reg[1][3]  ( .D(n187), .SI(n559), .SE(n586), .CK(clk), 
        .RN(n524), .Q(n558) );
  SDFFRQX2M \reg_file_reg[1][2]  ( .D(n186), .SI(n560), .SE(n586), .CK(clk), 
        .RN(n524), .Q(n559) );
  SDFFRQX2M \reg_file_reg[0][5]  ( .D(n181), .SI(n549), .SE(n589), .CK(clk), 
        .RN(n523), .Q(n548) );
  SDFFRQX2M \reg_file_reg[0][4]  ( .D(n180), .SI(n550), .SE(n589), .CK(clk), 
        .RN(n523), .Q(n549) );
  SDFFRQX2M \reg_file_reg[3][2]  ( .D(n202), .SI(REG3[1]), .SE(n585), .CK(clk), 
        .RN(n525), .Q(n3) );
  SDFFRQX2M \reg_file_reg[1][5]  ( .D(n189), .SI(test_si2), .SE(n702), .CK(clk), .RN(n524), .Q(n556) );
  SDFFRQX2M \reg_file_reg[1][0]  ( .D(n184), .SI(n546), .SE(n587), .CK(clk), 
        .RN(n523), .Q(n561) );
  SDFFRQX2M \reg_file_reg[0][3]  ( .D(n179), .SI(n551), .SE(n621), .CK(clk), 
        .RN(n523), .Q(n550) );
  SDFFRQX2M \reg_file_reg[0][2]  ( .D(n178), .SI(n552), .SE(n621), .CK(clk), 
        .RN(n523), .Q(n551) );
  SDFFRQX2M \reg_file_reg[1][7]  ( .D(n191), .SI(n555), .SE(n620), .CK(clk), 
        .RN(n524), .Q(n554) );
  SDFFRQX2M \reg_file_reg[1][1]  ( .D(n185), .SI(n561), .SE(n620), .CK(clk), 
        .RN(n523), .Q(n560) );
  SDFFRQX4M \reg_file_reg[3][6]  ( .D(n206), .SI(REG3[5]), .SE(n619), .CK(clk), 
        .RN(n525), .Q(REG3[6]) );
  SDFFRQX4M \reg_file_reg[3][1]  ( .D(n201), .SI(REG3[0]), .SE(n619), .CK(clk), 
        .RN(n525), .Q(REG3[1]) );
  SDFFRQX4M \reg_file_reg[3][4]  ( .D(n204), .SI(REG3[3]), .SE(n699), .CK(clk), 
        .RN(n525), .Q(REG3[4]) );
  SDFFRQX4M \reg_file_reg[3][3]  ( .D(n203), .SI(REG3[2]), .SE(n585), .CK(clk), 
        .RN(n525), .Q(REG3[3]) );
  SDFFRQX4M \reg_file_reg[3][7]  ( .D(n207), .SI(REG3[6]), .SE(n584), .CK(clk), 
        .RN(n525), .Q(REG3[7]) );
  SDFFRQX4M \reg_file_reg[3][0]  ( .D(n200), .SI(n562), .SE(n584), .CK(clk), 
        .RN(n525), .Q(REG3[0]) );
  SDFFRQX1M \reg_file_reg[1][4]  ( .D(n188), .SI(n558), .SE(n587), .CK(clk), 
        .RN(n524), .Q(n557) );
  SDFFRQX4M \reg_file_reg[13][2]  ( .D(n282), .SI(\reg_file[13][1] ), .SE(n634), .CK(clk), .RN(n531), .Q(\reg_file[13][2] ) );
  BUFX2M U3 ( .A(n687), .Y(n634) );
  BUFX2M U4 ( .A(n697), .Y(n584) );
  INVXLM U5 ( .A(n3), .Y(n1) );
  INVX4M U6 ( .A(n1), .Y(REG3[2]) );
  BUFX2M U7 ( .A(n698), .Y(n699) );
endmodule


module decoder ( alu_fun, arith_en, logic_en, cmp_en, shift_en );
  input [1:0] alu_fun;
  output arith_en, logic_en, cmp_en, shift_en;
  wire   n2, n1;

  NOR2X2M U3 ( .A(n1), .B(n2), .Y(shift_en) );
  OR2X2M U4 ( .A(logic_en), .B(cmp_en), .Y(n2) );
  NOR2X8M U5 ( .A(n1), .B(alu_fun[1]), .Y(logic_en) );
  NOR2X6M U6 ( .A(alu_fun[0]), .B(n2), .Y(arith_en) );
  NOR2BX4M U7 ( .AN(alu_fun[1]), .B(alu_fun[0]), .Y(cmp_en) );
  CLKINVX2M U8 ( .A(alu_fun[0]), .Y(n1) );
endmodule


module arithmetic_unit_DW_div_uns_0 ( a, b, quotient, remainder, divide_by_0
 );
  input [7:0] a;
  input [7:0] b;
  output [7:0] quotient;
  output [7:0] remainder;
  output divide_by_0;
  wire   \u_div/SumTmp[1][0] , \u_div/SumTmp[1][1] , \u_div/SumTmp[1][2] ,
         \u_div/SumTmp[1][3] , \u_div/SumTmp[1][4] , \u_div/SumTmp[1][5] ,
         \u_div/SumTmp[1][6] , \u_div/SumTmp[2][0] , \u_div/SumTmp[2][1] ,
         \u_div/SumTmp[2][2] , \u_div/SumTmp[2][3] , \u_div/SumTmp[2][4] ,
         \u_div/SumTmp[2][5] , \u_div/SumTmp[3][0] , \u_div/SumTmp[3][1] ,
         \u_div/SumTmp[3][2] , \u_div/SumTmp[3][3] , \u_div/SumTmp[3][4] ,
         \u_div/SumTmp[4][0] , \u_div/SumTmp[4][1] , \u_div/SumTmp[4][2] ,
         \u_div/SumTmp[4][3] , \u_div/SumTmp[5][0] , \u_div/SumTmp[5][1] ,
         \u_div/SumTmp[5][2] , \u_div/SumTmp[6][0] , \u_div/SumTmp[6][1] ,
         \u_div/SumTmp[7][0] , \u_div/CryTmp[0][1] , \u_div/CryTmp[0][2] ,
         \u_div/CryTmp[0][3] , \u_div/CryTmp[0][4] , \u_div/CryTmp[0][5] ,
         \u_div/CryTmp[0][6] , \u_div/CryTmp[0][7] , \u_div/CryTmp[1][1] ,
         \u_div/CryTmp[1][2] , \u_div/CryTmp[1][3] , \u_div/CryTmp[1][4] ,
         \u_div/CryTmp[1][5] , \u_div/CryTmp[1][6] , \u_div/CryTmp[1][7] ,
         \u_div/CryTmp[2][1] , \u_div/CryTmp[2][2] , \u_div/CryTmp[2][3] ,
         \u_div/CryTmp[2][4] , \u_div/CryTmp[2][5] , \u_div/CryTmp[2][6] ,
         \u_div/CryTmp[3][1] , \u_div/CryTmp[3][2] , \u_div/CryTmp[3][3] ,
         \u_div/CryTmp[3][4] , \u_div/CryTmp[3][5] , \u_div/CryTmp[4][1] ,
         \u_div/CryTmp[4][2] , \u_div/CryTmp[4][3] , \u_div/CryTmp[4][4] ,
         \u_div/CryTmp[5][1] , \u_div/CryTmp[5][2] , \u_div/CryTmp[5][3] ,
         \u_div/CryTmp[6][1] , \u_div/CryTmp[6][2] , \u_div/CryTmp[7][1] ,
         \u_div/PartRem[1][1] , \u_div/PartRem[1][2] , \u_div/PartRem[1][3] ,
         \u_div/PartRem[1][4] , \u_div/PartRem[1][5] , \u_div/PartRem[1][6] ,
         \u_div/PartRem[1][7] , \u_div/PartRem[2][1] , \u_div/PartRem[2][2] ,
         \u_div/PartRem[2][3] , \u_div/PartRem[2][4] , \u_div/PartRem[2][5] ,
         \u_div/PartRem[2][6] , \u_div/PartRem[3][1] , \u_div/PartRem[3][2] ,
         \u_div/PartRem[3][3] , \u_div/PartRem[3][4] , \u_div/PartRem[3][5] ,
         \u_div/PartRem[4][1] , \u_div/PartRem[4][2] , \u_div/PartRem[4][3] ,
         \u_div/PartRem[4][4] , \u_div/PartRem[5][1] , \u_div/PartRem[5][2] ,
         \u_div/PartRem[5][3] , \u_div/PartRem[6][1] , \u_div/PartRem[6][2] ,
         \u_div/PartRem[7][1] , n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11;

  ADDFX2M \u_div/u_fa_PartRem_0_6_1  ( .A(\u_div/PartRem[7][1] ), .B(n7), .CI(
        \u_div/CryTmp[6][1] ), .CO(\u_div/CryTmp[6][2] ), .S(
        \u_div/SumTmp[6][1] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_1_1  ( .A(\u_div/PartRem[2][1] ), .B(n7), .CI(
        \u_div/CryTmp[1][1] ), .CO(\u_div/CryTmp[1][2] ), .S(
        \u_div/SumTmp[1][1] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_2_1  ( .A(\u_div/PartRem[3][1] ), .B(n7), .CI(
        \u_div/CryTmp[2][1] ), .CO(\u_div/CryTmp[2][2] ), .S(
        \u_div/SumTmp[2][1] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_3_1  ( .A(\u_div/PartRem[4][1] ), .B(n7), .CI(
        \u_div/CryTmp[3][1] ), .CO(\u_div/CryTmp[3][2] ), .S(
        \u_div/SumTmp[3][1] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_4_1  ( .A(\u_div/PartRem[5][1] ), .B(n7), .CI(
        \u_div/CryTmp[4][1] ), .CO(\u_div/CryTmp[4][2] ), .S(
        \u_div/SumTmp[4][1] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_5_1  ( .A(\u_div/PartRem[6][1] ), .B(n7), .CI(
        \u_div/CryTmp[5][1] ), .CO(\u_div/CryTmp[5][2] ), .S(
        \u_div/SumTmp[5][1] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_1_6  ( .A(\u_div/PartRem[2][6] ), .B(n2), .CI(
        \u_div/CryTmp[1][6] ), .CO(\u_div/CryTmp[1][7] ), .S(
        \u_div/SumTmp[1][6] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_2_5  ( .A(\u_div/PartRem[3][5] ), .B(n3), .CI(
        \u_div/CryTmp[2][5] ), .CO(\u_div/CryTmp[2][6] ), .S(
        \u_div/SumTmp[2][5] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_4_3  ( .A(\u_div/PartRem[5][3] ), .B(n5), .CI(
        \u_div/CryTmp[4][3] ), .CO(\u_div/CryTmp[4][4] ), .S(
        \u_div/SumTmp[4][3] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_3_4  ( .A(\u_div/PartRem[4][4] ), .B(n4), .CI(
        \u_div/CryTmp[3][4] ), .CO(\u_div/CryTmp[3][5] ), .S(
        \u_div/SumTmp[3][4] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_5_2  ( .A(\u_div/PartRem[6][2] ), .B(n6), .CI(
        \u_div/CryTmp[5][2] ), .CO(\u_div/CryTmp[5][3] ), .S(
        \u_div/SumTmp[5][2] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_0_4  ( .A(\u_div/PartRem[1][4] ), .B(n4), .CI(
        \u_div/CryTmp[0][4] ), .CO(\u_div/CryTmp[0][5] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_0_5  ( .A(\u_div/PartRem[1][5] ), .B(n3), .CI(
        \u_div/CryTmp[0][5] ), .CO(\u_div/CryTmp[0][6] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_0_6  ( .A(\u_div/PartRem[1][6] ), .B(n2), .CI(
        \u_div/CryTmp[0][6] ), .CO(\u_div/CryTmp[0][7] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_1_5  ( .A(\u_div/PartRem[2][5] ), .B(n3), .CI(
        \u_div/CryTmp[1][5] ), .CO(\u_div/CryTmp[1][6] ), .S(
        \u_div/SumTmp[1][5] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_1_4  ( .A(\u_div/PartRem[2][4] ), .B(n4), .CI(
        \u_div/CryTmp[1][4] ), .CO(\u_div/CryTmp[1][5] ), .S(
        \u_div/SumTmp[1][4] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_2_4  ( .A(\u_div/PartRem[3][4] ), .B(n4), .CI(
        \u_div/CryTmp[2][4] ), .CO(\u_div/CryTmp[2][5] ), .S(
        \u_div/SumTmp[2][4] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_0_1  ( .A(\u_div/PartRem[1][1] ), .B(n7), .CI(
        \u_div/CryTmp[0][1] ), .CO(\u_div/CryTmp[0][2] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_0_2  ( .A(\u_div/PartRem[1][2] ), .B(n6), .CI(
        \u_div/CryTmp[0][2] ), .CO(\u_div/CryTmp[0][3] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_0_3  ( .A(\u_div/PartRem[1][3] ), .B(n5), .CI(
        \u_div/CryTmp[0][3] ), .CO(\u_div/CryTmp[0][4] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_1_3  ( .A(\u_div/PartRem[2][3] ), .B(n5), .CI(
        \u_div/CryTmp[1][3] ), .CO(\u_div/CryTmp[1][4] ), .S(
        \u_div/SumTmp[1][3] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_2_3  ( .A(\u_div/PartRem[3][3] ), .B(n5), .CI(
        \u_div/CryTmp[2][3] ), .CO(\u_div/CryTmp[2][4] ), .S(
        \u_div/SumTmp[2][3] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_3_3  ( .A(\u_div/PartRem[4][3] ), .B(n5), .CI(
        \u_div/CryTmp[3][3] ), .CO(\u_div/CryTmp[3][4] ), .S(
        \u_div/SumTmp[3][3] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_1_2  ( .A(\u_div/PartRem[2][2] ), .B(n6), .CI(
        \u_div/CryTmp[1][2] ), .CO(\u_div/CryTmp[1][3] ), .S(
        \u_div/SumTmp[1][2] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_2_2  ( .A(\u_div/PartRem[3][2] ), .B(n6), .CI(
        \u_div/CryTmp[2][2] ), .CO(\u_div/CryTmp[2][3] ), .S(
        \u_div/SumTmp[2][2] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_3_2  ( .A(\u_div/PartRem[4][2] ), .B(n6), .CI(
        \u_div/CryTmp[3][2] ), .CO(\u_div/CryTmp[3][3] ), .S(
        \u_div/SumTmp[3][2] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_4_2  ( .A(\u_div/PartRem[5][2] ), .B(n6), .CI(
        \u_div/CryTmp[4][2] ), .CO(\u_div/CryTmp[4][3] ), .S(
        \u_div/SumTmp[4][2] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_0_7  ( .A(\u_div/PartRem[1][7] ), .B(n1), .CI(
        \u_div/CryTmp[0][7] ), .CO(quotient[0]) );
  NOR2X4M U1 ( .A(b[6]), .B(b[7]), .Y(n11) );
  AND3X4M U2 ( .A(n11), .B(n3), .C(\u_div/CryTmp[3][5] ), .Y(quotient[3]) );
  CLKAND2X4M U3 ( .A(\u_div/CryTmp[4][4] ), .B(n10), .Y(quotient[4]) );
  CLKAND2X4M U4 ( .A(\u_div/CryTmp[2][6] ), .B(n11), .Y(quotient[2]) );
  CLKAND2X4M U5 ( .A(\u_div/CryTmp[1][7] ), .B(n1), .Y(quotient[1]) );
  AND2X2M U6 ( .A(\u_div/CryTmp[5][3] ), .B(n9), .Y(quotient[5]) );
  MX2X1M U7 ( .A(\u_div/PartRem[3][4] ), .B(\u_div/SumTmp[2][4] ), .S0(
        quotient[2]), .Y(\u_div/PartRem[2][5] ) );
  MX2X1M U8 ( .A(\u_div/PartRem[3][2] ), .B(\u_div/SumTmp[2][2] ), .S0(
        quotient[2]), .Y(\u_div/PartRem[2][3] ) );
  MX2X1M U9 ( .A(\u_div/PartRem[3][3] ), .B(\u_div/SumTmp[2][3] ), .S0(
        quotient[2]), .Y(\u_div/PartRem[2][4] ) );
  MX2X1M U10 ( .A(\u_div/PartRem[3][5] ), .B(\u_div/SumTmp[2][5] ), .S0(
        quotient[2]), .Y(\u_div/PartRem[2][6] ) );
  MX2X1M U11 ( .A(\u_div/PartRem[4][4] ), .B(\u_div/SumTmp[3][4] ), .S0(
        quotient[3]), .Y(\u_div/PartRem[3][5] ) );
  MX2X1M U12 ( .A(\u_div/PartRem[4][3] ), .B(\u_div/SumTmp[3][3] ), .S0(
        quotient[3]), .Y(\u_div/PartRem[3][4] ) );
  MX2X1M U13 ( .A(\u_div/PartRem[4][2] ), .B(\u_div/SumTmp[3][2] ), .S0(
        quotient[3]), .Y(\u_div/PartRem[3][3] ) );
  MX2X1M U14 ( .A(\u_div/PartRem[5][3] ), .B(\u_div/SumTmp[4][3] ), .S0(
        quotient[4]), .Y(\u_div/PartRem[4][4] ) );
  MX2X1M U15 ( .A(\u_div/PartRem[5][2] ), .B(\u_div/SumTmp[4][2] ), .S0(
        quotient[4]), .Y(\u_div/PartRem[4][3] ) );
  MX2X1M U16 ( .A(\u_div/PartRem[6][2] ), .B(\u_div/SumTmp[5][2] ), .S0(
        quotient[5]), .Y(\u_div/PartRem[5][3] ) );
  MX2XLM U17 ( .A(\u_div/PartRem[2][3] ), .B(\u_div/SumTmp[1][3] ), .S0(
        quotient[1]), .Y(\u_div/PartRem[1][4] ) );
  MX2XLM U18 ( .A(\u_div/PartRem[2][4] ), .B(\u_div/SumTmp[1][4] ), .S0(
        quotient[1]), .Y(\u_div/PartRem[1][5] ) );
  MX2XLM U19 ( .A(\u_div/PartRem[2][6] ), .B(\u_div/SumTmp[1][6] ), .S0(
        quotient[1]), .Y(\u_div/PartRem[1][7] ) );
  AND3X2M U20 ( .A(n9), .B(n6), .C(\u_div/CryTmp[6][2] ), .Y(quotient[6]) );
  AND2X2M U21 ( .A(n10), .B(n5), .Y(n9) );
  MX2X1M U22 ( .A(\u_div/PartRem[3][1] ), .B(\u_div/SumTmp[2][1] ), .S0(
        quotient[2]), .Y(\u_div/PartRem[2][2] ) );
  MX2X1M U23 ( .A(\u_div/PartRem[4][1] ), .B(\u_div/SumTmp[3][1] ), .S0(
        quotient[3]), .Y(\u_div/PartRem[3][2] ) );
  MX2X1M U24 ( .A(\u_div/PartRem[5][1] ), .B(\u_div/SumTmp[4][1] ), .S0(
        quotient[4]), .Y(\u_div/PartRem[4][2] ) );
  MX2X1M U25 ( .A(\u_div/PartRem[6][1] ), .B(\u_div/SumTmp[5][1] ), .S0(
        quotient[5]), .Y(\u_div/PartRem[5][2] ) );
  MX2X1M U26 ( .A(\u_div/PartRem[7][1] ), .B(\u_div/SumTmp[6][1] ), .S0(
        quotient[6]), .Y(\u_div/PartRem[6][2] ) );
  MX2XLM U27 ( .A(\u_div/PartRem[2][1] ), .B(\u_div/SumTmp[1][1] ), .S0(
        quotient[1]), .Y(\u_div/PartRem[1][2] ) );
  INVX4M U28 ( .A(b[2]), .Y(n6) );
  INVX8M U29 ( .A(b[0]), .Y(n8) );
  OR2X1M U30 ( .A(a[7]), .B(n8), .Y(\u_div/CryTmp[7][1] ) );
  XNOR2X2M U31 ( .A(n8), .B(a[2]), .Y(\u_div/SumTmp[2][0] ) );
  XNOR2X2M U32 ( .A(n8), .B(a[3]), .Y(\u_div/SumTmp[3][0] ) );
  XNOR2X2M U33 ( .A(n8), .B(a[4]), .Y(\u_div/SumTmp[4][0] ) );
  XNOR2X2M U34 ( .A(n8), .B(a[5]), .Y(\u_div/SumTmp[5][0] ) );
  XNOR2X1M U35 ( .A(n8), .B(a[7]), .Y(\u_div/SumTmp[7][0] ) );
  XNOR2X1M U36 ( .A(n8), .B(a[6]), .Y(\u_div/SumTmp[6][0] ) );
  INVX4M U37 ( .A(b[1]), .Y(n7) );
  INVX4M U38 ( .A(b[3]), .Y(n5) );
  INVX4M U39 ( .A(b[4]), .Y(n4) );
  XNOR2X1M U40 ( .A(n8), .B(a[1]), .Y(\u_div/SumTmp[1][0] ) );
  INVX4M U41 ( .A(b[5]), .Y(n3) );
  CLKINVX2M U42 ( .A(b[6]), .Y(n2) );
  INVX2M U43 ( .A(b[7]), .Y(n1) );
  OR2X2M U44 ( .A(a[0]), .B(n8), .Y(\u_div/CryTmp[0][1] ) );
  OR2X1M U45 ( .A(a[5]), .B(n8), .Y(\u_div/CryTmp[5][1] ) );
  OR2X1M U46 ( .A(a[4]), .B(n8), .Y(\u_div/CryTmp[4][1] ) );
  OR2X1M U47 ( .A(a[3]), .B(n8), .Y(\u_div/CryTmp[3][1] ) );
  OR2X1M U48 ( .A(a[2]), .B(n8), .Y(\u_div/CryTmp[2][1] ) );
  OR2X1M U49 ( .A(a[1]), .B(n8), .Y(\u_div/CryTmp[1][1] ) );
  OR2X1M U50 ( .A(a[6]), .B(n8), .Y(\u_div/CryTmp[6][1] ) );
  CLKMX2X2M U51 ( .A(a[7]), .B(\u_div/SumTmp[7][0] ), .S0(quotient[7]), .Y(
        \u_div/PartRem[7][1] ) );
  CLKMX2X2M U52 ( .A(\u_div/PartRem[2][5] ), .B(\u_div/SumTmp[1][5] ), .S0(
        quotient[1]), .Y(\u_div/PartRem[1][6] ) );
  CLKMX2X2M U53 ( .A(a[6]), .B(\u_div/SumTmp[6][0] ), .S0(quotient[6]), .Y(
        \u_div/PartRem[6][1] ) );
  CLKMX2X2M U54 ( .A(a[5]), .B(\u_div/SumTmp[5][0] ), .S0(quotient[5]), .Y(
        \u_div/PartRem[5][1] ) );
  CLKMX2X2M U55 ( .A(a[4]), .B(\u_div/SumTmp[4][0] ), .S0(quotient[4]), .Y(
        \u_div/PartRem[4][1] ) );
  CLKMX2X2M U56 ( .A(\u_div/PartRem[2][2] ), .B(\u_div/SumTmp[1][2] ), .S0(
        quotient[1]), .Y(\u_div/PartRem[1][3] ) );
  CLKMX2X2M U57 ( .A(a[3]), .B(\u_div/SumTmp[3][0] ), .S0(quotient[3]), .Y(
        \u_div/PartRem[3][1] ) );
  CLKMX2X2M U58 ( .A(a[2]), .B(\u_div/SumTmp[2][0] ), .S0(quotient[2]), .Y(
        \u_div/PartRem[2][1] ) );
  CLKMX2X2M U59 ( .A(a[1]), .B(\u_div/SumTmp[1][0] ), .S0(quotient[1]), .Y(
        \u_div/PartRem[1][1] ) );
  AND4X1M U60 ( .A(\u_div/CryTmp[7][1] ), .B(n9), .C(n7), .D(n6), .Y(
        quotient[7]) );
  AND3X1M U61 ( .A(n11), .B(n4), .C(n3), .Y(n10) );
endmodule


module arithmetic_unit_DW01_sub_0 ( A, B, CI, DIFF, CO );
  input [8:0] A;
  input [8:0] B;
  output [8:0] DIFF;
  input CI;
  output CO;
  wire   n1, n2, n3, n4, n5, n6, n7, n8;
  wire   [9:0] carry;

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
  INVX2M U1 ( .A(B[8]), .Y(n1) );
  XNOR2X2M U2 ( .A(n8), .B(A[0]), .Y(DIFF[0]) );
  INVX2M U3 ( .A(B[0]), .Y(n8) );
  OR2X1M U4 ( .A(A[0]), .B(n8), .Y(carry[1]) );
  INVX2M U5 ( .A(B[1]), .Y(n7) );
  INVX2M U6 ( .A(B[2]), .Y(n6) );
  INVX2M U7 ( .A(B[3]), .Y(n5) );
  INVX2M U8 ( .A(B[4]), .Y(n4) );
  INVX2M U9 ( .A(B[5]), .Y(n3) );
  INVXLM U10 ( .A(B[6]), .Y(n2) );
endmodule


module arithmetic_unit_DW01_add_0 ( A, B, CI, SUM, CO );
  input [8:0] A;
  input [8:0] B;
  output [8:0] SUM;
  input CI;
  output CO;
  wire   n1;
  wire   [8:1] carry;

  ADDFX2M U1_2 ( .A(A[2]), .B(B[2]), .CI(carry[2]), .CO(carry[3]), .S(SUM[2])
         );
  ADDFX2M U1_3 ( .A(A[3]), .B(B[3]), .CI(carry[3]), .CO(carry[4]), .S(SUM[3])
         );
  ADDFX2M U1_4 ( .A(A[4]), .B(B[4]), .CI(carry[4]), .CO(carry[5]), .S(SUM[4])
         );
  ADDFX2M U1_5 ( .A(A[5]), .B(B[5]), .CI(carry[5]), .CO(carry[6]), .S(SUM[5])
         );
  ADDFX2M U1_1 ( .A(A[1]), .B(B[1]), .CI(n1), .CO(carry[2]), .S(SUM[1]) );
  ADDFX2M U1_7 ( .A(A[7]), .B(B[7]), .CI(carry[7]), .CO(carry[8]), .S(SUM[7])
         );
  ADDFX2M U1_6 ( .A(A[6]), .B(B[6]), .CI(carry[6]), .CO(carry[7]), .S(SUM[6])
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
  wire   n7, n8, n9, n10, n11, n12, n13, n14, n15, n16, n17, n18, n19, n20,
         n21, n22, n23, n24, n25, n26, n27, n28, n29;

  NOR2X4M U2 ( .A(n8), .B(n7), .Y(n17) );
  OAI21BX4M U3 ( .A0(n21), .A1(n22), .B0N(n23), .Y(n19) );
  AOI2BB1X2M U4 ( .A0N(n9), .A1N(n12), .B0(n11), .Y(n26) );
  NOR2X2M U5 ( .A(B[11]), .B(A[11]), .Y(n21) );
  NOR2X2M U6 ( .A(B[9]), .B(A[9]), .Y(n12) );
  NOR2X2M U7 ( .A(B[10]), .B(A[10]), .Y(n25) );
  NOR2X2M U8 ( .A(B[8]), .B(A[8]), .Y(n15) );
  AOI21BX2M U9 ( .A0(n17), .A1(A[7]), .B0N(n29), .Y(n14) );
  OAI2BB1XLM U10 ( .A0N(n19), .A1N(A[12]), .B0(n20), .Y(n18) );
  INVX2M U11 ( .A(A[6]), .Y(n7) );
  INVX2M U12 ( .A(B[6]), .Y(n8) );
  BUFX2M U13 ( .A(A[0]), .Y(SUM[0]) );
  BUFX2M U14 ( .A(A[1]), .Y(SUM[1]) );
  BUFX2M U15 ( .A(A[2]), .Y(SUM[2]) );
  BUFX2M U16 ( .A(A[3]), .Y(SUM[3]) );
  BUFX2M U17 ( .A(A[4]), .Y(SUM[4]) );
  BUFX2M U18 ( .A(A[5]), .Y(SUM[5]) );
  XNOR2X1M U19 ( .A(n9), .B(n10), .Y(SUM[9]) );
  NOR2X1M U20 ( .A(n11), .B(n12), .Y(n10) );
  CLKXOR2X2M U21 ( .A(n13), .B(n14), .Y(SUM[8]) );
  NAND2BX1M U22 ( .AN(n15), .B(n16), .Y(n13) );
  XOR3XLM U23 ( .A(B[7]), .B(A[7]), .C(n17), .Y(SUM[7]) );
  AOI21X1M U24 ( .A0(n8), .A1(n7), .B0(n17), .Y(SUM[6]) );
  XOR3XLM U25 ( .A(B[13]), .B(A[13]), .C(n18), .Y(SUM[13]) );
  OAI21X1M U26 ( .A0(A[12]), .A1(n19), .B0(B[12]), .Y(n20) );
  XOR3XLM U27 ( .A(B[12]), .B(A[12]), .C(n19), .Y(SUM[12]) );
  XNOR2X1M U28 ( .A(n22), .B(n24), .Y(SUM[11]) );
  NOR2X1M U29 ( .A(n23), .B(n21), .Y(n24) );
  AND2X1M U30 ( .A(B[11]), .B(A[11]), .Y(n23) );
  OA21X1M U31 ( .A0(n25), .A1(n26), .B0(n27), .Y(n22) );
  CLKXOR2X2M U32 ( .A(n28), .B(n26), .Y(SUM[10]) );
  AND2X1M U33 ( .A(B[9]), .B(A[9]), .Y(n11) );
  OA21X1M U34 ( .A0(n14), .A1(n15), .B0(n16), .Y(n9) );
  CLKNAND2X2M U35 ( .A(B[8]), .B(A[8]), .Y(n16) );
  OAI21X1M U36 ( .A0(n17), .A1(A[7]), .B0(B[7]), .Y(n29) );
  NAND2BX1M U37 ( .AN(n25), .B(n27), .Y(n28) );
  CLKNAND2X2M U38 ( .A(B[10]), .B(A[10]), .Y(n27) );
endmodule


module arithmetic_unit_DW02_mult_0 ( A, B, TC, PRODUCT );
  input [7:0] A;
  input [7:0] B;
  output [15:0] PRODUCT;
  input TC;
  wire   \ab[7][7] , \ab[7][6] , \ab[7][5] , \ab[7][4] , \ab[7][3] ,
         \ab[7][2] , \ab[7][1] , \ab[7][0] , \ab[6][7] , \ab[6][6] ,
         \ab[6][5] , \ab[6][4] , \ab[6][3] , \ab[6][2] , \ab[6][1] ,
         \ab[6][0] , \ab[5][7] , \ab[5][6] , \ab[5][5] , \ab[5][4] ,
         \ab[5][3] , \ab[5][2] , \ab[5][1] , \ab[5][0] , \ab[4][7] ,
         \ab[4][6] , \ab[4][5] , \ab[4][4] , \ab[4][3] , \ab[4][2] ,
         \ab[4][1] , \ab[4][0] , \ab[3][7] , \ab[3][6] , \ab[3][5] ,
         \ab[3][4] , \ab[3][3] , \ab[3][2] , \ab[3][1] , \ab[3][0] ,
         \ab[2][7] , \ab[2][6] , \ab[2][5] , \ab[2][4] , \ab[2][3] ,
         \ab[2][2] , \ab[2][1] , \ab[2][0] , \ab[1][7] , \ab[1][6] ,
         \ab[1][5] , \ab[1][4] , \ab[1][3] , \ab[1][2] , \ab[1][1] ,
         \ab[1][0] , \ab[0][7] , \ab[0][6] , \ab[0][5] , \ab[0][4] ,
         \ab[0][3] , \ab[0][2] , \ab[0][1] , \CARRYB[7][7] , \CARRYB[7][6] ,
         \CARRYB[7][5] , \CARRYB[7][4] , \CARRYB[7][3] , \CARRYB[7][2] ,
         \CARRYB[7][1] , \CARRYB[7][0] , \CARRYB[6][6] , \CARRYB[6][5] ,
         \CARRYB[6][4] , \CARRYB[6][3] , \CARRYB[6][2] , \CARRYB[6][1] ,
         \CARRYB[6][0] , \CARRYB[5][6] , \CARRYB[5][5] , \CARRYB[5][4] ,
         \CARRYB[5][3] , \CARRYB[5][2] , \CARRYB[5][1] , \CARRYB[5][0] ,
         \CARRYB[4][6] , \CARRYB[4][5] , \CARRYB[4][4] , \CARRYB[4][3] ,
         \CARRYB[4][2] , \CARRYB[4][1] , \CARRYB[4][0] , \CARRYB[3][6] ,
         \CARRYB[3][5] , \CARRYB[3][4] , \CARRYB[3][3] , \CARRYB[3][2] ,
         \CARRYB[3][1] , \CARRYB[3][0] , \CARRYB[2][6] , \CARRYB[2][5] ,
         \CARRYB[2][4] , \CARRYB[2][3] , \CARRYB[2][2] , \CARRYB[2][1] ,
         \CARRYB[2][0] , \SUMB[7][7] , \SUMB[7][6] , \SUMB[7][5] ,
         \SUMB[7][4] , \SUMB[7][3] , \SUMB[7][2] , \SUMB[7][1] , \SUMB[7][0] ,
         \SUMB[6][6] , \SUMB[6][5] , \SUMB[6][4] , \SUMB[6][3] , \SUMB[6][2] ,
         \SUMB[6][1] , \SUMB[5][6] , \SUMB[5][5] , \SUMB[5][4] , \SUMB[5][3] ,
         \SUMB[5][2] , \SUMB[5][1] , \SUMB[4][6] , \SUMB[4][5] , \SUMB[4][4] ,
         \SUMB[4][3] , \SUMB[4][2] , \SUMB[4][1] , \SUMB[3][6] , \SUMB[3][5] ,
         \SUMB[3][4] , \SUMB[3][3] , \SUMB[3][2] , \SUMB[3][1] , \SUMB[2][6] ,
         \SUMB[2][5] , \SUMB[2][4] , \SUMB[2][3] , \SUMB[2][2] , \SUMB[2][1] ,
         \SUMB[1][6] , \SUMB[1][5] , \SUMB[1][4] , \SUMB[1][3] , \SUMB[1][2] ,
         \SUMB[1][1] , ZA, ZB, \A1[13] , \A1[12] , \A1[11] , \A1[10] , \A1[9] ,
         \A1[8] , \A1[7] , \A1[6] , \A1[5] , \A1[4] , \A1[3] , \A1[2] ,
         \A1[1] , \A1[0] , \A2[6] , n3, n4, n5, n6, n7, n8, n9, n10, n11, n12,
         n13, n14, n15, n16, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26,
         n27, n28, n29, n30, n31, n32;
  assign ZA = A[7];
  assign ZB = B[7];

  ADDFX2M S14_7_0 ( .A(ZA), .B(ZB), .CI(\SUMB[7][0] ), .CO(\A2[6] ), .S(
        \A1[5] ) );
  ADDFX2M S3_6_6 ( .A(\ab[6][6] ), .B(\CARRYB[5][6] ), .CI(\ab[5][7] ), .CO(
        \CARRYB[6][6] ), .S(\SUMB[6][6] ) );
  ADDFX2M S3_5_6 ( .A(\ab[5][6] ), .B(\CARRYB[4][6] ), .CI(\ab[4][7] ), .CO(
        \CARRYB[5][6] ), .S(\SUMB[5][6] ) );
  ADDFX2M S3_4_6 ( .A(\ab[4][6] ), .B(\CARRYB[3][6] ), .CI(\ab[3][7] ), .CO(
        \CARRYB[4][6] ), .S(\SUMB[4][6] ) );
  ADDFX2M S3_3_6 ( .A(\ab[3][6] ), .B(\CARRYB[2][6] ), .CI(\ab[2][7] ), .CO(
        \CARRYB[3][6] ), .S(\SUMB[3][6] ) );
  ADDFX2M S3_2_6 ( .A(\ab[2][6] ), .B(n9), .CI(\ab[1][7] ), .CO(\CARRYB[2][6] ), .S(\SUMB[2][6] ) );
  ADDFX2M S4_5 ( .A(\ab[7][5] ), .B(\CARRYB[6][5] ), .CI(\SUMB[6][6] ), .CO(
        \CARRYB[7][5] ), .S(\SUMB[7][5] ) );
  ADDFX2M S4_4 ( .A(\ab[7][4] ), .B(\CARRYB[6][4] ), .CI(\SUMB[6][5] ), .CO(
        \CARRYB[7][4] ), .S(\SUMB[7][4] ) );
  ADDFX2M S4_3 ( .A(\ab[7][3] ), .B(\CARRYB[6][3] ), .CI(\SUMB[6][4] ), .CO(
        \CARRYB[7][3] ), .S(\SUMB[7][3] ) );
  ADDFX2M S4_2 ( .A(\ab[7][2] ), .B(\CARRYB[6][2] ), .CI(\SUMB[6][3] ), .CO(
        \CARRYB[7][2] ), .S(\SUMB[7][2] ) );
  ADDFX2M S4_1 ( .A(\ab[7][1] ), .B(\CARRYB[6][1] ), .CI(\SUMB[6][2] ), .CO(
        \CARRYB[7][1] ), .S(\SUMB[7][1] ) );
  ADDFX2M S4_0 ( .A(\ab[7][0] ), .B(\CARRYB[6][0] ), .CI(\SUMB[6][1] ), .CO(
        \CARRYB[7][0] ), .S(\SUMB[7][0] ) );
  ADDFX2M S5_6 ( .A(\ab[7][6] ), .B(\CARRYB[6][6] ), .CI(\ab[6][7] ), .CO(
        \CARRYB[7][6] ), .S(\SUMB[7][6] ) );
  ADDFX2M S14_7 ( .A(n25), .B(n17), .CI(\ab[7][7] ), .CO(\CARRYB[7][7] ), .S(
        \SUMB[7][7] ) );
  ADDFX2M S1_6_0 ( .A(\ab[6][0] ), .B(\CARRYB[5][0] ), .CI(\SUMB[5][1] ), .CO(
        \CARRYB[6][0] ), .S(\A1[4] ) );
  ADDFX2M S1_5_0 ( .A(\ab[5][0] ), .B(\CARRYB[4][0] ), .CI(\SUMB[4][1] ), .CO(
        \CARRYB[5][0] ), .S(\A1[3] ) );
  ADDFX2M S1_4_0 ( .A(\ab[4][0] ), .B(\CARRYB[3][0] ), .CI(\SUMB[3][1] ), .CO(
        \CARRYB[4][0] ), .S(\A1[2] ) );
  ADDFX2M S1_3_0 ( .A(\ab[3][0] ), .B(\CARRYB[2][0] ), .CI(\SUMB[2][1] ), .CO(
        \CARRYB[3][0] ), .S(\A1[1] ) );
  ADDFX2M S2_6_5 ( .A(\ab[6][5] ), .B(\CARRYB[5][5] ), .CI(\SUMB[5][6] ), .CO(
        \CARRYB[6][5] ), .S(\SUMB[6][5] ) );
  ADDFX2M S2_6_4 ( .A(\ab[6][4] ), .B(\CARRYB[5][4] ), .CI(\SUMB[5][5] ), .CO(
        \CARRYB[6][4] ), .S(\SUMB[6][4] ) );
  ADDFX2M S2_5_5 ( .A(\ab[5][5] ), .B(\CARRYB[4][5] ), .CI(\SUMB[4][6] ), .CO(
        \CARRYB[5][5] ), .S(\SUMB[5][5] ) );
  ADDFX2M S2_6_3 ( .A(\ab[6][3] ), .B(\CARRYB[5][3] ), .CI(\SUMB[5][4] ), .CO(
        \CARRYB[6][3] ), .S(\SUMB[6][3] ) );
  ADDFX2M S2_5_4 ( .A(\ab[5][4] ), .B(\CARRYB[4][4] ), .CI(\SUMB[4][5] ), .CO(
        \CARRYB[5][4] ), .S(\SUMB[5][4] ) );
  ADDFX2M S2_6_2 ( .A(\ab[6][2] ), .B(\CARRYB[5][2] ), .CI(\SUMB[5][3] ), .CO(
        \CARRYB[6][2] ), .S(\SUMB[6][2] ) );
  ADDFX2M S2_4_5 ( .A(\ab[4][5] ), .B(\CARRYB[3][5] ), .CI(\SUMB[3][6] ), .CO(
        \CARRYB[4][5] ), .S(\SUMB[4][5] ) );
  ADDFX2M S2_6_1 ( .A(\ab[6][1] ), .B(\CARRYB[5][1] ), .CI(\SUMB[5][2] ), .CO(
        \CARRYB[6][1] ), .S(\SUMB[6][1] ) );
  ADDFX2M S2_5_3 ( .A(\ab[5][3] ), .B(\CARRYB[4][3] ), .CI(\SUMB[4][4] ), .CO(
        \CARRYB[5][3] ), .S(\SUMB[5][3] ) );
  ADDFX2M S2_5_1 ( .A(\ab[5][1] ), .B(\CARRYB[4][1] ), .CI(\SUMB[4][2] ), .CO(
        \CARRYB[5][1] ), .S(\SUMB[5][1] ) );
  ADDFX2M S2_5_2 ( .A(\ab[5][2] ), .B(\CARRYB[4][2] ), .CI(\SUMB[4][3] ), .CO(
        \CARRYB[5][2] ), .S(\SUMB[5][2] ) );
  ADDFX2M S2_4_4 ( .A(\ab[4][4] ), .B(\CARRYB[3][4] ), .CI(\SUMB[3][5] ), .CO(
        \CARRYB[4][4] ), .S(\SUMB[4][4] ) );
  ADDFX2M S2_4_1 ( .A(\ab[4][1] ), .B(\CARRYB[3][1] ), .CI(\SUMB[3][2] ), .CO(
        \CARRYB[4][1] ), .S(\SUMB[4][1] ) );
  ADDFX2M S2_4_2 ( .A(\ab[4][2] ), .B(\CARRYB[3][2] ), .CI(\SUMB[3][3] ), .CO(
        \CARRYB[4][2] ), .S(\SUMB[4][2] ) );
  ADDFX2M S2_4_3 ( .A(\ab[4][3] ), .B(\CARRYB[3][3] ), .CI(\SUMB[3][4] ), .CO(
        \CARRYB[4][3] ), .S(\SUMB[4][3] ) );
  ADDFX2M S2_3_5 ( .A(\ab[3][5] ), .B(\CARRYB[2][5] ), .CI(\SUMB[2][6] ), .CO(
        \CARRYB[3][5] ), .S(\SUMB[3][5] ) );
  ADDFX2M S2_3_1 ( .A(\ab[3][1] ), .B(\CARRYB[2][1] ), .CI(\SUMB[2][2] ), .CO(
        \CARRYB[3][1] ), .S(\SUMB[3][1] ) );
  ADDFX2M S2_3_2 ( .A(\ab[3][2] ), .B(\CARRYB[2][2] ), .CI(\SUMB[2][3] ), .CO(
        \CARRYB[3][2] ), .S(\SUMB[3][2] ) );
  ADDFX2M S2_3_3 ( .A(\ab[3][3] ), .B(\CARRYB[2][3] ), .CI(\SUMB[2][4] ), .CO(
        \CARRYB[3][3] ), .S(\SUMB[3][3] ) );
  ADDFX2M S2_3_4 ( .A(\ab[3][4] ), .B(\CARRYB[2][4] ), .CI(\SUMB[2][5] ), .CO(
        \CARRYB[3][4] ), .S(\SUMB[3][4] ) );
  ADDFX2M S1_2_0 ( .A(\ab[2][0] ), .B(n8), .CI(\SUMB[1][1] ), .CO(
        \CARRYB[2][0] ), .S(\A1[0] ) );
  ADDFX2M S2_2_1 ( .A(\ab[2][1] ), .B(n7), .CI(\SUMB[1][2] ), .CO(
        \CARRYB[2][1] ), .S(\SUMB[2][1] ) );
  ADDFX2M S2_2_2 ( .A(\ab[2][2] ), .B(n6), .CI(\SUMB[1][3] ), .CO(
        \CARRYB[2][2] ), .S(\SUMB[2][2] ) );
  ADDFX2M S2_2_3 ( .A(\ab[2][3] ), .B(n5), .CI(\SUMB[1][4] ), .CO(
        \CARRYB[2][3] ), .S(\SUMB[2][3] ) );
  ADDFX2M S2_2_4 ( .A(\ab[2][4] ), .B(n4), .CI(\SUMB[1][5] ), .CO(
        \CARRYB[2][4] ), .S(\SUMB[2][4] ) );
  ADDFX2M S2_2_5 ( .A(\ab[2][5] ), .B(n3), .CI(\SUMB[1][6] ), .CO(
        \CARRYB[2][5] ), .S(\SUMB[2][5] ) );
  AND2X2M U2 ( .A(\ab[0][6] ), .B(\ab[1][5] ), .Y(n3) );
  AND2X2M U3 ( .A(\ab[0][5] ), .B(\ab[1][4] ), .Y(n4) );
  AND2X2M U4 ( .A(\ab[0][4] ), .B(\ab[1][3] ), .Y(n5) );
  AND2X2M U5 ( .A(\ab[0][3] ), .B(\ab[1][2] ), .Y(n6) );
  AND2X2M U6 ( .A(\ab[0][2] ), .B(\ab[1][1] ), .Y(n7) );
  AND2X2M U7 ( .A(\ab[0][1] ), .B(\ab[1][0] ), .Y(n8) );
  AND2X2M U8 ( .A(\ab[0][7] ), .B(\ab[1][6] ), .Y(n9) );
  AND2X2M U9 ( .A(\CARRYB[7][6] ), .B(\SUMB[7][7] ), .Y(n10) );
  NOR2X2M U10 ( .A(n18), .B(n32), .Y(\ab[0][6] ) );
  NOR2X2M U11 ( .A(n23), .B(n32), .Y(\ab[0][1] ) );
  NOR2X2M U12 ( .A(n19), .B(n32), .Y(\ab[0][5] ) );
  NOR2X2M U13 ( .A(n20), .B(n32), .Y(\ab[0][4] ) );
  NOR2X2M U14 ( .A(n21), .B(n32), .Y(\ab[0][3] ) );
  NOR2X2M U15 ( .A(n22), .B(n32), .Y(\ab[0][2] ) );
  NOR2X2M U16 ( .A(n18), .B(n31), .Y(\ab[1][6] ) );
  NOR2X2M U17 ( .A(n24), .B(n31), .Y(\ab[1][0] ) );
  NOR2X2M U18 ( .A(n19), .B(n31), .Y(\ab[1][5] ) );
  NOR2X2M U19 ( .A(n20), .B(n31), .Y(\ab[1][4] ) );
  NOR2X2M U20 ( .A(n21), .B(n31), .Y(\ab[1][3] ) );
  NOR2X2M U21 ( .A(n22), .B(n31), .Y(\ab[1][2] ) );
  NOR2X2M U22 ( .A(n23), .B(n31), .Y(\ab[1][1] ) );
  NOR2X2M U23 ( .A(A[0]), .B(n17), .Y(\ab[0][7] ) );
  CLKXOR2X2M U24 ( .A(\CARRYB[7][1] ), .B(\SUMB[7][2] ), .Y(\A1[7] ) );
  CLKXOR2X2M U25 ( .A(\CARRYB[7][6] ), .B(\SUMB[7][7] ), .Y(\A1[12] ) );
  CLKXOR2X2M U26 ( .A(\CARRYB[7][2] ), .B(\SUMB[7][3] ), .Y(\A1[8] ) );
  CLKXOR2X2M U27 ( .A(\CARRYB[7][4] ), .B(\SUMB[7][5] ), .Y(\A1[10] ) );
  CLKXOR2X2M U28 ( .A(\CARRYB[7][3] ), .B(\SUMB[7][4] ), .Y(\A1[9] ) );
  CLKXOR2X2M U29 ( .A(\CARRYB[7][5] ), .B(\SUMB[7][6] ), .Y(\A1[11] ) );
  XOR2X1M U30 ( .A(\ab[1][0] ), .B(\ab[0][1] ), .Y(PRODUCT[1]) );
  CLKXOR2X2M U31 ( .A(\CARRYB[7][0] ), .B(\SUMB[7][1] ), .Y(\A1[6] ) );
  XOR2X1M U32 ( .A(\ab[1][6] ), .B(\ab[0][7] ), .Y(\SUMB[1][6] ) );
  XOR2X1M U33 ( .A(\ab[1][5] ), .B(\ab[0][6] ), .Y(\SUMB[1][5] ) );
  XOR2X1M U34 ( .A(\ab[1][4] ), .B(\ab[0][5] ), .Y(\SUMB[1][4] ) );
  XOR2X1M U35 ( .A(\ab[1][3] ), .B(\ab[0][4] ), .Y(\SUMB[1][3] ) );
  XOR2X1M U36 ( .A(\ab[1][2] ), .B(\ab[0][3] ), .Y(\SUMB[1][2] ) );
  XOR2X1M U37 ( .A(\ab[1][1] ), .B(\ab[0][2] ), .Y(\SUMB[1][1] ) );
  AND2X2M U38 ( .A(\CARRYB[7][1] ), .B(\SUMB[7][2] ), .Y(n11) );
  AND2X2M U39 ( .A(\CARRYB[7][3] ), .B(\SUMB[7][4] ), .Y(n12) );
  AND2X2M U40 ( .A(\CARRYB[7][0] ), .B(\SUMB[7][1] ), .Y(n13) );
  AND2X2M U41 ( .A(\CARRYB[7][5] ), .B(\SUMB[7][6] ), .Y(n14) );
  AND2X2M U42 ( .A(\CARRYB[7][2] ), .B(\SUMB[7][3] ), .Y(n15) );
  AND2X2M U43 ( .A(\CARRYB[7][4] ), .B(\SUMB[7][5] ), .Y(n16) );
  CLKINVX4M U44 ( .A(A[6]), .Y(n26) );
  INVX4M U45 ( .A(A[1]), .Y(n31) );
  INVX4M U46 ( .A(A[3]), .Y(n29) );
  INVX4M U47 ( .A(A[2]), .Y(n30) );
  INVX4M U48 ( .A(A[4]), .Y(n28) );
  INVX4M U49 ( .A(A[5]), .Y(n27) );
  CLKINVX4M U50 ( .A(B[6]), .Y(n18) );
  INVX4M U51 ( .A(A[0]), .Y(n32) );
  INVX4M U52 ( .A(B[1]), .Y(n23) );
  INVX4M U53 ( .A(B[5]), .Y(n19) );
  INVX4M U54 ( .A(B[4]), .Y(n20) );
  INVX4M U55 ( .A(B[0]), .Y(n24) );
  INVX4M U56 ( .A(B[3]), .Y(n21) );
  INVX4M U57 ( .A(B[2]), .Y(n22) );
  INVX4M U58 ( .A(ZA), .Y(n25) );
  INVX4M U59 ( .A(ZB), .Y(n17) );
  NOR2X1M U60 ( .A(n17), .B(n25), .Y(\ab[7][7] ) );
  NOR2X1M U61 ( .A(B[6]), .B(n25), .Y(\ab[7][6] ) );
  NOR2X1M U62 ( .A(B[5]), .B(n25), .Y(\ab[7][5] ) );
  NOR2X1M U63 ( .A(B[4]), .B(n25), .Y(\ab[7][4] ) );
  NOR2X1M U64 ( .A(B[3]), .B(n25), .Y(\ab[7][3] ) );
  NOR2X1M U65 ( .A(B[2]), .B(n25), .Y(\ab[7][2] ) );
  NOR2X1M U66 ( .A(B[1]), .B(n25), .Y(\ab[7][1] ) );
  NOR2X1M U67 ( .A(B[0]), .B(n25), .Y(\ab[7][0] ) );
  NOR2X1M U68 ( .A(A[6]), .B(n17), .Y(\ab[6][7] ) );
  NOR2X1M U69 ( .A(n26), .B(n18), .Y(\ab[6][6] ) );
  NOR2X1M U70 ( .A(n26), .B(n19), .Y(\ab[6][5] ) );
  NOR2X1M U71 ( .A(n26), .B(n20), .Y(\ab[6][4] ) );
  NOR2X1M U72 ( .A(n26), .B(n21), .Y(\ab[6][3] ) );
  NOR2X1M U73 ( .A(n26), .B(n22), .Y(\ab[6][2] ) );
  NOR2X1M U74 ( .A(n26), .B(n23), .Y(\ab[6][1] ) );
  NOR2X1M U75 ( .A(n26), .B(n24), .Y(\ab[6][0] ) );
  NOR2X1M U76 ( .A(A[5]), .B(n17), .Y(\ab[5][7] ) );
  NOR2X1M U77 ( .A(n18), .B(n27), .Y(\ab[5][6] ) );
  NOR2X1M U78 ( .A(n19), .B(n27), .Y(\ab[5][5] ) );
  NOR2X1M U79 ( .A(n20), .B(n27), .Y(\ab[5][4] ) );
  NOR2X1M U80 ( .A(n21), .B(n27), .Y(\ab[5][3] ) );
  NOR2X1M U81 ( .A(n22), .B(n27), .Y(\ab[5][2] ) );
  NOR2X1M U82 ( .A(n23), .B(n27), .Y(\ab[5][1] ) );
  NOR2X1M U83 ( .A(n24), .B(n27), .Y(\ab[5][0] ) );
  NOR2X1M U84 ( .A(A[4]), .B(n17), .Y(\ab[4][7] ) );
  NOR2X1M U85 ( .A(n18), .B(n28), .Y(\ab[4][6] ) );
  NOR2X1M U86 ( .A(n19), .B(n28), .Y(\ab[4][5] ) );
  NOR2X1M U87 ( .A(n20), .B(n28), .Y(\ab[4][4] ) );
  NOR2X1M U88 ( .A(n21), .B(n28), .Y(\ab[4][3] ) );
  NOR2X1M U89 ( .A(n22), .B(n28), .Y(\ab[4][2] ) );
  NOR2X1M U90 ( .A(n23), .B(n28), .Y(\ab[4][1] ) );
  NOR2X1M U91 ( .A(n24), .B(n28), .Y(\ab[4][0] ) );
  NOR2X1M U92 ( .A(A[3]), .B(n17), .Y(\ab[3][7] ) );
  NOR2X1M U93 ( .A(n18), .B(n29), .Y(\ab[3][6] ) );
  NOR2X1M U94 ( .A(n19), .B(n29), .Y(\ab[3][5] ) );
  NOR2X1M U95 ( .A(n20), .B(n29), .Y(\ab[3][4] ) );
  NOR2X1M U96 ( .A(n21), .B(n29), .Y(\ab[3][3] ) );
  NOR2X1M U97 ( .A(n22), .B(n29), .Y(\ab[3][2] ) );
  NOR2X1M U98 ( .A(n23), .B(n29), .Y(\ab[3][1] ) );
  NOR2X1M U99 ( .A(n24), .B(n29), .Y(\ab[3][0] ) );
  NOR2X1M U100 ( .A(A[2]), .B(n17), .Y(\ab[2][7] ) );
  NOR2X1M U101 ( .A(n18), .B(n30), .Y(\ab[2][6] ) );
  NOR2X1M U102 ( .A(n19), .B(n30), .Y(\ab[2][5] ) );
  NOR2X1M U103 ( .A(n20), .B(n30), .Y(\ab[2][4] ) );
  NOR2X1M U104 ( .A(n21), .B(n30), .Y(\ab[2][3] ) );
  NOR2X1M U105 ( .A(n22), .B(n30), .Y(\ab[2][2] ) );
  NOR2X1M U106 ( .A(n23), .B(n30), .Y(\ab[2][1] ) );
  NOR2X1M U107 ( .A(n24), .B(n30), .Y(\ab[2][0] ) );
  NOR2X1M U108 ( .A(A[1]), .B(n17), .Y(\ab[1][7] ) );
  NOR2X1M U109 ( .A(n24), .B(n32), .Y(PRODUCT[0]) );
  CLKINVX1M U111 ( .A(\CARRYB[7][7] ), .Y(\A1[13] ) );
  arithmetic_unit_DW01_add_1 FS_1 ( .A({\A1[13] , \A1[12] , \A1[11] , \A1[10] , 
        \A1[9] , \A1[8] , \A1[7] , \A1[6] , \A1[5] , \A1[4] , \A1[3] , \A1[2] , 
        \A1[1] , \A1[0] }), .B({n10, n14, n16, n12, n15, n11, n13, \A2[6] , 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0}), .CI(1'b0), .SUM(PRODUCT[15:2])
         );
endmodule


module arithmetic_unit_test_1 ( a, b, alu_fun, arith_en, clk, rst, arith_out, 
        ALU_Valid, test_si, test_se );
  input [7:0] a;
  input [7:0] b;
  input [1:0] alu_fun;
  output [15:0] arith_out;
  input arith_en, clk, rst, test_si, test_se;
  output ALU_Valid;
  wire   N19, N20, N21, N22, N23, N24, N25, N26, N27, N28, N29, N30, N31, N32,
         N33, N34, N35, N36, N37, N38, N39, N40, N41, N42, N43, N44, N45, N46,
         N47, N48, N49, N50, N51, N52, N55, N56, N57, N58, N59, N60, N61, N62,
         N87, N88, N89, N90, N91, N92, N93, N94, N95, N96, N97, N98, N99, N100,
         N101, N102, n25, n26, n27, n28, n29, n30, n31, n32, n33, n34, n35,
         n36, n37, n38, n39, n40, n41, n42, n43, n44, n45, n46, n47, n48, n49,
         n50, n3, n4, n5, n23, n24, n51, n52, n56, n57, n58, n59, n60, n61,
         n62, n63, n64, n65, n66, n67, n68, n69, n70;

  SDFFRQX1M \arith_out_reg[7]  ( .D(N94), .SI(arith_out[6]), .SE(n69), .CK(clk), .RN(n23), .Q(arith_out[7]) );
  SDFFRQX1M \arith_out_reg[6]  ( .D(N93), .SI(arith_out[5]), .SE(n62), .CK(clk), .RN(n23), .Q(arith_out[6]) );
  SDFFRQX1M \arith_out_reg[5]  ( .D(N92), .SI(arith_out[4]), .SE(n64), .CK(clk), .RN(n23), .Q(arith_out[5]) );
  SDFFRQX1M \arith_out_reg[4]  ( .D(N91), .SI(arith_out[3]), .SE(n60), .CK(clk), .RN(n23), .Q(arith_out[4]) );
  SDFFRQX1M \arith_out_reg[3]  ( .D(N90), .SI(arith_out[2]), .SE(n59), .CK(clk), .RN(n24), .Q(arith_out[3]) );
  SDFFRQX1M \arith_out_reg[2]  ( .D(N89), .SI(arith_out[1]), .SE(n63), .CK(clk), .RN(n24), .Q(arith_out[2]) );
  SDFFRQX1M \arith_out_reg[8]  ( .D(N95), .SI(arith_out[7]), .SE(n58), .CK(clk), .RN(n23), .Q(arith_out[8]) );
  SDFFRQX1M \arith_out_reg[1]  ( .D(N88), .SI(arith_out[0]), .SE(n60), .CK(clk), .RN(n24), .Q(arith_out[1]) );
  SDFFRQX1M \arith_out_reg[0]  ( .D(N87), .SI(ALU_Valid), .SE(n58), .CK(clk), 
        .RN(n24), .Q(arith_out[0]) );
  SDFFRQX1M ALU_Valid_reg ( .D(arith_en), .SI(test_si), .SE(n68), .CK(clk), 
        .RN(n24), .Q(ALU_Valid) );
  SDFFRQX1M \arith_out_reg[15]  ( .D(N102), .SI(arith_out[14]), .SE(n61), .CK(
        clk), .RN(n23), .Q(arith_out[15]) );
  SDFFRQX1M \arith_out_reg[14]  ( .D(N101), .SI(arith_out[13]), .SE(n70), .CK(
        clk), .RN(n23), .Q(arith_out[14]) );
  SDFFRQX1M \arith_out_reg[13]  ( .D(N100), .SI(arith_out[12]), .SE(n61), .CK(
        clk), .RN(n23), .Q(arith_out[13]) );
  SDFFRQX1M \arith_out_reg[12]  ( .D(N99), .SI(arith_out[11]), .SE(n62), .CK(
        clk), .RN(n23), .Q(arith_out[12]) );
  SDFFRQX1M \arith_out_reg[11]  ( .D(N98), .SI(arith_out[10]), .SE(n67), .CK(
        clk), .RN(n23), .Q(arith_out[11]) );
  SDFFRQX1M \arith_out_reg[10]  ( .D(N97), .SI(arith_out[9]), .SE(n63), .CK(
        clk), .RN(n23), .Q(arith_out[10]) );
  SDFFRQX1M \arith_out_reg[9]  ( .D(N96), .SI(arith_out[8]), .SE(n59), .CK(clk), .RN(n23), .Q(arith_out[9]) );
  NAND3X2M U22 ( .A(alu_fun[1]), .B(n52), .C(arith_en), .Y(n3) );
  CLKAND2X4M U23 ( .A(n46), .B(arith_en), .Y(n28) );
  CLKAND2X4M U24 ( .A(n45), .B(arith_en), .Y(n29) );
  INVX6M U25 ( .A(n51), .Y(n23) );
  INVX4M U26 ( .A(n3), .Y(n5) );
  INVX4M U27 ( .A(n3), .Y(n4) );
  INVX4M U28 ( .A(n51), .Y(n24) );
  CLKINVX1M U29 ( .A(alu_fun[0]), .Y(n52) );
  NOR2X2M U30 ( .A(n52), .B(alu_fun[1]), .Y(n46) );
  NOR2X2M U31 ( .A(alu_fun[0]), .B(alu_fun[1]), .Y(n45) );
  INVX2M U32 ( .A(rst), .Y(n51) );
  OAI2BB1X2M U33 ( .A0N(N45), .A1N(n5), .B0(n25), .Y(N95) );
  OAI2BB1X2M U34 ( .A0N(N46), .A1N(n4), .B0(n25), .Y(N96) );
  OAI2BB1X2M U35 ( .A0N(N47), .A1N(n5), .B0(n25), .Y(N97) );
  OAI2BB1X2M U36 ( .A0N(N48), .A1N(n4), .B0(n25), .Y(N98) );
  OAI2BB1X2M U37 ( .A0N(N49), .A1N(n5), .B0(n25), .Y(N99) );
  OAI2BB1X2M U38 ( .A0N(N50), .A1N(n4), .B0(n25), .Y(N100) );
  OAI2BB1X2M U39 ( .A0N(N51), .A1N(n5), .B0(n25), .Y(N101) );
  OAI2BB1X2M U40 ( .A0N(N52), .A1N(n4), .B0(n25), .Y(N102) );
  NAND2X2M U41 ( .A(n41), .B(n42), .Y(N88) );
  AOI22X1M U42 ( .A0(N29), .A1(n28), .B0(N20), .B1(n29), .Y(n42) );
  AOI22X1M U43 ( .A0(N56), .A1(n30), .B0(N38), .B1(n5), .Y(n41) );
  NAND2X2M U44 ( .A(n39), .B(n40), .Y(N89) );
  AOI22X1M U45 ( .A0(N30), .A1(n28), .B0(N21), .B1(n29), .Y(n40) );
  AOI22X1M U46 ( .A0(N57), .A1(n30), .B0(N39), .B1(n4), .Y(n39) );
  NAND2X2M U47 ( .A(n37), .B(n38), .Y(N90) );
  AOI22X1M U48 ( .A0(N31), .A1(n28), .B0(N22), .B1(n29), .Y(n38) );
  AOI22X1M U49 ( .A0(N58), .A1(n30), .B0(N40), .B1(n5), .Y(n37) );
  NAND2X2M U50 ( .A(n35), .B(n36), .Y(N91) );
  AOI22X1M U51 ( .A0(N32), .A1(n28), .B0(N23), .B1(n29), .Y(n36) );
  AOI22X1M U52 ( .A0(N59), .A1(n30), .B0(N41), .B1(n4), .Y(n35) );
  NAND2X2M U53 ( .A(n33), .B(n34), .Y(N92) );
  AOI22X1M U54 ( .A0(N33), .A1(n28), .B0(N24), .B1(n29), .Y(n34) );
  AOI22X1M U55 ( .A0(N60), .A1(n30), .B0(N42), .B1(n5), .Y(n33) );
  NAND2X2M U56 ( .A(n43), .B(n44), .Y(N87) );
  AOI22X1M U57 ( .A0(N55), .A1(n30), .B0(N37), .B1(n4), .Y(n43) );
  AOI22X1M U58 ( .A0(N28), .A1(n28), .B0(N19), .B1(n29), .Y(n44) );
  NAND2X2M U59 ( .A(n31), .B(n32), .Y(N93) );
  AOI22X1M U60 ( .A0(N61), .A1(n30), .B0(N43), .B1(n4), .Y(n31) );
  AOI22X1M U61 ( .A0(N34), .A1(n28), .B0(N25), .B1(n29), .Y(n32) );
  NAND2X2M U62 ( .A(n26), .B(n27), .Y(N94) );
  AOI22X1M U63 ( .A0(N62), .A1(n30), .B0(N44), .B1(n5), .Y(n26) );
  AOI22X1M U64 ( .A0(N35), .A1(n28), .B0(N26), .B1(n29), .Y(n27) );
  AND3X4M U65 ( .A(alu_fun[0]), .B(arith_en), .C(n47), .Y(n30) );
  AOI21BX1M U66 ( .A0(n48), .A1(n49), .B0N(alu_fun[1]), .Y(n47) );
  NOR4X2M U67 ( .A(b[3]), .B(b[2]), .C(b[1]), .D(b[0]), .Y(n48) );
  NOR4X1M U68 ( .A(b[7]), .B(b[6]), .C(b[5]), .D(b[4]), .Y(n49) );
  NAND2BX4M U69 ( .AN(n50), .B(arith_en), .Y(n25) );
  AOI22X1M U70 ( .A0(N36), .A1(n46), .B0(N27), .B1(n45), .Y(n50) );
  DLY1X1M U72 ( .A(n65), .Y(n56) );
  DLY1X1M U73 ( .A(n66), .Y(n57) );
  DLY1X1M U74 ( .A(n64), .Y(n58) );
  DLY1X1M U75 ( .A(n67), .Y(n59) );
  DLY1X1M U76 ( .A(n68), .Y(n60) );
  DLY1X1M U77 ( .A(n69), .Y(n61) );
  DLY1X1M U78 ( .A(n70), .Y(n62) );
  DLY1X1M U79 ( .A(n65), .Y(n63) );
  DLY1X1M U80 ( .A(n66), .Y(n64) );
  DLY1X1M U81 ( .A(test_se), .Y(n65) );
  DLY1X1M U82 ( .A(test_se), .Y(n66) );
  DLY1X1M U83 ( .A(n57), .Y(n67) );
  DLY1X1M U84 ( .A(n56), .Y(n68) );
  DLY1X1M U85 ( .A(n57), .Y(n69) );
  DLY1X1M U86 ( .A(n56), .Y(n70) );
  arithmetic_unit_DW_div_uns_0 div_30 ( .a(a), .b(b), .quotient({N62, N61, N60, 
        N59, N58, N57, N56, N55}) );
  arithmetic_unit_DW01_sub_0 sub_22 ( .A({a[7], a}), .B({b[7], b}), .CI(1'b0), 
        .DIFF({N36, N35, N34, N33, N32, N31, N30, N29, N28}) );
  arithmetic_unit_DW01_add_0 add_18 ( .A({a[7], a}), .B({b[7], b}), .CI(1'b0), 
        .SUM({N27, N26, N25, N24, N23, N22, N21, N20, N19}) );
  arithmetic_unit_DW02_mult_0 mult_26 ( .A(a), .B(b), .TC(1'b1), .PRODUCT({N52, 
        N51, N50, N49, N48, N47, N46, N45, N44, N43, N42, N41, N40, N39, N38, 
        N37}) );
endmodule


module logic_unit_test_1 ( a, b, alu_fun, logic_en, clk, rst, logic_out, 
        ALU_Valid, test_si, test_se );
  input [7:0] a;
  input [7:0] b;
  input [1:0] alu_fun;
  output [7:0] logic_out;
  input logic_en, clk, rst, test_si, test_se;
  output ALU_Valid;
  wire   N56, N57, N58, N59, N60, N61, N62, N63, n25, n26, n27, n28, n29, n30,
         n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44,
         n45, n46, n47, n48, n49, n50, n51, n52, n10, n11, n12, n13, n14, n15,
         n16, n17, n18, n19, n20, n21, n22, n23, n24, n53, n54, n55, n56, n59,
         n60, n61, n62, n63, n64, n65;

  SDFFRQX1M \logic_out_reg[7]  ( .D(N63), .SI(logic_out[6]), .SE(n62), .CK(clk), .RN(n12), .Q(logic_out[7]) );
  SDFFRQX1M \logic_out_reg[6]  ( .D(N62), .SI(logic_out[5]), .SE(n61), .CK(clk), .RN(n12), .Q(logic_out[6]) );
  SDFFRQX1M \logic_out_reg[5]  ( .D(N61), .SI(logic_out[4]), .SE(n60), .CK(clk), .RN(n12), .Q(logic_out[5]) );
  SDFFRQX1M \logic_out_reg[4]  ( .D(N60), .SI(logic_out[3]), .SE(n62), .CK(clk), .RN(n12), .Q(logic_out[4]) );
  SDFFRQX1M \logic_out_reg[3]  ( .D(N59), .SI(logic_out[2]), .SE(n61), .CK(clk), .RN(n12), .Q(logic_out[3]) );
  SDFFRQX1M \logic_out_reg[2]  ( .D(N58), .SI(logic_out[1]), .SE(n60), .CK(clk), .RN(n12), .Q(logic_out[2]) );
  SDFFRQX1M \logic_out_reg[1]  ( .D(N57), .SI(logic_out[0]), .SE(n65), .CK(clk), .RN(n12), .Q(logic_out[1]) );
  SDFFRQX1M \logic_out_reg[0]  ( .D(N56), .SI(ALU_Valid), .SE(n64), .CK(clk), 
        .RN(n12), .Q(logic_out[0]) );
  SDFFRQX1M ALU_Valid_reg ( .D(logic_en), .SI(test_si), .SE(n63), .CK(clk), 
        .RN(n12), .Q(ALU_Valid) );
  NAND2X4M U12 ( .A(logic_en), .B(n14), .Y(n33) );
  NAND2X4M U13 ( .A(logic_en), .B(alu_fun[1]), .Y(n34) );
  CLKINVX1M U14 ( .A(alu_fun[1]), .Y(n14) );
  CLKBUFX8M U15 ( .A(n29), .Y(n11) );
  NAND3XLM U16 ( .A(alu_fun[0]), .B(n14), .C(logic_en), .Y(n29) );
  CLKBUFX8M U17 ( .A(n28), .Y(n10) );
  NAND3BXLM U18 ( .AN(alu_fun[0]), .B(alu_fun[1]), .C(logic_en), .Y(n28) );
  INVX6M U19 ( .A(n13), .Y(n12) );
  INVX2M U20 ( .A(rst), .Y(n13) );
  OAI221X1M U21 ( .A0(a[6]), .A1(n10), .B0(n22), .B1(n11), .C0(n30), .Y(N62)
         );
  AOI22X1M U22 ( .A0(n31), .A1(n15), .B0(b[6]), .B1(n32), .Y(n30) );
  INVXLM U23 ( .A(b[6]), .Y(n15) );
  OAI21X2M U24 ( .A0(n33), .A1(n22), .B0(n11), .Y(n32) );
  OAI221X1M U25 ( .A0(a[1]), .A1(n10), .B0(n11), .B1(n55), .C0(n47), .Y(N57)
         );
  AOI22X1M U26 ( .A0(n48), .A1(n20), .B0(b[1]), .B1(n49), .Y(n47) );
  INVX2M U27 ( .A(b[1]), .Y(n20) );
  OAI21X2M U28 ( .A0(n33), .A1(n55), .B0(n11), .Y(n49) );
  OAI221X1M U29 ( .A0(a[2]), .A1(n10), .B0(n11), .B1(n54), .C0(n44), .Y(N58)
         );
  AOI22X1M U30 ( .A0(n45), .A1(n19), .B0(b[2]), .B1(n46), .Y(n44) );
  INVX2M U31 ( .A(b[2]), .Y(n19) );
  OAI21X2M U32 ( .A0(n33), .A1(n54), .B0(n11), .Y(n46) );
  OAI221X1M U33 ( .A0(a[3]), .A1(n10), .B0(n11), .B1(n53), .C0(n41), .Y(N59)
         );
  AOI22X1M U34 ( .A0(n42), .A1(n18), .B0(b[3]), .B1(n43), .Y(n41) );
  INVX2M U35 ( .A(b[3]), .Y(n18) );
  OAI21X2M U36 ( .A0(n33), .A1(n53), .B0(n11), .Y(n43) );
  OAI221X1M U37 ( .A0(a[4]), .A1(n10), .B0(n11), .B1(n24), .C0(n38), .Y(N60)
         );
  AOI22X1M U38 ( .A0(n39), .A1(n17), .B0(b[4]), .B1(n40), .Y(n38) );
  INVX2M U39 ( .A(b[4]), .Y(n17) );
  OAI21X2M U40 ( .A0(n33), .A1(n24), .B0(n11), .Y(n40) );
  OAI221X1M U41 ( .A0(a[5]), .A1(n10), .B0(n11), .B1(n23), .C0(n35), .Y(N61)
         );
  AOI22X1M U42 ( .A0(n36), .A1(n16), .B0(b[5]), .B1(n37), .Y(n35) );
  INVX2M U43 ( .A(b[5]), .Y(n16) );
  OAI21X2M U44 ( .A0(n33), .A1(n23), .B0(n11), .Y(n37) );
  OAI221X1M U45 ( .A0(a[0]), .A1(n10), .B0(n11), .B1(n56), .C0(n50), .Y(N56)
         );
  AOI22X1M U46 ( .A0(n51), .A1(n21), .B0(b[0]), .B1(n52), .Y(n50) );
  INVX2M U47 ( .A(b[0]), .Y(n21) );
  OAI21X2M U48 ( .A0(n33), .A1(n56), .B0(n11), .Y(n52) );
  CLKINVX1M U49 ( .A(a[6]), .Y(n22) );
  CLKINVX1M U50 ( .A(a[1]), .Y(n55) );
  CLKINVX1M U51 ( .A(a[2]), .Y(n54) );
  CLKINVX1M U52 ( .A(a[3]), .Y(n53) );
  CLKINVX1M U53 ( .A(a[4]), .Y(n24) );
  CLKINVX1M U54 ( .A(a[5]), .Y(n23) );
  INVX2M U55 ( .A(a[0]), .Y(n56) );
  OAI21X2M U56 ( .A0(a[0]), .A1(n34), .B0(n10), .Y(n51) );
  OAI21X1M U57 ( .A0(a[1]), .A1(n34), .B0(n10), .Y(n48) );
  OAI21X1M U58 ( .A0(a[2]), .A1(n34), .B0(n10), .Y(n45) );
  OAI21X1M U59 ( .A0(a[3]), .A1(n34), .B0(n10), .Y(n42) );
  OAI21X1M U60 ( .A0(a[4]), .A1(n34), .B0(n10), .Y(n39) );
  OAI21X1M U61 ( .A0(a[5]), .A1(n34), .B0(n10), .Y(n36) );
  OAI21X1M U62 ( .A0(a[6]), .A1(n34), .B0(n10), .Y(n31) );
  NOR2BX2M U63 ( .AN(logic_en), .B(n25), .Y(N63) );
  XNOR2X1M U64 ( .A(alu_fun[1]), .B(n26), .Y(n25) );
  OAI2BB1XLM U65 ( .A0N(a[7]), .A1N(alu_fun[0]), .B0(n27), .Y(n26) );
  OAI21X1M U66 ( .A0(a[7]), .A1(alu_fun[0]), .B0(b[7]), .Y(n27) );
  DLY1X1M U67 ( .A(test_se), .Y(n59) );
  DLY1X1M U68 ( .A(n63), .Y(n60) );
  DLY1X1M U69 ( .A(n64), .Y(n61) );
  DLY1X1M U70 ( .A(n65), .Y(n62) );
  DLY1X1M U71 ( .A(n59), .Y(n63) );
  DLY1X1M U72 ( .A(n59), .Y(n64) );
  DLY1X1M U73 ( .A(test_se), .Y(n65) );
endmodule


module cmp_unit_test_1 ( a, b, alu_fun, cmp_en, clk, rst, cmp_out, ALU_Valid, 
        test_si, test_se );
  input [7:0] a;
  input [7:0] b;
  input [1:0] alu_fun;
  output [1:0] cmp_out;
  input cmp_en, clk, rst, test_si, test_se;
  output ALU_Valid;
  wire   N18, N20, N23, N24, n13, n14, n1, n2, n3, n4, n5, n6, n10, n11, n12,
         n15, n16, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28,
         n29, n30, n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42,
         n43, n44, n45, n48;

  SDFFRQX1M ALU_Valid_reg ( .D(cmp_en), .SI(test_si), .SE(n48), .CK(clk), .RN(
        n1), .Q(ALU_Valid) );
  SDFFRQX1M \cmp_out_reg[1]  ( .D(N24), .SI(cmp_out[0]), .SE(n48), .CK(clk), 
        .RN(n1), .Q(cmp_out[1]) );
  SDFFRQX1M \cmp_out_reg[0]  ( .D(N23), .SI(ALU_Valid), .SE(test_se), .CK(clk), 
        .RN(n1), .Q(cmp_out[0]) );
  AOI2B1X1M U5 ( .A1N(n31), .A0(n30), .B0(n29), .Y(n32) );
  INVX2M U7 ( .A(n32), .Y(n42) );
  OAI21X4M U8 ( .A0(n29), .A1(n12), .B0(n30), .Y(N20) );
  AOI211X2M U9 ( .A0(n17), .A1(n33), .B0(n16), .C0(n15), .Y(n18) );
  XNOR2X4M U10 ( .A(a[6]), .B(b[6]), .Y(n26) );
  OAI31X2M U11 ( .A0(n19), .A1(n5), .A2(n4), .B0(n20), .Y(n10) );
  AOI211X2M U12 ( .A0(a[1]), .A1(n36), .B0(n16), .C0(n3), .Y(n4) );
  NOR2X2M U13 ( .A(n41), .B(a[7]), .Y(n29) );
  NOR2X2M U14 ( .A(n39), .B(a[3]), .Y(n19) );
  NOR2X2M U15 ( .A(n37), .B(a[2]), .Y(n5) );
  NOR2X2M U16 ( .A(n35), .B(a[0]), .Y(n2) );
  NAND2X1M U17 ( .A(a[7]), .B(n41), .Y(n30) );
  INVX2M U18 ( .A(cmp_en), .Y(n45) );
  CLKINVX1M U19 ( .A(alu_fun[1]), .Y(n44) );
  CLKINVX1M U20 ( .A(alu_fun[0]), .Y(n43) );
  BUFX2M U21 ( .A(rst), .Y(n1) );
  NOR3X2M U22 ( .A(n45), .B(n14), .C(n43), .Y(N23) );
  AOI22X1M U23 ( .A0(N18), .A1(n44), .B0(alu_fun[1]), .B1(N20), .Y(n14) );
  NOR3X2M U24 ( .A(n45), .B(n13), .C(n44), .Y(N24) );
  AOI22X1M U25 ( .A0(n42), .A1(n43), .B0(alu_fun[0]), .B1(N20), .Y(n13) );
  INVXLM U26 ( .A(a[6]), .Y(n34) );
  INVX2M U27 ( .A(b[6]), .Y(n40) );
  INVXLM U28 ( .A(n2), .Y(n36) );
  INVXLM U29 ( .A(n18), .Y(n38) );
  CLKINVX2M U30 ( .A(a[1]), .Y(n33) );
  INVX2M U31 ( .A(b[7]), .Y(n41) );
  INVX2M U32 ( .A(b[0]), .Y(n35) );
  INVX2M U33 ( .A(b[3]), .Y(n39) );
  INVX2M U34 ( .A(b[2]), .Y(n37) );
  NAND2BX1M U35 ( .AN(b[4]), .B(a[4]), .Y(n22) );
  NAND2BX1M U36 ( .AN(a[4]), .B(b[4]), .Y(n6) );
  CLKNAND2X2M U37 ( .A(n22), .B(n6), .Y(n24) );
  CLKNAND2X2M U38 ( .A(a[2]), .B(n37), .Y(n21) );
  NAND2BX1M U39 ( .AN(n5), .B(n21), .Y(n16) );
  AOI21X1M U40 ( .A0(n2), .A1(n33), .B0(b[1]), .Y(n3) );
  CLKNAND2X2M U41 ( .A(a[3]), .B(n39), .Y(n20) );
  NAND2BX1M U42 ( .AN(a[5]), .B(b[5]), .Y(n27) );
  OAI211X1M U43 ( .A0(n24), .A1(n10), .B0(n6), .C0(n27), .Y(n11) );
  NAND2BX1M U44 ( .AN(b[5]), .B(a[5]), .Y(n23) );
  AOI32X1M U45 ( .A0(n11), .A1(n23), .A2(n26), .B0(b[6]), .B1(n34), .Y(n12) );
  CLKNAND2X2M U46 ( .A(a[0]), .B(n35), .Y(n17) );
  OA21X1M U47 ( .A0(n17), .A1(n33), .B0(b[1]), .Y(n15) );
  AOI31X1M U48 ( .A0(n38), .A1(n21), .A2(n20), .B0(n19), .Y(n25) );
  OAI2B11X1M U49 ( .A1N(n25), .A0(n24), .B0(n23), .C0(n22), .Y(n28) );
  AOI32X1M U50 ( .A0(n28), .A1(n27), .A2(n26), .B0(a[6]), .B1(n40), .Y(n31) );
  NOR2X1M U51 ( .A(N20), .B(n42), .Y(N18) );
  DLY1X1M U52 ( .A(test_se), .Y(n48) );
endmodule


module shift_unit_test_1 ( a, b, alu_fun, shift_en, clk, rst, shift_out, 
        ALU_Valid, test_si, test_se );
  input [7:0] a;
  input [7:0] b;
  input [1:0] alu_fun;
  output [8:0] shift_out;
  input shift_en, clk, rst, test_si, test_se;
  output ALU_Valid;
  wire   N25, N26, N27, N28, N29, N30, N31, N32, N33, n14, n15, n16, n17, n18,
         n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32,
         n11, n12, n13, n33, n34, n37, n38, n39, n40, n41, n42, n43, n44;

  SDFFRQX1M \shift_out_reg[8]  ( .D(N33), .SI(shift_out[7]), .SE(n38), .CK(clk), .RN(n11), .Q(shift_out[8]) );
  SDFFRQX1M ALU_Valid_reg ( .D(shift_en), .SI(test_si), .SE(n37), .CK(clk), 
        .RN(n11), .Q(ALU_Valid) );
  SDFFRQX1M \shift_out_reg[1]  ( .D(N26), .SI(shift_out[0]), .SE(n44), .CK(clk), .RN(n11), .Q(shift_out[1]) );
  SDFFRQX1M \shift_out_reg[0]  ( .D(N25), .SI(ALU_Valid), .SE(n43), .CK(clk), 
        .RN(n11), .Q(shift_out[0]) );
  SDFFRQX1M \shift_out_reg[7]  ( .D(N32), .SI(shift_out[6]), .SE(n38), .CK(clk), .RN(n11), .Q(shift_out[7]) );
  SDFFRQX1M \shift_out_reg[6]  ( .D(N31), .SI(shift_out[5]), .SE(n37), .CK(clk), .RN(n11), .Q(shift_out[6]) );
  SDFFRQX1M \shift_out_reg[5]  ( .D(N30), .SI(shift_out[4]), .SE(n44), .CK(clk), .RN(n11), .Q(shift_out[5]) );
  SDFFRQX1M \shift_out_reg[4]  ( .D(N29), .SI(shift_out[3]), .SE(n43), .CK(clk), .RN(n11), .Q(shift_out[4]) );
  SDFFRQX1M \shift_out_reg[3]  ( .D(N28), .SI(shift_out[2]), .SE(n42), .CK(clk), .RN(n11), .Q(shift_out[3]) );
  SDFFRQX1M \shift_out_reg[2]  ( .D(N27), .SI(shift_out[1]), .SE(n41), .CK(clk), .RN(n11), .Q(shift_out[2]) );
  NOR2X8M U13 ( .A(alu_fun[0]), .B(alu_fun[1]), .Y(n21) );
  CLKINVX1M U14 ( .A(alu_fun[1]), .Y(n33) );
  CLKINVX1M U15 ( .A(alu_fun[0]), .Y(n13) );
  INVX4M U16 ( .A(shift_en), .Y(n34) );
  NOR2X8M U17 ( .A(n33), .B(n13), .Y(n15) );
  NOR2X8M U18 ( .A(n13), .B(alu_fun[1]), .Y(n16) );
  NOR2X8M U19 ( .A(n33), .B(alu_fun[0]), .Y(n20) );
  INVX6M U20 ( .A(n12), .Y(n11) );
  INVX2M U21 ( .A(rst), .Y(n12) );
  AOI21X2M U22 ( .A0(n26), .A1(n27), .B0(n34), .Y(N28) );
  AOI22X1M U23 ( .A0(b[2]), .A1(n15), .B0(b[4]), .B1(n20), .Y(n27) );
  AOI22X1M U24 ( .A0(a[2]), .A1(n16), .B0(a[4]), .B1(n21), .Y(n26) );
  AOI21X2M U25 ( .A0(n28), .A1(n29), .B0(n34), .Y(N27) );
  AOI22X1M U26 ( .A0(b[1]), .A1(n15), .B0(b[3]), .B1(n20), .Y(n29) );
  AOI22X1M U27 ( .A0(a[1]), .A1(n16), .B0(a[3]), .B1(n21), .Y(n28) );
  AOI21X2M U28 ( .A0(n30), .A1(n31), .B0(n34), .Y(N26) );
  AOI22X1M U29 ( .A0(b[0]), .A1(n15), .B0(b[2]), .B1(n20), .Y(n31) );
  AOI22X1M U30 ( .A0(a[0]), .A1(n16), .B0(a[2]), .B1(n21), .Y(n30) );
  AOI21X2M U31 ( .A0(n18), .A1(n19), .B0(n34), .Y(N31) );
  AOI22X1M U32 ( .A0(b[5]), .A1(n15), .B0(n20), .B1(b[7]), .Y(n19) );
  AOI22X1M U33 ( .A0(a[5]), .A1(n16), .B0(n21), .B1(a[7]), .Y(n18) );
  AOI21X2M U34 ( .A0(n22), .A1(n23), .B0(n34), .Y(N30) );
  AOI22X1M U35 ( .A0(b[4]), .A1(n15), .B0(n20), .B1(b[6]), .Y(n23) );
  AOI22X1M U36 ( .A0(a[4]), .A1(n16), .B0(n21), .B1(a[6]), .Y(n22) );
  AOI21X2M U37 ( .A0(n24), .A1(n25), .B0(n34), .Y(N29) );
  AOI22X1M U38 ( .A0(b[3]), .A1(n15), .B0(n20), .B1(b[5]), .Y(n25) );
  AOI22X1M U39 ( .A0(a[3]), .A1(n16), .B0(n21), .B1(a[5]), .Y(n24) );
  NOR2X2M U40 ( .A(n14), .B(n34), .Y(N33) );
  AOI22X1M U41 ( .A0(b[7]), .A1(n15), .B0(a[7]), .B1(n16), .Y(n14) );
  NOR2X2M U42 ( .A(n17), .B(n34), .Y(N32) );
  AOI22X1M U43 ( .A0(b[6]), .A1(n15), .B0(a[6]), .B1(n16), .Y(n17) );
  NOR2X2M U44 ( .A(n32), .B(n34), .Y(N25) );
  AOI22X1M U45 ( .A0(b[1]), .A1(n20), .B0(a[1]), .B1(n21), .Y(n32) );
  DLY1X1M U46 ( .A(n41), .Y(n37) );
  DLY1X1M U47 ( .A(n42), .Y(n38) );
  DLY1X1M U48 ( .A(test_se), .Y(n39) );
  DLY1X1M U49 ( .A(test_se), .Y(n40) );
  DLY1X1M U50 ( .A(n40), .Y(n41) );
  DLY1X1M U51 ( .A(n39), .Y(n42) );
  DLY1X1M U52 ( .A(n40), .Y(n43) );
  DLY1X1M U53 ( .A(n39), .Y(n44) );
endmodule


module alu_top_test_1 ( a, b, alu_fun, clk, rst, ALU_OUT, ALU_Valid, test_si, 
        test_so, test_se );
  input [7:0] a;
  input [7:0] b;
  input [3:0] alu_fun;
  output [15:0] ALU_OUT;
  input clk, rst, test_si, test_se;
  output ALU_Valid, test_so;
  wire   arith_en, logic_en, cmp_en, shift_en, arith_valid, logic_valid,
         cmp_valid, shift_valid, n2, n3, n4, n6, n7, n8, n9, n10, n11, n12,
         n13, n14, n15, n16, n17, n18, n1, n5, n19, n20, n21, n22, n23, n24,
         n25, n28, n29, n30, n31, n32, n33, n34;
  wire   [15:0] arith_out;
  wire   [7:0] logic_out;
  wire   [1:0] cmp_out;
  wire   [8:0] shift_out;
  assign test_so = shift_out[8];

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
  BUFX4M U15 ( .A(n7), .Y(n20) );
  NOR2X1M U16 ( .A(alu_fun[2]), .B(alu_fun[3]), .Y(n7) );
  NAND2X2M U17 ( .A(alu_fun[3]), .B(alu_fun[2]), .Y(n5) );
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
  DLY1X1M U44 ( .A(test_se), .Y(n28) );
  DLY1X1M U45 ( .A(n28), .Y(n29) );
  DLY1X1M U46 ( .A(n28), .Y(n30) );
  DLY1X1M U47 ( .A(n30), .Y(n31) );
  DLY1X1M U48 ( .A(n29), .Y(n32) );
  DLY1X1M U49 ( .A(n30), .Y(n33) );
  DLY1X1M U50 ( .A(n29), .Y(n34) );
  decoder u0 ( .alu_fun(alu_fun[3:2]), .arith_en(arith_en), .logic_en(logic_en), .cmp_en(cmp_en), .shift_en(shift_en) );
  arithmetic_unit_test_1 u1 ( .a(a), .b(b), .alu_fun(alu_fun[1:0]), .arith_en(
        arith_en), .clk(clk), .rst(n23), .arith_out(arith_out), .ALU_Valid(
        arith_valid), .test_si(test_si), .test_se(n34) );
  logic_unit_test_1 u2 ( .a(a), .b(b), .alu_fun(alu_fun[1:0]), .logic_en(
        logic_en), .clk(clk), .rst(n23), .logic_out(logic_out), .ALU_Valid(
        logic_valid), .test_si(arith_out[15]), .test_se(n32) );
  cmp_unit_test_1 u3 ( .a(a), .b(b), .alu_fun(alu_fun[1:0]), .cmp_en(cmp_en), 
        .clk(clk), .rst(n23), .cmp_out(cmp_out), .ALU_Valid(cmp_valid), 
        .test_si(logic_out[7]), .test_se(n31) );
  shift_unit_test_1 u4 ( .a(a), .b(b), .alu_fun(alu_fun[1:0]), .shift_en(
        shift_en), .clk(clk), .rst(n23), .shift_out(shift_out), .ALU_Valid(
        shift_valid), .test_si(cmp_out[1]), .test_se(n33) );
endmodule


module Data_Sync_test_1 ( Unsync_bus, bus_enable, clk, rst, sync_bus, 
        enable_pulse, test_si, test_se );
  input [7:0] Unsync_bus;
  output [7:0] sync_bus;
  input bus_enable, clk, rst, test_si, test_se;
  output enable_pulse;
  wire   pulse_flop, n1, n3, n5, n7, n9, n11, n13, n15, n17, n32, n33, n34,
         n35, n36, n39, n40, n41, n42, n43, n44, n45, n46, n47, n48, n49, n50,
         n51, n52, n53, n54, n55, n56;
  wire   [7:0] meta_flop;

  SDFFRQX2M pulse_flop_reg ( .D(meta_flop[7]), .SI(meta_flop[7]), .SE(n46), 
        .CK(clk), .RN(n33), .Q(pulse_flop) );
  SDFFRQX2M \meta_flop_reg[7]  ( .D(meta_flop[6]), .SI(meta_flop[6]), .SE(n45), 
        .CK(clk), .RN(n33), .Q(meta_flop[7]) );
  SDFFRQX2M \sync_bus_reg[7]  ( .D(n17), .SI(sync_bus[6]), .SE(n44), .CK(clk), 
        .RN(n33), .Q(sync_bus[7]) );
  SDFFRQX2M \sync_bus_reg[5]  ( .D(n13), .SI(sync_bus[4]), .SE(n43), .CK(clk), 
        .RN(n34), .Q(sync_bus[5]) );
  SDFFRQX2M \sync_bus_reg[3]  ( .D(n9), .SI(sync_bus[2]), .SE(n42), .CK(clk), 
        .RN(n34), .Q(sync_bus[3]) );
  SDFFRQX2M \sync_bus_reg[1]  ( .D(n5), .SI(n56), .SE(n41), .CK(clk), .RN(n34), 
        .Q(sync_bus[1]) );
  SDFFRQX2M \meta_flop_reg[0]  ( .D(bus_enable), .SI(enable_pulse), .SE(n53), 
        .CK(clk), .RN(n33), .Q(meta_flop[0]) );
  SDFFRQX2M \meta_flop_reg[1]  ( .D(meta_flop[0]), .SI(meta_flop[0]), .SE(n52), 
        .CK(clk), .RN(n33), .Q(meta_flop[1]) );
  SDFFRQX2M \meta_flop_reg[2]  ( .D(meta_flop[1]), .SI(meta_flop[1]), .SE(n44), 
        .CK(clk), .RN(n33), .Q(meta_flop[2]) );
  SDFFRQX2M \meta_flop_reg[3]  ( .D(meta_flop[2]), .SI(meta_flop[2]), .SE(n43), 
        .CK(clk), .RN(n33), .Q(meta_flop[3]) );
  SDFFRQX2M \meta_flop_reg[4]  ( .D(meta_flop[3]), .SI(meta_flop[3]), .SE(n42), 
        .CK(clk), .RN(n33), .Q(meta_flop[4]) );
  SDFFRQX2M \meta_flop_reg[5]  ( .D(meta_flop[4]), .SI(meta_flop[4]), .SE(n41), 
        .CK(clk), .RN(n33), .Q(meta_flop[5]) );
  SDFFRQX2M \meta_flop_reg[6]  ( .D(meta_flop[5]), .SI(meta_flop[5]), .SE(n46), 
        .CK(clk), .RN(n33), .Q(meta_flop[6]) );
  SDFFRQX2M \sync_bus_reg[0]  ( .D(n3), .SI(pulse_flop), .SE(n45), .CK(clk), 
        .RN(n34), .Q(sync_bus[0]) );
  INVX4M U7 ( .A(n1), .Y(n36) );
  INVX6M U8 ( .A(n35), .Y(n33) );
  INVX4M U9 ( .A(n35), .Y(n34) );
  BUFX4M U10 ( .A(n1), .Y(n32) );
  INVX2M U11 ( .A(rst), .Y(n35) );
  NAND2BX2M U12 ( .AN(pulse_flop), .B(meta_flop[7]), .Y(n1) );
  AO22X1M U31 ( .A0(Unsync_bus[2]), .A1(n36), .B0(sync_bus[2]), .B1(n32), .Y(
        n7) );
  AO22X1M U32 ( .A0(Unsync_bus[4]), .A1(n36), .B0(sync_bus[4]), .B1(n32), .Y(
        n11) );
  AO22X1M U33 ( .A0(Unsync_bus[6]), .A1(n36), .B0(sync_bus[6]), .B1(n32), .Y(
        n15) );
  AO22X1M U34 ( .A0(Unsync_bus[0]), .A1(n36), .B0(n56), .B1(n32), .Y(n3) );
  AO22X1M U35 ( .A0(Unsync_bus[5]), .A1(n36), .B0(sync_bus[5]), .B1(n32), .Y(
        n13) );
  AO22X1M U36 ( .A0(Unsync_bus[1]), .A1(n36), .B0(sync_bus[1]), .B1(n32), .Y(
        n5) );
  AO22X1M U37 ( .A0(Unsync_bus[3]), .A1(n36), .B0(sync_bus[3]), .B1(n32), .Y(
        n9) );
  AO22X1M U38 ( .A0(Unsync_bus[7]), .A1(n36), .B0(sync_bus[7]), .B1(n32), .Y(
        n17) );
  DLY1X1M U39 ( .A(n49), .Y(n39) );
  DLY1X1M U40 ( .A(n39), .Y(n40) );
  DLY1X1M U41 ( .A(n47), .Y(n41) );
  DLY1X1M U42 ( .A(n48), .Y(n42) );
  DLY1X1M U43 ( .A(n54), .Y(n43) );
  DLY1X1M U44 ( .A(n55), .Y(n44) );
  DLY1X1M U45 ( .A(n52), .Y(n45) );
  DLY1X1M U46 ( .A(n53), .Y(n46) );
  DLY1X1M U48 ( .A(n50), .Y(n48) );
  DLY1X1M U49 ( .A(test_se), .Y(n49) );
  DLY1X1M U50 ( .A(n39), .Y(n50) );
  DLY1X1M U51 ( .A(n49), .Y(n51) );
  DLY1X1M U52 ( .A(n51), .Y(n52) );
  DLY1X1M U53 ( .A(n50), .Y(n53) );
  DLY1X1M U54 ( .A(n51), .Y(n54) );
  DLY1X1M U56 ( .A(sync_bus[0]), .Y(n56) );
  SDFFRQX4M enable_pulse_reg ( .D(n36), .SI(test_si), .SE(n55), .CK(clk), .RN(
        n33), .Q(enable_pulse) );
  SDFFRQX4M \sync_bus_reg[2]  ( .D(n7), .SI(sync_bus[1]), .SE(n54), .CK(clk), 
        .RN(n34), .Q(sync_bus[2]) );
  SDFFRQX4M \sync_bus_reg[4]  ( .D(n11), .SI(sync_bus[3]), .SE(n48), .CK(clk), 
        .RN(n34), .Q(sync_bus[4]) );
  SDFFRQX4M \sync_bus_reg[6]  ( .D(n15), .SI(sync_bus[5]), .SE(n47), .CK(clk), 
        .RN(n33), .Q(sync_bus[6]) );
  BUFX2M U3 ( .A(n40), .Y(n47) );
  BUFX2M U4 ( .A(n40), .Y(n55) );
endmodule


module Pulse_Generator_test_1 ( bus_enable, clk, rst, enable_pulse, test_si, 
        test_so, test_se );
  input bus_enable, clk, rst, test_si, test_se;
  output enable_pulse, test_so;
  wire   n3;
  wire   [1:0] pulse_flop;
  assign test_so = pulse_flop[1];

  SDFFRQX2M \pulse_flop_reg[1]  ( .D(pulse_flop[0]), .SI(pulse_flop[0]), .SE(
        n3), .CK(clk), .RN(rst), .Q(pulse_flop[1]) );
  SDFFRQX2M \pulse_flop_reg[0]  ( .D(bus_enable), .SI(test_si), .SE(n3), .CK(
        clk), .RN(rst), .Q(pulse_flop[0]) );
  NOR2BX2M U5 ( .AN(pulse_flop[0]), .B(pulse_flop[1]), .Y(enable_pulse) );
  DLY1X1M U6 ( .A(test_se), .Y(n3) );
endmodule


module System_Controller_test_1 ( clk, rst, P_data_sync, data_valid_sync, 
        RD_Data, RD_Valid, WR_en, RD_en, ADDR, WR_Data_regfile, ALU_OUT, 
        ALU_Valid, ALU_FUNC, CLK_en, W_full, WR_DATA_fifo, W_inc, test_si, 
        test_so, test_se );
  input [7:0] P_data_sync;
  input [7:0] RD_Data;
  output [3:0] ADDR;
  output [7:0] WR_Data_regfile;
  input [15:0] ALU_OUT;
  output [3:0] ALU_FUNC;
  output [7:0] WR_DATA_fifo;
  input clk, rst, data_valid_sync, RD_Valid, ALU_Valid, W_full, test_si,
         test_se;
  output WR_en, RD_en, CLK_en, W_inc, test_so;
  wire   n116, n117, n118, n2, n3, n4, n5, n7, n8, n9, n10, n11, n12, n13, n15,
         n16, n17, n19, n20, n22, n23, n24, n26, n27, n28, n29, n31, n33, n34,
         n35, n38, n40, n41, n42, n44, n45, n46, n53, n59, n60, n61, n62, n63,
         n64, n65, n66, n67, n68, n69, n70, n71, n72, n74, n75, n76, n83, n85,
         n87, n89, n98, n99, n100, n101, n1, n30, n32, n36, n37, n39, n47, n48,
         n49, n50, n51, n52, n54, n55, n56, n57, n58, n73, n77, n78, n79, n80,
         n81, n102, n103, n104, n105, n106, n107, n108, n109, n110, n111, n112,
         n113, n114, n115, n121, n122, n123, n125, n126, n127, n128, n129,
         n130, n131, n132, n133, n134, n135, n136;
  wire   [3:0] store_address;
  wire   [3:0] current_state;
  wire   [3:0] next_state;

  OAI221X4M U17 ( .A0(n7), .A1(n54), .B0(data_valid_sync), .B1(n33), .C0(n34), 
        .Y(n19) );
  OAI22X8M U76 ( .A0(n112), .A1(n77), .B0(n103), .B1(n71), .Y(ALU_FUNC[3]) );
  OAI22X8M U78 ( .A0(n113), .A1(n77), .B0(n102), .B1(n71), .Y(ALU_FUNC[2]) );
  OAI22X8M U96 ( .A0(n112), .A1(n33), .B0(n76), .B1(n106), .Y(ADDR[3]) );
  OAI22X8M U102 ( .A0(n33), .A1(n114), .B0(n76), .B1(n108), .Y(ADDR[1]) );
  SDFFRX1M \store_func_reg[1]  ( .D(n98), .SI(n123), .SE(n133), .CK(clk), .RN(
        n51), .Q(n122), .QN(n81) );
  SDFFRX1M \store_func_reg[0]  ( .D(n101), .SI(store_address[3]), .SE(n134), 
        .CK(clk), .RN(n51), .Q(n123), .QN(n104) );
  SDFFRQX2M \store_address_reg[1]  ( .D(n83), .SI(store_address[0]), .SE(n134), 
        .CK(clk), .RN(n51), .Q(store_address[1]) );
  SDFFRX1M \store_func_reg[2]  ( .D(n99), .SI(n122), .SE(n135), .CK(clk), .RN(
        n51), .Q(n121), .QN(n102) );
  SDFFRX1M \store_func_reg[3]  ( .D(n100), .SI(n121), .SE(n132), .CK(clk), 
        .RN(n51), .Q(test_so), .QN(n103) );
  SDFFRQX2M \store_address_reg[0]  ( .D(n89), .SI(current_state[3]), .SE(n135), 
        .CK(clk), .RN(n51), .Q(store_address[0]) );
  SDFFRQX2M \store_address_reg[3]  ( .D(n87), .SI(store_address[2]), .SE(n128), 
        .CK(clk), .RN(n51), .Q(store_address[3]) );
  SDFFRQX2M \store_address_reg[2]  ( .D(n85), .SI(store_address[1]), .SE(n127), 
        .CK(clk), .RN(n51), .Q(store_address[2]) );
  SDFFRQX2M \current_state_reg[1]  ( .D(next_state[1]), .SI(current_state[0]), 
        .SE(n132), .CK(clk), .RN(n51), .Q(current_state[1]) );
  AND2X2M U3 ( .A(n37), .B(n39), .Y(n1) );
  AND4X1M U5 ( .A(P_data_sync[6]), .B(P_data_sync[2]), .C(data_valid_sync), 
        .D(n44), .Y(n5) );
  NOR2X4M U6 ( .A(n80), .B(current_state[3]), .Y(n75) );
  NAND3X3M U7 ( .A(n75), .B(current_state[0]), .C(current_state[2]), .Y(n2) );
  NAND3X3M U8 ( .A(n11), .B(current_state[0]), .C(current_state[2]), .Y(n9) );
  BUFX4M U12 ( .A(n116), .Y(ADDR[2]) );
  OAI22X1M U13 ( .A0(n113), .A1(n33), .B0(n76), .B1(n107), .Y(n116) );
  NAND2X3M U14 ( .A(n20), .B(n1), .Y(ADDR[0]) );
  OA22X2M U15 ( .A0(n115), .A1(n77), .B0(n104), .B1(n71), .Y(n118) );
  INVX6M U16 ( .A(n118), .Y(ALU_FUNC[0]) );
  CLKINVX1M U18 ( .A(n33), .Y(n30) );
  CLKINVX1M U19 ( .A(n115), .Y(n32) );
  CLKINVX1M U20 ( .A(n76), .Y(n36) );
  CLKNAND2X2M U21 ( .A(n30), .B(n32), .Y(n37) );
  CLKNAND2X2M U22 ( .A(store_address[0]), .B(n36), .Y(n39) );
  CLKBUFX8M U23 ( .A(n117), .Y(ALU_FUNC[1]) );
  OAI22X1M U24 ( .A0(n114), .A1(n77), .B0(n81), .B1(n71), .Y(n117) );
  NOR2X2M U25 ( .A(n61), .B(n109), .Y(WR_en) );
  NOR2X3M U26 ( .A(n33), .B(n109), .Y(RD_en) );
  NOR2X4M U27 ( .A(n73), .B(current_state[2]), .Y(n74) );
  OAI21X2M U29 ( .A0(data_valid_sync), .A1(n2), .B0(n20), .Y(n13) );
  INVX4M U30 ( .A(n53), .Y(n77) );
  NOR2BX8M U31 ( .AN(n42), .B(n79), .Y(n76) );
  INVX2M U32 ( .A(n62), .Y(n79) );
  INVX2M U33 ( .A(W_full), .Y(n54) );
  INVX4M U34 ( .A(n46), .Y(n56) );
  BUFX4M U35 ( .A(n61), .Y(n50) );
  AOI21X6M U36 ( .A0(n2), .A1(n27), .B0(n109), .Y(n53) );
  NAND2X4M U37 ( .A(n75), .B(n74), .Y(n33) );
  NAND2X2M U38 ( .A(n11), .B(n74), .Y(n42) );
  NAND2X2M U39 ( .A(n75), .B(n45), .Y(n62) );
  NAND4BX1M U40 ( .AN(n47), .B(n8), .C(n23), .D(n24), .Y(next_state[0]) );
  AOI21BX2M U41 ( .A0(n41), .A1(n109), .B0N(n2), .Y(n23) );
  AOI211X2M U42 ( .A0(n58), .A1(n55), .B0(n19), .C0(n26), .Y(n24) );
  NAND2X2M U43 ( .A(n9), .B(n42), .Y(n41) );
  AND3X2M U44 ( .A(n40), .B(n27), .C(n15), .Y(n3) );
  NAND3X2M U45 ( .A(n7), .B(n2), .C(n3), .Y(CLK_en) );
  INVX2M U46 ( .A(ALU_Valid), .Y(n55) );
  NAND4X2M U47 ( .A(n56), .B(n15), .C(n16), .D(n17), .Y(next_state[1]) );
  AOI211X2M U48 ( .A0(n79), .A1(n109), .B0(n19), .C0(n13), .Y(n17) );
  AOI2BB2X2M U49 ( .B0(ALU_Valid), .B1(n58), .A0N(n9), .A1N(n109), .Y(n16) );
  OAI22X1M U50 ( .A0(n53), .A1(n104), .B0(n115), .B1(n77), .Y(n101) );
  OAI22X1M U51 ( .A0(n53), .A1(n103), .B0(n112), .B1(n77), .Y(n100) );
  OAI22X1M U52 ( .A0(n53), .A1(n102), .B0(n113), .B1(n77), .Y(n99) );
  OAI22X1M U53 ( .A0(n53), .A1(n81), .B0(n114), .B1(n77), .Y(n98) );
  CLKBUFX6M U54 ( .A(n59), .Y(n48) );
  NOR2X2M U55 ( .A(n7), .B(W_full), .Y(n59) );
  CLKBUFX6M U56 ( .A(n22), .Y(n47) );
  NOR2X2M U57 ( .A(n15), .B(W_full), .Y(n22) );
  OR3X2M U58 ( .A(n48), .B(n49), .C(n47), .Y(W_inc) );
  AND3X2M U59 ( .A(n20), .B(n9), .C(n62), .Y(n61) );
  NOR2X6M U60 ( .A(n42), .B(n109), .Y(n46) );
  NOR4X4M U61 ( .A(n110), .B(n114), .C(n38), .D(n78), .Y(n29) );
  NOR2X2M U62 ( .A(n50), .B(n115), .Y(WR_Data_regfile[0]) );
  NOR2X2M U63 ( .A(n50), .B(n114), .Y(WR_Data_regfile[1]) );
  NOR2X2M U64 ( .A(n50), .B(n113), .Y(WR_Data_regfile[2]) );
  NOR2X2M U65 ( .A(n50), .B(n112), .Y(WR_Data_regfile[3]) );
  NOR2X2M U66 ( .A(n50), .B(n111), .Y(WR_Data_regfile[4]) );
  NOR2X2M U67 ( .A(n50), .B(n110), .Y(WR_Data_regfile[5]) );
  OAI22X1M U68 ( .A0(n46), .A1(n105), .B0(n115), .B1(n56), .Y(n89) );
  OAI22X1M U69 ( .A0(n46), .A1(n108), .B0(n114), .B1(n56), .Y(n83) );
  OAI22X1M U70 ( .A0(n46), .A1(n107), .B0(n113), .B1(n56), .Y(n85) );
  OAI22X1M U71 ( .A0(n46), .A1(n106), .B0(n112), .B1(n56), .Y(n87) );
  INVX2M U72 ( .A(n45), .Y(n78) );
  NAND3X2M U73 ( .A(n115), .B(n111), .C(n5), .Y(n8) );
  INVX2M U74 ( .A(n40), .Y(n58) );
  INVX6M U75 ( .A(n52), .Y(n51) );
  INVX2M U77 ( .A(rst), .Y(n52) );
  NOR2X6M U79 ( .A(current_state[1]), .B(current_state[3]), .Y(n11) );
  OAI2BB1X2M U80 ( .A0N(ALU_OUT[0]), .A1N(n47), .B0(n70), .Y(WR_DATA_fifo[0])
         );
  AOI22X1M U81 ( .A0(ALU_OUT[8]), .A1(n48), .B0(RD_Data[0]), .B1(n49), .Y(n70)
         );
  OAI2BB1X2M U82 ( .A0N(ALU_OUT[1]), .A1N(n47), .B0(n69), .Y(WR_DATA_fifo[1])
         );
  AOI22X1M U83 ( .A0(ALU_OUT[9]), .A1(n48), .B0(RD_Data[1]), .B1(n49), .Y(n69)
         );
  OAI2BB1X2M U84 ( .A0N(ALU_OUT[2]), .A1N(n47), .B0(n68), .Y(WR_DATA_fifo[2])
         );
  AOI22X1M U85 ( .A0(ALU_OUT[10]), .A1(n48), .B0(RD_Data[2]), .B1(n49), .Y(n68) );
  OAI2BB1X2M U86 ( .A0N(ALU_OUT[3]), .A1N(n47), .B0(n67), .Y(WR_DATA_fifo[3])
         );
  AOI22X1M U87 ( .A0(ALU_OUT[11]), .A1(n48), .B0(RD_Data[3]), .B1(n49), .Y(n67) );
  OAI2BB1X2M U88 ( .A0N(ALU_OUT[4]), .A1N(n47), .B0(n66), .Y(WR_DATA_fifo[4])
         );
  AOI22X1M U89 ( .A0(ALU_OUT[12]), .A1(n48), .B0(RD_Data[4]), .B1(n49), .Y(n66) );
  OAI2BB1X2M U90 ( .A0N(ALU_OUT[5]), .A1N(n47), .B0(n65), .Y(WR_DATA_fifo[5])
         );
  AOI22X1M U91 ( .A0(ALU_OUT[13]), .A1(n48), .B0(RD_Data[5]), .B1(n49), .Y(n65) );
  OAI2BB1X2M U92 ( .A0N(ALU_OUT[6]), .A1N(n47), .B0(n64), .Y(WR_DATA_fifo[6])
         );
  AOI22X1M U93 ( .A0(ALU_OUT[14]), .A1(n48), .B0(RD_Data[6]), .B1(n49), .Y(n64) );
  OAI2BB1X2M U94 ( .A0N(ALU_OUT[7]), .A1N(n47), .B0(n63), .Y(WR_DATA_fifo[7])
         );
  AOI22X1M U95 ( .A0(ALU_OUT[15]), .A1(n48), .B0(RD_Data[7]), .B1(n49), .Y(n63) );
  INVX2M U97 ( .A(current_state[1]), .Y(n80) );
  INVX4M U99 ( .A(P_data_sync[0]), .Y(n115) );
  NAND3X4M U100 ( .A(n74), .B(current_state[3]), .C(current_state[1]), .Y(n7)
         );
  INVX4M U103 ( .A(P_data_sync[2]), .Y(n113) );
  NAND3X2M U105 ( .A(current_state[3]), .B(n80), .C(n74), .Y(n40) );
  NAND2X4M U106 ( .A(CLK_en), .B(n72), .Y(n71) );
  NAND4X2M U107 ( .A(data_valid_sync), .B(n15), .C(n40), .D(n7), .Y(n72) );
  NAND3X2M U108 ( .A(n45), .B(n80), .C(current_state[3]), .Y(n27) );
  INVX6M U109 ( .A(data_valid_sync), .Y(n109) );
  INVX2M U110 ( .A(store_address[2]), .Y(n107) );
  INVX4M U111 ( .A(P_data_sync[1]), .Y(n114) );
  INVX4M U112 ( .A(P_data_sync[3]), .Y(n112) );
  INVX2M U113 ( .A(store_address[3]), .Y(n106) );
  INVX2M U114 ( .A(store_address[0]), .Y(n105) );
  INVX2M U115 ( .A(store_address[1]), .Y(n108) );
  CLKBUFX6M U116 ( .A(n60), .Y(n49) );
  NAND2X2M U117 ( .A(RD_Valid), .B(n54), .Y(n12) );
  NAND4X2M U118 ( .A(P_data_sync[4]), .B(P_data_sync[0]), .C(n29), .D(n35), 
        .Y(n34) );
  NOR3X2M U119 ( .A(n109), .B(P_data_sync[6]), .C(P_data_sync[2]), .Y(n35) );
  AOI31X2M U132 ( .A0(n20), .A1(n27), .A2(n28), .B0(n109), .Y(n26) );
  NAND3X2M U133 ( .A(n29), .B(n115), .C(n31), .Y(n28) );
  NOR2BX2M U135 ( .AN(P_data_sync[6]), .B(n50), .Y(WR_Data_regfile[6]) );
  NOR2BX2M U136 ( .AN(P_data_sync[7]), .B(n50), .Y(WR_Data_regfile[7]) );
  NOR4X2M U137 ( .A(P_data_sync[5]), .B(P_data_sync[1]), .C(n78), .D(n38), .Y(
        n44) );
  OAI211X2M U138 ( .A0(n109), .A1(n2), .B0(n3), .C0(n4), .Y(next_state[3]) );
  AOI32X1M U139 ( .A0(P_data_sync[0]), .A1(n5), .A2(P_data_sync[4]), .B0(
        W_full), .B1(n57), .Y(n4) );
  INVX2M U140 ( .A(n7), .Y(n57) );
  NAND4BX1M U141 ( .AN(RD_en), .B(n8), .C(n9), .D(n10), .Y(next_state[2]) );
  AOI31X2M U142 ( .A0(n11), .A1(n12), .A2(current_state[2]), .B0(n13), .Y(n10)
         );
  NAND3X2M U143 ( .A(P_data_sync[3]), .B(n11), .C(P_data_sync[7]), .Y(n38) );
  INVX2M U144 ( .A(P_data_sync[4]), .Y(n111) );
  INVX2M U145 ( .A(P_data_sync[5]), .Y(n110) );
  DLY1X1M U146 ( .A(n129), .Y(n125) );
  DLY1X1M U147 ( .A(n129), .Y(n126) );
  DLY1X1M U148 ( .A(n130), .Y(n127) );
  DLY1X1M U149 ( .A(n126), .Y(n128) );
  DLY1X1M U150 ( .A(test_se), .Y(n129) );
  DLY1X1M U151 ( .A(n125), .Y(n130) );
  DLY1X1M U152 ( .A(n125), .Y(n131) );
  DLY1X1M U153 ( .A(n126), .Y(n132) );
  DLY1X1M U154 ( .A(n131), .Y(n133) );
  DLY1X1M U155 ( .A(n130), .Y(n134) );
  DLY1X1M U156 ( .A(n131), .Y(n135) );
  INVXLM U157 ( .A(n80), .Y(n136) );
  SDFFRQX4M \current_state_reg[2]  ( .D(next_state[2]), .SI(current_state[1]), 
        .SE(n127), .CK(clk), .RN(n51), .Q(current_state[2]) );
  SDFFRQX4M \current_state_reg[3]  ( .D(next_state[3]), .SI(current_state[2]), 
        .SE(n128), .CK(clk), .RN(n51), .Q(current_state[3]) );
  SDFFRQX4M \current_state_reg[0]  ( .D(next_state[0]), .SI(test_si), .SE(n133), .CK(clk), .RN(n51), .Q(current_state[0]) );
  NOR3X2M U4 ( .A(P_data_sync[2]), .B(P_data_sync[6]), .C(P_data_sync[4]), .Y(
        n31) );
  NOR4BBX2M U9 ( .AN(n11), .BN(current_state[2]), .C(n12), .D(current_state[0]), .Y(n60) );
  NOR2X4M U10 ( .A(current_state[2]), .B(current_state[0]), .Y(n45) );
  CLKINVX2M U11 ( .A(current_state[0]), .Y(n73) );
  NAND3X3M U28 ( .A(current_state[3]), .B(n45), .C(n136), .Y(n15) );
  NAND3X3M U98 ( .A(n75), .B(n73), .C(current_state[2]), .Y(n20) );
endmodule


module FIFO_MEM_CONTROL_test_1 ( W_data, W_inc, W_full, W_addr, R_addr, W_clk, 
        R_data, test_si2, test_si1, test_so2, test_so1, test_se );
  input [7:0] W_data;
  input [2:0] W_addr;
  input [2:0] R_addr;
  output [7:0] R_data;
  input W_inc, W_full, W_clk, test_si2, test_si1, test_se;
  output test_so2, test_so1;
  wire   N10, N11, N12, \MEM[7][7] , \MEM[7][6] , \MEM[7][5] , \MEM[7][4] ,
         \MEM[7][3] , \MEM[7][2] , \MEM[7][1] , \MEM[7][0] , \MEM[6][7] ,
         \MEM[6][6] , \MEM[6][5] , \MEM[6][4] , \MEM[6][3] , \MEM[6][2] ,
         \MEM[6][1] , \MEM[6][0] , \MEM[5][7] , \MEM[5][6] , \MEM[5][5] ,
         \MEM[5][4] , \MEM[5][3] , \MEM[5][2] , \MEM[5][1] , \MEM[5][0] ,
         \MEM[4][7] , \MEM[4][6] , \MEM[4][5] , \MEM[4][4] , \MEM[4][3] ,
         \MEM[4][2] , \MEM[4][1] , \MEM[4][0] , \MEM[3][7] , \MEM[3][6] ,
         \MEM[3][5] , \MEM[3][4] , \MEM[3][3] , \MEM[3][2] , \MEM[3][1] ,
         \MEM[3][0] , \MEM[2][7] , \MEM[2][6] , \MEM[2][5] , \MEM[2][4] ,
         \MEM[2][3] , \MEM[2][2] , \MEM[2][1] , \MEM[2][0] , \MEM[1][7] ,
         \MEM[1][6] , \MEM[1][5] , \MEM[1][4] , \MEM[1][3] , \MEM[1][2] ,
         \MEM[1][1] , \MEM[1][0] , \MEM[0][7] , \MEM[0][6] , \MEM[0][5] ,
         \MEM[0][4] , \MEM[0][3] , \MEM[0][2] , \MEM[0][1] , \MEM[0][0] , n76,
         n80, n82, n86, n87, n88, n89, n90, n91, n92, n93, n94, n95, n96, n97,
         n98, n99, n100, n101, n102, n103, n104, n105, n106, n107, n108, n109,
         n110, n111, n112, n113, n114, n115, n116, n117, n118, n119, n120,
         n121, n122, n123, n124, n125, n126, n127, n128, n129, n130, n131,
         n132, n133, n134, n135, n136, n137, n138, n139, n140, n141, n142,
         n143, n144, n145, n146, n147, n148, n149, n65, n66, n67, n68, n69,
         n70, n71, n72, n73, n74, n75, n77, n78, n79, n81, n83, n84, n85, n150,
         n151, n152, n153, n154, n155, n156, n157, n158, n159, n160, n161,
         n162, n163, n164, n165, n166, n167, n168, n169, n170, n171, n172,
         n173, n174, n175, n176, n177, n178, n179, n180, n181, n182, n183,
         n184, n185, n186, n187, n188, n189, n190, n191, n192, n193, n194,
         n195, n196, n197, n198, n199, n200, n201, n202, n203, n204, n205,
         n206, n207, n208, n209, n210, n211, n212, n216, n217, n218, n219,
         n220, n221, n222, n223, n224, n225, n226, n227, n228, n229, n230,
         n231, n232, n233, n234, n235, n236, n237, n238, n239, n240, n241,
         n242, n243, n244, n245, n246, n247, n248, n249, n250, n251, n252,
         n253, n254, n255, n256, n257, n258, n259, n260, n261, n262, n263,
         n264, n265, n266, n267, n268, n269, n270, n271, n272, n273, n274,
         n275, n276, n277, n278, n279, n280, n1;
  assign N10 = R_addr[0];
  assign N11 = R_addr[1];
  assign N12 = R_addr[2];
  assign test_so2 = \MEM[7][7] ;

  SDFFQX2M \MEM_reg[5][7]  ( .D(n133), .SI(\MEM[5][6] ), .SE(n244), .CK(W_clk), 
        .Q(\MEM[5][7] ) );
  SDFFQX2M \MEM_reg[5][6]  ( .D(n132), .SI(\MEM[5][5] ), .SE(n244), .CK(W_clk), 
        .Q(\MEM[5][6] ) );
  SDFFQX2M \MEM_reg[5][5]  ( .D(n131), .SI(\MEM[5][4] ), .SE(n279), .CK(W_clk), 
        .Q(\MEM[5][5] ) );
  SDFFQX2M \MEM_reg[5][4]  ( .D(n130), .SI(\MEM[5][3] ), .SE(n243), .CK(W_clk), 
        .Q(\MEM[5][4] ) );
  SDFFQX2M \MEM_reg[5][3]  ( .D(n129), .SI(\MEM[5][2] ), .SE(n243), .CK(W_clk), 
        .Q(\MEM[5][3] ) );
  SDFFQX2M \MEM_reg[5][2]  ( .D(n128), .SI(\MEM[5][1] ), .SE(n278), .CK(W_clk), 
        .Q(\MEM[5][2] ) );
  SDFFQX2M \MEM_reg[5][1]  ( .D(n127), .SI(\MEM[5][0] ), .SE(n242), .CK(W_clk), 
        .Q(\MEM[5][1] ) );
  SDFFQX2M \MEM_reg[5][0]  ( .D(n126), .SI(\MEM[4][7] ), .SE(n242), .CK(W_clk), 
        .Q(\MEM[5][0] ) );
  SDFFQX2M \MEM_reg[4][7]  ( .D(n125), .SI(\MEM[4][6] ), .SE(n277), .CK(W_clk), 
        .Q(\MEM[4][7] ) );
  SDFFQX2M \MEM_reg[4][6]  ( .D(n124), .SI(\MEM[4][5] ), .SE(n241), .CK(W_clk), 
        .Q(\MEM[4][6] ) );
  SDFFQX2M \MEM_reg[4][5]  ( .D(n123), .SI(\MEM[4][4] ), .SE(n241), .CK(W_clk), 
        .Q(\MEM[4][5] ) );
  SDFFQX2M \MEM_reg[4][4]  ( .D(n122), .SI(\MEM[4][3] ), .SE(n276), .CK(W_clk), 
        .Q(\MEM[4][4] ) );
  SDFFQX2M \MEM_reg[4][3]  ( .D(n121), .SI(\MEM[4][2] ), .SE(n240), .CK(W_clk), 
        .Q(\MEM[4][3] ) );
  SDFFQX2M \MEM_reg[4][2]  ( .D(n120), .SI(\MEM[4][1] ), .SE(n240), .CK(W_clk), 
        .Q(\MEM[4][2] ) );
  SDFFQX2M \MEM_reg[4][1]  ( .D(n119), .SI(\MEM[4][0] ), .SE(n275), .CK(W_clk), 
        .Q(\MEM[4][1] ) );
  SDFFQX2M \MEM_reg[4][0]  ( .D(n118), .SI(\MEM[3][7] ), .SE(n239), .CK(W_clk), 
        .Q(\MEM[4][0] ) );
  SDFFQX2M \MEM_reg[7][7]  ( .D(n149), .SI(\MEM[7][6] ), .SE(n239), .CK(W_clk), 
        .Q(\MEM[7][7] ) );
  SDFFQX2M \MEM_reg[7][6]  ( .D(n148), .SI(\MEM[7][5] ), .SE(n274), .CK(W_clk), 
        .Q(\MEM[7][6] ) );
  SDFFQX2M \MEM_reg[7][5]  ( .D(n147), .SI(\MEM[7][4] ), .SE(n238), .CK(W_clk), 
        .Q(\MEM[7][5] ) );
  SDFFQX2M \MEM_reg[7][4]  ( .D(n146), .SI(\MEM[7][3] ), .SE(n238), .CK(W_clk), 
        .Q(\MEM[7][4] ) );
  SDFFQX2M \MEM_reg[7][3]  ( .D(n145), .SI(\MEM[7][2] ), .SE(n273), .CK(W_clk), 
        .Q(\MEM[7][3] ) );
  SDFFQX2M \MEM_reg[7][2]  ( .D(n144), .SI(\MEM[7][1] ), .SE(n237), .CK(W_clk), 
        .Q(\MEM[7][2] ) );
  SDFFQX2M \MEM_reg[7][1]  ( .D(n143), .SI(\MEM[7][0] ), .SE(n272), .CK(W_clk), 
        .Q(\MEM[7][1] ) );
  SDFFQX2M \MEM_reg[7][0]  ( .D(n142), .SI(\MEM[6][7] ), .SE(n271), .CK(W_clk), 
        .Q(\MEM[7][0] ) );
  SDFFQX2M \MEM_reg[6][7]  ( .D(n141), .SI(\MEM[6][6] ), .SE(n271), .CK(W_clk), 
        .Q(\MEM[6][7] ) );
  SDFFQX2M \MEM_reg[6][6]  ( .D(n140), .SI(\MEM[6][5] ), .SE(n237), .CK(W_clk), 
        .Q(\MEM[6][6] ) );
  SDFFQX2M \MEM_reg[6][5]  ( .D(n139), .SI(\MEM[6][4] ), .SE(n272), .CK(W_clk), 
        .Q(\MEM[6][5] ) );
  SDFFQX2M \MEM_reg[6][4]  ( .D(n138), .SI(\MEM[6][3] ), .SE(n236), .CK(W_clk), 
        .Q(\MEM[6][4] ) );
  SDFFQX2M \MEM_reg[6][3]  ( .D(n137), .SI(test_si2), .SE(n236), .CK(W_clk), 
        .Q(\MEM[6][3] ) );
  SDFFQX2M \MEM_reg[6][2]  ( .D(n136), .SI(\MEM[6][1] ), .SE(n270), .CK(W_clk), 
        .Q(\MEM[6][2] ) );
  SDFFQX2M \MEM_reg[6][1]  ( .D(n135), .SI(\MEM[6][0] ), .SE(n235), .CK(W_clk), 
        .Q(\MEM[6][1] ) );
  SDFFQX2M \MEM_reg[6][0]  ( .D(n134), .SI(\MEM[5][7] ), .SE(n235), .CK(W_clk), 
        .Q(\MEM[6][0] ) );
  SDFFQX2M \MEM_reg[1][7]  ( .D(n101), .SI(\MEM[1][6] ), .SE(n269), .CK(W_clk), 
        .Q(\MEM[1][7] ) );
  SDFFQX2M \MEM_reg[1][6]  ( .D(n100), .SI(\MEM[1][5] ), .SE(n234), .CK(W_clk), 
        .Q(\MEM[1][6] ) );
  SDFFQX2M \MEM_reg[1][5]  ( .D(n99), .SI(\MEM[1][4] ), .SE(n234), .CK(W_clk), 
        .Q(\MEM[1][5] ) );
  SDFFQX2M \MEM_reg[1][4]  ( .D(n98), .SI(\MEM[1][3] ), .SE(n268), .CK(W_clk), 
        .Q(\MEM[1][4] ) );
  SDFFQX2M \MEM_reg[1][3]  ( .D(n97), .SI(\MEM[1][2] ), .SE(n233), .CK(W_clk), 
        .Q(\MEM[1][3] ) );
  SDFFQX2M \MEM_reg[1][2]  ( .D(n96), .SI(\MEM[1][1] ), .SE(n233), .CK(W_clk), 
        .Q(\MEM[1][2] ) );
  SDFFQX2M \MEM_reg[1][1]  ( .D(n95), .SI(\MEM[1][0] ), .SE(n267), .CK(W_clk), 
        .Q(\MEM[1][1] ) );
  SDFFQX2M \MEM_reg[1][0]  ( .D(n94), .SI(\MEM[0][7] ), .SE(n232), .CK(W_clk), 
        .Q(\MEM[1][0] ) );
  SDFFQX2M \MEM_reg[0][7]  ( .D(n93), .SI(\MEM[0][6] ), .SE(n232), .CK(W_clk), 
        .Q(\MEM[0][7] ) );
  SDFFQX2M \MEM_reg[0][6]  ( .D(n92), .SI(\MEM[0][5] ), .SE(n266), .CK(W_clk), 
        .Q(\MEM[0][6] ) );
  SDFFQX2M \MEM_reg[0][5]  ( .D(n91), .SI(\MEM[0][4] ), .SE(n231), .CK(W_clk), 
        .Q(\MEM[0][5] ) );
  SDFFQX2M \MEM_reg[0][4]  ( .D(n90), .SI(\MEM[0][3] ), .SE(n231), .CK(W_clk), 
        .Q(\MEM[0][4] ) );
  SDFFQX2M \MEM_reg[0][3]  ( .D(n89), .SI(\MEM[0][2] ), .SE(n265), .CK(W_clk), 
        .Q(\MEM[0][3] ) );
  SDFFQX2M \MEM_reg[0][2]  ( .D(n88), .SI(\MEM[0][1] ), .SE(n230), .CK(W_clk), 
        .Q(\MEM[0][2] ) );
  SDFFQX2M \MEM_reg[0][1]  ( .D(n87), .SI(\MEM[0][0] ), .SE(n230), .CK(W_clk), 
        .Q(\MEM[0][1] ) );
  SDFFQX2M \MEM_reg[0][0]  ( .D(n86), .SI(test_si1), .SE(n264), .CK(W_clk), 
        .Q(\MEM[0][0] ) );
  SDFFQX2M \MEM_reg[3][7]  ( .D(n117), .SI(\MEM[3][6] ), .SE(n229), .CK(W_clk), 
        .Q(\MEM[3][7] ) );
  SDFFQX2M \MEM_reg[3][6]  ( .D(n116), .SI(\MEM[3][5] ), .SE(n229), .CK(W_clk), 
        .Q(\MEM[3][6] ) );
  SDFFQX2M \MEM_reg[3][5]  ( .D(n115), .SI(\MEM[3][4] ), .SE(n263), .CK(W_clk), 
        .Q(\MEM[3][5] ) );
  SDFFQX2M \MEM_reg[3][4]  ( .D(n114), .SI(\MEM[3][3] ), .SE(n228), .CK(W_clk), 
        .Q(\MEM[3][4] ) );
  SDFFQX2M \MEM_reg[3][3]  ( .D(n113), .SI(\MEM[3][2] ), .SE(n228), .CK(W_clk), 
        .Q(\MEM[3][3] ) );
  SDFFQX2M \MEM_reg[3][2]  ( .D(n112), .SI(\MEM[3][1] ), .SE(n262), .CK(W_clk), 
        .Q(\MEM[3][2] ) );
  SDFFQX2M \MEM_reg[3][1]  ( .D(n111), .SI(\MEM[3][0] ), .SE(n227), .CK(W_clk), 
        .Q(\MEM[3][1] ) );
  SDFFQX2M \MEM_reg[3][0]  ( .D(n110), .SI(\MEM[2][7] ), .SE(n227), .CK(W_clk), 
        .Q(\MEM[3][0] ) );
  SDFFQX2M \MEM_reg[2][7]  ( .D(n109), .SI(\MEM[2][6] ), .SE(n261), .CK(W_clk), 
        .Q(\MEM[2][7] ) );
  SDFFQX2M \MEM_reg[2][6]  ( .D(n108), .SI(\MEM[2][5] ), .SE(n226), .CK(W_clk), 
        .Q(\MEM[2][6] ) );
  SDFFQX2M \MEM_reg[2][5]  ( .D(n107), .SI(\MEM[2][4] ), .SE(n226), .CK(W_clk), 
        .Q(\MEM[2][5] ) );
  SDFFQX2M \MEM_reg[2][4]  ( .D(n106), .SI(\MEM[2][3] ), .SE(n260), .CK(W_clk), 
        .Q(\MEM[2][4] ) );
  SDFFQX2M \MEM_reg[2][3]  ( .D(n105), .SI(\MEM[2][2] ), .SE(n225), .CK(W_clk), 
        .Q(\MEM[2][3] ) );
  SDFFQX2M \MEM_reg[2][2]  ( .D(n104), .SI(\MEM[2][1] ), .SE(n225), .CK(W_clk), 
        .Q(\MEM[2][2] ) );
  SDFFQX2M \MEM_reg[2][1]  ( .D(n103), .SI(\MEM[2][0] ), .SE(n259), .CK(W_clk), 
        .Q(\MEM[2][1] ) );
  SDFFQX2M \MEM_reg[2][0]  ( .D(n102), .SI(\MEM[1][7] ), .SE(n258), .CK(W_clk), 
        .Q(\MEM[2][0] ) );
  AND3X1M U66 ( .A(W_addr[1]), .B(W_addr[0]), .C(n82), .Y(n68) );
  AND3X1M U67 ( .A(W_addr[0]), .B(n76), .C(W_addr[1]), .Y(n69) );
  AOI221X2M U68 ( .A0(\MEM[4][0] ), .A1(n181), .B0(\MEM[6][0] ), .B1(n182), 
        .C0(n74), .Y(n75) );
  AOI221X2M U69 ( .A0(\MEM[5][0] ), .A1(n181), .B0(\MEM[7][0] ), .B1(n182), 
        .C0(n73), .Y(n77) );
  AOI221X2M U70 ( .A0(\MEM[4][6] ), .A1(n180), .B0(\MEM[6][6] ), .B1(n182), 
        .C0(n165), .Y(n166) );
  AOI221X2M U71 ( .A0(\MEM[5][6] ), .A1(n180), .B0(\MEM[7][6] ), .B1(n182), 
        .C0(n164), .Y(n167) );
  AOI221X2M U72 ( .A0(\MEM[4][5] ), .A1(n180), .B0(\MEM[6][5] ), .B1(n182), 
        .C0(n161), .Y(n162) );
  AOI221X2M U73 ( .A0(\MEM[5][5] ), .A1(n180), .B0(\MEM[7][5] ), .B1(n182), 
        .C0(n160), .Y(n163) );
  AOI221X2M U74 ( .A0(\MEM[4][4] ), .A1(n180), .B0(\MEM[6][4] ), .B1(n182), 
        .C0(n157), .Y(n158) );
  AOI221X2M U75 ( .A0(\MEM[5][4] ), .A1(n180), .B0(\MEM[7][4] ), .B1(n182), 
        .C0(n156), .Y(n159) );
  AOI221X2M U76 ( .A0(\MEM[4][3] ), .A1(n181), .B0(\MEM[6][3] ), .B1(n182), 
        .C0(n153), .Y(n154) );
  AOI221X2M U77 ( .A0(\MEM[5][3] ), .A1(n181), .B0(\MEM[7][3] ), .B1(n182), 
        .C0(n152), .Y(n155) );
  AOI221X2M U78 ( .A0(\MEM[4][2] ), .A1(n181), .B0(n280), .B1(n182), .C0(n85), 
        .Y(n150) );
  AOI221X2M U79 ( .A0(\MEM[5][2] ), .A1(n181), .B0(\MEM[7][2] ), .B1(n182), 
        .C0(n84), .Y(n151) );
  AOI221X2M U80 ( .A0(\MEM[4][1] ), .A1(n181), .B0(\MEM[6][1] ), .B1(n182), 
        .C0(n79), .Y(n81) );
  AOI221X2M U81 ( .A0(\MEM[5][1] ), .A1(n181), .B0(\MEM[7][1] ), .B1(n182), 
        .C0(n78), .Y(n83) );
  AOI221X2M U82 ( .A0(\MEM[4][7] ), .A1(n180), .B0(\MEM[6][7] ), .B1(n182), 
        .C0(n171), .Y(n174) );
  AOI221X2M U83 ( .A0(\MEM[5][7] ), .A1(n180), .B0(\MEM[7][7] ), .B1(n182), 
        .C0(n168), .Y(n175) );
  NOR2BX4M U84 ( .AN(n80), .B(W_addr[2]), .Y(n76) );
  NOR2X2M U86 ( .A(n177), .B(N12), .Y(n170) );
  NOR2X2M U87 ( .A(n176), .B(N11), .Y(n173) );
  INVX2M U88 ( .A(W_addr[1]), .Y(n212) );
  NOR2BX2M U90 ( .AN(W_inc), .B(W_full), .Y(n80) );
  INVX4M U91 ( .A(n65), .Y(n194) );
  INVX4M U92 ( .A(n65), .Y(n193) );
  INVX4M U93 ( .A(n66), .Y(n202) );
  INVX4M U94 ( .A(n66), .Y(n201) );
  BUFX4M U95 ( .A(n170), .Y(n183) );
  BUFX4M U96 ( .A(n170), .Y(n184) );
  BUFX4M U97 ( .A(n169), .Y(n185) );
  BUFX4M U98 ( .A(n169), .Y(n186) );
  CLKBUFX8M U99 ( .A(n172), .Y(n182) );
  NOR2X2M U100 ( .A(n176), .B(n177), .Y(n172) );
  AND3X2M U101 ( .A(n211), .B(n212), .C(n82), .Y(n65) );
  INVX4M U102 ( .A(n71), .Y(n200) );
  INVX4M U103 ( .A(n71), .Y(n199) );
  INVX4M U104 ( .A(n72), .Y(n198) );
  INVX4M U105 ( .A(n72), .Y(n197) );
  INVX4M U106 ( .A(n69), .Y(n196) );
  INVX4M U107 ( .A(n69), .Y(n195) );
  INVX4M U108 ( .A(n70), .Y(n192) );
  INVX4M U109 ( .A(n70), .Y(n191) );
  INVX4M U110 ( .A(n67), .Y(n190) );
  INVX4M U111 ( .A(n67), .Y(n189) );
  INVX4M U112 ( .A(n68), .Y(n188) );
  INVX4M U113 ( .A(n68), .Y(n187) );
  BUFX4M U114 ( .A(n173), .Y(n180) );
  BUFX4M U115 ( .A(n173), .Y(n181) );
  AND3X2M U116 ( .A(n211), .B(n212), .C(n76), .Y(n66) );
  INVX4M U117 ( .A(n179), .Y(n178) );
  INVX4M U118 ( .A(W_data[0]), .Y(n203) );
  INVX4M U119 ( .A(W_data[1]), .Y(n204) );
  INVX4M U120 ( .A(W_data[2]), .Y(n205) );
  INVX4M U121 ( .A(W_data[3]), .Y(n206) );
  INVX4M U122 ( .A(W_data[4]), .Y(n207) );
  INVX4M U123 ( .A(W_data[5]), .Y(n208) );
  INVX4M U124 ( .A(W_data[6]), .Y(n209) );
  INVX4M U125 ( .A(W_data[7]), .Y(n210) );
  OAI2BB2X1M U126 ( .B0(n203), .B1(n200), .A0N(\MEM[1][0] ), .A1N(n200), .Y(
        n94) );
  OAI2BB2X1M U127 ( .B0(n204), .B1(n199), .A0N(\MEM[1][1] ), .A1N(n199), .Y(
        n95) );
  OAI2BB2X1M U128 ( .B0(n205), .B1(n200), .A0N(\MEM[1][2] ), .A1N(n200), .Y(
        n96) );
  OAI2BB2X1M U129 ( .B0(n206), .B1(n199), .A0N(\MEM[1][3] ), .A1N(n199), .Y(
        n97) );
  OAI2BB2X1M U130 ( .B0(n207), .B1(n200), .A0N(\MEM[1][4] ), .A1N(n200), .Y(
        n98) );
  OAI2BB2X1M U131 ( .B0(n208), .B1(n199), .A0N(\MEM[1][5] ), .A1N(n199), .Y(
        n99) );
  OAI2BB2X1M U132 ( .B0(n209), .B1(n200), .A0N(\MEM[1][6] ), .A1N(n200), .Y(
        n100) );
  OAI2BB2X1M U133 ( .B0(n210), .B1(n199), .A0N(\MEM[1][7] ), .A1N(n199), .Y(
        n101) );
  OAI2BB2X1M U134 ( .B0(n203), .B1(n198), .A0N(\MEM[2][0] ), .A1N(n198), .Y(
        n102) );
  OAI2BB2X1M U135 ( .B0(n204), .B1(n197), .A0N(\MEM[2][1] ), .A1N(n197), .Y(
        n103) );
  OAI2BB2X1M U136 ( .B0(n205), .B1(n198), .A0N(\MEM[2][2] ), .A1N(n198), .Y(
        n104) );
  OAI2BB2X1M U137 ( .B0(n206), .B1(n197), .A0N(\MEM[2][3] ), .A1N(n197), .Y(
        n105) );
  OAI2BB2X1M U138 ( .B0(n207), .B1(n198), .A0N(\MEM[2][4] ), .A1N(n198), .Y(
        n106) );
  OAI2BB2X1M U139 ( .B0(n208), .B1(n197), .A0N(\MEM[2][5] ), .A1N(n197), .Y(
        n107) );
  OAI2BB2X1M U140 ( .B0(n209), .B1(n198), .A0N(\MEM[2][6] ), .A1N(n198), .Y(
        n108) );
  OAI2BB2X1M U141 ( .B0(n210), .B1(n197), .A0N(\MEM[2][7] ), .A1N(n197), .Y(
        n109) );
  OAI2BB2X1M U142 ( .B0(n203), .B1(n196), .A0N(\MEM[3][0] ), .A1N(n196), .Y(
        n110) );
  OAI2BB2X1M U143 ( .B0(n204), .B1(n195), .A0N(\MEM[3][1] ), .A1N(n195), .Y(
        n111) );
  OAI2BB2X1M U144 ( .B0(n205), .B1(n196), .A0N(\MEM[3][2] ), .A1N(n196), .Y(
        n112) );
  OAI2BB2X1M U145 ( .B0(n206), .B1(n195), .A0N(\MEM[3][3] ), .A1N(n195), .Y(
        n113) );
  OAI2BB2X1M U146 ( .B0(n207), .B1(n196), .A0N(\MEM[3][4] ), .A1N(n196), .Y(
        n114) );
  OAI2BB2X1M U147 ( .B0(n208), .B1(n195), .A0N(\MEM[3][5] ), .A1N(n195), .Y(
        n115) );
  OAI2BB2X1M U148 ( .B0(n209), .B1(n196), .A0N(\MEM[3][6] ), .A1N(n196), .Y(
        n116) );
  OAI2BB2X1M U149 ( .B0(n210), .B1(n195), .A0N(\MEM[3][7] ), .A1N(n195), .Y(
        n117) );
  OAI2BB2X1M U150 ( .B0(n203), .B1(n194), .A0N(\MEM[4][0] ), .A1N(n194), .Y(
        n118) );
  OAI2BB2X1M U151 ( .B0(n204), .B1(n193), .A0N(\MEM[4][1] ), .A1N(n193), .Y(
        n119) );
  OAI2BB2X1M U152 ( .B0(n205), .B1(n194), .A0N(\MEM[4][2] ), .A1N(n194), .Y(
        n120) );
  OAI2BB2X1M U153 ( .B0(n206), .B1(n193), .A0N(\MEM[4][3] ), .A1N(n193), .Y(
        n121) );
  OAI2BB2X1M U154 ( .B0(n207), .B1(n194), .A0N(\MEM[4][4] ), .A1N(n194), .Y(
        n122) );
  OAI2BB2X1M U155 ( .B0(n208), .B1(n193), .A0N(\MEM[4][5] ), .A1N(n193), .Y(
        n123) );
  OAI2BB2X1M U156 ( .B0(n209), .B1(n194), .A0N(\MEM[4][6] ), .A1N(n194), .Y(
        n124) );
  OAI2BB2X1M U157 ( .B0(n210), .B1(n193), .A0N(\MEM[4][7] ), .A1N(n193), .Y(
        n125) );
  OAI2BB2X1M U158 ( .B0(n203), .B1(n192), .A0N(\MEM[5][0] ), .A1N(n192), .Y(
        n126) );
  OAI2BB2X1M U159 ( .B0(n204), .B1(n191), .A0N(\MEM[5][1] ), .A1N(n191), .Y(
        n127) );
  OAI2BB2X1M U160 ( .B0(n205), .B1(n192), .A0N(\MEM[5][2] ), .A1N(n192), .Y(
        n128) );
  OAI2BB2X1M U161 ( .B0(n206), .B1(n191), .A0N(\MEM[5][3] ), .A1N(n191), .Y(
        n129) );
  OAI2BB2X1M U162 ( .B0(n207), .B1(n192), .A0N(\MEM[5][4] ), .A1N(n192), .Y(
        n130) );
  OAI2BB2X1M U163 ( .B0(n208), .B1(n191), .A0N(\MEM[5][5] ), .A1N(n191), .Y(
        n131) );
  OAI2BB2X1M U164 ( .B0(n209), .B1(n192), .A0N(\MEM[5][6] ), .A1N(n192), .Y(
        n132) );
  OAI2BB2X1M U165 ( .B0(n210), .B1(n191), .A0N(\MEM[5][7] ), .A1N(n191), .Y(
        n133) );
  OAI2BB2X1M U166 ( .B0(n203), .B1(n190), .A0N(\MEM[6][0] ), .A1N(n190), .Y(
        n134) );
  OAI2BB2X1M U167 ( .B0(n204), .B1(n189), .A0N(\MEM[6][1] ), .A1N(n189), .Y(
        n135) );
  OAI2BB2X1M U168 ( .B0(n205), .B1(n190), .A0N(n280), .A1N(n190), .Y(n136) );
  OAI2BB2X1M U169 ( .B0(n206), .B1(n189), .A0N(\MEM[6][3] ), .A1N(n189), .Y(
        n137) );
  OAI2BB2X1M U170 ( .B0(n207), .B1(n190), .A0N(\MEM[6][4] ), .A1N(n190), .Y(
        n138) );
  OAI2BB2X1M U171 ( .B0(n208), .B1(n189), .A0N(\MEM[6][5] ), .A1N(n189), .Y(
        n139) );
  OAI2BB2X1M U172 ( .B0(n209), .B1(n190), .A0N(\MEM[6][6] ), .A1N(n190), .Y(
        n140) );
  OAI2BB2X1M U173 ( .B0(n210), .B1(n189), .A0N(\MEM[6][7] ), .A1N(n189), .Y(
        n141) );
  OAI2BB2X1M U174 ( .B0(n203), .B1(n188), .A0N(\MEM[7][0] ), .A1N(n188), .Y(
        n142) );
  OAI2BB2X1M U175 ( .B0(n204), .B1(n187), .A0N(\MEM[7][1] ), .A1N(n187), .Y(
        n143) );
  OAI2BB2X1M U176 ( .B0(n205), .B1(n188), .A0N(\MEM[7][2] ), .A1N(n188), .Y(
        n144) );
  OAI2BB2X1M U177 ( .B0(n206), .B1(n187), .A0N(\MEM[7][3] ), .A1N(n187), .Y(
        n145) );
  OAI2BB2X1M U178 ( .B0(n207), .B1(n188), .A0N(\MEM[7][4] ), .A1N(n188), .Y(
        n146) );
  OAI2BB2X1M U179 ( .B0(n208), .B1(n187), .A0N(\MEM[7][5] ), .A1N(n187), .Y(
        n147) );
  OAI2BB2X1M U180 ( .B0(n209), .B1(n188), .A0N(\MEM[7][6] ), .A1N(n188), .Y(
        n148) );
  OAI2BB2X1M U181 ( .B0(n210), .B1(n187), .A0N(\MEM[7][7] ), .A1N(n187), .Y(
        n149) );
  OAI2BB2X1M U182 ( .B0(n202), .B1(n203), .A0N(\MEM[0][0] ), .A1N(n202), .Y(
        n86) );
  OAI2BB2X1M U183 ( .B0(n201), .B1(n204), .A0N(\MEM[0][1] ), .A1N(n201), .Y(
        n87) );
  OAI2BB2X1M U184 ( .B0(n202), .B1(n205), .A0N(\MEM[0][2] ), .A1N(n202), .Y(
        n88) );
  OAI2BB2X1M U185 ( .B0(n201), .B1(n206), .A0N(\MEM[0][3] ), .A1N(n201), .Y(
        n89) );
  OAI2BB2X1M U186 ( .B0(n202), .B1(n207), .A0N(\MEM[0][4] ), .A1N(n202), .Y(
        n90) );
  OAI2BB2X1M U187 ( .B0(n201), .B1(n208), .A0N(\MEM[0][5] ), .A1N(n201), .Y(
        n91) );
  OAI2BB2X1M U188 ( .B0(n202), .B1(n209), .A0N(\MEM[0][6] ), .A1N(n202), .Y(
        n92) );
  OAI2BB2X1M U189 ( .B0(n201), .B1(n210), .A0N(\MEM[0][7] ), .A1N(n201), .Y(
        n93) );
  INVX2M U190 ( .A(N11), .Y(n177) );
  AND2X2M U191 ( .A(W_addr[2]), .B(n80), .Y(n82) );
  INVX2M U192 ( .A(N12), .Y(n176) );
  AND3X2M U193 ( .A(W_addr[1]), .B(n211), .C(n82), .Y(n67) );
  AND3X2M U196 ( .A(n76), .B(n211), .C(W_addr[1]), .Y(n72) );
  CLKBUFX6M U197 ( .A(N10), .Y(n179) );
  AO22X1M U198 ( .A0(\MEM[3][0] ), .A1(n184), .B0(\MEM[1][0] ), .B1(n186), .Y(
        n73) );
  AO22X1M U199 ( .A0(\MEM[2][0] ), .A1(n184), .B0(\MEM[0][0] ), .B1(n186), .Y(
        n74) );
  OAI22X1M U200 ( .A0(n178), .A1(n77), .B0(n179), .B1(n75), .Y(R_data[0]) );
  AO22X1M U201 ( .A0(\MEM[3][1] ), .A1(n184), .B0(\MEM[1][1] ), .B1(n186), .Y(
        n78) );
  AO22X1M U202 ( .A0(\MEM[2][1] ), .A1(n184), .B0(\MEM[0][1] ), .B1(n186), .Y(
        n79) );
  OAI22X1M U203 ( .A0(n178), .A1(n83), .B0(n179), .B1(n81), .Y(R_data[1]) );
  AO22X1M U204 ( .A0(\MEM[3][2] ), .A1(n184), .B0(\MEM[1][2] ), .B1(n186), .Y(
        n84) );
  AO22X1M U205 ( .A0(\MEM[2][2] ), .A1(n184), .B0(\MEM[0][2] ), .B1(n186), .Y(
        n85) );
  OAI22X1M U206 ( .A0(n178), .A1(n151), .B0(n179), .B1(n150), .Y(R_data[2]) );
  AO22X1M U207 ( .A0(\MEM[3][3] ), .A1(n184), .B0(\MEM[1][3] ), .B1(n186), .Y(
        n152) );
  AO22X1M U208 ( .A0(\MEM[2][3] ), .A1(n184), .B0(\MEM[0][3] ), .B1(n186), .Y(
        n153) );
  OAI22X1M U209 ( .A0(n178), .A1(n155), .B0(n179), .B1(n154), .Y(R_data[3]) );
  AO22X1M U210 ( .A0(\MEM[3][4] ), .A1(n183), .B0(\MEM[1][4] ), .B1(n185), .Y(
        n156) );
  AO22X1M U211 ( .A0(\MEM[2][4] ), .A1(n183), .B0(\MEM[0][4] ), .B1(n185), .Y(
        n157) );
  OAI22X1M U212 ( .A0(n178), .A1(n159), .B0(n179), .B1(n158), .Y(R_data[4]) );
  AO22X1M U213 ( .A0(\MEM[3][5] ), .A1(n183), .B0(\MEM[1][5] ), .B1(n185), .Y(
        n160) );
  AO22X1M U214 ( .A0(\MEM[2][5] ), .A1(n183), .B0(\MEM[0][5] ), .B1(n185), .Y(
        n161) );
  OAI22X1M U215 ( .A0(n178), .A1(n163), .B0(n179), .B1(n162), .Y(R_data[5]) );
  AO22X1M U216 ( .A0(\MEM[3][6] ), .A1(n183), .B0(\MEM[1][6] ), .B1(n185), .Y(
        n164) );
  AO22X1M U217 ( .A0(\MEM[2][6] ), .A1(n183), .B0(\MEM[0][6] ), .B1(n185), .Y(
        n165) );
  OAI22X1M U218 ( .A0(n178), .A1(n167), .B0(n179), .B1(n166), .Y(R_data[6]) );
  AO22X1M U219 ( .A0(\MEM[3][7] ), .A1(n183), .B0(\MEM[1][7] ), .B1(n185), .Y(
        n168) );
  AO22X1M U220 ( .A0(\MEM[2][7] ), .A1(n183), .B0(\MEM[0][7] ), .B1(n185), .Y(
        n171) );
  OAI22X1M U221 ( .A0(n175), .A1(n178), .B0(n179), .B1(n174), .Y(R_data[7]) );
  INVXLM U222 ( .A(test_so1), .Y(n216) );
  INVXLM U223 ( .A(n216), .Y(n217) );
  DLY1X1M U224 ( .A(n249), .Y(n218) );
  DLY1X1M U225 ( .A(n250), .Y(n219) );
  DLY1X1M U226 ( .A(n251), .Y(n220) );
  DLY1X1M U227 ( .A(n252), .Y(n221) );
  DLY1X1M U228 ( .A(n255), .Y(n222) );
  DLY1X1M U229 ( .A(n256), .Y(n223) );
  DLY1X1M U230 ( .A(n257), .Y(n224) );
  DLY1X1M U231 ( .A(n259), .Y(n225) );
  DLY1X1M U232 ( .A(n260), .Y(n226) );
  DLY1X1M U233 ( .A(n261), .Y(n227) );
  DLY1X1M U234 ( .A(n262), .Y(n228) );
  DLY1X1M U235 ( .A(n263), .Y(n229) );
  DLY1X1M U236 ( .A(n264), .Y(n230) );
  DLY1X1M U237 ( .A(n265), .Y(n231) );
  DLY1X1M U238 ( .A(n266), .Y(n232) );
  DLY1X1M U239 ( .A(n267), .Y(n233) );
  DLY1X1M U240 ( .A(n268), .Y(n234) );
  DLY1X1M U241 ( .A(n269), .Y(n235) );
  DLY1X1M U242 ( .A(n270), .Y(n236) );
  DLY1X1M U243 ( .A(n250), .Y(n237) );
  DLY1X1M U244 ( .A(n273), .Y(n238) );
  DLY1X1M U245 ( .A(n274), .Y(n239) );
  DLY1X1M U246 ( .A(n275), .Y(n240) );
  DLY1X1M U247 ( .A(n276), .Y(n241) );
  DLY1X1M U248 ( .A(n277), .Y(n242) );
  DLY1X1M U249 ( .A(n278), .Y(n243) );
  DLY1X1M U250 ( .A(n279), .Y(n244) );
  DLY1X1M U251 ( .A(n253), .Y(n245) );
  DLY1X1M U252 ( .A(n253), .Y(n246) );
  DLY1X1M U253 ( .A(n254), .Y(n247) );
  DLY1X1M U254 ( .A(n254), .Y(n248) );
  DLY1X1M U255 ( .A(n247), .Y(n249) );
  DLY1X1M U256 ( .A(n248), .Y(n250) );
  DLY1X1M U257 ( .A(n246), .Y(n251) );
  DLY1X1M U258 ( .A(n245), .Y(n252) );
  DLY1X1M U259 ( .A(test_se), .Y(n253) );
  DLY1X1M U260 ( .A(test_se), .Y(n254) );
  DLY1X1M U261 ( .A(n245), .Y(n255) );
  DLY1X1M U262 ( .A(n248), .Y(n256) );
  DLY1X1M U263 ( .A(n247), .Y(n257) );
  DLY1X1M U264 ( .A(n246), .Y(n258) );
  DLY1X1M U265 ( .A(n249), .Y(n259) );
  DLY1X1M U266 ( .A(n223), .Y(n260) );
  DLY1X1M U267 ( .A(n222), .Y(n261) );
  DLY1X1M U268 ( .A(n258), .Y(n262) );
  DLY1X1M U269 ( .A(n224), .Y(n263) );
  DLY1X1M U270 ( .A(n224), .Y(n264) );
  DLY1X1M U271 ( .A(n255), .Y(n265) );
  DLY1X1M U272 ( .A(n221), .Y(n266) );
  DLY1X1M U273 ( .A(n218), .Y(n267) );
  DLY1X1M U274 ( .A(n218), .Y(n268) );
  DLY1X1M U275 ( .A(n222), .Y(n269) );
  DLY1X1M U276 ( .A(n220), .Y(n270) );
  DLY1X1M U277 ( .A(n219), .Y(n271) );
  DLY1X1M U278 ( .A(n219), .Y(n272) );
  DLY1X1M U279 ( .A(n221), .Y(n273) );
  DLY1X1M U280 ( .A(n252), .Y(n274) );
  DLY1X1M U281 ( .A(n223), .Y(n275) );
  DLY1X1M U282 ( .A(n256), .Y(n276) );
  DLY1X1M U283 ( .A(n220), .Y(n277) );
  DLY1X1M U284 ( .A(n251), .Y(n278) );
  DLY1X1M U285 ( .A(n257), .Y(n279) );
  DLY1X1M U286 ( .A(n217), .Y(n280) );
  INVXLM U2 ( .A(\MEM[6][2] ), .Y(n1) );
  INVX2M U3 ( .A(n1), .Y(test_so1) );
  NOR2X2M U4 ( .A(N11), .B(N12), .Y(n169) );
  AND3X1M U5 ( .A(W_addr[0]), .B(n212), .C(n82), .Y(n70) );
  AND3X1M U6 ( .A(n76), .B(n212), .C(W_addr[0]), .Y(n71) );
  CLKINVX2M U7 ( .A(W_addr[0]), .Y(n211) );
endmodule


module FIFO_WR_test_1 ( W_inc, W_clk, W_rst, SYNC_R_ptr, W_ptr, W_addr, W_full, 
        test_si, test_se );
  input [3:0] SYNC_R_ptr;
  output [3:0] W_ptr;
  output [2:0] W_addr;
  input W_inc, W_clk, W_rst, test_si, test_se;
  output W_full;
  wire   n6, \W_counter[3] , n12, n13, n14, n16, n17, n18, n19, n20, n21, n1,
         n15, n22, n25, n26, n27, n28, n29, n30, n31, n32, n3, n4, n5;
  wire   [3:0] W_counter_next;
  wire   [2:0] W_ptr_next;

  SDFFRQX2M \W_counter_reg[3]  ( .D(W_counter_next[3]), .SI(n32), .SE(n31), 
        .CK(W_clk), .RN(n15), .Q(\W_counter[3] ) );
  SDFFRQX2M \W_ptr_reg[0]  ( .D(W_ptr_next[0]), .SI(\W_counter[3] ), .SE(n27), 
        .CK(W_clk), .RN(n15), .Q(W_ptr[0]) );
  SDFFRQX2M \W_ptr_reg[1]  ( .D(W_ptr_next[1]), .SI(W_ptr[0]), .SE(n26), .CK(
        W_clk), .RN(n15), .Q(W_ptr[1]) );
  SDFFRQX2M \W_ptr_reg[3]  ( .D(W_counter_next[3]), .SI(W_ptr[2]), .SE(n31), 
        .CK(W_clk), .RN(n15), .Q(W_ptr[3]) );
  SDFFRQX2M \W_ptr_reg[2]  ( .D(W_ptr_next[2]), .SI(W_ptr[1]), .SE(n27), .CK(
        W_clk), .RN(n15), .Q(W_ptr[2]) );
  SDFFRQX2M \W_counter_reg[2]  ( .D(n1), .SI(W_addr[1]), .SE(n26), .CK(W_clk), 
        .RN(n15), .Q(W_addr[2]) );
  XNOR2X4M U11 ( .A(n32), .B(n14), .Y(n1) );
  INVX4M U14 ( .A(n22), .Y(n15) );
  INVX2M U15 ( .A(W_rst), .Y(n22) );
  INVX4M U16 ( .A(n12), .Y(W_full) );
  CLKXOR2X2M U17 ( .A(n1), .B(W_counter_next[1]), .Y(W_ptr_next[1]) );
  CLKXOR2X2M U18 ( .A(W_counter_next[1]), .B(W_counter_next[0]), .Y(
        W_ptr_next[0]) );
  CLKXOR2X2M U19 ( .A(W_counter_next[3]), .B(n1), .Y(W_ptr_next[2]) );
  CLKXOR2X2M U21 ( .A(n16), .B(W_addr[1]), .Y(W_counter_next[1]) );
  XNOR2X4M U22 ( .A(n13), .B(\W_counter[3] ), .Y(W_counter_next[3]) );
  NAND2BX2M U23 ( .AN(n14), .B(W_addr[2]), .Y(n13) );
  CLKXOR2X2M U24 ( .A(W_ptr[3]), .B(SYNC_R_ptr[3]), .Y(n21) );
  NAND4X2M U26 ( .A(n18), .B(n19), .C(n20), .D(n21), .Y(n12) );
  XNOR2X2M U27 ( .A(W_ptr[1]), .B(SYNC_R_ptr[1]), .Y(n18) );
  XNOR2X2M U28 ( .A(W_ptr[0]), .B(SYNC_R_ptr[0]), .Y(n19) );
  CLKXOR2X2M U29 ( .A(W_ptr[2]), .B(SYNC_R_ptr[2]), .Y(n20) );
  NAND2X2M U30 ( .A(W_addr[1]), .B(n16), .Y(n14) );
  DLY1X1M U32 ( .A(n28), .Y(n25) );
  DLY1X1M U33 ( .A(n29), .Y(n26) );
  DLY1X1M U34 ( .A(n30), .Y(n27) );
  DLY1X1M U35 ( .A(test_se), .Y(n28) );
  DLY1X1M U36 ( .A(n28), .Y(n29) );
  DLY1X1M U37 ( .A(n25), .Y(n30) );
  DLY1X1M U38 ( .A(n25), .Y(n31) );
  DLY1X1M U39 ( .A(W_addr[2]), .Y(n32) );
  SDFFRQX4M \W_counter_reg[0]  ( .D(W_counter_next[0]), .SI(test_si), .SE(n30), 
        .CK(W_clk), .RN(n15), .Q(n6) );
  SDFFRQX4M \W_counter_reg[1]  ( .D(W_counter_next[1]), .SI(n5), .SE(n29), 
        .CK(W_clk), .RN(n15), .Q(W_addr[1]) );
  NOR2BX2M U3 ( .AN(n3), .B(n17), .Y(n16) );
  NAND2X6M U4 ( .A(W_inc), .B(n12), .Y(n17) );
  BUFX4M U5 ( .A(n6), .Y(W_addr[0]) );
  CLKBUFX1M U6 ( .A(n6), .Y(n3) );
  CLKBUFX1M U7 ( .A(n6), .Y(n4) );
  CLKBUFX1M U8 ( .A(n6), .Y(n5) );
  XNOR2X2M U9 ( .A(n17), .B(n4), .Y(W_counter_next[0]) );
endmodule


module FIFO_RD_test_1 ( R_inc, R_clk, R_rst, SYNC_W_ptr, R_ptr, R_addr, 
        R_empty, test_si, test_se );
  input [3:0] SYNC_W_ptr;
  output [3:0] R_ptr;
  output [2:0] R_addr;
  input R_inc, R_clk, R_rst, test_si, test_se;
  output R_empty;
  wire   \R_counter[3] , n11, n12, n13, n14, n15, n16, n17, n18, n19, n20, n21,
         n24, n25, n26, n27, n28, n29;
  wire   [3:0] R_counter_next;
  wire   [2:0] R_ptr_next;

  SDFFRQX2M \R_counter_reg[3]  ( .D(R_counter_next[3]), .SI(R_addr[2]), .SE(
        n29), .CK(R_clk), .RN(n20), .Q(\R_counter[3] ) );
  SDFFRQX2M \R_ptr_reg[0]  ( .D(R_ptr_next[0]), .SI(\R_counter[3] ), .SE(n26), 
        .CK(R_clk), .RN(n20), .Q(R_ptr[0]) );
  SDFFRQX2M \R_ptr_reg[3]  ( .D(R_counter_next[3]), .SI(R_ptr[2]), .SE(n25), 
        .CK(R_clk), .RN(n20), .Q(R_ptr[3]) );
  SDFFRQX2M \R_ptr_reg[2]  ( .D(R_ptr_next[2]), .SI(R_ptr[1]), .SE(n29), .CK(
        R_clk), .RN(n20), .Q(R_ptr[2]) );
  SDFFRQX2M \R_ptr_reg[1]  ( .D(R_ptr_next[1]), .SI(R_ptr[0]), .SE(n26), .CK(
        R_clk), .RN(n20), .Q(R_ptr[1]) );
  SDFFRQX2M \R_counter_reg[0]  ( .D(R_counter_next[0]), .SI(test_si), .SE(n25), 
        .CK(R_clk), .RN(n20), .Q(R_addr[0]) );
  NOR2BX2M U13 ( .AN(R_addr[0]), .B(n15), .Y(n14) );
  INVX4M U14 ( .A(n21), .Y(n20) );
  INVX2M U15 ( .A(R_rst), .Y(n21) );
  CLKXOR2X2M U16 ( .A(R_counter_next[2]), .B(R_counter_next[1]), .Y(
        R_ptr_next[1]) );
  CLKXOR2X2M U17 ( .A(R_counter_next[3]), .B(R_counter_next[2]), .Y(
        R_ptr_next[2]) );
  CLKXOR2X2M U18 ( .A(R_counter_next[1]), .B(R_counter_next[0]), .Y(
        R_ptr_next[0]) );
  INVX2M U19 ( .A(n11), .Y(R_empty) );
  CLKXOR2X2M U20 ( .A(R_addr[1]), .B(n14), .Y(R_counter_next[1]) );
  XNOR2X4M U21 ( .A(n13), .B(R_addr[2]), .Y(R_counter_next[2]) );
  XNOR2X4M U22 ( .A(n12), .B(\R_counter[3] ), .Y(R_counter_next[3]) );
  NAND2BX2M U23 ( .AN(n13), .B(R_addr[2]), .Y(n12) );
  XNOR2X4M U24 ( .A(n15), .B(R_addr[0]), .Y(R_counter_next[0]) );
  XNOR2X2M U25 ( .A(SYNC_W_ptr[2]), .B(R_ptr[2]), .Y(n19) );
  NAND4X2M U26 ( .A(n16), .B(n17), .C(n18), .D(n19), .Y(n11) );
  XNOR2X2M U27 ( .A(SYNC_W_ptr[1]), .B(R_ptr[1]), .Y(n16) );
  XNOR2X2M U28 ( .A(SYNC_W_ptr[0]), .B(R_ptr[0]), .Y(n17) );
  XNOR2X2M U29 ( .A(SYNC_W_ptr[3]), .B(R_ptr[3]), .Y(n18) );
  NAND2X2M U30 ( .A(R_addr[1]), .B(n14), .Y(n13) );
  NAND2X2M U31 ( .A(R_inc), .B(n11), .Y(n15) );
  DLY1X1M U32 ( .A(test_se), .Y(n24) );
  DLY1X1M U33 ( .A(n27), .Y(n25) );
  DLY1X1M U34 ( .A(n28), .Y(n26) );
  DLY1X1M U35 ( .A(n24), .Y(n27) );
  DLY1X1M U36 ( .A(test_se), .Y(n28) );
  DLY1X1M U37 ( .A(n24), .Y(n29) );
  SDFFRQX4M \R_counter_reg[2]  ( .D(R_counter_next[2]), .SI(R_addr[1]), .SE(
        n28), .CK(R_clk), .RN(n20), .Q(R_addr[2]) );
  SDFFRQX4M \R_counter_reg[1]  ( .D(R_counter_next[1]), .SI(R_addr[0]), .SE(
        n27), .CK(R_clk), .RN(n20), .Q(R_addr[1]) );
endmodule


module DF_SYNC_test_0 ( ASYNC_data, clk, rst, SYNC_data, test_se );
  input [3:0] ASYNC_data;
  output [3:0] SYNC_data;
  input clk, rst, test_se;
  wire   n9, n10, n12, n13, n14, n15, n16, n17;
  wire   [3:0] stage1;

  SDFFRQX2M \stage2_reg[1]  ( .D(stage1[1]), .SI(SYNC_data[0]), .SE(n14), .CK(
        clk), .RN(n9), .Q(SYNC_data[1]) );
  SDFFRQX2M \stage2_reg[0]  ( .D(stage1[0]), .SI(stage1[3]), .SE(n13), .CK(clk), .RN(n9), .Q(SYNC_data[0]) );
  SDFFRQX2M \stage2_reg[3]  ( .D(stage1[3]), .SI(SYNC_data[2]), .SE(n17), .CK(
        clk), .RN(n9), .Q(SYNC_data[3]) );
  SDFFRQX2M \stage2_reg[2]  ( .D(stage1[2]), .SI(SYNC_data[1]), .SE(n14), .CK(
        clk), .RN(n9), .Q(SYNC_data[2]) );
  SDFFRQX2M \stage1_reg[3]  ( .D(ASYNC_data[3]), .SI(stage1[2]), .SE(n13), 
        .CK(clk), .RN(n9), .Q(stage1[3]) );
  SDFFRQX2M \stage1_reg[2]  ( .D(ASYNC_data[2]), .SI(stage1[1]), .SE(n17), 
        .CK(clk), .RN(n9), .Q(stage1[2]) );
  SDFFRQX2M \stage1_reg[1]  ( .D(ASYNC_data[1]), .SI(stage1[0]), .SE(n16), 
        .CK(clk), .RN(n9), .Q(stage1[1]) );
  SDFFRQX2M \stage1_reg[0]  ( .D(ASYNC_data[0]), .SI(ASYNC_data[3]), .SE(n15), 
        .CK(clk), .RN(n9), .Q(stage1[0]) );
  INVX4M U11 ( .A(n10), .Y(n9) );
  INVX2M U12 ( .A(rst), .Y(n10) );
  DLY1X1M U13 ( .A(test_se), .Y(n12) );
  DLY1X1M U14 ( .A(n15), .Y(n13) );
  DLY1X1M U15 ( .A(n16), .Y(n14) );
  DLY1X1M U16 ( .A(n12), .Y(n15) );
  DLY1X1M U17 ( .A(test_se), .Y(n16) );
  DLY1X1M U18 ( .A(n12), .Y(n17) );
endmodule


module DF_SYNC_test_1 ( ASYNC_data, clk, rst, SYNC_data, test_si, test_se );
  input [3:0] ASYNC_data;
  output [3:0] SYNC_data;
  input clk, rst, test_si, test_se;
  wire   n9, n10, n21, n22, n23, n24, n25, n26;
  wire   [3:0] stage1;

  SDFFRQX2M \stage2_reg[3]  ( .D(stage1[3]), .SI(SYNC_data[2]), .SE(n23), .CK(
        clk), .RN(n9), .Q(SYNC_data[3]) );
  SDFFRQX2M \stage2_reg[2]  ( .D(stage1[2]), .SI(SYNC_data[1]), .SE(n22), .CK(
        clk), .RN(n9), .Q(SYNC_data[2]) );
  SDFFRQX2M \stage2_reg[1]  ( .D(stage1[1]), .SI(SYNC_data[0]), .SE(n26), .CK(
        clk), .RN(n9), .Q(SYNC_data[1]) );
  SDFFRQX2M \stage2_reg[0]  ( .D(stage1[0]), .SI(stage1[3]), .SE(n23), .CK(clk), .RN(n9), .Q(SYNC_data[0]) );
  SDFFRQX2M \stage1_reg[3]  ( .D(ASYNC_data[3]), .SI(stage1[2]), .SE(n22), 
        .CK(clk), .RN(n9), .Q(stage1[3]) );
  SDFFRQX2M \stage1_reg[2]  ( .D(ASYNC_data[2]), .SI(stage1[1]), .SE(n26), 
        .CK(clk), .RN(n9), .Q(stage1[2]) );
  SDFFRQX2M \stage1_reg[1]  ( .D(ASYNC_data[1]), .SI(stage1[0]), .SE(n25), 
        .CK(clk), .RN(n9), .Q(stage1[1]) );
  SDFFRQX2M \stage1_reg[0]  ( .D(ASYNC_data[0]), .SI(test_si), .SE(n24), .CK(
        clk), .RN(n9), .Q(stage1[0]) );
  INVX4M U11 ( .A(n10), .Y(n9) );
  INVX2M U12 ( .A(rst), .Y(n10) );
  DLY1X1M U13 ( .A(test_se), .Y(n21) );
  DLY1X1M U14 ( .A(n24), .Y(n22) );
  DLY1X1M U15 ( .A(n25), .Y(n23) );
  DLY1X1M U16 ( .A(n21), .Y(n24) );
  DLY1X1M U17 ( .A(test_se), .Y(n25) );
  DLY1X1M U18 ( .A(n21), .Y(n26) );
endmodule


module ASYC_FIFO_test_1 ( W_clk, W_rst, W_inc, R_clk, R_rst, R_inc, W_data, 
        W_full, R_empty, R_data, test_si2, test_si1, test_so2, test_so1, 
        test_se );
  input [7:0] W_data;
  output [7:0] R_data;
  input W_clk, W_rst, W_inc, R_clk, R_rst, R_inc, test_si2, test_si1, test_se;
  output W_full, R_empty, test_so2, test_so1;
  wire   n1, n2, n3, n4, n6, n10, n11, n12, n13, n14, n15, n16, n17, n18;
  wire   [2:0] W_addr;
  wire   [2:0] R_addr;
  wire   [3:0] SYNC_R_ptr;
  wire   [3:0] W_ptr;
  wire   [3:0] SYNC_W_ptr;
  wire   [3:0] R_ptr;
  assign test_so2 = SYNC_W_ptr[3];

  INVX2M U3 ( .A(n4), .Y(n3) );
  INVX2M U4 ( .A(R_rst), .Y(n4) );
  INVX2M U5 ( .A(n2), .Y(n1) );
  INVX2M U6 ( .A(W_rst), .Y(n2) );
  DLY1X1M U7 ( .A(n15), .Y(n10) );
  DLY1X1M U8 ( .A(n15), .Y(n11) );
  DLY1X1M U9 ( .A(test_se), .Y(n12) );
  DLY1X1M U10 ( .A(n12), .Y(n13) );
  DLY1X1M U11 ( .A(n12), .Y(n14) );
  DLY1X1M U12 ( .A(n13), .Y(n15) );
  DLY1X1M U13 ( .A(n14), .Y(n16) );
  DLY1X1M U14 ( .A(n13), .Y(n17) );
  DLY1X1M U15 ( .A(n14), .Y(n18) );
  FIFO_MEM_CONTROL_test_1 U0 ( .W_data(W_data), .W_inc(W_inc), .W_full(W_full), 
        .W_addr(W_addr), .R_addr(R_addr), .W_clk(W_clk), .R_data(R_data), 
        .test_si2(test_si2), .test_si1(test_si1), .test_so2(n6), .test_so1(
        test_so1), .test_se(n10) );
  FIFO_WR_test_1 U1 ( .W_inc(W_inc), .W_clk(W_clk), .W_rst(n1), .SYNC_R_ptr(
        SYNC_R_ptr), .W_ptr(W_ptr), .W_addr(W_addr), .W_full(W_full), 
        .test_si(n6), .test_se(n11) );
  FIFO_RD_test_1 U2 ( .R_inc(R_inc), .R_clk(R_clk), .R_rst(n3), .SYNC_W_ptr(
        SYNC_W_ptr), .R_ptr(R_ptr), .R_addr(R_addr), .R_empty(R_empty), 
        .test_si(W_ptr[3]), .test_se(n18) );
  DF_SYNC_test_0 U3_FIFO_WR ( .ASYNC_data(R_ptr), .clk(W_clk), .rst(n1), 
        .SYNC_data(SYNC_R_ptr), .test_se(n17) );
  DF_SYNC_test_1 U4_FIFO_RD ( .ASYNC_data(W_ptr), .clk(R_clk), .rst(n3), 
        .SYNC_data(SYNC_W_ptr), .test_si(SYNC_R_ptr[3]), .test_se(n16) );
endmodule


module FSM_test_1 ( Data_valid, PAR_EN, ser_done, clk, rst, mux_sel, busy, 
        ser_en, test_si, test_so, test_se );
  output [1:0] mux_sel;
  input Data_valid, PAR_EN, ser_done, clk, rst, test_si, test_se;
  output busy, ser_en, test_so;
  wire   n9, n10, n11, n12, n13, n14, n15, n4, n5, n6, n7, n8, n16, n19, n20,
         n21;
  wire   [2:0] current_state;
  wire   [2:0] next_state;
  assign test_so = current_state[2];

  SDFFRQX2M \current_state_reg[2]  ( .D(next_state[2]), .SI(current_state[1]), 
        .SE(n19), .CK(clk), .RN(n4), .Q(current_state[2]) );
  SDFFRQX2M \current_state_reg[1]  ( .D(next_state[1]), .SI(current_state[0]), 
        .SE(n19), .CK(clk), .RN(n4), .Q(current_state[1]) );
  SDFFRQX2M \current_state_reg[0]  ( .D(next_state[0]), .SI(test_si), .SE(
        test_se), .CK(clk), .RN(n4), .Q(current_state[0]) );
  OAI211X2M U6 ( .A0(n15), .A1(n8), .B0(n12), .C0(n11), .Y(busy) );
  NAND2X2M U7 ( .A(current_state[1]), .B(n8), .Y(n11) );
  AOI21X2M U8 ( .A0(n16), .A1(ser_done), .B0(current_state[0]), .Y(n10) );
  BUFX2M U9 ( .A(rst), .Y(n4) );
  INVX2M U10 ( .A(n9), .Y(ser_en) );
  AND2X2M U11 ( .A(n12), .B(n8), .Y(n14) );
  OAI31X2M U12 ( .A0(n16), .A1(n5), .A2(n9), .B0(n13), .Y(next_state[0]) );
  NAND3X2M U13 ( .A(n14), .B(n7), .C(Data_valid), .Y(n13) );
  INVX2M U14 ( .A(ser_done), .Y(n5) );
  NAND2X2M U15 ( .A(n6), .B(n7), .Y(n15) );
  NOR2X2M U16 ( .A(n10), .B(n11), .Y(next_state[2]) );
  INVX2M U17 ( .A(current_state[2]), .Y(n8) );
  NAND2X2M U18 ( .A(n20), .B(n8), .Y(n12) );
  NAND2X2M U19 ( .A(n21), .B(n14), .Y(n9) );
  OAI2B2X1M U20 ( .A1N(n10), .A0(n11), .B0(n12), .B1(current_state[1]), .Y(
        next_state[1]) );
  INVX2M U21 ( .A(current_state[1]), .Y(n7) );
  INVX2M U22 ( .A(current_state[0]), .Y(n6) );
  INVX2M U23 ( .A(PAR_EN), .Y(n16) );
  OAI21X2M U24 ( .A0(current_state[2]), .A1(current_state[0]), .B0(n15), .Y(
        mux_sel[0]) );
  OAI21X2M U25 ( .A0(n6), .A1(n11), .B0(n15), .Y(mux_sel[1]) );
  DLY1X1M U26 ( .A(test_se), .Y(n19) );
  INVXLM U27 ( .A(n6), .Y(n20) );
  INVXLM U28 ( .A(n7), .Y(n21) );
endmodule


module MUX ( mux_sel, ser_data, par_bit, TX_OUT );
  input [1:0] mux_sel;
  input ser_data, par_bit;
  output TX_OUT;
  wire   n1;

  OAI2BB1X2M U3 ( .A0N(ser_data), .A1N(mux_sel[0]), .B0(n1), .Y(TX_OUT) );
  OAI21X2M U4 ( .A0(mux_sel[0]), .A1(par_bit), .B0(mux_sel[1]), .Y(n1) );
endmodule


module Parity_Calculator_test_1 ( P_data, PAR_type, Data_valid, clk, rst, 
        par_bit, test_si, test_se );
  input [7:0] P_data;
  input PAR_type, Data_valid, clk, rst, test_si, test_se;
  output par_bit;
  wire   n1, n3, n4, n5, n6, n8, n2;

  SDFFRQX2M par_bit_reg ( .D(n8), .SI(test_si), .SE(test_se), .CK(clk), .RN(
        rst), .Q(par_bit) );
  XOR3XLM U2 ( .A(P_data[5]), .B(P_data[4]), .C(n6), .Y(n3) );
  CLKXOR2X2M U3 ( .A(P_data[7]), .B(P_data[6]), .Y(n6) );
  XNOR2X2M U4 ( .A(P_data[3]), .B(P_data[2]), .Y(n5) );
  OAI2BB2X1M U5 ( .B0(n1), .B1(n2), .A0N(par_bit), .A1N(n2), .Y(n8) );
  INVX2M U6 ( .A(Data_valid), .Y(n2) );
  XOR3XLM U7 ( .A(n3), .B(PAR_type), .C(n4), .Y(n1) );
  XOR3XLM U8 ( .A(P_data[1]), .B(P_data[0]), .C(n5), .Y(n4) );
endmodule


module Serializer_test_1 ( P_data, ser_en, clk, rst, ser_done, ser_data, 
        test_si, test_se );
  input [7:0] P_data;
  input ser_en, clk, rst, test_si, test_se;
  output ser_done, ser_data;
  wire   n14, n15, n16, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27,
         n28, n29, n30, n7, n8, n9, n10, n11, n12, n13, n34, n35;
  wire   [3:0] counter;

  SDFFRQX2M ser_data_reg ( .D(n27), .SI(counter[2]), .SE(n35), .CK(clk), .RN(
        n7), .Q(ser_data) );
  SDFFRQX2M \counter_reg[2]  ( .D(n28), .SI(counter[1]), .SE(n34), .CK(clk), 
        .RN(n7), .Q(counter[2]) );
  AOI21X2M U11 ( .A0(n8), .A1(n10), .B0(n14), .Y(n25) );
  NAND2X2M U12 ( .A(n26), .B(ser_en), .Y(n23) );
  NOR2X4M U13 ( .A(n13), .B(n10), .Y(n14) );
  BUFX2M U14 ( .A(rst), .Y(n7) );
  INVX2M U15 ( .A(n23), .Y(n10) );
  INVX2M U16 ( .A(ser_en), .Y(n13) );
  OAI32X2M U17 ( .A0(n23), .A1(n8), .A2(n11), .B0(n24), .B1(n12), .Y(n28) );
  AND2X2M U18 ( .A(n25), .B(n23), .Y(n24) );
  OAI2BB2X1M U19 ( .B0(n25), .B1(n11), .A0N(n19), .A1N(n10), .Y(n29) );
  INVX2M U20 ( .A(n26), .Y(ser_done) );
  AOI222X2M U21 ( .A0(P_data[2]), .A1(n19), .B0(n21), .B1(P_data[1]), .C0(
        counter[1]), .C1(n22), .Y(n17) );
  AO22X1M U22 ( .A0(P_data[4]), .A1(counter[0]), .B0(P_data[3]), .B1(n8), .Y(
        n22) );
  AOI22X1M U23 ( .A0(P_data[5]), .A1(n11), .B0(P_data[7]), .B1(counter[1]), 
        .Y(n20) );
  INVX4M U24 ( .A(counter[0]), .Y(n8) );
  OAI22X1M U25 ( .A0(n8), .A1(n9), .B0(counter[0]), .B1(n23), .Y(n30) );
  INVX2M U26 ( .A(n14), .Y(n9) );
  INVX2M U27 ( .A(counter[1]), .Y(n11) );
  OAI2BB1X2M U28 ( .A0N(ser_data), .A1N(n14), .B0(n15), .Y(n27) );
  AOI22X1M U29 ( .A0(n10), .A1(n16), .B0(P_data[0]), .B1(n13), .Y(n15) );
  OAI22X1M U30 ( .A0(counter[2]), .A1(n17), .B0(n18), .B1(n12), .Y(n16) );
  AOI2BB2X2M U31 ( .B0(P_data[6]), .B1(n19), .A0N(counter[0]), .A1N(n20), .Y(
        n18) );
  NOR2X4M U32 ( .A(n8), .B(counter[1]), .Y(n19) );
  INVX2M U33 ( .A(counter[2]), .Y(n12) );
  DLY1X1M U34 ( .A(test_se), .Y(n34) );
  DLY1X1M U35 ( .A(test_se), .Y(n35) );
  SDFFRQX4M \counter_reg[1]  ( .D(n29), .SI(counter[0]), .SE(n35), .CK(clk), 
        .RN(n7), .Q(counter[1]) );
  SDFFRQX4M \counter_reg[0]  ( .D(n30), .SI(test_si), .SE(n34), .CK(clk), .RN(
        n7), .Q(counter[0]) );
  NAND3X2M U3 ( .A(counter[1]), .B(counter[0]), .C(counter[2]), .Y(n26) );
  NOR2X2M U4 ( .A(counter[1]), .B(counter[0]), .Y(n21) );
endmodule


module UART_TX_top_test_1 ( P_data, Data_valid, PAR_EN, PAR_type, clk, rst, 
        TX_OUT, busy, test_si, test_so, test_se );
  input [7:0] P_data;
  input Data_valid, PAR_EN, PAR_type, clk, rst, test_si, test_se;
  output TX_OUT, busy, test_so;
  wire   ser_done, ser_en, ser_data, par_bit, n1, n4, n6, n8, n10, n12, n14,
         n16, n18, n2, n19, n20, n21, n23, n25, n26, n27, n28, n29, n30, n31,
         n32, n33, n34, n35, n36;
  wire   [7:0] P_data_reg;
  wire   [1:0] mux_sel;
  assign test_so = ser_data;

  SDFFRQX2M \P_data_reg_reg[1]  ( .D(n4), .SI(P_data_reg[0]), .SE(n29), .CK(
        clk), .RN(n19), .Q(P_data_reg[1]) );
  SDFFRQX2M \P_data_reg_reg[4]  ( .D(n10), .SI(P_data_reg[3]), .SE(n26), .CK(
        clk), .RN(n19), .Q(P_data_reg[4]) );
  SDFFRQX2M \P_data_reg_reg[0]  ( .D(n18), .SI(test_si), .SE(n36), .CK(clk), 
        .RN(n19), .Q(P_data_reg[0]) );
  SDFFRQX2M \P_data_reg_reg[5]  ( .D(n12), .SI(P_data_reg[4]), .SE(n27), .CK(
        clk), .RN(n19), .Q(P_data_reg[5]) );
  SDFFRQX2M \P_data_reg_reg[3]  ( .D(n8), .SI(P_data_reg[2]), .SE(n26), .CK(
        clk), .RN(n19), .Q(P_data_reg[3]) );
  SDFFRQX2M \P_data_reg_reg[7]  ( .D(n16), .SI(P_data_reg[6]), .SE(n29), .CK(
        clk), .RN(n19), .Q(P_data_reg[7]) );
  SDFFRQX2M \P_data_reg_reg[2]  ( .D(n6), .SI(P_data_reg[1]), .SE(n27), .CK(
        clk), .RN(n19), .Q(P_data_reg[2]) );
  SDFFRQX2M \P_data_reg_reg[6]  ( .D(n14), .SI(P_data_reg[5]), .SE(n35), .CK(
        clk), .RN(n19), .Q(P_data_reg[6]) );
  BUFX4M U6 ( .A(n1), .Y(n2) );
  INVX4M U7 ( .A(n2), .Y(n21) );
  NAND2BX2M U8 ( .AN(busy), .B(Data_valid), .Y(n1) );
  INVX6M U9 ( .A(n20), .Y(n19) );
  INVX2M U10 ( .A(rst), .Y(n20) );
  AO22X1M U11 ( .A0(P_data_reg[1]), .A1(n2), .B0(P_data[1]), .B1(n21), .Y(n4)
         );
  AO22X1M U12 ( .A0(P_data_reg[2]), .A1(n2), .B0(P_data[2]), .B1(n21), .Y(n6)
         );
  AO22X1M U13 ( .A0(P_data_reg[3]), .A1(n2), .B0(P_data[3]), .B1(n21), .Y(n8)
         );
  AO22X1M U14 ( .A0(P_data_reg[4]), .A1(n2), .B0(P_data[4]), .B1(n21), .Y(n10)
         );
  AO22X1M U15 ( .A0(P_data_reg[5]), .A1(n2), .B0(P_data[5]), .B1(n21), .Y(n12)
         );
  AO22X1M U24 ( .A0(P_data_reg[6]), .A1(n2), .B0(P_data[6]), .B1(n21), .Y(n14)
         );
  AO22X1M U25 ( .A0(P_data_reg[7]), .A1(n2), .B0(P_data[7]), .B1(n21), .Y(n16)
         );
  AO22X1M U26 ( .A0(P_data_reg[0]), .A1(n2), .B0(P_data[0]), .B1(n21), .Y(n18)
         );
  DLY1X1M U27 ( .A(n34), .Y(n25) );
  DLY1X1M U28 ( .A(n35), .Y(n26) );
  DLY1X1M U29 ( .A(n25), .Y(n27) );
  DLY1X1M U30 ( .A(n34), .Y(n28) );
  DLY1X1M U31 ( .A(n25), .Y(n29) );
  DLY1X1M U32 ( .A(test_se), .Y(n30) );
  DLY1X1M U33 ( .A(n30), .Y(n31) );
  DLY1X1M U34 ( .A(n30), .Y(n32) );
  DLY1X1M U35 ( .A(n32), .Y(n33) );
  DLY1X1M U36 ( .A(n31), .Y(n34) );
  DLY1X1M U37 ( .A(n32), .Y(n35) );
  DLY1X1M U38 ( .A(n31), .Y(n36) );
  FSM_test_1 U1 ( .Data_valid(Data_valid), .PAR_EN(PAR_EN), .ser_done(ser_done), .clk(clk), .rst(n19), .mux_sel(mux_sel), .busy(busy), .ser_en(ser_en), 
        .test_si(P_data_reg[7]), .test_so(n23), .test_se(n28) );
  MUX U2 ( .mux_sel(mux_sel), .ser_data(ser_data), .par_bit(par_bit), .TX_OUT(
        TX_OUT) );
  Parity_Calculator_test_1 U3 ( .P_data(P_data_reg), .PAR_type(PAR_type), 
        .Data_valid(Data_valid), .clk(clk), .rst(n19), .par_bit(par_bit), 
        .test_si(n23), .test_se(n36) );
  Serializer_test_1 U4 ( .P_data(P_data_reg), .ser_en(ser_en), .clk(clk), 
        .rst(n19), .ser_done(ser_done), .ser_data(ser_data), .test_si(par_bit), 
        .test_se(n33) );
endmodule


module FSM_RX_test_1 ( RX_IN, PAR_EN, edge_count, bit_count, PAR_err, STOP_err, 
        START_err, prescale, clk, rst, data_valid, edge_bit_EN, data_sample_EN, 
        deser_EN, in_data_state, in_start_state, start_check_EN, 
        parity_check_EN, stop_check_EN, test_si, test_se );
  input [4:0] edge_count;
  input [3:0] bit_count;
  input [5:0] prescale;
  input RX_IN, PAR_EN, PAR_err, STOP_err, START_err, clk, rst, test_si,
         test_se;
  output data_valid, edge_bit_EN, data_sample_EN, deser_EN, in_data_state,
         in_start_state, start_check_EN, parity_check_EN, stop_check_EN;
  wire   N37, N38, N39, N40, N41, N42, N43, N123, n27, n28, n29, n30, n31, n32,
         n33, n34, n35, n36, n37, n38, n39, n1, n5, n6, n7, n8, n9, n10, n11,
         n12, n13, n14, n19, n20, n21, n22, n23, n24, n25, n26, n40, n41, n42,
         n43, n46, n47, n48;
  wire   [2:0] current_state;
  wire   [2:0] next_state;

  NAND4BX4M U22 ( .AN(bit_count[3]), .B(bit_count[0]), .C(bit_count[2]), .D(
        bit_count[1]), .Y(n31) );
  OAI21BX8M U24 ( .A0(current_state[2]), .A1(RX_IN), .B0N(data_sample_EN), .Y(
        edge_bit_EN) );
  SDFFRQX2M \current_state_reg[0]  ( .D(next_state[0]), .SI(test_si), .SE(n47), 
        .CK(clk), .RN(n5), .Q(current_state[0]) );
  SDFFRQX2M data_valid_reg ( .D(N123), .SI(current_state[2]), .SE(n46), .CK(
        clk), .RN(n5), .Q(data_valid) );
  BUFX2M U6 ( .A(in_start_state), .Y(start_check_EN) );
  INVX2M U7 ( .A(current_state[1]), .Y(n41) );
  OR2X2M U9 ( .A(current_state[1]), .B(n48), .Y(n1) );
  NAND2BX2M U10 ( .AN(prescale[1]), .B(n11), .Y(n7) );
  OR2X2M U11 ( .A(n9), .B(prescale[4]), .Y(n10) );
  INVX4M U12 ( .A(N43), .Y(n24) );
  NOR4X4M U13 ( .A(n23), .B(n22), .C(n21), .D(n20), .Y(N43) );
  NOR4X1M U14 ( .A(STOP_err), .B(PAR_err), .C(n24), .D(n27), .Y(N123) );
  OR2X2M U17 ( .A(n8), .B(prescale[3]), .Y(n9) );
  NOR2BX2M U18 ( .AN(edge_count[0]), .B(n11), .Y(n12) );
  NOR2BX2M U19 ( .AN(n11), .B(edge_count[0]), .Y(n13) );
  NOR2X8M U20 ( .A(n40), .B(n1), .Y(in_start_state) );
  NOR2X2M U21 ( .A(n10), .B(prescale[5]), .Y(N42) );
  OR2X2M U23 ( .A(n7), .B(n6), .Y(n8) );
  NAND2BX1M U25 ( .AN(n33), .B(N43), .Y(n35) );
  OAI2BB1XLM U26 ( .A0N(n7), .A1N(n6), .B0(n8), .Y(N38) );
  OAI2BB1XLM U27 ( .A0N(n9), .A1N(prescale[4]), .B0(n10), .Y(N40) );
  OAI2BB1XLM U28 ( .A0N(n8), .A1N(prescale[3]), .B0(n9), .Y(N39) );
  NAND3X2M U29 ( .A(n40), .B(n42), .C(current_state[1]), .Y(n33) );
  NOR2X2M U30 ( .A(current_state[0]), .B(current_state[1]), .Y(n39) );
  BUFX2M U31 ( .A(prescale[2]), .Y(n6) );
  BUFX2M U32 ( .A(rst), .Y(n5) );
  INVX2M U33 ( .A(n35), .Y(deser_EN) );
  INVX2M U34 ( .A(n33), .Y(in_data_state) );
  NOR2X2M U35 ( .A(n41), .B(n40), .Y(n28) );
  AND2X2M U36 ( .A(n28), .B(n42), .Y(parity_check_EN) );
  INVX2M U37 ( .A(prescale[0]), .Y(n11) );
  OAI21BX1M U38 ( .A0(n32), .A1(n33), .B0N(n34), .Y(next_state[1]) );
  NOR2X2M U39 ( .A(PAR_EN), .B(n31), .Y(n32) );
  OAI33X2M U40 ( .A0(n41), .A1(current_state[2]), .A2(N43), .B0(n26), .B1(
        START_err), .B2(n24), .Y(n34) );
  INVXLM U41 ( .A(in_start_state), .Y(n26) );
  OAI31X2M U42 ( .A0(n24), .A1(current_state[2]), .A2(n29), .B0(n30), .Y(
        next_state[2]) );
  AOI31X2M U43 ( .A0(current_state[1]), .A1(n43), .A2(n25), .B0(n28), .Y(n29)
         );
  NAND4X1M U44 ( .A(current_state[2]), .B(n24), .C(n40), .D(n41), .Y(n30) );
  INVX2M U45 ( .A(n31), .Y(n25) );
  OAI31X2M U46 ( .A0(n43), .A1(n31), .A2(n35), .B0(n36), .Y(next_state[0]) );
  AOI31X1M U47 ( .A0(n24), .A1(n42), .A2(n37), .B0(n38), .Y(n36) );
  OAI21X2M U48 ( .A0(current_state[1]), .A1(RX_IN), .B0(n40), .Y(n37) );
  INVX2M U50 ( .A(n27), .Y(stop_check_EN) );
  OAI21X6M U51 ( .A0(current_state[2]), .A1(n39), .B0(n27), .Y(data_sample_EN)
         );
  INVX4M U52 ( .A(current_state[0]), .Y(n40) );
  NAND2X2M U53 ( .A(current_state[2]), .B(n39), .Y(n27) );
  INVX2M U54 ( .A(current_state[2]), .Y(n42) );
  INVX2M U55 ( .A(PAR_EN), .Y(n43) );
  OAI2BB1X1M U56 ( .A0N(prescale[0]), .A1N(prescale[1]), .B0(n7), .Y(N37) );
  AO21XLM U57 ( .A0(n10), .A1(prescale[5]), .B0(N42), .Y(N41) );
  OAI2B2X1M U58 ( .A1N(N37), .A0(n12), .B0(edge_count[1]), .B1(n12), .Y(n19)
         );
  OAI2B2X1M U59 ( .A1N(edge_count[1]), .A0(n13), .B0(N37), .B1(n13), .Y(n14)
         );
  NAND4BBX1M U60 ( .AN(N42), .BN(N41), .C(n19), .D(n14), .Y(n23) );
  CLKXOR2X2M U61 ( .A(N40), .B(edge_count[4]), .Y(n22) );
  CLKXOR2X2M U62 ( .A(N38), .B(edge_count[2]), .Y(n21) );
  CLKXOR2X2M U63 ( .A(N39), .B(edge_count[3]), .Y(n20) );
  DLY1X1M U64 ( .A(test_se), .Y(n46) );
  INVXLM U66 ( .A(n42), .Y(n48) );
  SDFFRQX4M \current_state_reg[2]  ( .D(next_state[2]), .SI(current_state[1]), 
        .SE(n47), .CK(clk), .RN(n5), .Q(current_state[2]) );
  SDFFRQX4M \current_state_reg[1]  ( .D(next_state[1]), .SI(current_state[0]), 
        .SE(n46), .CK(clk), .RN(n5), .Q(current_state[1]) );
  NOR4X2M U3 ( .A(current_state[1]), .B(current_state[0]), .C(RX_IN), .D(n24), 
        .Y(n38) );
  BUFX2M U4 ( .A(test_se), .Y(n47) );
endmodule


module Edge_Bit_Counter_test_1 ( edge_bit_EN, in_data_state, in_start_state, 
        prescale, clk, rst, edge_count, bit_count, test_si, test_so, test_se
 );
  input [5:0] prescale;
  output [4:0] edge_count;
  output [3:0] bit_count;
  input edge_bit_EN, in_data_state, in_start_state, clk, rst, test_si, test_se;
  output test_so;
  wire   n64, n65, n66, n67, n68, n82, n69, N10, N11, N12, N13, N14, N15, N17,
         N18, N19, N20, N27, N41, N42, N43, N44, N45, n23, n24, n25, n26, n27,
         n28, n29, n30, n31, n32, n33, n34, n35, n36, n37, \add_23/carry[4] ,
         \add_23/carry[3] , \add_23/carry[2] , n1, n2, n4, n15, n17, n41, n42,
         n43, n44, n45, n46, n47, n48, n49, n50, n51, n52, n53, n54, n55, n56,
         n57, n58, n59, n60, n61, n62, n63, n72, n73, n74, n75, n76, n77, n78,
         n79, n81, n3, n5;
  assign test_so = n64;

  SDFFRX1M \bit_count_reg[3]  ( .D(n60), .SI(n82), .SE(n77), .CK(clk), .RN(n42), .Q(bit_count[3]), .QN(n81) );
  SDFFRQX2M \bit_count_reg[1]  ( .D(n36), .SI(n69), .SE(n74), .CK(clk), .RN(
        n42), .Q(bit_count[1]) );
  SDFFRQX2M \bit_count_reg[2]  ( .D(n35), .SI(bit_count[1]), .SE(n73), .CK(clk), .RN(n42), .Q(n82) );
  SDFFRQX2M \edge_count_reg[0]  ( .D(N41), .SI(n5), .SE(n75), .CK(clk), .RN(
        n42), .Q(n68) );
  SDFFRQX2M \edge_count_reg[1]  ( .D(N42), .SI(n68), .SE(n79), .CK(clk), .RN(
        n42), .Q(n67) );
  SDFFRQX2M \bit_count_reg[0]  ( .D(n37), .SI(test_si), .SE(n78), .CK(clk), 
        .RN(n42), .Q(n69) );
  AOI21BX1M U6 ( .A0(prescale[0]), .A1(prescale[1]), .B0N(n45), .Y(n1) );
  INVX2M U7 ( .A(n2), .Y(bit_count[0]) );
  INVX2M U14 ( .A(n69), .Y(n2) );
  NOR4BX2M U15 ( .AN(n53), .B(N14), .C(N13), .D(n52), .Y(n54) );
  INVX6M U16 ( .A(n43), .Y(n42) );
  NAND2BX2M U17 ( .AN(prescale[1]), .B(n49), .Y(n45) );
  OR2X2M U18 ( .A(n47), .B(prescale[4]), .Y(n48) );
  INVXLM U19 ( .A(n64), .Y(n4) );
  INVX6M U20 ( .A(n4), .Y(edge_count[4]) );
  INVXLM U21 ( .A(n65), .Y(n15) );
  INVX6M U22 ( .A(n15), .Y(edge_count[3]) );
  INVXLM U23 ( .A(n66), .Y(n17) );
  INVX6M U24 ( .A(n17), .Y(edge_count[2]) );
  BUFX10M U29 ( .A(n67), .Y(edge_count[1]) );
  INVX2M U30 ( .A(in_start_state), .Y(n63) );
  CLKINVX8M U31 ( .A(N17), .Y(edge_count[0]) );
  INVX2M U32 ( .A(n68), .Y(N17) );
  OR2X2M U33 ( .A(n46), .B(prescale[3]), .Y(n47) );
  NOR2X2M U34 ( .A(n48), .B(prescale[5]), .Y(N14) );
  NAND2X4M U35 ( .A(N15), .B(edge_bit_EN), .Y(n34) );
  OR2X2M U36 ( .A(n45), .B(n44), .Y(n46) );
  OAI2BB1XLM U37 ( .A0N(n45), .A1N(n44), .B0(n46), .Y(N10) );
  NOR2X2M U38 ( .A(N17), .B(n49), .Y(n50) );
  NAND4X2M U39 ( .A(n57), .B(n56), .C(n55), .D(n54), .Y(N15) );
  OAI2BB1XLM U40 ( .A0N(n47), .A1N(prescale[4]), .B0(n48), .Y(N12) );
  OAI2BB1XLM U41 ( .A0N(n46), .A1N(prescale[3]), .B0(n47), .Y(N11) );
  NOR2BX1M U42 ( .AN(N17), .B(n34), .Y(N41) );
  NOR2X1M U43 ( .A(n41), .B(n34), .Y(N45) );
  OAI21X2M U44 ( .A0(bit_count[0]), .A1(n29), .B0(n32), .Y(n31) );
  INVX2M U45 ( .A(bit_count[1]), .Y(n61) );
  BUFX2M U46 ( .A(prescale[2]), .Y(n44) );
  INVX2M U47 ( .A(rst), .Y(n43) );
  NAND3X2M U48 ( .A(N27), .B(n63), .C(in_data_state), .Y(n33) );
  INVX2M U49 ( .A(n29), .Y(n59) );
  AND2X2M U50 ( .A(in_data_state), .B(N27), .Y(n26) );
  NAND2BX4M U51 ( .AN(n33), .B(edge_bit_EN), .Y(n29) );
  NAND3X2M U52 ( .A(n33), .B(n63), .C(edge_bit_EN), .Y(n32) );
  NOR2BX2M U53 ( .AN(N18), .B(n34), .Y(N42) );
  NOR2BX2M U54 ( .AN(N19), .B(n34), .Y(N43) );
  NOR2BX2M U55 ( .AN(N20), .B(n34), .Y(N44) );
  NOR2X2M U56 ( .A(n61), .B(n2), .Y(n27) );
  INVX2M U57 ( .A(prescale[0]), .Y(n49) );
  OAI32X2M U58 ( .A0(n28), .A1(n61), .A2(n29), .B0(n30), .B1(n62), .Y(n35) );
  NAND2X2M U59 ( .A(bit_count[0]), .B(n62), .Y(n28) );
  AOI21X2M U60 ( .A0(n59), .A1(n61), .B0(n31), .Y(n30) );
  INVX2M U61 ( .A(n82), .Y(n62) );
  OAI32X2M U62 ( .A0(n29), .A1(bit_count[1]), .A2(n2), .B0(n58), .B1(n61), .Y(
        n36) );
  INVX2M U63 ( .A(n31), .Y(n58) );
  OAI22X1M U64 ( .A0(n2), .A1(n32), .B0(bit_count[0]), .B1(n29), .Y(n37) );
  INVX2M U65 ( .A(n23), .Y(n60) );
  OAI2B11X2M U66 ( .A1N(n24), .A0(n25), .B0(edge_bit_EN), .C0(n63), .Y(n23) );
  NAND4X2M U67 ( .A(n82), .B(n27), .C(n26), .D(n5), .Y(n24) );
  AOI31X2M U68 ( .A0(n82), .A1(n26), .A2(n27), .B0(n5), .Y(n25) );
  XNOR2X2M U69 ( .A(\add_23/carry[4] ), .B(edge_count[4]), .Y(n41) );
  ADDHX1M U70 ( .A(edge_count[1]), .B(n68), .CO(\add_23/carry[2] ), .S(N18) );
  ADDHX1M U71 ( .A(edge_count[2]), .B(\add_23/carry[2] ), .CO(
        \add_23/carry[3] ), .S(N19) );
  ADDHX1M U72 ( .A(edge_count[3]), .B(\add_23/carry[3] ), .CO(
        \add_23/carry[4] ), .S(N20) );
  AO21XLM U73 ( .A0(n48), .A1(prescale[5]), .B0(N14), .Y(N13) );
  XNOR2X1M U74 ( .A(N11), .B(edge_count[3]), .Y(n57) );
  XNOR2X1M U75 ( .A(N10), .B(edge_count[2]), .Y(n56) );
  XNOR2X1M U76 ( .A(N12), .B(edge_count[4]), .Y(n55) );
  OAI22X1M U77 ( .A0(edge_count[1]), .A1(n50), .B0(n50), .B1(n1), .Y(n53) );
  CLKNAND2X2M U78 ( .A(n49), .B(N17), .Y(n51) );
  AOI22X1M U79 ( .A0(n51), .A1(n1), .B0(n51), .B1(edge_count[1]), .Y(n52) );
  CLKINVX1M U80 ( .A(N15), .Y(N27) );
  DLY1X1M U81 ( .A(n76), .Y(n72) );
  DLY1X1M U82 ( .A(n78), .Y(n73) );
  DLY1X1M U83 ( .A(n79), .Y(n74) );
  DLY1X1M U84 ( .A(n77), .Y(n75) );
  DLY1X1M U85 ( .A(test_se), .Y(n76) );
  DLY1X1M U86 ( .A(n76), .Y(n77) );
  DLY1X1M U87 ( .A(n72), .Y(n78) );
  DLY1X1M U88 ( .A(n72), .Y(n79) );
  INVXLM U89 ( .A(n62), .Y(bit_count[2]) );
  SDFFRQX2M \edge_count_reg[4]  ( .D(N45), .SI(n65), .SE(n75), .CK(clk), .RN(
        n42), .Q(n64) );
  SDFFRQX2M \edge_count_reg[3]  ( .D(N44), .SI(n66), .SE(n73), .CK(clk), .RN(
        n42), .Q(n65) );
  SDFFRQX2M \edge_count_reg[2]  ( .D(N43), .SI(n67), .SE(n74), .CK(clk), .RN(
        n42), .Q(n66) );
  INVXLM U3 ( .A(n81), .Y(n3) );
  INVX2M U4 ( .A(n3), .Y(n5) );
endmodule


module Data_Sampler_test_1 ( RX_IN, prescale, edge_count, data_sample_EN, clk, 
        rst, sampled_bit, test_si, test_so, test_se );
  input [5:0] prescale;
  input [4:0] edge_count;
  input RX_IN, data_sample_EN, clk, rst, test_si, test_se;
  output sampled_bit, test_so;
  wire   N11, N13, N14, N15, N17, N18, N19, N20, N21, N22, N23, N24, N25, N27,
         N28, N29, N30, N31, N32, n26, n27, n28, n29, n31, n32, n33, n34, n35,
         n36, n37, n38, n39, \add_22/carry[4] , \add_22/carry[3] ,
         \add_22/carry[2] , \sub_20/carry[4] , \sub_20/carry[3] , n1, n2, n3,
         n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n20, n21, n22, n23,
         n24, n25, n30, n40, n41, n42, n43, n44, n45, n46, n47, n48, n49, n50,
         n51, n52, n53, n54, n55, n56, n57, n58, n59, n60, n61, n62, n63, n64,
         n65, n66, n69, n70, n71, n72;
  wire   [1:0] counter;
  wire   [2:0] compare;
  assign test_so = counter[1];
  assign N11 = prescale[1];

  OAI2BB1X4M U15 ( .A0N(compare[0]), .A1N(compare[1]), .B0(n26), .Y(
        sampled_bit) );
  NOR3BX4M U21 ( .AN(data_sample_EN), .B(n1), .C(counter[1]), .Y(n28) );
  SDFFRQX2M \counter_reg[0]  ( .D(n39), .SI(compare[2]), .SE(n70), .CK(clk), 
        .RN(n5), .Q(counter[0]) );
  SDFFRQX2M \compare_reg[2]  ( .D(n37), .SI(compare[1]), .SE(n72), .CK(clk), 
        .RN(n5), .Q(compare[2]) );
  SDFFRQX2M \counter_reg[1]  ( .D(n38), .SI(counter[0]), .SE(n70), .CK(clk), 
        .RN(n5), .Q(counter[1]) );
  SDFFRQX2M \compare_reg[1]  ( .D(n36), .SI(compare[0]), .SE(n72), .CK(clk), 
        .RN(n5), .Q(compare[1]) );
  SDFFRQX2M \compare_reg[0]  ( .D(n35), .SI(test_si), .SE(n71), .CK(clk), .RN(
        n5), .Q(compare[0]) );
  OR2X2M U5 ( .A(n4), .B(N17), .Y(n1) );
  INVX2M U6 ( .A(N11), .Y(N18) );
  OR2X2M U7 ( .A(N24), .B(N32), .Y(n2) );
  NOR2X2M U8 ( .A(prescale[5]), .B(\sub_20/carry[4] ), .Y(n3) );
  NOR2X1M U9 ( .A(N25), .B(n2), .Y(n4) );
  NOR2BX2M U10 ( .AN(edge_count[0]), .B(N18), .Y(n30) );
  NOR2BX2M U11 ( .AN(N18), .B(edge_count[0]), .Y(n25) );
  NOR4X4M U16 ( .A(n24), .B(n23), .C(n22), .D(n21), .Y(N17) );
  OR2X2M U17 ( .A(n7), .B(N11), .Y(n9) );
  NOR2BX2M U18 ( .AN(edge_count[0]), .B(N18), .Y(n55) );
  NOR3X4M U19 ( .A(prescale[4]), .B(prescale[5]), .C(n10), .Y(N23) );
  NOR2BX2M U20 ( .AN(N11), .B(edge_count[0]), .Y(n46) );
  NOR2BX2M U22 ( .AN(N11), .B(edge_count[0]), .Y(n12) );
  NOR2BX2M U23 ( .AN(edge_count[0]), .B(N11), .Y(n13) );
  OR2X2M U24 ( .A(n9), .B(prescale[3]), .Y(n10) );
  OAI2BB1XLM U25 ( .A0N(n9), .A1N(prescale[3]), .B0(n10), .Y(N20) );
  NOR2BX2M U26 ( .AN(N18), .B(edge_count[0]), .Y(n54) );
  NOR2BX2M U27 ( .AN(edge_count[0]), .B(N11), .Y(n47) );
  XOR2X1M U28 ( .A(prescale[3]), .B(edge_count[2]), .Y(n53) );
  XOR2X1M U29 ( .A(prescale[4]), .B(edge_count[3]), .Y(n51) );
  XOR2X1M U30 ( .A(prescale[5]), .B(edge_count[4]), .Y(n50) );
  NAND2XLM U31 ( .A(n63), .B(n65), .Y(n32) );
  AOI21X1M U32 ( .A0(n63), .A1(n64), .B0(n33), .Y(n34) );
  INVXLM U33 ( .A(n33), .Y(n62) );
  INVX4M U34 ( .A(n8), .Y(n7) );
  INVX2M U35 ( .A(prescale[2]), .Y(n8) );
  INVX4M U36 ( .A(n6), .Y(n5) );
  INVX2M U37 ( .A(rst), .Y(n6) );
  CLKINVX2M U38 ( .A(n1), .Y(n63) );
  OAI21X4M U39 ( .A0(n63), .A1(N17), .B0(data_sample_EN), .Y(n33) );
  INVX2M U40 ( .A(RX_IN), .Y(n66) );
  OAI32X2M U41 ( .A0(n32), .A1(n64), .A2(n33), .B0(n34), .B1(n65), .Y(n38) );
  INVX2M U42 ( .A(counter[1]), .Y(n65) );
  OAI32X2M U43 ( .A0(n33), .A1(counter[0]), .A2(n1), .B0(n62), .B1(n64), .Y(
        n39) );
  OAI2BB2X1M U44 ( .B0(n27), .B1(n66), .A0N(n27), .A1N(compare[0]), .Y(n35) );
  NAND2X2M U45 ( .A(n28), .B(n64), .Y(n27) );
  OAI2BB2X1M U46 ( .B0(n66), .B1(n29), .A0N(n29), .A1N(compare[1]), .Y(n36) );
  NAND2X1M U47 ( .A(counter[0]), .B(n28), .Y(n29) );
  OAI2BB2X1M U48 ( .B0(n66), .B1(n31), .A0N(n31), .A1N(compare[2]), .Y(n37) );
  NAND4X2M U49 ( .A(counter[1]), .B(data_sample_EN), .C(n63), .D(n64), .Y(n31)
         );
  ADDHX2M U50 ( .A(n7), .B(N11), .CO(\add_22/carry[2] ), .S(N27) );
  ADDHX1M U51 ( .A(prescale[4]), .B(\add_22/carry[3] ), .CO(\add_22/carry[4] ), 
        .S(N29) );
  ADDHX1M U52 ( .A(prescale[3]), .B(\add_22/carry[2] ), .CO(\add_22/carry[3] ), 
        .S(N28) );
  ADDHX1M U53 ( .A(prescale[5]), .B(\add_22/carry[4] ), .CO(N31), .S(N30) );
  OAI21X2M U54 ( .A0(compare[0]), .A1(compare[1]), .B0(compare[2]), .Y(n26) );
  INVX4M U55 ( .A(counter[0]), .Y(n64) );
  XNOR2X1M U56 ( .A(\sub_20/carry[4] ), .B(prescale[5]), .Y(N15) );
  OR2X1M U57 ( .A(prescale[4]), .B(\sub_20/carry[3] ), .Y(\sub_20/carry[4] )
         );
  XNOR2X1M U58 ( .A(\sub_20/carry[3] ), .B(prescale[4]), .Y(N14) );
  OR2X1M U59 ( .A(prescale[3]), .B(n7), .Y(\sub_20/carry[3] ) );
  XNOR2X1M U60 ( .A(n7), .B(prescale[3]), .Y(N13) );
  OAI2BB1X1M U61 ( .A0N(N11), .A1N(n7), .B0(n9), .Y(N19) );
  XNOR2X1M U62 ( .A(prescale[4]), .B(n10), .Y(N21) );
  OAI21X1M U63 ( .A0(prescale[4]), .A1(n10), .B0(prescale[5]), .Y(n11) );
  NAND2BX1M U64 ( .AN(N23), .B(n11), .Y(N22) );
  OAI2B2X1M U65 ( .A1N(edge_count[1]), .A0(n12), .B0(n8), .B1(n12), .Y(n20) );
  OAI2B2X1M U66 ( .A1N(n8), .A0(n13), .B0(edge_count[1]), .B1(n13), .Y(n14) );
  NAND3BX1M U67 ( .AN(n3), .B(n20), .C(n14), .Y(n24) );
  CLKXOR2X2M U68 ( .A(N15), .B(edge_count[4]), .Y(n23) );
  CLKXOR2X2M U69 ( .A(N13), .B(edge_count[2]), .Y(n22) );
  CLKXOR2X2M U70 ( .A(N14), .B(edge_count[3]), .Y(n21) );
  OAI2B2X1M U71 ( .A1N(edge_count[1]), .A0(n25), .B0(N19), .B1(n25), .Y(n41)
         );
  OAI2B2X1M U72 ( .A1N(N19), .A0(n30), .B0(edge_count[1]), .B1(n30), .Y(n40)
         );
  NAND3BX1M U73 ( .AN(N23), .B(n41), .C(n40), .Y(n45) );
  CLKXOR2X2M U74 ( .A(N22), .B(edge_count[4]), .Y(n44) );
  CLKXOR2X2M U75 ( .A(N20), .B(edge_count[2]), .Y(n43) );
  CLKXOR2X2M U76 ( .A(N21), .B(edge_count[3]), .Y(n42) );
  NOR4X1M U77 ( .A(n45), .B(n44), .C(n43), .D(n42), .Y(N24) );
  OAI2B2X1M U78 ( .A1N(edge_count[1]), .A0(n46), .B0(n7), .B1(n46), .Y(n49) );
  OAI2B2X1M U79 ( .A1N(n7), .A0(n47), .B0(edge_count[1]), .B1(n47), .Y(n48) );
  CLKNAND2X2M U80 ( .A(n49), .B(n48), .Y(n52) );
  NOR4X1M U81 ( .A(n53), .B(n52), .C(n51), .D(n50), .Y(N25) );
  OAI2B2X1M U82 ( .A1N(edge_count[1]), .A0(n54), .B0(N27), .B1(n54), .Y(n57)
         );
  OAI2B2X1M U83 ( .A1N(N27), .A0(n55), .B0(edge_count[1]), .B1(n55), .Y(n56)
         );
  NAND3BX1M U84 ( .AN(N31), .B(n57), .C(n56), .Y(n61) );
  CLKXOR2X2M U85 ( .A(N30), .B(edge_count[4]), .Y(n60) );
  CLKXOR2X2M U86 ( .A(N28), .B(edge_count[2]), .Y(n59) );
  CLKXOR2X2M U87 ( .A(N29), .B(edge_count[3]), .Y(n58) );
  NOR4X1M U88 ( .A(n61), .B(n60), .C(n59), .D(n58), .Y(N32) );
  DLY1X1M U89 ( .A(test_se), .Y(n69) );
  DLY1X1M U90 ( .A(n71), .Y(n70) );
  DLY1X1M U91 ( .A(n69), .Y(n71) );
  DLY1X1M U92 ( .A(n69), .Y(n72) );
endmodule


module Deserializer_test_1 ( sampled_bit, deser_EN, in_start_state, clk, rst, 
        P_DATA, test_si, test_so, test_se );
  output [7:0] P_DATA;
  input sampled_bit, deser_EN, in_start_state, clk, rst, test_si, test_se;
  output test_so;
  wire   n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32,
         n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44, n45, n46,
         n47, n48, n12, n13, n14, n15, n16, n17, n18, n49, n50, n53, n54, n55,
         n56, n57, n58, n59, n60, n61, n62, n63;
  wire   [2:0] counter;
  assign test_so = counter[2];

  SDFFRQX2M \counter_reg[1]  ( .D(n47), .SI(counter[0]), .SE(n56), .CK(clk), 
        .RN(n12), .Q(counter[1]) );
  SDFFRQX2M \counter_reg[2]  ( .D(n46), .SI(counter[1]), .SE(n55), .CK(clk), 
        .RN(n12), .Q(counter[2]) );
  SDFFRQX2M \P_DATA_reg[5]  ( .D(n43), .SI(P_DATA[4]), .SE(n59), .CK(clk), 
        .RN(n12), .Q(P_DATA[5]) );
  SDFFRQX2M \P_DATA_reg[1]  ( .D(n39), .SI(P_DATA[0]), .SE(n62), .CK(clk), 
        .RN(n12), .Q(P_DATA[1]) );
  SDFFRQX2M \P_DATA_reg[4]  ( .D(n42), .SI(P_DATA[3]), .SE(n61), .CK(clk), 
        .RN(n12), .Q(P_DATA[4]) );
  SDFFRQX2M \P_DATA_reg[0]  ( .D(n38), .SI(test_si), .SE(n55), .CK(clk), .RN(
        n12), .Q(P_DATA[0]) );
  SDFFRQX2M \P_DATA_reg[7]  ( .D(n45), .SI(P_DATA[6]), .SE(n56), .CK(clk), 
        .RN(n12), .Q(P_DATA[7]) );
  SDFFRQX2M \P_DATA_reg[3]  ( .D(n41), .SI(P_DATA[2]), .SE(n62), .CK(clk), 
        .RN(n12), .Q(P_DATA[3]) );
  SDFFRQX2M \P_DATA_reg[6]  ( .D(n44), .SI(P_DATA[5]), .SE(n59), .CK(clk), 
        .RN(n12), .Q(P_DATA[6]) );
  SDFFRQX2M \P_DATA_reg[2]  ( .D(n40), .SI(P_DATA[1]), .SE(n60), .CK(clk), 
        .RN(n12), .Q(P_DATA[2]) );
  SDFFRQX2M \counter_reg[0]  ( .D(n48), .SI(P_DATA[7]), .SE(n61), .CK(clk), 
        .RN(n12), .Q(counter[0]) );
  CLKINVX1M U14 ( .A(in_start_state), .Y(n50) );
  NOR2X2M U15 ( .A(n18), .B(n36), .Y(n34) );
  NOR2X2M U16 ( .A(n36), .B(counter[2]), .Y(n28) );
  INVX6M U17 ( .A(n13), .Y(n12) );
  INVX2M U18 ( .A(rst), .Y(n13) );
  NAND2X4M U19 ( .A(deser_EN), .B(n50), .Y(n36) );
  INVX4M U20 ( .A(n34), .Y(n17) );
  NAND2X2M U21 ( .A(n50), .B(n36), .Y(n35) );
  OAI222X1M U22 ( .A0(n15), .A1(n17), .B0(n49), .B1(n26), .C0(n18), .C1(n35), 
        .Y(n46) );
  INVX2M U23 ( .A(n26), .Y(n15) );
  NAND2X2M U24 ( .A(sampled_bit), .B(n28), .Y(n20) );
  NAND2X2M U25 ( .A(n34), .B(sampled_bit), .Y(n29) );
  INVX4M U26 ( .A(n28), .Y(n49) );
  OAI21X2M U27 ( .A0(n16), .A1(n35), .B0(n37), .Y(n47) );
  AO21XLM U28 ( .A0(n22), .A1(n24), .B0(n36), .Y(n37) );
  NAND2X2M U29 ( .A(n16), .B(n14), .Y(n19) );
  OAI21X2M U30 ( .A0(n26), .A1(n29), .B0(n33), .Y(n45) );
  OAI21X2M U31 ( .A0(n26), .A1(n17), .B0(P_DATA[7]), .Y(n33) );
  OAI21X2M U32 ( .A0(n20), .A1(n22), .B0(n23), .Y(n39) );
  OAI21X2M U33 ( .A0(n49), .A1(n22), .B0(P_DATA[1]), .Y(n23) );
  OAI21X2M U34 ( .A0(n20), .A1(n24), .B0(n25), .Y(n40) );
  OAI21X2M U35 ( .A0(n49), .A1(n24), .B0(P_DATA[2]), .Y(n25) );
  OAI21X2M U36 ( .A0(n20), .A1(n26), .B0(n27), .Y(n41) );
  OAI21X2M U37 ( .A0(n49), .A1(n26), .B0(P_DATA[3]), .Y(n27) );
  OAI21X2M U38 ( .A0(n19), .A1(n20), .B0(n21), .Y(n38) );
  OAI21X2M U39 ( .A0(n49), .A1(n19), .B0(P_DATA[0]), .Y(n21) );
  OAI21X2M U40 ( .A0(n19), .A1(n29), .B0(n30), .Y(n42) );
  OAI21X2M U41 ( .A0(n19), .A1(n17), .B0(P_DATA[4]), .Y(n30) );
  OAI21X2M U42 ( .A0(n22), .A1(n29), .B0(n31), .Y(n43) );
  OAI21X2M U43 ( .A0(n22), .A1(n17), .B0(P_DATA[5]), .Y(n31) );
  OAI21X2M U44 ( .A0(n24), .A1(n29), .B0(n32), .Y(n44) );
  OAI21X2M U45 ( .A0(n24), .A1(n17), .B0(P_DATA[6]), .Y(n32) );
  OAI22X1M U46 ( .A0(n14), .A1(n35), .B0(counter[0]), .B1(n36), .Y(n48) );
  NAND2X4M U47 ( .A(counter[1]), .B(n63), .Y(n26) );
  INVX2M U48 ( .A(counter[2]), .Y(n18) );
  NAND2X4M U49 ( .A(counter[0]), .B(n16), .Y(n22) );
  NAND2X4M U50 ( .A(counter[1]), .B(n14), .Y(n24) );
  INVX2M U51 ( .A(counter[0]), .Y(n14) );
  INVX2M U52 ( .A(counter[1]), .Y(n16) );
  DLY1X1M U53 ( .A(n57), .Y(n53) );
  DLY1X1M U54 ( .A(test_se), .Y(n54) );
  DLY1X1M U55 ( .A(n60), .Y(n55) );
  DLY1X1M U56 ( .A(n57), .Y(n56) );
  DLY1X1M U57 ( .A(n54), .Y(n57) );
  DLY1X1M U58 ( .A(n54), .Y(n58) );
  DLY1X1M U59 ( .A(n53), .Y(n59) );
  DLY1X1M U60 ( .A(n58), .Y(n60) );
  DLY1X1M U61 ( .A(n53), .Y(n61) );
  DLY1X1M U62 ( .A(n58), .Y(n62) );
  INVXLM U63 ( .A(n14), .Y(n63) );
endmodule


module Start_Checker_test_1 ( sampled_bit, start_check_EN, in_start_state, 
        prescale, edge_count, clk, rst, START_err, test_si, test_se );
  input [5:0] prescale;
  input [4:0] edge_count;
  input sampled_bit, start_check_EN, in_start_state, clk, rst, test_si,
         test_se;
  output START_err;
  wire   N4, N5, N6, N7, N8, N9, N10, n8, n9, n10, n11, n1, n2, n3, n4, n6, n7,
         n12, n13, n14, n15, n16, n17, n18, n19, n20;

  SDFFRQX2M START_err_reg ( .D(n19), .SI(test_si), .SE(test_se), .CK(clk), 
        .RN(rst), .Q(START_err) );
  NAND2BX2M U4 ( .AN(prescale[1]), .B(n6), .Y(n1) );
  OR2X2M U5 ( .A(n3), .B(prescale[4]), .Y(n4) );
  OR2X2M U6 ( .A(n2), .B(prescale[3]), .Y(n3) );
  NOR2BX2M U7 ( .AN(n6), .B(edge_count[0]), .Y(n12) );
  NOR2X2M U8 ( .A(n4), .B(prescale[5]), .Y(N9) );
  NOR2BX2M U9 ( .AN(edge_count[0]), .B(n6), .Y(n7) );
  OR2X2M U10 ( .A(n1), .B(prescale[2]), .Y(n2) );
  OAI2BB1XLM U11 ( .A0N(n1), .A1N(prescale[2]), .B0(n2), .Y(N5) );
  OAI2BB1XLM U12 ( .A0N(n3), .A1N(prescale[4]), .B0(n4), .Y(N7) );
  OAI2BB1XLM U13 ( .A0N(n2), .A1N(prescale[3]), .B0(n3), .Y(N6) );
  INVX2M U14 ( .A(prescale[0]), .Y(n6) );
  INVX2M U15 ( .A(n8), .Y(n19) );
  AOI32X1M U16 ( .A0(n9), .A1(n10), .A2(sampled_bit), .B0(START_err), .B1(n20), 
        .Y(n8) );
  INVX2M U17 ( .A(n9), .Y(n20) );
  OAI2BB1X2M U18 ( .A0N(start_check_EN), .A1N(N10), .B0(n10), .Y(n9) );
  NAND4BBX2M U19 ( .AN(edge_count[1]), .BN(edge_count[0]), .C(in_start_state), 
        .D(n11), .Y(n10) );
  NOR3X2M U20 ( .A(edge_count[2]), .B(edge_count[4]), .C(edge_count[3]), .Y(
        n11) );
  OAI2BB1X1M U21 ( .A0N(prescale[0]), .A1N(prescale[1]), .B0(n1), .Y(N4) );
  AO21XLM U22 ( .A0(n4), .A1(prescale[5]), .B0(N9), .Y(N8) );
  OAI2B2X1M U23 ( .A1N(N4), .A0(n7), .B0(edge_count[1]), .B1(n7), .Y(n14) );
  OAI2B2X1M U24 ( .A1N(edge_count[1]), .A0(n12), .B0(N4), .B1(n12), .Y(n13) );
  NAND4BBX1M U25 ( .AN(N9), .BN(N8), .C(n14), .D(n13), .Y(n18) );
  CLKXOR2X2M U26 ( .A(N7), .B(edge_count[4]), .Y(n17) );
  CLKXOR2X2M U27 ( .A(N5), .B(edge_count[2]), .Y(n16) );
  CLKXOR2X2M U28 ( .A(N6), .B(edge_count[3]), .Y(n15) );
  NOR4X1M U29 ( .A(n18), .B(n17), .C(n16), .D(n15), .Y(N10) );
endmodule


module Parity_Checker_test_1 ( sampled_bit, parity_check_EN, PAR_TYPE, P_DATA, 
        in_start_state, prescale, edge_count, clk, rst, PAR_err, test_si, 
        test_se );
  input [7:0] P_DATA;
  input [5:0] prescale;
  input [4:0] edge_count;
  input sampled_bit, parity_check_EN, PAR_TYPE, in_start_state, clk, rst,
         test_si, test_se;
  output PAR_err;
  wire   N2, N4, N5, N6, N7, N8, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         \add_19/carry[4] , \add_19/carry[3] , n2, n3, n4, n5, n6, n17, n18,
         n19, n20, n21, n22, n23;
  assign N2 = prescale[1];

  CLKXOR2X2M U4 ( .A(prescale[3]), .B(prescale[2]), .Y(N4) );
  CLKXOR2X2M U5 ( .A(prescale[5]), .B(\add_19/carry[4] ), .Y(N6) );
  OAI31X2M U7 ( .A0(n8), .A1(in_start_state), .A2(n9), .B0(n10), .Y(n16) );
  AOI221X2M U8 ( .A0(N6), .A1(n21), .B0(N5), .B1(n20), .C0(n5), .Y(n6) );
  AOI221X2M U9 ( .A0(edge_count[3]), .A1(n23), .B0(edge_count[2]), .B1(n22), 
        .C0(n4), .Y(n5) );
  AOI222X2M U10 ( .A0(N4), .A1(n19), .B0(n3), .B1(N2), .C0(n2), .C1(n18), .Y(
        n4) );
  INVX2M U11 ( .A(prescale[2]), .Y(n2) );
  INVX2M U12 ( .A(N4), .Y(n22) );
  INVX2M U13 ( .A(N5), .Y(n23) );
  XOR3XLM U14 ( .A(n11), .B(n12), .C(n13), .Y(n8) );
  NAND2X2M U15 ( .A(PAR_err), .B(n9), .Y(n10) );
  AOI21X2M U16 ( .A0(parity_check_EN), .A1(N8), .B0(in_start_state), .Y(n9) );
  CLKINVX1M U17 ( .A(edge_count[1]), .Y(n18) );
  INVX2M U18 ( .A(edge_count[2]), .Y(n19) );
  INVX2M U19 ( .A(edge_count[4]), .Y(n21) );
  INVX2M U20 ( .A(edge_count[3]), .Y(n20) );
  XNOR2X2M U21 ( .A(sampled_bit), .B(PAR_TYPE), .Y(n13) );
  XOR3XLM U22 ( .A(P_DATA[5]), .B(P_DATA[4]), .C(n14), .Y(n12) );
  XNOR2X2M U23 ( .A(P_DATA[7]), .B(P_DATA[6]), .Y(n14) );
  XOR3XLM U24 ( .A(P_DATA[1]), .B(P_DATA[0]), .C(n15), .Y(n11) );
  XNOR2X2M U25 ( .A(P_DATA[3]), .B(P_DATA[2]), .Y(n15) );
  AND2X1M U26 ( .A(\add_19/carry[4] ), .B(prescale[5]), .Y(N7) );
  AND2X1M U27 ( .A(\add_19/carry[3] ), .B(prescale[4]), .Y(\add_19/carry[4] )
         );
  CLKXOR2X2M U28 ( .A(prescale[4]), .B(\add_19/carry[3] ), .Y(N5) );
  AND2X1M U29 ( .A(prescale[2]), .B(prescale[3]), .Y(\add_19/carry[3] ) );
  AOI2BB1X1M U30 ( .A0N(n2), .A1N(n18), .B0(edge_count[0]), .Y(n3) );
  AOI2BB1X1M U31 ( .A0N(N6), .A1N(n21), .B0(n6), .Y(n17) );
  NOR2X1M U32 ( .A(N7), .B(n17), .Y(N8) );
  SDFFRQX4M PAR_err_reg ( .D(n16), .SI(test_si), .SE(test_se), .CK(clk), .RN(
        rst), .Q(PAR_err) );
endmodule


module Stop_Checker_test_1 ( sampled_bit, stop_check_EN, in_start_state, 
        prescale, edge_count, clk, rst, STOP_err, test_si, test_se );
  input [5:0] prescale;
  input [4:0] edge_count;
  input sampled_bit, stop_check_EN, in_start_state, clk, rst, test_si, test_se;
  output STOP_err;
  wire   N2, N4, N5, N6, N7, N8, n8, n9, n10, \add_17/carry[4] ,
         \add_17/carry[3] , n2, n3, n4, n5, n6, n11, n12, n13, n14, n15, n16,
         n17, n18, n21, n22, n23;
  assign N2 = prescale[1];

  CLKXOR2X2M U4 ( .A(prescale[3]), .B(n3), .Y(N4) );
  CLKXOR2X2M U5 ( .A(prescale[5]), .B(\add_17/carry[4] ), .Y(N6) );
  AOI221X2M U7 ( .A0(N6), .A1(n16), .B0(N5), .B1(n15), .C0(n6), .Y(n11) );
  AOI221X2M U8 ( .A0(edge_count[3]), .A1(n18), .B0(edge_count[2]), .B1(n17), 
        .C0(n5), .Y(n6) );
  AOI222X2M U9 ( .A0(N4), .A1(n14), .B0(n4), .B1(N2), .C0(n2), .C1(n13), .Y(n5) );
  INVX2M U10 ( .A(n3), .Y(n2) );
  BUFX2M U11 ( .A(prescale[2]), .Y(n3) );
  INVX2M U12 ( .A(N4), .Y(n17) );
  INVX2M U13 ( .A(N5), .Y(n18) );
  CLKINVX1M U14 ( .A(edge_count[1]), .Y(n13) );
  NOR2X1M U15 ( .A(in_start_state), .B(n8), .Y(n10) );
  AOI2BB2X2M U16 ( .B0(n9), .B1(n23), .A0N(sampled_bit), .A1N(n9), .Y(n8) );
  NAND2X2M U17 ( .A(stop_check_EN), .B(N8), .Y(n9) );
  INVX2M U18 ( .A(edge_count[2]), .Y(n14) );
  INVX2M U19 ( .A(edge_count[4]), .Y(n16) );
  INVX2M U20 ( .A(edge_count[3]), .Y(n15) );
  AND2X1M U21 ( .A(\add_17/carry[4] ), .B(prescale[5]), .Y(N7) );
  AND2X1M U22 ( .A(\add_17/carry[3] ), .B(prescale[4]), .Y(\add_17/carry[4] )
         );
  CLKXOR2X2M U23 ( .A(prescale[4]), .B(\add_17/carry[3] ), .Y(N5) );
  AND2X1M U24 ( .A(n3), .B(prescale[3]), .Y(\add_17/carry[3] ) );
  AOI2BB1X1M U25 ( .A0N(n2), .A1N(n13), .B0(edge_count[0]), .Y(n4) );
  AOI2BB1X1M U26 ( .A0N(N6), .A1N(n16), .B0(n11), .Y(n12) );
  NOR2X1M U27 ( .A(N7), .B(n12), .Y(N8) );
  INVXLM U28 ( .A(STOP_err), .Y(n21) );
  INVXLM U29 ( .A(n21), .Y(n22) );
  DLY1X1M U30 ( .A(n22), .Y(n23) );
  SDFFRQX4M STOP_err_reg ( .D(n10), .SI(test_si), .SE(test_se), .CK(clk), .RN(
        rst), .Q(STOP_err) );
endmodule


module UART_RX_top_test_1 ( RX_IN, prescale, PAR_EN, PAR_TYPE, clk, rst, 
        PAR_err, STOP_err, data_valid, P_DATA, test_si2, test_si1, test_se );
  input [5:0] prescale;
  output [7:0] P_DATA;
  input RX_IN, PAR_EN, PAR_TYPE, clk, rst, test_si2, test_si1, test_se;
  output PAR_err, STOP_err, data_valid;
  wire   START_err, edge_bit_EN, data_sample_EN, deser_EN, in_data_state,
         in_start_state, start_check_EN, parity_check_EN, stop_check_EN,
         sampled_bit, n1, n2, n3, n4, n6, n7, n8, n11, n12, n13, n14, n15, n16,
         n17, n18, n19;
  wire   [4:0] edge_count;
  wire   [3:0] bit_count;

  INVX4M U7 ( .A(n2), .Y(n1) );
  INVX4M U8 ( .A(n4), .Y(n3) );
  INVX2M U9 ( .A(prescale[2]), .Y(n4) );
  INVX2M U10 ( .A(rst), .Y(n2) );
  INVXLM U11 ( .A(STOP_err), .Y(n11) );
  INVXLM U12 ( .A(n11), .Y(n12) );
  DLY1X1M U13 ( .A(test_se), .Y(n13) );
  DLY1X1M U14 ( .A(n13), .Y(n14) );
  DLY1X1M U15 ( .A(n13), .Y(n15) );
  DLY1X1M U16 ( .A(n15), .Y(n16) );
  DLY1X1M U17 ( .A(n14), .Y(n17) );
  DLY1X1M U19 ( .A(n15), .Y(n19) );
  FSM_RX_test_1 U0 ( .RX_IN(RX_IN), .PAR_EN(PAR_EN), .edge_count(edge_count), 
        .bit_count(bit_count), .PAR_err(PAR_err), .STOP_err(n12), .START_err(
        START_err), .prescale({prescale[5:3], n3, prescale[1:0]}), .clk(clk), 
        .rst(n1), .data_valid(data_valid), .edge_bit_EN(edge_bit_EN), 
        .data_sample_EN(data_sample_EN), .deser_EN(deser_EN), .in_data_state(
        in_data_state), .in_start_state(in_start_state), .start_check_EN(
        start_check_EN), .parity_check_EN(parity_check_EN), .stop_check_EN(
        stop_check_EN), .test_si(test_si1), .test_se(n19) );
  Edge_Bit_Counter_test_1 U1 ( .edge_bit_EN(edge_bit_EN), .in_data_state(
        in_data_state), .in_start_state(in_start_state), .prescale({
        prescale[5:3], n3, prescale[1:0]}), .clk(clk), .rst(n1), .edge_count(
        edge_count), .bit_count(bit_count), .test_si(data_valid), .test_so(n8), 
        .test_se(n16) );
  Data_Sampler_test_1 U2 ( .RX_IN(RX_IN), .prescale({prescale[5:3], n3, 
        prescale[1:0]}), .edge_count(edge_count), .data_sample_EN(
        data_sample_EN), .clk(clk), .rst(n1), .sampled_bit(sampled_bit), 
        .test_si(n8), .test_so(n7), .test_se(n18) );
  Deserializer_test_1 U3 ( .sampled_bit(sampled_bit), .deser_EN(deser_EN), 
        .in_start_state(in_start_state), .clk(clk), .rst(n1), .P_DATA(P_DATA), 
        .test_si(n7), .test_so(n6), .test_se(n17) );
  Start_Checker_test_1 U4 ( .sampled_bit(sampled_bit), .start_check_EN(
        start_check_EN), .in_start_state(in_start_state), .prescale({
        prescale[5:3], n3, prescale[1:0]}), .edge_count(edge_count), .clk(clk), 
        .rst(n1), .START_err(START_err), .test_si(n6), .test_se(n16) );
  Parity_Checker_test_1 U5 ( .sampled_bit(sampled_bit), .parity_check_EN(
        parity_check_EN), .PAR_TYPE(PAR_TYPE), .P_DATA(P_DATA), 
        .in_start_state(in_start_state), .prescale({prescale[5:3], n3, 
        prescale[1:0]}), .edge_count(edge_count), .clk(clk), .rst(n1), 
        .PAR_err(PAR_err), .test_si(START_err), .test_se(n18) );
  Stop_Checker_test_1 U6 ( .sampled_bit(sampled_bit), .stop_check_EN(
        stop_check_EN), .in_start_state(in_start_state), .prescale({
        prescale[5:3], n3, prescale[1:0]}), .edge_count(edge_count), .clk(clk), 
        .rst(n1), .STOP_err(STOP_err), .test_si(test_si2), .test_se(n17) );
  BUFX2M U18 ( .A(n14), .Y(n18) );
endmodule


module UART_TOP_test_1 ( rst, PAR_EN, PAR_type, TX_P_data, TX_Data_valid, 
        TX_CLK, TX_OUT, TX_busy, RX_IN, prescale, RX_CLK, RX_data_valid, 
        PAR_err, STOP_err, RX_P_DATA, test_si, test_se );
  input [7:0] TX_P_data;
  input [5:0] prescale;
  output [7:0] RX_P_DATA;
  input rst, PAR_EN, PAR_type, TX_Data_valid, TX_CLK, RX_IN, RX_CLK, test_si,
         test_se;
  output TX_OUT, TX_busy, RX_data_valid, PAR_err, STOP_err;
  wire   n1, n2, n3, n5, n7;

  BUFX2M U1 ( .A(prescale[2]), .Y(n3) );
  INVX2M U2 ( .A(n2), .Y(n1) );
  INVX2M U3 ( .A(rst), .Y(n2) );
  DLY1X1M U4 ( .A(test_se), .Y(n7) );
  UART_TX_top_test_1 TX_INST ( .P_data(TX_P_data), .Data_valid(TX_Data_valid), 
        .PAR_EN(PAR_EN), .PAR_type(PAR_type), .clk(TX_CLK), .rst(n1), .TX_OUT(
        TX_OUT), .busy(TX_busy), .test_si(PAR_err), .test_so(n5), .test_se(n7)
         );
  UART_RX_top_test_1 RX_INST ( .RX_IN(RX_IN), .prescale({prescale[5:3], n3, 
        prescale[1:0]}), .PAR_EN(PAR_EN), .PAR_TYPE(PAR_type), .clk(RX_CLK), 
        .rst(n1), .PAR_err(PAR_err), .STOP_err(STOP_err), .data_valid(
        RX_data_valid), .P_DATA(RX_P_DATA), .test_si2(n5), .test_si1(test_si), 
        .test_se(n7) );
endmodule


module mux2X1_1 ( IN_0, IN_1, SEL, OUT );
  input IN_0, IN_1, SEL;
  output OUT;
  wire   N0;
  assign N0 = SEL;

  MX2X6M U1 ( .A(IN_0), .B(IN_1), .S0(N0), .Y(OUT) );
endmodule


module mux2X1_4 ( IN_0, IN_1, SEL, OUT );
  input IN_0, IN_1, SEL;
  output OUT;
  wire   N0;
  assign N0 = SEL;

  MX2X6M U1 ( .A(IN_0), .B(IN_1), .S0(N0), .Y(OUT) );
endmodule


module mux2X1_3 ( IN_0, IN_1, SEL, OUT );
  input IN_0, IN_1, SEL;
  output OUT;
  wire   N0;
  assign N0 = SEL;

  MX2X6M U1 ( .A(IN_0), .B(IN_1), .S0(N0), .Y(OUT) );
endmodule


module mux2X1_2 ( IN_0, IN_1, SEL, OUT );
  input IN_0, IN_1, SEL;
  output OUT;
  wire   N0;
  assign N0 = SEL;

  MX2X6M U1 ( .A(IN_0), .B(IN_1), .S0(N0), .Y(OUT) );
endmodule


module mux2X1_0 ( IN_0, IN_1, SEL, OUT );
  input IN_0, IN_1, SEL;
  output OUT;
  wire   N0;
  assign N0 = SEL;

  MX2X2M U1 ( .A(IN_0), .B(IN_1), .S0(N0), .Y(OUT) );
endmodule


module mux2X1_6 ( IN_0, IN_1, SEL, OUT );
  input IN_0, IN_1, SEL;
  output OUT;
  wire   N0;
  assign N0 = SEL;

  MX2X2M U1 ( .A(IN_0), .B(IN_1), .S0(N0), .Y(OUT) );
endmodule


module mux2X1_5 ( IN_0, IN_1, SEL, OUT );
  input IN_0, IN_1, SEL;
  output OUT;
  wire   N0;
  assign N0 = SEL;

  MX2X2M U1 ( .A(IN_0), .B(IN_1), .S0(N0), .Y(OUT) );
endmodule


module SYS_TOP ( scan_clk, scan_rst, test_mode, SE, SI, SO, RST_N, UART_CLK, 
        REF_CLK, UART_RX_IN, UART_TX_O, parity_error, framing_error );
  input [3:0] SI;
  output [3:0] SO;
  input scan_clk, scan_rst, test_mode, SE, RST_N, UART_CLK, REF_CLK,
         UART_RX_IN;
  output UART_TX_O, parity_error, framing_error;
  wire   REF_CLK_M, RST_M, RST_Domain_1, UART_CLK_M, RST_Domain_2,
         RST_Domain_2_M, RX_CLK, TX_CLK, CLK_en, ALU_CLK, RST_Domain_1_M,
         WR_en, RD_en, RD_Valid, ALU_Valid, RX_data_valid,
         RX_data_valid_synced, TX_CLK_M, busy, R_inc, W_full, W_inc, R_empty,
         RX_CLK_M, n1, n2, n3, n4, n5, n6, n7, n8, n10, n13, n14, n15, n34,
         n20, n21, n22, n26, n27, n28, n30, n31, n32, n33;
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
  wire   SYNOPSYS_UNCONNECTED__0, SYNOPSYS_UNCONNECTED__1, 
        SYNOPSYS_UNCONNECTED__2, SYNOPSYS_UNCONNECTED__3;

  BUFX2M U3 ( .A(UART_RX_IN), .Y(n2) );
  INVX4M U4 ( .A(n4), .Y(n3) );
  INVX4M U5 ( .A(n6), .Y(n5) );
  INVX2M U6 ( .A(n8), .Y(n7) );
  INVX2M U7 ( .A(UART_CONFIG[4]), .Y(n8) );
  INVX2M U8 ( .A(R_empty), .Y(n1) );
  INVX2M U9 ( .A(RST_Domain_1_M), .Y(n4) );
  INVX2M U10 ( .A(RST_Domain_2_M), .Y(n6) );
  DLY1X1M U16 ( .A(SE), .Y(n26) );
  DLY1X1M U17 ( .A(n30), .Y(n27) );
  DLY1X1M U18 ( .A(n26), .Y(n28) );
  DLY1X1M U20 ( .A(SE), .Y(n30) );
  DLY1X1M U21 ( .A(SE), .Y(n31) );
  DLY1X1M U22 ( .A(SE), .Y(n32) );
  DLY1X1M U23 ( .A(n26), .Y(n33) );
  Reset_SYNC_test_0 Domain_1_Reset ( .clk(REF_CLK_M), .rst(RST_M), .sync_rst(
        RST_Domain_1), .test_si(RX_P_DATA_synced[7]), .test_se(n32) );
  Reset_SYNC_test_1 Domain_2_Reset ( .clk(UART_CLK_M), .rst(RST_M), .sync_rst(
        RST_Domain_2), .test_si(RST_Domain_1), .test_se(n28) );
  Prescale_MUX Prescale_MUX ( .prescale({UART_CONFIG[7:5], n7, 
        UART_CONFIG[3:2]}), .Div_ratio({SYNOPSYS_UNCONNECTED__0, 
        SYNOPSYS_UNCONNECTED__1, SYNOPSYS_UNCONNECTED__2, 
        SYNOPSYS_UNCONNECTED__3, RX_DIV_Ratio[3:0]}) );
  Clock_Divider_test_0 RX_Clock_Divider ( .i_ref_clk(UART_CLK_M), .i_clk_en(
        1'b1), .i_rst_n(n5), .i_div_ratio({1'b0, 1'b0, 1'b0, 1'b0, 
        RX_DIV_Ratio[3:0]}), .o_div_clk(RX_CLK), .test_si(n21), .test_so(n20), 
        .test_se(n27) );
  Clock_Divider_test_1 TX_Clock_Divider ( .i_ref_clk(UART_CLK_M), .i_clk_en(
        1'b1), .i_rst_n(n5), .i_div_ratio(TX_DIV_Ratio), .o_div_clk(TX_CLK), 
        .test_si(n14), .test_so(n13), .test_se(n31) );
  Clock_Gating Clock_Gating ( .CLK_en(CLK_en), .test_mode(test_mode), .clk(
        REF_CLK_M), .Gated_CLK(ALU_CLK) );
  register_file_test_1 Register_File ( .WR_Data(WR_Data), .address(address), 
        .WR_en(WR_en), .RD_en(RD_en), .clk(REF_CLK_M), .rst(n3), .RD_Valid(
        RD_Valid), .RD_Data(RD_Data), .REG0(OP_A), .REG1(OP_B), .REG2(
        UART_CONFIG), .REG3(TX_DIV_Ratio), .test_si3(SI[1]), .test_si2(SI[2]), 
        .test_si1(n20), .test_so3(n15), .test_so2(SO[2]), .test_so1(n34), 
        .test_se(n31) );
  alu_top_test_1 ALU ( .a(OP_A), .b(OP_B), .alu_fun(ALU_FUNC), .clk(ALU_CLK), 
        .rst(n3), .ALU_OUT(ALU_OUT), .ALU_Valid(ALU_Valid), .test_si(SI[3]), 
        .test_so(n22), .test_se(n27) );
  Data_Sync_test_1 Data_Synchronizer ( .Unsync_bus(RX_P_DATA), .bus_enable(
        RX_data_valid), .clk(REF_CLK_M), .rst(n3), .sync_bus(RX_P_DATA_synced), 
        .enable_pulse(RX_data_valid_synced), .test_si(n22), .test_se(n33) );
  Pulse_Generator_test_1 Pulse_Generator ( .bus_enable(busy), .clk(TX_CLK_M), 
        .rst(n5), .enable_pulse(R_inc), .test_si(RST_Domain_2), .test_so(n21), 
        .test_se(n33) );
  System_Controller_test_1 SYS_CTRL ( .clk(REF_CLK_M), .rst(n3), .P_data_sync(
        RX_P_DATA_synced), .data_valid_sync(RX_data_valid_synced), .RD_Data(
        RD_Data), .RD_Valid(RD_Valid), .WR_en(WR_en), .RD_en(RD_en), .ADDR(
        address), .WR_Data_regfile(WR_Data), .ALU_OUT(ALU_OUT), .ALU_Valid(
        ALU_Valid), .ALU_FUNC(ALU_FUNC), .CLK_en(CLK_en), .W_full(W_full), 
        .WR_DATA_fifo(WR_DATA_fifo), .W_inc(W_inc), .test_si(n15), .test_so(
        n14), .test_se(n28) );
  ASYC_FIFO_test_1 TX_FIFO ( .W_clk(REF_CLK_M), .W_rst(n3), .W_inc(W_inc), 
        .R_clk(TX_CLK_M), .R_rst(n5), .R_inc(R_inc), .W_data(WR_DATA_fifo), 
        .W_full(W_full), .R_empty(R_empty), .R_data(TX_P_data), .test_si2(
        SI[0]), .test_si1(n13), .test_so2(n10), .test_so1(SO[1]), .test_se(n30) );
  UART_TOP_test_1 UART ( .rst(n5), .PAR_EN(UART_CONFIG[0]), .PAR_type(
        UART_CONFIG[1]), .TX_P_data(TX_P_data), .TX_Data_valid(n1), .TX_CLK(
        TX_CLK_M), .TX_OUT(UART_TX_O), .TX_busy(busy), .RX_IN(n2), .prescale({
        UART_CONFIG[7:5], n7, UART_CONFIG[3:2]}), .RX_CLK(RX_CLK_M), 
        .RX_data_valid(RX_data_valid), .PAR_err(parity_error), .STOP_err(SO[0]), .RX_P_DATA(RX_P_DATA), .test_si(n10), .test_se(n32) );
  mux2X1_1 REF_CLK_MUX ( .IN_0(REF_CLK), .IN_1(scan_clk), .SEL(test_mode), 
        .OUT(REF_CLK_M) );
  mux2X1_4 UART_CLK_MUX ( .IN_0(UART_CLK), .IN_1(scan_clk), .SEL(test_mode), 
        .OUT(UART_CLK_M) );
  mux2X1_3 TX_CLK_MUX ( .IN_0(TX_CLK), .IN_1(scan_clk), .SEL(test_mode), .OUT(
        TX_CLK_M) );
  mux2X1_2 RX_CLK_MUX ( .IN_0(RX_CLK), .IN_1(scan_clk), .SEL(test_mode), .OUT(
        RX_CLK_M) );
  mux2X1_0 REF_Reset_MUX ( .IN_0(RST_N), .IN_1(scan_rst), .SEL(test_mode), 
        .OUT(RST_M) );
  mux2X1_6 Domain_1_Reset_MUX ( .IN_0(RST_Domain_1), .IN_1(scan_rst), .SEL(
        test_mode), .OUT(RST_Domain_1_M) );
  mux2X1_5 Domain_2_Reset_MUX ( .IN_0(RST_Domain_2), .IN_1(scan_rst), .SEL(
        test_mode), .OUT(RST_Domain_2_M) );
  BUFX2M U15 ( .A(n34), .Y(SO[3]) );
  BUFX2M U19 ( .A(SO[0]), .Y(framing_error) );
endmodule

