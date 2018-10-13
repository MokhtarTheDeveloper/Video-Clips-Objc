//
//  HTTPServices.h
//  Tutorials
//
//  Created by Mokhtar on 10/11/18.
//  Copyright © 2018 Mokhtar. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN


typedef void (^onCompletion)(NSDictionary *__nullable dataDict, NSError * __nullable err);
@interface HTTPServices : NSObject




+(id)shared;
-(void) getSongs:(nullable onCompletion) completionHandler;
@end

NS_ASSUME_NONNULL_END
