//
//  Album.h
//  TopSongs
//
//  Created by Nitin Mehta on 17/04/17.
//  Copyright © 2017 Nitin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Album : NSObject

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSMutableArray *images;
@property (nonatomic, strong) NSString *price;
@property (nonatomic, strong) NSString *artist;
@property (nonatomic, strong) NSString *rights;
@property (nonatomic, strong) NSDate *releaseDate;

- (void)parseObject:(NSDictionary *)responseObject withInitialParams:(NSDictionary *)params;


@end
