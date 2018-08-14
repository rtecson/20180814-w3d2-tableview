//
//  ViewController.m
//  w3d2-demo
//
//  Created by Roland on 2018-08-14.
//  Copyright © 2018 Lighthouse Labs. All rights reserved.
//

#import "DynamicTableDemoViewController.h"
#import "MyTableViewCell.h"

@interface DynamicTableDemoViewController () <UITableViewDataSource, UITableViewDelegate>

// MARK: - IBOutlets
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) NSMutableArray<NSString *> *myData;

@end

@implementation DynamicTableDemoViewController

// MARK: - IBActions

- (IBAction)addCellButtonTapped:(UIButton *)sender {
    // Add 10 more rows to my data array
    for (int i=0; i< 1000000; i++) {
        NSString *newData = [NSString stringWithFormat:@"%d", i];
        [self.myData addObject:newData];
    }
    
    // Tell the table view that my data has changed
    [self.tableView reloadData];
}

// MARK: - UIViewController methods

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    // Tell the table view that this class is its data source
    self.tableView.dataSource = self;
    
    // Tell the table view that this class is its delegate
    self.tableView.delegate = self;
    
    // Populate my data array
    [self populateData];
}

// MARK: - UITableViewDataSource methods

- (NSInteger)tableView:(nonnull UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in my data array
    return self.myData.count;
}

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView
                 cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    // Get a re-usable cell using the reuse identifier (this needs to match what was set in the storyboard
    MyTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"myCellTemplate"];
//    NSLog(@"cell is %@", cell);
    
    // Get the row number from the index path
    NSInteger row = indexPath.row;
    
    // Set the label of the text
    cell.label.text = self.myData[row];

    // Tell the tableView to use this cell
    return cell;
}

// MARK: - UITableViewDelegate methods

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"User tapped on cell %@", indexPath);
    
    // For all even rows...
    if (indexPath.row % 2 == 0) {
        // Segue to other view controller
        [self performSegueWithIdentifier:@"segueFromDynamicTable" sender:self];
    }
}

// MARK: - Private methods

- (void)populateData {
    self.myData = [@[@"Zero", @"One", @"Two", @"Three", @"Four", @"Five", @"Six", @"Seven", @"Eight", @"Nine", @"Ten", @"Eleven", @"Twelve", @"Thirteen", @"Fourteen", @"Fifteen", @"Sixteen", @"Seventeen", @"Eighteen", @"Nineteen", @"Twenty"] mutableCopy];
}

@end
