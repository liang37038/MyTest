//
//  XBHomeViewController.m
//  TenMinute
//
//  Created by sasukiliang on 15/5/21.
//  Copyright (c) 2015年 Liang. All rights reserved.
//

#import "XBHomeViewController.h"
#import "XBTouchTableViewController.h"

@interface XBHomeViewController ()<UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
{
    UICollectionView *homeCollectionView;
    
    NSInteger screenWidth;
    NSInteger screenHeight;
    
    NSMutableArray *categoryItems;
    
    CGFloat itemSpace;
    
    int count;
}

@end

static NSString *const CategoryCellIdentifier = @"categoryCell";

@implementation XBHomeViewController

-(instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
    
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        categoryItems = [NSMutableArray array];
        itemSpace = 10;
    }
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    screenWidth = [[UIScreen mainScreen]bounds].size.width;
    screenHeight = [[UIScreen mainScreen]bounds].size.height;
    [self setupData];
    [self setupCollectionView];
}

-(void)setupData{
    
    CategoryObject *c1 = [[CategoryObject alloc]init];
    [c1 setCategoryPic:@"cell_kexue.png"];
    [c1 setCategoryTitle:@"科学馆"];
    [c1 setCategoryDesc:@"探究人们未知的领域"];
    CategoryObject *c2 = [[CategoryObject alloc]init];
    [c2 setCategoryPic:@"cell_green.png"];
    [c2 setCategoryTitle:@"绿色一角"];
    [c2 setCategoryDesc:@"清新而又治愈"];
    CategoryObject *c3 = [[CategoryObject alloc]init];
    [c3 setCategoryPic:@"cell_cat.png"];
    [c3 setCategoryTitle:@"喵星球"];
    [c3 setCategoryDesc:@"前方高能需谨慎"];
    CategoryObject *c4 = [[CategoryObject alloc]init];
    [c4 setCategoryPic:@"cell_dog.png"];
    [c4 setCategoryTitle:@"汪星球"];
    [c4 setCategoryDesc:@"同样高能也需小心"];
    CategoryObject *c5 = [[CategoryObject alloc]init];
    [c5 setCategoryPic:@"cell_wenyi.png"];
    [c5 setCategoryTitle:@"文艺复兴"];
    [c5 setCategoryDesc:@"复古的艺术风"];
    CategoryObject *c6 = [[CategoryObject alloc]init];
    [c6 setCategoryPic:@"cell_black_white.png"];
    [c6 setCategoryTitle:@"黑白风"];
    [c6 setCategoryDesc:@"光与影的协奏曲"];
    CategoryObject *c7 = [[CategoryObject alloc]init];
    [c7 setCategoryPic:@"cell_food.png"];
    [c7 setCategoryTitle:@"食与色"];
    [c7 setCategoryDesc:@"舌尖上的美味"];
    CategoryObject *c8 = [[CategoryObject alloc]init];
    [c8 setCategoryPic:@"cell_film.png"];
    [c8 setCategoryTitle:@"电影角"];
    [c8 setCategoryDesc:@"欣赏每一帧的美"];
    
    [categoryItems addObject:c1];
    [categoryItems addObject:c2];
    [categoryItems addObject:c3];
    [categoryItems addObject:c4];
    [categoryItems addObject:c5];
    [categoryItems addObject:c6];
    [categoryItems addObject:c7];
    [categoryItems addObject:c8];
    
}

-(void)setupCollectionView{
    UICollectionViewFlowLayout *collectionLayout = [[UICollectionViewFlowLayout alloc]init];
    homeCollectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, screenWidth, screenHeight)collectionViewLayout:collectionLayout];
    [homeCollectionView registerNib:[UINib nibWithNibName:@"CatergoryItemCollectionViewCell" bundle:nil]forCellWithReuseIdentifier:CategoryCellIdentifier];
    [homeCollectionView setShowsHorizontalScrollIndicator:NO];
    [homeCollectionView setShowsVerticalScrollIndicator:YES];
    [homeCollectionView setBackgroundColor:[UIColor clearColor]];
    [homeCollectionView setDelegate:self];
    [homeCollectionView setDataSource:self];

    [self.view addSubview:homeCollectionView];
}

-(UIScrollView *)scrollView{
    
    return homeCollectionView;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    CategoryObject *cObject = [categoryItems objectAtIndex:indexPath.row];
    
    CatergoryItemCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:CategoryCellIdentifier forIndexPath:indexPath];
    
    if (!cell) {
        cell = [[[NSBundle mainBundle]loadNibNamed:@"CatergoryItemCollectionViewCell" owner:self options:nil]objectAtIndex:0];
    }
    
    [cell setBackgroundColor:[UIColor redColor]];
    [cell.cellType setText:[cObject categoryTitle]];
    [cell.cellDesc setText:[cObject categoryDesc]];
    UIImage *cellBG = [UIImage imageNamed:cObject.categoryPic];
    [cell.cellPic setImage:cellBG];
    
    return cell;
}

