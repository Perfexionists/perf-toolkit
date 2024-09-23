#!/usr/bin/env bash

# List of packages to install
packages=(
  procps
  util-linux
  sysstat
  iproute2
  numactl
  linux-tools-common
  linux-tools-$(uname -r)
  bpfcc-tools
  bpftrace
  perf-tools-unstable
  trace-cmd
  nicstat
  ethtool
  tiptop
  msr-tools
  hwloc
)

# Update the package list
sudo apt update

# Install the packages
for package in "${packages[@]}"; do
  echo -n " - $package: "
  if ! dpkg -l | grep -q "^ii  $package"; then
    echo "installing"
    sudo apt install -y "$package"
  else
    echo "already installed."
  fi
done

echo " - All packages were installed"
