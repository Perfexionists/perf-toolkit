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

# List of repositories
repos=(
  "https://github.com/brendangregg/pmc-cloud-tools"
  "https://github.com/brendangregg/msr-cloud-tools"
)

install_dir="$HOME/tools"

# Ensure install directory exists
mkdir -p "$install_dir"

# Iterate through repositories
for repo in "${repos[@]}"; do
    repo_name=$(basename "$repo" .git)
    repo_path="$install_dir/$repo_name"

    if [ -d "$repo_path" ]; then
        echo "$repo_name is already checked out."
    else
        # Clone the repository
        git clone "$repo" "$repo_path"
        echo "$repo_name cloned."
    fi

    # Add to PATH if not already in PATH
    if [[ "$PATH" != *"$repo_path"* ]]; then
        echo "set PATH \"\$PATH\" \"$repo_path\"" >> "$HOME/.config/fish/config.fish"
        echo "$repo_name added to fish config."
    else
        echo "$repo_name is already in PATH."
    fi
done

echo " - All packages were installed"
