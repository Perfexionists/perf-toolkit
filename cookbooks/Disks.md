Resources: Brendan Gregg: System Observability

## Disk Analysis Checklist

  1. What is the IOPS rate system-wide? Per disk? Per controller?
  2. What is the throughput system-wide? Per disk? Per controller?
  3. Which applications or users are using the disks?
  4. What file systems or files are being accessed?
  5. Have any errors been encountered? Were they due to invalid requests or issues on the disks?
  6. How balanced is the I/O over available disks?
  7. What is the IOPS for each transport bus involved?
  8. What non-data-transfer disk commands are being issued?
  9. Why is disk I/O issued (kernel call path)?
  10. To what degree is disk I/O application-synchronous?
  11. What is the distribution of I/O arrival times?

## Performance Characterization

  1. How busy is each disk (utilization)?
  2. How saturated is each disk with I/O (wait queueing)?
  3. What is the average I/O service time?
  4. What is the average I/O wait time?
  5. Are there I/O outliers with high latency?
  6. What is the full distribution of I/O latency?
  7. Are system resource controls, such as I/O throttling present and active?
  8. What is the latency of non data-transfer disk commands?

## Static Performance Tuning

  1. How many disks are present? Of which types (e.g., SMR, MLC)? Sizes?
  2. What version is the disk firmware?
  3. How many disk controllers are present? Of which interface types?
  4. Are disk controller cards connected to high-speed slots?
  5. How many disks are connected to each HBA?
  6. If disk/controller batter backups are present, what is their power level?
  7. What version is the disk controller firmware?
  8. Is RAID configured? How exactly, including strip width?
  9. Is multipathing available and configured?
  10. What version is the disk device driver?
  11. What is the server main memory size? In use by the page and buffer caches?
  12. Are there operating system bugs/paches for any of the storage device drivers?
  13. Are there resource controls in use for disk I/O?


