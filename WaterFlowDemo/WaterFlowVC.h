//
//  WaterFlowVC.h
//  WaterFlowDemo
//
//  Created by shenjx on 13-6-6.
//
//

#import <UIKit/UIKit.h>
#import "TMQuiltView.h"
@interface WaterFlowVC : UIViewController<TMQuiltViewDataSource,TMQuiltViewDelegate>
{
    TMQuiltView *_tmQuiltView;
    NSMutableArray *_images;
}
@property (nonatomic,retain)TMQuiltView *tmQuiltView;
@property (nonatomic,retain)NSMutableArray *images;
@end
