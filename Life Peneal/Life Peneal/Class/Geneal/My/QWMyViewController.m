//
//  QWMyViewController.m
//  Life Peneal
//
//  Created by tens03 on 16/4/7.
//  Copyright © 2016年 Wxl. All rights reserved.
//

#import "QWMyViewController.h"
#import "QWMyDetailedViewController.h"
@interface QWMyViewController ()
@property (strong, nonatomic) UITextField *textName;
@property (strong, nonatomic) UITextField *textPassWord;
@property (strong, nonatomic) UIButton *loginButton;



@end

@implementation QWMyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:self.textName];
    [self.view addSubview:self.textPassWord];
    [self.view addSubview:self.loginButton];
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (IBAction)ButtonAction:(UIButton *)sender {
    QWMyDetailedViewController *My2 = [self.storyboard instantiateViewControllerWithIdentifier:@"QWMy2ViewController"];
    [self presentViewController:My2 animated:YES completion:nil];
    
}

- (UITextField *)textName
{
    if (_textName == nil) {
        _textName = [[UITextField alloc] init];
        _textName.borderStyle = UITextBorderStyleRoundedRect;
        _textName.font = [UIFont systemFontOfSize:14];
        _textName.placeholder = @"请输入用户名...";
        _textName.clearsOnBeginEditing = YES;
        [self.view addSubview:_textName];
    }
    return _textName;
}


- (UITextField *)textPassWord
{
    if (_textPassWord == nil) {
        _textPassWord = [[UITextField alloc] init];
        _textPassWord.borderStyle = UITextBorderStyleRoundedRect;
        _textPassWord.font = [UIFont systemFontOfSize:14];
        _textPassWord.placeholder = @"请输入用密码...";
        _textPassWord.clearsOnBeginEditing = YES;
        [self.view addSubview:_textPassWord];
    }
    return _textPassWord;
}


- (UIButton *)loginButton
{
    if (_loginButton == nil) {
        _loginButton = [UIButton buttonWithType:UIButtonTypeCustom];
    }
    return _loginButton;
}

@end
