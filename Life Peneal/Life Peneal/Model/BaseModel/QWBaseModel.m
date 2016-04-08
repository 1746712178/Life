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

-(instancetype)initWithObject:(id)object{
    self = [super init];
    if (self) {
        if ([object isKindOfClass:[NSDictionary class]]) {
            [self setValuesForKeysWithDictionary:object];
        }
        if ([object isKindOfClass:[NSData class]]) {
            NSDictionary *dictionary = [NSJSONSerialization JSONObjectWithData:object options:0 error:nil];
            [self setValuesForKeysWithDictionary:dictionary];
        }
    }
    return self;
}

-(void)archive{
    
    [NSKeyedArchiver archiveRootObject:self toFile:kArchivePath];
}

+(instancetype)unarchive{
   return [NSKeyedUnarchiver unarchiveObjectWithFile:kArchivePath];
}

+(BOOL)removeArchive{
    NSFileManager *fileManager = [NSFileManager defaultManager];
    if ([fileManager isExecutableFileAtPath:kArchivePath]) {
        [fileManager removeItemAtPath:kArchivePath error:nil];
    }
    return NO;
}

- (NSArray *)propertyList{
    
    unsigned int outCount;
    objc_property_t *propertyList = class_copyPropertyList([self class], &outCount);
    
    NSMutableArray *propertyArry = [NSMutableArray array];
    for (int i = 0; i<outCount; i++) {
        
        objc_property_t property = propertyList[i];
        NSString *name = [NSString stringWithUTF8String:property_getName(property)];
        
        [propertyArry addObject:name];
    }
    return propertyArry;
}

-(instancetype)initWithCoder:(NSCoder *)aDecoder{
    self = [super init];
    if (self) {
        for (NSString *name in [self propertyList]) {
            [self setValue:[aDecoder decodeObjectForKey:name] forKey:name];
        }
    }
    return self;
}

-(void)encodeWithCoder:(NSCoder *)aCoder{
    for (NSString *name in [self propertyList]) {
        [aCoder encodeObject:[self valueForKey:name] forKey:name];
    }
}

@end
