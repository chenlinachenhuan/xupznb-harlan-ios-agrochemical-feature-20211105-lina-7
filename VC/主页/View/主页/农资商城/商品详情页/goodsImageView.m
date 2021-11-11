//
//  goodsImageView.m
//  Agrochemical
//
//  Created by HarLan on 2021/10/13.
//

#import "goodsImageView.h"

@implementation goodsImageView
-(id)initWithFrame:(CGRect)frame withImageArr:(NSMutableArray*)imageArr{
    if (self == [super initWithFrame:frame]) {
        self.imgArr = imageArr;
        for (int i=0;i<imageArr.count;i++) {
            UIImageView * imageV = [[UIImageView alloc] initWithFrame:CGRectMake((frame.size.height+4)*i, 0,frame.size.height, frame.size.height)];
            imageV.clipsToBounds = YES;
            imageV.layer.cornerRadius = 5;
            imageV.image = imageArr[i];
            imageV.tag = i;
            imageV.userInteractionEnabled = YES;
            [self addSubview:imageV];
            UITapGestureRecognizer * tapGR = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(showScorllViewMethod:)];
            tapGR.view.tag = imageV.tag;
            [imageV addGestureRecognizer:tapGR];
 
            if (i==2) {
                UIView * view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.height, self.frame.size.height)];
                view.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.3];
                [imageV addSubview:view];
                
                UILabel * label1 = [[UILabel alloc] initWithFrame:CGRectMake(imageV.frame.size.width/2-[commonMethod widthAuto:[NSString stringWithFormat:@"%lu图",(unsigned long)imageArr.count] fontSize:18 contentheight:16]/2, CGRectGetHeight(imageV.frame)/2-5-16, [commonMethod widthAuto:[NSString stringWithFormat:@"%lu图",(unsigned long)imageArr.count] fontSize:18 contentheight:16], 16)];
                label1.text =[NSString stringWithFormat:@"%lu图",(unsigned long)imageArr.count];
                label1.font = [UIFont fontWithName:@"PingFang SC Medium" size:18];
                label1.textColor = [UIColor whiteColor];
                [view addSubview:label1];
                
                UILabel * label2 = [[UILabel alloc] initWithFrame:CGRectMake(imageV.frame.size.width/2-25, CGRectGetMaxY(label1.frame)+10, 50, 11.5)];
                label2.text =@"查看全部";
                label2.font = FontSize(12);
                label2.textColor = [UIColor whiteColor];
                [view addSubview:label2];
                break;
            }
            
        }
    }
    return self;
}
-(void)creatImageView{
    UIScrollView *imageScroll = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight+TopHeight+49)];
    imageScroll.backgroundColor = [UIColor blackColor];
    imageScroll.contentSize = CGSizeMake(ScreenWidth * _imgArr.count, ScreenHeight);
    imageScroll.pagingEnabled = YES;
    imageScroll.bounces = NO;
    imageScroll.alpha = 0;
    imageScroll.delegate = self;
    self.imageScroll = imageScroll;
    imageScroll.userInteractionEnabled = YES;
    [[UIApplication sharedApplication].keyWindow addSubview:imageScroll];
    for (int i = 0; i < self.imgArr.count; i++) {
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake( ScreenWidth * i, [UIScreen mainScreen].bounds.size.height/2-[UIScreen mainScreen].bounds.size.height*0.558*0.5, ScreenWidth, [UIScreen mainScreen].bounds.size.height*0.558)];
        imageView.image = self.imgArr[i];
        imageView.userInteractionEnabled = YES;
        [imageScroll addSubview:imageView];
    }
    UIPageControl *pageControl = [[UIPageControl alloc] init];
    pageControl.frame = CGRectMake(0, ScreenHeight - 50, ScreenWidth, 20);
    pageControl.numberOfPages = self.imgArr.count;
    pageControl.currentPage = 0;
    pageControl.hidden = YES;
//    pageControl.pageIndicatorTintColor =[UIColor redColor];
//    pageControl.currentPageIndicatorTintColor = [UIColor whiteColor];
    self.pageControl = pageControl;
    [[UIApplication sharedApplication].keyWindow addSubview:pageControl];
    
    UITapGestureRecognizer *scrTap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(scrTap:)];
    scrTap.numberOfTapsRequired = 1;
    scrTap.numberOfTouchesRequired = 1;
    [imageScroll addGestureRecognizer:scrTap];
    
    [self createTopView];
}
-(void)createTopView{
    self.backButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.backButton.frame = CGRectMake(16.5, TopHeight-20, 14, 14);
    [self.backButton setBackgroundImage:[UIImage imageNamed:@"关闭"] forState:UIControlStateNormal];
    [self.backButton addTarget:self action:@selector(scrTap:) forControlEvents:UIControlEventTouchUpInside];
    [[UIApplication sharedApplication].keyWindow addSubview:self.backButton];
    
    
}
-(void)createImageVTapGesture:(UIImageView*)imageV{
    NSLog(@"%ld",(long)imageV.tag);
    UITapGestureRecognizer * Recognizer = [[UITapGestureRecognizer alloc] init];
    Recognizer.view.tag = imageV.tag;
    [Recognizer addTarget:self action:@selector(showScorllViewMethod:)];
    [imageV addGestureRecognizer:Recognizer];
}
-(void)showScorllViewMethod:(UITapGestureRecognizer*)Recognizer{
 
    [self creatImageView];
    self.imageScroll.contentOffset  = CGPointMake((Recognizer.view.tag)*ScreenWidth, 0);

    [UIView animateWithDuration:0.5 animations:^{
        self.imageScroll.alpha = 1;
         self.pageControl.currentPage =Recognizer.view.tag;
        if (self.imgArr.count==1) {
            return;
        }
        self->_pageControl.hidden = NO;

    }];
 
    
}
- (void)scrTap:(UITapGestureRecognizer *)tap{
    [UIView animateWithDuration:0.5 animations:^{
        self.imageScroll.alpha = 0;
        self->_pageControl.hidden = YES;
        [self.backButton removeFromSuperview];
    }];
}
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    CGFloat offSetX = scrollView.contentOffset.x;
     int number = offSetX / ScreenWidth;
    _pageControl.currentPage = number;
}
@end
