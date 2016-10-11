//
//  SSJbutton.h
//  仿支付宝手机充值
//
//  Created by ssj on 16/9/19.
//  Copyright © 2016年 jiteng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SSJbutton : UIButton

/** xie写一个方法 astr 上面的title bstr 下面的title*/
- (SSJbutton*)buttonWithAbovelabeltitle:(NSString *)astr belowLabelTitle:(NSString *)bstr;

/** 上边的label*/
@property (nonatomic,weak)UILabel * abovel;
/** 下面的显示*/
@property (nonatomic,weak)UILabel * belowl;

@end
