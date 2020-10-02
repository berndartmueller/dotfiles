# Load tools
for file in ./tools/*; do
    [ -e "$file" ] || continue

    echo "Loading tool '$file'..."

    source "$file"
done

# NVM

## Install

chmod +x ~/.nvm/nvm.sh

