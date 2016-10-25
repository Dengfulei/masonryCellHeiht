//
//  ViewController.m
//  TableViewEditing
//
//  Created by 杭州移领 on 16/7/18.
//  Copyright © 2016年 DFL. All rights reserved.
//

#import "ViewController.h"
#import "TableViewCell.h"
@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic , strong) UITableView *tableView;
@property (nonatomic, copy) NSArray *prototypeEntitiesFromJSON;
@end
static NSString *cellID = @"cell1";

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = NO;
    [self.view addSubview:self.tableView];
    NSMutableArray *array =[NSMutableArray new];
    for (NSInteger i = 0; i < 20; i++) {
        CellModel *model = [[CellModel alloc] init];
/////////////////////
        if (i == 0) {
             model.picArray = @[@"2",@"1"];
             model.title = @"";
        } else if (i == 1) {
             model.picArray = @[];
            model.title = [NSString stringWithFormat:@"%ld封装自动布局，简洁明了并具有高可读性（使用介绍1使用介绍2），iOS自适",i];
        } else if (i == 2) {
             model.picArray = @[];
             model.title =@"";
        } else if (i == 3) {
             model.picArray = @[@"2",@"1",@"1"];
             model.title = [NSString stringWithFormat:@"%ld封装自动布局，简洁明了并具有高可读性（使用介绍1使用介绍2），iOS自适",i];
        } else if (i == 4) {
             model.picArray = @[@"2",@"1",@"1",@"1"];
             model.title = [NSString stringWithFormat:@"%ld封装自动布局，简洁明了并具有高可读性（使用介绍1使用介绍2），iOS自适",i];
        } else if (i == 5) {
             model.picArray = @[@"2",@"1",@"1",@"1",@"1"];
              model.title = [NSString stringWithFormat:@"%ld封装自动布局，简洁明了并具有高可读性（使用介绍1使用介绍2），iOS自适",i];
        } else if (i == 6) {
             model.picArray = @[@"2",@"1"];
              model.title = [NSString stringWithFormat:@"%ld封装自动布局，简洁明了并具有高可读性（使用介绍1使用介绍2），iOS自适",i];
        } else {
             model.picArray = @[@"2",@"1"];
             model.title = [NSString stringWithFormat:@"%ld封装自动布局，简洁明了并具有高可读性（使用介绍1使用介绍2），iOS自适",i];
        }
        [array addObject:model];
    }
    self.prototypeEntitiesFromJSON = array;
    [self.tableView reloadData];
    
}



- (UITableView *)tableView {
    
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) style:UITableViewStylePlain];
        _tableView.delegate   = self;
        _tableView.dataSource = self;
        [_tableView registerClass:[TableViewCell class] forCellReuseIdentifier:@"jjj"];
        
    }
    return _tableView;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.prototypeEntitiesFromJSON.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"jjj" forIndexPath:indexPath];
    if (indexPath.row == 3) {
        cell.backgroundColor = [UIColor yellowColor];
    } else
        cell.backgroundColor = [UIColor whiteColor];

        cell.model = self.prototypeEntitiesFromJSON[indexPath.row];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
   
    CellModel *model = self.prototypeEntitiesFromJSON[indexPath.row];
    if (!model.cellHeight) {
         TableViewCell *cell = [[TableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"jjj"];
       model.cellHeight = [cell getCellHeight:self.prototypeEntitiesFromJSON[indexPath.row]];
        NSLog(@"%f",[cell getCellHeight:self.prototypeEntitiesFromJSON[indexPath.row]]);
    }
    return model.cellHeight;
}



@end
