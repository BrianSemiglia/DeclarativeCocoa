//
//  BSRelationship.h
//  DeclarativeExperiment
//
//  Created by Brian on 6/20/14.
//  Copyright (c) 2014 Brian Semiglia. All rights reserved.
//

#import <Foundation/Foundation.h>

/*
 * A relationship between properties of an object.
 * @discussion The relationship is reevaluated when participating objects change.
 */
@interface BSRelationship : NSObject

/*
 * Describes details of relationship.
 */
@property (nonatomic, copy) void (^description)(void);

/*
 * Relationship description is evaluated on main thread if set to YES and maybe be evaluated on background otherwise.
 */
@property (nonatomic, assign) BOOL threadSafe;

/*
 * Relationship is only evaluated when first object changes if set to NO.
 */
@property (nonatomic, assign) BOOL symmetrical;

/*
 *
 */
- (instancetype)initWithFirstObject:(id)firstObject secondObject:(id)secondObject;

@end
