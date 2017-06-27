//
//  ZSBaseViewController.h
//  ZSReader
//
//  Created by yuepengfei on 17/6/14.
//  Copyright © 2017年 fly. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZSBaseNavController.h"

@interface ZSBaseViewController : UIViewController

@property (nonatomic, strong) ZSBaseNavController *rootNav;
@property (nonatomic, strong) NSString *navTitle;

- (void)hideNavBar:(BOOL)isHide;
- (void)setLeftNavItem;
- (void)doBack;
@end
