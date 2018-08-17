//
//  NetworkManager.m
//  CatsApp
//
//  Created by Wiljay Flores on 2018-08-16.
//  Copyright © 2018 wiljay. All rights reserved.
//

#import "NetworkManager.h"
#import "Photo.h"

@implementation NetworkManager

+(void)getPhotos:(void (^)(NSArray *))completion{
    NSURL *url = [[NSURL alloc] initWithString:@"https://api.imgur.com/3/gallery/search/?q=cats"];
    
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:url];
    [request setValue:@"Client-ID 3247f1daccdcb60" forHTTPHeaderField:@"Authorization"];
    
    NSURLSessionTask *task = [[NSURLSession sharedSession] dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        NSLog(@"Completed request: %@", response);
        
        if (error != nil) {
            NSLog(@"Error making request: %@", error.localizedDescription);
            abort();
        }
 
        NSInteger statusCode = [(NSHTTPURLResponse*)response statusCode];
        if (statusCode < 200 || statusCode >= 300) {
            NSLog(@"Non-OK error code: %@", response);
            abort();
        }
        
        NSError *jsonError = nil;
        NSDictionary* info = [NSJSONSerialization
                              JSONObjectWithData:data
                              options:0
                              error:&jsonError];
        if (jsonError != nil) {
            NSLog(@"Error parsing JSON: %@", jsonError.localizedDescription);
            abort();
        }
        
  
        NSLog(@"Title:%@ Url:%@", info[@"data"][0][@"title"], info[@"data"][0][@"images"][0][@"link"]);
        NSMutableArray *photos = [@[] mutableCopy];
        for (NSDictionary *data in info[@"data"]) {
            [photos addObject:[[Photo alloc] initWithData:data]];
        }
       completion(photos);
    }];
    NSLog(@"Created task");
    [task resume];
}




@end



