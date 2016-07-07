#THAutoLoadSubViewEx

##可以让UIView根据类名及变量名后缀自动加载子视图的分类 (免去了大型UIView要写大批量addsubview的烦恼)

##使用方法:
将THAutoLoadSubViewEx文件夹导入自己的项目工程中, 为将要使用自动加载子视图的控件类名添加_auto后缀, 在该类中导入UIView+THEx.h头文件(如果是UITableViewCell及其子类,就导入UITableViewCell+THEx.h头文件),想要自动加载的实例变量命名以_auto结尾, 就能实现自动添加子视图了, 这些使用了自动添加子视图的控件要在分类里面提供的方法- (void)th_configIvars里面设置对应参数.
因为在我们自己重写的init方法中这些自动加载的实例变量还没有被初始化.

##具体见示例Demo
以下是Demo中的自动添加示例代码 , 带_auto的实例变量被自动添加到了THDemoView_auto视图上 , 而没有带后缀的实例变量一直都是nil , 这些没有带后缀的变量仍需要我们手动在init方法中实例化 , 这和本分类中的实现方法不冲突 可以放心使用
```objectivec

#import "THDemoView_auto.h"
#import "UIView+THEx.h"

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

```