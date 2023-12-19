`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// Design Name: 
// Module Name: synap_connection
// Project Name: SNN
// Target Devices: KC705
// Tool Versions: 
// Description: 

//////////////////////////////////////////////////////////////////////////////////


module synap_connection
#(
    parameter NUM_AXONS = 256,      
    parameter NUM_NEURONS =256
    )
(
    input [$clog2(NUM_AXONS)-1:0] axon_number,
    output [NUM_NEURONS - 1 : 0]  connection_valid
    );
    genvar neuron_index;
    for(neuron_index = 0 ; neuron_index < NUM_NEURONS  ; neuron_index = neuron_index +1) begin
     synap_connection_percore 
        #(.neuron_para_init(256'b0110110010100101010110110100011011010000100101101001001110100100000101010110011101010001010100011101011000100101010101011001010101001010110101010101100001010110101001010101010100000101011010110101010100101011110100101010010111111010101001010011001000011110))
        synap_connection_init
        ( 
        .axon_number(axon_number),
        .connection_valid(connection_valid[neuron_index]
        )
     );
    end
endmodule
