`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/20/2023 02:40:13 PM
// Design Name: 
// Module Name: seq_mult_tb
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


module seq_mult_tb();
reg [3:0] A, B;
reg clk = 0, rst;
wire [7:0] Y;
wire [2:0] S;
seq_multip uut(A, B, clk, rst, Y, S);

always #10 clk = ~clk;

initial begin
#10 rst <= 1;
#10
    rst <= 0;
#10 A = 4'b0110;
    B = 4'b0011;
#200;
end
endmodule
