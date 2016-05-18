//
//  SLMainViewController.m
//  网易新闻
//
//  Created by CHEUNGYuk Hang Raymond on 16/5/10.
//  Copyright © 2016年 CHEUNGYuk Hang Raymond. All rights reserved.
//

#import "SLMainViewController.h"
#import "SLNewsViewController.h"
#import "SLReadingViewController.h"
#import "SLNavigationController.h"
#import "UIBarButtonItem+SLExtension.h"
#import "SLTitleView.h"
#import "SLSideView.h"



#define SLAnimationDuration 0.25

@interface SLMainViewController ()<SLSideViewDelegate>

@property (nonatomic, weak) UIView *showingView;
@property (nonatomic, weak) UIButton *cover;

@end

@implementation SLMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //1.创建子控制器
    //1.1创建新闻控制器
    SLNewsViewController *news = [[SLNewsViewController alloc] init];
    [self setupViewController:news title:@"新闻"];
    
    //1.2创建订阅控制器
    SLReadingViewController *reading = [[SLReadingViewController alloc] init];
    [self setupViewController:reading title:@"阅读"];
    
    //1.3创建图片控制器
    UIViewController *photo = [[UIViewController alloc] init];
    photo.view.backgroundColor = [UIColor whiteColor];
    [self setupViewController:photo title:@"图片"];
    
    //1.4创建视频控制器
    UIViewController *video = [[UIViewController alloc] init];
    video.view.backgroundColor = [UIColor whiteColor];
    [self setupViewController:video title:@"视频"];
    
    //1.5创建跟帖控制器
    UIViewController *comment = [[UIViewController alloc] init];
    comment.view.backgroundColor = [UIColor whiteColor];
    [self setupViewController:comment title:@"跟帖"];
    
    //1.6创建电台控制器
    UIViewController *radio = [[UIViewController alloc] init];
    radio.view.backgroundColor = [UIColor whiteColor];
    [self setupViewController:radio title:@"电台"];
    
    
    SLSideView *sideView = [[SLSideView alloc] init];
    sideView.width = 200;
    CGFloat screenH = [UIScreen mainScreen].bounds.size.height;
    sideView.height = screenH * 0.6;
    sideView.y = 60;
    sideView.delegate = self;
    [self.view insertSubview:sideView atIndex:1];
}

- (void)setupViewController:(UIViewController *)viewController title:(NSString *)title {
    
    SLNavigationController *navigation = [[SLNavigationController alloc] initWithRootViewController:viewController];
    [self addChildViewController:navigation];
    
    UIBarButtonItem *leftButtonItem = [UIBarButtonItem barButtonItemWithIcon:@"top_navigation_menuicon" target:self action:@selector(leftSideButtonClick)];
    viewController.navigationItem.leftBarButtonItem = leftButtonItem;
    
    UIBarButtonItem *rightButtonItem = [UIBarButtonItem barButtonItemWithIcon:@"top_navigation_infoicon" target:self action:@selector(rightSideButtonClick)];
    viewController.navigationItem.rightBarButtonItem = rightButtonItem;
    
    SLTitleView *titleView = [[SLTitleView alloc] init];
    titleView.title = title;
    viewController.navigationItem.titleView = titleView;
}

#pragma mark -- 导航栏按钮点击
- (void)leftSideButtonClick {
    
    //获取当前要缩放的view
    UIView *showingView = self.showingView;
    
    //缩放比例
    CGFloat viewH = [UIScreen mainScreen].bounds.size.height - 2 * 60;
    CGFloat scale = viewH / [UIScreen mainScreen].bounds.size.height;
    
    //菜单左边的距离
    CGFloat leftMargin = [UIScreen mainScreen].bounds.size.width * (1 - scale) * 0.5;
    CGFloat translationX = 200 - leftMargin;
    
    //菜单顶部的距离
    CGFloat topMargin = [UIScreen mainScreen].bounds.size.height * (1 - scale) * 0.5;
    CGFloat translationY = topMargin - 60;
    
    [UIView animateWithDuration:SLAnimationDuration animations:^{
        
        //缩放
        CGAffineTransform scaleTransform = CGAffineTransformMakeScale(scale, scale);
        //平移
        CGAffineTransform transformTransform = CGAffineTransformTranslate(scaleTransform, translationX / scale, translationY / scale);
        showingView.transform = transformTransform;
        
        UIButton *cover = [[UIButton alloc] init];
        cover.frame = showingView.bounds;
        [cover addTarget:self action:@selector(coverClick:) forControlEvents:UIControlEventTouchUpInside];
        self.cover = cover;
        [showingView addSubview:cover];
    }];
}

#pragma mark -- 导航栏按钮点击事件
- (void)coverClick:(UIButton *)button {
    
    [button removeFromSuperview];
    [UIView animateWithDuration:SLAnimationDuration animations:^{
        self.showingView.transform = CGAffineTransformIdentity;
    }];
}

- (void)rightSideButtonClick {
    NSLog(@"rightSideButtonClick");
}


#pragma mark -- <SLSideViewDelegate>
- (void)sideView:(SLSideView *)sideView didSelectedButtonFromIndex:(int)fromIndex toIndex:(int)toIndex {
    //获得旧的控制器
    SLNavigationController *oldNav = self.childViewControllers[fromIndex];
    [oldNav.view removeFromSuperview];
    
    if (self.cover) {
        [self.cover removeFromSuperview];
    }
    
    //获得新的控制器
    SLNavigationController *newNav = self.childViewControllers[toIndex];
    newNav.view.transform = oldNav.view.transform;
    [self.view addSubview:newNav.view];
    
    //记录下显示的View
    self.showingView = newNav.view;
    
    //设置阴影
    newNav.view.layer.shadowColor = [UIColor whiteColor].CGColor;
    newNav.view.layer.shadowOffset = CGSizeMake(-3, 0);
    newNav.view.layer.shadowOpacity = 0.2;
    
    [UIView animateWithDuration:SLAnimationDuration animations:^{
        newNav.view.transform = CGAffineTransformIdentity;
    }];
}

//修改上面状态栏的颜色
- (UIStatusBarStyle)preferredStatusBarStyle {
    
    return UIStatusBarStyleLightContent;
}

@end
