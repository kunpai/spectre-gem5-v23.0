# spectre-gem5-v23.0
Repository on getting Spectre V1 working in gem5 v23.0

## Compiler Version and Ubuntu Version
gcc (Ubuntu 4.8.5-4ubuntu2) 4.8.5
Ubuntu 16.04 LTS

## Docker Image for compiling Spectre V1
``` Dockerfile
# Use Ubuntu 16.04 for x86_64 as the base image
FROM ubuntu:16.04

# Update the package list and install essential tools
RUN apt-get update && apt-get install -y \
    build-essential \
    wget \
    git \
    vim \
    nano \
    curl \
    zip

# Install GCC 4.8
RUN apt-get install -y gcc-4.8 g++-4.8

# Create symbolic links for GCC and G++
RUN update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-4.8 60 --slave /usr/bin/g++ g++ /usr/bin/g++-4.8

# Clean up the package list to reduce the image size
RUN apt-get clean && rm -rf /var/lib/apt/lists/*

# Set the default command to be a shell
CMD ["/bin/bash"]
```

Then, put `spectre_v1.c` into the Docker image and compile it with the following command:
``` bash
gcc -o spectre_v1 spectre_v1.c -static -std=c99
```

## Running on gem5 v23.0
``` bash
build/X86/gem5.opt configs/learning_gem5/part1/two_level.py <LOCATION_OF_SPECTRE_V1_BIN>
```

## Expected Output
``` bash
gem5 Simulator System.  https://www.gem5.org
gem5 is copyrighted software; use the --copyright option for details.

gem5 version DEVELOP-FOR-23.1
gem5 compiled Nov  3 2023 17:33:33
gem5 started Nov  4 2023 00:51:56
gem5 executing on sabro, pid 2403484
command line: ./build/ALL/gem5.opt configs/learning_gem5/part1/two_level.py /home/paikunal/spectre_gccHashiru

Global frequency set at 1000000000000 ticks per second
warn: No dot file generated. Please install pydot to generate the dot file and pdf.
src/mem/dram_interface.cc:690: warn: DRAM device capacity (8192 Mbytes) does not match the address range assigned (512 Mbytes)
src/base/statistics.hh:279: warn: One of the stats is a legacy stat. Legacy stat is a stat that does not belong to any statistics::Group. Legacy stat is deprecated.
system.remote_gdb: Listening for connections on port 7000
Beginning simulation!
src/sim/simulate.cc:194: info: Entering event queue @ 0.  Starting simulation...
src/sim/syscall_emul.hh:1014: warn: readlink() called on '/proc/self/exe' may yield unexpected results in various settings.
      Returning '/home/paikunal/spectre_gccHashiru'
src/sim/mem_state.cc:443: info: Increasing stack size by one page.
Spectre PoC
Using a cache hit threshold of 80.
Build: RDTSCP_SUPPORTED MFENCE_SUPPORTED CLFLUSH_SUPPORTED INTEL_MITIGATION_DISABLED LINUX_KERNEL_MITIGATION_DISABLED 
Reading 40 bytes:
Reading at malicious_x = 0xffffffffffdd6d48... Success: 0x54=’T’ score=2 
Reading at malicious_x = 0xffffffffffdd6d49... Success: 0x68=’h’ score=2 
Reading at malicious_x = 0xffffffffffdd6d4a... Success: 0x65=’e’ score=2 
Reading at malicious_x = 0xffffffffffdd6d4b... Success: 0x20=’ ’ score=2 
Reading at malicious_x = 0xffffffffffdd6d4c... Success: 0x4D=’M’ score=2 
Reading at malicious_x = 0xffffffffffdd6d4d... Success: 0x61=’a’ score=2 
Reading at malicious_x = 0xffffffffffdd6d4e... Success: 0x67=’g’ score=2 
Reading at malicious_x = 0xffffffffffdd6d4f... Success: 0x69=’i’ score=2 
Reading at malicious_x = 0xffffffffffdd6d50... Success: 0x63=’c’ score=2 
Reading at malicious_x = 0xffffffffffdd6d51... Success: 0x20=’ ’ score=2 
Reading at malicious_x = 0xffffffffffdd6d52... Success: 0x57=’W’ score=2 
Reading at malicious_x = 0xffffffffffdd6d53... Success: 0x6F=’o’ score=2 
Reading at malicious_x = 0xffffffffffdd6d54... Success: 0x72=’r’ score=2
...
```

