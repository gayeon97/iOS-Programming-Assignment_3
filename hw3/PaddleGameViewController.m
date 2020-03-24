//
//  PaddleGameViewController.m
//  hw3
//
//  Created by Gayeon Park on 3/9/20.
//  Copyright © 2020 Gayeon Park. All rights reserved.
//

#import "PaddleGameViewController.h"
#import <QuartzCore/QuartzCore.h>
#include <stdlib.h>
#import <Foundation/Foundation.h>


@interface PaddleGameViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *star;
@property (weak, nonatomic) IBOutlet UIView *gameView;


@property (weak, nonatomic) IBOutlet UIImageView *paddle;

@property (weak, nonatomic) IBOutlet UINavigationItem *navBar;

@property Boolean isBackButtonPressed;


@property float random;

@property int currentScore;

@property Boolean justStarted;

//@property int savedScore;

@property Boolean scoreChanged;

@property (weak, nonatomic) IBOutlet UIImageView *brick1;
@property (weak, nonatomic) IBOutlet UIImageView *brick2;
@property (weak, nonatomic) IBOutlet UIImageView *brick3;
@property (weak, nonatomic) IBOutlet UIImageView *brick4;
@property (weak, nonatomic) IBOutlet UIImageView *brick5;
@property (weak, nonatomic) IBOutlet UIImageView *brick6;
@property (weak, nonatomic) IBOutlet UIImageView *brick7;
@property (weak, nonatomic) IBOutlet UIImageView *brick8;
@property (weak, nonatomic) IBOutlet UIImageView *brick9;
@end

@implementation PaddleGameViewController

//click on the 'Back' button of the UINavigationItem navBar
-(void)back:(UIBarButtonItem *)sender
{
    [self.navigationController popToRootViewControllerAnimated:YES];
    
    //stop Timer
    if(_timer)
    {
        [_timer invalidate];
         _timer = nil;
    }
    
}



- (void)loadView {
    [ super loadView ];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    //detect the back button of the UINavigationItem navBar
    UIBarButtonItem *newBackButton = [[UIBarButtonItem alloc] initWithTitle:@"Back" style:UIBarButtonItemStylePlain target:self action:@selector(back:)];
    _navBar.leftBarButtonItem=newBackButton;
    
    
    //did just start the view?
    _justStarted = YES;
    
    //determine brick visibility
    _brick9.hidden = [[NSUserDefaults standardUserDefaults] boolForKey:@"block9"];
    _brick8.hidden = [[NSUserDefaults standardUserDefaults] boolForKey:@"block8"];
    _brick7.hidden = [[NSUserDefaults standardUserDefaults] boolForKey:@"block7"];
    _brick6.hidden = [[NSUserDefaults standardUserDefaults] boolForKey:@"block6"];
    _brick5.hidden = [[NSUserDefaults standardUserDefaults] boolForKey:@"block5"];
    _brick4.hidden = [[NSUserDefaults standardUserDefaults] boolForKey:@"block4"];
    _brick3.hidden = [[NSUserDefaults standardUserDefaults] boolForKey:@"block3"];
    _brick2.hidden = [[NSUserDefaults standardUserDefaults] boolForKey:@"block2"];
    _brick1.hidden = [[NSUserDefaults standardUserDefaults] boolForKey:@"block1"];
    
    //create scoreboard
    _scoreboard.text = @"Score:";
    [_scoreboard setFont:[UIFont boldSystemFontOfSize:25]];
    
    //setting score
    _savedScore = [[NSUserDefaults standardUserDefaults] integerForKey:@"HighScore"];
    //the player has been playing & scored
    if (_savedScore != 0) {
        _score.text = [NSString stringWithFormat:@"%li", (long)_savedScore];
        _currentScore = (int) _savedScore;
    }
    //the player either just started playing or score is still 0
    else {
        _score.text = @"0";
        _currentScore = 0;
    }
    [_score setFont:[UIFont boldSystemFontOfSize:25]];
    
    
   //SETTING UP STAR IMAGE
    _directionImage1 = CGPointMake(-1.0, -1.0);
    //find a random x coordinate to start from the top
    _random = arc4random_uniform(self.gameView.frame.size.width);
    if (_brick1.hidden == YES && _brick2.hidden == YES && _brick3.hidden == YES && _brick4.hidden == YES && _brick5.hidden == YES && _brick6.hidden == YES && _brick7.hidden == YES && _brick8.hidden == YES && _brick9.hidden == YES) {
        _star.layer.position = CGPointMake(_random, 70);
    } else if (_brick4.hidden == YES && _brick5.hidden == YES && _brick6.hidden == YES && _brick7.hidden == YES && _brick8.hidden == YES && _brick9.hidden == YES) {
        _star.layer.position = CGPointMake(_random, 80);
    } else if (_brick7.hidden == YES && _brick8.hidden == YES && _brick9.hidden == YES) {
        _star.layer.position = CGPointMake(_random, 150);
    } else {
         _star.layer.position = CGPointMake(_random, 220);
    }
    [ self.gameView.layer addSublayer: _star.layer ];
        
    
    //SETTING UP PADDLE IMAGE
    _directionImage2 = CGPointMake(-1.0, -1.0);
    _paddle.layer.position = CGPointMake(210 , 610);
    [ self.gameView.layer addSublayer: _paddle.layer ];
    
    
    ////////// #6  SETUP TIMER
    _timer = [ NSTimer scheduledTimerWithTimeInterval: 0.01 target: self selector: @selector(handleTimer:) userInfo: nil repeats: YES];
}


