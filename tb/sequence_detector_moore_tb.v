`timescale 1ns / 1ps

module sequence_detector_moore_tb;

    reg clk;
    reg rst;
    reg seq_in;
    wire det_out;

    // DUT
    sequence_detector_moore DUT (
        .det_out(det_out),
        .seq_in(seq_in),
        .clk(clk),
        .rst(rst)
    );

    // ----------------------
    // Clock generation
    // ----------------------
    always #5 clk = ~clk;   // 10ns clock

    // ----------------------
    // Stimulus (MAIN FIXED PART)
    // ----------------------
    initial begin
        clk = 0;
        rst = 1;
        seq_in = 0;

        $dumpfile("moore.vcd");
        $dumpvars(0, sequence_detector_moore_tb);

        // Hold reset for 2 cycles
        repeat(2) @(posedge clk);
        rst = 0;

        // ----------------------
        // First sequence: 1111
        // ----------------------
        @(posedge clk); seq_in = 1;
        @(posedge clk); seq_in = 1;
        @(posedge clk); seq_in = 1;
        @(posedge clk); seq_in = 1;

        @(posedge clk); seq_in = 0;

        // ----------------------
        // Second sequence: 1111
        // ----------------------
        @(posedge clk); seq_in = 1;
        @(posedge clk); seq_in = 1;
        @(posedge clk); seq_in = 1;
        @(posedge clk); seq_in = 1;

        @(posedge clk); seq_in = 0;

        // end simulation
        @(posedge clk);
        $finish;
    end

    // ----------------------
    // Monitor output
    // ----------------------
    initial begin
        $monitor("time=%0t rst=%b seq_in=%b det_out=%b",
                 $time, rst, seq_in, det_out);
    end

endmodule
