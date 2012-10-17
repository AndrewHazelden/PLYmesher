#!/bin/bash

# PLYmesher Compute Normals Meshlabserver script
# The script uses a Meshlabserver filter script

# by Andrew Hazelden  andrewhazelden@gmail.com

echo "PLYmesher is computing the PLY normals"

# Run meshlabserver with our compute normals script
meshlabserver -i ./option-0000.ply -o ./normals.ply -s scripts/compute_normals_script.mlx -om vc vn