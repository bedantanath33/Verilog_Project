module tb_freq_divide_3;
  reg clk_in;
  wire clk_out;
  wire [1:0] pos_count, neg_count;
  freq_divide_3 f1(clk_out,pos_count,neg_count,clk_in);
  initial begin
    clk_in=0;
    forever #5	clk_in = ~clk_in;
  end
  initial begin    
    $monitor("%d pos_count=%d neg_count=%d clk_in=%d clk_out=%d", $time,pos_count, neg_count,clk_in, clk_out);
    #100 $stop;
  end
  initial begin
    $dumpvars;
    $dumpfile("dump.vcd");
  end
endmodule
