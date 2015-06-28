//
//  TouchDemoViewController.m
//  TenMinute
//
//  Created by sasukiliang on 15/5/27.
//  Copyright (c) 2015年 Liang. All rights reserved.
//

#import "TouchDemoViewController.h"
#import "TouchDemoView.h"



@interface TouchDemoViewController ()
{
    
    UIView *customHeaderView;
    
    CGFloat lastOffsetY;
}
@end

@implementation TouchDemoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupView];
}

-(instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
    
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {

    }
    
    return self;
}

-(void)setupView{
    _touchView = [[TouchDemoView alloc]initWithFrame:[[UIScreen mainScreen] bounds]];
    [_touchView setTitle:_myTitle];
    [_touchView setDesc:_myDesc];
    [_touchView setHeaderPic:_myPic];
    
    [_touchView setXbScrollView:[self scrollView]];
    
    [_touchView setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    [self.view addSubview:_touchView];
    
    [self config];
    
    [self setAutomaticallyAdjustsScrollViewInsets:NO];
}

-(void)config{
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:_touchView attribute:NSLayoutAttributeTopMargin relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTop multiplier:1 constant:0]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:_touchView attribute:NSLayoutAttributeTrailingMargin relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTrailing multiplier:1 constant:0]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:_touchView attribute:NSLayoutAttributeLeadingMargin relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeLeading multiplier:1 constant:0]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:_touchView attribute:NSLayoutAttributeBottomMargin relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeBottomMargin multiplier:1 constant:0]];
}

-(void)viewWillAppear:(BOOL)animated{
    [self.navigationController setNavigationBarHidden:YES animated:YES];
    //恢复手势
    self.navigationController.interactivePopGestureRecognizer.delegate = (id) self;
}

-(void)viewWillDisappear:(BOOL)animated{
    [self.navigationController setNavigationBarHidden:NO animated:YES];
}

-(void)viewDidAppear:(BOOL)animated{
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - TableView Delegate

-(void)scrollViewDidScroll:(UIScrollView *)scrollView{

    if (scrollView.contentOffset.y > - 64) {
        [_touchView.headerView setFrame:CGRectMake(_touchView.headerView.frame.origin.x, _touchView.headerView.frame.origin.y, _touchView.headerView.frame.size.width,64)];
            [_touchView moveUpWithOffset:64];
    }else if(scrollView.contentOffset.y < -_touchView.headerHeight){
        [_touchView.headerView setFrame:CGRectMake(_touchView.headerView.frame.origin.x, _touchView.headerView.frame.origin.y, _touchView.headerView.frame.size.width,_touchView.headerHeight)];
        [_touchView moveUpWithOffset:_touchView.headerHeight];
    }else{
        [_touchView.headerView setFrame:CGRectMake(_touchView.headerView.frame.origin.x, _touchView.headerView.frame.origin.y, _touchView.headerView.frame.size.width,-scrollView.contentOffset.y)];
        [_touchView moveUpWithOffset:-scrollView.contentOffset.y];
    }
}

-(UIScrollView *)scrollView{
    
    return nil;
}

@end
