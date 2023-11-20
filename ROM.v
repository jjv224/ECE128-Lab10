`timescale 1ns / 1ps

module ROM ( ROM_addr, ROM_data);
output reg [3:0] ROM_data;
input [2:0] ROM_addr;
always @(ROM_addr) begin
	case (ROM_addr)
         3'd0: ROM_data = 4'b0111;
         3'd1: ROM_data = 4'b0110;
         3'd2: ROM_data = 4'b0101;
         3'd3: ROM_data = 4'b0100;
         3'd4: ROM_data = 4'b0011;
         3'd5: ROM_data = 4'b0010;
         3'd6: ROM_data = 4'b0001;
         3'd7: ROM_data = 4'b0000;
        endcase
	end
endmodule

