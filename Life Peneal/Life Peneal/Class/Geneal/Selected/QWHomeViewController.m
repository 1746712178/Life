//
//  QWSelectedViewController.m
//  Life Peneal
//
//  Created by tens03 on 16/4/7.
//  Copyright © 2016年 Wxl. All rights reserved.
//

#import "QWHomeViewController.h"
#import "QWTableViewCell.h"
#import "QWHomeTimeRequest.h"
#import "QWHomeModel.h"
#import "QWNetworkManager.h"
#import "QWArticleModel.h"
#import <Masonry.h>

static NSString *identifier = @"identifier";
@interface QWHomeViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tabView;

@property (strong, nonatomic) UILabel *dateLable;
@property (strong, nonatomic) NSMutableArray *dataList;

@end

@implementation QWHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tabView registerClass:[QWTableViewCell class] forCellReuseIdentifier:identifier];
}
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [self downLoadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)downLoadData{
    
    QWHomeTimeRequest *request = [[QWHomeTimeRequest alloc] init];
    request.id = self.homeModel.id;
    
    [[QWNetworkManager shareInstance] homeTimeWithMomel:request comPletionHandler:^(id result, NSError *error) {
        if (error) {
            NSLog(@"%@",error);
            return;
        }
        
      //  NSMutableArray *arry = [NSMutableArray arrayWithArray:result];

//        for (int i=0; i<arry.count; i++) {
//            for (id dic in [arry objectAtIndex:i]) {
//                NSDictionary *article = [[arry objectAtIndex:i] valueForKey:dic];
//                NSLog(@"%@",article);
//        }
//    }
     
        [self.dataList addObjectsFromArray:result];
        [self.tabView reloadData];

        
    }];
    
}

#pragma mark - UITableViewDataSource && UITableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.dataList.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    QWTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier forIndexPath:indexPath];
    return cell;
}
  
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 250;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
}
-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{

}
#pragma mark Custom Accessors

-(NSArray *)dataList{
    if (_dataList== nil) {
        _dataList = [NSMutableArray array];
    }
    return _dataList;
}

@end
