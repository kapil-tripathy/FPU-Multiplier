`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Chris Larsen, Copyright 2019
// 
// Create Date: 08/14/2019 12:01:30 PM
// Design Name: 
// Module Name: hp_class
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: Identify value type of 16-bit floating point number
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module hp_class(f, snan, qnan, infinity, zero, subnormal, normal);
  input [15:0] f;
  output snan, qnan, infinity, zero, subnormal, normal;

  wire expOnes, expZeroes, sigZeroes;

  assign expOnes   =  &f[14:10];
  assign expZeroes = ~|f[14:10];
  assign sigZeroes = ~|f[9:0];

  assign snan      =  expOnes   & ~sigZeroes & ~f[9];
  assign qnan      =  expOnes   &               f[9];
  assign infinity  =  expOnes   &  sigZeroes;
  assign zero      =  expZeroes &  sigZeroes;
  assign subnormal =  expZeroes & ~sigZeroes;
  assign normal    = ~expOnes   & ~expZeroes;

endmodule