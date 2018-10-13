//
//  VideoCell.m
//  Tutorials
//
//  Created by Mokhtar on 10/11/18.
//  Copyright © 2018 Mokhtar. All rights reserved.
//

#import "VideoCell.h"
#import "Video.h"
#import <SDWebImage/UIImageView+WebCache.h>

@implementation VideoCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.layer.cornerRadius = 2;
    self.layer.shadowColor = [[UIColor grayColor] CGColor];
    self.layer.shadowRadius = 2;
    self.layer.shadowOffset = CGSizeMake(2, 2);
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}


-(void)updateUI: (Video*) video {
    [self.videoThumb sd_setImageWithURL:[NSURL URLWithString:video.videoThumb] placeholderImage:nil];
    self.songName.text = video.videoClipName;
    self.descLabel.text = video.videoDescription;
}

@end
