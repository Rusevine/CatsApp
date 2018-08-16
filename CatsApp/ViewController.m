//
//  ViewController.m
//  CatsApp
//
//  Created by Wiljay Flores on 2018-08-16.
//  Copyright © 2018 wiljay. All rights reserved.
//

#import "ViewController.h"
#import "NetworkManager.h"
#import "PhotoCollectionViewCell.h"
#import "Photo.h"

@interface ViewController () <UICollectionViewDataSource>
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (nonatomic) NSArray <Photo *> *photos;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [NetworkManager getPhotos:^(NSArray *photos){
        self.photos = photos;
        NSLog(@"View controller got data: %@", self.photos);
        [[NSOperationQueue mainQueue] addOperationWithBlock:^{
           [self.collectionView reloadData];
        }];
    }];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

//- (void)viewWillLayoutSubviews {
//    UICollectionViewFlowLayout *layout = (UICollectionViewFlowLayout *)self.collectionView.collectionViewLayout;
//    layout.sectionHeadersPinToVisibleBounds = YES;
//    CGSize size = CGSizeMake(self.collectionView.bounds.size.width/2, self.collectionView.bounds.size.width/2);
//    layout.itemSize = size;
//}



- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(nonnull NSIndexPath *)indexPath {
    PhotoCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    cell.photo = self.photos[indexPath.row];
    
    return cell;
}

- (NSInteger)collectionView:(nonnull UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.photos.count;
}




@end
