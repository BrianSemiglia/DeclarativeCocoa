//
//  BSRelationship.m
//  DeclarativeExperiment
//
//  Created by Brian on 6/20/14.
//  Copyright (c) 2014 Brian Semiglia. All rights reserved.
//

#import "DCRelationship.h"

@implementation DCRelationship

- (instancetype)initWithFirstObject:(id)firstObject secondObject:(id)secondObject {
    self = super.init;
    // Inspect properties of both objects and subscribe to changes of all of those properties.
    // Re-evaulate description when signal is received.
    return self;
}

@end
