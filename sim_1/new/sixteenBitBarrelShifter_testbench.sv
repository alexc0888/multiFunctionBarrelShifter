`timescale 1ns / 10ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/06/2022 01:57:44 AM
// Design Name: 
// Module Name: sixteenBitBarrelShifter_testbench
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


module sixteenBitBarrelShifter_testbench();
    // signal declaration 
    logic [15:0] numTest, shiftedNumTest;
    logic [3:0] amtTest;
    logic lrTest;
    int i;
    
    // instantiate improved barrel shifter 
    sixteenBitBarrelShifter uut (.num(numTest), .amt(amtTest), .lr(lrTest), .shiftedNum(shiftedNumTest));

    // test vector generation 
    initial 
    begin 
        for (i = 32'h0; i <= 32'hf; i = i + 32'h1)
            begin 
                numTest = i;
                amtTest = 4'b0011; 
                lrTest = 1'b0; // left
                # 20; // 20 ns delay
                if(i == 1'hf) 
                    break; // exit the loop once i == 1'hf, otherwise i will overflow. 
            end 
        for (i = 32'h0; i <= 32'hf; i = i + 32'h1)
            begin 
                numTest = i; 
                amtTest = 4'b0011; 
                lrTest = 1'b1; // right
                # 20; // 20 ns delay
                if(i == 1'hf) 
                    break; // exit the loop once i == 1'hf, otherwise i will overflow. 
            end 
        for (i = 32'h0; i <= 32'hf; i = i + 32'h1)
            begin 
                numTest = i; 
                amtTest = 4'b1011; 
                lrTest = 1'b1; // right
                # 20; // 20 ns delay
                if(i == 1'hf) 
                    break; // exit the loop once i == 1'hf, otherwise i will overflow. 
            end 
        $stop;
    end
endmodule
