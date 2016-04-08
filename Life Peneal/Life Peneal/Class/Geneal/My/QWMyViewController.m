//
//  QWMyViewController.m
//  Life Peneal
//
//  Created by tens03 on 16/4/7.
//  Copyright © 2016年 Wxl. All rights reserved.
//

#import "QWMyViewController.h"

@interface QWMyViewController ()
<UITableViewDataSource,UITableViewDelegate>
{
    NSArray *_pictures;
    NSArray *_titles;
}
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation QWMyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _titles = @[@"文章",@"消息",@"活动",@"物件",@"关注的生活家",@"成为生活家",@"设置"];
    
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [self.tableView reloadData];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0) {
        return 1;
    }
    else {
        return _titles.count;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *identifier;
    if (indexPath.section == 0) {
        identifier = @"reuseIdentifier1";
    }
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier forIndexPath:indexPath];
    cell.textLabel.backgroundColor = [UIColor clearColor];
    if (indexPath.section == 0) {
        cell.textLabel.text = _titles[indexPath.row];
    }
    return cell;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
    
    }
    return 40;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section == 0) {
        return 20;
    }
    if (section == 4) {
        return 20;
    }
    if (section == 6) {
        return 20;
    }
    else {
        return 0;
    }
}

@end
