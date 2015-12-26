//
//  Created by Matthew Helm on 12/24/15.
//  Copyright © 2015 Matthew Helm. All rights reserved.
//


#import "MenuTableViewController.h"

@interface MenuTableViewController ()
@property NSArray *menuItemArray;

@end


@implementation MenuTableViewController

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
    NSString *arrayStr = @"Home,Item 1,Item 2,Item 3";
    NSArray *array = [arrayStr componentsSeparatedByString:@","];
    
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
    NSString *menuStr = [NSString stringWithFormat: @"---------- %@",_menuItemArray[indexPath.row]];
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
    //id selectedController = [[NSClassFromString(@"class")alloc]init];
    return;
}


@end