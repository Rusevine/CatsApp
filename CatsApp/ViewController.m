//
//  ViewController.m
//  CatsApp
//
//  Created by Wiljay Flores on 2018-08-16.
//  Copyright © 2018 wiljay. All rights reserved.
//

#import "ViewController.h"
#import "NetworkManager.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [NetworkManager getCats];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
