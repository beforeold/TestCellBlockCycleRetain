//
//  NextViewController.m
//  TestCellBlockCycleRetain
//
//  Created by 席萍萍 on 16/8/19.
//  Copyright © 2016年 Bob. All rights reserved.
//

#import "NextViewController.h"
#import "NextTableViewCell.h"

@interface NextViewController ()<UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;

@end

@implementation NextViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.title = @"Next";
    [self.view addSubview:self.tableView];
}

- (void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
    
    self.tableView.frame = self.view.bounds;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *identifier = nil;
    NextTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[NextTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    
    __weak typeof(self) weakSelf = self;
    cell.cellBlock = ^(id cell) {
        [weakSelf iLog];
    };
    
    return cell;
}

- (void)iLog {
    NSLog(@"self log");
}


- (void)dealloc {
    NSLog(@"next dealloc");
}

- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        _tableView.dataSource = self;
    }
    
    return _tableView;
}

@end
