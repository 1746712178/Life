//
//  QWAPIMacro.h
//  Life Peneal
//
//  Created by tens03 on 16/4/9.
//  Copyright © 2016年 Wxl. All rights reserved.
//

#ifndef QWAPIMacro_h
#define QWAPIMacro_h

#define baseURL(url)  [NSURL URLWithString:[@"http://songguolife.com/api/" stringByAppendingString:url]]

#define basePictureURL(url)    [NSURL URLWithString:[@"http://7xnqn3.com2.z0.glb.qiniucdn.com/" stringByAppendingString:url]]

#define KHomeURL           baseURL(@"home")
#define KHomePicture        [NSURL URLWithString:@"http://7xnqn3.com2.z0.glb.qiniucdn.com/"]

#define KHomeDetailURL        baseURL(@"article")

#define KCardURl            baseURL(@"pub/mobile/reg")

#endif /* QWAPIMacro_h */


/**
 首页图片   GET   http://7xnqn3.com2.z0.glb.qiniucdn.com（http://7xnqn3.com2.z0.glb.qiniucdn.com/56ffd0617cf7111b0bd8c592?imageView2/0/w/1080/h/810）
 http://7xnqn3.com2.z0.glb.qiniucdn.com/56ffd0617cf7111b0bd8c592
 
 http://7xnqn3.com2.z0.glb.qiniucdn.com/56fcb5be7cf7111b0bd8958c
 
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