//
//  STMainViewController.m
//  iOSStartDemo
//
//  Created by SamirChen on 2/12/16.
//  Copyright © 2016 CX. All rights reserved.
//

#import "STMainViewController.h"

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
    //// Layout with frame.
    //[helloButton setFrame:CGRectMake(0, 0, 60, 40)];
    //helloButton.center = self.view.center;
    //// Layout with constraint.
    helloButton.translatesAutoresizingMaskIntoConstraints = NO; // If you want to use Auto Layout to dynamically calculate the size and position of your view, you must set this property to NO.
    [self.view addConstraints:@[
        [NSLayoutConstraint constraintWithItem:helloButton attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:60.0],
        [NSLayoutConstraint constraintWithItem:helloButton attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:40.0],
        [NSLayoutConstraint constraintWithItem:helloButton attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0],
        [NSLayoutConstraint constraintWithItem:helloButton attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterY multiplier:1.0 constant:0]
    ]];
}


#pragma mark - Action
- (void)onHelloButtonClicked:(id)sender {
    NSLog(@"Hello, world!");

    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Hello" message:@"Hello, world!" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) {
        NSLog(@"Cancle Action");
    }];
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        NSLog(@"OK Action");
    }];
    [alertController addAction:cancelAction];
    [alertController addAction:okAction];
    [self presentViewController:alertController animated:YES completion:nil];
}

@end
