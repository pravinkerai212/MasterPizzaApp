//
//  AppDelegate.h
//  MasterPizza
//
//  Created by Ben Jakuben on 12/3/11.
//

#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate, UINavigationControllerDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) UINavigationController *navigationController;
@property (strong, nonatomic) UISplitViewController *splitViewController;

@end
