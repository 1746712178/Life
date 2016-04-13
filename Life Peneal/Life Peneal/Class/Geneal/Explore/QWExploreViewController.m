//
//  QWExploreViewController.m
//  Life Peneal
//
//  Created by tens03 on 16/4/7.
//  Copyright © 2016年 Wxl. All rights reserved.
//

#import "QWExploreViewController.h"
#import "QWExploreTableViewCell.h"
#import "QWScrollCell.h"
#import "QWSearchTableViewCell.h"
#import "QWNetworkManager.h"
#import "QWExSpecialModel.h"
#import <Masonry.h>

static NSString *exploreIdentifier = @"exploreIdentifier";
static NSString *scroolTIdentifier = @"scroolTIdentifier";
static NSString *searchTIdentifier = @"searchIdentifier";


@interface QWExploreViewController ()

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) NSMutableArray *dataList;
@property (strong, nonatomic) UILabel *specialLable;

@end

@implementation QWExploreViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.tableView registerClass:[QWExploreTableViewCell class]forCellReuseIdentifier:exploreIdentifier];
    [self.tableView registerClass:[QWScrollCell class]forCellReuseIdentifier:scroolTIdentifier];
    [self.tableView registerClass:[QWSearchTableViewCell class]forCellReuseIdentifier:searchTIdentifier];


}
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [self downLoadDate];
}


- (void)downLoadDate{
    
    QWExSpecialModel *model = [[QWExSpecialModel alloc] init];
    model.id = self.exploreModel.id;
    
    [[QWNetworkManager shareInstance] ExSpecialWithMomel:model comPletionHandler:^(id result, NSError *error) {
        if (error) {
            NSLog(@"%@",error);
            return;
        }
        
        [self.dataList addObjectsFromArray:result];
        [self.tableView reloadData];

    }];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) {
        return 1;
    }else if (section == 1){
        return 1;
    }
    else{
        return self.dataList.count;
 
    }
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
       
    if (indexPath.section == 0) {
        QWSearchTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:searchTIdentifier forIndexPath:indexPath];
        return cell;
    }else if (indexPath.section == 1){
        QWScrollCell *cell = [tableView dequeueReusableCellWithIdentifier:scroolTIdentifier forIndexPath:indexPath];
        return cell;

    }
    QWExploreTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:exploreIdentifier forIndexPath:indexPath];
    
    [cell setSpecialWithModel:self.dataList[indexPath.row]];
    return cell;
}
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    UIView *footerView;
    if (section ==1) {
        footerView = [[UIView alloc] init];
        footerView.backgroundColor = [UIColor colorWithR:203 g:203 b:203 alpha:1];
        
        [footerView addSubview:self.specialLable];
        
        [self.specialLable mas_updateConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(footerView);
        }];
        
    }
    return footerView;

}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        return 40;
        
    }else if (indexPath.section == 1){
        return 100;
    }
    else{
        return 120;
    }
}



-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
}

-(NSMutableArray *)dataList{
    if (_dataList == nil) {
        _dataList = [NSMutableArray array];
    }
    return _dataList;
}
-(UILabel *)specialLable{
    if (_specialLable==nil) {
        _specialLable = [[UILabel alloc] init];
        _specialLable.font = [UIFont systemFontOfSize:12];
        _specialLable.textColor = [UIColor grayColor];
        _specialLable.text = @"专题";

    }
    return _specialLable;
}
/*
 1.获取URL
 2.网络请求，ResquestModel 请求 --- 1、请求必须有的参数
 */


@end
