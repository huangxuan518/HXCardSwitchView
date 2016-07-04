//
//  SXImageCell.m
//  108 - 特殊布局
//
//  Created by 董 尚先 on 15/3/20.
//  Copyright (c) 2015年 shangxianDante. All rights reserved.
//

#import "SXImageCell.h"

@interface SXImageCell()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@end

@implementation SXImageCell

- (void)awakeFromNib {
    self.imageView.layer.borderWidth = 5;
    self.imageView.layer.borderColor = [UIColor whiteColor].CGColor;
    self.imageView.layer.cornerRadius = 5;
    self.imageView.clipsToBounds = YES;
    ////    self.imageView.layer.masksToBounds = YES;
}

- (void)setImage:(NSString *)image
{
    _image = [image copy];
    
    self.imageView.image = [UIImage imageNamed:image];
}

@end
