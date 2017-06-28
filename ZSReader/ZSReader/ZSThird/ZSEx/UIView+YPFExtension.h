//
//  UIView+YPFExtension.h
//  wjnx
//
//  Created by yuepengfei on 16/6/21.
//  Copyright © 2016年 jinkelei. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (YPFExtension)

- (void)setYpf_top:(CGFloat)ypf_top;
- (CGFloat)ypf_top;

- (void)setYpf_left:(CGFloat)ypf_left;
- (CGFloat)ypf_left;

- (void)setYpf_bottom:(CGFloat)ypf_bottom;
- (CGFloat)ypf_bottom;

- (void)setYpf_right:(CGFloat)ypf_right;
- (CGFloat)ypf_right;

- (void)setYpf_width:(CGFloat)ypf_width;
- (CGFloat)ypf_width;

- (void)setYpf_height:(CGFloat)ypf_height;
- (CGFloat)ypf_height;

- (void)setYpf_centerX:(CGFloat)ypf_centerX;
- (CGFloat)ypf_centerX;

- (void)setYpf_centerY:(CGFloat)ypf_centerY;
- (CGFloat)ypf_centerY;

-(void)setYpf_size:(CGSize)ypf_size;
- (CGSize)ypf_size;

- (void)setYpf_origin:(CGPoint)ypf_origin;
- (CGPoint)ypf_origin;

@end
