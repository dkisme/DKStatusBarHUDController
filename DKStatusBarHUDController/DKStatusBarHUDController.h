//
//  DKStatusBarHUDController.h
//  DKStatusBarHUD
//
//  Created by 丁科 on 16/5/26.
//  Copyright © 2016年 b. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DKStatusBarHUDController : UIViewController

/** 显示普通信息 */
+ (void)showMessage:(NSString *)message;

/** 显示普通信息和图片 */
+ (void)showMessage:(NSString *)message andImage:(UIImage *)image;

/** 显示成功信息 */
+ (void)showSuccess:(NSString *)SuccessMesssage;

/** 显示失败信息 */
+ (void)showError:(NSString *)ErrorMessage;

/** 显示正在处理信息 */
+ (void)showLoading:(NSString *)LoadingMessage;

/** 隐藏指示器 */
+ (void)hideStatusBar;


@end
