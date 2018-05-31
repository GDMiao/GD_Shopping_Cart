//
//  GoodsModel.m
//  Shopping_Cart
//
//  Created by Michael-Miao on 2018/5/31.
//  Copyright © 2018年 MiaoGuodong . All rights reserved.
//

#import "GoodsModel.h"

@implementation GoodsModel
- (instancetype)init
{
	self = [super init];
	if (self) {
		_select = NO;
		_count = 1; // 默认 0 , 测试购物车 默认 1
		
	}
	return self;
}
- (void)dataParser:(id)data
{
	if (data) {
		
	} else {
		_name = [NSString stringWithFormat:@"商品 %u",arc4random() % 100];
		_introduce = [NSString stringWithFormat:@"介绍 --- %u",arc4random() % 100];
		_price = [NSString stringWithFormat:@"%u.00",arc4random() % 100];
		_imageUrl = [NSString stringWithFormat:@"imageUrl --- %u",arc4random() % 100];
	}
}
@end