-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    
    UIEdgeInsets insets = UIEdgeInsetsMake(itemSpace, itemSpace, itemSpace, itemSpace);
    
    return insets;
}

-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    CGSize itemSize;
    
    CGFloat itemWidth = ([[UIScreen mainScreen]bounds].size.width - 4 * itemSpace) / 2;
    
    itemSize = CGSizeMake(itemWidth, itemWidth);
    
    //单数
    if((indexPath.row) % 2 != 0){
        count++;
        UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 32, 32)];
        [imageView setImage:[UIImage imageNamed:@"cross.png"]];
        [collectionView addSubview:imageView];
        [imageView setCenter:CGPointMake(itemWidth + itemSpace*2, count * (itemWidth +itemSpace )+ itemSpace/2)];
    }
    
    return itemSize;
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    XBTouchTableViewController *touchVC = [[XBTouchTableViewController alloc]initWithNibName:@"TouchDemoViewController" bundle:nil];
    
    NSMutableArray *funnyItems;
    
    if(indexPath.row == 2){
        [touchVC setMyTitle:@"喵星球"];
        [touchVC setMyDesc:@"前方高能需谨慎"];
        [touchVC setMyPic:@"cat.png"];
        
        FunnyObject *obj1 = [[FunnyObject alloc]init];
        [obj1 setFunnyType:TYPE2];
        [obj1 setPic:@"detail01_item_pic1.png"];
        [obj1 setCategory:@"喵星球"];
        [obj1 setTitle:@"猫每个动作表达的信息"];
        [obj1 setDesc:@"别以为它们在卖萌"];
        [obj1 setHot:4626];
        
        FunnyObject *obj2 = [[FunnyObject alloc]init];
        [obj2 setPic:@"detail01_item_pic2.png"];
        [obj2 setFunnyType:TYPE2];
        [obj2 setCategory:@"喵星球"];
        [obj2 setTitle:@"到底吃什么才能满足喵星人"];
        [obj2 setDesc:@"各种挑剔"];
        [obj2 setHot:6525];
        
        FunnyObject *obj3 = [[FunnyObject alloc]init];
        [obj3 setFunnyType:TYPE2];
        [obj3 setPic:@"detail01_item_pic3.png"];
        [obj3 setCategory:@"喵星球"];
        [obj3 setTitle:@"Banye的写真集"];
        [obj3 setDesc:@"各种 \"吃惊\" 的表情"];
        [obj3 setHot:6636];
        
        FunnyObject *obj4 = [[FunnyObject alloc]init];
        [obj4 setPic:@"detail01_item_pic4.png"];
        [obj4 setFunnyType:TYPE3];
        [obj4 setTitle:@"享受的时间"];
        [obj4 setUserPic:@"detail01_item_userhead1.png"];
        
        funnyItems = [NSMutableArray array];
        [funnyItems addObjectsFromArray:@[obj1,obj2,obj3,obj4]];
        
    }else if(indexPath.row == 3){
        [touchVC setMyTitle:@"汪星球"];
        [touchVC setMyDesc:@"同样高能也需小心"];
        [touchVC setMyPic:@"dog.png"];
        
        FunnyObject *obj1 = [[FunnyObject alloc]init];
        [obj1 setFunnyType:TYPE2];
        [obj1 setPic:@"detail02_item_pic1.png"];
        [obj1 setCategory:@"汪星球"];
        [obj1 setTitle:@"飞起来的汪星人"];
        [obj1 setDesc:@"萌萌的身躯让你不禁想抱着它"];
        [obj1 setHot:4523];
        
        FunnyObject *obj2 = [[FunnyObject alloc]init];
        [obj2 setPic:@"detail02_item_pic2.png"];
        [obj2 setFunnyType:TYPE2];
        [obj2 setCategory:@"汪星球"];
        [obj2 setTitle:@"卖萌高手---萨摩耶"];
        [obj2 setDesc:@"微笑天使"];
        [obj2 setHot:8911];
        
        FunnyObject *obj3 = [[FunnyObject alloc]init];
        [obj3 setFunnyType:TYPE2];
        [obj3 setPic:@"detail02_item_pic3.png"];
        [obj3 setCategory:@"汪星球"];
        [obj3 setTitle:@"忧郁的脸孔却有活泼的心"];
        [obj3 setDesc:@"让你更了解巴哥"];
        [obj3 setHot:4191];
        
        FunnyObject *obj4 = [[FunnyObject alloc]init];
        [obj4 setPic:@"detail02_item_pic4.png"];
        [obj4 setFunnyType:TYPE3];
        [obj4 setTitle:@"阿拉斯加辞典"];
        [obj4 setUserPic:@"detail02_item_userhead1.png"];
        
        
        funnyItems = [NSMutableArray array];
        [funnyItems addObjectsFromArray:@[obj1,obj2,obj3,obj4]];
    }
    
    [touchVC setFunnyItems:funnyItems];
    [self.navigationController pushViewController:touchVC animated:YES];
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return [categoryItems count];
}

@end