//
//  ViewController.m
//  Google search
//
//  Created by BabyG_Strong on 14.11.15.
//  Copyright © 2015 Zaslavskaya Evheniya. All rights reserved.
//

#import "ViewController.h"
#import "TableViewProvider.h"
#import "GoogleSearchService.h"
#import "WebViewController.h"

@interface ViewController () <UITextFieldDelegate>

@property (nonatomic, weak) IBOutlet UITableView *tableView;
@property (nonatomic, weak) IBOutlet UITextField *textField;
@property (nonatomic, strong) IBOutlet TableViewProvider *provider;
@property (nonatomic, strong) GoogleSearchService *searchService;

@end

@implementation ViewController

#pragma mark - Lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.searchService = [[GoogleSearchService alloc] init];
}

#pragma mark - TextFieldDelegateMethods

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [self.searchService sendRequestWithString:textField.text
                                 successBlock:^(NSArray *resultArray, NSError *error) {
                                     
                                     if (error) {
                                         
                                         NSLog(@"Error %@", error.localizedDescription);
                                     } else {
                                         
                                         self.provider.queryObjects = resultArray;
                                         dispatch_async(dispatch_get_main_queue(), ^{
                                             [self.tableView reloadData];
                                         });
                                     }
                                 }];
    [textField endEditing: YES];
    return YES;
}

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([sender isKindOfClass:[UITableViewCell class]]) {
        
         NSIndexPath *indexPath = [self.tableView indexPathForCell:sender];
        
        if ([[segue destinationViewController] isKindOfClass:[WebViewController class]]) {
            ((WebViewController *)[segue destinationViewController]).queryObject = self.provider.queryObjects[indexPath.row];
        }
    }
}

@end
