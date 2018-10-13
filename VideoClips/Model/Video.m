//
//  Video.m
//  Tutorials
//
//  Created by Mokhtar on 10/12/18.
//  Copyright © 2018 Mokhtar. All rights reserved.
//

#import "Video.h"

@implementation Video

-(instancetype) initWithDictionary:(NSDictionary *)jsonDictionary {
    self = [super init];
    if (self) {
        self.videoClipName = [jsonDictionary objectForKey:@"videoClipName"];
        self.videoThumb = [jsonDictionary objectForKey:@"videoThumb"];
        self.embed = [jsonDictionary objectForKey:@"embed"];
        self.videoDescription = [jsonDictionary objectForKey:@"videoDescription"];
    }
    
    return self;
}

@end
