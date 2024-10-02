Resources: Brendan Gregg: System Observability

## Tools Method

  1. Run `uptime`/`top` and check load averages over the time;
  2. Run `vmstat` with one-second interval and check the system-wide CPU utilization ("us" + "sy");
     utilization approaching 100% increases the latency of scheduler latency.
  3. Run `mpstat` and examine per-CPU statistics, check for individual hot CPUs; identifies
     possible thread scalability problem;
  4. Run `top` and see which processes and users are the top CPU consumers
  5. Run `pidstat` and break down the top CPU consumers into user- and system- time
  6. Run `perf`/`profile` to identify why the CPUs are in use
  7. Run `perf` and measure IPC as an indicator of cycle based inefficiencies
  8. Run `showboost`/`turboost` and check the current CPU clock rates if they are unusually low
  9. Run `dmesg` and check for CPU temperature stall messages ("cpu clock throttled")

## Use Method

  1. For each CPU check for:
    * Utilization: the time the CPU was busy (usually as percent busy)
    * Saturation: The degree to which runnable threads are queued
    * Errors: CPU errors

## Workload Characterization Checklist

  1. What is the CPU utilization system-wide? Per CPU? Per Core?
  2. How parallel is the CPU load? Is it single-threaded? How many threads?
  3. Which applications or users are using the CPUs? How much?
  4. Which kernel threads are using the CPUs? How much?
  5. What is the CPU usage of interrupts?
  6. What is the CPU interconnect utilization?
  7. Why are the CPUs being used (user- and kernel-level call paths)?
  8. What types of stall cycles are encountered?

