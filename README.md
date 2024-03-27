# Traffic Light Controller Design 

## 1. Design Overview:
   - The traffic light controller is implemented using a Mealy Finite State Machine (FSM) in Verilog.
   - The FSM comprises four states: `S0` (Reset State), `S1` (Red Light State), `S2` (Yellow Light State), and `S3` (Green Light State).
   - State transitions are triggered by clock (`clk`) edges and an active-low asynchronous reset (`reset`).
   - Outputs `red_light`, `yellow_light`, and `green_light` control the respective traffic lights.

## 2. State Transitions:
   - `S0` (Reset State):
     - On active-low reset (`reset`), the controller initializes to `S0`.
     - Transition to `S1` (Red Light State) occurs on the subsequent clock edge.
   - `S1` (Red Light State):
     - Turns on `red_light` (`1`).
     - Transition to `S2` (Yellow Light State) occurs on the next clock edge.
   - `S2` (Yellow Light State):
     - Turns on `yellow_light` (`1`).
     - Transition to `S3` (Green Light State) occurs on the next clock edge.
   - `S3` (Green Light State):
     - Turns on `green_light` (`1`).
     - Transitions back to `S0` (Reset State) on the next clock edge, completing the cycle.

## 3. Output Generation Logic:
   - Outputs are determined based on the current FSM state (`present_state`).
   - At `S0` (Reset State), all lights are off (`0`).
   - At `S1` (Red Light State), only `red_light` is on (`1`); `yellow_light` and `green_light` are off (`0`).
   - At `S2` (Yellow Light State), only `yellow_light` is on (`1`); `red_light` and `green_light` are off (`0`).
   - At `S3` (Green Light State), only `green_light` is on (`1`); `red_light` and `yellow_light` are off (`0`).

## 4. Simulation and Testing:
   - Test various scenarios to validate state transitions and output logic.
   - Utilize simulation tools for observing traffic light behavior and ensuring correctness.

This traffic light controller design efficiently manages state transitions and output logic, simulating a traffic light system with red, yellow, and green lights based on clock signals and reset conditions.
