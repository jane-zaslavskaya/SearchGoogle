//
//  GoogleSearchSrvice.h
//  Google search
//
//  Created by BabyG_Strong on 14.11.15.
//  Copyright © 2015 Zaslavskaya Evheniya. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^requestBlock)(NSArray *resultArray, NSError *error);

@interface GoogleSearchService : NSObject

- (void)sendRequestWithString:(NSString *)requestString successBlock:(requestBlock)block;

@end
