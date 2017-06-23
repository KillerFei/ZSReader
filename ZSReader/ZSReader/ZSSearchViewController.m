//
//  ZSSearchViewController.m
//  ZSReader
//
//  Created by yuepengfei on 17/6/22.
//  Copyright © 2017年 fly. All rights reserved.
//

#import "ZSSearchViewController.h"
#import "ZSSearchTableViewCell.h"

@interface ZSSearchViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) NSMutableArray *dataSource;
@property (nonatomic, strong) UITableView    *myTabV;
@end

@implementation ZSSearchViewController

- (UITableView *)myTabV
{
    if (!_myTabV) {
        _myTabV = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, KSCREEN_WIDTH, KSCREEN_HEIGHT) style:UITableViewStylePlain];
        _myTabV.delegate = self;
        _myTabV.dataSource = self;
        _myTabV.tableFooterView = [[UIView alloc] init];
        [_myTabV registerClass:[ZSSearchTableViewCell class] forCellReuseIdentifier:@"cellID"];
        [_myTabV registerClass:[UITableViewCell class] forCellReuseIdentifier:@"historyCellID"];
    }
    return _myTabV;
}
- (NSMutableArray *)dataSource
{
    if (!_dataSource) {
        _dataSource = [[NSMutableArray alloc] init];
        [_dataSource addObject:@[@"系统",@"重生",@"火影",@"洪荒",@"快穿",@"三国",@"都市",@"空间",@"海贼王",@"重生之穿越",@"末世",@"总裁",@"英雄联盟",@"武侠"]];
        [_dataSource addObject:@[@"白鹿原",@"重生豪门之强势归来",@"三生三世十里桃花",@"雪鹰领主",@"盛唐崛起",@"龙符"]];
        [_dataSource addObject:@[@"大主宰",@"择天记",@"完美世界"]];
    }
    return _dataSource;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self setLeftBackNavItem];
    [self.view addSubview:self.myTabV];
}
- (void)doBack
{
    [[UIApplication sharedApplication].keyWindow.rootViewController dismissViewControllerAnimated:YES completion:nil];
}
#pragma mark - table
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 44;
}
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    switch (section) {
        case 0:
            return @"搜索热词";
            break;
        case 1:
            return @"热门推荐";
            break;
        case 2:
            return @"搜索历史";
            break;
        default:
            break;
    }
    return nil;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section != 2) {
        return [ZSSearchTableViewCell calCellHeightWithKeys:self.dataSource[indexPath.section]];
    }
    return 44;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.dataSource.count;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section != 2) {
        return 1;
    }
    return [self.dataSource[section] count];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 2) {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"historyCellID"];
        cell.textLabel.text = self.dataSource[2][indexPath.row];
        return cell;
    }
    ZSSearchTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellID"];
    [cell setUpKeys:self.dataSource[indexPath.section]];
    return cell;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    if (scrollView == self.myTabV)
    {
        if (scrollView.contentOffset.y <= 44 && scrollView.contentOffset.y>=0) {
            scrollView.contentInset = UIEdgeInsetsMake(-scrollView.contentOffset.y, 0, 0, 0);
        } else if (scrollView.contentOffset.y >= 44) {
            scrollView.contentInset = UIEdgeInsetsMake(-44, 0, 0, 0);
        }
    }
}

@end
