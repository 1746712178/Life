//
//  QWCollectionViewCell.m
//  Life Peneal
//
//  Created by tens03 on 16/4/8.
//  Copyright © 2016年 Wxl. All rights reserved.
//

#import "QWCollectionViewCell.h"
#import <Masonry.h>

@implementation QWCollectionViewCell

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self.contentView addSubview:self.imageView];
        [self.contentView addSubview:self.nameLable];
        [self.contentView addSubview:self.addressLable];
        
        [self.contentView setNeedsUpdateConstraints];
        [self.contentView needsUpdateConstraints];
        [self.contentView layoutIfNeeded];
    }
    return self;
}

-(void)updateConstraints{
    
    [self.imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.contentView);
    }];
    
    [self.nameLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.equalTo(@5);
        make.trailing.equalTo(@15);
    }];
    
    [self updateConstraints];
}

#pragma mark Custom Accessors
-(UIImageView *)imageView{
    if (_imageView == nil) {
        _imageView = [[UIImageView alloc] init];
    }
    return _imageView;
}

-(UILabel *)nameLable{
    if (_nameLable == nil) {
        _nameLable = [[UILabel alloc] init];
    }
    return _nameLable;
}
-(UILabel *)addressLable{
    if (_addressLable == nil) {
        _addressLable = [[UILabel alloc] init];
    }
    return _addressLable;
}

@end
