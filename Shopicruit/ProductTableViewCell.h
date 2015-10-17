//
//  ProductTableViewCell.h
//  Shopicruit
//
//  Created by Daniel Hooper on 2015-10-16.
//  Copyright © 2015 Daniel Hooper. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ProductTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *priceLabel;

@end
