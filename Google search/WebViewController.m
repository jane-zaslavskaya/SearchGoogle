//
//  WebViewController.m
//  Google search
//
//  Created by BabyG_Strong on 14.11.15.
//  Copyright © 2015 Zaslavskaya Evheniya. All rights reserved.
//

#import "WebViewController.h"
#import "WebViewProvider.h"
#import "QueryObject.h"

@interface WebViewController ()

@property (strong, nonatomic) IBOutlet WebViewProvider *webProvider;

@property (weak, nonatomic) IBOutlet UIWebView *webView;


@end

@implementation WebViewController

- (void)viewWillAppear:(BOOL)animated
{
    NSString *urlAddress =  self.queryObject.link;

    NSURL *url = [NSURL URLWithString:urlAddress];

    NSURLRequest *requestObj = [NSURLRequest requestWithURL:url];

    [self.webView loadRequest:requestObj];

}


- (void)viewDidLoad {
    [super viewDidLoad];
    /*NSString *urlAddress = @"http:/google.com";
    
    //Create a URL object.
    NSURL *url = [NSURL URLWithString:urlAddress];
    
    //URL Requst Object
    NSURLRequest *requestObj = [NSURLRequest requestWithURL:url];
    
    //Load the request in the UIWebView.
    [self.webView loadRequest:requestObj];*/
    
}



/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
