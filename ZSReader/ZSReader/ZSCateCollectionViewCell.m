//
//  ZSCateCollectionViewCell.m
//  ZSReader
//
//  Created by yuepengfei on 17/6/20.
//  Copyright © 2017年 fly. All rights reserved.
//

#import "ZSCateCollectionViewCell.h"

@implementation ZSCateCollectionHeaderView
{
    UILabel *_titleLab;
    UIView  *_lineV;
}
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _titleLab = [[UILabel alloc] initWithFrame:CGRectMake(15, 0, KSCREEN_WIDTH, 49.5)];
        _titleLab.text = @"男生";
        _titleLab.font = ZS_Base_TitleFont;
        _titleLab.textColor = ZS_Base_TitleColor;
        [self addSubview:_titleLab];
        
        _lineV = [[UIView alloc] initWithFrame:CGRectMake(0, 49.5, KSCREEN_WIDTH, 0.5)];
        _lineV.backgroundColor = ZS_Base_LineColor;
        [self addSubview:_lineV];
    }
    return self;
}
@end

@interface ZSCateCollectionViewCell ()

@property (nonatomic, strong) UILabel *titleLab;
@property (nonatomic, strong) UILabel *countLab;
@property (nonatomic, strong) UIView  *verLineV;
@property (nonatomic, strong) UIView  *horLineV;
@end
@implementation ZSCateCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        _titleLab = [[UILabel alloc] initWithFrame:CGRectMake(0, 15, CGRectGetWidth(frame), 20)];
        _titleLab.text = @"雪中悍刀行";
        _titleLab.font = ZS_Base_TitleFont;
        _titleLab.textColor = ZS_Base_TitleColor;
        _titleLab.textAlignment = NSTextAlignmentCenter;
        [self.contentView addSubview:_titleLab];
        
        _countLab = [[UILabel alloc] initWithFrame:CGRectMake(0, 35, CGRectGetWidth(frame), 15)];
        _countLab.text = @"102475本";
        _countLab.font = ZS_Base_ContentFont;
        _countLab.textColor = ZS_Base_ContentColor;
        _countLab.textAlignment = NSTextAlignmentCenter;
        [self.contentView addSubview:_countLab];
    
        _verLineV = [[UIView alloc] initWithFrame:CGRectMake(CGRectGetWidth(frame)-0.5, 0, 0.5, CGRectGetHeight(frame))];
        _verLineV.backgroundColor = ZS_Base_LineColor;
        [self.contentView addSubview:_verLineV];
        
        _horLineV = [[UIView alloc] initWithFrame:CGRectMake(0, CGRectGetHeight(frame)-0.5, CGRectGetWidth(frame), 0.5)];
        _horLineV.backgroundColor = ZS_Base_LineColor;
        [self.contentView addSubview:_horLineV];
    }
    return self;
}

- (void)resetLineWithRow:(NSInteger)row
{
    if (row%3 != 2) {
        _verLineV.hidden = NO;
    } else {
        _verLineV.hidden = YES;
    }
}
@end
