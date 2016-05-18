//
//  UIImage+SLExtension.h
//  网易新闻
//
//  Created by CHEUNGYuk Hang Raymond on 16/5/10.
//  Copyright © 2016年 CHEUNGYuk Hang Raymond. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (SLExtension)

/**
 *  创建纯色的图片
 *
 *  @param color 指定的颜色
 *
 *  @return 返回一张纯色的图片
 */
+ (UIImage *)imageWithColor:(UIColor *)color;

@end
