//
//  FingerPaintView.m
//  Finger-Paint-App
//
//  Created by Dave Augerinos on 2017-02-18.
//  Copyright © 2017 Dave Augerinos. All rights reserved.
//

#import "FingerPaintView.h"

@implementation FingerPaintView
{
    UIBezierPath *myPath;
    UITouch *myTouch;
    CGPoint myPoint;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        myPath = [[UIBezierPath alloc] init];
        self.lineWidth = 10.0;
        self.lineColour = [UIColor blackColor];
    }
    return self;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
//    self.lineColour = self.lineColour;
    myPath.lineWidth = self.lineWidth;
    
    [self.lineColour setStroke];
    
    [myPath stroke];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    myTouch = [touches anyObject];
    myPoint = [myTouch locationInView:self];
    [myPath moveToPoint:myPoint];
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    myTouch = [touches anyObject];
    myPoint = [myTouch locationInView:self];
    [myPath addLineToPoint:myPoint];
    [self setNeedsDisplay];
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    myTouch = [touches anyObject];
    myPoint = [myTouch locationInView:self];
    [myPath addLineToPoint:myPoint];
    [self setNeedsDisplay];
}

- (void)changeLineColour:(UIColor *)colour {
    self.lineColour = colour;
}



@end
