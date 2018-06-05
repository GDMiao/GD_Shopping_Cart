//
//  Shopping_Cart_PriceView.m
//  Shopping_Cart
//
//  Created by Michael-Miao on 2018/6/5.
//  Copyright © 2018年 MiaoGuodong . All rights reserved.
//

#import "Shopping_Cart_PriceView.h"
#import <Masonry/Masonry.h>
@implementation Shopping_Cart_PriceView

- (instancetype)init
{
	self = [super init];
	if (self) {
		self = [[NSBundle mainBundle] loadNibNamed:@"Shopping_Cart_PriceView" owner:self options:nil].lastObject;
	}
	return self;
}


- (IBAction)selectAll_Action:(UIButton *)sender {
	self.selectAllBlock(sender.selected);
	sender.selected = !sender.selected;
	
}

- (IBAction)toPay_Action:(UIButton *)sender {
	self.payBlock();
	NSLog(@"结算");
}

// 更新视图
- (void)refreshPrcieView:(NSDictionary *)dict
{
	NSString *priceStr = dict[@"price"];
	NSString *countStr = dict[@"count"];
	self.totalPriceL.text = [NSString stringWithFormat:@"合计:¥%@",priceStr];
	[self.toPayBt setTitle: [NSString stringWithFormat:@"去结算(%@)",countStr] forState:UIControlStateNormal];
}
@end
