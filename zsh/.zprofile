# Check the processor architecture
arch=$(uname -m)

if [[ "$arch" == "arm64" ]]; then
  eval "$(/url/local/bin/brew shellenv)"
fi
