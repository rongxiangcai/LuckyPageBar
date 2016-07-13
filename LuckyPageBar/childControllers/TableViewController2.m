//
//  TableViewController2.m
//  LuckyPageBar
//
//  Created by jack on 16/7/13.
//  Copyright © 2016年 shxl. All rights reserved.
//

#import "TableViewController2.h"

@interface TableViewController2 ()

@end

@implementation TableViewController2

static NSString *reuseIdentifier = @"TableViewController2";

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:reuseIdentifier];
    
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseIdentifier forIndexPath:indexPath];
    cell.textLabel.text = @"舞队动态";
    
    return cell;
}

@end
