//
//  UIView+YPFExtension.m
//  wjnx
//
//  Created by yuepengfei on 16/6/21.
//  Copyright © 2016年 jinkelei. All rights reserved.
//

#import "UIView+YPFExtension.h"

@implementation UIView (PSFExtension)

- (void)setYpf_top:(CGFloat)ypf_top
{
    CGRect frame = self.frame;
    frame.origin.y = ypf_top;
    self.frame = frame;
}

- (CGFloat)ypf_top
{
    return self.frame.origin.y;
}

- (void)setYpf_left:(CGFloat)ypf_left
{
    CGRect frame = self.frame;
    frame.origin.x = ypf_left;
    self.frame = frame;
}

- (CGFloat)ypf_left
{
    return CGRectGetMinX(self.frame);
}

- (void)setYpf_bottom:(CGFloat)ypf_bottom
{
    CGRect frame = self.frame;
    frame.origin.y = ypf_bottom - CGRectGetHeight(self.frame);
    self.frame = frame;
}

- (CGFloat)ypf_bottom
{
    return CGRectGetMinY(self.frame) + CGRectGetHeight(self.frame);
}

- (void)setYpf_right:(CGFloat)ypf_right
{
    CGRect frame = self.frame;
    frame.origin.x = ypf_right - CGRectGetWidth(self.frame);
    self.frame = frame;
}

- (CGFloat)ypf_right
{
    return CGRectGetMinX(self.frame)+CGRectGetWidth(self.frame);
}

- (void)setYpf_width:(CGFloat)ypf_width
{
    CGRect frame = self.frame;
    frame.size.width = ypf_width;
    self.frame = frame;
}

- (CGFloat)ypf_width
{
    return CGRectGetWidth(self.frame);
}

- (void)setYpf_height:(CGFloat)ypf_height
{
    CGRect frame = self.frame;
    frame.size.height = ypf_height;
    self.frame = frame;
}
- (CGFloat)ypf_height
{
    return CGRectGetHeight(self.frame);
}
- (void)setYpf_centerX:(CGFloat)ypf_centerX
{
    CGPoint center = self.center;
    center.x = ypf_centerX;
    self.center = center;
}
- (CGFloat)ypf_centerX
{
    return CGRectGetMinX(self.frame);
}
- (void)setYpf_centerY:(CGFloat)ypf_centerY
{
    CGPoint center = self.center;
    center.y = ypf_centerY;
    self.center = center;
}
- (CGFloat)ypf_centerY
{
    return CGRectGetMidY(self.frame);
}

- (void)setYpf_size:(CGSize)ypf_size
{
    CGRect frame = self.frame;
    frame.size = ypf_size;
    self.frame = frame;
}
- (CGSize)ypf_size
{
    return self.frame.size;
}
- (void)setYpf_origin:(CGPoint)ypf_origin
{
    CGRect frame = self.frame;
    frame.origin = ypf_origin;
    self.frame = frame;
}
- (CGPoint)ypf_origin
{
    return self.frame.origin;
}

@end
