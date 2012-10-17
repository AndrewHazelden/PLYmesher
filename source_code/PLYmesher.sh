#!/bin/bash

# PLYmesher reconstructs a PLY point cloud file into a mesh
# The script uses a Meshlabserver filter script

# by Andrew Hazelden  andrewhazelden@gmail.com

echo "PLYmesher is reconstructing a mesh"

# Run meshlabserver with our reconstruction script
meshlabserver -i ./option-0000.ply -o ./meshed.ply -s scripts/PLYmesher_script.mlx -om vc vn