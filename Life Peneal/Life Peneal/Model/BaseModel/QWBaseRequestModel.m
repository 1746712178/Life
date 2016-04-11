//
//  QWBaseRequestModel.m
//  Life Peneal
//
//  Created by tens03 on 16/4/8.
//  Copyright © 2016年 Wxl. All rights reserved.
//

#import "QWBaseRequestModel.h"

@implementation QWBaseRequestModel
#pragma mark Public
-(NSString *)paramenterString{
    
    NSMutableString *string = [NSMutableString string];
    
    for (NSString *name in [self propertyList]) {
        
        id value = [self valueForKey:name];
        if (value == nil) {
            continue;
        }
        NSString *aName = [name isEqualToString:@"ct"] ? @"id":name;
        [string appendString:[NSString stringWithFormat: @"%@ = %@", aName,value]];
    }
    [string deleteCharactersInRange:NSMakeRange(string.length - 1,1)];
    return string;
}

-(NSData *)jsonData
{
    return [[self paramenterString] dataUsingEncoding:NSUTF8StringEncoding];
}

-(NSDictionary *)dictionary
{
    return [self dictionaryWithValuesForKeys:[self propertyList]];
}
@end
