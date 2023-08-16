# Check the processor architecture
arch=$(uname -m)

if [[ "$arch" == "arm64" ]]; then
  eval $(/opt/homebrew/bin/brew shellenv)
fi
