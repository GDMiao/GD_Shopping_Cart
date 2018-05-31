//
//  Shopping_Cart_Cell.m
//  Shopping_Cart
//
//  Created by Michael-Miao on 2018/5/31.
//  Copyright © 2018年 MiaoGuodong . All rights reserved.
//

#import "Shopping_Cart_Cell.h"
@interface Shopping_Cart_Cell ()
{
	UIImage *_addImage,*_minusImage,*_minusImageHL;
	NSInteger _goodsCount;
}
@property (weak, nonatomic) IBOutlet UIImageView *photoImagView;
@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UILabel *introduce;
@property (weak, nonatomic) IBOutlet UILabel *price;
@property (weak, nonatomic) IBOutlet UILabel *count;
@property (weak, nonatomic) IBOutlet UIButton *addBt;
@property (weak, nonatomic) IBOutlet UIButton *minusBt;
@property (weak, nonatomic) IBOutlet UIButton *selectBt;
@end

@implementation Shopping_Cart_Cell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
	self.selectionStyle = UITableViewCellSelectionStyleNone;
	_addImage = [UIImage imageNamed:@"icon-cart-jia"];
	_minusImage = [UIImage imageNamed:@"icon-cart-jian_1"];
	_minusImageHL = [UIImage imageNamed:@"icon-cart-jian"];
	_minusBt.tag = 10001;
	_addBt.tag = 20001;
	
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
#pragma mark 选择 加 减 事件
- (IBAction)checkedGoodsAction:(UIButton *)sender {
	sender.selected = !sender.selected;
	self.goods.select = sender.selected;
	if (self.delegate && [self.delegate respondsToSelector:@selector(shoppingCartCell:selected:)]) {
		[self.delegate shoppingCartCell:self selected:sender.selected];
	}
}

- (IBAction)goodsCountAction:(UIButton *)sender {
	if (sender.tag == 10001) {
		if (_goodsCount > 1) {
			_goodsCount -= 1;
		}
	} else {
		_goodsCount += 1;
	}
	if (_goodsCount == 1) {
		[_minusBt setImage:_minusImage forState:UIControlStateNormal];
	}else if (_goodsCount == 2) {
		[_minusBt setImage:_minusImageHL forState:UIControlStateNormal];
	}
	_goods.count = _goodsCount;
	_count.text = [NSString stringWithFormat:@"%ld",_goodsCount];
	if (self.delegate && [self.delegate respondsToSelector:@selector(shoppingCartCell:selected:)]) {
		[self.delegate shoppingCartCell:self selected:self.selectBt.selected];
	}
}


#pragma mark setter goods
- (void)setGoods:(GoodsModel *)goods
{
	_goods = goods;
	_photoImagView.backgroundColor = [self randomColor];
	_name.text = goods.name;
	_introduce.text = goods.introduce;
	_price.text = goods.price;
	_count.text = [NSString stringWithFormat:@"%ld",goods.count];
	_goodsCount = goods.count;
	_selectBt.selected = goods.select;
}

#pragma mark 随机色
- (UIColor *)randomColor
{
	int R = (arc4random() % 256) ;
	int G = (arc4random() % 256) ;
	int B = (arc4random() % 256) ;
	return [UIColor colorWithRed:R/255.0 green:G/255.0 blue:B/255.0 alpha:1];
}
@end
