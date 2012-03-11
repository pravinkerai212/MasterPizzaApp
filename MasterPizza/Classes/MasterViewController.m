//
//  MasterViewController.m
//  MasterPizza
//
//  Created by Ben Jakuben on 12/3/11.
//

#import "MasterViewController.h"
#import "DetailViewController.h"
#import "MenuSection.h"

@interface MasterViewController (Private)
- (void)setMenu;
@end

@implementation MasterViewController

@synthesize detailViewController = _detailViewController;
@synthesize menu = _menu;
@synthesize tableData = _tableData;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = @"Menu";
        if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad) {
            self.clearsSelectionOnViewWillAppear = NO;
            self.contentSizeForViewInPopover = CGSizeMake(320.0, 600.0);
        }
    }
    return self;
}

#pragma mark - View lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
	// Do any additional setup after loading the view, typically from a nib.
    [self setMenu];
    
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad) {
        [self.tableView selectRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0] animated:NO scrollPosition:UITableViewScrollPositionMiddle];
    }
    self.navigationController.navigationBar.hidden = NO;
    // TODO: Set back button text to "Home"
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
    } else {
        return YES;
    }
}

// Customize the number of sections in the table view.
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.tableData count];
}

// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        }
    }

    // Configure the cell.
    cell.textLabel.text = [self.tableData objectAtIndex:indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *key = [self.tableData objectAtIndex:indexPath.row];
    MenuSection *section = [[MenuSection alloc] initWithTitle:key andItems:[self.menu objectForKey:key]];
    
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
	    if (!self.detailViewController) {
	        self.detailViewController = [[DetailViewController alloc] initWithNibName:@"DetailViewController_iPhone" bundle:nil];
	    }
        self.detailViewController.detailItem = section;
        [self.navigationController pushViewController:self.detailViewController animated:YES];
    }
    else {
	    if (!self.detailViewController) {
	        self.detailViewController = [[DetailViewController alloc] initWithNibName:@"DetailViewController_iPad" bundle:nil];
	    }
        [self.detailViewController setDetailItem:section];
        [[self.splitViewController.viewControllers objectAtIndex:1] popViewControllerAnimated:NO];
        [[self.splitViewController.viewControllers objectAtIndex:1] pushViewController:self.detailViewController animated:NO];
    }
}

#pragma mark - Private methods

- (void)setMenu {
    NSString* plistPath = [[NSBundle mainBundle] pathForResource:@"menu" ofType:@"plist"];
    self.menu = [NSDictionary dictionaryWithContentsOfFile:plistPath];
    NSLog(@"%@", self.menu);
    
    NSMutableArray *mainSections = [[NSMutableArray alloc] init];
    for(id key in self.menu) {
        [mainSections addObject:key];
    }
    
    self.tableData = mainSections;
    [self.tableView reloadData];
}

@end
