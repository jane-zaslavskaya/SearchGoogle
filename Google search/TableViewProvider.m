//
//  TableViewProvider.m
//  Google search
//
//  Created by BabyG_Strong on 14.11.15.
//  Copyright © 2015 Zaslavskaya Evheniya. All rights reserved.
//

#import "TableViewProvider.h"
#import "QueryObject.h"

NSString * const kCellIdentifier = @"placeCell";

@implementation TableViewProvider

#pragma mark - TableViewDataSourceMethods

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.queryObjects count];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kCellIdentifier forIndexPath:indexPath];
    
    cell.textLabel.text = ((QueryObject *)self.queryObjects[indexPath.row]).title;
    cell.detailTextLabel.text = ((QueryObject *)self.queryObjects[indexPath.row]).snippet;
    
    return cell;
}

@end