/////////////////  #7   HANDLE TIMER
- (void) handleTimer: (NSTimer *) timer {
    CGPoint origin;
    
    //starting for the first time
    if (_justStarted) {
        //make sure the star travel down
         _directionImage1.y = 1.0;
        _justStarted = NO;
    }
    
    _random = arc4random_uniform(self.gameView.frame.size.width);
    
    //check if the star hit the left side of the View
    if (_star.layer.position.x <=
        ( (68 / 2) + 1) - self.gameView.frame.origin.x)
        _directionImage1.x = 1.0;

    //check if the star hit the right side of the Vie
    if (_star.layer.position.x + (68.0 / 2) + 1 >=
        (self.gameView.frame.size.width - self.gameView.frame.origin.x) - 1)
        _directionImage1.x = -1.0;

    //check if the star hit the top of the view
    if (_star.layer.position.y <= (70.0 / 2) )
        _directionImage1.y = 1.0;
        
    
    /////////////////////////////// ROW 3 FROM TOP
    //check if the star hit brick 9
    if (CGRectIntersectsRect(_star.layer.frame, _brick9.layer.frame)) {
        
        if (_brick9.hidden == NO) {
            _brick9.hidden = YES;
            
            _directionImage1.y = 1.0;
            //increment the score by 1
            _currentScore += 1;
            _score.text = [NSString stringWithFormat:@"%i", _currentScore];
            
            _scoreChanged = YES;
            
            //set boolean to YES for later visibility
            [[NSUserDefaults standardUserDefaults] setBool: YES forKey:@"block9"];
        }
    }
       
    //check if the star hit brick 8
    if (CGRectIntersectsRect(_star.layer.frame, _brick8.layer.frame)) {
        
        if (_brick8.hidden == NO) {
            _brick8.hidden = YES;
            
            _directionImage1.y = 1.0;
            //increment the score by 1
            _currentScore += 1;
            _score.text = [NSString stringWithFormat:@"%i", _currentScore];
            
            _scoreChanged = YES;
            
            //set boolean to YES for later visibility
            [[NSUserDefaults standardUserDefaults] setBool: YES forKey:@"block8"];
        }
              
    }
       
    //check if the star hit brick 7
    if (CGRectIntersectsRect(_star.layer.frame, _brick7.layer.frame)) {
        if (_brick7.hidden == NO) {
            _brick7.hidden = YES;
            
            _directionImage1.y = 1.0;
            //increment the score by 1
            _currentScore += 1;
            _score.text = [NSString stringWithFormat:@"%i", _currentScore];
            
            _scoreChanged = YES;
            
            //set boolean to YES for later visibility
            [[NSUserDefaults standardUserDefaults] setBool: YES forKey:@"block7"];
        }
    }
    ///////////////////////////////////////
       
    /////////////////////////////// ROW 2 FROM TOP
    //check if the star hit brick 6
    if (CGRectIntersectsRect(_star.layer.frame, _brick6.layer.frame)) {
        if (_brick6.hidden == NO) {
            _brick6.hidden = YES;
            
            _directionImage1.y = 1.0;
            //increment the score by 1
            _currentScore += 1;
            _score.text = [NSString stringWithFormat:@"%i", _currentScore];
            
            _scoreChanged = YES;
            
            //set boolean to YES for later visibility
            [[NSUserDefaults standardUserDefaults] setBool: YES forKey:@"block6"];
        }
    }
       
    //check if the star hit brick 5
    if (CGRectIntersectsRect(_star.layer.frame, _brick5.layer.frame)) {
        if (_brick5.hidden == NO) {
            _brick5.hidden = YES;
            
            _directionImage1.y = 1.0;
            //increment the score by 1
            _currentScore += 1;
            _score.text = [NSString stringWithFormat:@"%i", _currentScore];
            
            _scoreChanged = YES;
            
            //set boolean to YES for later visibility
            [[NSUserDefaults standardUserDefaults] setBool: YES forKey:@"block5"];
        }
              
    }
       
    //check if the star hit brick 4
    if (CGRectIntersectsRect(_star.layer.frame, _brick4.layer.frame)) {
        if (_brick4.hidden == NO) {
            _brick4.hidden = YES;
            
            _directionImage1.y = 1.0;
            //increment the score by 1
            _currentScore += 1;
            _score.text = [NSString stringWithFormat:@"%i", _currentScore];
            
            _scoreChanged = YES;
            
            //set boolean to YES for later visibility
            [[NSUserDefaults standardUserDefaults] setBool: YES forKey:@"block4"];
        }
    }
    ///////////////////////////////////////
       
    /////////////////////////////// ROW 1 FROM TOP
    //check if it hit brick 3
    if (CGRectIntersectsRect(_star.layer.frame, _brick3.layer.frame)) {
        if (_brick3.hidden == NO) {
            _brick3.hidden = YES;
            
            _directionImage1.y = 1.0;
            //increment the score by 1
            _currentScore += 1;
            _score.text = [NSString stringWithFormat:@"%i", _currentScore];
            
            _scoreChanged = YES;
            
            //set boolean to YES for later visibility
            [[NSUserDefaults standardUserDefaults] setBool: YES forKey:@"block3"];
        }
    }
       
    //check if it hit brick 2
    if (CGRectIntersectsRect(_star.layer.frame, _brick2.layer.frame)) {
        if (_brick2.hidden == NO) {
            _brick2.hidden = YES;
            
            _directionImage1.y = 1.0;
            //increment the score by 1
            _currentScore += 1;
            _score.text = [NSString stringWithFormat:@"%i", _currentScore];
            
            _scoreChanged = YES;
            
            //set boolean to YES for later visibility
            [[NSUserDefaults standardUserDefaults] setBool: YES forKey:@"block2"];
        }
    }
       
    //check if it hit brick 1
    if (CGRectIntersectsRect(_star.layer.frame, _brick1.layer.frame)) {
        if (_brick1.hidden == NO) {
            _brick1.hidden = YES;
            
            _directionImage1.y = 1.0;
            //increment the score by 1
            _currentScore += 1;
            _score.text = [NSString stringWithFormat:@"%i", _currentScore];
            
            _scoreChanged = YES;
            
            //set boolean to YES for later visibility
            [[NSUserDefaults standardUserDefaults] setBool: YES forKey:@"block1"];
        }
    }
    ///////////////////////////////////////
    
    
    //check if the star hits the paddle
    if (_star.layer.position.y + (70.0 / 2) + 1 == (595)) {
        //the star hits the paddle
        if (CGRectIntersectsRect(_star.layer.frame, _paddle.layer.frame)) {

            //_directionImage1.x = 1.0;
            _directionImage1.y = -1.0;
                
            //increment the score by 1
            _currentScore += 1;
            _score.text = [NSString stringWithFormat:@"%i", _currentScore];
            
            _scoreChanged = YES;
                
        }
    }
    
    //check if the star hit the bottom of the View
    if (_star.layer.position.y + (70.0 / 2) + 1 >= (630)) {
        
        if (_brick1.hidden == YES && _brick2.hidden == YES && _brick3.hidden == YES && _brick4.hidden == YES && _brick5.hidden == YES && _brick6.hidden == YES && _brick7.hidden == YES && _brick8.hidden == YES && _brick9.hidden == YES) {
            origin = _star.layer.position;
            origin.x = _random;
            origin.y = 70;
            _star.layer.position = origin;
            //_star.layer.position =  CGPointMake(_random, 70);
        } else if (_brick4.hidden == YES && _brick5.hidden == YES && _brick6.hidden == YES && _brick7.hidden == YES && _brick8.hidden == YES && _brick9.hidden == YES) {
            origin = _star.layer.position;
            origin.x = _random;
            origin.y = 80;
            _star.layer.position = origin;
            //_star.layer.position = CGPointMake(_random, 80);
        } else if (_brick7.hidden == YES && _brick8.hidden == YES && _brick9.hidden == YES) {
            origin = _star.layer.position;
            origin.x = _random;
            origin.y = 150;
            _star.layer.position = origin;
            //_star.layer.position = CGPointMake(_random, 150);
        } else {
            origin = _star.layer.position;
            origin.x = _random;
            origin.y = 220;
            _star.layer.position = origin;
            //_star.layer.position = CGPointMake(_random, 220);
        }
    }

    origin = _star.layer.position;
    origin.x += _directionImage1.x;
    origin.y += _directionImage1.y;
    _star.layer.position = origin;
    
    //save score in case you exit the current screen
    if (_scoreChanged == YES) {
        [[NSUserDefaults standardUserDefaults] setInteger:_currentScore forKey:@"HighScore"];
        
        _savedScore = _currentScore;
        
        _scoreChanged = NO;
        
    }

}


- (IBAction)leftButtonClicked:(id)sender {
    int paddleCenterPoint = _paddle.layer.position.x;
    CGPoint position = _paddle.layer.position;

    if (paddleCenterPoint > 56) {
        _directionImage2.x = 1.0;
        //position = _paddle.layer.position;
        position.x -= 25.0;
        _paddle.layer.position = position;
    }
}


-(IBAction)rightButtonClicked:(id)sender {
    int paddleCenterPoint = _paddle.layer.position.x;
    CGPoint position = _paddle.layer.position;

    if (paddleCenterPoint < self.gameView.frame.size.width - 56) {
        _directionImage2.x = 1.0;
        //position = _paddle.layer.position;
        position.x += 25.0;
        _paddle.layer.position = position;
    }
    
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

