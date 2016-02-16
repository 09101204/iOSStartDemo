//
//  STAppDelegate.m
//  iOSStartDemo
//
//  Created by SamirChen on 2/12/16.
//  Copyright © 2016 CX. All rights reserved.
//

#import "STAppDelegate.h"
#import "STMainViewController.h"
#import "STExploreViewController.h"
#import "STMeViewController.h"
#import "STCommonUtil.h"

@interface STAppDelegate ()

@end

@implementation STAppDelegate

#pragma mark - UIApplicationDelegate
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    // Override point for customization after application launch.
    
    // Init.
    UIImage *tabImage = nil;
    UIImage *tabImageHighlight = nil;
    
    //// Main.
    STMainViewController *mainViewController = [[STMainViewController alloc] init];
    mainViewController.title = @"Main";
    tabImage = [[UIImage imageNamed:@"TabBar_Main"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    tabImageHighlight = [[UIImage imageNamed:@"TabBar_Main_HL"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    mainViewController.tabBarItem = [[UITabBarItem alloc] initWithTitle:mainViewController.title image:tabImage selectedImage:tabImageHighlight];
    UINavigationController *mainNavigationController = [[UINavigationController alloc] initWithRootViewController:mainViewController];
    
    //// Explore.
    STExploreViewController *exploreViewController = [[STExploreViewController alloc] init];
    exploreViewController.title = @"Explore";
    tabImage = [[UIImage imageNamed:@"TabBar_Explore"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    tabImageHighlight = [[UIImage imageNamed:@"TabBar_Explore_HL"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    exploreViewController.tabBarItem = [[UITabBarItem alloc] initWithTitle:exploreViewController.title image:tabImage selectedImage:tabImageHighlight];
    UINavigationController *exploreNavigationController = [[UINavigationController alloc] initWithRootViewController:exploreViewController];
    
    //// Me.
    STMeViewController *meViewController = [[STMeViewController alloc] init];
    meViewController.title = @"Me";
    tabImage = [[UIImage imageNamed:@"TabBar_Me"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    tabImageHighlight = [[UIImage imageNamed:@"TabBar_Me_HL"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    meViewController.tabBarItem = [[UITabBarItem alloc] initWithTitle:meViewController.title image:tabImage selectedImage:tabImageHighlight];
    UINavigationController *meNavigationController = [[UINavigationController alloc] initWithRootViewController:meViewController];
    
    //// Main Tab bar controller.
    UITabBarController *mainTabBarController = [[UITabBarController alloc] init];
    mainTabBarController.viewControllers = @[mainNavigationController, exploreNavigationController, meNavigationController];
    
    self.window.backgroundColor = [UIColor whiteColor];
    self.window.rootViewController = mainTabBarController;
    [self.window makeKeyAndVisible];
    
    return YES;
}

@end
