//
//  QWTableViewCell.m
//  Life Peneal
//
//  Created by tens03 on 16/4/8.
//  Copyright © 2016年 Wxl. All rights reserved.
//

#import "QWTableViewCell.h"

@implementation QWTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self cellWillLoadSubView];
        [self cellWillLoadAutoLayout];
    }
    return self;
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
#pragma mark Private
-(void)cellWillLoadSubView{
    
    [self.contentView addSubview:self.homePicture];
    [self.homePicture addSubview:self.nameLable];
    [self.homePicture addSubview:self.addressLable];
    
}

-(void)cellWillLoadAutoLayout{
    
}

#pragma mark Custom Accessors

-(UIImageView *)homePicture{
    if (_homePicture == nil) {
        _homePicture = [[UIImageView alloc] init];
    }
    return _homePicture;
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
