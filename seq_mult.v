`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/20/2023 02:38:41 PM
// Design Name: 
// Module Name: seq_mult
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


module seq_mult(
    input [3:0] A,
    input [3:0] B,
    output [7:0] Y
    );
    reg [7:0] product, pproduct = 0;
    reg [7:0] cand;
    wire [3:0] plier;
    parameter S0 = 0, S1 = 1, S2 = 2;
    reg [2:0] CS, NS;
    assign B = plier;
    reg shift_count;
    
    always @ (CS or NS)
        begin
            CS = NS;
        end
    
    always @ (CS)
    begin
    case(CS)
        S0 : begin
        cand = {4'b0, A};
        if (plier[0] == 1) 
            pproduct = pproduct + cand;
        NS = S1;
        end
        S1 : begin
          cand <= cand << 1;
        end
        S2 : begin
            
        end
        endcase
        
    end    
endmodule
