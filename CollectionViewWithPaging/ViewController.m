//
//  ViewController.m
//  CollectionViewWithPaging
//
//  Created by ronakj on 7/1/16.
//  Copyright © 2016 com.ronak.zaptech. All rights reserved.
//

#import "ViewController.h"
#import "ImageCollectionViewCell.h"

@interface ViewController ()<UICollectionViewDelegate,UICollectionViewDataSource>
{
    NSMutableArray *imgArray,*titleArray,*descArray;
    UIPageControl *pageControl;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    imgArray=[[NSMutableArray alloc]init];
    titleArray=[[NSMutableArray alloc]init];
    descArray=[[NSMutableArray alloc]init];
    
    [imgArray addObject:@"1.png"];
    [imgArray addObject:@"2.png"];
    [imgArray addObject:@"3.jpg"];
    [imgArray addObject:@"4.jpg"];
    
    [titleArray addObject:@"Hello"];
    [titleArray addObject:@"Hello1"];
    [titleArray addObject:@"Hello2"];
    [titleArray addObject:@"Hello3"];
    
    [descArray addObject:@"fjksdjs"];
    [descArray addObject:@"fjksdjs"];
    [descArray addObject:@"fjksdjs"];
    [descArray addObject:@"fjksdjs"];
    
    _collectionView.delegate = self;
    _collectionView.dataSource = self;
    _collectionView.pagingEnabled=true;
    
    
//    _flowLayout = [[UICollectionViewFlowLayout alloc] init];
//    [_flowLayout setItemSize:CGSizeMake(320,159)];
//    [_flowLayout setScrollDirection:UICollectionViewScrollDirectionVertical];
//    [_collectionView setBounces:NO];
//    [_collectionView setCollectionViewLayout:_flowLayout];
//    [_collectionView setBackgroundColor:[UIColor clearColor]];
    
    pageControl=[[UIPageControl alloc]init];
    pageControl.frame=CGRectMake(self.collectionView.frame.size.width-65,self.collectionView.frame.size.height/2+70,70,37);
    pageControl.numberOfPages=4;
    pageControl.currentPage=0;
    pageControl.pageIndicatorTintColor = [UIColor blackColor];
    pageControl.currentPageIndicatorTintColor = [UIColor yellowColor];
    pageControl.transform=CGAffineTransformMakeRotation(M_PI/2);
    [self.view addSubview:pageControl];
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    return imgArray.count;
    
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    
    static NSString *CellIdentifier = @"imageCell";
    
    
    ImageCollectionViewCell *cell;
    
    
        cell = [self.collectionView dequeueReusableCellWithReuseIdentifier:CellIdentifier forIndexPath:indexPath];
        
        cell.imgView.image=[UIImage imageNamed:[imgArray objectAtIndex:indexPath.row]];
    
        
        cell.lblTitle.text=[titleArray objectAtIndex:indexPath.row];
        cell.lblDesc.text=[descArray objectAtIndex:indexPath.row];

    CATransform3D rotation = CATransform3DMakeRotation( (90.0*M_PI)/180, .0, 0.5, 0.5);
    cell.contentView.alpha = 0.8;
    cell.contentView.layer.transform = rotation;
    cell.contentView.layer.anchorPoint = CGPointMake(0, 0.5);
    
    [UIView animateWithDuration:.9
                     animations:^{
                         cell.contentView.layer.transform = CATransform3DIdentity;
                         cell.contentView.alpha = 1;
                         cell.contentView.layer.shadowOffset = CGSizeMake(0, 0);
                     } completion:^(BOOL finished) {
                     }];
    
    return cell;
    

}
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    CGFloat pageWidth = _collectionView.frame.size.height;
    float currentPage = _collectionView.contentOffset.y / pageWidth;
    
    if (0.0f != fmodf(currentPage, 1.0f))
    {
        pageControl.currentPage = currentPage + 1;
    }
    else
    {
        pageControl.currentPage = currentPage;
    }
    NSLog(@"finishPage: %ld", pageControl.currentPage);
}


@end
