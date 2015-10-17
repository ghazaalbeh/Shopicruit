//
//  DetailViewController.h
//  Shopicruit
//
//  Created by Daniel Hooper on 2015-10-16.
//  Copyright © 2015 Daniel Hooper. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController

@property (strong, nonatomic) id detailItem;
@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;

@end

