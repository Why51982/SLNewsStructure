//
//  SLSideView.m
//  网易新闻
//
//  Created by CHEUNGYuk Hang Raymond on 16/5/10.
//  Copyright © 2016年 CHEUNGYuk Hang Raymond. All rights reserved.
//

#import "SLSideView.h"
#import "UIImage+SLExtension.h"

@interface SLSideView ()

@property (nonatomic, strong)UIButton *selectedButton;

@end

@implementation SLSideView

- (instancetype)initWithFrame:(CGRect)frame {
    
    if (self = [super initWithFrame:frame]) {
        
        CGFloat alpha = 0.2;
        
        [self setupButtonWithIcon:@"sidebar_nav_news" title:@"新闻" backgroundColor:SLColorWithRGBA(202, 68, 73, alpha)];
        [self setupButtonWithIcon:@"sidebar_nav_reading" title:@"订阅" backgroundColor:SLColorWithRGBA(190, 111, 69, alpha)];
        [self setupButtonWithIcon:@"sidebar_nav_photo" title:@"图片" backgroundColor:SLColorWithRGBA(76, 132, 190, alpha)];
        [self setupButtonWithIcon:@"sidebar_nav_video" title:@"视频" backgroundColor:SLColorWithRGBA(101, 170, 78, alpha)];
        [self setupButtonWithIcon:@"sidebar_nav_comment" title:@"跟帖" backgroundColor:SLColorWithRGBA(170, 172, 73, alpha)];
        [self setupButtonWithIcon:@"sidebar_nav_radio" title:@"电台" backgroundColor:SLColorWithRGBA(190, 62, 119, alpha)];
    }
    return self;
}

- (UIButton *)setupButtonWithIcon:(NSString *)icon title:(NSString *)title backgroundColor:(UIColor  *)backgroundColor {
    
    UIButton *sideButton = [[UIButton alloc] init];
    [sideButton addTarget:self action:@selector(sideButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [sideButton setImage:[UIImage imageNamed:icon] forState:UIControlStateNormal];
    [sideButton setTitle:title forState:UIControlStateNormal];
    sideButton.titleLabel.textColor = [UIColor whiteColor];
    sideButton.titleLabel.font = [UIFont systemFontOfSize:17];
    [sideButton setBackgroundImage:[UIImage imageWithColor:backgroundColor] forState:UIControlStateSelected];
    [self addSubview:sideButton];
    
    //设置内容左对齐
    sideButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    
    //设置高亮的时候，图片不会变色
    sideButton.adjustsImageWhenHighlighted = NO;
    
    //设置图片和文字间的间隔
    sideButton.contentEdgeInsets = UIEdgeInsetsMake(0, 30, 0, 0);
    sideButton.titleEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);
    
    return sideButton;
}

#pragma mark -- 按钮点击事件
- (void)sideButtonClick:(UIButton *)button {
    
    if ([self.delegate respondsToSelector:@selector(sideView:didSelectedButtonFromIndex:toIndex:)]) {
        [self.delegate sideView:self didSelectedButtonFromIndex:(int)self.selectedButton.tag toIndex:(int)button.tag];
    }
    
    //设置按钮的选中状态
    self.selectedButton.selected = NO;
    button.selected = YES;
    self.selectedButton = button;
}

#pragma mark -- 设置button的尺寸
- (void)layoutSubviews {
    
    [super layoutSubviews];
    int btnCount = (int)self.subviews.count;
    CGFloat btnW = self.width;
    CGFloat btnH = self.height / btnCount;
    for (int i = 0 ; i < btnCount; i++) {
        UIButton *button = self.subviews[i];
        button.tag = i;
        button.width = btnW;
        button.height = btnH;
        button.y = i * btnH;
    }
}

- (void)setDelegate:(id<SLSideViewDelegate>)delegate {
    
    _delegate = delegate;
    [self sideButtonClick:[self.subviews firstObject]];
}

@end
