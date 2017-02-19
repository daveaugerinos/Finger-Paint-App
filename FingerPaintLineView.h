//
//  FingerPaintLineView.h
//  Finger-Paint-App
//
//  Created by Dave Augerinos on 2017-02-19.
//  Copyright © 2017 Dave Augerinos. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FingerPaintLineView : UIView

@property (strong, nonatomic) UIBezierPath *myPath;
@property (strong, nonatomic) UIColor *lineColour;

- (instancetype)initWithLineWidth:(CGFloat)width andColour:(UIColor *)colour;

@end
