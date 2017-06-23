//
//  ZSSearchTableViewCell.h
//  ZSReader
//
//  Created by yuepengfei on 17/6/22.
//  Copyright © 2017年 fly. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZSSearchTableViewCell : UITableViewCell
- (void)setUpKeys:(NSArray *)keys;

+ (CGFloat)calCellHeightWithKeys:(NSArray *)keys;
@end
