//
//  VideoController.m
//  Tutorials
//
//  Created by Mokhtar on 10/12/18.
//  Copyright © 2018 Mokhtar. All rights reserved.
//

#import "VideoController.h"
#import <WebKit/WebKit.h>
#import "Video.h"


@interface VideoController ()
@property (weak, nonatomic) IBOutlet WKWebView *webView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *descriptionLabel;

@end

@implementation VideoController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.titleLabel.text = self.video.videoClipName;
    self.descriptionLabel.text = self.video.videoDescription;
    [self.webView loadHTMLString:self.video.embed baseURL:nil];
    self.webView.navigationDelegate = self;
}

- (void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation {
    
    NSString *css = @".container {position: relative; width: 100%; height: 0; padding-bottom: 56.25%;} .video {position: absolute;top: 0; left: 0; width: 100%; height: 100%;}";
    
    NSString *js = [NSString stringWithFormat:@"var style = document.createElement('style'); style.innerHTML = '%@'; document.head.appendChild(style);",css];
    
    [webView evaluateJavaScript:js completionHandler:nil];
    
    
    
}


- (IBAction)handleDone:(id)sender {
    [self dismissViewControllerAnimated:true completion:nil];
}

@end
