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

Building on macOS(Source: [Blog](https://everythingdevops.dev/building-x86-images-on-an-apple-m1-chip/)):
```bash
docker buildx build --platform=linux/amd64 -t spectre-intel .
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
