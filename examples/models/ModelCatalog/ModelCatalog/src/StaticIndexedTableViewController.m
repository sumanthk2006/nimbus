//
// Copyright 2011 Jeff Verkoeyen
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//    http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
//

#import "StaticIndexedTableViewController.h"

@interface StaticIndexedTableViewController()
@property (nonatomic, readwrite, retain) NITableViewModel* model;
@property (nonatomic, readwrite, retain) UISearchDisplayController* searchController;
@end


///////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////
@implementation StaticIndexedTableViewController

@synthesize model = _model;
@synthesize searchController = _searchController;


///////////////////////////////////////////////////////////////////////////////////////////////////
- (void)dealloc {
  // The model is a retained object in this controller, so we must release it when the controller
  // is deallocated.
  [_model release]; _model = nil;

  [super dealloc];
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (id)initWithStyle:(UITableViewStyle)style {
  if ((self = [super initWithStyle:UITableViewStylePlain])) {
    self.title = NSLocalizedString(@"Indexed Model", @"Controller Title: Indexed Model");
    
    NSArray* tableContents =
    [NSArray arrayWithObjects:
     @"A",
     [NITitleCellObject cellWithTitle:@"Jon Abrams"],
     [NITitleCellObject cellWithTitle:@"Crystal Arbor"],
     [NITitleCellObject cellWithTitle:@"Mike Axiom"],
     
     @"B",
     [NITitleCellObject cellWithTitle:@"Joey Bannister"],
     [NITitleCellObject cellWithTitle:@"Ray Bowl"],
     [NITitleCellObject cellWithTitle:@"Jane Byte"],
     
     @"C",
     [NITitleCellObject cellWithTitle:@"JJ Cranilly"],
     
     @"K",
     [NITitleCellObject cellWithTitle:@"Jake Klark"],
     [NITitleCellObject cellWithTitle:@"Viktor Krum"],
     [NITitleCellObject cellWithTitle:@"Abraham Kyle"],
     
     @"L",
     [NITitleCellObject cellWithTitle:@"Mr Larry"],
     [NITitleCellObject cellWithTitle:@"Mo Lundlum"],
     
     @"N",
     [NITitleCellObject cellWithTitle:@"Carl Nolly"],
     [NITitleCellObject cellWithTitle:@"Jeremy Nym"],
     
     @"O",
     [NITitleCellObject cellWithTitle:@"Number 1 Otter"],
     [NITitleCellObject cellWithTitle:@"Number 2 Otter"],
     [NITitleCellObject cellWithTitle:@"Number 3 Otter"],
     [NITitleCellObject cellWithTitle:@"Number 4 Otter"],
     [NITitleCellObject cellWithTitle:@"Number 5 Otter"],
     [NITitleCellObject cellWithTitle:@"Number 6 Otter"],
     [NITitleCellObject cellWithTitle:@"Number 7 Otter"],
     [NITitleCellObject cellWithTitle:@"Number 8 Otter"],
     [NITitleCellObject cellWithTitle:@"Number 9 Otter"],
     [NITitleCellObject cellWithTitle:@"Number 10 Otter"],
     
     @"X",
     [NITitleCellObject cellWithTitle:@"Charles Xavier"],

     nil];
    
    // We use NICellFactory to create the cell views.
    _model = [[NITableViewModel alloc] initWithSectionedArray:tableContents
                                                     delegate:(id)[NICellFactory class]];
    [_model setSectionIndexType:NITableViewModelSectionIndexAlphabetical showsSearch:YES showsSummary:NO];
  }
  return self;
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (void)viewDidLoad {
  [super viewDidLoad];

  // Only assign the table view's data source after the view has loaded.
  // You must be careful when you call self.tableView in general because it will call loadView
  // if the view has not been loaded yet. You do not need to clear the data source when the
  // view is unloaded (more importantly: you shouldn't, due to the reason just outlined
  // regarding loadView).
  self.tableView.dataSource = _model;

  // Create a dummy search display controller just to show the use of a search bar.
  UISearchBar* searchBar = [[[UISearchBar alloc] init] autorelease];
  [searchBar sizeToFit];
  _searchController = [[UISearchDisplayController alloc] initWithSearchBar:searchBar contentsController:self];
  self.tableView.tableHeaderView = _searchController.searchBar;

  // Show that entering the "edit" mode does not allow modifications to this static model.
  self.navigationItem.rightBarButtonItem = self.editButtonItem;
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation {
  return NIIsSupportedOrientation(toInterfaceOrientation);
}


@end
