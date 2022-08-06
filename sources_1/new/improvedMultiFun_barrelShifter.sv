`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/06/2022 12:20:18 AM
// Design Name: 
// Module Name: improvedMultiFun_barrelShifter
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description:
//             
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module improvedMultiFun_barrelShifter
(
    input logic [7:0] num, 
    input logic [2:0] amt, 
    input logic lr, 
    output logic [7:0] shiftedNum 
);
    // signal declaration 
    logic [7:0] s0, s1, s2, rev;
    
    // body 
    // reverse, shift right, then reverse again. if lr == 1, reverse does nothing. 
    reverser re1 (.*);
    // shift 0 or 1 bit
    assign s0 = amt[0] ? {rev[0], rev[7:1]} : rev;
    // stage 1, shift 0 or 2 bits 
    assign s1 = amt[1] ? {s0[1:0], s0[7:2]} : s0;
    // stage 2, shift 0 or 4 bits 
    assign s2 = amt[2] ? {s1[3:0], s1[7:4]} : s1;
    // reverse again 
    reverser re2 (.*, .num(s2), .rev(shiftedNum));
endmodule
