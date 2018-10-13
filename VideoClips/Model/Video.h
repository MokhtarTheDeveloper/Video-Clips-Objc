//
//  Video.h
//  Tutorials
//
//  Created by Mokhtar on 10/12/18.
//  Copyright © 2018 Mokhtar. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Video : NSObject
@property (nonatomic, strong) NSString* videoClipName;
@property (nonatomic, strong) NSString* embed;
@property (nonatomic, strong) NSString* videoThumb;
@property (nonatomic, strong) NSString* videoDescription;

-(id) initWithDictionary: (NSDictionary*) jsonDictionary;
@end

NS_ASSUME_NONNULL_END
