//
//  UIColor+QWAddition.m
//  Life Peneal
//
//  Created by tens03 on 16/4/7.
//  Copyright © 2016年 Wxl. All rights reserved.
//

#import "UIColor+QWAddition.h"

@implementation UIColor (QWAddition)
+(UIColor *)colorWithR:(CGFloat)r g:(CGFloat)g b:(CGFloat)b alpha:(CGFloat)alpha{
    return [UIColor colorWithRed:r/225 green:g/225 blue:b/225 alpha:alpha];

}
@end
