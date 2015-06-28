//
//  XBWorldViewController.m
//  TenMinute
//
//  Created by sasukiliang on 15/5/21.
//  Copyright (c) 2015年 Liang. All rights reserved.
//

#import "XBWorldViewController.h"

static NSString * const XBFunnyCell2Identifier = @"funnyCell2";
static NSString * const XBFunnyCell3Identifier = @"funnyCell3";

@interface XBWorldViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    NSMutableArray *funnyItems;
}
@end

@implementation XBWorldViewController


-(instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
    
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        
    }
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupTestData];
    [self setupTableView];
}

-(void)setupTestData{
    
    FunnyObject *obj1 = [[FunnyObject alloc]init];
    [obj1 setFunnyType:TYPE2];
    [obj1 setPic:@"world_1.png"];
    [obj1 setFunnyType:TYPE2];
    [obj1 setCategory:@"设计之墙"];
    [obj1 setTitle:@"瞬间表达的艺术情感"];
    [obj1 setDesc:@"涂鸦的快乐"];
    [obj1 setHot:5746];
    
    FunnyObject *obj2 = [[FunnyObject alloc]init];
    [obj2 setPic:@"world_2.png"];
    [obj2 setFunnyType:TYPE2];
    [obj2 setCategory:@"摄影角"];
    [obj2 setTitle:@"古城游记"];
    [obj2 setDesc:@"领略当时的风貌"];
    [obj2 setHot:7456];
    
    FunnyObject *obj3 = [[FunnyObject alloc]init];
    [obj3 setFunnyType:TYPE3];
    [obj3 setUserPic:@"world_user_head.png"];
    [obj3 setPic:@"world_3.png"];
    [obj3 setTitle:@"记录生活的每一刻"];
    [obj3 setPubDate:[NSDate date]];
    
    FunnyObject *obj4 = [[FunnyObject alloc]init];
    [obj4 setPic:@"world_4.png"];
    [obj4 setFunnyType:TYPE2];
    [obj4 setCategory:@"分析者"];
    [obj4 setTitle:@"天空下的铁塔们"];
    [obj4 setDesc:@"铁塔专用大辞典"];
    [obj4 setHot:4690];
    
    funnyItems = [NSMutableArray array];
    [funnyItems addObjectsFromArray:@[obj1,obj2,obj3,obj4]];
    
}

-(void)setupTableView{
    [self.worldTableView setDelegate:self];
    [self.worldTableView setDataSource:self];
    [self.worldTableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    self.worldTableView.tableFooterView = [[UIView alloc]init];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

-(UIScrollView *)scrollView{
    return self.worldTableView;
}

#pragma mark - TableView Delegate

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    FunnyObject *funnyObject = [funnyItems objectAtIndex:indexPath.row];
    
    switch (funnyObject.funnyType) {
            case TYPE2:
        {
            [tableView registerNib:[UINib nibWithNibName:@"FunnyTableViewCell2" bundle:nil] forCellReuseIdentifier:XBFunnyCell2Identifier];
            
            FunnyTableViewCell2 *cell2 = [tableView dequeueReusableCellWithIdentifier:@"funnyCell2" forIndexPath:indexPath];
            
            if (!cell2) {
                cell2 = [[[NSBundle mainBundle]loadNibNamed:@"FunnyTableViewCell2" owner:self options:nil]objectAtIndex:0];
            }
            
            [cell2.ivPic setImage:[UIImage imageNamed:funnyObject.pic]];
            [cell2.lb1 setText:funnyObject.category];
            [cell2.lb2 setText:funnyObject.title];
            [cell2.lb3 setText:funnyObject.desc];
            [cell2.lb4 setText:[NSString stringWithFormat:@"%ld",funnyObject.hot]];
            
            return cell2;
        }
            case TYPE3:
        {
            [tableView registerNib:[UINib nibWithNibName:@"FunnyTableViewCell3" bundle:nil] forCellReuseIdentifier:XBFunnyCell3Identifier];
            
            FunnyTableViewCell3 *cell3 = [tableView dequeueReusableCellWithIdentifier:@"funnyCell3" forIndexPath:indexPath];
            
            if (!cell3) {
                cell3 = [[[NSBundle mainBundle]loadNibNamed:@"FunnyTableViewCell3" owner:self options:nil]objectAtIndex:0];
            }
            
            [cell3.ivPic setImage:[UIImage imageNamed:funnyObject.pic]];
            [cell3.ivUserPic setImage:[UIImage imageNamed:funnyObject.userPic]];
            [cell3.lbTitle setText:funnyObject.title];
            [cell3.lbDate setText:@"2015-5-20  10:39"];
            
            return cell3;
        }
            default:
            return nil;
    }
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [funnyItems count];
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    FunnyObject *funnyObject = [funnyItems objectAtIndex:indexPath.row];
    
    CGFloat cellHeight = 0;
    
    switch (funnyObject.funnyType) {
            case TYPE2:
            cellHeight = [[[[NSBundle mainBundle]loadNibNamed:@"FunnyTableViewCell2" owner:self options:nil]objectAtIndex:0]frame].size.height;
            break;
            case TYPE3:
            cellHeight = [[[[NSBundle mainBundle]loadNibNamed:@"FunnyTableViewCell3" owner:self options:nil]objectAtIndex:0]frame].size.height;
            break;
        default:
            break;
    }
    
    return cellHeight;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}



@end
