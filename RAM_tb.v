`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/20/2023 02:03:35 PM
// Design Name: 
// Module Name: RAM_tb
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


module RAM_tb();
reg i_clk = 0, i_rst, i_write_en;
reg [2:0] i_addr;
reg [7:0] i_write_data;
wire [7:0] o_read_data;

RAM uut(i_clk, i_rst, i_write_en, i_addr, i_write_data, o_read_data);

initial begin
    forever begin
    #10 i_clk = ~i_clk;
    end
end

initial begin
    #20 i_rst = 1;
    #20 i_rst = 0;
    //Enable write to address 3 with value 0x0f
    #20 i_write_en = 1;
        i_addr = 3'd3;
        i_write_data = 8'h0f;
    //Disable write look at address 4 with value 0x00
    #20 i_write_en = 0;
        i_addr = 4;
    //Look at address 3, value should be 0x0f
    #20 i_addr = 3;
    #20 i_write_en = 1;
        i_addr = 5;
        i_write_data = 8'h47;
    #20 i_write_en = 0;
    end
endmodule
