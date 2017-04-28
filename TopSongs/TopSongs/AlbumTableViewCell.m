//
//  AlbumTableViewCell.m
//  TopSongs
//
//  Created by Nitin Mehta on 14/04/17.
//  Copyright © 2017 Nitin. All rights reserved.
//

#import "AlbumTableViewCell.h"

//CONSTANTS
#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)(((rgbValue) & 0xFF0000) >> 16))/255.0 green:((float)(((rgbValue) & 0xFF00) >> 8))/255.0 blue:((float)((rgbValue) & 0xFF))/255.0 alpha:1.0]
#define UIColorFromRGBWithAlpha(rgbValue,a) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:a]

#define BOTTOM(v)                                   (v.frame.origin.y + v.frame.size.height)
#define AFTER(v)                                    (v.frame.origin.x + v.frame.size.width)
#define CENTER_X(v)                                 v.center.x
#define CENTER_Y(v)                                 v.center.y

#define X(v)                                        v.frame.origin.x
#define Y(v)                                        v.frame.origin.y
#define H(v)                                        v.frame.size.height
#define W(v)                                        v.frame.size.width

#define GBL1                  0x111111
#define GBL2                  0x666666
#define GBL3                  0x999999
#define GBL4                  0xcccccc
#define GBL4_25               0xdbdbdb
#define GBL4_5                0xdddddd
#define GBL4_75               0xe8e9e9
#define GBL5                  0xeeeeee
#define GBL5_5                0xf2f2f2
#define GBL6                  0xf4f4f4
#define GBL7                  0xf6f6f6
#define GBL7_5                0xf8f8f8
#define GBL7_9                0xf9f9f9
#define GBL8                  0xfcfcfc
#define GBL9                  0x757575
#define GBL10                 0x333333
#define GBL11                 0x858585
#define GBL12                 0x1e1e1e
#define BLU1                  0x2c8196
#define BLU2                  0x3192aa
#define BLU3                  0x37a3be
#define BLU4                  0x45afc9
#define BLU5                  0x59b7cf
#define BLU6                  0x6dc0d5

#define FONT_BLACK_NAME @"Helvetica-Medium"
#define FONT_BOLD_NAME @"Helvetica-Regular"
#define FONT_REGULAR_NAME @"Helvetica-Light"

// BLACK FONTS

#define FONT_BLACK_8                 [UIFont fontWithName:FONT_BLACK_NAME size:8]
#define FONT_BLACK_9                 [UIFont fontWithName:FONT_BLACK_NAME size:9]
#define FONT_BLACK_10                [UIFont fontWithName:FONT_BLACK_NAME size:10]
#define FONT_BLACK_11                [UIFont fontWithName:FONT_BLACK_NAME size:11]
#define FONT_BLACK_12                [UIFont fontWithName:FONT_BLACK_NAME size:12]
#define FONT_BLACK_13                [UIFont fontWithName:FONT_BLACK_NAME size:13]
#define FONT_BLACK_14                [UIFont fontWithName:FONT_BLACK_NAME size:14]
#define FONT_BLACK_15                [UIFont fontWithName:FONT_BLACK_NAME size:15]
#define FONT_BLACK_16                [UIFont fontWithName:FONT_BLACK_NAME size:16]
#define FONT_BLACK_17                [UIFont fontWithName:FONT_BLACK_NAME size:17]
#define FONT_BLACK_18                [UIFont fontWithName:FONT_BLACK_NAME size:18]
#define FONT_BLACK_19                [UIFont fontWithName:FONT_BLACK_NAME size:19]
#define FONT_BLACK_20                [UIFont fontWithName:FONT_BLACK_NAME size:20]
#define FONT_BLACK_22                [UIFont fontWithName:FONT_BLACK_NAME size:22]
#define FONT_BLACK_24                [UIFont fontWithName:FONT_BLACK_NAME size:24]
#define FONT_BLACK_26                [UIFont fontWithName:FONT_BLACK_NAME size:26]
#define FONT_BLACK_32                [UIFont fontWithName:FONT_BLACK_NAME size:32]
#define FONT_BLACK(X)                [UIFont fontWithName:FONT_BLACK_NAME size:X]


// BOLD FONTS

