//
//  ZSBaseNavController.m
//  ZSReader
//
//  Created by yuepengfei on 17/6/14.
//  Copyright © 2017年 fly. All rights reserved.
//

#import "ZSBaseNavController.h"

@interface ZSBaseNavController ()

@end

@implementation ZSBaseNavController

- (void)viewDidLoad {
    [super viewDidLoad];
    [[UINavigationBar appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName:ZS_Nav_TitleColor, NSFontAttributeName:ZS_Nav_TitleFont}];
    [[UINavigationBar appearance] setBackgroundImage:[[UIImage imageNamed:@"zs_navbar_bg"] stretchableImageWithLeftCapWidth:3 topCapHeight:3]  forBarMetrics:UIBarMetricsDefault];
//    [[UINavigationBar appearance] setShadowImage:[UIImage new]];
    UIImageView *lineView = [self findHairlineImageViewUnder:self.navigationBar];
    UIView *diyLine = [[UIView alloc] initWithFrame:CGRectMake(0, 0, KSCREEN_WIDTH, 0.5)];
    diyLine.backgroundColor = ZS_Base_LineColor;
    [lineView addSubview:diyLine];
}
- (UIImageView *)findHairlineImageViewUnder:(UIView *)view {
    if ([view isKindOfClass:UIImageView.class] && view.bounds.size.height <= 1.0) {
        return (UIImageView *)view;
    }
    for (UIView *subview in view.subviews) {
        UIImageView *imageView = [self findHairlineImageViewUnder:subview];
        if (imageView) {
            return imageView;
        }
    }
    return nil;
}
@end
