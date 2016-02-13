//
//  STExploreViewController.m
//  iOSStartDemo
//
//  Created by qiufu on 2/13/16.
//  Copyright © 2016 CX. All rights reserved.
//

#import "STExploreViewController.h"
#import "STCommonUtil.h"
#import <Masonry/Masonry.h>

NSString * const STExploreCellIdentifier = @"STExploreCellIdentifier";

@interface STExploreViewController () <UITableViewDataSource, UITableViewDelegate>
@property (nonatomic, strong) UITableView *myTableView;

@end

@implementation STExploreViewController

#pragma mark - Property
- (UITableView *)myTableView {
    if (!_myTableView) {
        _myTableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
        [_myTableView registerClass:[UITableViewCell class] forCellReuseIdentifier:STExploreCellIdentifier];
        _myTableView.delegate = self;
        _myTableView.dataSource = self;
    }
    
    return _myTableView;
}

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
    
    
    // myTableView.
    [self.view addSubview:self.myTableView];
    [self.myTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
    
    
}

#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 44;
}

#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSString *) tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return @"Header";
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1000;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:STExploreCellIdentifier forIndexPath:indexPath];
    cell.textLabel.text = @"Hi";
    cell.imageView.image = [STCommonUtil imageWithColor:[UIColor redColor] size:CGSizeMake(30, 30)];
    cell.layer.shouldRasterize = YES;
    cell.layer.rasterizationScale = [[UIScreen mainScreen] scale];
    
    return cell;
}

@end
