//
//  TableViewCell.h
//  cellHeight
//
//  Created by 杭州移领 on 16/9/13.
//  Copyright © 2016年 DFL. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CustomerPostPicView.h"
#import "CellModel.h"
@interface TableViewCell : UITableViewCell
@property (nonatomic , strong) UILabel *name;
@property (nonatomic , strong) CustomerPostPicView *postPicView;
@property (nonatomic , strong) CellModel *model;
- (CGFloat)getCellHeight:(CellModel *)model;
@end
