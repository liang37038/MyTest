//
//  XBTouchTableViewController.m
//  TenMinute
//
//  Created by sasukiliang on 15/6/2.
//  Copyright (c) 2015年 Liang. All rights reserved.
//

#import "XBTouchTableViewController.h"

static NSString * const XBFunnyCell2Identifier = @"funnyCell2";
static NSString * const XBFunnyCell3Identifier = @"funnyCell3";

@interface XBTouchTableViewController ()

@end

@implementation XBTouchTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

-(UIScrollView *)scrollView{
    
    XBTableView *xbTabelView = [[XBTableView alloc]initWithFrame:[[UIScreen mainScreen] bounds]];
    [xbTabelView setDelegate:self];
    [xbTabelView setDataSource:self];
    [xbTabelView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    xbTabelView.tableFooterView = [[UIView alloc]init];
    
    return xbTabelView;
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    FunnyObject *funnyObject = [self.funnyItems objectAtIndex:indexPath.row];
    
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
    return [self.funnyItems count];
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    FunnyObject *funnyObject = [self.funnyItems objectAtIndex:indexPath.row];
    
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

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *header = [[UIView alloc]initWithFrame:CGRectMake(0, 0, tableView.frame.size.width, 200)];
    [header setBackgroundColor:[UIColor redColor]];
    return header;
}

@end
