`timescale 1ns / 10 ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/05/2022 11:47:50 PM
// Design Name: 
// Module Name: multiFun_barrelShifter_testbench
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


module multiFun_barrelShifter_testbench();
    // signal declaration 
    logic [7:0] numTest, shiftedNumTest;
    logic [2:0] amtTest;
    logic lrTest;
    
    // instantiate barrel shifter 
    multiFun_barrelShifter uut (.num(numTest), .amt(amtTest), .lr(lrTest), .shiftedNum(shiftedNumTest));
    
    // test vector generation 
    initial 
    begin 
        // test vector 1 
        numTest = 8'b00000000; 
        amtTest = 3'b000; 
        lrTest = 1'b0; // left
        # 20; // 20 ns delay
        // test vector 2 
        numTest = 8'b00000001; 
        amtTest = 3'b000; 
        lrTest = 1'b0; // left
        # 20; // 20 ns delay 
        // test vector 3 
        numTest = 8'b00000001; 
        amtTest = 3'b001; 
        lrTest = 1'b0; // left
        # 20; // 20 ns delay 
        // test vector 4 
        numTest = 8'b00000001; 
        amtTest = 3'b011; 
        lrTest = 1'b0; // left
        # 20; // 20 ns delay 
        // test vector 5 
        numTest = 8'b00000111; 
        amtTest = 3'b111; 
        lrTest = 1'b0; // left
        # 20; // 20 ns delay 
        // test vector 6 
        numTest = 8'b11100010; 
        amtTest = 3'b110; 
        lrTest = 1'b0; // left
        # 20; // 20 ns delay 
        // test vector 7 
        numTest = 8'b01011001; 
        amtTest = 3'b001; 
        lrTest = 1'b1; // right
        # 20; // 20 ns delay 
        // test vector 8 
        numTest = 8'b01000000; 
        amtTest = 3'b011; 
        lrTest = 1'b1; // right
        # 20; // 20 ns delay 
        // test vector 9 
        numTest = 8'b00001100; 
        amtTest = 3'b100; 
        lrTest = 1'b1; // right
        # 20; // 20 ns delay 
        // test vector 10 
        numTest = 8'b11110000; 
        amtTest = 3'b001; 
        lrTest = 1'b1; // right
        # 20; // 20 ns delay 
        // test vector 11 
        numTest = 8'b00000111; 
        amtTest = 3'b011; 
        lrTest = 1'b1; // right
        # 20; // 20 ns delay
        // test vector 12
        numTest = 8'b01000100; 
        amtTest = 3'b111; 
        lrTest = 1'b1; // right
        # 20; // 20 ns delay
        $stop;
    end
endmodule
