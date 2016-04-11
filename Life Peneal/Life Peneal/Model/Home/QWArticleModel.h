//
//  QWArticleModel.h
//  Life Peneal
//
//  Created by tens03 on 16/4/11.
//  Copyright © 2016年 Wxl. All rights reserved.
//

#import "QWBaseModel.h"

@interface QWArticleModel : QWBaseModel
@property (assign, nonatomic) long type;
@property (copy, nonatomic) NSString *title;
@property (copy, nonatomic) NSString *address;
@property (copy, nonatomic) NSString *name;
@end
