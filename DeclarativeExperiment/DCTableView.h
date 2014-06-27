//
//  BSTableView.h
//  DeclarativeExperiment
//
//  Created by Brian on 6/24/14.
//  Copyright (c) 2014 Brian Semiglia. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DCTableView : UITableView

@property (nonatomic, copy) UITableViewCell * (^cellDecorationBlock)(UITableView *tableView, NSIndexPath *path);

@end
