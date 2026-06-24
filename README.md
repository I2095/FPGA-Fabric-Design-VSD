# FPGA-Fabric-Design-VSD

## About the Course

This repository documents my learning journey through the FPGA Fabric Design and Architecture Workshop conducted by VLSI System Design (VSD).

The workshop provided a comprehensive introduction to FPGA architecture, FPGA implementation flows, and open-source FPGA development frameworks. Through a series of hands-on experiments, I explored how digital designs are mapped onto configurable FPGA fabrics and gained practical exposure to modern FPGA design methodologies.

The course combines FPGA architecture concepts with real implementation flows using industry-relevant open-source tools, enabling a deeper understanding of how programmable logic devices are designed, configured, and verified.

Course link: https://www.vlsisystemdesign.com/fpga/

---

# Learning Objectives

Throughout this workshop, I learned:

- Fundamentals of FPGA architecture
- Logic blocks, LUTs, Flip-Flops, and routing resources
- FPGA fabric organization and interconnect structures
- OpenFPGA framework and architecture generation
- SOFA (SkyWater Open-Source FPGA Architecture)
- Verilog-to-Routing (VTR) implementation flow
- FPGA synthesis, placement, and routing
- Timing analysis and timing closure concepts
- Resource utilization analysis
- Post-synthesis netlist generation
- FPGA-based implementation of digital designs

---

# Hands-On Experiments

## FPGA Architecture Exploration

Studied the internal structure of FPGA fabrics, including:

- Configurable Logic Blocks (CLBs)
- Lookup Tables (LUTs)
- Flip-Flops
- Routing channels
- Switch boxes
- Connection boxes


## OpenFPGA Framework

Explored the OpenFPGA ecosystem and learned:

- FPGA architecture generation
- Architecture description files
- Bitstream generation concepts
- Open-source FPGA implementation methodology


## SOFA FPGA Architecture

Worked with the SOFA (SkyWater Open-Source FPGA Architecture) platform and studied:

- FPGA1212_QLSOFA_HD_PNR architecture
- Tile-based FPGA fabrics


## Counter Implementation

Implemented and analyzed a 4-bit counter on the SOFA FPGA fabric.

Activities included:

- RTL design
- FPGA mapping
- Placement and routing
- Resource utilization analysis
- Timing analysis
- Post-synthesis verification


## RISC-V Processor Implementation

Implemented a RISC-V processor on the SOFA FPGA architecture using OpenFPGA.

Key activities:

- Processor synthesis
- FPGA implementation
- Timing verification
- Post-synthesis simulation
- Functional validation

This experiment demonstrated how processor-class designs can be successfully deployed on customizable FPGA fabrics.

---

# Tools and Technologies

| Category | Tool / Technology |
|-----------|------------------|
| HDL Design | Verilog |
| FPGA Framework | OpenFPGA |
| FPGA Architecture | SOFA |
| CAD Flow | VTR |
| Simulation | Vivado |
| Process Technology | SkyWater 130nm |
| Processor Architecture | RISC-V |

---
## Workshop Documentation

- [Day 1(A): History of PLDs](https://github.com/I2095/FPGA-Fabric-Design-VSD/blob/main/0.%20History%20of%20Programmable%20Logic%20Devices.md)
- [Day 1(B): FPGA and its Architecture](https://github.com/I2095/FPGA-Fabric-Design-VSD/blob/main/1.%20FPGA%20and%20its%20Architecture.md)
- [Day 1(C): Counter design in Vivado](https://github.com/I2095/FPGA-Fabric-Design-VSD/blob/main/1.2%20Counter%20using%20Verilog%20in%20Vivado.md)
- [Day 2: OpenFPGA Framework](https://github.com/I2095/FPGA-Fabric-Design-VSD/blob/main/2.%20Open%20FPGA.md)
- [Day 3: RISC-V on Vivado](https://github.com/I2095/FPGA-Fabric-Design-VSD/blob/main/3.%20RISC%20V%20on%20Vivado.md)
- [Day 4: SOFA FPGA](https://github.com/I2095/FPGA-Fabric-Design-VSD/blob/main/4.%20SOFA.md)
- [Day 5: RISC-V on SOFA FPGA](https://github.com/I2095/FPGA-Fabric-Design-VSD/blob/main/5.%20RISC%20V%20on%20SOFA.md)

---

# Skills Developed

Through this workshop, I developed practical skills in:

- RTL Design
- FPGA Architecture Analysis
- FPGA Implementation Flows
- Logic Synthesis
- Placement and Routing
- Post-Synthesis Verification
- RISC-V Based Design
- Hardware Architecture Exploration

---

# Relevance to VLSI and Semiconductor Industry

Modern semiconductor design relies heavily on architecture exploration, hardware prototyping, and design verification before ASIC fabrication.

This workshop provides exposure to many concepts that directly translate to VLSI and semiconductor engineering roles:

### Digital Design

Understanding how RTL designs are synthesized and implemented on hardware platforms.

### Physical Design Awareness

Learning placement, routing, resource utilization, and timing closure concepts that are fundamental to ASIC implementation flows.

### Processor Design

Understanding the deployment and verification of RISC-V processor architectures.

### FPGA Prototyping

Using FPGA fabrics as a platform for rapid hardware validation before silicon fabrication.

### Open-Source Silicon Movement

Exploring OpenFPGA and SOFA provides hands-on experience with the growing open-source semiconductor ecosystem.

---

# How This Course Helps My Future Career

This workshop builds a strong foundation for several semiconductor and VLSI domains:

- RTL Design Engineer
- FPGA Design Engineer
- ASIC Design Engineer
- Physical Design Engineer
- Verification Engineer
- SoC Design Engineer
- Computer Architecture Engineer
- Semiconductor Research Engineer

The knowledge gained from FPGA architecture, OpenFPGA, SOFA, and RISC-V implementation provides practical experience with hardware design workflows that are directly applicable to modern chip development.

---

# Key Takeaways

- Understood FPGA fabric architecture and design principles.
- Explored OpenFPGA and SOFA open-source ecosystems.
- Performed synthesis, placement, routing, and timing analysis.
- Verified post-synthesis functionality.
- Implemented a RISC-V processor on a custom FPGA architecture.
- Gained practical exposure to semiconductor design methodologies.

---

# Conclusion

This workshop provided a complete introduction to FPGA architecture and implementation using modern open-source frameworks. By combining theoretical concepts with hands-on implementation of digital circuits and a RISC-V processor, it offered valuable insight into the complete hardware development flow used in FPGA and ASIC design.

The experience gained through this course strengthens my understanding of digital design, FPGA systems, computer architecture, and semiconductor engineering, providing a solid foundation for future work in VLSI and chip design.
