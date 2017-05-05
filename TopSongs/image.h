//
//  image.h
//  TopSongs
//
//  Created by Nitin Mehta on 21/04/17.
//  Copyright © 2017 Nitin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface image : NSObject
@property (nonatomic, strong) NSURL *imageURL;
@property (nonatomic, strong) NSNumber *height;

- (void)parseObject:(NSDictionary *)responseObject withInitialParams:(NSDictionary *)params;

@end
