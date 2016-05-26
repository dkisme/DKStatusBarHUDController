//
//  DKStatusBarHUDController.m
//  DKStatusBarHUD
//
//  Created by 丁科 on 16/5/26.
//  Copyright © 2016年 b. All rights reserved.
//

#import "DKStatusBarHUDController.h"

#define DKMessageFont [UIFont systemFontOfSize:12]

/** 指示器停留时间 */
static CGFloat const DKMessageDuration = 2.0;
/** 指示器的显示\隐藏动画时间 */
static CGFloat const DKAnimationDuration = 0.25;

@interface DKStatusBarHUDController ()

@end

@implementation DKStatusBarHUDController

static UIWindow *window_;
static NSTimer *timer_;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}


/** 显示窗口 */
+ (void)showWindow
{
    // 动画前的初始位置
    CGFloat windowH = 20;
    CGRect frame = CGRectMake(0, -windowH, [UIScreen mainScreen].bounds.size.width, windowH);
    
    // 显示窗口
    window_.hidden = YES;
    window_ = [[UIWindow alloc] init];
    window_.frame = frame;
    window_.windowLevel = UIWindowLevelAlert;
    window_.backgroundColor = [UIColor blackColor];
    window_.rootViewController = [[DKStatusBarHUDController alloc] init];
    window_.hidden = NO;
    
    // 添加动画
    frame.origin.y = 0;
    [UIView animateWithDuration:DKAnimationDuration animations:^{
        window_.frame = frame;
    }];
}


/** 显示普通信息和图片 */
+ (void)showMessage:(NSString *)message andImage:(UIImage *)image
{
    // 停止定时器
    [timer_ invalidate];
    
    // 显示窗口
    [self showWindow];
    
    // 添加按钮
    UIButton *statusBarBtn = [[UIButton alloc] init];
    // 按钮不能被点击
    statusBarBtn.userInteractionEnabled = NO;
    [statusBarBtn setTitle:message forState:UIControlStateNormal];
    statusBarBtn.titleLabel.font = DKMessageFont;
    if (image) {
        [statusBarBtn setImage:image forState:UIControlStateNormal];
        statusBarBtn.titleEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);
    }
    statusBarBtn.frame = window_.bounds;
    [window_ addSubview:statusBarBtn];
//    NSLog(@"%@", NSStringFromCGRect(statusBarBtn.frame));
    // 添加定时器
   timer_ = [NSTimer scheduledTimerWithTimeInterval:DKMessageDuration target:self selector:@selector(hideStatusBar) userInfo:nil repeats:NO];
    
}


/** 显示普通信息 */
+ (void)showMessage:(NSString *)message
{
    [self showMessage:message andImage:nil];
}

///Users/dk13668801231/Desktop/一期百思不得姐/一期补充知识点/DKStatusBarHUD/DKStatusBarHUD/DKStatusBarHUDController/DKStatusBarHUDController.bundle
/** 显示成功信息 */
+ (void)showSuccess:(NSString *)SuccessMesssage
{
    [self showMessage:SuccessMesssage andImage:[UIImage imageNamed:@"DKStatusBarHUDController.bundle/success"]];
}


/** 显示失败信息 */
+ (void)showError:(NSString *)ErrorMessage
{
    [self showMessage:ErrorMessage andImage:[UIImage imageNamed:@"DKStatusBarHUDController.bundle/error"]];
}


/** 显示正在处理信息 */
+ (void)showLoading:(NSString *)LoadingMessage
{
    // 停止定时器
    [timer_ invalidate];
    timer_ = nil;
    
    // 显示窗口
    [self showWindow];
    
    // 添加文字
    UILabel *label = [[UILabel alloc] init];
    label.font = DKMessageFont;
    label.frame = window_.bounds;
    label.textAlignment = NSTextAlignmentCenter;;
    label.text = LoadingMessage;
    label.textColor = [UIColor whiteColor];
    [window_ addSubview:label];
    
    // 添加圆圈
    UIActivityIndicatorView *loadingView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
    [loadingView startAnimating];
    
    // 文字宽度
    CGFloat msgN = [LoadingMessage sizeWithAttributes:@{NSFontAttributeName : DKMessageFont}].width;
    CGFloat centerX = (window_.frame.size.width - msgN) *0.5 - 20;
    CGFloat centerY = window_.frame.size.height * 0.5;
    loadingView.center = CGPointMake(centerX, centerY);
    [window_ addSubview:loadingView];
    
}


/** 隐藏指示器 */
+ (void)hideStatusBar
{
    [UIView animateWithDuration:DKAnimationDuration animations:^{
        CGRect frame = window_.frame;
        frame.origin.y = - frame.size.height;
        window_.frame = frame;
    } completion:^(BOOL finished) {
        window_ = nil;
        timer_ = nil;
    }];

}



@end
