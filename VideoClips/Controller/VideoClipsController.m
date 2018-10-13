//
//  ViewController.m
//  Tutorials
//
//  Created by Mokhtar on 10/11/18.
//  Copyright © 2018 Mokhtar. All rights reserved.
//

#import "VideoClipsController.h"
#import "HTTPServices.h"
#import "VideoCell.h"
#import "Video.h"
#import "VideoController.h"



@interface VideoClipsController ()
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) NSString *cellID;
@property (strong, nonatomic) NSMutableArray *videoClipsArray;
@end

@implementation VideoClipsController



- (void)viewDidLoad {
    [super viewDidLoad];
    self.cellID = @"cellID";
//    self.tableView.allowsSelection = NO;

}



- (void)getSongs {
    [[HTTPServices shared] getSongs:^(NSDictionary * _Nullable dataDict, NSError * _Nullable err) {
        self.videoClipsArray = [[NSMutableArray alloc] init];
        
        if (err == nil) {
            for (NSDictionary *d in dataDict) {
                Video *video = [[Video alloc] initWithDictionary:d];
                NSLog(@"%@", video.videoClipName);
                [self.videoClipsArray addObject: video];
            }
            dispatch_async(dispatch_get_main_queue(), ^{
                [self.tableView reloadData];
            });
        } else {
            NSLog(@"Network Error");
        }
    }];
}



- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self getSongs];
}


- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    
    VideoCell * cell = (VideoCell*)[tableView dequeueReusableCellWithIdentifier:_cellID forIndexPath:indexPath];
    if (!cell) {
        cell = [VideoCell new];
    }
    Video *video = [self.videoClipsArray objectAtIndex:indexPath.row];
    [cell updateUI:video];
    return cell;
}


- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.videoClipsArray.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 100;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    Video *video = [self.videoClipsArray objectAtIndex:indexPath.row];
    [self performSegueWithIdentifier:@"videoVC" sender:video];
}


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    VideoController *destinationVC = (VideoController*) segue.destinationViewController;
    Video *video = (Video*) sender;
    destinationVC.video = video;
}

@end


