//
//  ZSCateViewController.m
//  ZSReader
//
//  Created by yuepengfei on 17/6/20.
//  Copyright © 2017年 fly. All rights reserved.
//

#import "ZSCateViewController.h"
#import "ZSCateCollectionViewCell.h"
@interface ZSCateViewController ()<UICollectionViewDelegate, UICollectionViewDataSource>

@property (nonatomic, strong) UICollectionView *myCollecV;
@property (nonatomic, strong) NSMutableArray   *dataSource;

@end

@implementation ZSCateViewController

- (UICollectionView *)myCollecV
{
    if (!_myCollecV) {
        
        UICollectionViewFlowLayout *layOut = [[UICollectionViewFlowLayout alloc] init];
        layOut.minimumLineSpacing = 0;
        layOut.minimumInteritemSpacing = 0;
        layOut.sectionInset = UIEdgeInsetsMake(0, 0, 10, 0);
        layOut.itemSize = CGSizeMake(KSCREEN_WIDTH/3.f, 60);
        layOut.headerReferenceSize = CGSizeMake(KSCREEN_WIDTH, 50);
        _myCollecV = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:layOut];
        _myCollecV.backgroundColor = [UIColor whiteColor];
        [_myCollecV registerClass:[ZSCateCollectionViewCell class] forCellWithReuseIdentifier:@"cellID"];
        [_myCollecV registerClass:[ZSCateCollectionHeaderView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"headerID"];
        _myCollecV.delegate = self;
        _myCollecV.dataSource = self;
    }
    return _myCollecV;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.myCollecV];
    [self setLeftNavItem];
    self.navigationItem.title = @"分类";
}
- (void)doBack
{
    [[UIApplication sharedApplication].keyWindow.rootViewController dismissViewControllerAnimated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - collectV
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 100;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    ZSCateCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cellID" forIndexPath:indexPath];
    [cell resetLineWithRow:indexPath.row];
    return cell;
}
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    if (kind != UICollectionElementKindSectionHeader) return nil;
    ZSCateCollectionHeaderView *headerV = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"headerID" forIndexPath:indexPath];
    return headerV;
}

@end
