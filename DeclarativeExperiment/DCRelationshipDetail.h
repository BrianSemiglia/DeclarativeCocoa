//
//  DCRelationshipDetail.h
//  DeclarativeExperiment
//
//  Created by Brian on 6/28/14.
//  Copyright (c) 2014 Brian Semiglia. All rights reserved.
//

#import <Foundation/Foundation.h>

@class RACSignal;

@interface DCRelationshipDetail : NSObject

- (instancetype)initWithSignal:(RACSignal *)signal andHandler:(void (^)(id response))handler;

@end
