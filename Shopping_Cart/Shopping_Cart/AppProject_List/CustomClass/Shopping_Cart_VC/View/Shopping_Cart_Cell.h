//
//  Shopping_Cart_Cell.h
//  Shopping_Cart
//
//  Created by Michael-Miao on 2018/5/31.
//  Copyright © 2018年 MiaoGuodong . All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GoodsModel.h"
@protocol Shopping_Cart_CellSelectedDelegate;
@interface Shopping_Cart_Cell : UITableViewCell
@property (nonatomic, strong) GoodsModel *goods;
@property (nonatomic, weak) id <Shopping_Cart_CellSelectedDelegate> delegate;
@end

@protocol Shopping_Cart_CellSelectedDelegate <NSObject>
- (void)shoppingCartCell:(Shopping_Cart_Cell *)cell selected:(BOOL)selected;
@end
