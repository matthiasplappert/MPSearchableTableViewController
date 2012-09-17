//
//  SearchViewController.m
//  Example
//
//  Created by Matthias Plappert on 9/17/12.
//  Copyright (c) 2012 Matthias Plappert. All rights reserved.
//

#import "SearchViewController.h"


@interface SearchViewController ()

@property (nonatomic, copy) NSString *searchText;
@property (nonatomic, strong) NSArray *searchItems;
@property (nonatomic, strong) NSArray *items;

- (NSArray *)_itemsForTableView:(UITableView *)tableView;

@end


@implementation SearchViewController

@synthesize searchText = _searchText, searchItems = _searchItems, items = _items;

- (id)initWithStyle:(UITableViewStyle)style
{
    if ((self = [super initWithStyle:style])) {
        self.title = NSLocalizedString(@"Movies", nil);
        
        _items       = @[ @"The Shining", @"The Avengers", @"The Shawshank Redemption", @"Pulp Fiction",
                          @"The Dark Knight", @"Star Wars", @"Fight Club", @"Gentlemen Broncos", @"Inception",
                          @"Se7en", @"Findining Nemo", @"Ratatouille", @"The Incredibles", @"A Bug’s Life",
                          @"Toy Story", @"Toy Story 2", @"Toy Story 3", @"Monsters, Inc.", @"Cars", @"Cars 2",
                          @"WALL-E", @"Up", @"Brave" ];
        _searchItems = @[ ];
        
        // Sort items
        _items = [_items sortedArrayUsingComparator:^NSComparisonResult(NSString *obj1, NSString *obj2) {
            return [obj1 compare:obj2];
        }];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Here's the place to customize the search bar appearance. For example, you can add scope buttons
    // using the following line of code:
    //
    // self.searchDisplayController.searchBar.scopeButtonTitles = @[ @"Button 1", @"Button 2" ];
}

#pragma mark - UITableViewDataSource

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                      reuseIdentifier:identifier];
    }
    
    cell.textLabel.text = [[self _itemsForTableView:tableView] objectAtIndex:indexPath.row];
    
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [[self _itemsForTableView:tableView] count];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation
{
    return (toInterfaceOrientation == UIInterfaceOrientationLandscapeLeft ||
            toInterfaceOrientation == UIInterfaceOrientationLandscapeRight ||
            toInterfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Do something here, for example displaying a new view controller
    NSString *item = [[self _itemsForTableView:tableView] objectAtIndex:indexPath.row];
    NSLog(@"Selected item %@", item);
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

#pragma mark - UISearchBar

- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText
{
    // This method gets called as soon as the search bar input changes, so this is the place
    // to filter your array or update the predicate of your NSFetchedResultsController
    self.searchText = searchText;
}

#pragma mark - Private accessors

- (void)setSearchText:(NSString *)searchText
{
    if (_searchText != searchText) {
        _searchText = [searchText copy];
        
        // Filter array
        NSPredicate *predicate = [NSPredicate predicateWithBlock:^BOOL(NSString *obj, NSDictionary *binding) {
            NSRange range = [obj rangeOfString:searchText options:NSCaseInsensitiveSearch];
            if (range.location != NSNotFound) {
                // found
                return YES;
            } else {
                // not found
                return NO;
            }
        }];
        _searchItems = [self.items filteredArrayUsingPredicate:predicate];
        
        // Refresh table view
        [self.searchDisplayController.searchResultsTableView reloadData];
    }
}

- (NSArray *)_itemsForTableView:(UITableView *)tableView
{
    if (tableView == self.tableView) {
        return self.items;
    } else if (tableView == self.searchDisplayController.searchResultsTableView) {
        return self.searchItems;
    } else {
        return nil;
    }
}

@end
