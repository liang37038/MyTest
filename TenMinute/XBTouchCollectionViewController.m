//
//  XBTouchCollectionViewController.m
//  TenMinute
//
//  Created by sasukiliang on 15/6/2.
//  Copyright (c) 2015年 Liang. All rights reserved.
//

#import "XBTouchCollectionViewController.h"

static NSString *const MediaCellIdentifier = @"mediaCell";
static NSString *const SearchCellIdentifier = @"mediaCell2";

@interface XBTouchCollectionViewController ()<UICollectionViewDataSource,UICollectionViewDelegate>
{
    CGFloat itemSpace;
    CGFloat screenWidth;
    CGFloat screenHeight;
}
@end

@implementation XBTouchCollectionViewController

-(instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
    
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        itemSpace = 10;
    }

    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    screenWidth = [[UIScreen mainScreen]bounds].size.width;
    screenHeight = [[UIScreen mainScreen]bounds].size.height;
    
    [self prepareData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

-(void)prepareData{
    
    MediaObject *obj1 = [[MediaObject alloc]init];
    [obj1 setMediaPic:@"media_1.png"];
    [obj1 setMediaDesc:@"冒险剧情《狼图腾》BD国语中字"];
    [obj1 setMediaHot:@"2.8万"];
    MediaObject *obj2 = [[MediaObject alloc]init];
    [obj2 setMediaPic:@"media_2.png"];
    [obj2 setMediaDesc:@"科幻恐怖《寄生兽真人版》BD中文字幕"];
    [obj2 setMediaHot:@"3.1万"];
    MediaObject *obj3 = [[MediaObject alloc]init];
    [obj3 setMediaPic:@"media_3.png"];
    [obj3 setMediaDesc:@"科幻动作《木星上行》BD中英双字幕"];
    [obj3 setMediaHot:@"2.2万"];
    MediaObject *obj4 = [[MediaObject alloc]init];
    [obj4 setMediaPic:@"media_4.png"];
    [obj4 setMediaDesc:@"战争动作《美国狙击手》BD中英双字幕"];
    [obj4 setMediaHot:@"2.7万"];
    MediaObject *obj5 = [[MediaObject alloc]init];
    [obj5 setMediaPic:@"media_5.png"];
    [obj5 setMediaDesc:@"剧情爱情《冲上云霄》BD中文字幕"];
    [obj5 setMediaHot:@"4.8万"];
    MediaObject *obj6 = [[MediaObject alloc]init];
    [obj6 setMediaPic:@"media_6.png"];
    [obj6 setMediaDesc:@"动作喜剧《澳门风云2》"];
    [obj6 setMediaHot:@"2.7万"];
    
    MediaObject *obj7 = [[MediaObject alloc]init];
    [obj7 setMediaPic:@"media_1.png"];
    [obj7 setMediaDesc:@"冒险剧情《狼图腾》BD国语中字"];
    [obj7 setMediaHot:@"2.8万"];
    MediaObject *obj8 = [[MediaObject alloc]init];
    [obj8 setMediaPic:@"media_2.png"];
    [obj8 setMediaDesc:@"科幻恐怖《寄生兽真人版》BD中文字幕"];
    [obj8 setMediaHot:@"3.1万"];
    
    self.funnyItems = [NSMutableArray arrayWithArray:@[obj1,obj2,obj3,obj4,obj5,obj6,obj7,obj8]];
}

-(UIScrollView *)scrollView{
    
    UICollectionViewFlowLayout *collectionLayout = [[UICollectionViewFlowLayout alloc]init];
    UICollectionView *mediaCollectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, screenWidth, screenHeight) collectionViewLayout:collectionLayout];
    [mediaCollectionView setShowsHorizontalScrollIndicator:NO];
    [mediaCollectionView setShowsVerticalScrollIndicator:YES];
    [mediaCollectionView setBackgroundColor:[UIColor clearColor]];
    [mediaCollectionView setDelegate:self];
    [mediaCollectionView setDataSource:self];

    __weak typeof(mediaCollectionView) weakSelf = mediaCollectionView;
    [mediaCollectionView addLegendHeaderWithRefreshingBlock:^{
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            // 拿到当前的下拉刷新控件，结束刷新状态
            [weakSelf.header endRefreshing];
        });

    }];

    return mediaCollectionView;
}

#pragma mark - CollectionView Delegate

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    if(indexPath.row == 0){
        [collectionView registerNib:[UINib nibWithNibName:@"MediaSearchCollectionViewCell" bundle:nil]forCellWithReuseIdentifier:SearchCellIdentifier];
        
        MediaSearchCollectionViewCell *searchCell = [collectionView dequeueReusableCellWithReuseIdentifier:SearchCellIdentifier forIndexPath:indexPath];
        
        if (!searchCell) {
            searchCell = [[[NSBundle mainBundle]loadNibNamed:@"MediaSearchCollectionViewCell" owner:self options:nil]objectAtIndex:0];
        }
        
        return searchCell;
    }else{
        [collectionView registerNib:[UINib nibWithNibName:@"MediaCollectionViewCell" bundle:nil]forCellWithReuseIdentifier:MediaCellIdentifier];
     
        MediaObject *mediaObject = [self.funnyItems objectAtIndex:indexPath.row - 1];
        
        MediaCollectionViewCell *mediaCell = [collectionView dequeueReusableCellWithReuseIdentifier:MediaCellIdentifier forIndexPath:indexPath];
        
        if (!mediaCell) {
            mediaCell = [[[NSBundle mainBundle]loadNibNamed:@"MediaCollectionViewCell" owner:self options:nil]objectAtIndex:0];
        }
        
        [mediaCell.ivBackground setImage:[UIImage imageNamed:mediaObject.mediaPic]];
        [mediaCell.lbDesc setText:mediaObject.mediaDesc];
        [mediaCell.lbHot setText:mediaObject.mediaHot];
        
        return mediaCell;
    }
}


-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    
    UIEdgeInsets insets = UIEdgeInsetsMake(itemSpace, itemSpace, itemSpace, itemSpace);
    
    return insets;
}

-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    CGSize itemSize;
    
    CGFloat itemWidth;
    
    if (indexPath.row == 0) {
        itemWidth = [[UIScreen mainScreen]bounds].size.width - itemSpace*2;
        itemSize = CGSizeMake(itemWidth, 50);
    }else{
        itemWidth = ([[UIScreen mainScreen]bounds].size.width - 4 * itemSpace) / 2;
        itemSize = CGSizeMake(itemWidth, 140);
    }
    return itemSize;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return [self.funnyItems count] + 1;
}


@end
