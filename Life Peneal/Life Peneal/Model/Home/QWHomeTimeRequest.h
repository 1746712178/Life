//
//  QWHomeTimeRequest.h
//  Life Peneal
//
//  Created by tens03 on 16/4/9.
//  Copyright © 2016年 Wxl. All rights reserved.
//

#import "QWBaseRequestModel.h"

@interface QWHomeTimeRequest : QWBaseRequestModel

@property (copy, nonatomic) NSNumber *count;
@property (copy, nonatomic) NSString *since;
@property (copy, nonatomic) NSString *until;

@property (copy, nonatomic) NSString *id;
 

//http://songguolife.com/api/home?count=20&since=1460217540000&until=0
//  access_token=2.00u5N_7G08SDxf0fd85c38c50MiGu9&count=100&page=1&

@end
