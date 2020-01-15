# Andrew Hazelden's PLYmesher Scripts
Version 1.1 Jan 26, 2013

## About the PLYmesher Script Collection
PLYmesher is a collection of bash scripts and MeshLab .mlx filter scripts that are used to create possion based reconstructions of .PLY formatted point clouds.

## About the Replace MLX Value Script
The script `replace_mlx_value.sh` allows you to replace placeholder values in a Meshlab script with input from the command line. The `replace_mlx_value` script also scans an input "meshes" folder and will process and .ply data in the folder using a user selectable Meshlab script.
 
This script uses sed to replace values in a MLX filter script template. The script searches for the placeholder text COMMAND-VALUE1, COMMAND-VALUE2, and COMMAND-VALUE3 in the mlx template and then outputs a script with the replaced values.

Tip: Enter the script name and values at the command-line:   
`./replace_mlx_value.sh [mlx_script_template] [number] [number] [number]`


## PLYmesher Notes:
I have started exploring the commandline version of meshlab called meshlabserver. You can run scripts by saving the meshlab filter settings to a meshlab .mlx script file.

You can easily develop and save new MLX scripts using the meshlab gui.

The active meshlab filters can be saved in a MLX filter file by selecting the menu item "Filters > Show current filters script".

In this window you can load saved meshlab MLX scripts, edit the settings for each filter, and save mew MLX scripts.

On Mac OS X I noticed that once a GUI based meshlab script finishes running the progress bar in the main window sometimes stays visible at 100% after the task completes. All you have to do is click in the view for the view to refresh.

In the Meshlab GUI you can set the Poisson-disk Sampling filter to resample your dense point cloud to a lower number of points.
 
Included Meshlab Scipts:

`compute_normals_script.mlx`  
This meshlab script will generate point cloud normals

`PLYmesher_script.mlx`  
This meshlab script will generate point cloud normals and then create a polygon mesh from the point cloud.

In the Meshlab GUI you can customize the Poisson-disk Sampling filter settings to resample your dense point cloud to a lower number of points.

`PLYmesher_script_lite.mlx`  
This meshlab script will generate point cloud normals, reduce the point cloud density, and then create a polygon mesh from the point cloud.

The meshlabserver command "Transfer Color: Vertex to Face" seems to have a problem running on the Mac version of meshlabserver so I left out this last step in the script:  
`<filter name="Transfer Color: Vertex to Face" />`


Notes:
You might also find the meshlab related [kinnectproj](http://code.google.com/p/kinnectproj/) webpage interesting.

It appears that meshlabserver only supports saving binary PLY files from the meshlab server command line. You could use a free program like [RPLY](http://w3.impa.br/~diego/software/rply/) to convert the binary PLY file to an ASCII PLY file.  

