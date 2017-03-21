
//
//  ViewController.m
//  仿支付宝手机充值
//
//  Created by ssj on 16/9/19.
//  Copyright © 2016年 jiteng. All rights reserved.
//

#import "ViewController.h"
#import "UIView+SS.h"//扩展类
#import "SSJbutton.h"// 自定义的button
#import "MBProgressHUD.h"

//#import "MBProgressHUD+MJ.h"

#define ABColor(R, G, B, Alpha) [UIColor colorWithRed:(R)/255.0 green:(G)/255.0 blue:(B)/255.0 alpha:(Alpha)]
#define SCREEN_WIDTH ([UIScreen mainScreen].bounds.size.width)
#define LINECOLOR [UIColor colorWithWhite:0.8 alpha:0.5]
#define ABButtonMargin 10.0
@interface ViewController ()<UITextFieldDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self setupNavi];
    [self setupPhoneNumView];
    [self setupBtn];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -- 初始化方法
/**初始化方法导航栏*/
- (void)setupNavi{
//设置导航栏
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    UILabel * title = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 20, 64)];
    title.text = @"手机充值";
    title.textAlignment = NSTextAlignmentCenter;
    title.textColor = [UIColor blackColor];
    title.font = [UIFont systemFontOfSize:18];
    self.navigationItem.titleView = title;
    //设置导航栏返回蓝按钮
    UIButton *back = [UIButton buttonWithType:UIButtonTypeCustom];
    back.frame = CGRectMake(0, 0, 40, 44);
    back.contentEdgeInsets = UIEdgeInsetsMake(0, -23, 0, 0);
    [back setImage:[UIImage imageNamed:@"black_back"] forState:UIControlStateNormal];
    [back addTarget:self action:@selector(backBtn) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem * backItem = [[UIBarButtonItem alloc] initWithCustomView:back];
    self.navigationItem.leftBarButtonItem = backItem;
}
/** 初始化手机号码输入框*/
- (void)setupPhoneNumView{

    UITextField * phoneNumF = [UITextField new];
    phoneNumF.delegate = self;
    phoneNumF.text = @"132 3370 8692";
    phoneNumF.placeholder = @"请输入充值手机号";
    [phoneNumF setValue:ABColor(232,232,232,1.0) forKeyPath:@"_placeholderLabel.textColor"];
    phoneNumF.keyboardType = UIKeyboardTypePhonePad;
    phoneNumF.textColor = [UIColor blackColor];
    phoneNumF.font = [UIFont systemFontOfSize:26.0];
    phoneNumF.frame = CGRectMake(20, 84+6, 300, 40);
    [self.view addSubview:phoneNumF];
    
    UIImageView *addressView = [[UIImageView alloc] init];
    addressView.image = [UIImage imageNamed:@"chargePhone"];
    addressView.frame = CGRectMake(SCREEN_WIDTH-50, phoneNumF.y+5, 30, 30);
    [self.view addSubview:addressView];
    
    UILabel *guishudiL = [UILabel new];
    guishudiL.text = @"账户绑定号码(广东移动)";
    guishudiL.textColor = ABColor(177, 179, 182, 1.0);
    guishudiL.font = [UIFont systemFontOfSize:12];
    guishudiL.frame = CGRectMake(phoneNumF.x, CGRectGetMaxY(phoneNumF.frame)-3, 250, 20);
    [self.view addSubview:guishudiL];
    
    UIView *lineView = [UIView new];
    lineView.backgroundColor = LINECOLOR;
    lineView.frame = CGRectMake(20, CGRectGetMaxY(guishudiL.frame)+10, SCREEN_WIDTH-40, 1);
    [self.view addSubview:lineView];








}
- (void)setupBtn {
    for (int i = 0; i < 8; i++) {
        SSJbutton *abBtn = [[SSJbutton alloc] init];
        switch (i) {
            case 0:
            {
                [abBtn buttonWithAbovelabeltitle:@"10元" belowLabelTitle:@"备货中"];
                abBtn.enabled = NO;
            }
                break;
            case 1:
            {
                [abBtn buttonWithAbovelabeltitle:@"20元" belowLabelTitle:@"售价:19.91"];
                
            }
                break;
            case 2:
            {
                [abBtn buttonWithAbovelabeltitle:@"30元" belowLabelTitle:@"售价:29.94"];
                
            }
                break;
            case 3:
            {
                [abBtn buttonWithAbovelabeltitle:@"50元" belowLabelTitle:@"售价:49.91"];
            
            }
                break;
                
            case 4:
            {
                [abBtn buttonWithAbovelabeltitle:@"100元" belowLabelTitle:@"售价:99.91"];
                
            }
                break;
            case 5:
            {
                [abBtn buttonWithAbovelabeltitle:@"200元" belowLabelTitle:@"售价:199.91"];

            }
                break;
            case 6:
            {
                [abBtn buttonWithAbovelabeltitle:@"300元" belowLabelTitle:@"售价:297.91"];
                
            }
                break;
            case 7:
            {
                [abBtn buttonWithAbovelabeltitle:@"500元" belowLabelTitle:@"售价:499.91"];
                
            }
                break;
                
            default:
                break;
        }
        
        int col = i % 3;
        abBtn.x = col * (abBtn.width + ABButtonMargin)+20;
        int row = i / 3;
        abBtn.y = row * (abBtn.height + ABButtonMargin)+180;
        [self.view addSubview:abBtn];
        [abBtn addTarget:self action:@selector(chargePhone:) forControlEvents:UIControlEventTouchUpInside];
    }
}
#pragma mark -- 点击方法
-(void)backBtn{
    [self.navigationController popViewControllerAnimated:NO];
}

-(void)chargePhone:(SSJbutton*)sender{
    NSLog(@"充值%@", sender.abovel.text);
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [MBProgressHUD hideHUD ];
    });
    [MBProgressHUD showMessage:[NSString stringWithFormat:@"充值%@", sender.abovel.text]];
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{

    [self.view endEditing:YES];
}

@end
