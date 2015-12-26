//
//  Created by Matthew Helm on 12/24/15.
//  Copyright © 2015 Matthew Helm. All rights reserved.
//

#import "MainViewController.h"
#import "MenuTableViewController.h"

@interface MainViewController ()

@property (nonatomic, strong) MenuTableViewController *menuViewController;
@property (nonatomic, assign) BOOL showingMenuPanel;

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Add a hamburger button
    UIButton *hamburgerButton = [[UIButton alloc]initWithFrame:CGRectMake(0,0,44,44)];
    UIImage *image = [UIImage imageNamed:@"ic_burger_44px.png"];
    [hamburgerButton setImage:image forState:UIControlStateNormal];
    UITapGestureRecognizer *singleFingerTap =
    [[UITapGestureRecognizer alloc] initWithTarget:self
                                            action:@selector(handleHamburgerSingleTap:)];
    [hamburgerButton addGestureRecognizer:singleFingerTap];
    [self.navigationItem setRightBarButtonItem:[[UIBarButtonItem alloc] initWithCustomView:hamburgerButton]];
    
    //add menuController
    [self getMenuView];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(UIView *)getMenuView {
    // init view if nil
    if (self.menuViewController == nil) {
        // this is where you define the view for the menu panel
        self.menuViewController = [[MenuTableViewController alloc] init];
        [self.view addSubview:self.menuViewController.tableView];
        [self addChildViewController:self.menuViewController];
        [self.menuViewController didMoveToParentViewController:self];
        self.menuViewController.view.frame = CGRectMake(self.view.frame.size.width * -1, 0, self.view.frame.size.width, self.view.frame.size.height);
    }
    UIView *view = self.menuViewController.tableView;
    return view;
}

- (void)handleHamburgerSingleTap:(UITapGestureRecognizer *)recognizer {
    if(!self.showingMenuPanel){
        [self getMenuView];
        [self menuAnimationIn:self.menuViewController.view];
        self.showingMenuPanel = YES;
        return;
    }
    [self getMenuView];
    [self menuAnimationOut:self.menuViewController.view];
    self.showingMenuPanel = NO;
}

-(void)menuAnimationOut:(UIView *)view{
    [UIView animateWithDuration:0.15 delay:0.0 options:UIViewAnimationOptionCurveLinear
                     animations:^{
                         CGRect frame = CGRectMake(self.view.frame.size.width * -1, 0, self.view.frame.size.width, self.view.frame.size.height);
                         view.frame = frame;
                     }
                     completion:^(BOOL finished) {
                         if(finished){
                             //recognizer.view.alpha = 1;
                         }
                     }];
}

-(void)menuAnimationIn:(UIView *)view{
    [UIView animateWithDuration:0.15 delay:0.0 options:UIViewAnimationOptionCurveLinear
                     animations:^{
                         CGRect frame = CGRectMake(-88, 0, self.view.frame.size.width, self.view.frame.size.height);
                         view.frame = frame;
                     }
                     completion:^(BOOL finished) {
                         if(finished){
                             //recognizer.view.alpha = 1;
                         }
                     }];
}

@end