`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/13/2023 05:02:09 PM
// Design Name: 
// Module Name: synap_connection_percore
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


module synap_connection_percore
    #(parameter [255:0] neuron_para_init = 256'b0)
    (
    input [7:0] axon_number,
    output      connection_valid
    );
      wire [1:0] out_muxf7;
      wire [3:0] lut_outs;
      LUT6 #(.INIT(neuron_para_init[63:0])) 
      LUT6_inst_0 (
        .O(lut_outs[0]),   // LUT general output
        .I0(axon_number[0]), // LUT input
        .I1(axon_number[1]), // LUT input
        .I2(axon_number[2]), // LUT input
        .I3(axon_number[3]), // LUT input
        .I4(axon_number[4]), // LUT input
        .I5(axon_number[5])  // LUT input
      );
      LUT6 #(.INIT(neuron_para_init[127:64])) 
      LUT6_inst_1 (
        .O(lut_outs[1]),   // LUT general output
        .I0(axon_number[0]), // LUT input
        .I1(axon_number[1]), // LUT input
        .I2(axon_number[2]), // LUT input
        .I3(axon_number[3]), // LUT input
        .I4(axon_number[4]), // LUT input
        .I5(axon_number[5])  // LUT input
      );

      LUT6 #(.INIT(neuron_para_init[191:128])) 
      LUT6_inst_2 (
        .O(lut_outs[2]),   // LUT general output
        .I0(axon_number[0]), // LUT input
        .I1(axon_number[1]), // LUT input
        .I2(axon_number[2]), // LUT input
        .I3(axon_number[3]), // LUT input
        .I4(axon_number[4]), // LUT input
        .I5(axon_number[5])  // LUT input
      );

      LUT6 #(.INIT(neuron_para_init[255:192])) 
      LUT6_inst_3 (
        .O(lut_outs[3]),   // LUT general output
        .I0(axon_number[0]), // LUT input
        .I1(axon_number[1]), // LUT input
        .I2(axon_number[2]), // LUT input
        .I3(axon_number[3]), // LUT input
        .I4(axon_number[4]), // LUT input
        .I5(axon_number[5])  // LUT input
      ); 
      MUXF7 muxf7_init (
        .O(out_muxf7[1]),    // Output of MUX to general routing
        .I0(lut_outs[0]),  // Input (tie to LUT6 O6 pin)
        .I1(lut_outs[1]),  // Input (tie to LUT6 O6 pin)
        .S(axon_number[6])     // Input select to MUX
      );
      MUXF7 muxf7_init1 (
        .O(out_muxf7[0]),    // Output of MUX to general routing
        .I0(lut_outs[2]),  // Input (tie to LUT6 O6 pin)
        .I1(lut_outs[3]),  // Input (tie to LUT6 O6 pin)
        .S(axon_number[6])     // Input select to MUX
      );    
      MUXF8 MUXF8_inst (
       .O(connection_valid),    // Output of MUX to general routing
       .I0(out_muxf7[1]),  // Input (tie to MUXF7 L/LO out)
       .I1(out_muxf7[0]),  // Input (tie to MUXF7 L/LO out)
       .S(axon_number[7])     // Input select to MUX
       ); 
//      assign connection_valid = lut_outs [axon_number[7:6]];
endmodule
