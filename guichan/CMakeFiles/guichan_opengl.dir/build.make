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
CMAKE_SOURCE_DIR = /home/elchaschab/devel/Neurocid/guichan

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/elchaschab/devel/Neurocid/guichan

# Include any dependencies generated for this target.
include CMakeFiles/guichan_opengl.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/guichan_opengl.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/guichan_opengl.dir/flags.make

CMakeFiles/guichan_opengl.dir/src/opengl/openglimage.o: CMakeFiles/guichan_opengl.dir/flags.make
CMakeFiles/guichan_opengl.dir/src/opengl/openglimage.o: src/opengl/openglimage.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /home/elchaschab/devel/Neurocid/guichan/CMakeFiles $(CMAKE_PROGRESS_1)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object CMakeFiles/guichan_opengl.dir/src/opengl/openglimage.o"
	/usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/guichan_opengl.dir/src/opengl/openglimage.o -c /home/elchaschab/devel/Neurocid/guichan/src/opengl/openglimage.cpp

CMakeFiles/guichan_opengl.dir/src/opengl/openglimage.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/guichan_opengl.dir/src/opengl/openglimage.i"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /home/elchaschab/devel/Neurocid/guichan/src/opengl/openglimage.cpp > CMakeFiles/guichan_opengl.dir/src/opengl/openglimage.i

CMakeFiles/guichan_opengl.dir/src/opengl/openglimage.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/guichan_opengl.dir/src/opengl/openglimage.s"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /home/elchaschab/devel/Neurocid/guichan/src/opengl/openglimage.cpp -o CMakeFiles/guichan_opengl.dir/src/opengl/openglimage.s

CMakeFiles/guichan_opengl.dir/src/opengl/openglimage.o.requires:
.PHONY : CMakeFiles/guichan_opengl.dir/src/opengl/openglimage.o.requires

CMakeFiles/guichan_opengl.dir/src/opengl/openglimage.o.provides: CMakeFiles/guichan_opengl.dir/src/opengl/openglimage.o.requires
	$(MAKE) -f CMakeFiles/guichan_opengl.dir/build.make CMakeFiles/guichan_opengl.dir/src/opengl/openglimage.o.provides.build
.PHONY : CMakeFiles/guichan_opengl.dir/src/opengl/openglimage.o.provides

CMakeFiles/guichan_opengl.dir/src/opengl/openglimage.o.provides.build: CMakeFiles/guichan_opengl.dir/src/opengl/openglimage.o

CMakeFiles/guichan_opengl.dir/src/opengl/opengl.o: CMakeFiles/guichan_opengl.dir/flags.make
CMakeFiles/guichan_opengl.dir/src/opengl/opengl.o: src/opengl/opengl.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /home/elchaschab/devel/Neurocid/guichan/CMakeFiles $(CMAKE_PROGRESS_2)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object CMakeFiles/guichan_opengl.dir/src/opengl/opengl.o"
	/usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/guichan_opengl.dir/src/opengl/opengl.o -c /home/elchaschab/devel/Neurocid/guichan/src/opengl/opengl.cpp

CMakeFiles/guichan_opengl.dir/src/opengl/opengl.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/guichan_opengl.dir/src/opengl/opengl.i"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /home/elchaschab/devel/Neurocid/guichan/src/opengl/opengl.cpp > CMakeFiles/guichan_opengl.dir/src/opengl/opengl.i

CMakeFiles/guichan_opengl.dir/src/opengl/opengl.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/guichan_opengl.dir/src/opengl/opengl.s"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /home/elchaschab/devel/Neurocid/guichan/src/opengl/opengl.cpp -o CMakeFiles/guichan_opengl.dir/src/opengl/opengl.s

CMakeFiles/guichan_opengl.dir/src/opengl/opengl.o.requires:
.PHONY : CMakeFiles/guichan_opengl.dir/src/opengl/opengl.o.requires

CMakeFiles/guichan_opengl.dir/src/opengl/opengl.o.provides: CMakeFiles/guichan_opengl.dir/src/opengl/opengl.o.requires
	$(MAKE) -f CMakeFiles/guichan_opengl.dir/build.make CMakeFiles/guichan_opengl.dir/src/opengl/opengl.o.provides.build
.PHONY : CMakeFiles/guichan_opengl.dir/src/opengl/opengl.o.provides

CMakeFiles/guichan_opengl.dir/src/opengl/opengl.o.provides.build: CMakeFiles/guichan_opengl.dir/src/opengl/opengl.o

