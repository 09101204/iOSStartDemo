//
//  STMainViewController.m
//  iOSStartDemo
//
//  Created by SamirChen on 2/12/16.
//  Copyright © 2016 CX. All rights reserved.
//

#import "STMainViewController.h"
#import <Masonry/Masonry.h>
#import <SVProgressHUD/SVProgressHUD.h>

@interface STMainViewController ()

@end

@implementation STMainViewController

#pragma mark - Lifecycle
- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view, typically from a nib.
    
    // Setup.
    [self setupUI];
}

#pragma mark - Setup
- (void)setupUI {
    // Hello button.
    UIButton *helloButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [helloButton setTitle:@"Hello" forState:UIControlStateNormal];
    [helloButton addTarget:self action:@selector(onHelloButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:helloButton];
    [helloButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(@60.0);
        make.height.equalTo(@40.0);
        make.center.equalTo(self.view);
    }];
}


#pragma mark - Action
- (void)onHelloButtonClicked:(id)sender {
    NSLog(@"Hello, world!");
    
    [SVProgressHUD showSuccessWithStatus:@"Hello, world!" maskType:SVProgressHUDMaskTypeBlack];
}

@end
