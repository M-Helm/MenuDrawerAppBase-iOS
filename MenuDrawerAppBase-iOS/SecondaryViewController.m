//
//  SecondaryViewController.m
//  MenuDrawerAppBase-iOS
//
//  Created by Matthew Helm on 12/26/15.
//  Copyright © 2015 Matthew Helm. All rights reserved.
//

#import "SecondaryViewController.h"

@interface SecondaryViewController ()

@end

@implementation SecondaryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(15,88,200,44)];
    label.text = @"Secondary View Controller";
    [self.view addSubview:label];
    NSLog(@"2nd VC");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end