//
//  UIColor+QWAddition.h
//  Life Peneal
//
//  Created by tens03 on 16/4/7.
//  Copyright © 2016年 Wxl. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (QWAddition)

/*
 grb的值，不用除以225；
 */
+ (UIColor *)colorWithR:(CGFloat)r g:(CGFloat)g b:(CGFloat)b alpha:(CGFloat)alpha;
@end
