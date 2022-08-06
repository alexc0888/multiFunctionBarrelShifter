`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/06/2022 12:02:14 AM
// Design Name: 
// Module Name: top
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


module top(
    input logic [15:0] sw,
    input logic lr,
    input logic [3:0] btn,
    output logic [15:0] led
);
    // code here... 
    // instantiate 16 bit barrel shifter 
    sixteenBitBarrelShifter barSh16 (.*, .num(sw), .amt(btn[3:0]), .shiftedNum(led)); 
endmodule
