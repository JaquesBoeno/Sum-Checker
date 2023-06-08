#!/bin/bash

# Color variables
succes_green=$(tput setaf 84)
failed_red=$(tput setaf 9)
reset_colors=$(tput sgr0)

# Save the args in variables
while [[ $# -gt 0 ]]; do
  case $1 in
    -h | --help)
      echo "
  Mandatory parameters

  -f, --file                  The file path
  -s, --sum                   The expected checksum
  --md5, --sha256, --sha512   The hash Algorithm
"
      exit 0
      ;;
    -f | --file)
      file=$2
      shift 2
      ;;
    -s | --sum)
      sum=$2
      shift 2
      ;;
    --md5)
      alg="md5"
      shift 1
      ;;
    --sha256)
      alg="sha256"
      shift 1
      ;;
    --sha512)
      alg="sha512"
      shift 1
      ;;
    *)
      echo "Invalid parameter: $1"
      echo "Type --help for help"
      shift
      ;;
  esac 
done

# Save the hash
case $alg in
  md5)
    hash=$(md5sum "$file" | awk '{print $1}')
  ;;
  sha256)
    hash=$(sha256sum "$file" | awk '{print $1}')
  ;;
  sha512)
    hash=$(sha512sum "$file" | awk '{print $1}')
  ;;
esac

# Verify the sum and return the result
if [[ "$hash" == "$sum" ]]; then
  echo "${succes_green}The sums match${reset_colors}"
else
  echo "${failed_red}The sums don't match${reset_colors}"
  echo "$alg hash: $hash"
fi
