//
//  BSRelationship.m
//  DeclarativeExperiment
//
//  Created by Brian on 6/20/14.
//  Copyright (c) 2014 Brian Semiglia. All rights reserved.
//

#import "DCRelationship.h"
#import "ReactiveCocoa.h"

@interface DCRelationship ()
@end

@implementation DCRelationship

- (instancetype)initWithDetails:(NSArray *)details {
    self = super.init;
    self.details = details.copy;
    return self;
}

@end
