//
//  CustomerPostPicView.m
//  HappyDog
//
//  Created by 杭州移领 on 16/3/30.
//  Copyright © 2016年 杭州移领. All rights reserved.
//

#import "CustomerPostPicView.h"
@interface CustomerPostPicView()
@property (nonatomic, strong) NSArray *picViewsArray;
@end
@implementation CustomerPostPicView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self setupCustomerPostPicViewUI];
    }
    return self;
}

- (void)setupCustomerPostPicViewUI {
    NSMutableArray *imageViews = [NSMutableArray array];
    for (int i = 0; i < 5; i ++) {
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap)];
        UIImageView *imageView = [UIImageView new];
        imageView.tag = i ;
        [self addSubview:imageView];
        [imageView addGestureRecognizer:tap];
        imageView.userInteractionEnabled = YES;
        [imageViews addObject:imageView];
    }
    self.picViewsArray = [imageViews copy];
}

- (void)setPicPathArray:(NSArray *)picPathArray {
    _picPathArray = picPathArray;
    CGRect frame = self.frame;
    for (long i = _picPathArray.count; i < self.picViewsArray.count;i++ ) {
        UIImageView *imageView = self.picViewsArray[i];
        imageView.hidden = YES;
    }
    CGFloat margin = 10;
    CGFloat imageW = ([UIScreen mainScreen].bounds.size.width - 6*margin)/5;
    [_picPathArray enumerateObjectsUsingBlock:^(NSString *string,NSUInteger idx,BOOL *stop){
        UIImageView *imageView = [self.picViewsArray objectAtIndex:idx];
        imageView.hidden = NO;
        imageView.frame = CGRectMake(margin + (imageW + margin)*idx, 0, imageW, imageW);
//        imageView.image = [UIImage imageNamed:string];
        imageView.backgroundColor =[UIColor redColor];
    }];
    frame.size.width = _picPathArray.count == 0 ? 0:_picPathArray.count*imageW +(_picPathArray.count + 1)*margin;
    frame.size.height = _picPathArray.count == 0 ? 0 : imageW;
    self.frame = frame;

}
- (void)tap {
    NSLog(@"====");
}
@end
