`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/20/2023 01:49:31 PM
// Design Name: 
// Module Name: ROM_tb
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


module ROM_tb();
reg [2:0] adr;
wire [3:0] data;
ROM uut(adr, data);

initial begin
    #10 adr = 3'd0;
    #10 adr = 3'd1;
    #10 adr = 3'd2;
    #10 adr = 3'd3;
    #10 adr = 3'd4;
    #10 adr = 3'd5;
    #10 adr = 3'd6;
    #10 adr = 3'd7;
end
endmodule
