//
//  GoogleSearchSrvice.m
//  Google search
//
//  Created by BabyG_Strong on 14.11.15.
//  Copyright © 2015 Zaslavskaya Evheniya. All rights reserved.
//

#import "GoogleSearchService.h"
#import "QueryObject.h"

NSString * const kAPI_KEY = @"AIzaSyAC_oBDS3Lo-fupqKm-KBbWK9XScAHd5zU";
NSString * const kCX = @"009578774275875472872:dbj9zwsot1w";
NSString * const kTitleKey = @"title";
NSString * const kSnippetKey = @"snippet";
NSString * const kLinkKey = @"link";
NSString * const kItemsKey = @"items";


@interface GoogleSearchService ()

@property (nonatomic, strong) NSURLSession *session;

@end

@implementation GoogleSearchService

#pragma mark - Lifecycle

- (instancetype)init
{
    if (self = [super init]) {
        self.session = [NSURLSession sharedSession];
    }
    return self;
}

#pragma mark - Public Methods

- (void)sendRequestWithString:(NSString *)requestString successBlock:(requestBlock)block
{
    if (!block) {
        NSLog(@"Block shouldn't be nil");
    } else {
        NSURL *url = [[NSURL alloc] initWithString:
                      [NSString stringWithFormat:@"https://www.googleapis.com/customsearch/v1?key=%@&cx=%@&q=%@", kAPI_KEY, kCX,  requestString]];
        
        NSURLRequest *request = [[NSURLRequest alloc] initWithURL:url];
        
        NSURLSessionDownloadTask *task =
        [self.session downloadTaskWithRequest:request
                            completionHandler:^(NSURL *location, NSURLResponse *response, NSError *error) {
                                if (error) {
                                    
                                    block(nil, error);
                                    
                                    NSLog(@"Failed with error:%@", error.localizedDescription);
                                } else {
                                    
                                    if ([response isKindOfClass:[NSHTTPURLResponse class]]) {
                                        
                                        NSData *receivedData = [NSData dataWithContentsOfURL:location];
                                        
                                        NSError *error;
                                        
                                        NSDictionary *dictionary = [NSJSONSerialization JSONObjectWithData:receivedData options:kNilOptions error:&error];
                                        
                                        if (!error) {
                                            
                                            if ([dictionary[kItemsKey] isKindOfClass:[NSArray class]]) {
                                                block([self responseObjectsToQueryObjects:dictionary[kItemsKey]], nil);
                                            }
                                            
                                        } else {
                                            
                                            block(nil, error);
                                        }
                                    }
                                }
                            }];
        [task resume];
    }
}

#pragma mark - Private Methods

- (QueryObject *)responseObjectToQueryObject:(NSDictionary *)responseObject
{
    QueryObject *queryObject = [[QueryObject alloc] init];
    queryObject.title = responseObject[kTitleKey];
    queryObject.snippet = responseObject[kSnippetKey];
    queryObject.link = responseObject[kLinkKey];
    return queryObject;
}

- (NSArray *)responseObjectsToQueryObjects:(NSArray *)responseObjects
{
    NSMutableArray *objectsArray = [[NSMutableArray alloc] init];
    
    for (NSDictionary *responceObject in responseObjects) {
        [objectsArray addObject:[self responseObjectToQueryObject:responceObject]];
    }
    
    return [NSArray arrayWithArray:objectsArray];
}

@end
