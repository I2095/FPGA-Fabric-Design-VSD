# Counter
The counter has been programmed in Vivado using Verilog HDL language. For this, Vivado 2025.1 version has been used. The board used is Basys 3.

<img width="2158" height="1368" alt="Screenshot 2026-06-15 205818" src="https://github.com/user-attachments/assets/9c33dfd6-bf62-434d-854e-058a8a1aaed0" />

# Up-counter verilog code with clock divider
`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/15/2026 09:24:08 PM
// Design Name: 
// Module Name: counterVSD
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////
module counterVSD(
    input clk, // clock signal
    input rst, //reset signal
    output reg [3:0] counter_out //output of the counter
);

reg div_clk; //clock divider signal
reg [25:0] delay_count; //delay

//Clock divider that has been used
always @(posedge clk)
begin
    if (rst)
    begin
        delay_count <= 26'd0;
        div_clk <= 1'b0;
    end
    else
    begin
        if (delay_count == 26'd212)
        begin
            delay_count <= 26'd0;
            div_clk <= ~div_clk;
        end
        else
            delay_count <= delay_count + 1;
    end
end
//counter module
always @(posedge div_clk or posedge rst)
begin
    if (rst)
        counter_out <= 4'b0000;
    else
        counter_out <= counter_out + 1;
end
endmodule

# Testbench
`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/15/2026 09:31:17 PM
// Design Name: 
// Module Name: counterVSD_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////
module counterVSD_tb;
reg clk;
reg rst;
wire [3:0] counter_out;

// Instantiate DUT (Design Under Test)
counterVSD dut (
    .clk(clk),
    .rst(rst),
    .counter_out(counter_out)
);

// generate clock signal 
always #5 clk = ~clk;   // 100 MHz clock (10ns period)

initial begin
    // Initialize signals
    clk = 0;
    rst = 1;
    // Hold reset for a few cycles
    #20;
    rst = 0;
    // Run simulation for some time
    #5000;
    // Finish simulation
    $finish;
end
//monitor
initial begin
    $monitor("Time = %0t | rst = %b | counter_out = %b",
              $time, rst, counter_out);
end
endmodule

# Simulation Output
<img width="2404" height="776" alt="image" src="https://github.com/user-attachments/assets/d2b25ce8-7242-44f8-915a-154d668aada9" />

# TCL Console output
Time = 31487805000 | rst = 0 | counter_out = 0000
Time = 31492065000 | rst = 0 | counter_out = 0001
Time = 31496325000 | rst = 0 | counter_out = 0010
Time = 31500585000 | rst = 0 | counter_out = 0011
Time = 31504845000 | rst = 0 | counter_out = 0100
Time = 31509105000 | rst = 0 | counter_out = 0101
Time = 31513365000 | rst = 0 | counter_out = 0110
Time = 31517625000 | rst = 0 | counter_out = 0111
Time = 31521885000 | rst = 0 | counter_out = 1000
Time = 31526145000 | rst = 0 | counter_out = 1001
Time = 31530405000 | rst = 0 | counter_out = 1010
Time = 31534665000 | rst = 0 | counter_out = 1011
Time = 31538925000 | rst = 0 | counter_out = 1100
Time = 31543185000 | rst = 0 | counter_out = 1101
Time = 31547445000 | rst = 0 | counter_out = 1110
Time = 31551705000 | rst = 0 | counter_out = 1111
Time = 31555965000 | rst = 0 | counter_out = 0000
Time = 31560225000 | rst = 0 | counter_out = 0001
Time = 31564485000 | rst = 0 | counter_out = 0010
---
# Elaborated Design
Default Layout
<img width="1524" height="616" alt="image" src="https://github.com/user-attachments/assets/7db63141-973c-47d7-bea6-d07449104250" />

I/O Planning
<img width="942" height="738" alt="image" src="https://github.com/user-attachments/assets/7af690c3-bf6c-47a1-92ba-d8e88bc4f329" />

---
# Pin Mapping
For clock and reset:
<img width="772" height="1036" alt="image" src="https://github.com/user-attachments/assets/5d931953-9cf3-46b4-88be-14f0991dc3d7" />

For LED Mapping:
<img width="1104" height="1072" alt="image" src="https://github.com/user-attachments/assets/697da91a-b243-4ec3-bab2-c3b280e64592" />

---
# Vivado constraints settings
<img width="2404" height="716" alt="image" src="https://github.com/user-attachments/assets/265c5820-bba6-4126-a483-e5151574f46b" />

<img width="2166" height="864" alt="image" src="https://github.com/user-attachments/assets/7542d18c-7687-4b43-a241-be41fd52a7a4" />

---
# Timing Constraints
<img width="1276" height="782" alt="image" src="https://github.com/user-attachments/assets/45efaffa-fb22-42f9-b143-ccf149f3c10f" />

