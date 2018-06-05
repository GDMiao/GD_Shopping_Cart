//
//  Shopping_Cart_PriceView.h
//  Shopping_Cart
//
//  Created by Michael-Miao on 2018/6/5.
//  Copyright © 2018年 MiaoGuodong . All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GoodsModel.h"
@interface Shopping_Cart_PriceView : UIView
@property (copy, nonatomic) void (^payBlock)(void);
@property (copy, nonatomic) void (^selectAllBlock)(BOOL selected);
@property (weak, nonatomic) IBOutlet UIButton *selectAllBt;
@property (weak, nonatomic) IBOutlet UILabel *totalPriceL;
@property (weak, nonatomic) IBOutlet UIButton *toPayBt;

// 更新视图 传递参数看情况而定 array / dict
// price : 123
// count : 12
// singleSel : yes / no
- (void)allrefreshPriceViewUI:(NSDictionary *)dict;
- (void)singleRefreshPriceViewUI:(NSDictionary *)dict;
@end
