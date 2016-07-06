//
//  UITableViewCell+THEx.m
//  THAutoLoadSubView
//
//  Created by litianhao on 16/7/6.
//  Copyright © 2016年 litianhao. All rights reserved.
//

#import "UITableViewCell+THEx.h"
#import <objc/runtime.h>
#import "NSObject+THRuntimeEx.h"
#import "UIView+THEx.h"

@implementation UITableViewCell (THEx)


+ (void)load
{
    Method systemMethod = class_getInstanceMethod([self class], @selector(initWithStyle:reuseIdentifier:));
    Method th_customMethod = class_getInstanceMethod([self class], @selector(th_initWithStyle:reuseIdentifier:));
    /**
     *  我们在这里使用class_addMethod()函数对Method Swizzling做了一层验证，如果self没有实现被交换的方法，会导致失败。
     *  而且self没有交换的方法实现，但是父类有这个方法，这样就会调用父类的方法，结果就不是我们想要的结果了。
     *  所以我们在这里通过class_addMethod()的验证，如果self实现了这个方法，class_addMethod()函数将会返回NO，我们就可以对其进行交换了。
     */
    if (!class_addMethod([self class], @selector(initWithStyle:reuseIdentifier:), method_getImplementation(th_customMethod), method_getTypeEncoding(th_customMethod))) {
        method_exchangeImplementations(systemMethod, th_customMethod);
    }
    
}

- (instancetype)th_initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    UITableViewCell *instance = [self th_initWithStyle:style reuseIdentifier:reuseIdentifier] ;
    if (![NSStringFromClass([self class]) hasSuffix:@"_auto"]) {
        return instance ;
    }
    
    NSLog(@"%s" , __func__);
    
    NSDictionary *ivarMap = [ instance th_getIvasUsingFilterBlock:^BOOL(NSString *ivarName, NSString *ivarTypeName) {
        if ([ivarName hasSuffix:@"_auto"] && [NSClassFromString(ivarTypeName) isSubclassOfClass:[UIView class]]) {
            return YES;
        }
        return  NO ;
    }];
    if (ivarMap.count) {
        [ivarMap enumerateKeysAndObjectsUsingBlock:^(NSString  *_Nonnull iVarName, NSString  *_Nonnull classTypeName, BOOL * _Nonnull stop) {
            [instance setValue:[self.contentView th_addsubview:NSClassFromString(classTypeName)] forKey:iVarName];
        }];
    }
    
    if ([self respondsToSelector:@selector(th_configIvars)]) {
        [self th_configIvars];
    }
    return instance ;
}
@end
