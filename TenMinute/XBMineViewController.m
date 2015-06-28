//
//  XBMineViewController.m
//  TenMinute
//
//  Created by sasukiliang on 15/5/21.
//  Copyright (c) 2015年 Liang. All rights reserved.
//

#import "XBMineViewController.h"

@interface XBMineViewController ()
{
    NSMutableArray *mineItems;
}
@end

static NSString *const MineTableViewCellIdentifier = @"mineCell";

@implementation XBMineViewController

-(instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
    
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        mineItems = [NSMutableArray array];
    }
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupData];
    [self setupTableView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

-(UIScrollView *)scrollView{
    return _mineTableView;
}

-(void)setupData{
    MineObject *m1 = [[MineObject alloc]init];
    [m1 setIcon:@"mine_1.png"];
    [m1 setTitle:@"每次打开显示最新L0单"];
    [m1 setShowSwitch:YES];
    MineObject *m2 = [[MineObject alloc]init];
    [m2 setIcon:@"mine_2.png"];
    [m2 setTitle:@"推送资讯"];
    [m2 setShowSwitch:YES];
    MineObject *m3 = [[MineObject alloc]init];
    [m3 setIcon:@"mine_3.png"];
    [m3 setTitle:@"收藏夹"];
    MineObject *m4 = [[MineObject alloc]init];
    [m4 setIcon:@"mine_4.png"];
    [m4 setTitle:@"积分活动"];
    MineObject *m5 = [[MineObject alloc]init];
    [m5 setIcon:@"mine_5.png"];
    [m5 setTitle:@"清理缓存数据"];
    MineObject *m6 = [[MineObject alloc]init];
    [m6 setIcon:@"mine_6.png"];
    [m6 setTitle:@"意见反馈"];
    MineObject *m7 = [[MineObject alloc]init];
    [m7 setIcon:@"mine_7.png"""];
    [m7 setTitle:@"前往AppStore评分"];
    MineObject *m8 = [[MineObject alloc]init];
    [m8 setIcon:@"mine_8.png"];
    [m8 setTitle:@"更多帮助"];
    
    [mineItems addObject:m1];
    [mineItems addObject:m2];
    [mineItems addObject:m3];
    [mineItems addObject:m4];
    [mineItems addObject:m5];
    [mineItems addObject:m6];
    [mineItems addObject:m7];
    [mineItems addObject:m8];
}

-(void)setupTableView{
    _mineTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, [[UIScreen mainScreen]bounds].size.width, [[UIScreen mainScreen]bounds].size.height) style:UITableViewStylePlain];
    [_mineTableView setSeparatorStyle:UITableViewCellSeparatorStyleSingleLine];
    [_mineTableView setDelegate:self];
    [_mineTableView setDataSource:self];
    _mineTableView.tableFooterView = [[UIView alloc]init];
    [_mineTableView registerNib:[UINib nibWithNibName:@"MineItemTableViewCell" bundle:nil] forCellReuseIdentifier:MineTableViewCellIdentifier];
    [self.view addSubview:_mineTableView];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    MineObject *mineObject = [mineItems objectAtIndex:indexPath.row];
    
    MineItemTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:MineTableViewCellIdentifier forIndexPath:indexPath];
    
    if (!cell) {
        cell = [[[NSBundle mainBundle]loadNibNamed:@"MineItemTableViewCell" owner:self options:nil]objectAtIndex:0];
    }
    
    [cell.mineIcon setImage:[UIImage imageNamed:mineObject.icon]];
    [cell.mineTitle setText:mineObject.title];
    if (mineObject.showSwitch) {
        [cell.mineSwitch setHidden:NO];
    }else{
        [cell.mineSwitch setHidden:YES];
    }
    
    return cell;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return [mineItems count];
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [[[NSBundle mainBundle]loadNibNamed:@"MineItemTableViewCell" owner:self options:nil]objectAtIndex:0];
    return cell.frame.size.height;
}

@end
