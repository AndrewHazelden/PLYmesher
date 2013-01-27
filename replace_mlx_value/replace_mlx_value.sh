#!/bin/bash

##########################
# Replace MLX Values Script
##########################
# Version 1.1 Jan 26, 2013
# by Andrew Hazelden
# email: andrew@andrewhazelden.com
# blog:  http://www.andrewhazelden.com


#####################
# About This Script
#####################
# This script uses sed to replace values in a MLX filter script template.

# The script searches for the placeholder text COMMAND-VALUE1, COMMAND-VALUE2, and 
# COMMAND-VALUE3 in the mlx template and then outputs a script with the replaced values.


# Tip: Enter the script name and values at the command-line:
# eg: ./replace_mlx_value.sh [mlx_script_template] [number] [number] [number]

# Tips:
# To simplify things I recommend adding meshlabserver to your system path
# by editing the file ~/.profile 

# Input meshes are stored in the ./meshes/ folder
# Output meshes are stored in the ./output/ folder

# The base path for the replace_mlx_value.sh script:
#BASE_PATH="~/Desktop/"

# PLY file read and write directories:
MESH_INPUT=meshes
MESH_OUTPUT=output

clear

echo "MLX Values Script V1.1"
echo "Created by Andrew Hazelden"
echo "--------------------------"
echo ""

# Create the output meshes directory if an existing one is not found
if ! [ -d "$MESH_OUTPUT" ]; then
	mkdir "$MESH_OUTPUT"
fi

# Create an input meshes directory if an existing one is not found
if ! [ -d "$MESH_INPUT" ]; then
	echo "Warning: No $MESH_INPUT directory found. Creating a new directory."
	mkdir "$MESH_INPUT"	
fi

#------------------------------------------------------------
# Use sed to replace values in the script_template.mlx file.
#------------------------------------------------------------

if [[ -n "$1" && -n "$2" && -n "$3" ]] ; then
	echo "Found values $1, $2, $3"
	
	#script termplate name
	MLX_TEMPLATE=$1
	
	# Default meshlab mlx script name
	MLX_SCRIPT="script.mlx"
	
	#Set the mlx values from the command line arguments
	MLX_COMMAND1=$2
	MLX_COMMAND2=$3
	MLX_COMMAND3=$4
else
	
	#Set default values for empty arguments
	
	# Default meshlab mlx script name
	MLX_SCRIPT="script.mlx"
	
	# Default mlx script template with placeholder values
	MLX_TEMPLATE="script_template.mlxt" 
	
	#Set the default mlx replacement values
	MLX_COMMAND1=0.354535
	MLX_COMMAND2=0.005437
	MLX_COMMAND3=0.271848
	
	echo "Warning: Required command line arguments not found!"
	echo ""
	echo "Please enter the script name and three values at the command line:"
	echo "sh ./mac-MLX-values.sh [MLX_TEMPLATE] [number] [number] [number]"
	echo ""

	#echo "Sample script values: [0.354535] [0.005437] [0.271848]"
	echo "Using the default script values: [$MLX_TEMPLATE] [$MLX_COMMAND1] [$MLX_COMMAND2] [$MLX_COMMAND3]"
	echo ""
fi

# Create a copy of the mlx script template
cp ./$MLX_TEMPLATE ./$MLX_SCRIPT

# replace value in script
sed -i "" 's/COMMAND-VALUE1/'$MLX_COMMAND1'/g' ./$MLX_SCRIPT

# replace value in script
sed -i "" 's/COMMAND-VALUE2/'$MLX_COMMAND2'/g' ./$MLX_SCRIPT

# replace value in script
sed -i "" 's/COMMAND-VALUE3/'$MLX_COMMAND3'/g' ./$MLX_SCRIPT


#------------------------------------------------------------
# Run meshlabserver from the command line
#------------------------------------------------------------

# example:
# meshlabserver -i ./meshes/option-0000.ply -o ./meshed.ply -s ./script.mlx -om vc vn


# Process the meshes in the Mesh input directory

# Run meshlab on the .ply files in the meshes directory
if [ -d "$MESH_INPUT" ]; then

	#cd "$BASE_PATH/$MESH_INPUT/"
	cd "./$MESH_INPUT/"
	
	echo "Searching for Meshes in the path:"
	echo `pwd`
	echo "---------------------------------"
	echo "---------------------------------"
	echo ""
	
	echo "Processing mesh:"
	
	for model in *.ply; 
		# Due to the current Mac OS X meshlab "QT library" linking issues you need to fix the path
		do 
		echo "Input model: $model"
		echo "Output model: ../$MESH_OUTPUT/$model"
		echo "MLX script: ./$MLX_SCRIPT";
		#echo "MLX script: $BASE_PATH/$MLX_SCRIPT";
		echo ""
		
		echo "Running meshlabserver with the command:"
		echo "meshlabserver -i  $model -o ../$MESH_OUTPUT/out_$model -s ./$MLX_SCRIPT -om vc vn;"
		
		#Run the script through meshlabserver
		meshlabserver -i  $model -o ../$MESH_OUTPUT/out_$model -s ./$MLX_SCRIPT -om vc vn;
		 	
	done
	
fi
