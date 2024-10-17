Resources: Brendan Gregg: System Observability

## Filesystem Analysis Checklist

  1. WHat is the file system cache hit ratio? Miss rate?
  2. What are the file system cache capacity and current usage?
  3. What other caches are present (directory, inode, buffer) and what are their statistics?
  4. Have any attempts been made to tune the file system in the past? Are any file system
     parameters set to values other than their defaults?
  5. Which applications or users are using the file system?
  6. What files and directories are being accessed? Created and deleted?
  7. Have any errors been encountered? Was this due to invalid requests, or issues from the file
     system?
  8. Why is file system I/O issued?
  9. To what degree do applications directly request file system I/O?
  10. What is the distribution of I/O arrival times?
  11. What is the average file system operation latency?
  12. Are there any high-latency outliers?
  13. What is the full distribution of operation latency?
  14. Are system resource controls for file system or disk I/O present and active?

## Static Performance Tuning

  1. How many file systems are mounted and actively used?
  2. What is the file system record size?
  3. Are access timestamps enabled?
  4. What other file system options are enabled (compression, encryption)?
  5. How has the file system cache been configured? Maximum size?
  6. How have other caches (directory, inode, buffer) been configured?
  7. Is a second-level cache present and in use?
  8. How many storage devices are presented and in use?
  9. What is the storage device configuration? RAID?
  10. Which file system types are used?
  11. What is the version of the file system (or kernel)?
  12. Are there file system bugs/patches that should be considered?
  13. Are there resource controls in use for file system I/O?


