//
//  QWHomeModel.m
//  Life Peneal
//
//  Created by tens03 on 16/4/8.
//  Copyright © 2016年 Wxl. All rights reserved.
//

#import "QWHomeModel.h"

@implementation QWHomeModel

- (void)setValue:(id)value forKey:(NSString *)key {
    if ([key isEqualToString:@"article"]) {
        self.article = [[QWArticleModel alloc] initWithObject:value];
    } else {
        [super setValue:value forKey:key];
    }
}

- (CGSize)calePictureSizeWithCount:(NSUInteger )count{
    
    //图片宽度
    CGFloat width = KScreenWidth;

    //计算图片的高度
    
    CGFloat height = 0.0;
    CGFloat itemHeight = ceil(KScreenHight - 50*2)/2;
    for (int i = 0; i<count; i++) {
        height = itemHeight*i +50*i;
    }
    return CGSizeMake(width, height);
}


#pragma mark Custom Accessors
-(CGFloat)cellHeight{
    if (_cellHeight == 0) {
        _cellHeight = 250;
        if (self.pictureListViewSize.height >0) {
            _cellHeight += 8 + self.pictureListViewSize.height;
        }
        _cellHeight += 8;
        _cellHeight = ceil(_cellHeight);
    }
    return _cellHeight;
}
- (CGSize )pictureListViewSize{
    if (CGSizeEqualToSize(_pictureListViewSize, CGSizeZero)) {
        NSUInteger pictureCount = 0;
        
        if (pictureCount == 0) {
            _pictureListViewSize = CGSizeZero;
        } else {
            _pictureListViewSize = [self calePictureSizeWithCount:pictureCount];;
        }
        
    }
    return _pictureListViewSize;
}

@end
