//
//  UIBarButtonItem+SLExtension.h
//  网易新闻
//
//  Created by CHEUNGYuk Hang Raymond on 16/5/10.
//  Copyright © 2016年 CHEUNGYuk Hang Raymond. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (SLExtension)

+ (instancetype)barButtonItemWithIcon:(NSString *)icon target:(id)target action:(SEL)action;

@end
