# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.20

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:

#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:

# Disable VCS-based implicit rules.
% : %,v

# Disable VCS-based implicit rules.
% : RCS/%

# Disable VCS-based implicit rules.
% : RCS/%,v

# Disable VCS-based implicit rules.
% : SCCS/s.%

# Disable VCS-based implicit rules.
% : s.%

.SUFFIXES: .hpux_make_needs_suffix_list

# Command-line flag to silence nested $(MAKE).
$(VERBOSE)MAKESILENT = -s

#Suppress display of executed commands.
$(VERBOSE).SILENT:

# A target that is always out of date.
cmake_force:
.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /snap/clion/169/bin/cmake/linux/bin/cmake

# The command to remove a file.
RM = /snap/clion/169/bin/cmake/linux/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/anna/CLionProjects/ABC/Homework_2

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/anna/CLionProjects/ABC/Homework_2/cmake-build-debug

# Include any dependencies generated for this target.
include CMakeFiles/Homework_2.dir/depend.make
# Include the progress variables for this target.
include CMakeFiles/Homework_2.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/Homework_2.dir/flags.make

CMakeFiles/Homework_2.dir/main.cpp.o: CMakeFiles/Homework_2.dir/flags.make
CMakeFiles/Homework_2.dir/main.cpp.o: ../main.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/anna/CLionProjects/ABC/Homework_2/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/Homework_2.dir/main.cpp.o"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/Homework_2.dir/main.cpp.o -c /home/anna/CLionProjects/ABC/Homework_2/main.cpp

CMakeFiles/Homework_2.dir/main.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/Homework_2.dir/main.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/anna/CLionProjects/ABC/Homework_2/main.cpp > CMakeFiles/Homework_2.dir/main.cpp.i

CMakeFiles/Homework_2.dir/main.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/Homework_2.dir/main.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/anna/CLionProjects/ABC/Homework_2/main.cpp -o CMakeFiles/Homework_2.dir/main.cpp.s

CMakeFiles/Homework_2.dir/animals.cpp.o: CMakeFiles/Homework_2.dir/flags.make
CMakeFiles/Homework_2.dir/animals.cpp.o: ../animals.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/anna/CLionProjects/ABC/Homework_2/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building CXX object CMakeFiles/Homework_2.dir/animals.cpp.o"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/Homework_2.dir/animals.cpp.o -c /home/anna/CLionProjects/ABC/Homework_2/animals.cpp

CMakeFiles/Homework_2.dir/animals.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/Homework_2.dir/animals.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/anna/CLionProjects/ABC/Homework_2/animals.cpp > CMakeFiles/Homework_2.dir/animals.cpp.i

CMakeFiles/Homework_2.dir/animals.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/Homework_2.dir/animals.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/anna/CLionProjects/ABC/Homework_2/animals.cpp -o CMakeFiles/Homework_2.dir/animals.cpp.s

CMakeFiles/Homework_2.dir/fish.cpp.o: CMakeFiles/Homework_2.dir/flags.make
CMakeFiles/Homework_2.dir/fish.cpp.o: ../fish.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/anna/CLionProjects/ABC/Homework_2/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Building CXX object CMakeFiles/Homework_2.dir/fish.cpp.o"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/Homework_2.dir/fish.cpp.o -c /home/anna/CLionProjects/ABC/Homework_2/fish.cpp

CMakeFiles/Homework_2.dir/fish.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/Homework_2.dir/fish.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/anna/CLionProjects/ABC/Homework_2/fish.cpp > CMakeFiles/Homework_2.dir/fish.cpp.i

CMakeFiles/Homework_2.dir/fish.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/Homework_2.dir/fish.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/anna/CLionProjects/ABC/Homework_2/fish.cpp -o CMakeFiles/Homework_2.dir/fish.cpp.s

CMakeFiles/Homework_2.dir/beast.cpp.o: CMakeFiles/Homework_2.dir/flags.make
CMakeFiles/Homework_2.dir/beast.cpp.o: ../beast.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/anna/CLionProjects/ABC/Homework_2/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Building CXX object CMakeFiles/Homework_2.dir/beast.cpp.o"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/Homework_2.dir/beast.cpp.o -c /home/anna/CLionProjects/ABC/Homework_2/beast.cpp

