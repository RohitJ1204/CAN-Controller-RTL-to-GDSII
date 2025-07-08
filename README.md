# CAN Controller – RTL to Netlist Implementation 🚗📡

This project demonstrates a **CAN (Controller Area Network) Controller** implemented in **Verilog HDL**, and taken through **RTL design**, **testbench verification**, **synthesis**, and **report generation** (area, power, timing, gate count). This repository is structured to showcase my **VLSI design expertise**, along with my understanding of digital logic design, STA, and EDA toolchains.

---

## 📁 Project Structure

| Folder/File             | Description |
|-------------------------|-------------|
| [`src/CAN_Controller.v`](src/CAN_Controller.v)               | Verilog RTL source code for CAN Controller |
| [`tb/tb_CAN_Controller.v`](tb/tb_CAN_Controller.v)           | Testbench file used for functional simulation |
| [`constraints/constraints_top.sdc`](constraints/constraints_top.sdc) | SDC timing constraint file |
| [`constraints/rcscript.tcl`](constraints/rcscript.tcl)       | TCL synthesis automation script |
| [`reports/`](reports/)                                      | Post-synthesis reports (area, timing, gate, power) |
| [`netlist/CAN_Controller_netlist.v`](netlist/CAN_Controller_netlist.v) | Synthesized gate-level netlist |
| [`README.md`](README.md)                                    | Project documentation (this file) |

---

## 🌐 What is CAN (Controller Area Network)?

The **CAN protocol** is a communication standard used primarily in **automotive and industrial applications**. It allows microcontrollers and devices (nodes) to communicate with each other **without a host computer**. It’s especially favored in harsh environments due to its robustness, fault-tolerance, and deterministic behavior.

### 🛠️ Key Features:
- Multi-master capability: Any node can initiate communication
- Prioritized message arbitration (based on CAN IDs)
- Error detection and retransmission support
- Two-wire differential signaling (CAN-H and CAN-L)
- Frame types: data, remote, error, and overload

### 📤 Frame Structure:                                                                                                           
- **SOF**: Start of Frame  
- **Identifier**: 11-bit or 29-bit priority-based ID  
- **RTR**: Remote Transmission Request  
- **IDE**: Identifier Extension  
- **DLC**: Data Length Code  
- **Data**: Up to 8 bytes  
- **CRC**: Cyclic Redundancy Check  
- **ACK**: Acknowledgement  
- **EOF**: End of Frame

---

## 🔧 Project Description

### 📌 Features of This Design

- RTL design using Verilog for CAN Controller
- Implements core CAN logic: bit timing, frame formatting, transmit/receive modules, CRC generation
- Automated testbench to validate functionality
- Constraints defined using SDC and automated synthesis using TCL
- Fully analyzed using power, area, timing, and gate-level metrics

---

## 📂 RTL Module: [`CAN_Controller.v`](src/CAN_Controller.v)

This file describes the RTL architecture of the CAN Controller. Here’s a brief overview of what’s implemented:

### ✅ Functional Blocks:
1. **Bit Timing Logic** – Ensures that data is sampled at the correct point on the CAN bus.
2. **Transmit FSM** – Controls the sequence of data transmission over the CAN bus.
3. **Receive FSM** – Detects frames and stores them in internal registers.
4. **CRC Generator** – Ensures data integrity by appending CRC checksum.
5. **Frame Decoder** – Extracts frame fields (identifier, data, etc.) from input.
6. **Control Registers** – Stores transmission/receive status and control signals.
7. **Bus Interface** – Interfaces with external modules or microcontrollers.

### ⚙️ Code Highlights:
- Parameterized data widths for modularity
- Synchronous reset and edge-triggered logic
- Uses `always @ (posedge clk)` for all sequential elements
- Frame arbitration and CRC checks integrated in FSM logic
- Output ports for transmission, reception, and frame validity

---

## 🧪 Testbench: [`tb_CAN_Controller.v`](tb/tb_CAN_Controller.v)

The testbench is used to **verify the functional correctness** of the CAN controller. Here's what it does:

### 🎯 Objectives:
- Apply reset and generate clock
- Provide known input stimuli (e.g., CAN frames to be transmitted)
- Observe output waveforms to validate protocol behavior
- Check CRC output and acknowledgment signaling

### 🔍 Functional Sections:
1. **Clock Generator**  
   - 10ns period clock with 50% duty cycle

2. **Reset Logic**  
   - Asserted low for a few clock cycles at the start

3. **Stimulus Block**  
   - Sends specific CAN frame format (with sample data, ID, etc.)
   - Waits for TX_done or frame_valid outputs
   - Can simulate multiple frames

4. **Assertions / Output Checks**  
   - Monitors outputs and displays results using `$display`
   - Useful for waveform viewers (e.g., GTKWave, ModelSim)

---

## 🧰 Constraints & Automation

### [`constraints_top.sdc`](constraints/constraints_top.sdc)
Defines the **timing constraints** for synthesis:
- Clock definition: frequency, waveform
- Input/output delays
- Timing exceptions (false paths, multicycle paths)

### [`rcscript.tcl`](constraints/rcscript.tcl)
TCL script to automate synthesis in RC Compiler:
- Sets up design libraries and constraints
- Reads Verilog files and applies SDC
- Runs compile, generates reports and netlist

---

## 📊 Reports

Each report gives insight into the design metrics post-synthesis.

| Report File | Description |
|-------------|-------------|
| [`CAN_Controller_area.rpt`](reports/CAN_Controller_area.rpt)       | Cell usage, hierarchical area breakdown |
| [`CAN_Controller_power.rpt`](reports/CAN_Controller_power.rpt)     | Dynamic + leakage power consumption |
| [`CAN_Controller_timing.rpt`](reports/CAN_Controller_timing.rpt)   | Slack, setup/hold violations |
| [`CAN_Controller_gatescc.rpt`](reports/CAN_Controller_gatescc.rpt) | Gate count (in terms of NAND2 equivalents) |

---

## ✅ Outcome

- Simulation validates correct transmission/reception of CAN frames
- Clean synthesis without critical violations
- Area and power optimized for low-resource automotive targets
- Demonstrates full digital ASIC design flow from RTL to gate-level netlist

---

## 💼 Skills Demonstrated

- RTL design in Verilog
- Testbench development and simulation
- Functional verification
- Synthesis using RC Compiler / Design Compiler
- Static Timing Analysis (STA)
- Power, Area, Gate Count analysis
- TCL scripting and constraint handling

---

## 🧠 Future Scope

- Add support for **Extended Frame Format** (29-bit ID)
- Implement **Error Handling FSM** (ACK, bit, CRC errors)
- Interface with **AXI / SPI** bus for SoC integration
- Add **Arbiter logic** for multi-master configuration
- Physical design with clock tree synthesis and layout (using Cadence Innovus)

---

## 👤 Author

**Rohit J**  
[LinkedIn Profile](https://www.linkedin.com/in/rohitj264/)

---

## 📜 License

This project is open-source under the MIT License.
