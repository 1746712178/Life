//
//  QWMy2ViewController.m
//  Life Peneal
//
//  Created by tens03 on 16/4/9.
//  Copyright © 2016年 Wxl. All rights reserved.
//

#import "QWMyDetailedViewController.h"

@interface QWMyDetailedViewController ()
<UITableViewDataSource,UITableViewDelegate>
{
    NSArray *_titles;
}

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation QWMyDetailedViewController

- (void)viewDidLoad {
    [super viewDidLoad];


    _titles = @[@"文章",@"消息",@"活动",@"物件",@"关注的生活家",@"成为生活家",@"设置"];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) {
        return 4;
    }
    if (section == 1) {
        return 2;
    }
    else {
        return 1;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSString *identifier;
    if (indexPath.row == indexPath.row) {
            identifier = @"reuseIdentifier1";
        }
    
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier forIndexPath:indexPath];
    cell.textLabel.backgroundColor = [UIColor clearColor];
    
    if (indexPath.row == 0 ||indexPath.row==1 || indexPath.row == 2 || indexPath.row == 3) {
        cell.textLabel.text = _titles[indexPath.row];
        
    }
    
    if (indexPath.section == 1  && indexPath.row == 4  ) {
        cell.textLabel.text = _titles[4];
    }
    
    NSLog(@"%@",_titles[3]);
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        return 40;
    }
    else {
        return 50;
    }
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    if (section == 0 ) {
        return 10;
    }
    if (section == 1) {
        return 20;
    }
    else {
        return 20;
    }
}

@end
