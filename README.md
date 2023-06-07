# SumChecker

This is a Bash script that allows you to verify the checksum of a file using different hash algorithms such as MD5, SHA256, and SHA512.

## Usage

```bash
./sumchecker.sh [options]
```

## Options

- `-h`, `--help`: Show the help message.
- `-f`, `--file`: The path to the file for which you want to calculate the checksum.
- `-s`, `--sum`: The expected checksum value.
- `--md5`: Use the MD5 hash algorithm.
- `--sha256`: Use the SHA256 hash algorithm.
- `--sha512`: Use the SHA512 hash algorithm.

## Example

To calculate the MD5 checksum of a file and compare it with the expected checksum, you can use the following command:

```bash
./sumchecker.sh -f <file_path> -s <expected_checksum> --md5
```

Replace <file_path> with the actual path to the file and <expected_checksum> with the expected MD5 checksum value.

## Tip

You can save `SumChecker.bash` file in a directory and add alias command in your terminal file config for invoque `sumchecker` in your terminal.

### Exemple

In your `~/.bashrc`

```bash
alias sumchecker="<PATH_TO_SumChecker_FILE>/SumChecker.sh"
```

## License

This script is released under the [MIT License](LICENSE.txt). Feel free to modify and distribute it as per the terms of the license.
