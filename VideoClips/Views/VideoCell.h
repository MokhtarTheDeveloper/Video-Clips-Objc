//
//  VideoCell.h
//  Tutorials
//
//  Created by Mokhtar on 10/11/18.
//  Copyright © 2018 Mokhtar. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Video.h"

NS_ASSUME_NONNULL_BEGIN
@interface VideoCell : UITableViewCell


@property (weak, nonatomic) IBOutlet UIImageView *videoThumb;
@property (weak, nonatomic) IBOutlet UILabel *descLabel;
@property (weak, nonatomic) IBOutlet UILabel *songName;
-(void)updateUI: (Video*) video;
@end

NS_ASSUME_NONNULL_END
