//
//  QWHomeModel.h
//  Life Peneal
//
//  Created by tens03 on 16/4/8.
//  Copyright © 2016年 Wxl. All rights reserved.
//

#import "QWBaseResponseModel.h"
#import "QWArticleModel.h"

@interface QWHomeModel : QWBaseResponseModel

@property (copy, nonatomic) NSString *ct;
@property (copy, nonatomic) NSString *pt;
@property (copy, nonatomic) NSString *id;
@property (copy, nonatomic) NSNumber *type;
@property (copy, nonatomic) NSString *topic;

@property (strong, nonatomic) QWArticleModel *article;

@property (assign, nonatomic) CGFloat cellHeight;
@property (assign, nonatomic) CGFloat contentHeight;
@property (assign, nonatomic) CGSize pictureListViewSize;



@end
