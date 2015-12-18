//
//  ViewController.m
//  MPVolumeViewTest
//
//  Created by Ricardo Santos on 18/12/2015.
//  Copyright © 2015 NextFaze. All rights reserved.
//

#import "ViewController.h"
#import <MediaPlayer/MediaPlayer.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor lightGrayColor];
    
    MPVolumeView *volumeView = [[MPVolumeView alloc] initWithFrame:CGRectMake(20.0, 40.0, self.view.frame.size.width - 40.0, 40.0)];
    [self.view addSubview:volumeView];
    
    UIButton *actionSheetButton = [[UIButton alloc] initWithFrame:CGRectMake(20.0, 100.0, self.view.frame.size.width - 40.0, 40.0)];
    [actionSheetButton setTitle:@"Action Sheet" forState:UIControlStateNormal];
    [actionSheetButton addTarget:self action:@selector(actionSheetButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:actionSheetButton];

    UIButton *alertControllerButton = [[UIButton alloc] initWithFrame:CGRectMake(20.0, 160.0, self.view.frame.size.width - 40.0, 40.0)];
    [alertControllerButton setTitle:@"Alert Controller" forState:UIControlStateNormal];
    [alertControllerButton addTarget:self action:@selector(alertControllerButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:alertControllerButton];
}

#pragma mark - Events

- (void)actionSheetButtonTapped:(id)sender {
    UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:@"Action Sheet"
                                                             delegate:nil
                                                    cancelButtonTitle:@"Cancel"
                                               destructiveButtonTitle:@"OK"
                                                    otherButtonTitles:nil];
    [actionSheet showInView:self.view];
}

- (void)alertControllerButtonTapped:(id)sender {
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Alert Controller"
                                                                             message:nil
                                                                      preferredStyle:UIAlertControllerStyleActionSheet];
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"Cancel"
                                                           style:UIAlertActionStyleCancel
                                                         handler:nil];
    [alertController addAction:cancelAction];
    [self presentViewController:alertController animated:YES completion:nil];
}

#pragma mark - Rotation

- (BOOL)shouldAutorotate {
    return NO;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (UIInterfaceOrientationMask)supportedInterfaceOrientations {
    return UIInterfaceOrientationMaskPortrait;
}

@end
