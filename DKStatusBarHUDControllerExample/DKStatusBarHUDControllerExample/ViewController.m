//
//  ViewController.m
//  DKStatusBarHUDControllerExample
//
//  Created by 丁科 on 16/5/26.
//  Copyright © 2016年 b. All rights reserved.
//

#import "ViewController.h"
#import "DKStatusBarHUDController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)success {
    
    [DKStatusBarHUDController showMessage:@"加载成功" andImage:[UIImage imageNamed:@"DKStatusBarHUDController.bundle/success"]];
}


- (IBAction)error {
    
    [DKStatusBarHUDController showMessage:@"加载失败" andImage:[UIImage imageNamed:@"DKStatusBarHUDController.bundle/error"]];
}


- (IBAction)loading {
    
    [DKStatusBarHUDController showLoading:@"正在加载"];
}


- (IBAction)hide {
    
    [DKStatusBarHUDController hideStatusBar];
}


- (IBAction)normalMessage {
    
    [DKStatusBarHUDController showMessage:@"加载成功"];
}


@end
