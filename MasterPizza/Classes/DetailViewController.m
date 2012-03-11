//
//  DetailViewController.m
//  MasterPizza
//
//  Created by Ben Jakuben on 12/3/11.
//

#import "DetailViewController.h"
#import "HomeViewController.h"

@interface DetailViewController ()
@property (strong, nonatomic) UIPopoverController *masterPopoverController;
- (void)configureView;
- (void)setMenuItems;
@end

@implementation DetailViewController
@synthesize detailItem = _detailItem;
@synthesize menuTableView = _menuTableView;
@synthesize masterPopoverController = _masterPopoverController;
@synthesize tableData = _tableData;
@synthesize menuSection = _menuSection;

#pragma mark - Initializers

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        if ([[UIDevice currentDevice] userInterfaceIdiom] != UIUserInterfaceIdiomPhone) {
            
        }
    }
    return self;
}

#pragma mark - Managing the detail item

- (void)setDetailItem:(id)newDetailItem {
    if (_detailItem != newDetailItem) {
        _detailItem = newDetailItem;
        
        // Update the view.
        [self configureView];
    }

    if (self.masterPopoverController != nil) {
        [self.masterPopoverController dismissPopoverAnimated:YES];
    }        
}

- (void)configureView {
    // Update the user interface for the detail item.
    if (self.detailItem) {
        self.menuSection = (MenuSection *)self.detailItem;
        self.title = self.menuSection.title;
        [self setMenuItems];
    }
}

#pragma mark - View lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [self configureView];
}

- (void)viewDidUnload {
    [self setMenuTableView:nil];
    [super viewDidUnload];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
    } else {
        return YES;
    }
}
							
#pragma mark - Split view

- (void)splitViewController:(UISplitViewController *)splitController willHideViewController:(UIViewController *)viewController withBarButtonItem:(UIBarButtonItem *)barButtonItem forPopoverController:(UIPopoverController *)popoverController 
{
    barButtonItem.title = @"Menu";
    [self.navigationItem setLeftBarButtonItem:barButtonItem animated:YES];
    self.masterPopoverController = popoverController;
}

- (void)splitViewController:(UISplitViewController *)splitController willShowViewController:(UIViewController *)viewController invalidatingBarButtonItem:(UIBarButtonItem *)barButtonItem {
    // Called when the view is shown again in the split view, invalidating the button and popover controller.
    [self.navigationItem setLeftBarButtonItem:nil animated:YES];
    self.masterPopoverController = nil;
}

#pragma mark - UITableViewDelegate methods

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.tableData count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
        if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        }
    }
    
    // Configure the cell.
    NSString *itemTitle = [self.tableData objectAtIndex:indexPath.row];
    cell.textLabel.text = itemTitle;
    
    if ([itemTitle isEqualToString:@"description"] || [itemTitle isEqualToString:@"Toppings"]) {
        // skip
    }
    else {
        NSString *itemDescription = [[self.menuSection.menuItems objectForKey:itemTitle] objectForKey:@"description"];
        cell.detailTextLabel.text = itemDescription;
    }
    
    return cell;
}

#pragma mark - Private methods

- (void)setMenuItems {
    NSMutableArray *menuItems = [[NSMutableArray alloc] init];
    for (id key in self.menuSection.menuItems) {
        [menuItems addObject:key];
    }
    self.tableData = menuItems;
    [self.menuTableView reloadData];
}

@end