#define FONT_BOLD_8                 [UIFont fontWithName:FONT_BOLD_NAME size:8]
#define FONT_BOLD_9                 [UIFont fontWithName:FONT_BOLD_NAME size:9]
#define FONT_BOLD_10                [UIFont fontWithName:FONT_BOLD_NAME size:10]
#define FONT_BOLD_11                [UIFont fontWithName:FONT_BOLD_NAME size:11]
#define FONT_BOLD_12                [UIFont fontWithName:FONT_BOLD_NAME size:12]
#define FONT_BOLD_13                [UIFont fontWithName:FONT_BOLD_NAME size:13]
#define FONT_BOLD_14                [UIFont fontWithName:FONT_BOLD_NAME size:14]
#define FONT_BOLD_15                [UIFont fontWithName:FONT_BOLD_NAME size:15]
#define FONT_BOLD_16                [UIFont fontWithName:FONT_BOLD_NAME size:16]
#define FONT_BOLD_17                [UIFont fontWithName:FONT_BOLD_NAME size:17]
#define FONT_BOLD_18                [UIFont fontWithName:FONT_BOLD_NAME size:18]
#define FONT_BOLD_19                [UIFont fontWithName:FONT_BOLD_NAME size:19]
#define FONT_BOLD_20                [UIFont fontWithName:FONT_BOLD_NAME size:20]
#define FONT_BOLD_22                [UIFont fontWithName:FONT_BOLD_NAME size:22]
#define FONT_BOLD_24                [UIFont fontWithName:FONT_BOLD_NAME size:24]
#define FONT_BOLD_26                [UIFont fontWithName:FONT_BOLD_NAME size:26]
#define FONT_BOLD_32                [UIFont fontWithName:FONT_BOLD_NAME size:32]
#define FONT_BOLD(X)                [UIFont fontWithName:FONT_BOLD_NAME size:X]

// Regular fonts

#define FONT_REGULAR_1              [UIFont fontWithName:FONT_REGULAR_NAME size:1]
#define FONT_REGULAR_8              [UIFont fontWithName:FONT_REGULAR_NAME size:8]
#define FONT_REGULAR_9              [UIFont fontWithName:FONT_REGULAR_NAME size:9]
#define FONT_REGULAR_10             [UIFont fontWithName:FONT_REGULAR_NAME size:10]
#define FONT_REGULAR_11             [UIFont fontWithName:FONT_REGULAR_NAME size:11]
#define FONT_REGULAR_12             [UIFont fontWithName:FONT_REGULAR_NAME size:12]
#define FONT_REGULAR_12_5           [UIFont fontWithName:FONT_REGULAR_NAME size:12.5]
#define FONT_REGULAR_13             [UIFont fontWithName:FONT_REGULAR_NAME size:13]
#define FONT_REGULAR_14             [UIFont fontWithName:FONT_REGULAR_NAME size:14]
#define FONT_REGULAR_15             [UIFont fontWithName:FONT_REGULAR_NAME size:15]
#define FONT_REGULAR_16             [UIFont fontWithName:FONT_REGULAR_NAME size:16]
#define FONT_REGULAR_17             [UIFont fontWithName:FONT_REGULAR_NAME size:17]
#define FONT_REGULAR_18             [UIFont fontWithName:FONT_REGULAR_NAME size:18]
#define FONT_REGULAR_19             [UIFont fontWithName:FONT_REGULAR_NAME size:19]
#define FONT_REGULAR_20             [UIFont fontWithName:FONT_REGULAR_NAME size:20]
#define FONT_REGULAR_21             [UIFont fontWithName:FONT_REGULAR_NAME size:21]
#define FONT_REGULAR_22             [UIFont fontWithName:FONT_REGULAR_NAME size:22]
#define FONT_REGULAR_23             [UIFont fontWithName:FONT_REGULAR_NAME size:23]
#define FONT_REGULAR_24             [UIFont fontWithName:FONT_REGULAR_NAME size:24]
#define FONT_REGULAR_25             [UIFont fontWithName:FONT_REGULAR_NAME size:25]
#define FONT_REGULAR_30             [UIFont fontWithName:FONT_REGULAR_NAME size:30]
#define FONT_REGULAR(X)             [UIFont fontWithName:FONT_REGULAR_NAME size:X]



@implementation AlbumTableViewCell
{
    UIView *containerView;
    UIImageView *AlbumImageIcon;
    UILabel *TitleLabel;
    UILabel *TitleLabelText;
    UILabel *PriceLabel;
    UILabel *PriceLabelText;
    UILabel *ArtistLabel;
    UILabel *ArtistLabelText;
    UILabel *RightsLabel;
    UILabel *RightsLabelText;
    UILabel *ReleaseDateLabel;
    UILabel *ReleaseDateLabelText;
}
+ (CGFloat)getPhoneWidth
{
    static CGFloat width;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        width = [UIScreen mainScreen].bounds.size.width;
    });
    
    
    return  width;
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setupViews];
    }
    return self;
}

