//
//  QWBaseModel.m
//  Life Peneal
//
//  Created by tens03 on 16/4/8.
//  Copyright © 2016年 Wxl. All rights reserved.
//

#import "QWBaseModel.h"
#import <objc/runtime.h>

#define kArchivePath [NSString stringWithFormat:@"%@/%@", KDocuments, [self class]]
@implementation QWBaseModel

-(instancetype)initWithObject:(id)object
{
    self = [super init];
    if (self) {
        
        if ([object isKindOfClass:[NSDictionary class]]) {
            [self setValuesForKeysWithDictionary:object];
        }
        if ([object isKindOfClass:[NSData class]]) {
            NSMutableDictionary *dic = [NSJSONSerialization JSONObjectWithData:object options:NSJSONReadingMutableContainers error:nil];
            [self setValuesForKeysWithDictionary:dic];
        }
    }
    return self;
}


- (void)setValue:(id)value forUndefinedKey:(NSString *)key {
    
}

#pragma mark - Public

- (void)archive {
    
    [NSKeyedArchiver archiveRootObject:self toFile:kArchivePath];
}

+(instancetype)unarchive
{
    return [NSKeyedUnarchiver unarchiveObjectWithFile:kArchivePath];
}

+(BOOL)removeArchive
{
    NSFileManager *fileManager = [NSFileManager defaultManager];
    if ([fileManager fileExistsAtPath:kArchivePath]) {
        [fileManager removeItemAtPath:kArchivePath error:nil];
    }
    return NO;
}

//反射机制objc_property_t获取属性列表

-(NSArray *)propertyList
{
    unsigned int propertyCount;
    objc_property_t *propertyList = class_copyPropertyList([self class], &propertyCount);
    NSMutableArray *propertyNames = [NSMutableArray array];
    for (int i=0 ; i<propertyCount; i++) {
        
        objc_property_t property = propertyList[i];
        NSString *name = [NSString stringWithUTF8String:property_getName(property)];
        
        [propertyNames addObject:name];
    }
    return propertyNames;
    
}

#pragma mark coding
- (nullable instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];
    if (self) {
        for (NSString *name in [self propertyList]) {
            
            [self setValue:[aDecoder decodeObjectForKey:name] forKey:name];
        }
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{
    for (NSString *name in [self propertyList]) {
        
        [aCoder encodeObject:[self valueForKey:name] forKey:name];
    }
}

#pragma mark description
- (NSString *)description
{
    NSMutableString *string = [NSMutableString string];
    
    for (NSString *name in [self propertyList]) {
        
        id value = [self valueForKey:name];
        
        if (value == nil) {
            continue;
        }
        
        NSString *aName = [name stringByAppendingString:@"id"];
        
        [string appendString:[NSString stringWithFormat:@"%@", value]];
        
        //access_token=2.00u5N_7G08SDxf0fd85c38c50MiGu9&count=100&page=1&
        //count=20&since=1460217540000&until=0  id =
        //
        
        
    }
    
    return string;
}
@end
