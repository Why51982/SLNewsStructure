//
//  SLSideView.h
//  网易新闻
//
//  Created by CHEUNGYuk Hang Raymond on 16/5/10.
//  Copyright © 2016年 CHEUNGYuk Hang Raymond. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SLSideView;

@protocol SLSideViewDelegate <NSObject>

- (void)sideView:(SLSideView *)sideView didSelectedButtonFromIndex:(int)fromIndex toIndex:(int)toIndex;
@end


@interface SLSideView : UIView

@property (nonatomic, weak) id<SLSideViewDelegate>delegate;

@end