- (void) setupViews
{
    containerView = [[UIView alloc] init];
    [containerView setBackgroundColor:[UIColor whiteColor]];
    [[containerView layer] setCornerRadius:2.0f];
    [[containerView layer] setBorderWidth:1.0f];
    [[containerView layer] setBorderColor:UIColorFromRGB(GBL5).CGColor];
    [containerView setFrame:CGRectMake(10, 20, 350, 170)];
    
    AlbumImageIcon = [[UIImageView alloc] init];
    [[AlbumImageIcon layer] setBorderWidth:1.0f];
    [[AlbumImageIcon layer] setBorderColor:[UIColor grayColor].CGColor];
    [[AlbumImageIcon layer] setCornerRadius:2.0f];
    [AlbumImageIcon setFrame:CGRectMake(5, 5, 120, 160)];
    
    TitleLabel = [[UILabel alloc]init];
    [TitleLabel setFont:FONT_REGULAR(12)];
    [TitleLabel setTextColor:UIColorFromRGB(GBL10)];
    [TitleLabel setText:@"Title"];
    [TitleLabel setFrame:CGRectMake(AFTER(AlbumImageIcon) + 10, Y(AlbumImageIcon), 50, 30)];
    
    TitleLabelText = [[UILabel alloc]init];
    [TitleLabelText setFont:FONT_REGULAR(12)];
    [TitleLabelText setTextColor:UIColorFromRGB(GBL10)];
    [TitleLabelText setNumberOfLines:0];
    [TitleLabelText setFrame:CGRectMake(AFTER(TitleLabel)+ 5, 8, 250, 30)];
    
    PriceLabel = [[UILabel alloc]init];
    [PriceLabel setFont:FONT_BLACK_11];
    [PriceLabel setTextColor:[UIColor blackColor]];
    [PriceLabel setText:@"Price"];
    [PriceLabel setFrame:CGRectMake(70, 12, 50, 30)];
    
    PriceLabelText = [[UILabel alloc]init];
    [PriceLabelText setFont:FONT_BLACK_11];
    [PriceLabelText setTextColor:[UIColor blackColor]];
    [PriceLabelText setText:@"Price"];
    
    ArtistLabel = [[UILabel alloc]init];
    [ArtistLabel setFont:FONT_BLACK_11];
    [ArtistLabel setTextColor:[UIColor blackColor]];
    [ArtistLabel setText:@"Artist"];
    
    ArtistLabelText = [[UILabel alloc]init];
    [ArtistLabelText setFont:FONT_BLACK_11];
    [ArtistLabelText setTextColor:[UIColor blackColor]];
    [ArtistLabelText setNumberOfLines:0];
    
    RightsLabel = [[UILabel alloc]init];
    [RightsLabel setFont:FONT_BLACK_11];
    [RightsLabel setTextColor:[UIColor blackColor]];
    [RightsLabel setText:@"Rights"];
    
    RightsLabelText = [[UILabel alloc]init];
    [RightsLabelText setFont:FONT_BLACK_11];
    [RightsLabelText setTextColor:[UIColor blackColor]];
    [RightsLabelText setNumberOfLines:0];
    
    ReleaseDateLabel= [[UILabel alloc]init];
    [ReleaseDateLabel setFont:FONT_BLACK_11];
    [ReleaseDateLabel setTextColor:[UIColor blackColor]];
    [ReleaseDateLabel setText:@"Release Date"];
    
    ReleaseDateLabelText = [[UILabel alloc]init];
    [ReleaseDateLabelText setFont:FONT_BLACK_11];
    [ReleaseDateLabelText setTextColor:[UIColor blackColor]];
    [ReleaseDateLabelText setNumberOfLines:0];
    
    [containerView addSubview:AlbumImageIcon];
    [containerView addSubview:TitleLabel];
    [containerView addSubview:TitleLabelText];
//    [containerView addSubview:PriceLabel];
//    [containerView addSubview:PriceLabelText];
//    [containerView addSubview:ArtistLabel];
//    [containerView addSubview:ArtistLabelText];
//    [containerView addSubview:RightsLabel];
//    [containerView addSubview:RightsLabelText];
//    [containerView addSubview:ReleaseDateLabel];
//    [containerView addSubview:ReleaseDateLabelText];
    
    [[self contentView] addSubview:containerView];
    [[self contentView] setBackgroundColor:UIColorFromRGB(GBL6)];

}

- (void)updateData:(Album *)album{
//    [AlbumImageIcon setImage:album.image];
    [TitleLabelText setText:album.name];
    [PriceLabelText setText:album.price];
    [ArtistLabelText setText:album.artist];
    [RightsLabelText setText:album.rights];
//    [ReleaseDateLabelText setText:album.releaseDate];

}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
