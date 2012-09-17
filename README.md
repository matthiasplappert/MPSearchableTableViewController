# MPSearchableTableViewController

MPSearchableTableViewController is a drop-in class that makes creating searchable table views super easy and gives them the Apple-like look with zero effort. MPSearchableTableViewController is licensed under
the MIT license and works with iOS 3 or later.

Here’s how a searchable table view looks like by default:
![Example 1](https://raw.github.com/matthiasplappert/MPSearchableTableViewController/master/.img/example1.png)

If the user selects the search bar, the navigation bar hides itself to make more room for the search results:
![Example 2](https://raw.github.com/matthiasplappert/MPSearchableTableViewController/master/.img/example2.png)

The search bar scrolls with the table view. If the user scrolls up, the a blue background and border are visible to make sure it always looks great:
![Example 3](https://raw.github.com/matthiasplappert/MPSearchableTableViewController/master/.img/example3.png)


## Installation

Simply clone the git directory and add `MPSearchableTableViewController.h`, `MPSearchableTableViewController.m`, `MPTableViewSearchBarBackgroundView.h` and `MPTableViewSearchBarBackgroundView.m` to your project.

MPSearchableTableViewController uses ARC, so you need to enable that.


## Usage

Create a new class that inherits from `MPSearchableTableViewController`. Implement `- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText`, which is defined in the `UISearchBarDelegate` protocol. That method gets called every time the search text changes. When this method gets called, you typically filter your data and refresh the search display table view by calling `[self.searchDisplayController.searchResultsTableView reloadData];`. Everything else is set up by MPSearchableTableViewController for you.

MPSearchableTableViewController also comes with a working example located in the `Example` directory. Make sure to give it a try.


## MIT License
Copyright (c) 2012 Matthias Plappert matthiasplappert@me.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions: The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

HE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.