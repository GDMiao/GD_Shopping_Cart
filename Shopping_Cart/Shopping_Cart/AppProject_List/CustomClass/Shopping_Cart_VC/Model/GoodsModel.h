//
//  GoodsModel.h
//  Shopping_Cart
//
//  Created by Michael-Miao on 2018/5/31.
//  Copyright © 2018年 MiaoGuodong . All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GoodsModel : NSObject
@property (nonatomic, copy) NSString *select; // 默认 0 未选择, 1 选择
@property (nonatomic, copy) NSString *imageUrl;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *introduce;
@property (nonatomic, copy) NSString *price;
@property (nonatomic, assign) NSInteger count; // 默认数量是 1

- (void)dataParser:(id)data;
@end
