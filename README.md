Assignment 3
===============
**Gayeon Park**
*iOS Programming, Spring 2020*

This assignment has 4 portions: Table View Controller, View Controller, CG Graphics, and CG animation.  We also created a Launch Screen and  an app icon.

The initial/root view is a Table View Controller with three cells that link to the other three View Controllers. Each views include a "back" button that returns the screen to the first view.

The second view is titled "Description" and this screen contains an explanation of the next two screens, along with a couple of sentences introducing myself and a picture of me. 

The third view is titled "CG Graphics" and this screen displays a static CG Graphics image of an orange cat created entirely from CG Graphic commands. It includes straight lines, arcs (curves), and gradients.

The fourth view is titled "Paddle Game" and this screen displays a simple "Breakout" game using a single paddle. It is entirely coded in CG Animation and Objective C.

Description for the Paddle Game:
A star is launched from a random position from right beneath the 3 rows of bricks. It moves down at a random angle, bouncing off of a wall it hits. When the star bounces off the paddle or hits the brick, the user earns a point. Once the star hits the brick, the brick disappears. 
To move the paddle left or right, hit the left or right arrow button every time. If the star hits the bottom of the play screen, the current star disappears and a new star is launched at a random location right under where the 3rd row of bricks are (or were) located. When the game is played for the first time, the score starts at 0 and the score is saved to the bottom of the game console as the game goes on. If a player hits the 'Back' button and leaves the view, the game stops. When the player subsequently returns, the previous score is reinstated.

To execute the program, launch the hw3.xcodeproj file and hit play button once the Xcode opens.  
