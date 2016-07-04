//
//  SXViewController.m
//  108 - 特殊布局
//
//  Created by 董 尚先 on 15/3/20.
//  Copyright (c) 2015年 shangxianDante. All rights reserved.
//

#import "SXLineView.h"
#import "SXLineLayout.h"
#import "SXImageCell.h"

@interface SXLineView () <UICollectionViewDataSource, UICollectionViewDelegate>
/** 所有的图片名 */
@property (nonatomic, strong) NSMutableArray *images;
@property (nonatomic, strong) UICollectionView *collectionView;

@end

@implementation SXLineView

static NSString *const ID = @"image";

- (id)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self setup];
    }
    
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super initWithCoder:aDecoder]) {
        [self setup];
    }
    
    return self;
}

- (void)setup {
    // 创建布局
    SXLineLayout *layout = [[SXLineLayout alloc] init];
    
    // 创建collectionView
    _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height) collectionViewLayout:layout];
    _collectionView.dataSource = self;
    _collectionView.delegate = self;
    [_collectionView registerNib:[UINib nibWithNibName:@"SXImageCell" bundle:nil] forCellWithReuseIdentifier:ID];
    [self addSubview:_collectionView];
}

#pragma mark - <UICollectionViewDataSource>
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.images.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    SXImageCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:ID forIndexPath:indexPath];
    cell.image = self.images[indexPath.item];
    return cell;
}

#pragma mark - <UICollectionViewDelegate>
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
//    // 删除图片名
//    [self.images removeObjectAtIndex:indexPath.item];
//    
//    // 刷新数据
//    //    [self.collectionView reloadData];
//    
//    // 直接将cell删除
//    [_collectionView deleteItemsAtIndexPaths:@[indexPath]];
}

#pragma mark - 懒加载

- (NSMutableArray *)images
{
    if (!_images) {
        self.images = [[NSMutableArray alloc] init];
        
        for (int i = 1; i<=12; i++) {
            [self.images addObject:[NSString stringWithFormat:@"%d", i]];
        }
    }
    return _images;
}

@end
