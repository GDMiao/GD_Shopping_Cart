//
//  Shopping_Cart_ViewController.m
//  Shopping_Cart
//
//  Created by Michael-Miao on 2018/5/30.
//  Copyright © 2018年 MiaoGuodong . All rights reserved.
//

#import "Shopping_Cart_ViewController.h"
#import "Shopping_Cart_Cell.h"
#import "Shopping_Cart_PriceView.h"
#import <Masonry/Masonry.h>
@interface Shopping_Cart_ViewController ()<Shopping_Cart_CellSelectedDelegate>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *dataArray;
@property (nonatomic, strong) Shopping_Cart_PriceView *priceView;
@end

static NSString *const cart_CellId = @"cart-Cell";
@implementation Shopping_Cart_ViewController

#pragma mark -- data lazy

- (NSMutableArray *)dataArray
{
	if (!_dataArray) {
		_dataArray = [NSMutableArray new];
		for (int i = 0; i < 6; i++) {
			GoodsModel *model = [[GoodsModel alloc] init];
			[model dataParser:nil];
			[_dataArray addObject:model];
		}
	}
	return _dataArray;
}


- (void)viewDidLoad {
    [super viewDidLoad];
	
	
    self.navigationItem.title = @"购物车";
	// 加载 TableView
	[self _initTableView];
	
	
	self.priceView = [[Shopping_Cart_PriceView alloc] init];
	[self.view addSubview:self.priceView];
	[self.priceView mas_makeConstraints:^(MASConstraintMaker *make) {
		make.left.right.equalTo(@0);
		make.bottom.mas_equalTo(-30);
		make.height.mas_equalTo(50);
	}];
	__weak typeof(self) weakself = self;
	self.priceView.payBlock = ^{
		__strong typeof(self) stronself = weakself;
		[stronself toPayBtAction];
	};
	self.priceView.selectAllBlock = ^(BOOL selected) {
		// 更新数据
		__strong typeof(self) stronself = weakself;
		NSMutableArray *allData = [NSMutableArray new];
		for (GoodsModel *model in stronself.dataArray) {
			model.select = selected ? NO : YES;
			[allData addObject:model];
		}
		[stronself.dataArray removeAllObjects];
		stronself.dataArray = [allData mutableCopy];
		[stronself.tableView reloadData];
        [stronself.priceView refreshPrcieViewUI:stronself.dataArray];
	};
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


#pragma mark -- rightButtonItem Action
- (void)toPayBtAction
{
	float totalPrice = 0;
	for (GoodsModel *model in self.dataArray) {
		if (!model.select) {
			
		} else {
			totalPrice += model.price.floatValue * model.count;
		}
	}
	NSLog(@"共 %.2f",totalPrice);
	NSString *message = @"";
	if (totalPrice != 0) {
		message = [NSString stringWithFormat:@"共计:%.2f元",totalPrice];
	} else {
		message = @"请选择商品结算";
	}
	UIAlertController *alertVC = [UIAlertController alertControllerWithTitle:@"结算" message:message preferredStyle:UIAlertControllerStyleAlert];
	UIAlertAction *defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
														  handler:^(UIAlertAction * action) {
															  //响应事件
															  NSLog(@"action = %@", action);
														  }];
	[alertVC addAction:defaultAction];
	[self presentViewController:alertVC animated:YES completion:nil];
}

#pragma mark -- 初始化 TableView

- (void)_initTableView
{
	UITableView *tableV = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
	tableV.separatorStyle = UITableViewCellSeparatorStyleNone;
	tableV.estimatedRowHeight = 85.0f;//推测高度，必须有，可以随便写多少
	tableV.rowHeight = UITableViewAutomaticDimension; //iOS8之后默认就是这个值，可以省略
	tableV.dataSource = self;
	tableV.delegate = self;
	[self.view addSubview:tableV];
	
	[tableV registerNib:[UINib nibWithNibName:@"Shopping_Cart_Cell" bundle:nil] forCellReuseIdentifier:cart_CellId];
	
	self.tableView = tableV;

	UIEdgeInsets padding = UIEdgeInsetsMake(0, 0, 0, 0);
	[self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
		make.edges.equalTo(self.tableView.superview).with.insets(padding);
	}];
}

#pragma mark -- UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
	return self.dataArray ? self.dataArray.count : 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	Shopping_Cart_Cell *cell = [tableView dequeueReusableCellWithIdentifier:cart_CellId forIndexPath:indexPath];
	cell.delegate = self;
	cell.goods = [self.dataArray objectAtIndex:indexPath.row];
	return cell;
}

#pragma mark -- Shopping_Cart_CellSelectedDelegate
- (void)shoppingCartCell:(Shopping_Cart_Cell *)cell selected:(BOOL)selected
{
	NSIndexPath *indexPath = [self.tableView indexPathForCell:cell];
	NSLog(@"%ld Bool:%d",indexPath.row,selected);
	[self.dataArray replaceObjectAtIndex:indexPath.row withObject:cell.goods];
    [self.priceView refreshPrcieViewUI:self.dataArray];
}
@end
