//
//  LuckyBaseController.h
//  LuckyPageBar
//
//  Created by jack on 16/7/13.
//  Copyright © 2016年 shxl. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LuckyBaseController : UIViewController
@property (weak, nonatomic) IBOutlet UIButton *tabBarButton1;
@property (weak, nonatomic) IBOutlet UIButton *tabBarButton2;
@property (weak, nonatomic) IBOutlet UIView *contentView;
@property (nonatomic, strong) UITableViewController *controller1;
@property (nonatomic, strong) UITableViewController *controller2;
@end
