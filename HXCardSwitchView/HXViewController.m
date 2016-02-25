//
//  HXViewController.m
//  HXFelicity
//
//  Created by 黄轩 on 16/2/2.
//  Copyright © 2016年 黄轩 blog.libuqing.com. All rights reserved.
//

#import "HXViewController.h"
#import "HXCardSwitchView.h"

@interface HXViewController ()

@property (nonatomic,strong) UILabel *titleLabel;
@property (nonatomic,strong) UILabel *detailLabel;
@property (nonatomic,strong) HXCardSwitchView *cardSwitchView;
@property (nonatomic,strong) UIView *bottomView;
@property (nonatomic,assign) NSInteger currentIndex;
@property (nonatomic,strong) NSArray *dicAry;

@end

@implementation HXViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"我的福气";
    self.view.backgroundColor = HXUIColorWithHex(0x1f0c30);
    
    _dicAry = @[@{@"isColloct":@(YES),
                               @"title":@"富强福",
                               @"image":@"fu_guoqiang",
                               @"grayImage":@"fu_guoqiang_gray",
                               @"smallImage":@"fu_guoqiang_thumb",
                               @"smallGrayImage":@"fu_guoqiang_thumb_gray"},
                             
                             @{@"isColloct":@(NO),
                               @"title":@"和谐福",
                               @"image":@"fu_jiahe",
                               @"grayImage":@"fu_jiahe_gray",
                               @"smallImage":@"fu_jiahe_thumb",
                               @"smallGrayImage":@"fu_jiahe_thumb_gray"},
                             
                             @{@"isColloct":@(YES),
                               @"title":@"友善福",
                               @"image":@"fu_youai",
                               @"grayImage":@"fu_youai_gray",
                               @"smallImage":@"fu_youai_thumb",
                               @"smallGrayImage":@"fu_youai_thumb_gray"},
                             
                             @{@"isColloct":@(YES),
                               @"title":@"寿康福",
                               @"image":@"fu_shoukang",
                               @"grayImage":@"fu_shoukang_gray",
                               @"smallImage":@"fu_shoukang_thumb",
                               @"smallGrayImage":@"fu_shoukang_thumb_gray"},
                             
                             @{@"isColloct":@(NO),
                               @"title":@"财旺福",
                               @"image":@"fu_caiwang",
                               @"grayImage":@"fu_caiwang_gray",
                               @"smallImage":@"fu_caiwang_thumb",
                               @"smallGrayImage":@"fu_caiwang_thumb_gray"}];
    
    [self addTitleAndDetailLabel];
    
    [self addFelicityView];
    
    [self addBottomView];
}

- (void)addTitleAndDetailLabel {
    _titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 80, self.view.frame.size.width, 23)];
    _titleLabel.textAlignment = NSTextAlignmentCenter;
    _titleLabel.text = @"集齐五福 平分2.15亿现金";
    _titleLabel.font = [UIFont boldSystemFontOfSize:23];
    _titleLabel.textColor = HXUIColorWithHex(0xfcd369);
    [self.view addSubview:_titleLabel];
    
    _detailLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, _titleLabel.frame.origin.y + _titleLabel.frame.size.height + 10, self.view.frame.size.width, 11)];
    _detailLabel.textAlignment = NSTextAlignmentCenter;
    _detailLabel.text = @"6,360人已集齐,2月8日00:18开奖";
    _detailLabel.font = [UIFont systemFontOfSize:11];
    _detailLabel.textColor = HXUIColorWithHex(0xfcd369);
    [self.view addSubview:_detailLabel];
}

- (void)addFelicityView {
    _cardSwitchView = [[HXCardSwitchView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 312)];
    [_cardSwitchView setCardSwitchViewAry:[self ittemsCardSwitchViewAry] delegate:self];
    [self.view addSubview:_cardSwitchView];
}

/**
 *  准备添加到卡片切换View上的View数组
 *
 *  @param felicityAry <#felicityAry description#>
 *
 *  @return <#return value description#>
 */
