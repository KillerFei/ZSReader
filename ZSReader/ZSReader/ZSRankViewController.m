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
@end

@implementation ZSRankViewController
- (UIView *)headView
{
    if (!_headView) {
        _headView = [[UIView alloc] initWithFrame:CGRectMake(0, 64, KSCREEN_WIDTH, 40)];
//        _headView.backgroundColor = ZS_Base_BgGrayColor;
        UIButton *maleBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, (KSCREEN_WIDTH-0.5)/2, 40)];
        [maleBtn setTitle:@"男生" forState:UIControlStateNormal];
        [maleBtn setTitleColor:ZS_Base_TitleColor forState:UIControlStateNormal];
//        maleBtn.backgroundColor = ZS_Base_BgGrayColor;
        UIButton *femaleBtn = [[UIButton alloc] initWithFrame:CGRectMake((KSCREEN_WIDTH-0.5)/2+0.5, 0, (KSCREEN_WIDTH-0.5)/2, 40)];
        [femaleBtn setTitle:@"女生" forState:UIControlStateNormal];
        [femaleBtn setTitleColor:ZS_Base_TitleColor forState:UIControlStateNormal];
//        femaleBtn.backgroundColor = ZS_Base_BgGrayColor;
        UIView *verLineView = [[UIView alloc] initWithFrame:CGRectMake((KSCREEN_WIDTH-0.5)/2, 10, 0.5, 20)];
        verLineView.backgroundColor = RGB(179, 179, 179);
        UIView *horLineView = [[UIView alloc] initWithFrame:CGRectMake(0, 39.5, KSCREEN_WIDTH, 0.5)];
        horLineView.backgroundColor = RGB(179, 179, 179);
        [_headView addSubview:maleBtn];
        [_headView addSubview:femaleBtn];
        [_headView addSubview:verLineView];
        [_headView addSubview:horLineView];
    }
    return _headView;
}
- (UITableView *)rankTab
{
    if (!_rankTab) {
        _rankTab = [[UITableView alloc] initWithFrame:CGRectMake(0, 64+40, 80, KSCREEN_HEIGHT-64-40) style:UITableViewStylePlain];
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
    if (cell == _preSelectCell) {
        cell.contentView.backgroundColor = ZS_Base_BgGrayColor;
    }
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (_preSelectCell) {
        _preSelectCell.contentView.backgroundColor = ZS_Base_BgGrayColor;
    }
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    _preSelectCell = cell;
    if (tableView == _rankTab) {
        
        cell.contentView.backgroundColor = [UIColor whiteColor];
    }
}
@end
