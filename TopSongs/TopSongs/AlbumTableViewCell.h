//
//  AlbumTableViewCell.h
//  TopSongs
//
//  Created by Nitin Mehta on 14/04/17.
//  Copyright © 2017 Nitin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Album.h"
@interface AlbumTableViewCell : UITableViewCell

- (void)updateData:(Album *)album;

@end
