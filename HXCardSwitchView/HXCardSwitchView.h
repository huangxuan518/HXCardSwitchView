//
//  HXCardSwitchView.h
//  HXCardSwitchView
//
//  Created by 黄轩 on 16/2/2.
//  Copyright © 2016年 黄轩 blog.libuqing.com. All rights reserved.
//

#import <UIKit/UIKit.h>

#define HXUIColorWithHex(hexValue) [UIColor colorWithRed:((float)((hexValue & 0xFF0000) >> 16))/255.0 \
green:((float)((hexValue & 0xFF00) >> 8))/255.0 \
blue:((float)(hexValue & 0xFF))/255.0 alpha:1]

@class HXCardSwitchView;

@protocol HXCardSwitchViewDelegate <NSObject>

- (void)cardSwitchViewDidScroll:(HXCardSwitchView *)cardSwitchView index:(NSInteger)index;

@end

@interface HXCardSwitchView : UIView <UIScrollViewDelegate>

@property (nonatomic,assign) id<HXCardSwitchViewDelegate> delegate;
@property (nonatomic,strong) UIScrollView *cardSwitchScrollView;
@property (nonatomic,assign) float currentIndex;

- (void)setCardSwitchViewAry:(NSArray *)cardSwitchViewAry delegate:(id)delegate;

@end
