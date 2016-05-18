//
//  SLNavigationController.m
//  网易新闻
//
//  Created by CHEUNGYuk Hang Raymond on 16/5/10.
//  Copyright © 2016年 CHEUNGYuk Hang Raymond. All rights reserved.
//

#import "SLNavigationController.h"
#import "SLNavigationBar.h"

@implementation SLNavigationController


+ (void)initialize {
    
    UINavigationBar *appearance = [UINavigationBar appearance];
    [appearance setBackgroundImage:[UIImage imageNamed:@"top_navigation_background"] forBarMetrics:UIBarMetricsDefault];
}

//使用KVC来改变navigationBar来达到改变leftBarButtonItem到屏幕边缘的目的
- (void)viewDidLoad {
    
    [super viewDidLoad];
    [self setValue:[[SLNavigationBar alloc] init] forKeyPath:@"navigationBar"];
}

- (void)viewDidAppear:(BOOL)animated {
    
    [super viewDidAppear:animated];
    
//    for (UIButton *button in self.navigationBar.subviews) {
//        if (![button isKindOfClass:[UIButton class]]) continue;
//        
//        if (button.centerX < self.navigationBar.centerX) {
//            button.x = 0;
//        } else if (button.centerX > self.navigationBar.centerX) {
//            button.x = self.view.width - button.width;
//        }
//    }
}

//用此2种方法不能修改leftBarButtonItem到屏幕边缘的距离，打印的数据来看，改变了button的x的值，但是没有达到目的
- (void)viewDidLayoutSubviews {
    
    [super viewDidLayoutSubviews];
    
//    for (UIButton *button in self.navigationBar.subviews) {
//        if (![button isKindOfClass:[UIButton class]]) continue;
//        
//        if (button.centerX < self.navigationBar.centerX) {
//            NSLog(@"%@", NSStringFromCGRect(button.frame));
//            button.x = 0;
//            NSLog(@"%@", NSStringFromCGRect(button.frame));
//        } else if (button.centerX > self.navigationBar.centerX) {
//            button.x = self.view.width - button.width;
//        }
//    }
}

@end
