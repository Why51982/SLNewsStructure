//
//  UIImage+SLExtension.m
//  网易新闻
//
//  Created by CHEUNGYuk Hang Raymond on 16/5/10.
//  Copyright © 2016年 CHEUNGYuk Hang Raymond. All rights reserved.
//

#import "UIImage+SLExtension.h"

@implementation UIImage (SLExtension)

+ (UIImage *)imageWithColor:(UIColor *)color {
    
    CGFloat imageW = 100;
    CGFloat imageH = 100;
    /**
     *  创建位图上下文
     *
     *  @param CGSize size 创建出指定bitmap的大小
     *  @param BOOL opaque 设置是否透明，yes为透明，no为不透明
     *  @param CGFloat scale 代表是否缩放，0代表不缩放
     *
     *  创建出来的bitmap就代表一个UIImage
     */
    UIGraphicsBeginImageContextWithOptions(CGSizeMake(imageW, imageH), NO, 0.0);
    
    //画一个颜色的矩形框
    [color set];  //设置颜色
    UIRectFill(CGRectMake(0, 0, imageW, imageH));
    
    //得到图片
    UIImage *colorImage = UIGraphicsGetImageFromCurrentImageContext();

    //关闭位图上下文
    UIGraphicsEndImageContext();
    
    return colorImage;
}

@end
