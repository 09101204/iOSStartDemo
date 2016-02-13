//
//  STAppDelegate.m
//  iOSStartDemo
//
//  Created by SamirChen on 2/12/16.
//  Copyright © 2016 CX. All rights reserved.
//

#import "STAppDelegate.h"
#import "STMainViewController.h"

@interface STAppDelegate ()

@end

@implementation STAppDelegate

#pragma mark - UIApplicationDelegate
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    // Override point for customization after application launch.
    
    // Init root view controller of the application.
    STMainViewController *vc = [[STMainViewController alloc] init];
    self.window.backgroundColor = [UIColor whiteColor];
    self.window.rootViewController = vc;
    [self.window makeKeyAndVisible];
    
    return YES;
}

@end
