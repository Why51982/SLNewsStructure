//
//  SLNavigationBar.m
//  网易新闻
//
//  Created by CHEUNGYuk Hang Raymond on 16/5/11.
//  Copyright © 2016年 CHEUNGYuk Hang Raymond. All rights reserved.
//

#import "SLNavigationBar.h"

@implementation SLNavigationBar


- (void)layoutSubviews {
    
    [super layoutSubviews];
    
    for (UIButton *button in self.subviews) {
        
        if (![button isKindOfClass:[UIButton class]]) continue;

        if (button.centerX < self.centerX) {
            button.x = 0;
        } else if (button.centerX > self.centerX) {
            button.x = self.width - button.width;
        }
    }
}

@end
