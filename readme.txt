Andrew Hazelden's PLYmesher Scripts
Version 1.0 April 3, 2012

PLYmesher is a collection of bash scripts and MeshLab .mlx filter scripts that are used to create possion based reconstructions of .PLY formatted point clouds.



Notes:
I have started exploring the commandline version of meshlab called meshlabserver. You can run scripts by saving the meshlab filter settings to a meshlab .mlx script file.

You can easily develop and save new MLX scripts using the meshlab gui.

The active meshlab filters can be saved in a MLX filter file by selecting the menu item "Filters > Show current filters script".

In this window you can load saved meshlab MLX scripts, edit the settings for each filter, and save mew MLX scripts.

On Mac OS X I noticed that once a GUI based meshlab script finishes running the progress bar in the main window sometimes stays visible at 100% after the task completes. All you have to do is click in the view for the view to refresh.

In the Meshlab GUI you can set the Poisson-disk Sampling filter to resample your dense point cloud to a lower number of points.
 
Included Meshlab Scipts:

compute_normals_script.mlx
  This meshlab script will generate point cloud normals

PLYmesher_script.mlx
  This meshlab script will generate point cloud normals and then create a polygon mesh from the point cloud.
  
  In the Meshlab GUI you can customize the Poisson-disk Sampling filter settings to resample your dense point cloud to a lower number of points.

PLYmesher_script_lite.mlx
  This meshlab script will generate point cloud normals, reduce the point cloud density, and then create a polygon mesh from the point cloud.
  
	The meshlabserver command "Transfer Color: Vertex to Face" seems to have a problem running on the Mac version of meshlabserver so I left out this last step in the script:

	<filter name="Transfer Color: Vertex to Face" />
 


Notes:
You might also find meshlab related webpage interesting:
http://code.google.com/p/kinnectproj/ 

It appears that meshlabserver only supports saving binary PLY files from the meshlab server command line.

You could use a free program like RPLY to convert the binary PLY file to an ASCII PLY file.

http://w3.impa.br/~diego/software/rply/

