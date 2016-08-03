//
//  ViewController.h
//  CollectionViewWithPaging
//
//  Created by ronakj on 7/1/16.
//  Copyright © 2016 com.ronak.zaptech. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout,UIScrollViewDelegate>

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

@property (strong, nonatomic) IBOutlet UICollectionViewFlowLayout *flowLayout;
@end

