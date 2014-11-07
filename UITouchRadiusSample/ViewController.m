//
//  ViewController.m
//  UITouchRadiusSample
//
//  Created by ohtaisao on 2014/11/06.
//  Copyright (c) 2014年 isao. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    UIView *touchCircle;
    UIView *touchCircleRadius;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    touchCircle = [[UIView alloc] init];
    [self setTouchRadius:CGPointMake(0, 0) and_radius:100];
    [touchCircle setBackgroundColor:[UIColor blueColor]];
    
    touchCircleRadius = [[UIView alloc] init];
    [self setTouchRadius:CGPointMake(200, 200) and_radius:1];
    [self.view addSubview:touchCircleRadius];
    [touchCircleRadius setBackgroundColor:[UIColor blueColor]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch* touch = [[touches allObjects] objectAtIndex:0];
    CGPoint touchPos = [touch locationInView:self.view];
    [self setTouchRadius:touchPos and_radius:touch.majorRadius];
    [self.view addSubview:touchCircle];
}

-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch* touch = [[touches allObjects] objectAtIndex:0];
    CGPoint touchPos = [touch locationInView:self.view];
    [self setTouchRadius:touchPos and_radius:touch.majorRadius];
}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    [touchCircle removeFromSuperview];
    
}

-(void)setTouchRadius:(CGPoint )pos and_radius:(CGFloat )radius
{
    CGRect touchRect = CGRectMake(pos.x + 50, pos.y, radius, radius);
    [touchCircle setFrame:touchRect];
    touchCircle.layer.cornerRadius = radius/2;
    
    CGRect touchCircleRadius_rect = CGRectMake(200, 200, radius, radius);
    [touchCircleRadius setFrame:touchCircleRadius_rect];
    touchCircleRadius.layer.cornerRadius = radius/2;
}

@end
