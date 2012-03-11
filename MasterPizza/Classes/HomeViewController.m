//
//  HomeViewController.m
//  MasterPizza
//
//  Created by Ben Jakuben on 12/3/11.
//

#import "HomeViewController.h"
#import "MasterViewController.h"
#import "DetailViewController.h"
#import "AppDelegate.h"
#import "InfoViewController.h"
#import "OrderViewController.h"

@implementation HomeViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

#pragma mark - View lifecycle

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden = YES;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (IBAction)viewMenu:(id)sender {
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        MasterViewController *masterViewController = [[MasterViewController alloc] initWithNibName:@"MasterViewController_iPhone" bundle:nil];
        [self.navigationController pushViewController:masterViewController animated:YES];
    }
    else {
        [self setModalTransitionStyle:UIModalTransitionStyleCrossDissolve];
        [self dismissModalViewControllerAnimated:YES];
    }
}

- (IBAction)placeOrder:(id)sender {
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        OrderViewController *orderViewController = [[OrderViewController alloc] init];
        [self.navigationController pushViewController:orderViewController animated:YES];
    }
}

- (IBAction)visitFacebook:(id)sender {
    NSString *facebookUrl = @"http://www.facebook.com/pages/Master-Pizza/155448783822";
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:facebookUrl]];
}

- (IBAction)viewInfo:(id)sender {
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        InfoViewController *infoViewController = [[InfoViewController alloc] init];
        [self.navigationController pushViewController:infoViewController animated:YES];
    }
}

@end