# Static Timing Analysis (STA)
Static Timing Analysis (STA) verifies that data propagates correctly between flip-flops within a clock cycle, ensuring reliable operation at the target clock frequency.

## 1. Basic Data Path
A synchronous timing path consists of:
- **Launch Flip-Flop (FF1)**: Launches data after a clock edge.
  - Clock-to-Q delay: **tco**
- **Combinational Logic**: Processes data.
  - Logic delay: **tlogic**
- **Capture Flip-Flop (FF2)**: Captures data on the next clock edge.
### Data Path

```text
FF1 ──► Combinational Logic ──► FF2
```
Data must travel from FF1 to FF2 within one clock cycle.

---
## 2. Timing Requirements
### Setup Time (tsetup)
Data must arrive and remain stable before the capturing clock edge.
- Ensures correct data capture
- Setup violations may cause metastability or incorrect sampling
### Hold Time (thold)
Data must remain stable after the capturing clock edge.
- Prevents race conditions
- Hold violations can corrupt captured data
---
## 3. Slack (Timing Margin)
Slack indicates whether a timing path satisfies timing constraints.
- **Positive Slack** → Timing met 
- **Zero Slack** → Timing just met
- **Negative Slack** → Timing violation 
Slack represents the available timing margin.
---
## 4. Setup Timing Check
Setup analysis ensures data arrives before the next clock edge.
### Data Arrival Time
```
tco + tlogic(max)
```
### Data Required Time
```
Tclk - tsetup
```
### Setup Slack
```
(Tclk - tsetup) - (tco + tlogic(max))
```
### Condition
- Slack ≥ 0 → Timing met 
- Slack < 0 → Reduce logic delay or increase clock period
---
## 5. Hold Timing Check
Hold analysis ensures data does not arrive too quickly.
### Data Arrival Time
```
tco + tlogic(min)
```
### Required Hold Time
```
thold
```
### Hold Slack
```
(tco + tlogic(min)) - thold
```
### Condition
- Slack ≥ 0 → Timing met 
- Slack < 0 → Add delay buffers or modify routing

# Counter Timing Summary
- Since no constraints have been specified, setup and hold slack are 'inf'
<img width="2442" height="1544" alt="image" src="https://github.com/user-attachments/assets/3ced2367-027c-4408-ba8c-2b5d7d1a9992" />

- To set the constraints, go to the 'Constraints Wizard' in the 'Flow Navigator'
- Set the clk constraint.
<img width="2376" height="1660" alt="image" src="https://github.com/user-attachments/assets/72b8f1a0-03ff-4f27-bb5f-a45b9fac6809" />
---
<img width="1842" height="1648" alt="image" src="https://github.com/user-attachments/assets/47df7dfa-da81-495e-9b35-5cc852315571" />

---
- Only clock constraint has been specified
<img width="1844" height="1642" alt="image" src="https://github.com/user-attachments/assets/c322db04-77e5-4b1b-b293-81c8bfd1c299" />
---
- Re-run synthesis and observe the timing summary
<img width="2426" height="1530" alt="image" src="https://github.com/user-attachments/assets/3643a066-84c0-40b9-b264-ef79ad4bd122" />
---
- Run the implementation
# Synthesized netlist
<img width="2352" height="1344" alt="image" src="https://github.com/user-attachments/assets/ba2fac7d-a207-48f8-bfd5-74c2baf1e033" />

# Report Utilization
<img width="1404" height="518" alt="image" src="https://github.com/user-attachments/assets/5e91f041-567c-49ac-8ae7-750dd6ea1839" />

<img width="1594" height="774" alt="image" src="https://github.com/user-attachments/assets/209f80d5-dff1-4142-9ecf-71df99368027" />

- Bitstream generation -> Open Target -> Connect FPGA -> Program Device
<img width="2168" height="1198" alt="image" src="https://github.com/user-attachments/assets/75c5c6e0-5f31-4f22-9c1f-ea88b09d9b9a" />

# Path summary report after implementation
<img width="2430" height="1520" alt="image" src="https://github.com/user-attachments/assets/302657cf-e7a9-47fe-90ba-ec9832f04751" />

# Power Utilization
<img width="1650" height="878" alt="image" src="https://github.com/user-attachments/assets/a02b39f2-b60c-4bee-90d0-d98ac11f9906" />

# Power used by Logic Cells
<img width="2394" height="872" alt="image" src="https://github.com/user-attachments/assets/04dccdc6-e50c-43ca-b563-35d3b83951b7" />

# Power used by the signals
<img width="2388" height="914" alt="image" src="https://github.com/user-attachments/assets/73973f39-9501-4e5c-bb72-f6156408eb17" />

# After implementation Area Report
<img width="1538" height="882" alt="image" src="https://github.com/user-attachments/assets/1982769f-d2d9-497c-aee0-6b6eabe813b8" />

