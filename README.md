# MemoryPaws
MemoryPaws - Runtime Memory Patching for Linux

MemoryPaws is a shell script tool for patching the memory of a running process on Linux at runtime. With MemoryPaws, you can perform hex editing, dword editing, and qword editing to modify the memory of a target process, making it an excellent tool for debugging and reverse engineering.

## Usage

To use MemoryPaws, run the `memorypaws.sh` script with root privileges and specify the function you want to use, along with the target module name in memory, offset, and the value to be edited.

The syntax for each function is as follows:

```
edit_hex <module_name> <offset> <new_value>
edit_dword <module_name> <offset> <new_value>
edit_qword <module_name> <offset> <new_value>
```



## Features

MemoryPaws supports the following features:

- Hex editing support (`edit_hex` function)
- Dword editing support (`edit_dword` function)
- Qword editing support (`edit_qword` function)

## Requirements

MemoryPaws requires the following:

- Linux operating system
- Root privileges

## License

MemoryPaws is licensed under the MIT License.

## Contributing

Contributions to MemoryPaws are welcome! Please see the CONTRIBUTING.md file for more information on how to contribute to this project.
