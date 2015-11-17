//
//  TableViewProvider.h
//  Google search
//
//  Created by BabyG_Strong on 14.11.15.
//  Copyright © 2015 Zaslavskaya Evheniya. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface TableViewProvider : NSObject <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) NSArray *queryObjects;

@end
