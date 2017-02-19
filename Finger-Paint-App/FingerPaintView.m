//
//  FingerPaintView.m
//  Finger-Paint-App
//
//  Created by Dave Augerinos on 2017-02-18.
//  Copyright © 2017 Dave Augerinos. All rights reserved.
//

#import "FingerPaintView.h"
#import "FingerPaintLineView.h"

@implementation FingerPaintView
{
    FingerPaintLineView *myLine;
    UITouch *myTouch;
    CGPoint myPoint;
    NSMutableArray *pathsArray;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        myLine = [[FingerPaintLineView alloc] initWithLineWidth:5.0 andColour:[UIColor blackColor]];
        pathsArray = [[NSMutableArray alloc] init];
    }
    return self;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {

    // Draw existing lines in paths array
    for(FingerPaintLineView *currentLine in pathsArray) {
        [currentLine.lineColour setStroke];
        [currentLine.myPath stroke];
    }
    
    [myLine.lineColour setStroke];
    [myLine.myPath stroke];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
//    [myLine.lineColour setStroke];
    myTouch = [touches anyObject];
    myPoint = [myTouch locationInView:self];
    [myLine.myPath moveToPoint:myPoint];
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    myTouch = [touches anyObject];
    myPoint = [myTouch locationInView:self];
    [myLine.myPath addLineToPoint:myPoint];
    [self setNeedsDisplay];
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    myTouch = [touches anyObject];
    myPoint = [myTouch locationInView:self];
    [myLine.myPath addLineToPoint:myPoint];
    [pathsArray addObject:myLine];
    myLine = [[FingerPaintLineView alloc] initWithLineWidth:myLine.myPath.lineWidth andColour:myLine.lineColour];
    [self setNeedsDisplay];
}

- (void)changeLineColour:(UIColor *)colour {
    myLine.lineColour = colour;
}



@end
