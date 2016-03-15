//
//  LPAViewController.m
//  Autolayout
//
//  Created by Steven Masuch on 2014-07-20.
//  Copyright (c) 2014 Lighthouse Labs. All rights reserved.
//

#import "LPAViewController.h"

@interface LPAViewController ()

@property (nonatomic, weak) UIButton *  squareButton;
@property (nonatomic, weak) UIButton *  portraitButton;
@property (nonatomic, weak) UIButton *  landscapeButton;

@property (nonatomic, weak) UIView *                framingView;
@property (nonatomic, weak) NSLayoutConstraint *    framingViewHeight;
@property (nonatomic, weak) NSLayoutConstraint *    framingViewWidth;

@property (nonatomic, weak) UIView * purpleBox;
@property (nonatomic, weak) NSLayoutConstraint * purpleHeight;
@property (nonatomic, weak) NSLayoutConstraint * purpleWidth;

@property (nonatomic, weak) UIView *redBox;
@property (nonatomic, weak) NSLayoutConstraint *redHeight;
@property (nonatomic, weak) NSLayoutConstraint *redWidth;

@property (nonatomic, weak) UIView *orangeBox1;
@property (nonatomic, weak) UIView *orangeBox2;
@property (nonatomic, weak) NSLayoutConstraint *orangeHeight1;
@property (nonatomic, weak) NSLayoutConstraint *orangeHeight2;
@property (nonatomic, weak) NSLayoutConstraint *orangeWidth1;
@property (nonatomic, weak) NSLayoutConstraint *orangeWidth2;

@property (nonatomic, weak) UIView *blueBox1;
@property (nonatomic, weak) NSLayoutConstraint *blueHeight1;
@property (nonatomic, weak) NSLayoutConstraint *blueWidth1;
@property (nonatomic, weak) UIView *blueBox2;
@property (nonatomic, weak) NSLayoutConstraint *blueHeight2;
@property (nonatomic, weak) NSLayoutConstraint *blueWidth2;
@property (nonatomic, weak) UIView *blueBox3;
@property (nonatomic, weak) NSLayoutConstraint *blueHeight3;
@property (nonatomic, weak) NSLayoutConstraint *blueWidth3;

@end

