`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/06/2022 12:28:00 AM
// Design Name: 
// Module Name: reverser
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: This circuit reverses a signal of any width N bits. Default is N = 8 bits
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module reverser
#(parameter N = 8)
(
    input logic [N-1:0] num, 
    input logic lr, 
    output logic [N-1:0] rev
);
    // constant declarations 
    localparam N1 = N - 1;
    
    // signal declarations 
    logic [N1:0] temp;
    
    // body 
    generate // concurrent for loop 
        genvar i;
        for (i = 0; i <= N1; i = i + 1)
            assign temp[i] = num[N1 - i];
    endgenerate
    assign rev = lr ? num : temp; // if shift right, dont reverse. if shift left, take temp which is reversed. 
endmodule
