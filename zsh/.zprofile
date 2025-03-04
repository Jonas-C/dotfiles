# Check the processor architecture
arch=$(uname -m)

if [[ "$arch" == "arm64" ]]; then
  eval $(/opt/homebrew/bin/brew shellenv)
fi

# >>> coursier install directory >>>
export PATH="$PATH:/Users/jec/Library/Application Support/Coursier/bin"
# <<< coursier install directory <<<
