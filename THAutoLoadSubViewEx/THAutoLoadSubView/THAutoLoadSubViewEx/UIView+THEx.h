//
//  UIView+THEx.h
//  THMediaPlayeCacher
//
//  Created by litianhao on 16/6/21.
//  Copyright © 2016年 litianhao. All rights reserved.
//

#import <UIKit/UIKit.h>
@interface UIView (THEx)

/// 用class 创建视图 加到当前视图中 并返回新创建视图指针
- (UIView *)th_addsubview:(Class)subViewClass;
- (void)th_configIvars;

@end
