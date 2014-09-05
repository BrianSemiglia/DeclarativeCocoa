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
#import "ReactiveCocoa.h"
#import "DCSendBar.h"

@interface ViewController ()
@property (nonatomic) DCSendBar *sendbar;
@property (nonatomic) UIView *contactBar;
@property (nonatomic) NSArray *relationships;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Relationships are gathered here to allow for Interface Builder support.
    self.relationships = @[[ViewController relationshipBetweenSendBar:self.sendbar andToolBar:self.contactBar]];
}

+ (DCRelationship *)relationshipBetweenSendBar:(DCSendBar *)sendBar andToolBar:(UIView *)toolbar {
    
    DCRelationship *relationship = [[DCRelationship alloc] init];
    
    RACSignal *signal = RACSignalWithObserverTargetAndProperty(relationship, sendBar, editing);
    RACDisposable *toolbarHidingDetail = [signal subscribeNext:^(id editing) {
        // toolBar.frame = editing ? hiddenFrame : shownFrame;
    }];
        
    RACSignal *signal2 = RACSignalWithObserverTargetAndProperty(relationship, sendBar, editing);
    RACDisposable *toolbarHidingDetail2 = [signal2 subscribeNext:^(id response) {
        // toolBar.frame = editing ? hiddenFrame : shownFrame;
    }];
    
    relationship.details = @[toolbarHidingDetail, toolbarHidingDetail2];
    return relationship;
}

- (DCSendBar *)sendbar {
    if (!_sendbar) {
        _sendbar = [ViewController sendbar];
    }
    return _sendbar;
}

- (UIView *)contactBar {
    if (!_contactBar) {
        _contactBar = [ViewController contactBar];
    }
    return _contactBar;
}

+ (DCSendBar *)sendbar {
    DCSendBar *sendbar = [[DCSendBar alloc] init];
    sendbar.backgroundColor = [UIColor blueColor];
    return sendbar;
}

+ (UIView *)contactBar {
    UIView *contactBar = [[UIView alloc] init];
    return contactBar;
}

@end
