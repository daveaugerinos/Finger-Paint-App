//
//  ViewController.m
//  Finger-Paint-App
//
//  Created by Dave Augerinos on 2017-02-18.
//  Copyright © 2017 Dave Augerinos. All rights reserved.
//

#import "ViewController.h"
#import "FingerPaintView.h"
#import <QuartzCore/QuartzCore.h>

@interface ViewController ()

@property (strong, nonatomic) FingerPaintView *fingerPaintView;
@property (strong, nonatomic) UIView *colourPaletteView;
@property (strong, nonatomic) UIButton *redColourButton;
@property (strong, nonatomic) UIButton *blueColourButton;
@property (strong, nonatomic) UIButton *greenColourButton;
@property (strong, nonatomic) UIButton *blackColourButton;
@property (strong, nonatomic) UIButton *eraserColourButton;

@end

@implementation ViewController

- (void)viewDidLoad {

    [super viewDidLoad];
    
    // Initialize Views and Buttons
    [self initializeViews];
    [self initializeButtons];
    
    // Apply constraints to views
    [self applyViewConstraints];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)initializeViews {
    
    // Painting view
    self.fingerPaintView = [[FingerPaintView alloc] initWithFrame:CGRectZero];
    self.fingerPaintView.translatesAutoresizingMaskIntoConstraints = NO;
    self.fingerPaintView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.fingerPaintView];
    
    // Colour palette view
    self.colourPaletteView = [[UIView alloc] initWithFrame:CGRectZero];
    self.colourPaletteView.translatesAutoresizingMaskIntoConstraints = NO;
    self.colourPaletteView.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:self.colourPaletteView];
}

- (void)initializeButtons {
    
    // Colour buttons
    self.redColourButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.redColourButton.translatesAutoresizingMaskIntoConstraints = NO;
    self.redColourButton.backgroundColor = [UIColor redColor];
    [self.redColourButton setFrame:CGRectMake(10, 10, 25, 25)];
    self.redColourButton.layer.cornerRadius = 0.5 * self.redColourButton.bounds.size.width;
    [self.redColourButton addTarget:self action:@selector(changeColour:) forControlEvents:UIControlEventTouchUpInside];
    [self.colourPaletteView addSubview:self.redColourButton];
    
    self.blueColourButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.blueColourButton.translatesAutoresizingMaskIntoConstraints = NO;
    self.blueColourButton.backgroundColor = [UIColor blueColor];
    [self.blueColourButton setFrame:CGRectMake(10, 10, 25, 25)];
    self.blueColourButton.layer.cornerRadius = 0.5 * self.blueColourButton.bounds.size.width;
    [self.blueColourButton addTarget:self action:@selector(changeColour:) forControlEvents:UIControlEventTouchUpInside];
    [self.colourPaletteView addSubview:self.blueColourButton];
    
    self.greenColourButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.greenColourButton.translatesAutoresizingMaskIntoConstraints = NO;
    self.greenColourButton.backgroundColor = [UIColor greenColor];
    [self.greenColourButton setFrame:CGRectMake(10, 10, 25, 25)];
    self.greenColourButton.layer.cornerRadius = 0.5 * self.greenColourButton.bounds.size.width;
    [self.greenColourButton addTarget:self action:@selector(changeColour:) forControlEvents:UIControlEventTouchUpInside];
    [self.colourPaletteView addSubview:self.greenColourButton];
    
    self.blackColourButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.blackColourButton.translatesAutoresizingMaskIntoConstraints = NO;
    self.blackColourButton.backgroundColor = [UIColor blackColor];
    [self.blackColourButton setFrame:CGRectMake(10, 10, 25, 25)];
    self.blackColourButton.layer.cornerRadius = 0.5 * self.blackColourButton.bounds.size.width;
    [self.blackColourButton addTarget:self action:@selector(changeColour:) forControlEvents:UIControlEventTouchUpInside];
    [self.colourPaletteView addSubview:self.blackColourButton];
    
    UIColor *eraserColour = self.fingerPaintView.backgroundColor;
    self.eraserColourButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.eraserColourButton setTitle:@"Eraser" forState:UIControlStateNormal];
    [self.eraserColourButton setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
    self.eraserColourButton.translatesAutoresizingMaskIntoConstraints = NO;
    self.eraserColourButton.backgroundColor = eraserColour;
    [self.eraserColourButton setFrame:CGRectMake(10, 10, 25, 25)];
    self.eraserColourButton.layer.cornerRadius = 0.5 * self.eraserColourButton.bounds.size.width;
    [self.eraserColourButton addTarget:self action:@selector(changeColour:) forControlEvents:UIControlEventTouchUpInside];
    [self.colourPaletteView addSubview:self.eraserColourButton];
}

