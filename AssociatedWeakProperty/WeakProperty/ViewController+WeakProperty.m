//
//  ViewController+WeakProperty.m
//  AssociatedWeakProperty
//
//  Created by 聂康 on 2020/7/30.
//  Copyright © 2020 com.nk. All rights reserved.
//

#import "ViewController+WeakProperty.h"
#import <objc/runtime.h>


static NSString *objectKey = @"weakObjectKey";

@implementation ViewController (WeakProperty)

void objc_setAssociatedWeakObject(id _Nonnull object, void * _Nonnull key, id _Nullable value) {
    
    NSString *associatedWeakClassStr = [NSString stringWithFormat:@"AssociatedWeak_%@", NSStringFromClass([value class])];
    Class class = objc_getClass(associatedWeakClassStr.UTF8String);
    if (!class) {
        class = objc_allocateClassPair([value class], associatedWeakClassStr.UTF8String, 0);
        objc_registerClassPair(class);
    }
    SEL deallocSEL = NSSelectorFromString(@"dealloc");
    Method deallocMethod = class_getInstanceMethod(class, deallocSEL);
    const char *types = method_getTypeEncoding(deallocMethod);
    IMP imp = imp_implementationWithBlock(^(){
        NSLog(@"sss");
        objc_setAssociatedObject(object, key, nil, OBJC_ASSOCIATION_ASSIGN);

    });
    
    class_addMethod(class, deallocSEL, imp, types);
    object_setClass(value, class);
    
    objc_setAssociatedObject(object, key, value, OBJC_ASSOCIATION_ASSIGN);
}

- (void)setObject:(id)object {
    objc_setAssociatedWeakObject(self, &objectKey, object);
    objc_setAssociatedObject(self, &objectKey, object, OBJC_ASSOCIATION_ASSIGN);
}

- (id)object {
    return objc_getAssociatedObject(self, &objectKey);
}

@end
