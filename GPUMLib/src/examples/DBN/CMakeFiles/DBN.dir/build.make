# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 2.8

#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:

# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list

# Suppress display of executed commands.
$(VERBOSE).SILENT:

# A target that is always out of date.
cmake_force:
.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The program to use to edit the cache.
CMAKE_EDIT_COMMAND = /usr/bin/ccmake

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/elchaschab/devel/TankWar/GPUMLib

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/elchaschab/devel/TankWar/GPUMLib

# Include any dependencies generated for this target.
include src/examples/DBN/CMakeFiles/DBN.dir/depend.make

# Include the progress variables for this target.
include src/examples/DBN/CMakeFiles/DBN.dir/progress.make

# Include the compile flags for this target's objects.
include src/examples/DBN/CMakeFiles/DBN.dir/flags.make

src/examples/DBN/CMakeFiles/DBN.dir/DBNapp.cpp.o: src/examples/DBN/CMakeFiles/DBN.dir/flags.make
src/examples/DBN/CMakeFiles/DBN.dir/DBNapp.cpp.o: src/examples/DBN/DBNapp.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /home/elchaschab/devel/TankWar/GPUMLib/CMakeFiles $(CMAKE_PROGRESS_1)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object src/examples/DBN/CMakeFiles/DBN.dir/DBNapp.cpp.o"
	cd /home/elchaschab/devel/TankWar/GPUMLib/src/examples/DBN && /usr/bin/g++-4.6   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/DBN.dir/DBNapp.cpp.o -c /home/elchaschab/devel/TankWar/GPUMLib/src/examples/DBN/DBNapp.cpp

src/examples/DBN/CMakeFiles/DBN.dir/DBNapp.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/DBN.dir/DBNapp.cpp.i"
	cd /home/elchaschab/devel/TankWar/GPUMLib/src/examples/DBN && /usr/bin/g++-4.6  $(CXX_DEFINES) $(CXX_FLAGS) -E /home/elchaschab/devel/TankWar/GPUMLib/src/examples/DBN/DBNapp.cpp > CMakeFiles/DBN.dir/DBNapp.cpp.i

src/examples/DBN/CMakeFiles/DBN.dir/DBNapp.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/DBN.dir/DBNapp.cpp.s"
	cd /home/elchaschab/devel/TankWar/GPUMLib/src/examples/DBN && /usr/bin/g++-4.6  $(CXX_DEFINES) $(CXX_FLAGS) -S /home/elchaschab/devel/TankWar/GPUMLib/src/examples/DBN/DBNapp.cpp -o CMakeFiles/DBN.dir/DBNapp.cpp.s

src/examples/DBN/CMakeFiles/DBN.dir/DBNapp.cpp.o.requires:
.PHONY : src/examples/DBN/CMakeFiles/DBN.dir/DBNapp.cpp.o.requires

src/examples/DBN/CMakeFiles/DBN.dir/DBNapp.cpp.o.provides: src/examples/DBN/CMakeFiles/DBN.dir/DBNapp.cpp.o.requires
	$(MAKE) -f src/examples/DBN/CMakeFiles/DBN.dir/build.make src/examples/DBN/CMakeFiles/DBN.dir/DBNapp.cpp.o.provides.build
.PHONY : src/examples/DBN/CMakeFiles/DBN.dir/DBNapp.cpp.o.provides

src/examples/DBN/CMakeFiles/DBN.dir/DBNapp.cpp.o.provides.build: src/examples/DBN/CMakeFiles/DBN.dir/DBNapp.cpp.o

# Object files for target DBN
DBN_OBJECTS = \
"CMakeFiles/DBN.dir/DBNapp.cpp.o"

# External object files for target DBN
DBN_EXTERNAL_OBJECTS =