## References
- [gem5](https://www.gem5.org/)
- [Spectre V1 PoC](https://gist.github.com/ErikAugust/724d4a969fb2c6ae1bbd7b2a9e3d4bb6)
- [Spectre Paper](https://spectreattack.com/spectre.pdf)
- [Jason Lowe-Power's Blog](http://www.lowepower.com/jason/visualizing-spectre-with-gem5.html)


# Progress Report: Exploring Spectre Attacks on Different Processors

## Abstract:
The paper aims to investigate the susceptibility of x86-based processors to Spectre attacks using gem5 simulations. It explores the impact of various configurations, branch predictors, and additional components on the effectiveness of Spectre attacks. The study compares in-order (MinorCPU) and out-of-order (O3CPU) processors and evaluates different branch predictors, considering factors like dataflow, additional components, "smartness" of predictors, state space, and the number of training iterations.

## 1. Introduction:
The introduction provides a concise overview of Spectre attacks, emphasizing the importance of understanding their behavior in diverse processor architectures. The paper's objective is clearly outlined, focusing on the exploration of Spectre susceptibility in x86-based in-order and out-of-order processors.

## 2. Methodology:
### 2.1 Configurations:
Baseline models include an x86-based in-order processor (MinorCPU) and an out-of-order processor (O3CPU). Branch predictors, such as TAGE, Tournament, Local, BiMode, LTAGE, and Multiperspective Perceptron, are paired with each processor for evaluation.

### 2.2 Statistics of Interest:
Key metrics include time taken for Spectre attack, number of mispredicted branches, and percentage of the secret string revealed. These metrics serve as indicators of the susceptibility of each configuration to Spectre attacks.

### 2.3 A Successful Run:
The criteria for a successful Spectre run are established, involving the examination of terminal output for leaked information.

## 3. Results:
### 3.1 MinorCPU:
Spectre attacks on MinorCPU configurations do not show successful results, with no part of the secret string revealed. The in-order nature of the processor contributes to its resistance against Spectre attacks.

### 3.2 O3CPU:
O3CPU configurations exhibit varying success rates in Spectre attacks. Notably, all branch predictors reveal parts of the secret string, indicating susceptibility. The impact of different predictors is detailed in Table II.

## 4. Discussion:
### 4.1 Impact of Dataflow:
In-order processors (MinorCPU) are inherently resistant to Spectre attacks due to their sequential execution nature, lacking speculative execution.

### 4.2 Impact of Additional Components:
The addition of a loop predictor or statistical corrector enhances branch predictor resistance to Spectre attacks, introducing complexity and longer training times.

### 4.3 Impact of "Smartness" of BP:
Smarter predictors (e.g., TAGE) are more susceptible to Spectre attacks, with faster adaptation to program behavior.

### 4.4 Impact of BP State Space:
Increasing the state space of branch predictors mitigates Spectre attacks by storing more information about program control flow.

### 4.5 Impact of Number of Tries:
Extending the training period increases the success rate of Spectre attacks on O3CPU, revealing more characters of the secret string. Practical considerations for attackers are discussed.

## 5. Conclusion:
The study provides valuable insights into the factors influencing the susceptibility of x86-based processors to Spectre attacks. It establishes the role of dataflow, additional components, predictor "smartness," state space, and training iterations in determining vulnerability. Practical considerations for attackers are highlighted, emphasizing the trade-offs between extended training periods and attack feasibility.
