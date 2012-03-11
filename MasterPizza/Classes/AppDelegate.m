//
//  AppDelegate.m
//  MasterPizza
//
//  Created by Ben Jakuben on 12/3/11.
//

#import "AppDelegate.h"
#import "MasterViewController.h"
#import "DetailViewController.h"
#import "HomeViewController.h"

@implementation AppDelegate

@synthesize window = _window;
@synthesize navigationController = _navigationController;
@synthesize splitViewController = _splitViewController;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    // Override point for customization after application launch.
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        UIViewController *rootViewController = [[HomeViewController alloc] init];
        UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:rootViewController];
        
        self.navigationController = navController;
        self.navigationController.delegate = self;
        [self.navigationController setNavigationBarHidden:NO animated:NO];
        [self.window addSubview:self.navigationController.view];
    } 
    else {
        MasterViewController *masterViewController = [[MasterViewController alloc] initWithNibName:@"MasterViewController_iPad" bundle:nil];
        UINavigationController *masterNavigationController = [[UINavigationController alloc] initWithRootViewController:masterViewController];
        
        DetailViewController *detailViewController = [[DetailViewController alloc] initWithNibName:@"DetailViewController_iPad" bundle:nil];
        UINavigationController *detailNavigationController = [[UINavigationController alloc] initWithRootViewController:detailViewController];
    	
        self.splitViewController = [[UISplitViewController alloc] init];
        self.splitViewController.delegate = detailViewController;
        self.splitViewController.viewControllers = [NSArray arrayWithObjects:masterNavigationController, detailNavigationController, nil];
        
        self.window.rootViewController = self.splitViewController;
    }
    
    [self.window makeKeyAndVisible];
    return YES;
}

@end