CMakeFiles/guichan_opengl.dir/src/opengl/openglgraphics.o: CMakeFiles/guichan_opengl.dir/flags.make
CMakeFiles/guichan_opengl.dir/src/opengl/openglgraphics.o: src/opengl/openglgraphics.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /home/elchaschab/devel/Neurocid/guichan/CMakeFiles $(CMAKE_PROGRESS_3)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object CMakeFiles/guichan_opengl.dir/src/opengl/openglgraphics.o"
	/usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/guichan_opengl.dir/src/opengl/openglgraphics.o -c /home/elchaschab/devel/Neurocid/guichan/src/opengl/openglgraphics.cpp

CMakeFiles/guichan_opengl.dir/src/opengl/openglgraphics.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/guichan_opengl.dir/src/opengl/openglgraphics.i"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /home/elchaschab/devel/Neurocid/guichan/src/opengl/openglgraphics.cpp > CMakeFiles/guichan_opengl.dir/src/opengl/openglgraphics.i

CMakeFiles/guichan_opengl.dir/src/opengl/openglgraphics.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/guichan_opengl.dir/src/opengl/openglgraphics.s"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /home/elchaschab/devel/Neurocid/guichan/src/opengl/openglgraphics.cpp -o CMakeFiles/guichan_opengl.dir/src/opengl/openglgraphics.s

CMakeFiles/guichan_opengl.dir/src/opengl/openglgraphics.o.requires:
.PHONY : CMakeFiles/guichan_opengl.dir/src/opengl/openglgraphics.o.requires

CMakeFiles/guichan_opengl.dir/src/opengl/openglgraphics.o.provides: CMakeFiles/guichan_opengl.dir/src/opengl/openglgraphics.o.requires
	$(MAKE) -f CMakeFiles/guichan_opengl.dir/build.make CMakeFiles/guichan_opengl.dir/src/opengl/openglgraphics.o.provides.build
.PHONY : CMakeFiles/guichan_opengl.dir/src/opengl/openglgraphics.o.provides

CMakeFiles/guichan_opengl.dir/src/opengl/openglgraphics.o.provides.build: CMakeFiles/guichan_opengl.dir/src/opengl/openglgraphics.o

# Object files for target guichan_opengl
guichan_opengl_OBJECTS = \
"CMakeFiles/guichan_opengl.dir/src/opengl/openglimage.o" \
"CMakeFiles/guichan_opengl.dir/src/opengl/opengl.o" \
"CMakeFiles/guichan_opengl.dir/src/opengl/openglgraphics.o"

# External object files for target guichan_opengl
guichan_opengl_EXTERNAL_OBJECTS =

libguichan_opengl.so.0.9.0: CMakeFiles/guichan_opengl.dir/src/opengl/openglimage.o
libguichan_opengl.so.0.9.0: CMakeFiles/guichan_opengl.dir/src/opengl/opengl.o
libguichan_opengl.so.0.9.0: CMakeFiles/guichan_opengl.dir/src/opengl/openglgraphics.o
libguichan_opengl.so.0.9.0: CMakeFiles/guichan_opengl.dir/build.make
libguichan_opengl.so.0.9.0: CMakeFiles/guichan_opengl.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --red --bold "Linking CXX shared library libguichan_opengl.so"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/guichan_opengl.dir/link.txt --verbose=$(VERBOSE)
	$(CMAKE_COMMAND) -E cmake_symlink_library libguichan_opengl.so.0.9.0 libguichan_opengl.so.0.9.0 libguichan_opengl.so

libguichan_opengl.so: libguichan_opengl.so.0.9.0

# Rule to build all files generated by this target.
CMakeFiles/guichan_opengl.dir/build: libguichan_opengl.so
.PHONY : CMakeFiles/guichan_opengl.dir/build

CMakeFiles/guichan_opengl.dir/requires: CMakeFiles/guichan_opengl.dir/src/opengl/openglimage.o.requires
CMakeFiles/guichan_opengl.dir/requires: CMakeFiles/guichan_opengl.dir/src/opengl/opengl.o.requires
CMakeFiles/guichan_opengl.dir/requires: CMakeFiles/guichan_opengl.dir/src/opengl/openglgraphics.o.requires
.PHONY : CMakeFiles/guichan_opengl.dir/requires

CMakeFiles/guichan_opengl.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/guichan_opengl.dir/cmake_clean.cmake
.PHONY : CMakeFiles/guichan_opengl.dir/clean

CMakeFiles/guichan_opengl.dir/depend:
	cd /home/elchaschab/devel/Neurocid/guichan && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/elchaschab/devel/Neurocid/guichan /home/elchaschab/devel/Neurocid/guichan /home/elchaschab/devel/Neurocid/guichan /home/elchaschab/devel/Neurocid/guichan /home/elchaschab/devel/Neurocid/guichan/CMakeFiles/guichan_opengl.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/guichan_opengl.dir/depend
