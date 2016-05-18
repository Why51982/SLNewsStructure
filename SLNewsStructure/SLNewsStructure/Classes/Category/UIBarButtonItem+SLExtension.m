//
//  UIBarButtonItem+SLExtension.m
//  网易新闻
//
//  Created by CHEUNGYuk Hang Raymond on 16/5/10.
//  Copyright © 2016年 CHEUNGYuk Hang Raymond. All rights reserved.
//

#import "UIBarButtonItem+SLExtension.h"

@implementation UIBarButtonItem (SLExtension)

+ (instancetype)barButtonItemWithIcon:(NSString *)icon target:(id)target action:(SEL)action {
    
    UIButton *button = [[UIButton alloc] init];
    [button setImage:[UIImage imageNamed:icon] forState:UIControlStateNormal];
    button.frame = CGRectMake(0, 0, button.currentImage.size.width, button.currentImage.size.height);
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    return [[UIBarButtonItem alloc] initWithCustomView:button];
}

@end
