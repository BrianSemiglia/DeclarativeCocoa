//
//  BSRelationship.h
//  DeclarativeExperiment
//
//  Created by Brian on 6/20/14.
//  Copyright (c) 2014 Brian Semiglia. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 * A relationship between properties of an object.
 * @discussion The relationship is reevaluated when participating objects change.
 */
@interface DCRelationship : NSObject

/**
 * The details of the relationship stored as RACSignals.
 */
@property (nonatomic, strong) NSArray *details;

@end