- (void)applyViewConstraints {
    
    // Finger paint view constraints
    NSLayoutConstraint *fingerPaintViewWidthConstraint = [NSLayoutConstraint constraintWithItem:self.fingerPaintView
                                                                                      attribute:NSLayoutAttributeWidth
                                                                                      relatedBy:NSLayoutRelationEqual
                                                                                         toItem:self.view
                                                                                      attribute:NSLayoutAttributeWidth
                                                                                     multiplier:1.0
                                                                                       constant:0.0];
    fingerPaintViewWidthConstraint.active = YES;
    
    NSLayoutConstraint *fingerPaintViewHeightConstraint = [NSLayoutConstraint constraintWithItem:self.fingerPaintView
                                                                                       attribute:NSLayoutAttributeHeight
                                                                                       relatedBy:NSLayoutRelationEqual
                                                                                          toItem:self.view
                                                                                       attribute:NSLayoutAttributeHeight
                                                                                      multiplier:1.0
                                                                                        constant:-50];
    
    fingerPaintViewHeightConstraint.active = YES;
    
    
    NSLayoutConstraint *fingerPaintViewTopConstraint = [NSLayoutConstraint constraintWithItem:self.fingerPaintView
                                                                                    attribute:NSLayoutAttributeTopMargin
                                                                                    relatedBy:NSLayoutRelationEqual
                                                                                       toItem:self.view
                                                                                    attribute:NSLayoutAttributeTopMargin
                                                                                   multiplier:1.0
                                                                                     constant:0.0];
    
    fingerPaintViewTopConstraint.active = YES;
    
    NSLayoutConstraint *fingerPaintViewLeftConstraint = [NSLayoutConstraint constraintWithItem:self.fingerPaintView
                                                                                     attribute:NSLayoutAttributeLeft
                                                                                     relatedBy:NSLayoutRelationEqual
                                                                                        toItem:self.view
                                                                                     attribute:NSLayoutAttributeLeft
                                                                                    multiplier:1.0
                                                                                      constant:0];
    
    fingerPaintViewLeftConstraint.active = YES;
    
    // Colour palette view constraints
    NSLayoutConstraint *colourPaletteViewHeightConstraint = [NSLayoutConstraint constraintWithItem:self.colourPaletteView
                                                                                         attribute:NSLayoutAttributeHeight
                                                                                         relatedBy:NSLayoutRelationEqual
                                                                                            toItem:nil
                                                                                         attribute:NSLayoutAttributeNotAnAttribute
                                                                                        multiplier:1.0
                                                                                          constant:50];
    
    colourPaletteViewHeightConstraint.active = YES;
    
    NSLayoutConstraint *colourPaletteViewTopConstraint = [NSLayoutConstraint constraintWithItem:self.colourPaletteView
                                                                                      attribute:NSLayoutAttributeTop
                                                                                      relatedBy:NSLayoutRelationEqual
                                                                                         toItem:self.fingerPaintView
                                                                                      attribute:NSLayoutAttributeBottom
                                                                                     multiplier:1.0
                                                                                       constant:0.0];
    colourPaletteViewTopConstraint.active = YES;
    
    
    NSLayoutConstraint *colourPaletteViewLeftConstraint = [NSLayoutConstraint constraintWithItem:self.colourPaletteView
                                                                                       attribute:NSLayoutAttributeLeftMargin
                                                                                       relatedBy:NSLayoutRelationEqual
                                                                                          toItem:self.view
                                                                                       attribute:NSLayoutAttributeLeftMargin
                                                                                      multiplier:1.0
                                                                                        constant:0];
    colourPaletteViewLeftConstraint.active = YES;
    
    NSLayoutConstraint *colourPaletteViewRightConstraint = [NSLayoutConstraint constraintWithItem:self.colourPaletteView
                                                                                        attribute:NSLayoutAttributeRightMargin
                                                                                        relatedBy:NSLayoutRelationEqual
                                                                                           toItem:self.view
                                                                                        attribute:NSLayoutAttributeRightMargin
                                                                                       multiplier:1.0
                                                                                         constant:0.0];
    colourPaletteViewRightConstraint.active = YES;

    // Red colour button constraints
    NSLayoutConstraint *redColourButtonXConstraint = [NSLayoutConstraint constraintWithItem:self.redColourButton
                                                                                  attribute:NSLayoutAttributeCenterXWithinMargins
                                                                                  relatedBy:NSLayoutRelationEqual
                                                                                     toItem:self.colourPaletteView
                                                                                  attribute:NSLayoutAttributeCenterXWithinMargins
                                                                                 multiplier:0.2
                                                                                   constant:0];
    
    redColourButtonXConstraint.active = YES;
    
    NSLayoutConstraint *redColourButtonYConstraint = [NSLayoutConstraint constraintWithItem:self.redColourButton
                                                                                  attribute:NSLayoutAttributeCenterYWithinMargins
                                                                                  relatedBy:NSLayoutRelationEqual
                                                                                     toItem:self.colourPaletteView
                                                                                  attribute:NSLayoutAttributeCenterYWithinMargins
                                                                                 multiplier:1.0
                                                                                   constant:0];
    
    redColourButtonYConstraint.active = YES;
    
    // Blue colour button constraints
    NSLayoutConstraint *blueColourButtonXConstraint = [NSLayoutConstraint constraintWithItem:self.blueColourButton
                                                                                   attribute:NSLayoutAttributeCenterXWithinMargins
                                                                                   relatedBy:NSLayoutRelationEqual
                                                                                      toItem:self.colourPaletteView
                                                                                   attribute:NSLayoutAttributeCenterXWithinMargins
                                                                                  multiplier:0.4
                                                                                    constant:0];
    
    blueColourButtonXConstraint.active = YES;
    
    NSLayoutConstraint *blueColourButtonYConstraint = [NSLayoutConstraint constraintWithItem:self.blueColourButton
                                                                                   attribute:NSLayoutAttributeCenterYWithinMargins
                                                                                   relatedBy:NSLayoutRelationEqual
                                                                                      toItem:self.colourPaletteView
                                                                                   attribute:NSLayoutAttributeCenterYWithinMargins
                                                                                  multiplier:1.0
                                                                                    constant:0];
    
    blueColourButtonYConstraint.active = YES;
    
    // Green colour button constraints
    NSLayoutConstraint *greenColourButtonXConstraint = [NSLayoutConstraint constraintWithItem:self.greenColourButton
                                                                                   attribute:NSLayoutAttributeCenterXWithinMargins
                                                                                   relatedBy:NSLayoutRelationEqual
                                                                                      toItem:self.colourPaletteView
                                                                                   attribute:NSLayoutAttributeCenterXWithinMargins
                                                                                  multiplier:0.6
                                                                                    constant:0];
    
    greenColourButtonXConstraint.active = YES;
    
    NSLayoutConstraint *greenColourButtonYConstraint = [NSLayoutConstraint constraintWithItem:self.greenColourButton
                                                                                   attribute:NSLayoutAttributeCenterYWithinMargins
                                                                                   relatedBy:NSLayoutRelationEqual
                                                                                      toItem:self.colourPaletteView
                                                                                   attribute:NSLayoutAttributeCenterYWithinMargins
                                                                                  multiplier:1.0
                                                                                    constant:0];
    
    greenColourButtonYConstraint.active = YES;
    
    // Black colour button constraints
    NSLayoutConstraint *blackColourButtonXConstraint = [NSLayoutConstraint constraintWithItem:self.blackColourButton
                                                                                    attribute:NSLayoutAttributeCenterXWithinMargins
                                                                                    relatedBy:NSLayoutRelationEqual
                                                                                       toItem:self.colourPaletteView
                                                                                    attribute:NSLayoutAttributeCenterXWithinMargins
                                                                                   multiplier:0.8
                                                                                     constant:0];
    
    blackColourButtonXConstraint.active = YES;
    
    NSLayoutConstraint *blackColourButtonYConstraint = [NSLayoutConstraint constraintWithItem:self.blackColourButton
                                                                                    attribute:NSLayoutAttributeCenterYWithinMargins
                                                                                    relatedBy:NSLayoutRelationEqual
                                                                                       toItem:self.colourPaletteView
                                                                                    attribute:NSLayoutAttributeCenterYWithinMargins
                                                                                   multiplier:1.0
                                                                                     constant:0];
    
    blackColourButtonYConstraint.active = YES;
    
    // Erase colour button constraints
    NSLayoutConstraint *eraseColourButtonXConstraint = [NSLayoutConstraint constraintWithItem:self.eraserColourButton
                                                                                    attribute:NSLayoutAttributeCenterXWithinMargins
                                                                                    relatedBy:NSLayoutRelationEqual
                                                                                       toItem:self.colourPaletteView
                                                                                    attribute:NSLayoutAttributeCenterXWithinMargins
                                                                                   multiplier:1.8
                                                                                     constant:0];
    
    eraseColourButtonXConstraint.active = YES;
    
    NSLayoutConstraint *eraseColourButtonYConstraint = [NSLayoutConstraint constraintWithItem:self.eraserColourButton
                                                                                    attribute:NSLayoutAttributeCenterYWithinMargins
                                                                                    relatedBy:NSLayoutRelationEqual
                                                                                       toItem:self.colourPaletteView
                                                                                    attribute:NSLayoutAttributeCenterYWithinMargins
                                                                                   multiplier:1.0
                                                                                     constant:0];
    
    eraseColourButtonYConstraint.active = YES;
    
}

- (void)changeColour:(UIButton *)sender {
    
    [self.fingerPaintView changeLineColour:sender.backgroundColor];
}


@end
