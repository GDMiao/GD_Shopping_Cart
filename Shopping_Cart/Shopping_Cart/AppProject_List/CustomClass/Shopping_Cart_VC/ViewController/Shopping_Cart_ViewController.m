//
//  Shopping_Cart_ViewController.m
//  Shopping_Cart
//
//  Created by Michael-Miao on 2018/5/30.
//  Copyright © 2018年 MiaoGuodong . All rights reserved.
//

#import "Shopping_Cart_ViewController.h"
#import <Masonry/Masonry.h>
@interface Shopping_Cart_ViewController ()
@property (nonatomic, strong) UITableView *tableView;
@end

@implementation Shopping_Cart_ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
	
	// 加载 TableView
	[self _initTableView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark -- 初始化 TableView

- (void)_initTableView
{
	UITableView *tableV = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
	tableV.separatorStyle = UITableViewCellSeparatorStyleNone;
	tableV.dataSource = self;
	tableV.delegate = self;
	[self.view addSubview:tableV];
	
	[tableV registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cart-Cell"];
	
	self.tableView = tableV;

	UIEdgeInsets padding = UIEdgeInsetsMake(0, 0, 0, 0);
	[self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
		make.edges.equalTo(self.tableView.superview).with.insets(padding);
	}];
}

#pragma mark -- UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
	return 6;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cart-Cell" forIndexPath:indexPath];
	cell.textLabel.text = [NSString stringWithFormat:@"cart-Cell-%ld",indexPath.row];
	return cell;
}
@end
