//
//  Created by Matthew Helm on 12/24/15.
//  Copyright © 2015 Matthew Helm. All rights reserved.
//


#import "MenuTableViewController.h"
#import "SecondaryViewController.h"


@interface MenuTableViewController ()
@property NSArray *menuItemArray;


@end


@implementation MenuTableViewController

@dynamic parentViewController;

- (id)initWithParentViewController : (MainViewController*)parent{
    self = [super init];
    if (self) {
        self.parentViewController = parent;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor lightGrayColor];
    self.tableView.scrollEnabled = NO;
    _menuItemArray = [self getMenuItemArray];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark mocked datasource for menu

- (NSArray *)getMenuItemArray{
    //labels
    NSString *itemStr = @"Home,Item 1,Item 2,Item 3";
    NSArray *arrayStr = [itemStr componentsSeparatedByString:@","];
    //viewcontrollers
    NSString *itemClass = @"SecondaryViewController,SecondaryViewController,SecondaryViewController,SecondaryViewController";
    NSArray *arrayClass = [itemClass componentsSeparatedByString:@","];
    NSMutableArray *array = [[NSMutableArray alloc]init];
    for(int i=0;i<arrayStr.count;i++){
        NSMutableDictionary *dict = [[NSMutableDictionary alloc]init];
        [dict setObject:arrayStr[i] forKey:@"Label"];
        [dict setObject:arrayClass[i] forKey:@"Class"];
        [array addObject:dict];
    }
    return array;
}

#pragma mark TableView Delegate Methods

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _menuItemArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell;
    if(cell == nil){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"CellIdentifier"];
    }
    cell.backgroundColor = [UIColor whiteColor];
    NSDictionary *dict = _menuItemArray[indexPath.row];
    NSString *menuStr = [NSString stringWithFormat: @"---------- %@",[dict objectForKey:@"Label"]];
    cell.textLabel.text = menuStr;
    return cell;
}
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return NO;
}

- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    return NO;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSDictionary *dict = [_menuItemArray objectAtIndex:indexPath.row];
    NSString *classStr = [dict objectForKey:@"Class"];
    id selectedController = [[NSClassFromString(classStr)alloc]init];
    NSLog(@"indexPath %i str: %@", (int)indexPath.row, selectedController);
    [self.parentViewController transitionToViewController:selectedController];
    return;
}


@end