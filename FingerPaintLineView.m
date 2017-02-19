//
//  FingerPaintLineView.m
//  Finger-Paint-App
//
//  Created by Dave Augerinos on 2017-02-19.
//  Copyright © 2017 Dave Augerinos. All rights reserved.
//

#import "FingerPaintLineView.h"

@implementation FingerPaintLineView

- (instancetype)initWithLineWidth:(CGFloat)width andColour:(UIColor *)colour
{
    self = [super init];
    
    if (self) {
        self.myPath = [[UIBezierPath alloc] init];
        self.myPath.lineWidth = width;
        self.lineColour = colour;
    }
    return self;
}

@end
