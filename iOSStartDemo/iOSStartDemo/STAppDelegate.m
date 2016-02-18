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
    tabImage = [[STCommonUtil imageWithColor:[UIColor redColor] size:CGSizeMake(30, 30)] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    tabImageHighlight = [[STCommonUtil imageWithColor:[UIColor grayColor] size:CGSizeMake(30, 30)] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    mainViewController.tabBarItem = [[UITabBarItem alloc] initWithTitle:mainViewController.title image:tabImage selectedImage:tabImageHighlight];
    UINavigationController *mainNavigationController = [[UINavigationController alloc] initWithRootViewController:mainViewController];
    
    //// Explore.
    STExploreViewController *exploreViewController = [[STExploreViewController alloc] init];
    exploreViewController.title = @"Explore";
    tabImage = [[STCommonUtil imageWithColor:[UIColor greenColor] size:CGSizeMake(30, 30)] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    tabImageHighlight = [[STCommonUtil imageWithColor:[UIColor grayColor] size:CGSizeMake(30, 30)] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    exploreViewController.tabBarItem = [[UITabBarItem alloc] initWithTitle:exploreViewController.title image:tabImage selectedImage:tabImageHighlight];
    UINavigationController *exploreNavigationController = [[UINavigationController alloc] initWithRootViewController:exploreViewController];
    
    //// Me.
    STMeViewController *meViewController = [[STMeViewController alloc] init];
    meViewController.title = @"Me";
    tabImage = [[STCommonUtil imageWithColor:[UIColor blueColor] size:CGSizeMake(30, 30)] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    tabImageHighlight = [[STCommonUtil imageWithColor:[UIColor grayColor] size:CGSizeMake(30, 30)] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    meViewController.tabBarItem = [[UITabBarItem alloc] initWithTitle:meViewController.title image:tabImage selectedImage:tabImageHighlight];
    UINavigationController *meNavigationController = [[UINavigationController alloc] initWithRootViewController:meViewController];
    
    //// Main tab bar controller.
    UITabBarController *mainTabBarController = [[UITabBarController alloc] init];
    mainTabBarController.viewControllers = @[mainNavigationController, exploreNavigationController, meNavigationController];
    
    self.window.backgroundColor = [UIColor whiteColor];
    self.window.rootViewController = mainTabBarController;
    [self.window makeKeyAndVisible];
    
    return YES;
}

@end
