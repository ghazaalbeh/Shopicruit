//
//  Product.h
//  Shopicruit
//
//  Created by Daniel Hooper on 2015-10-16.
//  Copyright © 2015 Daniel Hooper. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Product : NSObject

@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSString *type;
@property (strong, nonatomic) NSString *price;
@property (strong, nonatomic) NSMutableArray *prices;
@property (strong, nonatomic) NSMutableArray *varients;

- (instancetype)initWithName:(NSString *)name price:(NSString *)price;

@end
