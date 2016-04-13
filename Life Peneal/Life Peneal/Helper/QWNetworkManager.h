//
//  QWNetworkManager.h
//  Life Peneal
//
//  Created by tens03 on 16/4/8.
//  Copyright © 2016年 Wxl. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "QWHomeTimeRequest.h"
#import "QWExploreModel.h"
#import "QWExSpecialModel.h"
#import "QWExLiferModel.h"
#import "QWLiferModel.h"
typedef void (^CompletionHandler)(id result, NSError *error);

@interface QWNetworkManager : NSObject
/**
 *  创建并返回一个单例对象
 */
+ (instancetype)shareInstance;

//获取首页
- (void)homeTimeWithMomel:(QWHomeTimeRequest *)model comPletionHandler:(CompletionHandler)completionhandler;


// 首页图片请求
- (void)homePictureWithMomel:(QWBaseModel *)model comPletionHandler:(CompletionHandler)completionhandler;
//专题请求
- (void)ExSpecialWithMomel:(QWExSpecialModel *)model comPletionHandler:(CompletionHandler)completionhandler;

//生活专家
- (void)ExLiferWithMomel:(QWExLiferModel *)model comPletionHandler:(CompletionHandler)completionhandler;

@end
