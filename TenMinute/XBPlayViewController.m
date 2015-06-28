//
//  XBPlayViewController.m
//  TenMinute
//
//  Created by sasukiliang on 15/5/21.
//  Copyright (c) 2015年 Liang. All rights reserved.
//

#import "XBPlayViewController.h"

@interface XBPlayViewController ()
{
    NSMutableArray *playItems;
}
@end

static NSString *const PlayItemCellIdentifier = @"playItemCell";

@implementation XBPlayViewController

-(instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
    
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        playItems = [NSMutableArray array];
    }
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupData];
    [self setupTableView];

}

-(void)setupData{
    
    PlayObject *p1 = [[PlayObject alloc]init];
    [p1 setPlayTitle:@"影片库"];
    [p1 setPlayPic:@"play_film.png"];
    [p1 setPlayDesc:@"格式大片,任君选择"];
    
    PlayObject *p2 = [[PlayObject alloc]init];
    
    [p2 setPlayTitle:@"音乐库"];
    [p2 setPlayPic:@"play_music.png"];
    [p2 setPlayDesc:@"经典旋律,让你沉醉在循环的音海里"];
    
    PlayObject *p3 = [[PlayObject alloc]init];
    
    [p3 setPlayTitle:@"电视剧"];
    [p3 setPlayPic:@"play_tv.png"];
    [p3 setPlayDesc:@"催泪神剧,每分钟都精彩"];
    
    PlayObject *p4 = [[PlayObject alloc]init];
    
    [p4 setPlayTitle:@"MV库"];
    [p4 setPlayPic:@"play_mv.png"];
    [p4 setPlayDesc:@"唯美的画面,让你陶醉不已"];
    
    PlayObject *p5 = [[PlayObject alloc]init];
    
    [p5 setPlayTitle:@"游戏"];
    [p5 setPlayPic:@"play_game.png"];
    [p5 setPlayDesc:@"攻略SOLO视频"];
    
    [playItems addObject:p1];
    [playItems addObject:p2];
    [playItems addObject:p3];
    [playItems addObject:p4];
    [playItems addObject:p5];
}

-(UIScrollView *)scrollView{
    
    return _playTableView;
}

-(void)setupTableView{
    _playTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, [[UIScreen mainScreen]bounds].size.width, [[UIScreen mainScreen]bounds].size.height) style:UITableViewStylePlain];
    [_playTableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    [_playTableView setDelegate:self];
    [_playTableView setDataSource:self];
    _playTableView.tableFooterView = [[UIView alloc]init];
    [_playTableView registerNib:[UINib nibWithNibName:@"PlayItemTableViewCell" bundle:nil] forCellReuseIdentifier:PlayItemCellIdentifier];
    [self.view addSubview:_playTableView];
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    PlayObject *playObject = [playItems objectAtIndex:indexPath.row];
    
    PlayItemTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:PlayItemCellIdentifier forIndexPath:indexPath];
    
    if (!cell) {
        cell = [[[NSBundle mainBundle]loadNibNamed:@"PlayItemTableViewCell" owner:self options:nil]objectAtIndex:0];
    }
    
    [cell.playPic setImage:[UIImage imageNamed:playObject.playPic]];
    [cell.playTitle setText:playObject.playTitle];
    [cell.playDesc setText:playObject.playDesc];
    
    return cell;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return [playItems count];
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [[[NSBundle mainBundle]loadNibNamed:@"PlayItemTableViewCell" owner:self options:nil]objectAtIndex:0];
    
    return cell.frame.size.height;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    if (indexPath.row == 0) {
        XBTouchCollectionViewController *movieVC = [[XBTouchCollectionViewController alloc]initWithNibName:@"TouchDemoViewController" bundle:nil];
        
        [movieVC setMyPic:@"media_header.png"];
        [movieVC setMyTitle:@"影片库"];
        [movieVC setMyDesc:@"各式大片，任君选择"];
        
        [self.navigationController pushViewController:movieVC animated:YES];
    }
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}


@end
