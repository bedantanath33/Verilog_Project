module tb_voting_machine;
  reg clk, rst, mode;
  reg button1, button2, button3, button4;
  wire [7:0] led;
  
  voting_machine dut(led, clk, rst, mode, button1, button2, button3, button4);
  
  initial begin
    clk = 0;
    forever #5 clk = ~clk;
  end
  
  initial begin
    rst = 1;	mode = 0;	
    button1 = 0; button2 = 0; button3 = 0; button4 = 0;
    #100;
    
    #100 rst=0;	mode = 0; button1 = 0; button2 = 0; button3 = 0; button4 = 0;
    #5 rst=0;	mode = 0; button1 = 1; button2 = 0; button3 = 0; button4 = 0;
    #10 rst=0;	mode = 0; button1 = 0; button2 = 0; button3 = 0; button4 = 0;
    #5 rst=0;	mode = 0; button1 = 1; button2 = 0; button3 = 0; button4 = 0;
    #200 rst=0;	mode = 0; button1 = 0; button2 = 0; button3 = 0; button4 = 0;
    #5 rst=0;	mode = 0; button1 = 0; button2 = 0; button3 = 0; button4 = 0;
    #10 rst=0;	mode = 0; button1 = 0; button2 = 0; button3 = 0; button4 = 0;
    #5 rst=0;	mode = 0; button1 = 0; button2 = 0; button3 = 0; button4 = 0;
    
    #5 rst=0;	mode = 0; button1 = 0; button2 = 1; button3 = 0; button4 = 0;
    #200 rst=0;	mode = 0; button1 = 0; button2 = 0; button3 = 0; button4 = 0;
    #5 rst=0;	mode = 0; button1 = 0; button2 = 0; button3 = 0; button4 = 0;
    #10 rst=0;	mode = 0; button1 = 0; button2 = 0; button3 = 0; button4 = 0;
    #5 rst=0;	mode = 0; button1 = 0; button2 = 0; button3 = 0; button4 = 0;
    
    #5 rst=0;	mode = 0; button1 = 0; button2 = 1; button3 = 1; button4 = 0;
    #200 rst=0;	mode = 0; button1 = 0; button2 = 0; button3 = 0; button4 = 0;
    #5 rst=0;	mode = 0; button1 = 0; button2 = 0; button3 = 0; button4 = 0;
    #10 rst=0;	mode = 0; button1 = 0; button2 = 0; button3 = 0; button4 = 0;
    #5 rst=0;	mode = 0; button1 = 0; button2 = 0; button3 = 0; button4 = 0;
    
    #5 rst=0;	mode = 1; button1 = 0; button2 = 1; button3 = 0; button4 = 0;
    #200 rst=0;	mode = 1; button1 = 0; button2 = 0; button3 = 1; button4 = 0;
    #5 rst=0;	mode = 0; button1 = 0; button2 = 0; button3 = 0; button4 = 0;
    #10 rst=0;	mode = 0; button1 = 0; button2 = 0; button3 = 0; button4 = 0;
    #5 rst=0;	mode = 0; button1 = 0; button2 = 0; button3 = 0; button4 = 0;
    
    #5 rst=0;	mode = 0; button1 = 0; button2 = 0; button3 = 1; button4 = 0;
    #200 rst=0;	mode = 0; button1 = 0; button2 = 0; button3 = 0; button4 = 0;
    #5 rst=0;	mode = 0; button1 = 0; button2 = 0; button3 = 0; button4 = 0;
    #10 rst=0;	mode = 0; button1 = 0; button2 = 0; button3 = 0; button4 = 0;
    #5 rst=0;	mode = 0; button1 = 0; button2 = 0; button3 = 0; button4 = 0;
    
    $finish;
    
  end
  
  initial begin
    $dumpvars;
    $dumpfile("dumpfile.vcd");
  end
  
  initial begin
    $monitor("%d mode = %b button1 = %b button2 = %b button3 = %b button4 = %b led = %d", $time, mode, button1, button2, button3, button4, led);
  end
  
endmodule