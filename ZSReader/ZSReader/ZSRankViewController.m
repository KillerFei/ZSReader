//
//  ZSRankViewController.m
//  ZSReader
//
//  Created by yuepengfei on 17/6/19.
//  Copyright © 2017年 fly. All rights reserved.
//

#import "ZSRankViewController.h"

@interface ZSRankViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView     *rankTab;
@property (nonatomic, strong) NSArray         *rankData;
@property (nonatomic, strong) UITableView     *listTab;
@property (nonatomic, strong) UIView          *headView;
@property (nonatomic, strong) NSIndexPath     *preSelectIndex;
@property (nonatomic, strong) UIView          *dynamicView;
@property (nonatomic, strong) UIButton        *preBtn;
@end

@implementation ZSRankViewController
- (UIView *)headView
{
    if (!_headView) {
        _headView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, KSCREEN_WIDTH, 40)];
//        _headView.backgroundColor = ZS_Base_BgGrayColor;
        UIButton *maleBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, (KSCREEN_WIDTH-0.5)/2, 40)];
        [maleBtn setTitle:@"男生" forState:UIControlStateNormal];
        [maleBtn setTitleColor:ZS_Base_TitleColor forState:UIControlStateNormal];
        [maleBtn addTarget:self action:@selector(genderBtnAction:) forControlEvents:UIControlEventTouchUpInside];
        _preBtn = maleBtn;
        _preBtn.userInteractionEnabled = NO;
        
//        maleBtn.backgroundColor = ZS_Base_BgGrayColor;
        UIButton *femaleBtn = [[UIButton alloc] initWithFrame:CGRectMake((KSCREEN_WIDTH-0.5)/2+0.5, 0, (KSCREEN_WIDTH-0.5)/2, 40)];
        [femaleBtn setTitle:@"女生" forState:UIControlStateNormal];
        [femaleBtn setTitleColor:ZS_Base_TitleColor forState:UIControlStateNormal];
        [femaleBtn addTarget:self action:@selector(genderBtnAction:) forControlEvents:UIControlEventTouchUpInside];
        
        
//        femaleBtn.backgroundColor = ZS_Base_BgGrayColor;
        UIView *verLineView = [[UIView alloc] initWithFrame:CGRectMake((KSCREEN_WIDTH-0.5)/2, 10, 0.5, 20)];
        verLineView.backgroundColor = ZS_Base_LineColor;
        UIView *horLineView = [[UIView alloc] initWithFrame:CGRectMake(0, 39, KSCREEN_WIDTH, 0.5)];
        horLineView.backgroundColor = ZS_Base_LineColor;
        
        _dynamicView = [[UIView alloc] initWithFrame:CGRectMake(0, 37.5, (KSCREEN_WIDTH-0.5)/2, 2)];
        _dynamicView.backgroundColor = [UIColor orangeColor];
        
        [_headView addSubview:maleBtn];
        [_headView addSubview:femaleBtn];
        [_headView addSubview:verLineView];
        [_headView addSubview:horLineView];
        [_headView addSubview:_dynamicView];
    }
    return _headView;
}
- (void)genderBtnAction:(UIButton *)sender
{
    _dynamicView.center = CGPointMake(CGRectGetMidX(sender.frame), CGRectGetMidY(_dynamicView.frame));
    _preBtn.userInteractionEnabled = YES;
    _preBtn = sender;
    _preBtn.userInteractionEnabled = NO;
    UITableViewCell *cell = [_rankTab cellForRowAtIndexPath:_preSelectIndex];
    cell.contentView.backgroundColor = ZS_Base_BgGrayColor;
    _preSelectIndex = [NSIndexPath indexPathForRow:0 inSection:0];
    cell = [_rankTab cellForRowAtIndexPath:_preSelectIndex];
    cell.contentView.backgroundColor = [UIColor whiteColor];
}
- (UITableView *)rankTab
{
    if (!_rankTab) {
        _rankTab = [[UITableView alloc] initWithFrame:CGRectMake(0, 40, 80, KSCREEN_HEIGHT-64-40) style:UITableViewStylePlain];
        _rankTab.delegate = self;
        _rankTab.dataSource = self;
        _rankTab.showsVerticalScrollIndicator = NO;
        _rankTab.backgroundColor = ZS_Base_BgGrayColor;
        _rankTab.separatorStyle = UITableViewCellSeparatorStyleNone;
        [_rankTab registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cellID"];
    }
    return _rankTab;
}
- (UITableView *)listTab
{
    if (!_listTab) {
        _listTab = [[UITableView alloc] initWithFrame:CGRectMake(80, 64+40, KSCREEN_WIDTH-80, KSCREEN_HEIGHT-64-40) style:UITableViewStylePlain];
//        _listTab.delegate = self;
//        _listTab.dataSource = self;
        _listTab.showsVerticalScrollIndicator = NO;
        _listTab.separatorStyle = UITableViewCellSeparatorStyleNone;
        [_listTab registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cellID"];
    }
    return _listTab;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.rankData = @[@"最热榜",@"留存榜",@"完结榜",@"包月榜",@"潜力榜",@"其他榜",@"圣诞榜",@"百度榜",@"掌阅榜",@"书旗榜",@"17K",@"起点榜",@"纵横榜",@"和阅榜",@"逐浪榜"];
    [self.view addSubview:self.headView];
    [self.view addSubview:self.rankTab];
    [self.view addSubview:self.listTab];
    [self setLeftNavItem];
    self.navigationItem.title = @"排行榜";
}
- (void)doBack
{
    [[UIApplication sharedApplication].keyWindow.rootViewController dismissViewControllerAnimated:YES completion:nil];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.rankData.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellID"];
    cell.textLabel.font = ZS_Base_TitleFont;
    cell.textLabel.textColor = ZS_Base_TitleColor;
    cell.textLabel.text = self.rankData[indexPath.row];
    cell.contentView.backgroundColor = ZS_Base_BgGrayColor;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}
- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (_preSelectIndex) {
        if (_preSelectIndex == indexPath) {
            cell.contentView.backgroundColor = [UIColor whiteColor];
        } else {
            cell.contentView.backgroundColor = ZS_Base_BgGrayColor;
        }
    } else {
        if (indexPath.row == 0) {
            cell.contentView.backgroundColor = [UIColor whiteColor];
            _preSelectIndex = indexPath;
        }
    }
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (tableView == _rankTab) {
        UITableViewCell *preCell = [tableView cellForRowAtIndexPath:_preSelectIndex];
        preCell.contentView.backgroundColor = ZS_Base_BgGrayColor;
        UITableViewCell *cell    = [tableView cellForRowAtIndexPath:indexPath];
        cell.contentView.backgroundColor = [UIColor whiteColor];
        _preSelectIndex = indexPath;
    }
}
@end
