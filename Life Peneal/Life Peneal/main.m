//
//  main.m
//  Life Peneal
//
//  Created by tens03 on 16/4/7.
//  Copyright © 2016年 Wxl. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

int main(int argc, char * argv[]) {
    @autoreleasepool {
        return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
    }
}


/** 
 1. 首页 GET http://songguolife.com/api/home
 2. 首页详细页 GET  http://songguolife.com/api/article/570689887cf7111b0bd947b3
 3. 获取验证码 GET http://songguolife.com/api/pub/mobile/reg/code?mobile=13235805006
 4. 注册 POST http://songguolife.com/api/pub/reg
 5. 获取用户信息 GET http://songguolife.com/api/me
 6 收藏 POST http://songguolife.com/api/article/570721a07cf7111b0bd94f53/fav
 7. 专题 GET http://songguolife.com/api/topic?
 8. 推荐生活家 GET http://songguolife.com/api/author/recommend?count=4&from=0
 9. 分类 GET http://songguolife.com/api/activity?
*/