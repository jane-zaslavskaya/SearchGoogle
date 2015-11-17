//
//  WebViewProvider.m
//  Google search
//
//  Created by BabyG_Strong on 14.11.15.
//  Copyright © 2015 Zaslavskaya Evheniya. All rights reserved.
//

#import "WebViewProvider.h"
#import "WebViewController.h"


@implementation WebViewProvider

- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request
 navigationType:(UIWebViewNavigationType)navigationType {
  
    return YES;
}

@end
