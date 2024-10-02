Resources: Brendan Gregg: System Observability

## Tools Method

  1. [Page scanning] look for continual page scanning using `sar -B` and checking `pgscan` columns;
  2. [Pressure stal information] look at memory pressure statistics and how it is changing over time
     using `cat /proc/pressure/memory`
  3. [Swapping] Check `si` and `so` columns in `vmstat`.
  4. Run `vmstat` and check `free` column of available memory.
  5. Check `/var/log/messages` and `dmesg` and search for out of memory;
  6. Run `top` to see which processes and users are top physical memory consumers
  7. Trace memory allocations with `perf` or `bpftrace`

## Use Method

  1. [Utilization] Check how much memory is in use and how much is available, both virtual and
     physical.
  2. [Saturation] Check degree of page scanning, paging, swapping, OOM killer sacrifices;
  3. [Errors] Check hardware and software errors.

## Memory Analysis Checklist

  1. What is the working set size for the applications?
  2. Where is the kernel memory used? Per slab?
  3. How much of the file system cache is active as opposed to inactive?
  4. Where is the process memory used (instructions, caches, buffers, objects, etc.)?
  5. Why are processes allocating memory (call paths)?
  6. Why is the kernel allocating memory (call paths)?
  7. Anything odd with process library mappings?
  8. What processes are actively being swapped out?
  9. What processes have previously been swapped out?
  10. Could processes or the kernel have memory leaks?
  11. In NUMA system, how well is memory distributed across memory nodes?
  12. What are the IPC and memory stall cycle rates?
  13. How balanced are the memory buses?
  14. How much local memory I/O is performed as opposed to remote memory I/O?

## Static Performance Tuning

  1. How much main memory is there in total?
  2. How much memory are applications configured to use?
  3. Which memory allocators do the applications use?
  4. What is the speed of the main memory? Is it the fastest type available (DDR5)?
  5. Has main memory ever been fully tested, e.g. using memtester?
  6. What is the system architecture? NUMA or UMA?
  7. Is the operating system NUMA-aware? Does it provide numa tunables?
  8. Is memory attached to the same socket or split accross sockets?
  9. How many memory buses are present?
  10. What are the number and size of the CPU caches? TLB?
  11. What are the BIOS settings?
  12. Are large pages configured and used?
  13. Is overcommit available and configured?
  14. What other system memory tunables are in use?
  15. Are there software-imposed memory limits?
