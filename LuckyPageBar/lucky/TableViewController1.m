//
//  TableViewController1.m
//  LuckyPageBar
//
//  Created by jack on 16/7/13.
//  Copyright © 2016年 shxl. All rights reserved.
//

#import "TableViewController1.h"

@interface TableViewController1 ()

@end

@implementation TableViewController1


static NSString *reuseIdentifier = @"TableViewController1";

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
    cell.textLabel.text = @"我的舞队";

    return cell;
}


@end
