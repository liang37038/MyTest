//
//  AppDelegate.m
//  TenMinute
//
//  Created by sasukiliang on 15/5/20.
//  Copyright (c) 2015年 Liang. All rights reserved.
//

#import "AppDelegate.h"
#import "XBNavigationViewController.h"
#import "MainViewController.h"

#import "XBHomeViewController.h"
#import "XBFunnyViewController.h"
#import "XBWorldViewController.h"
#import "XBPlayViewController.h"
#import "XBMineViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
    
    MainViewController *mainVC = [[MainViewController alloc]init];

    XBHomeViewController *homeVC = [[XBHomeViewController alloc]initWithNibName:@"XBHomeViewController" bundle:nil];
    [homeVC setTitle:@"“L0单”"];
    XBFunnyViewController *homeVC1 = [[XBFunnyViewController alloc]initWithNibName:@"XBFunnyViewController" bundle:nil];
    [homeVC1 setTitle:@"趣味"];
    XBWorldViewController *homeVC2 = [[XBWorldViewController alloc]initWithNibName:@"XBWorldViewController" bundle:nil];
    [homeVC2 setTitle:@"游世界"];
    XBPlayViewController *homeVC3 = [[XBPlayViewController alloc]initWithNibName:@"XBPlayViewController" bundle:nil];
    [homeVC3 setTitle:@"播放厅"];
    XBMineViewController *homeVC4 = [[XBMineViewController alloc]initWithNibName:@"XBMineViewController" bundle:nil];
    [homeVC4 setTitle:@"我的L0"];

    NSArray *array = @[homeVC,homeVC1,homeVC2,homeVC3,homeVC4];
    
    
    
    [mainVC setSubViewControllers:array];
    
    XBNavigationViewController *nav = [[XBNavigationViewController alloc]initWithRootViewController:mainVC];
    self.window.rootViewController = nav;
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {

}

- (void)applicationDidEnterBackground:(UIApplication *)application {

}

- (void)applicationWillEnterForeground:(UIApplication *)application {
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
