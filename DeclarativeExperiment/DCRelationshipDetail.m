//
//  DCRelationshipDetail.m
//  DeclarativeExperiment
//
//  Created by Brian on 6/28/14.
//  Copyright (c) 2014 Brian Semiglia. All rights reserved.
//

#import "DCRelationshipDetail.h"
#import "RACSignal.h"

@interface DCRelationshipDetail ()
@property (nonatomic, copy) void (^handler)(id response);
@end

@implementation DCRelationshipDetail

- (instancetype)initWithSignal:(RACSignal *)signal andHandler:(void (^)(id response))handler {
    self = super.init;
    [signal subscribeNext:handler];
    return self;
}

@end
