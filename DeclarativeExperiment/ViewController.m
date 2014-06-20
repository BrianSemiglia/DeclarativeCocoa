//
//  ViewController.m
//  DeclarativeExperiment
//
//  Created by Brian on 6/20/14.
//  Copyright (c) 2014 Brian Semiglia. All rights reserved.
//

#import "ViewController.h"
#import "BSRelationship.h"
#import "NSObject+RelationshipExtraction.h"

@interface ViewController ()
@property (nonatomic) UIView *sendbar;
@property (nonatomic) UIView *contactBar;
@property (nonatomic) id audioPlayer;
@property (nonatomic) NSArray *relationships;
@end

@implementation ViewController

- (id)init {
    self = super.init;
    self.relationships = self.extractedRelationships;
    return self;
}

+ (BSRelationship *)relationshipBetweenSendBar:(UIView *)sendBar andToolBar:(UIView *)toolbar {
    BSRelationship *relationship = [[BSRelationship alloc] initWithFirstObject:sendBar secondObject:toolbar];
    relationship.threadSafe = NO;
    relationship.symmetrical = NO;
    relationship.description = ^{
        // contactBar.frame = sendbar.editing ? hiddenFrame : shownFrame;
    };
    return relationship;
}

+ (BSRelationship *)relationshipBetweenAudioPlayer:(id)audioPlayer andView:(UIView *)view {
    BSRelationship *relationship = [[BSRelationship alloc] initWithFirstObject:audioPlayer secondObject:view];
    relationship.threadSafe = YES;
    relationship.symmetrical = NO;
    relationship.description = ^{
        // audioPlayer.isPlaying = view.isVisible
    };
    return relationship;
}

+ (UIView *)sendbar {
    UIView *sendbar = [[UIView alloc] init];
    sendbar.backgroundColor = [UIColor blueColor];
    return sendbar;
}

+ (UIView *)contactBar {
    UIView *contactBar = [[UIView alloc] init];
    return contactBar;
}

// modal view controller = cell.mapQuery + webviewController
// modal view controller = cell.searchQuery + webviewController
// messages.read = view.isVisible
// tableView.inset = sendbar.height
// audioPlayer.isPlaying = view.isVisible

@end
