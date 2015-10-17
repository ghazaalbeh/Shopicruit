//
//  MasterViewController.m
//  Shopicruit
//
//  Created by Daniel Hooper on 2015-10-16.
//  Copyright © 2015 Daniel Hooper. All rights reserved.
//

#import "MasterViewController.h"
#import "DetailViewController.h"
#import "ProductTableViewCell.h"
#import "Product.h"

@interface MasterViewController ()

@property NSMutableArray *products;
@property float totalPrice;

@end

@implementation MasterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.detailViewController = (DetailViewController *)[[self.splitViewController.viewControllers lastObject] topViewController];
    
    [self.navigationController setToolbarHidden:NO animated:NO];
    
    self.calculateCostButton.title = @"Total cost of wallets and lamps = ?";
    
    self.products = [[NSMutableArray alloc] init];
    [self getData];
}

- (void)viewWillAppear:(BOOL)animated {
    self.clearsSelectionOnViewWillAppear = self.splitViewController.isCollapsed;
    [super viewWillAppear:animated];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Segues

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"showDetail"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        Product *product = self.products[indexPath.row];
        DetailViewController *controller = (DetailViewController *)[[segue destinationViewController] topViewController];
        [controller setDetailItem:product];
        controller.navigationItem.leftBarButtonItem = self.splitViewController.displayModeButtonItem;
        controller.navigationItem.leftItemsSupplementBackButton = YES;
    }
}

#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.products.count;
}

- (ProductTableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    ProductTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];

    Product *product = self.products[indexPath.row];
    
    cell.nameLabel.text = product.name;
    cell.priceLabel.text = [@"$" stringByAppendingString:[product.prices objectAtIndex:0]];
    
    return cell;
}

#pragma mark - Networking

- (void)getData {
    NSURL *URL = [NSURL URLWithString:@"http://shopicruit.myshopify.com/products.json"];
    NSData *jsonData = [NSData dataWithContentsOfURL:URL];
    NSError *error = nil;
    NSDictionary *dataDictionary = [NSJSONSerialization JSONObjectWithData:jsonData options:0 error:&error];
    NSArray *productsArray = [dataDictionary objectForKey:@"products"];
    
    for (NSDictionary *dictionary in productsArray) {
        Product *product = [[Product alloc] init];
        product.name = dictionary[@"title"];
        product.prices = [[NSMutableArray alloc] init];
        product.type = dictionary[@"product_type"];

        for (NSDictionary *varientsDictionary in dictionary[@"variants"]) {
            NSString *price = varientsDictionary[@"price"];
            if ([product.type isEqual: @"Wallet"] || [product.type isEqual: @"Lamp"]) {
                self.totalPrice += [price floatValue];
            }
            
            [product.prices addObject:price];
        }
        
        [self.products addObject:product];
    }
    
    [self.tableView reloadData];
}

#pragma mark - IBActions

- (IBAction)calculateCostButtonPressed:(id)sender {
    self.calculateCostButton.title = [NSString stringWithFormat:@"Total cost of wallets and lamps = $%.02f", self.totalPrice];
}


@end
