`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/15/2023 10:05:22 PM
// Design Name: 
// Module Name: testbench
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


module testbench();
    reg     [7:0]   axon_number;
    wire            connection_valid;
    reg     [255:0] para = 256'b0110110010100101010110110100011011010000100101101001001110100100000101010110011101010001010100011101011000100101010101011001010101001010110101010101100001010110101001010101010100000101011010110101010100101011110100101010010111111010101001010011001000011110;
    synap_connection  #(
        .NUM_AXONS(256),
        .NUM_NEURONS(1)
    ) synap
    (
        .axon_number(axon_number),
        .connection_valid(connection_valid)
    );
    initial begin
    axon_number = 0;
    forever #5 begin
        if(para[axon_number] == connection_valid) begin
        $display("PASS!!! Input_number: %d,para[%d]: %b connection_valid: %b",axon_number ,axon_number , para[axon_number], connection_valid);
        end
        else begin
        $display("FAILED!!! Input_number: %d,para[%d]: %b connection_valid: %b",axon_number ,axon_number , para[axon_number], connection_valid);
        end    
        axon_number = axon_number +1;
    end
//        if(para[axon_number] == connection_valid) begin
//        $display("Pass!!! Input: %b, Output: %b", para[axon_number], connection_valid);
//        end
//        else begin
//        $display("Pass!!! Input: %b, Output: %b", para[axon_number], connection_valid);
//        end
    end
endmodule
