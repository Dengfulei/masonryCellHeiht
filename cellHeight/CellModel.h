//
//  CellModel.h
//  cellHeight
//
//  Created by 杭州移领 on 16/9/13.
//  Copyright © 2016年 DFL. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface CellModel : NSObject
@property (nonatomic , copy) NSString *title;
@property (nonatomic , copy) NSString *content;
@property (nonatomic , copy) NSString *username;
@property (nonatomic , copy) NSString *time;
@property (nonatomic , copy) NSString *imageName;
@property (nonatomic , copy) NSString *type;
@property (nonatomic , copy) NSString *icon;
@property (nonatomic , strong) NSArray *picArray;
@property (nonatomic , assign) CGRect postPicViewF;
@property (nonatomic , assign) CGRect nameF;
@property (nonatomic , assign) CGFloat cellHeight;
- (void)setValueFrameWithModel:(CellModel *)model;
- (instancetype)initWithDict:(NSDictionary *)dic;
+ (instancetype)modelSetValueWithDictionary:(NSDictionary *)dic;
@end
