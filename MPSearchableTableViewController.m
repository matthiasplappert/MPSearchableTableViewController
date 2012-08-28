//
//  MPSearchableTableViewController.m
//  SearchableTableViewController
//
//  Copyright (c) 2012 Matthias Plappert <matthiasplappert@me.com>
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy of this software
//  and associated documentation files (the "Software"), to deal in the Software without restriction,
//  including without limitation the rights to use, copy, modify, merge, publish, distribute,
//  sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in all copies or
//  substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING
//  BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
//  NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM,
//  DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
//

#import "MPSearchableTableViewController.h"
#import "MPTableViewSearchBarBackgroundView.h"


@interface MPSearchableTableViewController () {
    UITableViewStyle _tableViewStyle;
    UISearchDisplayController *_searchController;
}

@end


@implementation MPSearchableTableViewController

@synthesize tableView = _tableView, searchBar = _searchBar;

- (id)initWithStyle:(UITableViewStyle)style
{
    if ((self = [super init])) {
        _tableViewStyle = style;
    }
    return self;
}

- (void)loadView
{
	[super loadView];
	
	// Create table view
	_tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:_tableViewStyle];
	_tableView.delegate         = self;
	_tableView.dataSource       = self;
	_tableView.autoresizingMask = (UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight);
	[self.view addSubview:_tableView];
	
	// Create search bar
    _searchBar = [[UISearchBar alloc] initWithFrame:CGRectMake(0.0f, 0.0f, self.view.bounds.size.width, 44.0f)];
    _searchBar.autoresizingMask = UIViewAutoresizingFlexibleWidth;
    _searchBar.delegate         = self;
    _tableView.tableHeaderView = _searchBar;
    
    // Create blue background view
    CGRect backgroundFrame = CGRectMake(0.0f, -1024.0f, self.view.bounds.size.width, 1024.0f);
    MPTableViewSearchBarBackgroundView *backgroundView = [[MPTableViewSearchBarBackgroundView alloc] initWithFrame:backgroundFrame];
    [_tableView addSubview:backgroundView];
	
	// Create search controller
	_searchController = [[UISearchDisplayController alloc] initWithSearchBar:_searchBar contentsController:self];
	_searchController.searchResultsDataSource = self;
	_searchController.searchResultsDelegate   = self;
	_searchController.delegate                = self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
	self.tableView.frame = self.view.bounds;
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    
    _tableView        = nil;
    _searchBar        = nil;
    _searchController = nil;
}

- (void)dealloc
{
	_tableView.delegate   = nil;
	_tableView.dataSource = nil;
	
    _searchBar.delegate = nil;
	
    _searchController.delegate                = nil;
	_searchController.searchResultsDataSource = nil;
	_searchController.searchResultsDelegate   = nil;
}

- (void)viewDidAppear:(BOOL)animated
{
	[super viewDidAppear:animated];
	
	// Flash scroll indicators
	[self.tableView flashScrollIndicators];
	[self.searchDisplayController.searchResultsTableView flashScrollIndicators];
}

#pragma mark - Editing

- (void)setEditing:(BOOL)editing animated:(BOOL)animated
{
	[super setEditing:editing animated:animated];
	[self.tableView setEditing:editing animated:animated];
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
	return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	return nil;
}

@end
