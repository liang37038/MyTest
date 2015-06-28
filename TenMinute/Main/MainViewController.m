//
//  MainViewController.m
//  TenMinute
//
//  Created by sasukiliang on 15/5/20.
//  Copyright (c) 2015年 Liang. All rights reserved.
//

#import "MainViewController.h"
#import "NavigationView.h"
#import "XBClipView.h"

static const CGFloat NAV_HEIGHT = 64;

@interface MainViewController ()<NavigationViewDelegate,UIScrollViewDelegate>
{
    NSMutableArray *itemArray;
    
    NavigationView *navigationView;
    
    UIScrollView *contentScrollView;
    
    NSInteger currentIndex;
    
    BOOL draggingByHand;
    
    CGFloat screenWidth;
    CGFloat screenHeight;
    
    CGFloat currentOffset;
}
@end

@implementation MainViewController


-(instancetype)init{
    
    if(self = [super init]){
        
        [self setupDefault];
    }
    return self;
}

-(instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
    
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        [self setupDefault];
    }
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupSubViewControllers];
    [self setupNavigationView];
    [self setupOtherViews];
    
    [self setAutomaticallyAdjustsScrollViewInsets:NO];
    
    [navigationView setCurrentPage:1];
}


-(void)setupNavigationView{
    XBClipView *clipView = [[XBClipView alloc]initWithFrame:CGRectMake(0, 0, screenWidth, NAV_HEIGHT)];

    navigationView = [[NavigationView alloc]initWithFrame:CGRectMake(screenWidth/2 - screenWidth/3/2, 0, screenWidth/3, NAV_HEIGHT)];
    
    [navigationView setClipsToBounds:NO];
    [navigationView setNavigationViewDelegate:self];
    
    UIImageView *blueBar = [[UIImageView alloc]initWithFrame:CGRectMake((screenWidth/2 - 40), navigationView.frame.size.height - 5, 80, 5)];
    
    [blueBar setImage:[UIImage imageNamed:@"blue_bar.png"]];
    [clipView setScrollView:navigationView];
    [clipView addSubview:navigationView];
    [clipView addSubview:blueBar];
    [self.view addSubview:clipView];

}

//配置所有包含的VC
-(void)setupSubViewControllers{

    if (_subViewControllers) {
        for (UIViewController *subViewController in _subViewControllers) {
            [itemArray addObject:subViewController.title];
        }
    }
}

-(void)setupOtherViews{
    contentScrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, navigationView.frame.size.height,[[UIScreen mainScreen]bounds].size.width,self.view.frame.size.height)];
    
    [contentScrollView setDelegate:self];
    [contentScrollView setPagingEnabled:YES];
    [contentScrollView setBounces:NO];
    [contentScrollView setAlwaysBounceVertical:YES];
    
    for (int i = 0 ; i < [_subViewControllers count]; i++) {
        
        TabBaseViewController *subViewController = [_subViewControllers objectAtIndex:i];
        if ([subViewController respondsToSelector:@selector(setMainViewController:)]) {
            [subViewController setMainViewController:self];
        }
        [subViewController.view setFrame:CGRectMake(i * contentScrollView.frame.size.width, 0, contentScrollView.frame.size.width, contentScrollView.frame.size.height)];
        
        [contentScrollView addSubview:subViewController.view];
        [contentScrollView setContentSize:CGSizeMake((i+1) * contentScrollView.frame.size.width, subViewController.view.frame.size.height)];
    }
    
    [self resetContentSizeOfIndex:0];
    [self.view addSubview:contentScrollView];
}

-(void)setupDefault{
    itemArray = [NSMutableArray array];
    screenWidth = [[UIScreen mainScreen]bounds].size.width;
    screenHeight =[[UIScreen mainScreen]bounds].size.height;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:NO];
}

-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:NO];
}

//根据index重新设置对应页面的contentSize
-(void)resetContentSizeOfIndex:(NSInteger)index{
    
    UIViewController *subViewController = [_subViewControllers objectAtIndex:index];
    
    [contentScrollView setContentSize:CGSizeMake(contentScrollView.contentSize.width, subViewController.view.frame.size.height)];
}


#pragma mark - 导航栏代理
-(NSInteger)numberOfItemCount{
    return [itemArray count];
}

-(void)navigationView:(NavigationView *)view didScrollOffset:(CGFloat)offset{
    
    CGFloat ratio = offset * contentScrollView.frame.size.width / view.frame.size.width;
    
    currentIndex = round(ratio/contentScrollView.frame.size.width);
    
    if(ratio <= 0){
        [contentScrollView setContentOffset:CGPointMake(0, contentScrollView.contentOffset.y)];
    }else if(ratio >= contentScrollView.contentSize.width * 4/5){
        [contentScrollView setContentOffset:CGPointMake(contentScrollView.contentOffset.x, contentScrollView.contentOffset.y)];
    }else{
        [contentScrollView setContentOffset:CGPointMake(ratio, contentScrollView.contentOffset.y)];
    }
    
}

-(UIView *)navigationView:(NavigationView *)view viewOnIndex:(NSInteger)index{
    
    AUIAnimatableLabel *label = [[AUIAnimatableLabel alloc]init];
    [label setText:[itemArray objectAtIndex:index]];
    [label setTextColor:[UIColor whiteColor]];
    [label setFont:[UIFont systemFontOfSize:13]];
    [label setTextAlignment:NSTextAlignmentCenter];
    [label setVerticalTextAlignment:AUITextVerticalAlignmentCenter];
    
    return label;
}

-(void)navigationView:(NavigationView *)view didSelectedItemOnIndex:(NSInteger)index{
    
    if (currentIndex != index) {
        
        NSInteger delta = index - currentIndex;
        
        CGPoint oldOffset = contentScrollView.contentOffset;
        
        CGPoint offset = CGPointMake(oldOffset.x + delta * contentScrollView.frame.size.width, 0);
        
        [contentScrollView setContentOffset:offset animated:YES];
        
        currentIndex = index;
    }
}

#pragma mark - ScrollView Delegate

-(void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    draggingByHand = YES;
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    CGFloat offsetX = scrollView.contentOffset.x;
    
    if (navigationView.direction == DragStop) {
        if (offsetX - currentOffset > 0) {
            [navigationView setDirection:DragLeft];
        }else{
            [navigationView setDirection:DragRight];
        }
    }
    
    if(draggingByHand){
        [navigationView changeNavigationOffset:offsetX];
    }
    
    currentOffset = offsetX;
}

-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    //获取当前索引
    NSInteger index = round(scrollView.contentOffset.x / scrollView.frame.size.width);
    
    [navigationView setNavigationIndex:index];
    
    [navigationView changeFontSizeOfIndex:index];
    
    [navigationView setDirection:DragStop];
    
    currentIndex = index;
    
    draggingByHand = NO;
    
    currentOffset = 0;
    
    [self resetContentSizeOfIndex:index];
    
    
    
}

@end
