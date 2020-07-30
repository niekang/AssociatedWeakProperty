//
//  ViewController.m
//  AssociatedWeakProperty
//
//  Created by 聂康 on 2020/7/30.
//  Copyright © 2020 com.nk. All rights reserved.
//

#import "ViewController.h"

/**
 测试不同分类实现的时候通过调整 build phases 中的 compile sources 分类.m文件的先后顺序来测试
 */
//#import "ViewController+WeakProperty.h"
#import "ViewController+WrappedWeak.h"

@interface XXLabel : UILabel

@end

@implementation XXLabel

- (void)dealloc {
    NSLog(@"XXLabel dealloc");
}

@end

@interface ViewController ()

@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    XXLabel *label = [[XXLabel alloc] init];
    self.object = label;
    NSLog(@"%@",self.object);
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [(UILabel *)self.object setText:@"name"];
}





@end
