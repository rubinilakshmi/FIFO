# =============================
# SDC for fifo.v
# =============================

# 1. Define the clock
create_clock -period 50 -name clk [get_ports clk]

# 2. Set input delays for clk (generally not required, but included as per your reference)
set_input_delay 0 -min -rise [get_ports clk] -clock clk
set_input_delay 25 -min -fall [get_ports clk] -clock clk
set_input_delay 0 -max -rise [get_ports clk] -clock clk
set_input_delay 25 -max -fall [get_ports clk] -clock clk

# 3. Set input delays for input 'x'
set_input_delay 0 -min -rise [get_ports x] -clock clk
set_input_delay 0 -min -fall [get_ports x] -clock clk
set_input_delay 5 -max -rise [get_ports x] -clock clk
set_input_delay 5 -max -fall [get_ports x] -clock clk

# 4. Set input delays for reset 'rst' (optional, usually excluded from timing)
set_input_delay 0 -min -rise [get_ports rst] -clock clk
set_input_delay 0 -min -fall [get_ports rst] -clock clk
set_input_delay 0 -max -rise [get_ports rst] -clock clk
set_input_delay 0 -max -fall [get_ports rst] -clock clk

# 5. Set input transition times for x
set_input_transition 10 -min -rise [get_ports x] -clock clk
set_input_transition 15 -min -fall [get_ports x] -clock clk
set_input_transition 20 -max -rise [get_ports x] -clock clk
set_input_transition 25 -max -fall [get_ports x] -clock clk

# 6. Set input transition times for clk (optional, usually not required)
set_input_transition 10 -min -rise [get_ports clk] -clock clk
set_input_transition 15 -min -fall [get_ports clk] -clock clk
set_input_transition 10 -max -rise [get_ports clk] -clock clk
set_input_transition 15 -max -fall [get_ports clk] -clock clk

# 7. Set output load (for 4-bit bus q[3:0])
set_load -pin_load 4 [get_ports {q[0] q[1] q[2] q[3]}]

# 8. Set output delay (q[3:0])
set_output_delay -10 -min -rise [get_ports {q[0] q[1] q[2] q[3]}] -clock clk
set_output_delay -10 -min -fall [get_ports {q[0] q[1] q[2] q[3]}] -clock clk
set_output_delay 30 -max -rise [get_ports {q[0] q[1] q[2] q[3]}] -clock clk
set_output_delay 30 -max -fall [get_ports {q[0] q[1] q[2] q[3]}] -clock clk

# 9. Optional: Remove async reset from timing paths
set_false_path -from [get_ports rst]

# =============================
# End of SDC
# =============================
