//
//  DescriptionViewController.m
//  hw3
//
//  Created by Gayeon Park on 3/9/20.
//  Copyright © 2020 Gayeon Park. All rights reserved.
//

#import "DescriptionViewController.h"

@interface DescriptionViewController ()

@end

@implementation DescriptionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    _thirdViewInfo.text = @"The 'CG Graphics' page displays an orange cat created from CG Graphic Commands. It includes straight lines, arcs (curves), and gradients.";
    
    
    _fourthViewInfo.text = @"The 'Paddle Game' page displays a single paddle game coded in CG Animation. A star is launched from a random position from right beneath the bricks. It moves down at a random angle, bouncing off of a wall it hits. When the star bounces off the paddle or hits the brick, the user earns a point. Once the star hits the brick, the brick disappears. To move the paddle left or right, hit the left or right arrow button every time. If the star hits the bottom of the play screen, the current star disappears and a new star is launched at a random location right under where the bricks are (or were) located. The game goes on until the user hits the 'back' button. The score starts at 0 and the current score is saved once the game starts.";

    
    _aboutMe.text = @"Hi! I am a junior at New York University, majoring in Computer Science and minoring in Mathematics and Web Programming & Applications.";
    
    _aboutMe2.text = @"For this semester, I am taking Web Development, Operating Systems, iOS Programming, and Group Lesson for Guitar.";
    
    _aboutMe3.text = @"In my free time, I like to cook/bake, play piano, or spend time with my family and friends.";

    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
