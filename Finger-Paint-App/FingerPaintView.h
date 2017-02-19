//
//  FingerPaintView.h
//  Finger-Paint-App
//
//  Created by Dave Augerinos on 2017-02-18.
//  Copyright © 2017 Dave Augerinos. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FingerPaintView : UIView

@property (strong, nonatomic) UIColor *lineColour;
@property (assign, nonatomic) CGFloat lineWidth;

- (void)changeLineColour:(UIColor *)colour;

@end