@implementation LPAViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UIButton *squareButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [squareButton setTitle:@"Square" forState:UIControlStateNormal];
    [squareButton addTarget:self action:@selector(resizeFramingView:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:squareButton];
    squareButton.translatesAutoresizingMaskIntoConstraints = NO;
    self.squareButton = squareButton;
    
    UIButton *portraitButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [portraitButton setTitle:@"Portrait" forState:UIControlStateNormal];
    [portraitButton addTarget:self action:@selector(resizeFramingView:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:portraitButton];
    portraitButton.translatesAutoresizingMaskIntoConstraints = NO;
    self.portraitButton = portraitButton;
    
    UIButton *landscapeButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [landscapeButton setTitle:@"Landscape" forState:UIControlStateNormal];
    [landscapeButton addTarget:self action:@selector(resizeFramingView:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:landscapeButton];
    landscapeButton.translatesAutoresizingMaskIntoConstraints = NO;
    self.landscapeButton = landscapeButton;
    
    UIView *framingView = [[UIView alloc] initWithFrame:CGRectZero];
    framingView.translatesAutoresizingMaskIntoConstraints = NO;
    framingView.backgroundColor = [UIColor greenColor];
    [self.view addSubview:framingView];
    self.framingView = framingView;
    
    
    
    NSString *buttonsHorizontalConstraints = @"|[squareButton(==portraitButton)][portraitButton(==landscapeButton)][landscapeButton]|";
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:buttonsHorizontalConstraints
                                                                      options:NSLayoutFormatAlignAllCenterY
                                                                      metrics:nil
                                                                        views:NSDictionaryOfVariableBindings(squareButton, portraitButton, landscapeButton)]];
    
    //Green Frame
    
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:squareButton
                                                          attribute:NSLayoutAttributeBottom
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeBottom
                                                         multiplier:1.0
                                                           constant:-50.0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:framingView
                                                          attribute:NSLayoutAttributeCenterX
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeCenterX
                                                         multiplier:1.0
                                                           constant:0.0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:framingView
                                                          attribute:NSLayoutAttributeCenterY
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeCenterY
                                                         multiplier:1.0
                                                           constant:-50.0]];
    
    NSLayoutConstraint *framingViewHeight = [NSLayoutConstraint constraintWithItem:framingView
                                                                         attribute:NSLayoutAttributeHeight
                                                                         relatedBy:NSLayoutRelationEqual
                                                                            toItem:nil
                                                                         attribute:NSLayoutAttributeNotAnAttribute
                                                                        multiplier:1.0
                                                                          constant:500.0];
    
    NSLayoutConstraint *framingViewWidth = [NSLayoutConstraint constraintWithItem:framingView
                                                                        attribute:NSLayoutAttributeWidth
                                                                        relatedBy:NSLayoutRelationEqual
                                                                           toItem:nil
                                                                        attribute:NSLayoutAttributeNotAnAttribute
                                                                       multiplier:1.0
                                                                         constant:500.0];
    
    [framingView addConstraint:framingViewHeight];
    [framingView addConstraint:framingViewWidth];
    self.framingViewHeight = framingViewHeight;
    self.framingViewWidth = framingViewWidth;
    
    
    
    //PURPLE BOX
 
    CGRect purpleBoxFrame = CGRectZero;
    
    UIView *purpleBoxView = [[UIView alloc] initWithFrame:purpleBoxFrame];
    
    purpleBoxView.translatesAutoresizingMaskIntoConstraints = NO;
    purpleBoxView.backgroundColor = [UIColor purpleColor];
    
    [self.framingView addSubview:purpleBoxView];
    
    
    NSLayoutConstraint *purpleRight =[NSLayoutConstraint constraintWithItem:purpleBoxView
                                                                  attribute:NSLayoutAttributeRight
                                                                  relatedBy:NSLayoutRelationEqual
                                                                     toItem:self.framingView
                                                                  attribute:NSLayoutAttributeRight
                                                                 multiplier:1.0
                                                                    constant:-20];
    
    NSLayoutConstraint *purpleBottom = [NSLayoutConstraint constraintWithItem:purpleBoxView
                                                                   attribute:NSLayoutAttributeBottom
                                                                   relatedBy:NSLayoutRelationEqual
                                                                      toItem:self.framingView
                                                                   attribute:NSLayoutAttributeBottom
                                                                  multiplier:1.0
                                                                     constant:-20];

    
    
    NSLayoutConstraint *purpleHeight = [NSLayoutConstraint constraintWithItem:purpleBoxView
                                                                    attribute:NSLayoutAttributeHeight
                                                                    relatedBy:NSLayoutRelationEqual
                                                                       toItem:nil
                                                                    attribute:NSLayoutAttributeNotAnAttribute
                                                                   multiplier:1
                                                                     constant:50];
    

    NSLayoutConstraint *purpleWidth = [NSLayoutConstraint constraintWithItem:purpleBoxView
                                                                   attribute:NSLayoutAttributeWidth
                                                                   relatedBy:NSLayoutRelationEqual
                                                                      toItem:nil
                                                                   attribute:NSLayoutAttributeNotAnAttribute
                                                                  multiplier:305.0/500.00
                                                                    constant:200];
 
    
    [purpleBoxView addConstraint:purpleHeight];
    [purpleBoxView addConstraint:purpleWidth];
    [self.framingView addConstraint:purpleRight];
    [self.framingView addConstraint:purpleBottom];
    self.purpleBox = purpleBoxView;
    self.purpleHeight = purpleHeight;
    self.purpleWidth = purpleWidth;
   
    
    //RED BOX
  
    CGRect redBoxFrame = CGRectZero;
    
    UIView *redBoxView = [[UIView alloc] initWithFrame:redBoxFrame];
    redBoxView.translatesAutoresizingMaskIntoConstraints = NO;
    redBoxView.backgroundColor = [UIColor redColor];
    
    [self.framingView addSubview:redBoxView];
    
    
    
    NSLayoutConstraint *redRight = [NSLayoutConstraint constraintWithItem:redBoxView
                                                                attribute:NSLayoutAttributeRight
                                                                relatedBy:NSLayoutRelationEqual
                                                                   toItem:self.framingView
                                                                attribute:NSLayoutAttributeRight
                                                               multiplier:1.0
                                                                 constant:-20];
    
    
    
    NSLayoutConstraint *redTop = [NSLayoutConstraint    constraintWithItem:redBoxView
                                                                 attribute:NSLayoutAttributeTop
                                                                 relatedBy:NSLayoutRelationEqual
                                                                    toItem:self.framingView
                                                                 attribute:NSLayoutAttributeTop
                                                                multiplier:1.0
                                                                  constant:20];
    
    
    
    NSLayoutConstraint *redHeight = [NSLayoutConstraint constraintWithItem:redBoxView
                                                                 attribute:NSLayoutAttributeHeight
                                                                 relatedBy:NSLayoutRelationEqual
                                                                    toItem:nil
                                                                 attribute:NSLayoutAttributeNotAnAttribute
                                                                multiplier:1.0
                                                                  constant:50];

    
 
    NSLayoutConstraint *redWidth = [NSLayoutConstraint constraintWithItem:redBoxView
                                                                attribute:NSLayoutAttributeWidth
                                                                relatedBy:NSLayoutRelationEqual
                                                                   toItem:nil
                                                                attribute:NSLayoutAttributeWidth
                                                               multiplier:1.0
                                                                 constant:150.0];
    
    
    [redBoxView addConstraint:redHeight];
    [redBoxView addConstraint:redWidth];
    [self.framingView addConstraint:redTop];
    [self.framingView addConstraint:redRight];
    
    self.redBox = redBoxView;
    self.redHeight = redHeight;
    self.redWidth = redWidth;
    
    
    //ORANGE BOXES
    
    CGRect orangeBoxFrame = CGRectZero;
    
    
    //ORANGE BOX 1
    
    UIView *orangeBoxView1 = [[UIView alloc] initWithFrame:orangeBoxFrame];
    orangeBoxView1.translatesAutoresizingMaskIntoConstraints = NO;
    orangeBoxView1.backgroundColor = [UIColor orangeColor];
    
    [redBoxView addSubview:orangeBoxView1];
    

    
    NSLayoutConstraint *orangeHeight1 = [NSLayoutConstraint constraintWithItem:orangeBoxView1
                                                                    attribute:NSLayoutAttributeHeight
                                                                    relatedBy:NSLayoutRelationEqual
                                                                       toItem:nil
                                                                    attribute:NSLayoutAttributeHeight
                                                                   multiplier:1
                                                                     constant:30];
    
    
    NSLayoutConstraint *orangeWidth1 = [NSLayoutConstraint constraintWithItem:orangeBoxView1
                                                                    attribute:NSLayoutAttributeWidth
                                                                    relatedBy:NSLayoutRelationEqual
                                                                       toItem:nil
                                                                    attribute:NSLayoutAttributeWidth
                                                                   multiplier:1
                                                                     constant:50];
    
    NSLayoutConstraint *orangeTop1 = [NSLayoutConstraint constraintWithItem:orangeBoxView1
                                                                 attribute:NSLayoutAttributeTop
                                                                 relatedBy:NSLayoutRelationEqual
                                                                    toItem:redBoxView
                                                                 attribute:NSLayoutAttributeTop
                                                                multiplier:1
                                                                  constant:10];
    
    
    NSLayoutConstraint *orangeRight1 = [NSLayoutConstraint constraintWithItem:orangeBoxView1
                                                                   attribute:NSLayoutAttributeRight
                                                                   relatedBy:NSLayoutRelationEqual
                                                                      toItem:redBoxView
                                                                   attribute:NSLayoutAttributeRight
                                                                  multiplier:1
                                                                    constant:-10.0];
    

    
    [orangeBoxView1 addConstraint:orangeHeight1];
    [orangeBoxView1 addConstraint:orangeWidth1];
    [self.redBox addConstraint:orangeTop1];
    [self.redBox addConstraint:orangeRight1];
    
    self.orangeBox1 = orangeBoxView1;
    self.orangeHeight1 = orangeHeight1;
    self.orangeWidth1 = orangeWidth1;
 
    
    //ORANGE BOX 2
    
    UIView *orangeBoxView2 = [[UIView alloc] initWithFrame:orangeBoxFrame];
    orangeBoxView2.translatesAutoresizingMaskIntoConstraints = NO;
    orangeBoxView2.backgroundColor = [UIColor orangeColor];
    
    [redBoxView addSubview:orangeBoxView2];

    
    NSLayoutConstraint *orangeHeight2 = [NSLayoutConstraint constraintWithItem:orangeBoxView2
                                                                     attribute:NSLayoutAttributeHeight
                                                                     relatedBy:NSLayoutRelationEqual
                                                                        toItem:nil
                                                                     attribute:NSLayoutAttributeHeight
                                                                    multiplier:1
                                                                      constant:30];
    
    
    NSLayoutConstraint *orangeWidth2 = [NSLayoutConstraint constraintWithItem:orangeBoxView2
                                                                    attribute:NSLayoutAttributeWidth
                                                                    relatedBy:NSLayoutRelationEqual
                                                                       toItem:nil
                                                                    attribute:NSLayoutAttributeWidth
                                                                   multiplier:1
                                                                     constant:70];
    
    NSLayoutConstraint *orangeTop2 = [NSLayoutConstraint constraintWithItem:orangeBoxView2
                                                                  attribute:NSLayoutAttributeTop
                                                                  relatedBy:NSLayoutRelationEqual
                                                                     toItem:redBoxView
                                                                  attribute:NSLayoutAttributeTop
                                                                 multiplier:1
                                                                   constant:10];
    
    
    NSLayoutConstraint *orangeLeft2 = [NSLayoutConstraint constraintWithItem:orangeBoxView2
                                                                    attribute:NSLayoutAttributeLeft
                                                                    relatedBy:NSLayoutRelationEqual
                                                                       toItem:redBoxView
                                                                    attribute:NSLayoutAttributeLeft
                                                                   multiplier:1
                                                                     constant: 10.0];
    
    


    [orangeBoxView2 addConstraint:orangeHeight2];
    [orangeBoxView2 addConstraint:orangeWidth2];
    [self.redBox addConstraint:orangeTop2];
    [self.redBox addConstraint:orangeLeft2];
    
    self.orangeBox2 = orangeBoxView2;
    self.orangeHeight2 = orangeHeight2;
    self.orangeWidth2 = orangeWidth2;
    
    
    //BLUE BOXES
    
    
    CGRect blueBoxFrame = CGRectZero;
    
    
    //BLUE BOX 1
    
    UIView *blueBoxView1 = [[UIView alloc] initWithFrame:blueBoxFrame];
    
    blueBoxView1.translatesAutoresizingMaskIntoConstraints = NO;
    blueBoxView1.backgroundColor = [UIColor blueColor];
    
    [self.framingView addSubview:blueBoxView1];
    
    
    NSLayoutConstraint *blueX1 =[NSLayoutConstraint constraintWithItem:blueBoxView1
                                                                  attribute:NSLayoutAttributeCenterX
                                                                  relatedBy:NSLayoutRelationEqual
                                                                     toItem:self.framingView
                                                                  attribute:NSLayoutAttributeCenterX
                                                                 multiplier:1.0
                                                                   constant:0];
    
    NSLayoutConstraint *blueY1 = [NSLayoutConstraint constraintWithItem:blueBoxView1
                                                                    attribute:NSLayoutAttributeCenterY
                                                                    relatedBy:NSLayoutRelationEqual
                                                                       toItem:self.framingView
                                                                    attribute:NSLayoutAttributeCenterY
                                                                   multiplier:1.0
                                                                     constant:0];
    
    
    
    NSLayoutConstraint *blueHeight1 = [NSLayoutConstraint constraintWithItem:blueBoxView1
                                                                    attribute:NSLayoutAttributeHeight
                                                                    relatedBy:NSLayoutRelationEqual
                                                                       toItem:nil
                                                                    attribute:NSLayoutAttributeNotAnAttribute
                                                                   multiplier:1
                                                                     constant:50];
    
    
    NSLayoutConstraint *blueWidth1 = [NSLayoutConstraint constraintWithItem:blueBoxView1
                                                                   attribute:NSLayoutAttributeWidth
                                                                   relatedBy:NSLayoutRelationEqual
                                                                      toItem:nil
                                                                   attribute:NSLayoutAttributeNotAnAttribute
                                                                  multiplier:1
                                                                    constant:50];
    
    
    [blueBoxView1 addConstraint:blueHeight1];
    [blueBoxView1 addConstraint:blueWidth1];
    [self.framingView addConstraint:blueX1];
    [self.framingView addConstraint:blueY1];
    self.blueBox1 = blueBoxView1;
    self.blueHeight1 = blueHeight1;
    self.blueWidth1 = blueWidth1;

    
    //BLUE BOX 2
    
    UIView *blueBoxView2 = [[UIView alloc] initWithFrame:blueBoxFrame];
    
    blueBoxView2.translatesAutoresizingMaskIntoConstraints = NO;
    blueBoxView2.backgroundColor = [UIColor blueColor];
    
    [self.framingView addSubview:blueBoxView2];
    
    
    NSLayoutConstraint *blueX2 =[NSLayoutConstraint constraintWithItem:blueBoxView2
                                                                 attribute:NSLayoutAttributeCenterX
                                                                 relatedBy:NSLayoutRelationEqual
                                                                    toItem:self.framingView
                                                                 attribute:NSLayoutAttributeCenterX
                                                                multiplier:1.0
                                                                  constant:0];
    
    NSLayoutConstraint *blueY2 = [NSLayoutConstraint constraintWithItem:blueBoxView2
                                                                attribute:NSLayoutAttributeCenterY
                                                                relatedBy:NSLayoutRelationEqual
                                                                   toItem:self.framingView
                                                                attribute:NSLayoutAttributeCenterY
                                                               multiplier:0.5
                                                                 constant:0];
    
    
    
    NSLayoutConstraint *blueHeight2 = [NSLayoutConstraint constraintWithItem:blueBoxView2
                                                                   attribute:NSLayoutAttributeHeight
                                                                   relatedBy:NSLayoutRelationEqual
                                                                      toItem:nil
                                                                   attribute:NSLayoutAttributeNotAnAttribute
                                                                  multiplier:1
                                                                    constant:50];
    
    
    NSLayoutConstraint *blueWidth2 = [NSLayoutConstraint constraintWithItem:blueBoxView2
                                                                  attribute:NSLayoutAttributeWidth
                                                                  relatedBy:NSLayoutRelationEqual
                                                                     toItem:nil
                                                                  attribute:NSLayoutAttributeNotAnAttribute
                                                                 multiplier:1
                                                                   constant:50];
    
    
    [blueBoxView2 addConstraint:blueHeight2];
    [blueBoxView2 addConstraint:blueWidth2];
    [self.framingView addConstraint:blueX2];
    [self.framingView addConstraint:blueY2];
    self.blueBox2 = blueBoxView2;
    self.blueHeight2 = blueHeight2;
    self.blueWidth2 = blueWidth2;
 
   
    
    //BLUE BOX 3
    
    UIView *blueBoxView3 = [[UIView alloc] initWithFrame:blueBoxFrame];
    
    blueBoxView3.translatesAutoresizingMaskIntoConstraints = NO;
    blueBoxView3.backgroundColor = [UIColor blueColor];
    
    [self.framingView addSubview:blueBoxView3];
    
    
    NSLayoutConstraint *blueX3 =[NSLayoutConstraint constraintWithItem:blueBoxView3
                                                                 attribute:NSLayoutAttributeCenterX
                                                                 relatedBy:NSLayoutRelationEqual
                                                                    toItem:self.framingView
                                                                 attribute:NSLayoutAttributeCenterX
                                                                multiplier:1.0
                                                                  constant:0];
    
    NSLayoutConstraint *blueY3 = [NSLayoutConstraint constraintWithItem:blueBoxView3
                                                                attribute:NSLayoutAttributeCenterY
                                                                relatedBy:NSLayoutRelationEqual
                                                                   toItem:self.framingView
                                                                attribute:NSLayoutAttributeCenterY
                                                               multiplier:1.5
                                                                 constant:0];
    
    
    
    NSLayoutConstraint *blueHeight3 = [NSLayoutConstraint constraintWithItem:blueBoxView3
                                                                   attribute:NSLayoutAttributeHeight
                                                                   relatedBy:NSLayoutRelationEqual
                                                                      toItem:nil
                                                                   attribute:NSLayoutAttributeNotAnAttribute
                                                                  multiplier:1
                                                                    constant:50];
    
    
    NSLayoutConstraint *blueWidth3 = [NSLayoutConstraint constraintWithItem:blueBoxView3
                                                                  attribute:NSLayoutAttributeWidth
                                                                  relatedBy:NSLayoutRelationEqual
                                                                     toItem:nil
                                                                  attribute:NSLayoutAttributeNotAnAttribute
                                                                 multiplier:1
                                                                   constant:50];
    
    
    [blueBoxView3 addConstraint:blueHeight3];
    [blueBoxView3 addConstraint:blueWidth3];
    [self.framingView addConstraint:blueX3];
    [self.framingView addConstraint:blueY3];
    self.blueBox2 = blueBoxView3;
    self.blueHeight2 = blueHeight3;
    self.blueWidth2 = blueWidth3;

}



- (void)resizeFramingView:(id)sender
{
    CGFloat newWidth = 0.0;
    CGFloat newHeight = 0.0;
    
    if (sender == self.squareButton) {
        newWidth = 500.0;
        newHeight = 500.0;
    } else if (sender == self.portraitButton) {
        newWidth = 350.0;
        newHeight = 550.0;
    } else if (sender == self.landscapeButton) {
        newWidth = 900.0;
        newHeight = 300.0;
    }
    
    [UIView animateWithDuration:2.0 animations:^(){
        self.framingViewHeight.constant = newHeight;
        self.framingViewWidth.constant = newWidth;
        [self.view layoutIfNeeded];
    }];
}

@end
