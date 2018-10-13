//
//  HTTPServices.m
//  Tutorials
//
//  Created by Mokhtar on 10/11/18.
//  Copyright © 2018 Mokhtar. All rights reserved.
//

#import "HTTPServices.h"
#define URL_BASE "http://localhost:6001"
#define URL_Songs "/songs"

@implementation HTTPServices


+(id)shared {
    static HTTPServices *sharedInstance = nil;
    
    if (sharedInstance == nil) {
        sharedInstance = [[HTTPServices alloc] init];
    }
    return sharedInstance;
}

- (void)getSongs: (nullable onCompletion)completionHandler {
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"%s%s",URL_BASE,URL_Songs]];
    
    [[[NSURLSession sharedSession] dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (data) {
            NSError *err;
            
            NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:0 error: &err];
            
            if (err == nil) {
                completionHandler(json, nil);
            } else {
                completionHandler(nil, err);
            }
            
        }
    }] resume];
    }
@end
