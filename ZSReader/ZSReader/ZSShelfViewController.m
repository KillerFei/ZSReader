//
//  ZSShelfViewController.m
//  ZSReader
//
//  Created by yuepengfei on 17/6/14.
//  Copyright © 2017年 fly. All rights reserved.
//

#import "ZSShelfViewController.h"

@interface ZSShelfViewController ()

@end

@implementation ZSShelfViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpNav];
}
- (void)setUpNav
{
    self.navigationItem.title = kAppName;
    UIButton *rightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    rightBtn.frame = CGRectMake(0, 0, 60, 44);
    rightBtn.titleLabel.font = ZS_Nav_TitleFont;
    [rightBtn setTitle:@"书城" forState:UIControlStateNormal];
    [rightBtn setTitleColor:ZS_Nav_TitleColor forState:UIControlStateNormal];
    [rightBtn addTarget:self action:@selector(gotoStore) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:rightBtn];
    
    UIButton *leftBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    leftBtn.frame = CGRectMake(0, 0, 60, 44);
    leftBtn.titleLabel.font = ZS_Nav_TitleFont;
    [leftBtn setTitle:@"菜单" forState:UIControlStateNormal];
    [leftBtn setTitleColor:ZS_Nav_TitleColor forState:UIControlStateNormal];
    [leftBtn addTarget:self action:@selector(gotoMenu) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:leftBtn];
}
- (void)gotoStore
{
    [(MMDrawerController *)[UIApplication sharedApplication].keyWindow.rootViewController toggleDrawerSide:MMDrawerSideRight animated:YES completion:nil];
    
}
- (void)gotoMenu
{
    [(MMDrawerController *)[UIApplication sharedApplication].keyWindow.rootViewController toggleDrawerSide:MMDrawerSideLeft animated:YES completion:nil];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
@end
