//
//  ImageCollectionViewCell.h
//  CollectionViewWithPaging
//
//  Created by ronakj on 7/1/16.
//  Copyright © 2016 com.ronak.zaptech. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ImageCollectionViewCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIImageView *imgView;
@property (weak, nonatomic) IBOutlet UILabel *lblTitle;
@property (weak, nonatomic) IBOutlet UILabel *lblDesc;

@property (weak, nonatomic) IBOutlet UIButton *btnDegital;
@end
