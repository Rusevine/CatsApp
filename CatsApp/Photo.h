//
//  Cats.h
//  CatsApp
//
//  Created by Wiljay Flores on 2018-08-16.
//  Copyright © 2018 wiljay. All rights reserved.
//

#import <Foundation/Foundation.h>
@import UIKit;

@interface Photo : NSObject

@property (nonatomic) UIImage *image;
@property (nonatomic) NSString *title;

-(instancetype)initWithData:(NSDictionary *)data;

@end
