// Testbench for the traffic light controller
module tb_traffic_light_controller();
  wire red_light;
  wire yellow_light;
  wire green_light;
  reg clk;
  reg reset;
  
  // Instantiattion
  traffic_light_controller DUT(
    .clk(clk),
    .reset(reset),
    .red_light(red_light),
    .yellow_light(yellow_light),
    .green_light(green_light)
  );

  // Clock generation
  initial begin
    clk = 0;
    forever #5 clk = ~clk;
  end

  // Initialize reset
  initial begin
    reset = 0;
    #10; reset = 1;
    $dumpfile("dump.vcd");
    $dumpvars(0);
    #50; reset = 0;
    #70; reset = 1;
    #120;
    $finish; // End simulation
  end
endmodule
