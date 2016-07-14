//
//  LuckyBaseController.m
//  LuckyPageBar
//
//  Created by jack on 16/7/13.
//  Copyright © 2016年 shxl. All rights reserved.
//

#import "LuckyBaseController.h"
#import "TableViewController1.h"
#import "TableViewController2.h"

@interface LuckyBaseController ()
@property (nonatomic)UIButton *selectedBtn;
@end

@implementation LuckyBaseController

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    
    if (self = [super initWithNibName:@"LuckyBaseController" bundle:nibBundleOrNil]) {
        
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = NO;
    if (self.controller1 == nil) {
        TableViewController1 *child1 = [[TableViewController1 alloc] init];
        TableViewController2 *child2 = [[TableViewController2 alloc] init];
        [self addChildViewController:child1];
        [self addChildViewController:child2];
    }else{
        [self addChildViewController:self.controller1];
        [self addChildViewController:self.controller2];
    }
    
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self setupTabbar];
}

//设置tabBar样式
- (void)setupTabbar {
    self.tabBarButton1.tag = 0;
    self.tabBarButton2.tag = 1;
    
    [self setTabBarButton:self.tabBarButton1];
    [self setTabBarButton:self.tabBarButton2];
    
    [self.tabBarButton1 addTarget:self action:@selector(didClickBtn:) forControlEvents:UIControlEventTouchUpInside];
    [self.tabBarButton2 addTarget:self action:@selector(didClickBtn:) forControlEvents:UIControlEventTouchUpInside];
    
    [self didClickBtn:self.tabBarButton1];
    self.tabBarButton1.selected = YES;
}

- (void)setTabBarButton:(UIButton *)button{
    button.titleLabel.backgroundColor = [UIColor clearColor];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected];
    NSString *normalName;
    NSString *selectedName;
    if (button.tag == 0) {
        normalName = @"luckyPageBar_left_normal";
        selectedName = @"luckyPageBar_left_selected";
    }else{
        normalName = @"luckyPageBar_right_normal";
        selectedName = @"luckyPageBar_right_selected";
    }
    [button setBackgroundImage:[UIImage imageNamed:normalName] forState:UIControlStateNormal];
    [button setBackgroundImage:[UIImage imageNamed:selectedName] forState:UIControlStateHighlighted];
    [button setBackgroundImage:[UIImage imageNamed:selectedName] forState:UIControlStateSelected];

}

- (void)didClickBtn:(UIButton *)sender {
    
    if (sender == self.selectedBtn) {
        return;
    }
    
    //删除上一个内容视图
    UITableView *lastView = (UITableView *)[self.childViewControllers[_selectedBtn.tag] view];
    
    [lastView removeFromSuperview];
    
    //设置选项视图的按钮点击样式
    self.selectedBtn.selected = NO;
    sender.selected = YES;
    self.selectedBtn = sender;
    
    
    //切换内容显示
    UITableViewController *tableVc = (UITableViewController *)self.childViewControllers[sender.tag];
    
    tableVc.view.frame = self.contentView.bounds;
    
    [self.contentView addSubview: tableVc.view];
    
    //设置tableView的contentOffset与上一个视图一致
    tableVc.tableView.contentOffset = lastView.contentOffset;
    
}


@end
