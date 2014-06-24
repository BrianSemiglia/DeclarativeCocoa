DeclarativeCocoa
================

This is a bit of a pipe dream but I'm trying to imagine a purely declarative form of Reactive Cocoa. And in the spirit of declarative programming I'm starting with the 'what' and working my way towards the 'how' so there are many unsolved problems. Here's the gist.

1. Class declares properties.
2. Class declares relationships between properties.
3. Relationships are gathered and stored.
4. Relationships are evalutated when involved properties change.

A relationship would look something like this:

    + (BSRelationship *)relationshipBetweenSendBar:(UIView *)sendBar andToolBar:(UIView *)toolbar {
        BSRelationship *relationship = [[BSRelationship alloc] initWithFirstObject:sendBar secondObject:toolbar];
        relationship.threadSafe = NO;
        relationship.symmetrical = NO;
        relationship.description = ^{
            // contactBar.frame = sendbar.editing ? hiddenFrame : shownFrame;
        };
        return relationship;
    }
    
    // The use of class methods prevents accessing/mutating instance variables that are outside of the provided scope.

Current goals:
- Reduce mutability.
- Reduce procedural orientation.
- Reduce reaching too deeply into objects (object.property.property.property etc).

Unsolved problems:
- One to many relationships.
- Callbacks must be replaced with properties representing state (viewDidAppear vs. self.view.isVisible).
- Implementing delegate responsibilities.

There are more details documented in the sample project. Any feedback is welcome.
