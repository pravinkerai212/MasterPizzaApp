//
//  MasterViewController.h
//  MasterPizza
//
//  Created by Ben Jakuben on 12/3/11.
//  Copyright (c) 2011 Progressive Insurance. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DetailViewController;

@interface MasterViewController : UITableViewController

@property (strong, nonatomic) DetailViewController *detailViewController;

@end
