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
    CGPoint myPoints[5];
    int index;
    NSMutableArray *pathsArray;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setMultipleTouchEnabled:NO];
        myLine = [[FingerPaintLineView alloc] initWithLineWidth:2.0 andColour:[UIColor blackColor]];
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
    
    // Draw current line
    [myLine.lineColour setStroke];
    [myLine.myPath stroke];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    index = 0;
    myTouch = [touches anyObject];
    myPoints[0] = [myTouch locationInView:self];
    [myLine.myPath moveToPoint:myPoints[0]];
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {

    myTouch = [touches anyObject];
    CGPoint point = [myTouch locationInView:self];
    index++;
    myPoints[index] = point;
    
    if(index == 4) {
        // Move endpoint to middle of line joing second control point of first segment
        // and first control point of second segment
        myPoints[3] = CGPointMake((myPoints[2].x + myPoints[4].x) / 2.0, (myPoints[2].y + myPoints[4].y) / 2.0);
        
        [myLine.myPath moveToPoint:myPoints[0]];

        // Adding a cubic Bezier from array[0] to array[3] with control points array[1] and array[2]
        [myLine.myPath addCurveToPoint:myPoints[3] controlPoint1:myPoints[1] controlPoint2:myPoints[2]];
        [self setNeedsDisplay];
        
        myPoints[0] = [myLine.myPath currentPoint];
        
        myPoints[0] = myPoints[3];
        myPoints[1] = myPoints[4];
        index = 1;
    }
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {

    myPoints[0] = [myLine.myPath currentPoint];
    
    // Add line to array and re-initialize line
    [pathsArray addObject:myLine];
    myLine = [[FingerPaintLineView alloc] initWithLineWidth:myLine.myPath.lineWidth andColour:myLine.lineColour];

    [self setNeedsDisplay];
}

- (void)changeLineColour:(UIColor *)colour {

    myLine.lineColour = colour;
}



@end
