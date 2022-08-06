`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/05/2022 10:24:15 PM
// Design Name: 
// Module Name: multiFun_barrelShifter
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module multiFun_barrelShifter(
    input logic [7:0] num,
    input logic [2:0] amt,
    input logic lr,
    output logic [7:0] shiftedNum
);
    // signal declaration 
    logic [7:0] rotRight, rotLeft, s0_ri, s1_ri, s0_le, s1_le; // inefficient...
    
    // body 
    // right shift circuit
    // stage 0, shift 0 or 1 bit 
    assign s0_ri = amt[0] ? {num[0], num[7:1]} : num;
    // stage 1, shift 0 or 2 bits 
    assign s1_ri = amt[1] ? {s0_ri[1:0], s0_ri[7:2]} : s0_ri;
    // stage 2, shift 0 or 4 bits 
    assign rotRight = amt[2] ? {s1_ri[3:0], s1_ri[7:4]} : s1_ri;
    
    // left shift circuit
    // stage 0, shift 0 or 1 bit 
    assign s0_le = amt[0] ? {num[6:0], num[7]} : num;
    // stage 1, shift 0 or 2 bits 
    assign s1_le = amt[1] ? {s0_le[5:0], s0_le[7:6]} : s0_le;
    // stage 2, shift 0 or 4 bits 
    assign rotLeft = amt[2] ? {s1_le[3:0], s1_le[7:4]} : s1_le;
    
    // 2:1 MUX for left or right 
    assign shiftedNum = lr ? rotRight : rotLeft; // lr = 1, rotate right, otherwise rotate left
endmodule
