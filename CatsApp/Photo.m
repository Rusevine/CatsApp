//
//  Cats.m
//  CatsApp
//
//  Created by Wiljay Flores on 2018-08-16.
//  Copyright © 2018 wiljay. All rights reserved.
//

#import "Photo.h"

@interface Photo ()
@property (nonatomic) NSDictionary *data;
@property (nonatomic) NSURL *url;
@end

@implementation Photo

- (instancetype)initWithData:(NSDictionary *)data
{
    self = [super init];
    if (self) {
        _data = data;
        _image = nil;
        [self setupImage];
    }
    return self;
}

-(void)setupImage{
    NSString *urlString = [NSString stringWithFormat:@"%@",self.data[@"images"][0][@"link"]];
    _title = self.data[@"title"];
    _url = [[NSURL alloc] initWithString:urlString];
 
    if(self.image == nil){
        NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
        NSURLSession *session = [NSURLSession sessionWithConfiguration:configuration];
        
        NSURLSessionDownloadTask *downloadTask = [session downloadTaskWithURL:self.url completionHandler:^(NSURL * _Nullable location, NSURLResponse * _Nullable response, NSError * _Nullable error) {
            NSData *data = [NSData dataWithContentsOfURL:location];
            UIImage *image = [UIImage imageWithData:data];
            
            [[NSOperationQueue mainQueue] addOperationWithBlock:^{
                self.image = image;
            }];
   
        }];
        [downloadTask resume];
    }
}

@end
