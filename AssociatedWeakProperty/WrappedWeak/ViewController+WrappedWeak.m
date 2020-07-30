//
//  ViewController+WrappedWeak.m
//  AssociatedWeakProperty
//
//  Created by 聂康 on 2020/7/31.
//  Copyright © 2020 com.nk. All rights reserved.
//

#import "ViewController+WrappedWeak.h"
#import "WrappedWeak.h"
#import <objc/runtime.h>

@implementation ViewController (WrappedWeak)

- (void)setObject:(id)object {
    WrappedWeak *wrappedWeak = [[WrappedWeak alloc] initWithBlock:^{
        objc_setAssociatedObject(self, @selector(object), nil, OBJC_ASSOCIATION_ASSIGN);
    }];
    objc_setAssociatedObject(object, (__bridge const void *)(wrappedWeak.block), wrappedWeak.block, OBJC_ASSOCIATION_COPY_NONATOMIC);
    objc_setAssociatedObject(self, @selector(object), object, OBJC_ASSOCIATION_ASSIGN);
}

- (id)object {
    return objc_getAssociatedObject(self, _cmd);
}

@end
