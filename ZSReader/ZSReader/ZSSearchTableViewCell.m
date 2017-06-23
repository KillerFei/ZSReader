//
//  ZSSearchTableViewCell.m
//  ZSReader
//
//  Created by yuepengfei on 17/6/22.
//  Copyright © 2017年 fly. All rights reserved.
//

#import "ZSSearchTableViewCell.h"

#define kCellMargin             10.f
@implementation ZSSearchTableViewCell

{
    UILabel  *_noResultLabel;
    NSMutableArray *_keyBtnArr;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        _keyBtnArr = [[NSMutableArray alloc] initWithCapacity:0];
        
        _noResultLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 50, KSCREEN_WIDTH, 50)];
        _noResultLabel.text = @"暂无数据";
        _noResultLabel.textAlignment = NSTextAlignmentCenter;
        _noResultLabel.textColor = ZS_Base_TitleColor;
        [self.contentView addSubview:_noResultLabel];
    }
    return self;
}
- (void)setUpKeys:(NSArray *)keys
{
    if (keys.count == 0) {
        _noResultLabel.hidden = NO;
        return;
    }
    if (!kArrayIsEmpty(_keyBtnArr)) {
        for (UIButton *btn in _keyBtnArr) {
            [btn removeFromSuperview];
        }
    }
    [_keyBtnArr removeAllObjects];
    _noResultLabel.hidden = YES;
    CGFloat totalWidth = 0;
    CGFloat height     = kCellMargin;
    for (NSString *title in keys) {
        
        UIButton *searchBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [searchBtn setTitleColor:ZS_Base_TitleColor forState:UIControlStateNormal];
        [searchBtn addTarget:self action:@selector(searchBtn:) forControlEvents:UIControlEventTouchUpInside];
        searchBtn.titleLabel.font = [UIFont systemFontOfSize:15];
        [searchBtn setTitle:title forState:UIControlStateNormal];
        [self.contentView addSubview:searchBtn];
        [_keyBtnArr addObject:searchBtn];
        CGFloat titleWidth =  [title boundingRectWithSize:CGSizeMake(MAXFLOAT, 15) options:NSStringDrawingUsesFontLeading|NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:15]} context:nil].size.width+28;
        if (totalWidth + titleWidth >= KSCREEN_WIDTH-30) {
            height = height+25+kCellMargin ;
            totalWidth = titleWidth+kCellMargin;
            searchBtn.frame     = CGRectMake(15, height, titleWidth, 25);
        } else {
            totalWidth += kCellMargin;
            searchBtn.frame     = CGRectMake(totalWidth, height, titleWidth, 25);
            totalWidth += titleWidth;
        }
        searchBtn.layer.masksToBounds = YES;
        searchBtn.layer.cornerRadius = 5;
        searchBtn.layer.borderWidth  = .5f;
        searchBtn.layer.borderColor = ZS_Base_ContentColor.CGColor;
        
    }
}
+ (CGFloat)calCellHeightWithKeys:(NSArray *)keys
{
    if (keys.count == 0) return 50;
    CGFloat height = kCellMargin;
    CGFloat totalWidth = 0;
    for (NSString *title in keys) {
        CGFloat titleWidth =  [title boundingRectWithSize:CGSizeMake(MAXFLOAT, 15) options:NSStringDrawingUsesFontLeading|NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:15]} context:nil].size.width+28;
        
        if (totalWidth + titleWidth >= KSCREEN_WIDTH-30) {
            height = height+25+kCellMargin;
            totalWidth = titleWidth+kCellMargin;
        } else {
            totalWidth += titleWidth;
            totalWidth += kCellMargin;
        }
    }
    height = height+25+kCellMargin;
    return height;
}


@end
