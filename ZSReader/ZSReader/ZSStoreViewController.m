//
//  ZSStoreViewController.m
//  ZSReader
//
//  Created by yuepengfei on 17/6/14.
//  Copyright © 2017年 fly. All rights reserved.
//

#import "ZSStoreViewController.h"
#import "ZSRankViewController.h"
#import "AppDelegate.h"
#import "UIViewController+WXSTransition.h"
#import "ZSCateViewController.h"
#import "ZSSearchViewController.h"

@interface ZSStoreViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) NSMutableArray *dataSoure;
@property (nonatomic, strong) UITableView *myTab;
@end

@implementation ZSStoreViewController

- (NSMutableArray *)dataSoure
{
    if (!_dataSoure) {
        _dataSoure = [[NSMutableArray alloc] initWithObjects:@"搜索",@"排行",@"主题书单",@"分类",@"随机看书",nil];
    }
    return _dataSoure;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    _myTab = [[UITableView alloc] initWithFrame:CGRectMake(0, 20, CGRectGetWidth(self.view.bounds), CGRectGetHeight(self.view.bounds)) style:UITableViewStylePlain];
    _myTab.dataSource = self;
    _myTab.delegate   = self;
    _myTab.tableFooterView = [[UIView alloc] init];
    [_myTab registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cellID"];
    [self.view addSubview:_myTab];
}
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES];
}
- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}
#pragma mark - tabbleView
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 49;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataSoure.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellID"];
    cell.textLabel.text = self.dataSoure[indexPath.row];
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    switch (indexPath.row) {
        case 0:{
            ZSSearchViewController *searchVC = [[ZSSearchViewController alloc] init];
            ZSBaseNavController  *searchNav = [[ZSBaseNavController alloc] initWithRootViewController:searchVC];
            [[UIApplication sharedApplication].keyWindow.rootViewController wxs_presentViewController:searchNav animationType:WXSTransitionAnimationTypeSysRevealFromRight completion:nil];
        }
            break;
            
        case 1: {
            ZSRankViewController *rankVC = [[ZSRankViewController alloc] init];
            ZSBaseNavController  *rankNav = [[ZSBaseNavController alloc] initWithRootViewController:rankVC];
            [[UIApplication sharedApplication].keyWindow.rootViewController wxs_presentViewController:rankNav animationType:WXSTransitionAnimationTypeSysRevealFromRight completion:nil];
        }
            break;
        case 2: {
            ZSCateViewController *cateVC = [[ZSCateViewController alloc] init];
            ZSBaseNavController  *cateNav = [[ZSBaseNavController alloc] initWithRootViewController:cateVC];
            [[UIApplication sharedApplication].keyWindow.rootViewController wxs_presentViewController:cateNav animationType:WXSTransitionAnimationTypeViewMoveToNextVC completion:nil];
        }
            break;
        default:
            break;
    }
}
@end
