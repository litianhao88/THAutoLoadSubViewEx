//
//  ViewController.m
//  THAutoLoadSubView
//
//  Created by litianhao on 16/7/6.
//  Copyright © 2016年 litianhao. All rights reserved.
//

#import "ViewController.h"
#import "THDemoView_auto.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    THDemoView_auto *demo = [[THDemoView_auto alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:demo];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
