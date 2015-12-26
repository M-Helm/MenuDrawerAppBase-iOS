//
//  Created by Matthew Helm on 12/24/15.
//  Copyright © 2015 Matthew Helm. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MainViewController.h"

@interface MenuTableViewController : UITableViewController <UITableViewDelegate>
@property (weak, nonatomic) MainViewController *parentViewController;
- (id)initWithParentViewController : (MainViewController*)parent;

@end


