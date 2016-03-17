//
//  ViewController.m
//  转场动画
//
//  Created by sjpgod on 16/3/15.
//  Copyright (c) 2016年 sjpgod. All rights reserved.

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic,strong) UIImageView * redView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    // 图像显示
    UIImage *image = [UIImage imageNamed:@"110.jpg"];
    
    UIImageView *imageView = [[UIImageView alloc]initWithImage:image];
    imageView.frame = CGRectMake(100, 200, 200, 100);
    imageView.center = CGPointMake(160, 240);
    [self.view addSubview:imageView];
    
    
    /* 移动 */
    CABasicAnimation *animation1 =
    [CABasicAnimation animationWithKeyPath:@"transform.translation.y"];
    
    // 起止点的设定
    animation1.toValue = [NSNumber numberWithFloat:100];; // 終点
    
    
    /* 旋转 */
    CABasicAnimation *animation2 =
    [CABasicAnimation animationWithKeyPath:@"transform.rotation.x"];
    
    // 绕x轴转3圈
    animation2.toValue = [NSNumber numberWithFloat:6 * M_PI]; // 结束时的角度
    
    
    /* 动画组 */
    CAAnimationGroup *group = [CAAnimationGroup animation];
    group.delegate = self;
    group.duration = 5.0;
    group.repeatCount = 1;
    
    // 动画结束后不变回初始状态
    group.removedOnCompletion = NO;
    group.fillMode = kCAFillModeForwards;
    
    // 添加动画
    group.animations = [NSArray arrayWithObjects:animation1, animation2, nil];
    [imageView.layer addAnimation:group forKey:@"move-rotate-layer"];
}


/**
 * 动画开始时
 */
- (void)animationDidStart:(CAAnimation *)theAnimation
{
    NSLog(@"begin");
}

/**
 * 动画结束时
 */
- (void)animationDidStop:(CAAnimation *)theAnimation finished:(BOOL)flag
{
    NSLog(@"end");
}
@end
