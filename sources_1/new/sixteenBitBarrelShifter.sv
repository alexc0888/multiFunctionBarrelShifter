`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/06/2022 01:49:13 AM
// Design Name: 
// Module Name: sixteenBitBarrelShifter
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


module sixteenBitBarrelShifter
(
    input logic [15:0] num, 
    input logic [3:0] amt, 
    input logic lr, 
    output logic [15:0] shiftedNum 
);
    // signal declaration 
    logic [15:0] s0, s1, s2, s3, rev;
    
    // body 
    // reverse, shift right, then reverse again. if lr == 1, reverse does nothing. 
    reverser #(.N(16)) re1 (.*); // 16 bit reverser
    // shift 0 or 1 bit
    assign s0 = amt[0] ? {rev[0], rev[15:1]} : rev;
    // stage 1, shift 0 or 2 bits 
    assign s1 = amt[1] ? {s0[1:0], s0[15:2]} : s0;
    // stage 2, shift 0 or 4 bits 
    assign s2 = amt[2] ? {s1[3:0], s1[15:4]} : s1;
    // stage 3, shift 0 or 8 bits 
    assign s3 = amt[3] ? {s2[7:0], s2[15:8]} : s2;
    // reverse again 
    reverser #(.N(16)) re2 (.*, .num(s3), .rev(shiftedNum));
endmodule
