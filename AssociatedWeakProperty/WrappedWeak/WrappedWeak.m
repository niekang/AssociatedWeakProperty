//
//  WrappedWeak.m
//  AssociatedWeakProperty
//
//  Created by 聂康 on 2020/7/31.
//  Copyright © 2020 com.nk. All rights reserved.
//

#import "WrappedWeak.h"

@implementation WrappedWeak

- (void)dealloc {
    if (self.block) {
        NSLog(@"dealloc");
        self.block();
    }
}

- (instancetype)initWithBlock:(DeallocBlock)block {
    if (self) {
        self.block = block;
    }
    return self;
}

@end
