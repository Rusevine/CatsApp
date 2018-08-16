//
//  NetworkManager.m
//  CatsApp
//
//  Created by Wiljay Flores on 2018-08-16.
//  Copyright © 2018 wiljay. All rights reserved.
//

#import "NetworkManager.h"

@implementation NetworkManager

+(void)getCats{
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
        
  
//        NSLog(@"Meta data: %@", info[@"meta"]);
//        NSMutableArray *reps = [@[] mutableCopy];
//        for (NSDictionary *rep in info[@"objects"]) {
//            [reps addObject:[[Rep alloc] initWithInfo:rep]];
//        }
//
//        completion(reps);
    }];
    NSLog(@"Created task");
    [task resume];
}




@end



