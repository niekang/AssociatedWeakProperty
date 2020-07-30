//
//  WrappedWeak.h
//  AssociatedWeakProperty
//
//  Created by 聂康 on 2020/7/31.
//  Copyright © 2020 com.nk. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^DeallocBlock)(void);

NS_ASSUME_NONNULL_BEGIN

@interface WrappedWeak : NSObject

@property (nonatomic, copy)DeallocBlock block;

- (instancetype)initWithBlock:(DeallocBlock)block;

@end

NS_ASSUME_NONNULL_END
