//
//  SSJbutton.m
//  仿支付宝手机充值
//
//  Created by ssj on 16/9/19.
//  Copyright © 2016年 jiteng. All rights reserved.
//

#import "SSJbutton.h"
#import "UIView+SS.h"
#define ABColor(R, G, B, Alpha) [UIColor colorWithRed:(R)/255.0 green:(G)/255.0 blue:(B)/255.0 alpha:(Alpha)]
#define SCREEN_WIDTH ([UIScreen mainScreen].bounds.size.width)

@implementation SSJbutton
- (instancetype)initWithFrame:(CGRect)frame{

    if (self = [super initWithFrame:frame]) {
        self.size = CGSizeMake((SCREEN_WIDTH-60)/3, 80);
        self.layer.borderColor = ABColor(21, 135, 228, 1.0).CGColor;
        self.layer.borderWidth = 1;
        self.layer.cornerRadius = 5.0f;
        self.backgroundColor = [UIColor whiteColor];
    }

    return self;
}


- (SSJbutton *)buttonWithAbovelabeltitle:(NSString *)astr belowLabelTitle:(NSString *)bstr{

    UILabel * abovel = [[UILabel alloc] init];
    abovel.text = astr;
    abovel.font = [UIFont systemFontOfSize:18.0f];
    abovel.textColor = ABColor(21, 135, 228, 1.0);
    abovel.textAlignment = NSTextAlignmentCenter;
    [self addSubview:abovel];
    self.abovel = abovel;
    
    UILabel * belowL = [[UILabel alloc] init];
    belowL.text = bstr;
    belowL.font = [UIFont systemFontOfSize:14.0f];
    belowL.textColor = ABColor(78, 157, 232, 1.0);
    belowL.textAlignment = NSTextAlignmentCenter;
    [self addSubview:belowL];
    self.belowl = belowL;
    return self;


}

- (void)layoutSubviews {

    [super layoutSubviews];
    self.abovel.frame = CGRectMake(0, 15, self.width, 30);
    self.belowl.frame = CGRectMake(0, CGRectGetMaxY(self.abovel.frame), self.width, 20);

}
- (void)setHighlighted:(BOOL)highlighted{
    [super setHighlighted:highlighted];
    self.backgroundColor = highlighted ? ABColor(56, 145, 230, 0.9) : [UIColor whiteColor];
    self.abovel.textColor = highlighted ? [UIColor whiteColor] : ABColor(21, 135, 228, 1.0);
    self.belowl.textColor = highlighted ? [UIColor whiteColor] : ABColor(78, 157, 232, 1.0);
}

- (void)setEnabled:(BOOL)enabled{
    [super setEnabled:enabled];
    if (!enabled) {
        self.abovel.textColor = [UIColor lightGrayColor];
        self.belowl.textColor = [UIColor lightGrayColor];
        self.layer.borderColor = [UIColor lightGrayColor].CGColor;
        self.layer.cornerRadius = 5.0f;
    }

}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
