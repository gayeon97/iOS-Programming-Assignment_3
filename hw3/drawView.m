//
//  drawView.m
//  hw3
//
//  Created by Gayeon Park on 3/17/20.
//  Copyright © 2020 Gayeon Park. All rights reserved.
//

#import "drawView.h"

@implementation drawView

- (id)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        // Initialization code
    }
    return self;
}

/////  # 9b  drawRect
- (void)drawRect:(CGRect)rect {
    
    [super drawRect:rect];
    //defined the Graphic Context
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    //////////////////////
    //drew left cat ear
    CGContextBeginPath(ctx);
    CGContextMoveToPoint(ctx, 150.0, 180.0);
    CGContextAddLineToPoint(ctx, 70.0f, 100.0f);
    CGContextAddLineToPoint(ctx,70.0f,250.0f);
    CGContextSetFillColorWithColor(ctx, [[UIColor orangeColor] CGColor]);
    CGContextFillPath(ctx);
    
    CGContextMoveToPoint(ctx, 150.0, 180.0);
    CGContextAddLineToPoint(ctx, 70.0f, 100.0f);
    CGContextAddLineToPoint(ctx,70.0f,250.0f);
    CGContextSetStrokeColorWithColor(ctx, [[UIColor yellowColor] CGColor]);
     CGContextStrokePath(ctx); //draw the image
    //////////////////////
    
    //////////////////////
    // save the state
    CGContextSaveGState(ctx);
    //////////////////////

    //////////////////////
    //draw the head arch
    CGContextBeginPath(ctx);
    CGContextMoveToPoint(ctx, 150.0,180.0);
    CGContextAddCurveToPoint(ctx, 180.0, 170.0, 230.0, 170.0, 260.0, 180.0);
    CGContextStrokePath(ctx);
    //////////////////////

    //////////////////////
    //drew right cat ear
    CGContextBeginPath(ctx);
    CGContextMoveToPoint(ctx, 260.0, 180.0);
    CGContextAddLineToPoint(ctx, 340.0f, 100.0f);
    CGContextAddLineToPoint(ctx,340.0f,250.0f);
    CGContextFillPath(ctx);
    
    CGContextMoveToPoint(ctx, 260.0, 180.0);
    CGContextAddLineToPoint(ctx, 340.0f, 100.0f);
    CGContextAddLineToPoint(ctx,340.0f,250.0f);
    CGContextStrokePath(ctx); //draw the image
    //////////////////////
 
    
    //restore the state
    CGContextRestoreGState(ctx);
    
    //////////////////////
    //Create cat face
    //Create a gradient from yellow to orange
    CGFloat colors [] = {
        1.0, 1.0, 0.0, 1.0,
        1.0, 0.5, 0.0, 1.0
    };
    
    CGContextSetStrokeColorWithColor(ctx, [[UIColor whiteColor] CGColor]);

    CGColorSpaceRef baseSpace = CGColorSpaceCreateDeviceRGB();
    CGGradientRef gradient = CGGradientCreateWithColorComponents(baseSpace, colors, NULL, 2);
    (void)(CGColorSpaceRelease(baseSpace)), baseSpace = NULL;

    CGContextSaveGState(ctx);
    CGRect newRect = CGRectMake(70, 150, 270, 200);
    CGContextAddEllipseInRect(ctx, newRect);
    CGContextClip(ctx);

    CGPoint startPoint = CGPointMake(CGRectGetMidX(newRect), CGRectGetMinY(newRect));
    CGPoint endPoint = CGPointMake(CGRectGetMidX(newRect), CGRectGetMaxY(newRect));

    CGContextDrawLinearGradient(ctx, gradient, startPoint, endPoint, 0);
    (void)(CGGradientRelease(gradient)), gradient = NULL;

    CGContextRestoreGState(ctx);

    CGContextAddEllipseInRect(ctx, newRect);
    CGContextDrawPath(ctx, kCGPathStroke);
    //////////////////////
    
    
    
    //////////////////////
    //draw the right whiskers
    CGContextSetStrokeColorWithColor(ctx, [[UIColor blackColor] CGColor]);
    
    CGContextBeginPath(ctx);
    CGContextMoveToPoint(ctx, 250.0,270.0);
    CGContextAddCurveToPoint(ctx, 280.0, 260.0, 320.0, 250.0, 380.0, 250.0);
    CGContextMoveToPoint(ctx, 250.0,280.0);
    CGContextAddCurveToPoint(ctx, 280.0, 270.0, 320.0, 280.0, 380.0, 300.0);
    CGContextStrokePath(ctx);
    //////////////////////
    
    
    
    //////////////////////
    //draw the left whiskers
    CGContextSetStrokeColorWithColor(ctx, [[UIColor blackColor] CGColor]);
    
    CGContextBeginPath(ctx);
    CGContextMoveToPoint(ctx, 170.0,270.0);
    CGContextAddCurveToPoint(ctx, 140.0, 260.0, 100.0, 250.0, 40.0, 250.0);
    CGContextMoveToPoint(ctx, 170.0,280.0);
    CGContextAddCurveToPoint(ctx, 130.0, 270.0, 100.0, 280.0, 40.0, 300.0);
    CGContextStrokePath(ctx);
    //////////////////////


    
    
    
    
    /**
    //////////////////////
    //drew left cat ear
    CGContextBeginPath(ctx);
    CGContextMoveToPoint(ctx, 150.0, 180.0);
    CGContextAddLineToPoint(ctx, 70.0f, 100.0f);
    CGContextAddLineToPoint(ctx,70.0f,250.0f);
    CGContextSetFillColorWithColor(ctx, [[UIColor orangeColor] CGColor]);
    CGContextFillPath(ctx);
    
    CGContextMoveToPoint(ctx, 150.0, 180.0);
    CGContextAddLineToPoint(ctx, 70.0f, 100.0f);
    CGContextAddLineToPoint(ctx,70.0f,250.0f);
    CGContextSetStrokeColorWithColor(ctx, [[UIColor yellowColor] CGColor]);
     CGContextStrokePath(ctx); //draw the image
    //////////////////////
    
    //////////////////////
    // save the state
    CGContextSaveGState(ctx);
    //////////////////////

    //////////////////////
    //draw the head arch
    CGContextBeginPath(ctx);
    CGContextMoveToPoint(ctx, 150.0,180.0);
    CGContextAddCurveToPoint(ctx, 180.0, 170.0, 230.0, 170.0, 260.0, 180.0);
    CGContextStrokePath(ctx);
    //////////////////////

    //////////////////////
    //drew right cat ear
    CGContextBeginPath(ctx);
    CGContextMoveToPoint(ctx, 260.0, 180.0);
    CGContextAddLineToPoint(ctx, 340.0f, 100.0f);
    CGContextAddLineToPoint(ctx,340.0f,250.0f);
    CGContextFillPath(ctx);
    
    CGContextMoveToPoint(ctx, 260.0, 180.0);
    CGContextAddLineToPoint(ctx, 340.0f, 100.0f);
    CGContextAddLineToPoint(ctx,340.0f,250.0f);
    CGContextStrokePath(ctx); //draw the image
    //////////////////////

    
    //////////////////////
    //draw the face
    CGContextBeginPath(ctx);
    CGContextMoveToPoint(ctx,260.0,180.0);
    CGContextAddLineToPoint(ctx,340.0f,250.0f);
    CGContextAddLineToPoint(ctx,340.0f,330.0f);
    CGContextAddLineToPoint(ctx,230.0f,380.0f);
    CGContextAddLineToPoint(ctx,180.0f,380.0f);
    CGContextAddLineToPoint(ctx,70.0f,330.0f);
    CGContextAddLineToPoint(ctx,70.0f,250.0f);
    CGContextAddLineToPoint(ctx,150.0f,180.0f);
    CGContextAddCurveToPoint(ctx, 180.0, 170.0, 230.0, 170.0, 260.0, 180.0);
    CGContextFillPath(ctx);
    
    CGContextMoveToPoint(ctx,260.0,180.0);
    CGContextAddLineToPoint(ctx,340.0f,250.0f);
    CGContextAddLineToPoint(ctx,340.0f,330.0f);
    CGContextAddLineToPoint(ctx,230.0f,380.0f);
    CGContextAddLineToPoint(ctx,180.0f,380.0f);
    CGContextAddLineToPoint(ctx,70.0f,330.0f);
    CGContextAddLineToPoint(ctx,70.0f,250.0f);
    CGContextAddLineToPoint(ctx,150.0f,180.0f);
    CGContextAddCurveToPoint(ctx, 180.0, 170.0, 230.0, 170.0, 260.0, 180.0);
    CGContextStrokePath(ctx); //draw the image

     */
    
      
}



/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
