//
//  QWBaseModel.h
//  Life Peneal
//
//  Created by tens03 on 16/4/8.
//  Copyright © 2016年 Wxl. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface QWBaseModel : NSObject<NSCoding>

/**
 *  初始化model并赋值
 */
- (instancetype)initWithObject:(id)object;

/**
 *  归档
 */
- (void)archive;

/**
 *  解档
 */
+ (instancetype)unarchive;

/**
 *  删档
 */
+ (BOOL)removeArchive;

/**
 *  返回当前对象的属性列表
 */
- (NSArray *)propertyList;


@end
