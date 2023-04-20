# MemoryPaws
MemoryPaws - Runtime Memory Patching for Linux | Android

MemoryPaws is a shell script tool for patching the memory of a running process on Linux at runtime. With MemoryPaws, you can perform hex editing, dword editing, and qword editing to modify the memory of a target process, making it an excellent tool for debugging and reverse engineering.

## Usage

To use MemoryPaws, run the `memorypaws.sh` script with root privileges and specify the function you want to use, along with the target module name in memory, offset, and the value to be edited.

The syntax for each function is as follows:

```
edit_hex <module_name> <offset> <new_value>
edit_dword <module_name> <offset> <new_value>
edit_qword <module_name> <offset> <new_value>
```

Here's an example of how to use the `edit_hex` function to modify the `libUE4.so` module in memory:

```
edit_hex modulename.so 0x3F94480 "00 00 80 D2 C0 03 5F"
edit_dword modulename.so 0x3F94480 0
edit_qword modulename.so 0x3F94480 3472328296227942705
```

In this example, the edit address for `modulename.so` offset is located at `0x3F94480`, and the new value to be written is `00 00 80 D2 C0 03 5F` , `0`,`3472328296227942705` respectively.


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
