//
//  ViewController+WrappedWeak.h
//  AssociatedWeakProperty
//
//  Created by 聂康 on 2020/7/31.
//  Copyright © 2020 com.nk. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface ViewController (WrappedWeak)

@property(nonatomic, weak)id object;

@end

NS_ASSUME_NONNULL_END