- (NSArray *)ittemsCardSwitchViewAry {
    NSMutableArray *ary = [NSMutableArray new];
    
    for (NSDictionary *felicityDic in _dicAry) {
        NSInteger index = [_dicAry indexOfObject:felicityDic];
        
        BOOL isColloct = [felicityDic[@"isColloct"] boolValue];
        
        NSString *title = felicityDic[@"title"];
        NSString *imageStr = felicityDic[@"image"];
        NSString *grayImageStr = felicityDic[@"grayImage"];
        
        UIImageView *backImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 230, 312)];
        backImageView.backgroundColor = isColloct ? HXUIColorWithHex(0xe75041) : HXUIColorWithHex(0xd1d1d1);
        backImageView.layer.masksToBounds = YES;
        backImageView.layer.cornerRadius = 4;
        backImageView.image = isColloct ? [UIImage imageNamed:@"fucard_bg"] : [UIImage imageNamed:@"fucard_bg_gray"];
        backImageView.tag = index;
        
        UIImage *image;
        if (isColloct) {
            image = [UIImage imageNamed:@"fu_head_border"];
        } else {
            image = [UIImage imageNamed:@"fu_head_border_gray"];
        }
        image = [image resizableImageWithCapInsets:UIEdgeInsetsMake(6, 9, 6, 9)];//上 左 下 右
        
        UIImageView *headImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 116, 37)];
        headImageView.center = CGPointMake(backImageView.frame.size.width/2, backImageView.frame.origin.y + headImageView.frame.size.height/2 + 10);
        headImageView.image = image;
        [backImageView addSubview:headImageView];
        
        UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, headImageView.frame.size.width, 18)];
        titleLabel.center = headImageView.center;
        titleLabel.textAlignment = NSTextAlignmentCenter;
        titleLabel.text = title;
        titleLabel.font = [UIFont systemFontOfSize:18];
        titleLabel.textColor = isColloct ? HXUIColorWithHex(0xffb170) : HXUIColorWithHex(0x898989);
        [backImageView addSubview:titleLabel];
        
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 170, 170)];
        imageView.center = CGPointMake(backImageView.frame.size.width/2, backImageView.center.y);
        imageView.image = isColloct ? [UIImage imageNamed:imageStr] : [UIImage imageNamed:grayImageStr];
        [backImageView addSubview:imageView];
        
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.frame = CGRectMake(0, 0, 175, 38);
        button.center = CGPointMake(backImageView.frame.size.width/2, backImageView.frame.size.height - button.frame.size.height/2 - 10);
        button.layer.masksToBounds = YES;
        button.layer.cornerRadius = 19;
        if (isColloct) {
            [button setTitle:@"送一张给朋友" forState:UIControlStateNormal];
            button.backgroundColor = HXUIColorWithHex(0xfcde69);
            [button setTitleColor:HXUIColorWithHex(0xd36236) forState:UIControlStateNormal];
        } else {
            [button setTitle:@"请朋友赐这张福" forState:UIControlStateNormal];
            button.backgroundColor = HXUIColorWithHex(0xeb6053);
            [button setTitleColor:HXUIColorWithHex(0xffffff) forState:UIControlStateNormal];
        }
        
        [backImageView addSubview:button];
        
        [ary addObject:backImageView];
    }
    return ary;
}

- (void)addBottomView {
    if (_bottomView.subviews.count > 0) {
        [_bottomView.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    }
    
    _bottomView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 90)];
    _bottomView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:_bottomView];
    
    float space = (self.view.frame.size.width - 49*_dicAry.count - 40)/(_dicAry.count-1);
    
    for (NSDictionary *felicityDic in _dicAry) {
        NSInteger index = [_dicAry indexOfObject:felicityDic];
        
        BOOL isColloct = [felicityDic[@"isColloct"] boolValue];
        
        NSString *title = felicityDic[@"title"];
        NSString *imageStr = felicityDic[@"smallImage"];
        NSString *grayImageStr = felicityDic[@"smallGrayImage"];
        
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(20+(49+space)*index, 2, 49, 49)];
        imageView.image = isColloct ? [UIImage imageNamed:imageStr] : [UIImage imageNamed:grayImageStr];
        [_bottomView addSubview:imageView];
        
        UIImageView *selectImageView = [[UIImageView alloc] initWithFrame:CGRectMake(imageView.frame.origin.x - 2, imageView.frame.origin.y - 2, 53, 53)];
        selectImageView.image = [UIImage imageNamed:@"fu_card_selected_border"];
        selectImageView.hidden = (index == _currentIndex) ? NO : YES;
        [_bottomView addSubview:selectImageView];
        
        UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 49, 14)];
        titleLabel.center = CGPointMake(imageView.center.x, imageView.center.y + imageView.frame.size.height/2 + 15);
        titleLabel.textAlignment = NSTextAlignmentCenter;
        titleLabel.text = title;
        titleLabel.font = [UIFont systemFontOfSize:14];
        titleLabel.textColor = isColloct ? HXUIColorWithHex(0xffb170) : HXUIColorWithHex(0x898989);
        [_bottomView addSubview:titleLabel];
    }
}

#pragma mark HXCardSwitchViewDelegate

- (void)cardSwitchViewDidScroll:(HXCardSwitchView *)cardSwitchView index:(NSInteger)index {
    NSLog(@"index:%ld",(long)index);
    _currentIndex = index;
    [self addBottomView];
}

-(void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    _bottomView.frame = CGRectMake(_bottomView.frame.origin.x, self.view.frame.size.height - _bottomView.frame.size.height, _bottomView.frame.size.width, _bottomView.frame.size.height);
    
    _titleLabel.frame = CGRectMake(_titleLabel.frame.origin.x, 100, _titleLabel.frame.size.width, _titleLabel.frame.size.height);
    _detailLabel.frame = CGRectMake(_detailLabel.frame.origin.x, _titleLabel.frame.origin.y + _titleLabel.frame.size.height + 10, _detailLabel.frame.size.width, _detailLabel.frame.size.height);
    
    float height = _titleLabel.frame.origin.y + _titleLabel.frame.size.height + 10 + _detailLabel.frame.size.height + 20 + _bottomView.frame.size.height + _cardSwitchView.frame.size.height;
    
    _cardSwitchView.frame = CGRectMake(_cardSwitchView.frame.origin.x, _detailLabel.frame.origin.y + _detailLabel.frame.size.height + 20 + (self.view.frame.size.height - height)/2, _cardSwitchView.frame.size.width, _cardSwitchView.frame.size.height);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
