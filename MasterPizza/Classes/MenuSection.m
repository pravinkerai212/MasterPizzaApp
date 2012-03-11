//
//  MenuSection.m
//  MasterPizza
//
//  Created by Ben Jakuben on 12/4/11.
//

#import "MenuSection.h"

@implementation MenuSection
@synthesize title = _title;
@synthesize menuItems = _menuItems;

#pragma mark - Initializers

-(id)initWithTitle:(NSString *)title andItems:(NSDictionary *)items {
    self = [super init];
    self.title = title;
    self.menuItems = items;
    
    return self;
}

@end
