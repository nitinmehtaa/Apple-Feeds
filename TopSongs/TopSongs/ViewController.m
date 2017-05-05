//
//  ViewController.m
//  TopSongs
//
//  Created by Nitin Mehta on 14/04/17.
//  Copyright © 2017 Nitin. All rights reserved.
//

#import "ViewController.h"
#import "AlbumTableViewCell.h"
#import "Album.h"
#import <UIKit/UIKit.h>
#import <SVProgressHUD.h>


#define X(v)                                        v.frame.origin.x
#define Y(v)                                        v.frame.origin.y
#define H(v)                                        v.frame.size.height
#define W(v)                                        v.frame.size.width

#define NO_RESOURCE_INTERNET_TAG 101110046
#define NO_RESOURCE_SERVER_TAG   101110049
#define NO_RESOURCE_RETAKE_TAG   101110040
#define NO_RESOURCE_404_TAG      101110026

@interface ViewController ()

{
    BOOL firstCall;
}
@property (nonatomic) BOOL pageRequiresRefresh;
@end

@implementation ViewController
{
    UITableView *albumTableView;
    NSMutableArray *topAlbums;
   __block NSDictionary *responseDict;
}

static NSString* AlbumTableViewCellIdentifier = @"AlbumTableViewCellIdentifier";


- (void)viewDidLoad {
    [super viewDidLoad];
    [super viewDidAppear:YES];
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    if(firstCall)
    {
        [self makeTopSongsApiCall];
        return;
    }
    
   
}

- (instancetype) init
{
    self = [super init];
    if(self)
    {
        [self initializeVariables];
        [self setUpViews];
    }
    return self;
}

- (void)initializeVariables
{
    self.pageRequiresRefresh = YES;
    firstCall = YES;
}

- (void)setUpViews
{
    
    [self.view setBackgroundColor:[UIColor colorWithRed:211/255.0f green:211/255.0f blue:211/255.0f alpha:1.0f]];
    albumTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, W(self.view), H(self.view)) style:UITableViewStylePlain];
    [albumTableView setShowsVerticalScrollIndicator:NO];
    [albumTableView setDelegate:self];
    [albumTableView setDataSource:self];
    [albumTableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    [self.view addSubview:albumTableView];
    
}

//Top songs API call
- (void)makeTopSongsApiCall
{
    [SVProgressHUD show];
    __weak typeof(self) weakSelf = self;
    [[[NSURLSession sharedSession] dataTaskWithURL:[[NSURL alloc] initWithString:@"https://itunes.apple.com/in/rss/topalbums/limit=10/json"] completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        [SVProgressHUD dismiss];
        if (error){
            NSLog(@"This is Fucking Error !!");
        }else{
            NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
//            NSLog(@"%@", dict);
            responseDict = [dict valueForKey:@"feed"];
            [weakSelf parseAndReloadData];
        }
    }]resume
     ];
 
    }
- (void)parseAndReloadData
{
    topAlbums = [[NSMutableArray alloc] init];
    NSArray *array = [responseDict valueForKey:@"entry"];
    for (NSDictionary *dict in array)
    {
        Album *album = [[Album alloc] init];
        [album parseObject:dict withInitialParams:nil];
        [topAlbums addObject:album];
    }
    dispatch_async(dispatch_get_main_queue(), ^{
        [albumTableView reloadData];
    });
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - table view delegates

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 200;
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return topAlbums.count;

}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    AlbumTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier: AlbumTableViewCellIdentifier];
    if(!cell)
    {
        cell = [[AlbumTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:AlbumTableViewCellIdentifier];
    }
    Album * album = [topAlbums objectAtIndex:indexPath.row];
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    [cell updateData:album];
    return cell;
}

- (void)refreshPage
{
    [self initializeVariables];
    [self makeTopSongsApiCall];
}

#pragma mark No Resource Delegate

- (void)noResourceButtonClicked:(NSUInteger)tag
{
    if(tag == NO_RESOURCE_INTERNET_TAG || tag == NO_RESOURCE_SERVER_TAG)
    {
        [self makeTopSongsApiCall];
    }
    else if (tag == NO_RESOURCE_404_TAG)
    {
        [self.navigationController popViewControllerAnimated:YES];
    }
    else
    {
        [self.navigationController popToRootViewControllerAnimated:YES];
    }
}




@end
