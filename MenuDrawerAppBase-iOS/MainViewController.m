//
//  Created by Matthew Helm on 12/24/15.
//  Copyright © 2015 Matthew Helm. All rights reserved.
//

#import "MainViewController.h"
#import "MenuTableViewController.h"
#import "SecondaryViewController.h"

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
    //add menuController off screen
    [self getMenuView];
    [self addGestureRecognizers:self.view];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UIView *)transitionToViewController:(UIViewController *)childViewController {
    self.showingMenuPanel = NO;
    [self menuAnimationOut:self.menuViewController.view];
    [self.view addSubview: childViewController.view];
    [self addChildViewController: childViewController];
    [self.menuViewController didMoveToParentViewController:self];
    UIView *view = childViewController.view;
    return view;
}

#pragma mark gesture methods

- (void) addGestureRecognizers:(UIView *)subView{
    UISwipeGestureRecognizer *leftRecognizer = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(SwipeRecognizer:)];
    leftRecognizer.direction=UISwipeGestureRecognizerDirectionLeft;
    leftRecognizer.numberOfTouchesRequired = 1;
    leftRecognizer.delegate = self;
    [subView addGestureRecognizer:leftRecognizer];
    
    UISwipeGestureRecognizer *rightRecognizer = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(SwipeRecognizer:)];
    rightRecognizer.direction=UISwipeGestureRecognizerDirectionRight;
    rightRecognizer.numberOfTouchesRequired = 1;
    rightRecognizer.delegate = self;
    [subView addGestureRecognizer:rightRecognizer];
}

- (void) SwipeRecognizer:(UISwipeGestureRecognizer *)sender {
    if ( sender.direction == UISwipeGestureRecognizerDirectionLeft ){
        [self closeMenu];
    }
    if ( sender.direction == UISwipeGestureRecognizerDirectionRight ){
        [self openMenu];
    }
}


#pragma mark menu button methods

- (void)handleHamburgerSingleTap:(UITapGestureRecognizer *)recognizer {
    if(!self.showingMenuPanel){
        [self purgeChildControllers];
        [self openMenu];
        return;
    }
    [self closeMenu];
}

- (void)purgeChildControllers{
    for(UIViewController *viewController in self.childViewControllers){
        if([viewController class] == [SecondaryViewController class]){
            viewController.view.alpha = 0;
            [viewController removeFromParentViewController];
        }
    }
}

- (void)openMenu{
    [self purgeChildControllers];
    [self getMenuView];
    [self menuAnimationIn:self.menuViewController.view];
    self.showingMenuPanel = YES;
}
- (void)closeMenu{
    [self getMenuView];
    [self menuAnimationOut:self.menuViewController.view];
    self.showingMenuPanel = NO;
}

- (UIView *)getMenuView {
    // init view if nil
    if (self.menuViewController == nil) {
        // this is where you define the view for the menu panel
        self.menuViewController = [[MenuTableViewController alloc] initWithParentViewController:self];
        [self.view addSubview:self.menuViewController.tableView];
        [self addChildViewController:self.menuViewController];
        [self.menuViewController didMoveToParentViewController:self];
        self.menuViewController.view.frame = CGRectMake(self.view.frame.size.width * -1, 0, self.view.frame.size.width, self.view.frame.size.height);
    }
    UIView *view = self.menuViewController.tableView;
    return view;
}

- (void)menuAnimationOut:(UIView *)view {
    [UIView animateWithDuration:0.15 delay:0.0 options:UIViewAnimationOptionCurveLinear
                     animations:^{
                         CGRect frame = CGRectMake(self.view.frame.size.width * -1, 0, self.view.frame.size.width, self.view.frame.size.height);
                         view.frame = frame;
                     }
                     completion:^(BOOL finished) {
                         if(finished){

                         }
                     }];
}

- (void)menuAnimationIn:(UIView *)view {
    [UIView animateWithDuration:0.15 delay:0.0 options:UIViewAnimationOptionCurveLinear
                     animations:^{
                         CGRect frame = CGRectMake(-88, 0, self.view.frame.size.width, self.view.frame.size.height);
                         view.frame = frame;
                     }
                     completion:^(BOOL finished) {
                         if(finished){

                         }
                     }];
}

@end
