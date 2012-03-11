//
//  DetailViewController.h
//  MasterPizza
//
//  Created by Ben Jakuben on 12/3/11.
//

#import <UIKit/UIKit.h>
#import "MenuSection.h"

@interface DetailViewController : UIViewController <UISplitViewControllerDelegate, UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) id detailItem;
@property (weak, nonatomic) IBOutlet UITableView *menuTableView;
@property (strong, nonatomic) NSArray *tableData;
@property (strong, nonatomic) MenuSection *menuSection;

@end
