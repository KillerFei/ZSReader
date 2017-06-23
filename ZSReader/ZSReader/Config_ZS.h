//
//  Config_ZS.h
//  ZSReader
//
//  Created by yuepengfei on 17/6/15.
//  Copyright © 2017年 fly. All rights reserved.
//

#ifndef Config_ZS_h
#define Config_ZS_h

#define kAppName                  @"追书小说"
#define kAppUrl                   @"itms-apps://itunes.apple.com/app/id1232126821"
#define kUMAppKey                 @"59127aac45297d3b1c002333"
#define kQQAppId                  @"1106156590"
#define kQQAppKey                 @"CH7ygTCDZafhKOwG"
// key
#define kZSLastVersionKey         @"lastVersion"
#define kZSVersionCommentKey      @"versionCommentKey"
#define kZSRemoveLaunchViewNoti   @"removeLaunchViewNoti"
#define kZSFirstVersionKey        @"firstVersionKey"
#define kZSReadFoodCount          @"readFoodCount"
#define kZSEditLoadingNoti        @"editLoadingNoti"

//----------------------UI类--------------------------
//RGB颜色
#define RGBA(r,g,b,a)              [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:a]
#define RGB(r,g,b)                 RGBA(r,g,b,1.0f)

//Font字体
#define SYSTEM_FONT(F)             [UIFont systemFontOfSize:F]
#define BOLD_FONT(F)               [UIFont boldSystemFontOfSize:F]


//#define ZS_Nav_TitleColor          RGB(106, 106, 106)
#define ZS_Nav_TitleColor          RGB(93, 109, 121)
#define ZS_Nav_TitleFont           BOLD_FONT(16)

//#define YC_Base_TitleColor         RGB(106, 106, 106)
#define ZS_Base_TitleColor         RGB(93, 109, 121)
#define ZS_Base_TitleFont          SYSTEM_FONT(15)



#define ZS_Base_ContentColor       RGB(149, 149, 149)
#define ZS_Base_ContentFont        SYSTEM_FONT(13)

//#define YC_Base_BgGrayColor        RGB(241, 242, 243)
#define ZS_Base_BgGrayColor        RGB(239, 239, 239)
#define ZS_Base_LineColor          RGB(225, 225, 225)

#define ZS_Line_Count              3.f
#define ZS_Base_Space              5.f
#define ZS_Base_Scale              KSCREEN_WIDTH/375.f
//基本UI
#define ZS_TabBar_SeleteColor      RGB(43, 157, 204)
#define ZS_Base_GrayEdgeColor      RGB(179, 179, 179)
//----------------------设备类--------------------------
//获取屏幕 宽度、高度
#define KSCREEN_WIDTH              ([UIScreen mainScreen].bounds.size.width)
#define KSCREEN_HEIGHT             ([UIScreen mainScreen].bounds.size.height)

#define IS_IPAD         (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
#define IS_IPHONE       (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)

#define SCREEN_MAX_LENGTH       (MAX(KSCREEN_WIDTH, KSCREEN_HEIGHT))

#define IS_IPHONE_4_OR_LESS     (IS_IPHONE && SCREEN_MAX_LENGTH < 568.0)
#define IS_IPHONE_5             (IS_IPHONE && SCREEN_MAX_LENGTH == 568.0)
#define IS_IPHONE_6             (IS_IPHONE && SCREEN_MAX_LENGTH == 667.0)
#define IS_IPHONE_6P            (IS_IPHONE && SCREEN_MAX_LENGTH == 736.0)

//----------------------－引用－----------------------------
//Block
#define WS(weakSelf)            __weak   __typeof(&*self)weakSelf       = self

#define WeakSelf(weakSelf)      __weak   __typeof(&*self)weakSelf       = self
#define StrongSelf(strongSelf)  __strong __typeof(&*weakSelf)strongSelf = weakSelf

//----------------------数据判空----------------------------
//字符串是否为空
#define kStringIsEmpty(str) ([str isKindOfClass:[NSNull class]] || str == nil || [str length] < 1 ? YES : NO )
//数组是否为空
#define kArrayIsEmpty(array) (array == nil || [array isKindOfClass:[NSNull class]] || array.count == 0)
//字典是否为空
#define kDictIsEmpty(dic) (dic == nil || [dic isKindOfClass:[NSNull class]] || dic.allKeys == 0 ? YES : NO)
//是否是空对象
#define kObjectIsEmpty(_object) (_object == nil \
|| [_object isKindOfClass:[NSNull class]] \
|| ([_object respondsToSelector:@selector(length)] && [(NSData *)_object length] == 0) \
|| ([_object respondsToSelector:@selector(count)] && [(NSArray *)_object count] == 0))

#define kApplication        [UIApplication sharedApplication]
#define kKeyWindow          [UIApplication sharedApplication].keyWindow
#define kAppDelegate        [UIApplication sharedApplication].delegate
#define kUserDefaults       [NSUserDefaults standardUserDefaults]
#define kNotificationCenter [NSNotificationCenter defaultCenter]
#define kAppVersion         [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"]

#endif /* Config_ZS_h */
