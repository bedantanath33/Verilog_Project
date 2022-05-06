module traffic_light_controller(light_M1, light_M2, light_MT,light_S, clk, rst);
  input clk,rst;
  output reg [2:0] light_M1, light_M2, light_MT,light_S;
  reg [3:0] count;
  reg [2:0] present_state;
  parameter s1=0, s2=1, s3=2, s4=3, s5=4, s6=5;
  parameter sec7=7,sec5=5,sec3=3,sec2=2;
  
  always @(posedge clk or posedge rst) begin
    if (rst == 1'b1) begin
      present_state <= s1;
      count <= 4'b0;
    end
    else begin
      case (present_state) 
        
        s1 : if (count < sec7) begin
          		present_state <= s1;
          		count <= count + 1'b1;
          	  end
              else begin
                present_state <= s2;
          		count <= 4'b0;
              end
        
        s2 : if (count < sec2) begin
          		present_state <= s2;
          		count <= count + 1'b1;
          	  end
              else begin
                present_state <= s3;
          		count <= 4'b0;
              end
        
        s3 : if (count < sec5) begin
          		present_state <= s3;
          		count <= count + 1'b1;
          	  end
              else begin
                present_state <= s4;
          		count <= 4'b0;
              end
        
        s4 : if (count < sec2) begin
          		present_state <= s4;
          		count <= count + 1'b1;
          	  end
              else begin
                present_state <= s5;
          		count <= 4'b0;
              end
        
        s5 : if (count < sec3) begin
          		present_state <= s5;
          		count <= count + 1'b1;
          	  end
              else begin
                present_state <= s6;
          		count <= 4'b0;
              end
        
        s6 : if (count < sec7) begin
          		present_state <= s6;
          		count <= count + 1'b1;
          	  end
              else begin
                present_state <= s1;
          		count <= 4'b0;
              end
        
        default: present_state <= s1;
          
      endcase
    end
  end
  
  always @(present_state) begin
    case (present_state)
      s1: begin
        	light_M1 <= 3'b001;
        	light_M2 <= 3'b001;
        	light_MT <= 3'b100;
        	light_S <= 3'b100;
     	  end
      
      s2: begin
        	light_M1 <= 3'b001;
        	light_M2 <= 3'b010;
        	light_MT <= 3'b100;
        	light_S <= 3'b100;
     	  end
      
      s3: begin
        	light_M1 <= 3'b001;
        	light_M2 <= 3'b100;
        	light_MT <= 3'b001;
        	light_S <= 3'b100;
     	  end
      
      s4: begin
        	light_M1 <= 3'b010;
        	light_M2 <= 3'b100;
        	light_MT <= 3'b010;
        	light_S <= 3'b100;
     	  end
      
      s5: begin
        	light_M1 <= 3'b100;
        	light_M2 <= 3'b100;
        	light_MT <= 3'b100;
        	light_S <= 3'b001;
     	  end
      
      s6: begin
        	light_M1 <= 3'b100;
        	light_M2 <= 3'b100;
        	light_MT <= 3'b100;
        	light_S <= 3'b010;
     	  end
      
      default: begin
        	light_M1 <= 3'b000;
        	light_M2 <= 3'b000;
        	light_MT <= 3'b000;
        	light_S <= 3'b000;
     	  end
      
    endcase
  end
  
endmodule
