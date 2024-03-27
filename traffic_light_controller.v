// Code your design here
// FSM Mealy machine traffic light controller
module traffic_light_controller(
  input wire clk,
  input wire reset,
  output reg red_light,
  output reg yellow_light,
  output reg green_light
);
  // S0 -----> after reset
  // S1 -----> red_light state
  // S2 -----> yellow_light state
  // S3 -----> green_light state
  parameter S0 = 2'b00, S1 = 2'b01, S2 = 2'b10, S3 = 2'b11; // define the parameters
  reg [1:0] present_state, next_state;

  // Logic for present state
  always @(posedge clk or negedge reset)// active low asynchrouns reset
  begin
    if (!reset)
      present_state <= S0;
    else
      present_state <= next_state;
  end
    

  // Logic for next state
  always @(*)
  begin
    case (present_state)
      S0: next_state = S1;
      S1: next_state = S2;
      S2: next_state = S3;
      S3: next_state = S0;
    endcase
  end
    

  // Logic for output
  always @(*)
  begin 
    case (present_state)
      S0: begin // at reset
            red_light = 0;
            yellow_light = 0;
            green_light = 0;
          end
      S1: begin  // at red_light state
            red_light = 1;
            yellow_light = 0;
            green_light = 0;
          end
      S2: begin // at yellow_light state
            red_light = 0;
            yellow_light = 1;
            green_light = 0;
          end
      S3: begin // at green_light state
            red_light = 0;
            yellow_light = 0;
            green_light = 1;
          end
    endcase
  end
    
endmodule