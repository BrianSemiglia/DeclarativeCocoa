DeclarativeCocoa
================

This is a bit of a pipe dream but I'm trying to imagine a purely declarative form of Cocoa. And in the spirit of declarative programming I'm starting with the 'what' and working my way towards the 'how', so there are many unsolved problems. Here's the gist.

1. Class declares properties.
2. Class declares relationships between properties.
3. Relationships are gathered and stored.
4. Relationships are evalutated when involved properties change.

A relationship would look something like this:
    
    + (DCRelationship *)relationshipBetweenSendBar:(DCSendBar *)sendBar andToolBar:(UIView *)toolbar {
    
        DCRelationship *relationship = [[DCRelationship alloc] init];
    
        RACSignal *signal = RACSignalWithObserverTargetAndProperty(relationship, sendBar, editing);
        RACDisposable *toolbarHidingDetail = [signal subscribeNext:^(id editing) {
            // toolBar.frame = editing ? hiddenFrame : shownFrame;
        }];
        
        RACSignal *signal2 = RACSignalWithObserverTargetAndProperty(relationship, sendBar, editing);
        DCRelationshipDetail *backgroundColorDetail = [[DCRelationshipDetail alloc] initWithSignal:signal2 andHandler:^(id response) {
            // toolBar.backgroundColor = sendBar.backgroundColor;
        }];
    
        relationship.details = @[toolbarHidingDetail, backgroundColorDetail];
    
        return relationship;
    }
    
    // The use of class methods prevents accessing/mutating instance variables that are outside of the provided scope.

Current goals:
- Reduce mutability.
- Reduce procedural orientation.

Unsolved problems:
- Replacing callbacks with properties representing state (-viewDidAppear vs. self.view.isVisible) without the need to subclass native Cocoa classes.

There are more details documented in the sample project. Any feedback is welcome.
