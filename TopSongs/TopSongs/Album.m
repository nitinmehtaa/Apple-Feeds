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
@synthesize images;
@synthesize price;
@synthesize artist;
@synthesize releaseDate;

- (void)parseObject:(NSDictionary *)responseObject withInitialParams:(NSDictionary *)params
{
    name = [responseObject valueForKeyPath:@"im:name.label"];
    price = [responseObject valueForKeyPath:@"im:price.label"];
    artist = [responseObject valueForKeyPath:@"im:artist.label"];
    releaseDate = [responseObject valueForKeyPath:@"im:releaseDate.label"];

}

@end