CMakeFiles/Homework_2.dir/beast.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/Homework_2.dir/beast.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/anna/CLionProjects/ABC/Homework_2/beast.cpp > CMakeFiles/Homework_2.dir/beast.cpp.i

CMakeFiles/Homework_2.dir/beast.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/Homework_2.dir/beast.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/anna/CLionProjects/ABC/Homework_2/beast.cpp -o CMakeFiles/Homework_2.dir/beast.cpp.s

CMakeFiles/Homework_2.dir/bird.cpp.o: CMakeFiles/Homework_2.dir/flags.make
CMakeFiles/Homework_2.dir/bird.cpp.o: ../bird.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/anna/CLionProjects/ABC/Homework_2/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_5) "Building CXX object CMakeFiles/Homework_2.dir/bird.cpp.o"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/Homework_2.dir/bird.cpp.o -c /home/anna/CLionProjects/ABC/Homework_2/bird.cpp

CMakeFiles/Homework_2.dir/bird.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/Homework_2.dir/bird.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/anna/CLionProjects/ABC/Homework_2/bird.cpp > CMakeFiles/Homework_2.dir/bird.cpp.i

CMakeFiles/Homework_2.dir/bird.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/Homework_2.dir/bird.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/anna/CLionProjects/ABC/Homework_2/bird.cpp -o CMakeFiles/Homework_2.dir/bird.cpp.s

CMakeFiles/Homework_2.dir/container.cpp.o: CMakeFiles/Homework_2.dir/flags.make
CMakeFiles/Homework_2.dir/container.cpp.o: ../container.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/anna/CLionProjects/ABC/Homework_2/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_6) "Building CXX object CMakeFiles/Homework_2.dir/container.cpp.o"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/Homework_2.dir/container.cpp.o -c /home/anna/CLionProjects/ABC/Homework_2/container.cpp

CMakeFiles/Homework_2.dir/container.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/Homework_2.dir/container.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/anna/CLionProjects/ABC/Homework_2/container.cpp > CMakeFiles/Homework_2.dir/container.cpp.i

CMakeFiles/Homework_2.dir/container.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/Homework_2.dir/container.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/anna/CLionProjects/ABC/Homework_2/container.cpp -o CMakeFiles/Homework_2.dir/container.cpp.s

# Object files for target Homework_2
Homework_2_OBJECTS = \
"CMakeFiles/Homework_2.dir/main.cpp.o" \
"CMakeFiles/Homework_2.dir/animals.cpp.o" \
"CMakeFiles/Homework_2.dir/fish.cpp.o" \
"CMakeFiles/Homework_2.dir/beast.cpp.o" \
"CMakeFiles/Homework_2.dir/bird.cpp.o" \
"CMakeFiles/Homework_2.dir/container.cpp.o"

# External object files for target Homework_2
Homework_2_EXTERNAL_OBJECTS =

Homework_2: CMakeFiles/Homework_2.dir/main.cpp.o
Homework_2: CMakeFiles/Homework_2.dir/animals.cpp.o
Homework_2: CMakeFiles/Homework_2.dir/fish.cpp.o
Homework_2: CMakeFiles/Homework_2.dir/beast.cpp.o
Homework_2: CMakeFiles/Homework_2.dir/bird.cpp.o
Homework_2: CMakeFiles/Homework_2.dir/container.cpp.o
Homework_2: CMakeFiles/Homework_2.dir/build.make
Homework_2: CMakeFiles/Homework_2.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/anna/CLionProjects/ABC/Homework_2/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_7) "Linking CXX executable Homework_2"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/Homework_2.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/Homework_2.dir/build: Homework_2
.PHONY : CMakeFiles/Homework_2.dir/build

CMakeFiles/Homework_2.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/Homework_2.dir/cmake_clean.cmake
.PHONY : CMakeFiles/Homework_2.dir/clean

CMakeFiles/Homework_2.dir/depend:
	cd /home/anna/CLionProjects/ABC/Homework_2/cmake-build-debug && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/anna/CLionProjects/ABC/Homework_2 /home/anna/CLionProjects/ABC/Homework_2 /home/anna/CLionProjects/ABC/Homework_2/cmake-build-debug /home/anna/CLionProjects/ABC/Homework_2/cmake-build-debug /home/anna/CLionProjects/ABC/Homework_2/cmake-build-debug/CMakeFiles/Homework_2.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/Homework_2.dir/depend
