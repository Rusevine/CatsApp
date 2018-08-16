//
//  PhotoCollectionViewCell.m
//  CatsApp
//
//  Created by Wiljay Flores on 2018-08-16.
//  Copyright © 2018 wiljay. All rights reserved.
//

#import "PhotoCollectionViewCell.h"
#import "Photo.h"

@interface PhotoCollectionViewCell ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

@end

@implementation PhotoCollectionViewCell

-(void)setPhoto:(Photo *)photo{
    self.imageView.image = photo.image;
    self.titleLabel.text = photo.title;
}

@end