src/examples/DBN/DBN: src/examples/DBN/CMakeFiles/DBN.dir/DBNapp.cpp.o
src/examples/DBN/DBN: src/examples/DBN/CMakeFiles/DBN.dir/build.make
src/examples/DBN/DBN: /usr/local/cuda/lib64/libcudart.so
src/examples/DBN/DBN: src/libGPUMLibDBN.a
src/examples/DBN/DBN: /usr/local/cuda/lib64/libcurand.so
src/examples/DBN/DBN: src/libGPUMLibUtils.a
src/examples/DBN/DBN: /usr/local/cuda/lib64/libcudart.so
src/examples/DBN/DBN: src/examples/DBN/CMakeFiles/DBN.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --red --bold "Linking CXX executable DBN"
	cd /home/elchaschab/devel/TankWar/GPUMLib/src/examples/DBN && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/DBN.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
src/examples/DBN/CMakeFiles/DBN.dir/build: src/examples/DBN/DBN
.PHONY : src/examples/DBN/CMakeFiles/DBN.dir/build

# Object files for target DBN
DBN_OBJECTS = \
"CMakeFiles/DBN.dir/DBNapp.cpp.o"

# External object files for target DBN
DBN_EXTERNAL_OBJECTS =

src/examples/DBN/CMakeFiles/CMakeRelink.dir/DBN: src/examples/DBN/CMakeFiles/DBN.dir/DBNapp.cpp.o
src/examples/DBN/CMakeFiles/CMakeRelink.dir/DBN: src/examples/DBN/CMakeFiles/DBN.dir/build.make
src/examples/DBN/CMakeFiles/CMakeRelink.dir/DBN: /usr/local/cuda/lib64/libcudart.so
src/examples/DBN/CMakeFiles/CMakeRelink.dir/DBN: src/libGPUMLibDBN.a
src/examples/DBN/CMakeFiles/CMakeRelink.dir/DBN: /usr/local/cuda/lib64/libcurand.so
src/examples/DBN/CMakeFiles/CMakeRelink.dir/DBN: src/libGPUMLibUtils.a
src/examples/DBN/CMakeFiles/CMakeRelink.dir/DBN: /usr/local/cuda/lib64/libcudart.so
src/examples/DBN/CMakeFiles/CMakeRelink.dir/DBN: src/examples/DBN/CMakeFiles/DBN.dir/relink.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --red --bold "Linking CXX executable CMakeFiles/CMakeRelink.dir/DBN"
	cd /home/elchaschab/devel/TankWar/GPUMLib/src/examples/DBN && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/DBN.dir/relink.txt --verbose=$(VERBOSE)

# Rule to relink during preinstall.
src/examples/DBN/CMakeFiles/DBN.dir/preinstall: src/examples/DBN/CMakeFiles/CMakeRelink.dir/DBN
.PHONY : src/examples/DBN/CMakeFiles/DBN.dir/preinstall

src/examples/DBN/CMakeFiles/DBN.dir/requires: src/examples/DBN/CMakeFiles/DBN.dir/DBNapp.cpp.o.requires
.PHONY : src/examples/DBN/CMakeFiles/DBN.dir/requires

src/examples/DBN/CMakeFiles/DBN.dir/clean:
	cd /home/elchaschab/devel/TankWar/GPUMLib/src/examples/DBN && $(CMAKE_COMMAND) -P CMakeFiles/DBN.dir/cmake_clean.cmake
.PHONY : src/examples/DBN/CMakeFiles/DBN.dir/clean

src/examples/DBN/CMakeFiles/DBN.dir/depend:
	cd /home/elchaschab/devel/TankWar/GPUMLib && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/elchaschab/devel/TankWar/GPUMLib /home/elchaschab/devel/TankWar/GPUMLib/src/examples/DBN /home/elchaschab/devel/TankWar/GPUMLib /home/elchaschab/devel/TankWar/GPUMLib/src/examples/DBN /home/elchaschab/devel/TankWar/GPUMLib/src/examples/DBN/CMakeFiles/DBN.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : src/examples/DBN/CMakeFiles/DBN.dir/depend
