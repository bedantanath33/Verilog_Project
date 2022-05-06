module traffic_light_controller_tb;
  reg clk,rst;
  wire [2:0] light_M1, light_M2, light_MT,light_S;
  traffic_light_controller dut(light_M1, light_M2, light_MT,light_S, clk, rst);
  
  initial begin
    clk = 1'b0;
    forever #5 clk = ~clk;
  end
  
  initial begin
    rst = 1'b0;
    #10;
    rst = 1'b1;
    #10;
    rst = 1'b0;
    #(10*200);
    $finish;
  end
  
endmodule