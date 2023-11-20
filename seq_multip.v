`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/20/2023 03:33:00 PM
// Design Name: 
// Module Name: seq_multip
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


module seq_multip(
    input [3:0] A,
    input [3:0] B,
    input clk, 
    input rst,
    output reg [7:0] Y,
    output reg [2:0] S
    );
 
    // Define states
    parameter S0_idle = 0 , S1_multiply = 1 , S2_update_result = 2 ;
    reg [2:0] CS,NS;
    reg [7:0] partial_product, multiplicand;
    reg [2:0] shift_count, BB; 

    always @(posedge clk or posedge rst)
    begin
        if(rst==1) 
        CS <= S0_idle;// when reset=1, reset the CS of the FSM to "S0" CS
        else
        CS <= NS; // otherwise, next CS
    end 
    
    always @ (*) begin
        case(CS)
            S0_idle: begin
                S<=3'b0;
                partial_product <= 8'b0;
                shift_count <= 3'b0;
                multiplicand <= {4'b0, A};
                BB <= B;
                NS = S1_multiply;
                end
            S1_multiply: begin
                S<=3'b001;
                NS = S2_update_result;
                if ((BB[0] == 0 && shift_count < 4)) begin
                    partial_product <= partial_product;
                    shift_count <= shift_count + 3'b1;
                    multiplicand <= multiplicand << 1;
                    BB <= BB >> 1;
                    end
                else if ((BB[0] == 1) && (shift_count < 4)) begin
                    partial_product <= partial_product + multiplicand;
                    shift_count <= shift_count + 3'b1;
                    multiplicand <= multiplicand << 1;
                    BB <= BB >> 1;
                    end
                end
            S2_update_result:begin
            S<=3'b011;
                if(shift_count == 4) begin
                NS = S2_update_result;
                Y <= partial_product;
                end
                else begin
                NS = S1_multiply;
                end
            end
            endcase
        end
endmodule
