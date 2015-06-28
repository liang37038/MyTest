//
//  XBFunnyViewController.m
//  TenMinute
//
//  Created by sasukiliang on 15/5/21.
//  Copyright (c) 2015年 Liang. All rights reserved.
//

#import "XBFunnyViewController.h"
#import "TouchDemoViewController.h"
static NSString * const XBFunnyCell1Identifier = @"funnyCell1";
static NSString * const XBFunnyCell2Identifier = @"funnyCell2";

@interface XBFunnyViewController ()
{
    NSMutableArray *funnyItems;
}
@end

@implementation XBFunnyViewController

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
    [obj1 setFunnyType:TYPE1];
    obj1.images = [NSArray arrayWithObjects:@"funny_banner1.png",@"funny_banner1.png",@"funny_banner1.png",@"funny_banner1.png", nil];
    
    FunnyObject *obj2 = [[FunnyObject alloc]init];
    [obj2 setPic:@"funny1.png"];
    [obj2 setFunnyType:TYPE2];
    [obj2 setCategory:@"设计感"];
    [obj2 setTitle:@"看看<男人装>封面设计"];
    [obj2 setDesc:@"从封面人物到摄影角度"];
    [obj2 setHot:32105];
    
    FunnyObject *obj3 = [[FunnyObject alloc]init];
    [obj3 setPic:@"funny2.png"];
    [obj3 setFunnyType:TYPE2];
    [obj3 setCategory:@"汪星球"];
    [obj3 setTitle:@"飞起来的汪星人"];
    [obj3 setDesc:@"萌萌的身躯让你不禁想抱着它"];
    [obj3 setHot:4523];
    
    FunnyObject *obj4 = [[FunnyObject alloc]init];
    [obj4 setPic:@"funny3.png"];
    [obj4 setFunnyType:TYPE2];
    [obj4 setCategory:@"文艺复兴"];
    [obj4 setTitle:@"魅惑夜空"];
    [obj4 setDesc:@"散布满天的星星让夜空增添一份魅力"];
    [obj4 setHot:4411];
    
    FunnyObject *obj5 = [[FunnyObject alloc]init];
    [obj5 setPic:@"funny4.png"];
    [obj5 setFunnyType:TYPE2];
    [obj5 setCategory:@"音乐疯"];
    [obj5 setTitle:@"炸裂的音符"];
    [obj5 setDesc:@"散布满天的星星让夜空增添一份魅力"];
    [obj5 setHot:32105];
    
    funnyItems = [NSMutableArray array];
    [funnyItems addObjectsFromArray:@[obj1,obj2,obj3,obj4,obj5]];
    
}

-(void)setupTableView{
    _tableView = [[XBTableView alloc]initWithFrame:[UIScreen mainScreen].bounds style:UITableViewStylePlain];
    [_tableView setDelegate:self];
    [_tableView setDataSource:self];
    [_tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    [self.view addSubview:_tableView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

-(UIScrollView *)scrollView{
    return _tableView;
}

#pragma mark - TableView Delegate

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    FunnyObject *funnyObject = [funnyItems objectAtIndex:indexPath.row];
    
    if (indexPath.row == 0) {
        [tableView registerNib:[UINib nibWithNibName:@"FunnyTableViewCell1" bundle:nil] forCellReuseIdentifier:XBFunnyCell1Identifier];
        
        FunnyTableViewCell1 *cell1 = [tableView dequeueReusableCellWithIdentifier:@"funnyCell1" forIndexPath:indexPath];
        
        if (!cell1) {
            cell1 = [[[NSBundle mainBundle]loadNibNamed:@"FunnyTableViewCell1" owner:self options:nil]objectAtIndex:0];
        }
        
        if (funnyObject.funnyType == TYPE1) {
            [cell1 setPicArray:funnyObject.images];
        }
        
        return cell1;
        
    }else{
        [tableView registerNib:[UINib nibWithNibName:@"FunnyTableViewCell2" bundle:nil] forCellReuseIdentifier:XBFunnyCell2Identifier];
        
        FunnyTableViewCell2 *cell2 = [tableView dequeueReusableCellWithIdentifier:@"funnyCell2" forIndexPath:indexPath];
        
        if (!cell2) {
            cell2 = [[[NSBundle mainBundle]loadNibNamed:@"FunnyTableViewCell2" owner:self options:nil]objectAtIndex:0];
        }
        
        if(funnyObject.funnyType == TYPE2){
            [cell2.ivPic setImage:[UIImage imageNamed:funnyObject.pic]];
            [cell2.lb1 setText:funnyObject.category];
            [cell2.lb2 setText:funnyObject.title];
            [cell2.lb3 setText:funnyObject.desc];
            [cell2.lb4 setText:[NSString stringWithFormat:@"%ld",funnyObject.hot]];
        }
        
        return cell2;
    }
}

-(FunnyTableViewCell1 *)basicCell1AtIndexPath:(NSIndexPath *)indexPath andIdentifier:(NSString *)identifier{
    FunnyTableViewCell1 *cell1 = [self.tableView dequeueReusableCellWithIdentifier:identifier forIndexPath:indexPath];
    [self configureBasicCell1:cell1 atIndexPath:indexPath];
    return cell1;
}

- (void)configureBasicCell1:(FunnyTableViewCell1 *)cell atIndexPath:(NSIndexPath *)indexPath {
    FunnyObject *funnyObject = [funnyItems objectAtIndex:indexPath.row];
    if (funnyObject.funnyType == TYPE1) {
        [cell setPicArray:funnyObject.images];
    }
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [funnyItems count];
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    CGFloat cellHeight = 0;
    
    if(indexPath.row == 0){
        cellHeight = [[[[NSBundle mainBundle]loadNibNamed:@"FunnyTableViewCell1" owner:self options:nil]objectAtIndex:0]frame].size.height;
    }else{
        cellHeight = [[[[NSBundle mainBundle]loadNibNamed:@"FunnyTableViewCell2" owner:self options:nil]objectAtIndex:0]frame].size.height;
    }
    
    return cellHeight;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    TouchDemoViewController *touchVC = [[TouchDemoViewController alloc]initWithNibName:@"TouchDemoViewController" bundle:nil];
    [self.navigationController pushViewController:touchVC animated:YES];
    
}

@end
