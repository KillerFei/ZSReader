//
//  AppDelegate.h
//  ZSReader
//
//  Created by yuepengfei on 17/6/14.
//  Copyright © 2017年 fly. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ZSBaseNavController;

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (nonatomic, strong) ZSBaseNavController *rootNav;

@end

