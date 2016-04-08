//
//  QWTableViewCell.h
//  Life Peneal
//
//  Created by tens03 on 16/4/8.
//  Copyright © 2016年 Wxl. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface QWTableViewCell : UITableViewCell

@property (strong, nonatomic) UIImageView *homePicture;
@property (strong ,nonatomic) UILabel *nameLable;
@property (strong, nonatomic) UILabel *addressLable;

/**
 *  cell将要加载子view
 */
- (void)cellWillLoadSubView;

/**
 *  cell将要加载自动布局
 */
- (void)cellWillLoadAutoLayout;


@end
