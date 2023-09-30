`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Kapil Tripathy 
// 
// Create Date: 29.09.2023 20:09:40
// Design Name: Floating POint clasifier
// Module Name: hp_class
// Project Name: FPU Multiplier
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


module hp_class(f, sNaN, qNaN, infinity, zero, normal, subNormal);

input [15:0] f;
output sNaN;
output qNaN;
output infinity;
output zero;
output normal;
output subNormal;

wire expOnes;
wire expZeros;
wire sigZeros;

assign expOnes = &f[14:10];
assign expZeros = ~|f[15:10];
assign sigZeros = ~|f[9:0];

assign sNaN = expOnes & ~sigZeros & ~f[9];
assign qNaN = expOnes & f[9];
assign infinity = expOnes & sigZeros;
assign zero = expZeros & sigZeros;
assign normal =  ~expOnes & ~expZeros;
assign subNormal = expZeros & ~sigZeros; 

endmodule
