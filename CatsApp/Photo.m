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
    _title = self.data[@"title"];
    NSString *urlString = [NSString stringWithFormat:@"%@",self.data[@"images"][0][@"link"]];
    _url = [[NSURL alloc] initWithString:urlString];
    NSData *data = [NSData dataWithContentsOfURL:self.url];
    UIImage *image = [UIImage imageWithData:data];
    self.image = image;

}

@end
