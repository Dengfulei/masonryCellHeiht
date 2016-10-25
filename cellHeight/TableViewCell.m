//
//  TableViewCell.m
//  cellHeight
//
//  Created by 杭州移领 on 16/9/13.
//  Copyright © 2016年 DFL. All rights reserved.
//

#import "TableViewCell.h"
#import "Masonry.h"
@interface TableViewCell()
@end
@implementation TableViewCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setupUI];
    }
    return self;
}

- (void)setupUI {

    // 文本
    self.name = [UILabel new];
    self.name.numberOfLines = 0;
    self.name.backgroundColor = [UIColor blueColor];
    self.name.font = [UIFont systemFontOfSize:12];
    [self.contentView addSubview:self.name];

    // 图片展
    self.postPicView  = [CustomerPostPicView new];
    [self.contentView addSubview:self.postPicView];
    
    [self.name mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(self.contentView).offset(0);
        make.left.equalTo(self.contentView).offset(10);
        make.right.equalTo(self.contentView).offset(-10);
    
    }];
    
    [self.postPicView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(self.name.mas_bottom).offset(0);
        make.left.equalTo(self.contentView).offset(0);
        make.right.equalTo(self.contentView).offset(0);
        make.height.equalTo(@0);
        
    }];
    

}

- (void)setModel:(CellModel *)model {
    _model = model;
    self.name.text = _model.title;
    self.postPicView.picPathArray = _model.picArray;
    [self setNeedsUpdateConstraints];
    [self updateConstraintsIfNeeded];
    
}

- (CGFloat)getCellHeight:(CellModel *)model {
    
    _model = model;
    self.name.text = _model.title;
    self.postPicView.picPathArray = _model.picArray;
    if (model.cellHeight > 0) {
        return model.cellHeight;
    }
    [self setNeedsUpdateConstraints];
    [self updateConstraintsIfNeeded];
    [self layoutIfNeeded];
    
    if (model.title.length <=0 && model.picArray.count <= 0) {
        return CGRectGetMaxY(self.postPicView.frame);
    } else {
        return CGRectGetMaxY(self.postPicView.frame) + 10;
    }
    
}


- (void)updateConstraints {
    [super updateConstraints];
   
    
    [self.name mas_updateConstraints:^(MASConstraintMaker *make) {
        
        if (self.model.title.length > 0) {
            make.top.equalTo(self.contentView).offset(10);
        } else {
            make.top.equalTo(self.contentView).offset(0);

        }
    }];
    
    [self.postPicView mas_updateConstraints:^(MASConstraintMaker *make) {
        CGFloat margin = 10;
        CGFloat imageW = ([UIScreen mainScreen].bounds.size.width - 6*margin)/5;
        if (self.model.picArray.count > 0) {
            make.top.equalTo(self.name.mas_bottom).offset(10);
            make.height.equalTo(@(imageW));
        } else {
            make.top.equalTo(self.name.mas_bottom).offset(0);
            make.height.equalTo(@0);
        }
        
    }];
}

@end
