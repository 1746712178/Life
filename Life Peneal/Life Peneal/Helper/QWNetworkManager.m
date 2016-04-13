//
//  QWNetworkManager.m
//  Life Peneal
//
//  Created by tens03 on 16/4/8.
//  Copyright © 2016年 Wxl. All rights reserved.
//

#import "QWNetworkManager.h"
#import "QWHomePictureRequest.h"
#import "QWHomeModel.h"

static QWNetworkManager *netWorkManager;


@implementation QWNetworkManager
#pragma mark single instance
+(instancetype)shareInstance
{
    static dispatch_once_t onceTocken;
    dispatch_once(&onceTocken, ^{
        if (!netWorkManager) {
            netWorkManager = [[QWNetworkManager alloc]init];
        }
    });
    return netWorkManager;
}

+(instancetype)allocWithZone:(struct _NSZone *)zone
{
    static dispatch_once_t onceTocken;
    dispatch_once(&onceTocken, ^{
        if (!netWorkManager) {
            netWorkManager = [super allocWithZone:zone];
        }
    });
    return netWorkManager;
    
}
-(id)copy
{
    return netWorkManager;
}

#pragma mark Private;
-(void)sendWithRequest:(NSURLRequest *)request completionHandler:(CompletionHandler)completionHandler
{NSURLSessionConfiguration *config = [NSURLSessionConfiguration defaultSessionConfiguration];
    
    NSURLSession *session = [NSURLSession sessionWithConfiguration:config];
    NSURLSessionDataTask *dateTask = [session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        
        if (error) {
            completionHandler(nil,error);
            return;
        }
        NSDictionary *result = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            completionHandler(result, nil);
        });
    }];
    [dateTask resume];
}
- (void)handleErrorCode:(NSInteger )code
{
    
}

#pragma mark API
-(void)homeTimeWithMomel:(QWHomeTimeRequest *)model comPletionHandler:(CompletionHandler)completionhandler{
    
    NSURLRequest *request = [NSURLRequest requestWithURL:KHomeURL];
    
    [self sendWithRequest:request completionHandler:^(NSArray *result, NSError *error) {
        
        if (error) {
            //completionhandler(nil, error)
            return;
        }
        
        NSMutableArray *array = [NSMutableArray array];

        for (NSDictionary *dic in result) {
            QWHomeModel *model = [[QWHomeModel alloc] initWithObject:dic];
            [array addObject:model];
        }
        
        completionhandler(array, nil);
        
    }];
    
}


-(void)homePictureWithMomel:(QWBaseModel *)model comPletionHandler:(CompletionHandler)completionhandler{
    
    NSString *urlString = [[KHomePicture absoluteString] stringByAppendingString:[model description]];
    
    NSURLRequest *requese = [NSURLRequest requestWithURL:[NSURL URLWithString:urlString]];
    [self sendWithRequest:requese completionHandler:^(id result, NSError *error) {
        if (error) {
            completionhandler(nil,error);
            return;
        }
        NSMutableArray *array = [NSMutableArray  array];
        
        for (NSDictionary *dic in result) {
            QWHomeModel *model = [[QWHomeModel alloc] initWithObject:dic];
            [array addObject:model];
            
        }
        
        completionhandler(array, nil);
        
    }];

}
 
-(void)ExSpecialWithMomel:(QWExSpecialModel *)model comPletionHandler:(CompletionHandler)completionhandler{
    
    NSURLRequest *request = [NSURLRequest requestWithURL:KSpecialURL];
    
    [self sendWithRequest:request completionHandler:^(id result, NSError *error) {
        if (error) {
            completionhandler(nil, error);
            return;
        }
        NSMutableArray *arry = [NSMutableArray array];
        
        for (NSDictionary *dic in result) {
            
            QWExploreModel *model = [[QWExploreModel alloc] initWithObject:dic];
            [arry addObject:model];
        }
        completionhandler(arry,nil);
    }];
}

-(void)ExLiferWithMomel:(QWExLiferModel *)model comPletionHandler:(CompletionHandler)completionhandler{
    NSString *urlString = [[KLiferURL absoluteString] stringByAppendingString:[model description]];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:urlString]];
    
    //NSURLRequest *request = [NSURLRequest requestWithURL:KLiferURL];
    
    [self sendWithRequest:request completionHandler:^(id result, NSError *error) {
        
        if (error) {
            completionhandler(nil, error);
            return;
        }
        NSMutableArray *array = [NSMutableArray  array];
        
        for (NSDictionary *dic in result) {
            QWLiferModel *model = [[QWLiferModel alloc] initWithObject:dic];
            [array addObject:model];
            
        }
        
        completionhandler(array, nil);
        
    }];

    
}
@end
