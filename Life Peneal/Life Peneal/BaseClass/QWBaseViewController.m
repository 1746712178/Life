//
//  QWBaseViewController.m
//  Life Peneal
//
//  Created by tens03 on 16/4/7.
//  Copyright © 2016年 Wxl. All rights reserved.
//

#import "QWBaseViewController.h"

@interface QWBaseViewController ()

@end

@implementation QWBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.automaticallyAdjustsScrollViewInsets = NO;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
-(void)dealloc{
    NSLog(@"%@ dealloc",[self class]);
}
@end
