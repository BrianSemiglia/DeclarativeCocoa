DeclarativeCocoa
================

An experiment in declarative programming with Cocoa. This is a bit of a pipe dream but I'm trying to imagine a declarative approach as I would like to have available and then worry about the details afterwards so as not to limit the idea. Essentially, I'd like to be able to declare properties on an object and the relationships between those properties like this:

    + (BSRelationship *)relationshipBetweenSendBar:(UIView *)sendBar andToolBar:(UIView *)toolbar {
        BSRelationship *relationship = [[BSRelationship alloc] initWithFirstObject:sendBar secondObject:toolbar];
        relationship.threadSafe = NO;
        relationship.symmetrical = NO;
        relationship.description = ^{
            // contactBar.frame = sendbar.editing ? hiddenFrame : shownFrame;
        };
        return relationship;
    }
    
    // The use of class method prevents accessing/mutating other instance variables outside of the provided scope.

Current goals:
- Reduce mutability.
- Reduce procedural orientation.
- Reduce reaching too deeply into objects (object.property.property.property etc).

Unsolved problems:
- One to many relationships.

There are more details documented in the sample project.
