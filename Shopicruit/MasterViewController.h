//
//  MasterViewController.h
//  Shopicruit
//
//  Created by Daniel Hooper on 2015-10-16.
//  Copyright © 2015 Daniel Hooper. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DetailViewController;

@interface MasterViewController : UITableViewController

@property (strong, nonatomic) DetailViewController *detailViewController;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *calculateCostButton;

@end

