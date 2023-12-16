# Instructions  

* This is the skeleton for a microprocessor implementation.
* Your design files are called cpu-whatever.v
  * The main control unit and hierarchal block is in cpu-main.v
* Already implemented:
  * cpu-alu.v : Arithmetic logic unit
  * cpu-testinterface.v: The CPU test interface
  * memory.v  : A memory holding instructions and data for the processor.
  * tb-memory.v : A testbench for memory; passing
  * tb-regfile.v : A testbench for the register file; failing because the register file is not implemented
  * tb-processor.v: A testbench for the processor which runs 256 cycles of execution.  Boring because the processor still does nothing.
* Skeletons implemented for these modules (inputs/outputs are correct, but there is no implementation):
  * cpu-regfile.v
  * cpu-main.v
* Testbenches are kept in the testbenches folder
* Kayden's ballistics program (modified to set up registers at the beginning) is in programs/ballistics.mem
* A description of the program is in programs/ballistics.txt
* Documentation is in the documentation folder