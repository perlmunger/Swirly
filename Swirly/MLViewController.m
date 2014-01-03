//
//  MLViewController.m
//  Swirly
//
//  Created by Matt Long on 1/2/14.
//  Copyright (c) 2014 Matt Long. All rights reserved.
//

#import "MLViewController.h"

@interface MLViewController ()

@end

@implementation MLViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    
    CAGradientLayer *gradientLayer = [CAGradientLayer layer];
    gradientLayer.bounds = CGRectMake(0.0f, 0.0f, 300.0f, 300.0f);
    gradientLayer.position = CGPointMake(500.0f, 500.0f);
    gradientLayer.colors = @[(id)[[UIColor blueColor] CGColor],
                             (id)[[UIColor clearColor] CGColor]];
    gradientLayer.borderWidth = 2.0f;
    
    gradientLayer.startPoint = CGPointMake(0.0f, 0.5f);
    gradientLayer.endPoint = CGPointMake(1.0f, 0.5f);
    
    CAShapeLayer *circleLayer = [CAShapeLayer layer];
    
    [circleLayer setPosition:CGPointMake(gradientLayer.bounds.size.width/2.0,
                 gradientLayer.bounds.size.height/2.0)];
    
    circleLayer.bounds = CGRectMake(0.0f, 0.0f, 280.0f, 280.0f);
    circleLayer.path = [[UIBezierPath bezierPathWithOvalInRect:CGRectMake(0.0f, 0.0f, 280.0f, 280.0f)] CGPath];
    circleLayer.backgroundColor = [[UIColor clearColor] CGColor];
    circleLayer.fillColor = [[UIColor clearColor] CGColor];
    circleLayer.strokeColor = [[UIColor blackColor] CGColor];
    circleLayer.strokeStart = 0.0f;
    circleLayer.strokeEnd = 0.75f;
    circleLayer.lineWidth = 5.0f;
    
    gradientLayer.mask = circleLayer;
    
    [self.view.layer addSublayer:gradientLayer];
    
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.rotation"];
    [animation setFromValue:[NSNumber numberWithFloat:0.0f]];
    [animation setToValue:[NSNumber numberWithFloat:2.0f * M_PI]];
    [animation setDuration:0.5];
    [animation setRepeatCount:HUGE_VALF];
    
    [gradientLayer addAnimation:animation forKey:@"transform.rotation"];
}


@end
