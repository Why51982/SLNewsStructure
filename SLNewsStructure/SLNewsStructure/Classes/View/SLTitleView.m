//
//  SLTitleView.m
//  网易新闻
//
//  Created by CHEUNGYuk Hang Raymond on 16/5/10.
//  Copyright © 2016年 CHEUNGYuk Hang Raymond. All rights reserved.
//

#import "SLTitleView.h"

@implementation SLTitleView

- (instancetype)initWithFrame:(CGRect)frame {
    
    if (self = [super initWithFrame:frame]) {
        
        //不能点击
        self.userInteractionEnabled = NO;
        
        [self setImage:[UIImage imageNamed:@"navbar_netease"] forState:UIControlStateNormal];
        self.titleLabel.font = [UIFont systemFontOfSize:22];
        self.height = self.currentImage.size.height;
        self.titleEdgeInsets = UIEdgeInsetsMake(0, 5, 0, 0);
    }
    return self;
}

- (void)setTitle:(NSString *)title {
    _title = title;
    
    [self setTitle:title forState:UIControlStateNormal];
    
    NSDictionary *attrs = @{NSFontAttributeName : self.titleLabel.font};
    CGFloat titleW = [title boundingRectWithSize:CGSizeMake(MAXFLOAT, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:attrs context:nil].size.width;
    self.width = titleW + self.titleEdgeInsets.left + self.currentImage.size.width;
}

@end
