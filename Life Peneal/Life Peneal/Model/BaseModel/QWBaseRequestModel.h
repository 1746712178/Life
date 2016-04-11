//
//  QWBaseRequestModel.h
//  Life Peneal
//
//  Created by tens03 on 16/4/8.
//  Copyright © 2016年 Wxl. All rights reserved.
//

#import "QWBaseModel.h"

@interface QWBaseRequestModel : QWBaseModel
/**
 *  把当前对象转换成jsonData
 */
- (NSData *)jsonData;

/**
 *  把当前对象转换成字典
 */
- (NSDictionary *)dictionary;

/**
 *  返回参数拼接的字符串
 */
- (NSString *)paramenterString;


@end
