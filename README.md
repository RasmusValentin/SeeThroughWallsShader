# See Through Walls Shader
## _Computer Graphics Programming Hand-In - Rasmus Valentin Jacobsen_


This is my (Rasmus Valentin Jacobsen) CGP Shader hand-in. It is a See-Through-Walls stencil shader combined with a Diffuse Reflection shader.

## Features

- An outline shader that automatically updates based on player visibility
- A diffuse reflection shader

## Installation

Built with Unity Editor version 2021.3.9f1

 - Clone Git repo or download manually
 - Open the Assets/Scenes/CGP Miniproject.unity file (Requires Unity version 2021.3 or higher)

If object materials are not assigned, then the following materials go to these objects:
 - Outline material goes on the Player/Outline object.
 - Wall material goes on the World/Wall object, as well as the World/Boundary walls/FrontWall1 and Frontwall2 objects.
 - Back Wall material goes on the World/Boundary walls/BackWall1 and BackWall2 objects.
 - Floor material goes on the World/Floor object.

## Usage

**Properties**
 - Back Wall / Wall materials = Diffuse Material Color
 - Outline material = Thickness (Recommended 5, although is automated by the Raycaster script)

**Controls**
 - The player character is controlled with the WASD / Arrow keys.

## Inspiration
| Source | Link |
| ------ | ------ |
| Daniel Santalla - See Through Walls Shader | [https://www.youtube.com/watch?v=0rEF8A3wF9U] |
| Cg Programming/Unity/Outlining Objects Wikibook | [https://en.wikibooks.org/wiki/Cg_Programming/Unity/Outlining_Objects] |
| Cg Programming/Unity/Diffuse Reflection Wikibook | [https://en.wikibooks.org/wiki/Cg_Programming/Unity/Diffuse_Reflection] |

