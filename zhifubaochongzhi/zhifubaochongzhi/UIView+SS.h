//
//  UIView+SS.h
//  仿支付宝手机充值
//
//  Created by ssj on 16/9/19.
//  Copyright © 2016年 jiteng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (SS)
@property (nonatomic, assign)CGFloat x;
@property (nonatomic, assign)CGFloat y;
@property (nonatomic, assign)CGFloat width;
@property (nonatomic, assign)CGFloat height;
@property (nonatomic, assign)CGSize size;
@property (nonatomic, assign)CGPoint origin;
@property (nonatomic, assign) CGFloat centerX;
@property (nonatomic, assign) CGFloat centerY;

/** 判断self和anotherView是否重叠 */
- (BOOL)intersectsWithAnotherView:(UIView *)anotherView;

@end
