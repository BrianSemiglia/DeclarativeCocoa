//
//  NSObject+RelationshipExtraction.h
//  DeclarativeExperiment
//
//  Created by Brian on 6/20/14.
//  Copyright (c) 2014 Brian Semiglia. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (RelationshipExtraction)

/*
 * A collection of relationships extracted from the object by reflecting on it's interface.
 * @discussion The relationships will be kept up-to-date as long as they are retained.
 */
- (NSArray *)extractedRelationships;

@end
