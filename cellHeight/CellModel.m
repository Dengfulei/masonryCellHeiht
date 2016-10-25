//
//  CellModel.m
//  cellHeight
//
//  Created by 杭州移领 on 16/9/13.
//  Copyright © 2016年 DFL. All rights reserved.
//

#import "CellModel.h"

@implementation CellModel
- (instancetype)init {
    if (self = [super init]) {
        self.picArray = [NSArray new];
    }
    return self;
}
- (void)setValue:(id)value forUndefinedKey:(NSString *)key {
    
}

-  (instancetype)initWithDict:(NSDictionary *)dic {
    
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dic];
    }
    return self;
}


@end
