# Description #

This project provides a bilinear filtering shader and a script for using it with a viewport to replace the default window scaling. 

This is mainly useful for pixel art games. The default scaling uses nearest-neighbor, which causes apparent pixel sizing to vary when at resolutions that are not perfect multiplications of the source resolution. By using this shader and updating the pixel_scale uniform, you get well defined pixels at any resolution larger than the source.

# Using it #

This is a Godot 3 project. Refer to the Godot 3 documentation for how to use the editor and launch a project.

The default scene shows a test image and demonstrates the shader working with window scaling. To use it in a project, you would only have to replace the TextureRect under the Viewport with your main scene, and set the source resolution for the script.
