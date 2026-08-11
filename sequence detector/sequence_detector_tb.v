`timescale 1ns/1ps

module sequence_detector_tb;

    reg clk;
    reg reset;
    reg data_in;

    wire detected;

    // Connect sequence detector
    sequence_detector uut (
        .clk(clk),
        .reset(reset),
        .data_in(data_in),
        .detected(detected)
    );

    // Clock generation
    always #5 clk = ~clk;

    initial begin

        // Create waveform file
        $dumpfile("output.vcd");
        $dumpvars(0, sequence_detector_tb);

        // Initial values
        clk = 0;
        reset = 1;
        data_in = 0;

        #10;

        // Release reset
        reset = 0;

        // Send 1
        data_in = 1;
        #10;

        // Send 0
        data_in = 0;
        #10;

        // Send 1
        data_in = 1;
        #10;

        // Send 1
        data_in = 1;
        #10;

        // Send another sequence 1011
        data_in = 1;
        #10;

        data_in = 0;
        #10;

        data_in = 1;
        #10;

        data_in = 1;
        #10;

        $finish;

    end

endmodule