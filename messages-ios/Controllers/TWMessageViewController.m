//
//  TWMessageViewController.m
//  messages-ios
//
//  Created by Terry Worona on 8/15/13.
//  Copyright (c) 2013 Terry Worona. All rights reserved.
//

#import "TWMessageViewController.h"

// Layouts
#import "TWSpringyFlowLayout.h"

// Views
#import "TWMessageViewCell.h"

// Strings
NSString * const kTWMessageViewControllerCellIdentifier = @"kTWMessageViewControllerCellIdentifier";

// Numerics
//CGFloat const kTWMessageViewControllerCellPadding = 10;
CGFloat const kTWMessageViewControllerCellHeight = 50;

@interface TWMessageViewController () <UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout>{
    NSArray *contentArr;
    NSMutableSet *cellSet;
    NSInteger time;
    
    NSIndexPath *greenIndexPath;
}

@end

@implementation TWMessageViewController

#pragma mark - Alloc/Init

- (id)init
{
	self = [super initWithCollectionViewLayout: [[TWSpringyFlowLayout alloc] init]];
	if (self)
	{
		contentArr = @[@"Greece became the epicenter of Europe's debt crisis after Wall Street imploded in 2008. With global financial markets still reeling, Greece announced in October 2009 that it had been understating its deficit figures for years, raising alarms about the soundness of Greek finances.",@"ATHENS — Only a day after grim predictions of financial and social collapse in Greece, a scramble appeared underway to work out the details of a new bailout package to bring the country back from the brink of falling out of the euro. \n雅典——就在人们做出悲观预测称希腊会出现金融与社会崩溃的一天之后，各方似乎正在努力制订新救助计划的细节，希望将希腊从离开欧元区的悬崖边拉回。",@"As details of the new offer emerged, it appeared the Prime Minister Alexis Tsipras was capitulating to demands on harsh austerity terms that he urged his countrymen to reject in the referendum last Sunday, like tax increases and various measures to cut the costs of pensions. /n 随着新救助计划的细节浮出水面，希腊总理亚历克西斯· 齐普拉斯(Alexis Tsipras)看起来对严苛的紧缩条款做出了让步。他曾力劝民众在上周日举行的公投中拒绝接受这些条款，比如增税，以及减少养老金支出的种种举措。",@"Mr. Tsipras went before his cabinet to seek a commitment for reform measures in the new plan that, presumably, went beyond what had been offered previously. He will seek the approval of Parliament on Friday. Much may hinge on his ability to persuade the more radical elements of his Syriza party to support a package that in essence was anathema to many of them last week./n齐普拉斯请求内阁承诺在新提议中加入改革的内容。这些措施可能会超越之前的提议。他将于周五寻求议会的批准。这在很大程度上可能取决于齐普拉斯有没有能力说服他领导的左翼联盟(Syriza)激进派支持新救助计划，其中很多人上周对类似的计划根本就是深恶痛疾。",@"International Monetary Fund",@"Mr. Tsipras and his team spent the day in meetings as they put together a proposal and sought to ensure domestic political support for it.",@"默克尔后来在萨拉热窝讲话时重申了反对直接减计希腊债务的立场，不过她在降低利率或延长支付期限等帮助希腊处理债务的措施上有所松动。",@"Ms. Merkel flew Monday to Paris to join President François Hollande of France to discuss what to do next with Greece.",@"Germany has taken an increasingly hard line toward Greece since the nation voted no on Sunday to an earlier bailout program in a referendum that sent political shivers across Europe."];
        cellSet = [[NSMutableSet alloc] init];
        
        
	}
	return self;
}

#pragma mark - View Lifecycle

- (void)loadView
{
	[super loadView];
	
	self.navigationItem.title = @"Messages";
	
	// Background
	UIImageView *backgroundImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"messages_bg_2.png"]];
	backgroundImageView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
	[self.view insertSubview:backgroundImageView belowSubview:self.collectionView];
	
	// Parallax effect
	UIInterpolatingMotionEffect *interpolationHorizontal = [[UIInterpolatingMotionEffect alloc]initWithKeyPath:@"center.x" type:UIInterpolatingMotionEffectTypeTiltAlongHorizontalAxis];
    interpolationHorizontal.minimumRelativeValue = @-20.0;
    interpolationHorizontal.maximumRelativeValue = @20.0;
	
    UIInterpolatingMotionEffect *interpolationVertical = [[UIInterpolatingMotionEffect alloc]initWithKeyPath:@"center.y" type:UIInterpolatingMotionEffectTypeTiltAlongVerticalAxis];
    interpolationVertical.minimumRelativeValue = @-20.0;
    interpolationVertical.maximumRelativeValue = @20.0;
	
    [backgroundImageView addMotionEffect:interpolationHorizontal];
    [backgroundImageView addMotionEffect:interpolationVertical];

	// Configurte collection view
	self.collectionView.backgroundColor = [UIColor clearColor];
	[self.collectionView registerClass:[TWMessageViewCell class] forCellWithReuseIdentifier:kTWMessageViewControllerCellIdentifier];
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    [self move];
    
}

-(void)move{
    __weak TWMessageViewController *weak = self;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [weak timeMove];
        [weak move];
    });
}


-(void)timeMove{
    greenIndexPath = [NSIndexPath indexPathForItem:0 inSection:time];
    UICollectionViewCell *cell = [self.collectionView cellForItemAtIndexPath:greenIndexPath];
    cell.contentView.backgroundColor = [UIColor greenColor];
    [self.collectionView scrollToItemAtIndexPath:greenIndexPath atScrollPosition:UICollectionViewScrollPositionCenteredVertically animated:NO];
    time++;
    if(time <= [contentArr count] - 1){
        
    }else {
        time = 0;
    }
    
}




#pragma mark - UICollectionView DataSource & Delegate methods

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return [contentArr count];
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 1;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    TWMessageViewCell *cell = (TWMessageViewCell *)[collectionView dequeueReusableCellWithReuseIdentifier:kTWMessageViewControllerCellIdentifier forIndexPath:indexPath];
    [cell setContent:[contentArr objectAtIndex:indexPath.section]];
    [cellSet addObject:cell];
    if(greenIndexPath==nil || [greenIndexPath compare:indexPath]!=NSOrderedSame){
        cell.contentView.backgroundColor = [UIColor colorWithWhite:1.0 alpha:0.5];
    }
	return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *content = [contentArr objectAtIndex:indexPath.section];
    CGRect rect = [NRBubbleFrame getFrameWithEnglishContent:content];
    return CGSizeMake(self.view.bounds.size.width - (kTWMessageViewControllerCellPadding*2), rect.size.height + rect.origin.y * 2);
}

@end
