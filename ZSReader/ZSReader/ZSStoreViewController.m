//
//  ZSStoreViewController.m
//  ZSReader
//
//  Created by yuepengfei on 17/6/14.
//  Copyright © 2017年 fly. All rights reserved.
//

#import "ZSStoreViewController.h"
#import "ZSSearchViewController.h"
#import "ZSRankViewController.h"
#import "ZSCateViewController.h"
#import "UIViewController+WXSTransition.h"

@interface ZSStoreViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) NSMutableArray *dataSoure;
@property (nonatomic, strong) UITableView *myTab;
@property (nonatomic, strong) NSArray     *vcClass;
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
    [self setUpTabV];
    [self setUpVCClass];
}
- (void)setUpTabV
{
    self.view.backgroundColor = [UIColor whiteColor];
    _myTab = [[UITableView alloc] initWithFrame:CGRectMake(0, 20, CGRectGetWidth(self.view.bounds), CGRectGetHeight(self.view.bounds)) style:UITableViewStylePlain];
    _myTab.dataSource = self;
    _myTab.delegate   = self;
    _myTab.tableFooterView = [[UIView alloc] init];
    [_myTab registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cellID"];
    [self.view addSubview:_myTab];
}
- (void)setUpVCClass
{
    _vcClass = @[@"ZSSearchViewController", @"ZSRankViewController", @"ZSCateViewController"];
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
    ZSBaseViewController *vc = [[NSClassFromString(_vcClass[indexPath.row]) alloc] init];
    ZSBaseNavController *nav = [[ZSBaseNavController alloc] initWithRootViewController:vc];
    [[UIApplication sharedApplication].keyWindow.rootViewController wxs_presentViewController:nav animationType:WXSTransitionAnimationTypeSysRevealFromRight completion:nil];
}
@end
