//
//  image.m
//  TopSongs
//
//  Created by Nitin Mehta on 21/04/17.
//  Copyright © 2017 Nitin. All rights reserved.
//

#import "image.h"

@implementation image

@synthesize imageURL;
@synthesize height;

- (void)parseObject:(NSDictionary *)responseObject withInitialParams:(NSDictionary *)params;
{
    imageURL = [NSURL URLWithString:[responseObject valueForKeyPath:@"label"]];
    height = [responseObject valueForKeyPath:@"attributes.height"];
}




@end
