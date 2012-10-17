#!/bin/bash

# PLYmesher reconstructs a PLY point cloud file into a mesh
# The script uses a Meshlabserver filter script
# Mac OS X version

# Due to the current Mac OS X meshlab "QT library" linking issues you need to use the hard coded path for the framework directory.

# by Andrew Hazelden  andrewhazelden@gmail.com

echo "PLYmesher is reconstructing a mesh"

#change to the active meshlabserver folder to fix the Mac based QT path issue
cd /Applications/meshlab.app/Contents/Frameworks

# Run meshlabserver with our reconstruction script
/Applications/meshlab.app/Contents/MacOS/meshlabserver -i ~/Desktop/option-0000.ply -o ~/Desktop/meshed.ply -s ~/Desktop/PLYmesher/scripts/PLYmesher_script.mlx -om vc vn