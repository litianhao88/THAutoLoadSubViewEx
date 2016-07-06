//
//  THDemoView.m
//  THAutoLoadSubView
//
//  Created by litianhao on 16/7/6.
//  Copyright © 2016年 litianhao. All rights reserved.
//

#import "THDemoView_auto.h"
#import "UIView+THEx.h"
#import "UITableViewCell+THEx.h"
@interface THDemoView_auto  ()

@property (nonatomic,weak) UILabel *labelOne_auto;
@property (nonatomic,weak) UILabel *labelTwo;
@property (nonatomic,weak) UIButton  *btn_auto;
@property (nonatomic,weak) UIButton *btn;

@end

@implementation THDemoView_auto

// 若要使用autoLoadSubview功能 就要在这个方法中配置实例变量的数据  , 这个方法是在调用了initwithframe后, 将
//所有带_auto后缀的控件加入到当前视图后紧接着调用的 , 所以在这里面写实例变量的配置代码 跟在initwithframe
//里面写没区别 放心用

-  (void)th_configIvars
{
    self.labelTwo.backgroundColor = self.labelOne_auto.backgroundColor = self.btn.backgroundColor = self.btn_auto.backgroundColor = [UIColor redColor];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    self.labelOne_auto.frame = CGRectMake(20, 100, 100, 30);
    self.labelTwo.frame = CGRectMake(20, 200, 100, 30);
    self.btn_auto.frame = CGRectMake(20, 300, 100, 30);
    self.btn.frame = CGRectMake(20, 400, 100, 30);
}

@end
