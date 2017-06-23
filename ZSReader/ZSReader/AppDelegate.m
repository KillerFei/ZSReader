//
//  AppDelegate.m
//  ZSReader
//
//  Created by yuepengfei on 17/6/14.
//  Copyright © 2017年 fly. All rights reserved.
//

#import "AppDelegate.h"
#import <MMDrawerController.h>
#import "ZSBaseViewController.h"
#import "ZSShelfViewController.h"
#import "ZSMenuViewController.h"
#import "ZSStoreViewController.h"
#import "ZSBaseNavController.h"

@interface AppDelegate ()

@property (strong, nonatomic) MMDrawerController *mmController;

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    ZSShelfViewController *shelfVC = [[ZSShelfViewController alloc] init];
    ZSBaseNavController   *shelfNav = [[ZSBaseNavController alloc] initWithRootViewController:shelfVC];
    ZSMenuViewController *menuVC = [[ZSMenuViewController alloc] init];
    ZSStoreViewController *storeVC = [[ZSStoreViewController alloc] init];
    _mmController = [[MMDrawerController alloc] initWithCenterViewController:shelfNav leftDrawerViewController:menuVC rightDrawerViewController:storeVC];
    _mmController.centerHiddenInteractionMode = MMDrawerOpenCenterInteractionModeFull;
    _mmController.closeDrawerGestureModeMask = MMCloseDrawerGestureModeAll;
    _mmController.maximumLeftDrawerWidth  = 100;
    _mmController.maximumRightDrawerWidth = 250;
    
    _window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    _window.rootViewController = _mmController;
    [_window makeKeyAndVisible];
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
