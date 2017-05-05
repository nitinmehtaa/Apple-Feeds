//
//  Album.m
//  TopSongs
//
//  Created by Nitin Mehta on 17/04/17.
//  Copyright © 2017 Nitin. All rights reserved.
//

#import "Album.h"

@implementation Album

@synthesize name;
@synthesize price;
@synthesize artist;
@synthesize releaseDate;

- (void)parseObject:(NSDictionary *)responseObject withInitialParams:(NSDictionary *)params
{
    name = [responseObject valueForKeyPath:@"im:name.label"];
    price = [responseObject valueForKeyPath:@"im:price.label"];
    artist = [responseObject valueForKeyPath:@"im:artist.label"];
    releaseDate = [responseObject valueForKeyPath:@"im:releaseDate.label"];
    
    NSArray *arr = [responseObject valueForKeyPath:@"im:image"];
    
    _albumImage = [[image alloc] init];
    [_albumImage parseObject:arr[2] withInitialParams:nil];

}

@end
