module tb_detect_1011;
    reg clk,rst;
    reg sequence_in;  //binary input 1 or 0
    wire detector_output;
    detect_1011 dut(detector_output,sequence_in,clk,rst);
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end
    initial begin
        $monitor("Time=%d sequence_in=%d detector_output=%d",$time,sequence_in,detector_output);
        sequence_in = 0;
        rst = 1;
        #30 rst = 0;
        #40 sequence_in = 1;
        #10 sequence_in = 0;
        #10 sequence_in = 1;
        #20 sequence_in = 1;
        #20 sequence_in = 0;
        #10 sequence_in = 1;
        #20 sequence_in = 1;
        #20 sequence_in = 0;
        #400 $stop;
    end
    initial begin
        $dumpvars;
        $dumpfile("dump.vcd");
    end
endmodule
