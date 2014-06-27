//
//  ViewController.m
//  DeclarativeExperiment
//
//  Created by Brian on 6/20/14.
//  Copyright (c) 2014 Brian Semiglia. All rights reserved.
//

#import "ViewController.h"
#import "DCRelationship.h"
#import "NSObject+RelationshipExtraction.h"
#import "DCTableView.h"
@import CoreData;

@interface ViewController ()
@property (nonatomic) UIView *sendbar;
@property (nonatomic) UIView *contactBar;
@property (nonatomic) id audioPlayer;
@property (nonatomic) NSArray *relationships;
@property (nonatomic) DCTableView *tableView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Relationships are gathered here to allow for Interface Builder support.
    self.relationships = self.extractedRelationships;
}

+ (DCRelationship *)relationshipBetweenSendBar:(UIView *)sendBar andToolBar:(UIView *)toolbar {
    DCRelationship *relationship = [[DCRelationship alloc] initWithFirstObject:sendBar secondObject:toolbar];
    relationship.threadSafe = NO;
    relationship.symmetrical = NO;
    relationship.description = ^{
        // contactBar.frame = sendbar.editing ? hiddenFrame : shownFrame;
    };
    return relationship;
}

+ (DCRelationship *)relationshipBetweenAudioPlayer:(id)audioPlayer andView:(UIView *)view {
    DCRelationship *relationship = [[DCRelationship alloc] initWithFirstObject:audioPlayer secondObject:view];
    relationship.threadSafe = YES;
    relationship.symmetrical = NO;
    relationship.description = ^{
        // audioPlayer.isPlaying = view.isVisible
    };
    return relationship;
}

+ (DCRelationship *)relationshipBetweenFetchedResultsController:(NSFetchedResultsController *)fetchedResultsController
                                                   andTableView:(DCTableView *)tableView {
    
    DCRelationship *relationship = [[DCRelationship alloc] initWithFirstObject:fetchedResultsController secondObject:tableView];
    relationship.threadSafe = NO;
    relationship.symmetrical = NO;
    relationship.description = ^{
        // tableView.cellDecorationBlock = fetchedResultsController.fetchedObjects[indexPath].cellRepresentationBlock;
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

+ (NSFetchedResultsController *)fetchedResultsController {
    NSFetchedResultsController *fetchedResultsController = [[NSFetchedResultsController alloc] init];
    return fetchedResultsController;
}

// modal view controller = cell.mapQuery + webviewController
// modal view controller = cell.searchQuery + webviewController
// messages.read = view.isVisible
// tableView.inset = sendbar.height
// audioPlayer.isPlaying = view.isVisible

@end
