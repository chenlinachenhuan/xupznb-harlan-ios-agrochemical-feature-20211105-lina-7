//
//  policyBannerView.m
//  Agrochemical
//
//  Created by HarLan on 2021/9/16.
//
#define timerInterval 2.0
#define scrWidth (ScreenWidth-32)
#import "policyBannerView.h"

@implementation policyBannerView

-(id)initWithFrame:(CGRect)frame titleArr:(NSMutableArray*)titleArr{
    if (self=[super initWithFrame:frame]) {
//         self.titleArr = titleArr;
        self.bannerHeight = self.frame.size.height;
//        [self createHotBanner];
        self.clipsToBounds = YES;
        self.layer.cornerRadius = 5;

    }
    return self;
}
-(void)setTitleArr:(NSMutableArray *)titleArr{
    _titleArr = titleArr;
    [self createHotBanner];

    for (int i = 0; i < self.titleArr.count+1; i++) {
       
        UILabel * label = [[UILabel alloc] initWithFrame:CGRectMake(10, self.frame.size.height*i, scrWidth-20, self.bannerHeight)];
        label.userInteractionEnabled = YES;
        NSMutableAttributedString *string;
        if (i==self.titleArr.count) {
            string = [[NSMutableAttributedString alloc] initWithString:_titleArr[0] attributes:@{NSFontAttributeName: [UIFont fontWithName:@"PingFang SC" size: 10],NSForegroundColorAttributeName: [UIColor colorWithRed:51/255.0 green:51/255.0 blue:51/255.0 alpha:1.0]}];
        }else{
            
            string = [[NSMutableAttributedString alloc] initWithString:_titleArr[i] attributes:@{NSFontAttributeName: [UIFont fontWithName:@"PingFang SC" size: 10],NSForegroundColorAttributeName: [UIColor colorWithRed:51/255.0 green:51/255.0 blue:51/255.0 alpha:1.0]}];
        }
        
        label.attributedText = string;
        label.tag = 200+i;
        [self.bannerScrollView addSubview:label];
        
        UITapGestureRecognizer * tapGR = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(clickPlicyMethod:)];
        tapGR.view.tag = label.tag;
        [label addGestureRecognizer:tapGR];
        
        UIImageView * imageV = [[UIImageView alloc] initWithFrame:CGRectMake(self.frame.size.width-6-CGRectGetHeight(self.frame)*0.45454545*0.6, CGRectGetHeight(self.frame)*0.2727273+self.bannerHeight*i, CGRectGetHeight(self.frame)*0.45454545*0.6, CGRectGetHeight(self.frame)*0.45454545)];
        imageV.image = [UIImage imageNamed:@"????????????"];
        [self.bannerScrollView addSubview:imageV];
        
    }
 
}
-(void)createHotBanner{
    
    self.bannerScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, scrWidth, self.bannerHeight)];
    self.bannerScrollView.delegate = self;
    self.bannerScrollView.scrollEnabled = NO;
    self.bannerScrollView.backgroundColor = colorH(255, 221, 221);
    self.bannerScrollView.contentSize = CGSizeMake(0, (self.titleArr.count+1)*self.bannerHeight);
    self.bannerScrollView.showsHorizontalScrollIndicator = NO;
    self.bannerScrollView.pagingEnabled = YES;
//    self.bannerScrollView.backgroundColor = [UIColor redColor];
    [self addSubview:self.bannerScrollView];
     
     
    
    self.bannerpageC = [[UIPageControl alloc] initWithFrame:CGRectMake(0, self.bannerScrollView.frame.size.height-16, scrWidth, 2)];
    self.bannerpageC.currentPage = 0;
    self.bannerpageC.numberOfPages = self.titleArr.count;
    self.bannerpageC.pageIndicatorTintColor = [UIColor clearColor];
//    self.bannerpageC.pageIndicatorTintColor =colorH(218, 221, 225);
    self.bannerpageC.currentPageIndicatorTintColor = [UIColor clearColor];
    self.bannerpageC.hidden=YES;
    [self addSubview:self.bannerpageC];
//
    //???????????????
    [self creatTimer];
 }
-(void)clickPlicyMethod:(UITapGestureRecognizer*)recognizer{
    NSInteger clickTag = recognizer.view.tag;
    [self.delegate policyViewDidClick: clickTag];
}
-(void)creatTimer {
    self.bannerTimer = [NSTimer scheduledTimerWithTimeInterval:timerInterval
                                              target:self
                                            selector:@selector(changeScrollOffset)
                                            userInfo:nil
                                             repeats:YES];
    // ??????timer ????????????
    NSRunLoop *mainLoop = [NSRunLoop mainRunLoop];
    [mainLoop addTimer:self.bannerTimer forMode:NSRunLoopCommonModes];
}
- (void)changeScrollOffset {
    NSLog(@"%ld",(long)self.bannerpageC.currentPage);
    [self.bannerScrollView setContentOffset:CGPointMake(0,(self.bannerpageC.currentPage+1)*self.bannerHeight) animated:YES];
//    [self.bannerScrollView setContentOffset:CGPointMake((self.bannerpageC.currentPage+1) * scrWidth, 0) animated:YES];

}
- (void)stopTimer
{
    [self.bannerTimer invalidate];
    self.bannerTimer = nil;
}
 
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    CGPoint point = scrollView.contentOffset;
    BOOL top = self.oldScrollOffset < point.y;
    self.oldScrollOffset = point.y;
    // ??????pageControl????????? ??????
    if (point.y > _bannerHeight*(self.titleArr.count-1)+self.bannerHeight*0.5 && !self.bannerTimer){
        self.bannerpageC.currentPage = 0;
    }else if (point.y >self.bannerHeight*(_titleArr.count-1) && self.bannerTimer && top){
        self.bannerpageC.currentPage = 0;
    }else{
//        NSLog(@"%f",(point.y+self.bannerHeight*0.5)/ self.bannerHeight);
        self.bannerpageC.currentPage = (point.y+self.bannerHeight*0.5)/ self.bannerHeight;
    }
    //?????????????????????1?????????????????????scrollView contentSize???????????? 2???????????????????????????
//    NSLog(@"%f==%f",point.y,self.bannerHeight*self.titleArr.count);
    if (point.y >= self.bannerHeight*_titleArr.count) {
        [scrollView setContentOffset:CGPointMake(0, 0) animated:NO];
    }else if (point.y < 0) {
        [scrollView setContentOffset:CGPointMake(point.y+self.bannerHeight*(self.titleArr.count), 0) animated:NO];
    }
}
/**
 ???????????????????????????, ?????????????????????
 */
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    [self stopTimer];
 }
/**
 ???????????????????????????, ???????????????????????????
 */
- (void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset {
    [self creatTimer];
}
@end
