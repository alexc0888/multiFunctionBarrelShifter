`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/06/2022 02:51:43 AM
// Design Name: 
// Module Name: thirtyTwoBitBarrelShifter
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


module thirtyTwoBitBarrelShifter
(
    input logic [31:0] num, 
    input logic [4:0] amt, 
    input logic lr, 
    output logic [31:0] shiftedNum 
);
    // signal declaration 
    logic [31:0] s0, s1, s2, s3, s4, rev;
    
    // body 
    // reverse, shift right, then reverse again. if lr == 1, reverse does nothing. 
    reverser #(.N(32)) re1 (.*); // 32 bit reverser
    // shift 0 or 1 bit
    assign s0 = amt[0] ? {rev[0], rev[31:1]} : rev;
    // stage 1, shift 0 or 2 bits 
    assign s1 = amt[1] ? {s0[1:0], s0[31:2]} : s0;
    // stage 2, shift 0 or 4 bits 
    assign s2 = amt[2] ? {s1[3:0], s1[31:4]} : s1;
    // stage 3, shift 0 or 8 bits 
    assign s3 = amt[3] ? {s2[7:0], s2[31:8]} : s2;
    // stage 4, shift 0 or 16 bits 
    assign s4 = amt[4] ? {s3[15:0], s3[31:16]} : s3;
    // reverse again 
    reverser #(.N(32)) re2 (.*, .num(s4), .rev(shiftedNum));
endmodule
