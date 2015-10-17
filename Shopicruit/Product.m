//
//  Product.m
//  Shopicruit
//
//  Created by Daniel Hooper on 2015-10-16.
//  Copyright © 2015 Daniel Hooper. All rights reserved.
//

#import "Product.h"

@implementation Product

- (instancetype)initWithName:(NSString *)name price:(NSString *)price
{
    self = [super init];
    if (self) {
        _name = name;
        _price = price;
    }
    return self;
}

@end
