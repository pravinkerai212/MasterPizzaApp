//
//  DetailViewController.h
//  MasterPizza
//
//  Created by Ben Jakuben on 12/3/11.
//  Copyright (c) 2011 Progressive Insurance. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController <UISplitViewControllerDelegate>

@property (strong, nonatomic) id detailItem;

@property (strong, nonatomic) IBOutlet UILabel *detailDescriptionLabel;

@end
