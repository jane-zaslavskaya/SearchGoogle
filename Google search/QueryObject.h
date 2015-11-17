//
//  QueryObject.h
//  Google search
//
//  Created by BabyG_Strong on 14.11.15.
//  Copyright © 2015 Zaslavskaya Evheniya. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface QueryObject : NSObject

@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *snippet;
@property (nonatomic, strong) NSString *link;

@end
