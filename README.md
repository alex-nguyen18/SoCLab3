# SoCLab3
This repo holds the code for the gemm, testbench, and testcase generation for Lab 3 of SoC F21. It includes 1 testcase/golden combo.

Testcases are generated using MATLAB to separate generation algorithm from our c++ implementation. Additionally, MATLAB is used in both industry and academic settings, showing credibility of implementation.

# Usage
Build the testbench using:
  g++ -std=c++11 -o testbench testbench.cpp gemm.cpp

Usage of the testbench looks like:
  ./testbench testcase.txt golden.txt

Matlab script will create a testcase.txt and golden.txt in the folder you are currently running MATLAB out of.
  (CMD) >> testcase_gen 
  or
  Run in Editor view (top bar)
