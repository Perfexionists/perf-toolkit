Resources: Brendan Gregg: System Observability

## Tools Method

  1. Use `nstat/netstat -s` and look for a high rate of retransmits and out-of-order packets;
  2. Use `ip -s link/netstat -i` and check interface error counters including "errors", "dropped",
     "overruns".
  3. Use `ss -tiepm` and check for the limiter flag for important sockets to see what their
     bottleneck is as well as other statistics showing socket health.
  4. Use `nicstat/ip -s link` and check the rate of bytes transmitted and received.
  5. Use `tcplife` and log TCP sessions with process details, duration, and throughput statistics.
  6. Use `tcptop` and watch top TCP sessions life.
  7. Use `tcpdump` for short period.
  8. Use `perf/bcc/bpftrace` and inspect selected packets between the application and the wire.


## Use Method

  1. For each network interface and in direction transmit (TX) and recieve (RX), check for:
    1. Utilization: time the interface was busy sending/receiving frames;
    2. Saturation: the degree of extra queueing, buffering or blocking due to fully utilized
       interface.
    3. Errors: bad checksums, frame too short or too long, collisions, etc.


## Workload Characterization Checklist

  1. What is the network interface throughput?
  2. What is the network interface IOPS?
  3. What is the TCP connection rate?
  4. What is the average packet size? RX, TX?
  5. What is the protocol breakdown for each layer? For TCP, UDP, QUIC?
  6. What TCP/UDP ports are active? Bytes per second, connections per second?
  7. What are the broadcast and multicast packet rates?
  8. Which processes are actively using the network?

## Static Performance Tuning

  1. How many network interfraces are available for use? Are currently in use?
  2. What is the maximum speed of the network interfaces?
  3. What is the currently negotiated speed of the network interfaces?
  4. Are network interfaces negotiated as half or full duplex?
  5. What MTU is configured for the network interfaces?
  6. Are network interfaces trunked?
  7. What tunable parameters exist for the device driver? IP layer? TCP layer?
  8. Have any tunable parameters been changed from the defaults?
  9. How is routing configured? What is the default gateway?
  10. What is the maximum throughput of network components in the data path?
  11. What is the maximum MTU for the datapath and does fragmentation occur?
  12. Are any wireless connections in the data path? Are they suffering interference?
  13. Is forwarding enabled? Is the system acting as a router?
  14. How is DNS configured? How far away is the server?
  15. Are there known performance issues (bugs) with the network device driver? Kernel TCP/IP
      stack?
  16. What firewalls are present?
  17. Are there software-imposed network throughput limits presents (resource controls? WHat are
      they?
