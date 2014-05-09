//
//  WaterFlowVC.m
//  WaterFlowDemo
//
//  Created by shenjx on 13-6-6.
//
//

#import "WaterFlowVC.h"
#import "TMPhotoQuiltViewCell.h"

const NSInteger kNumberOfCells = 1000;
@interface WaterFlowVC ()

@end

@implementation WaterFlowVC
@synthesize images = _images;
@synthesize tmQuiltView = _tmQuiltView;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization

        
    }
    return self;
}
-(void)dealloc
{
    [_images release];
    [super dealloc];
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor blackColor];
    
    _tmQuiltView = [[TMQuiltView alloc] init];
    _tmQuiltView.frame = CGRectMake(0, 0, 320, [[UIScreen mainScreen] bounds].size.height-20-44);
    _tmQuiltView.delegate = self;
    _tmQuiltView.dataSource = self;
 
    [self.view addSubview:_tmQuiltView];
    [_tmQuiltView reloadData];
    
    NSMutableArray *imageNames = [[NSMutableArray alloc] init];
    for (int i = 0; i< kNumberOfCells;i++ )
    {
        [imageNames addObject:[NSString stringWithFormat:@"%d.jpeg",i % 10 + 1]];
    }
    self.images = imageNames;
    [imageNames release];
    
    [_tmQuiltView reloadData];
}
#pragma mark -
#pragma mark 数据
- (UIImage *)imageAtIndexPath:(NSIndexPath *)indexPath
{


    return  [UIImage imageNamed:[self.images objectAtIndex:indexPath.row]];
}

#pragma mark -
#pragma mark TMQuiltViewDataSource
-(NSInteger)quiltViewNumberOfCells:(TMQuiltView *)TMQuiltView
{
    return [self.images count];
}

-(TMQuiltViewCell *)quiltView:(TMQuiltView *)quiltView cellAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *identifierStr = @"photoIdentifier";
    TMPhotoQuiltViewCell *cell = (TMPhotoQuiltViewCell *)[quiltView dequeueReusableCellWithReuseIdentifier:identifierStr];
    if (!cell)
    {
        cell = [[[TMPhotoQuiltViewCell alloc] initWithReuseIdentifier:identifierStr] autorelease];
    }
    cell.photoView.image = [self imageAtIndexPath:indexPath];
    cell.titleLabel.text = [NSString stringWithFormat:@"%d", indexPath.row + 1];
    return cell;
}
#pragma mark -
#pragma mark TMQuiltViewDelegate
//列数
- (NSInteger)quiltViewNumberOfColumns:(TMQuiltView *)quiltView
{
    return 2;
}
//单元高度
- (CGFloat)quiltView:(TMQuiltView *)quiltView heightForCellAtIndexPath:(NSIndexPath *)indexPath {
    
    float height = [self imageAtIndexPath:indexPath].size.height / [self quiltViewNumberOfColumns:quiltView];
    return height;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
