//
//  MasterViewController.h
//  MasterPizza
//
//  Created by Ben Jakuben on 12/3/11.
//

#import <UIKit/UIKit.h>

@class DetailViewController;

@interface MasterViewController : UITableViewController

@property (strong, nonatomic) DetailViewController *detailViewController;
@property (strong, nonatomic) NSDictionary *menu;
@property (strong, nonatomic) NSArray *tableData;

@end
