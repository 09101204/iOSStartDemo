//
//  STDetailViewController.m
//  iOSStartDemo
//
//  Created by qiufu on 2/13/16.
//  Copyright © 2016 CX. All rights reserved.
//

#import "STDetailViewController.h"

@interface STDetailViewController ()

@end

@implementation STDetailViewController

#pragma mark - Lifecycle
- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Setup.
    [self setupUI];
}

#pragma mark - Setup
- (void)setupUI {
    // Use full screen layout.
    self.edgesForExtendedLayout = UIRectEdgeAll;
    self.automaticallyAdjustsScrollViewInsets = YES;
    self.extendedLayoutIncludesOpaqueBars = YES;
    self.view.backgroundColor = [UIColor whiteColor];
    
    // Title.
    self.title = @"Detail";
}

@end