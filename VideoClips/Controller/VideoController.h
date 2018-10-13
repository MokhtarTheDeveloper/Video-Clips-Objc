//
//  VideoController.h
//  Tutorials
//
//  Created by Mokhtar on 10/12/18.
//  Copyright © 2018 Mokhtar. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <WebKit/WebKit.h>


NS_ASSUME_NONNULL_BEGIN
@class Video;
@interface VideoController : UIViewController <WKNavigationDelegate>
@property (nonatomic, strong) Video* video;
@end

NS_ASSUME_NONNULL_END
