//
//  PaddleGameViewController.h
//  hw3
//
//  Created by Gayeon Park on 3/9/20.
//  Copyright © 2020 Gayeon Park. All rights reserved.
//

#import "ViewController.h"
#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface PaddleGameViewController : ViewController

@property CGPoint directionImage1, directionImage2;

@property NSTimer *timer;

@property (weak, nonatomic) IBOutlet UIButton *leftArrow;

@property (weak, nonatomic) IBOutlet UIButton *rightArrow;


@property (weak, nonatomic) IBOutlet UILabel *scoreboard;

@property (weak, nonatomic) IBOutlet UILabel *score;


@property NSUserDefaults *scoreNum;

@property NSInteger savedScore;

- (void) handleTimer: (NSTimer *) timer;

@end

NS_ASSUME_NONNULL_END
