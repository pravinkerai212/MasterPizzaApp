//
//  MenuSection.h
//  MasterPizza
//
//  Created by Ben Jakuben on 12/4/11.
//

#import <Foundation/Foundation.h>

@interface MenuSection : NSObject

@property (strong, nonatomic) NSString *title;
@property (strong, nonatomic) NSDictionary *menuItems;

-(id)initWithTitle:(NSString *)title andItems:(NSDictionary *)items;

@end
