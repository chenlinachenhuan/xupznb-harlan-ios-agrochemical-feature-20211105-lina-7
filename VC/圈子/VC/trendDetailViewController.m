//
//  trendDetailViewController.m
//  Agrochemical
//
//  Created by HarLan on 2021/9/24.
//

#import "trendDetailViewController.h"
#import "trendCollectionView.h"
#import "trendCollectionViewCell.h"
#import "trendDetailBodyView.h"
#import "trendImageView.h"
#import "trendDetailToolBarView.h"
#import "trendDetailCommentTableView.h"
#import "trendCommentDataModel.h"
#import "trendCommentModel.h"
#import "commentTwoTableViewCell.h"
#import "trendCommentTwoFrameModel.h"
#import "trendInputView.h"
#import "trendDetailCommentParser.h"
#import "trendCommentCreateParser.h"
#import "trendCommentChildListParser.h"
@interface trendDetailViewController ()<UIGestureRecognizerDelegate,UIScrollViewDelegate,UITextFieldDelegate,trendDetailCommentParserDelegate,trendCommentCreateParserDelegate,trendProtocolDelegate,trendCommentChildListParserDelegate,trendDeleteParserDelegate>
@property(nonatomic,retain) bigButton * backButton;
@property(nonatomic,retain)UIScrollView *homeScrollView;
@property(nonatomic,retain)trendCollectionView *cellView;
@property(nonatomic,retain)NSMutableArray * imageArr;
@property(nonatomic,retain)NSMutableArray * commentModelArr;
@property(nonatomic,retain)NSMutableArray * cellHeightArr;
@property (nonatomic)CGRect inputAreaDefaultRect;

@property(nonatomic,retain)trendDetailBodyView*bodyView;
@property(nonatomic,retain)trendDetailDataModel * dataModel;
@property(nonatomic,retain)trendDetailToolBarView*toolBarView;
@property(nonatomic,retain)trendDetailCommentTableView*commentTableView;
@property(nonatomic,retain)trendCommentDataModel * commentModel;
@property(nonatomic,retain)trendInputView * inputView;
@property(nonatomic,assign)int32_t pageSize;
@property(nonatomic,assign)int32_t total;

@property(nonatomic,assign)BOOL loadMore;
@end

@implementation trendDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor =  [UIColor colorWithRed:248/255.0 green:250/255.0 blue:251/255.0 alpha:1.0];
    self.navigationController.navigationBar.barTintColor = [UIColor whiteColor];
    self.navigationController.navigationBarHidden = YES;

    [self initMethod];
    [self createNaviView];
    [self createScrollView];
    [self createInputView];
    [self createCellView];

    [self requestCommentList:10];
}
-(void)initMethod{
    self.commentModelArr = [[NSMutableArray alloc] init];
    self.cellHeightArr = [[NSMutableArray alloc] init];
    
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(reloadFrameMethod:) name:@"reloadFrame" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
 
    trendDetailDataModel *momentFrame = [[trendDetailDataModel alloc] init];
    momentFrame.moment = _model;
    self.dataModel = momentFrame;//拿到详情页所有的数据
    self.pageSize=10;
}
-(void)requestCommentList:(int32_t)pageSize{
   
    [[ChrysanthemumIndexView sharedMasterUser] show];
    trendDetailCommentParser * parser =[[trendDetailCommentParser alloc] init];
    parser.myDelegate = self;
    [parser requestTrendDetailCommentId:[self.model.myId intValue] orderStatus:0 pageNum:1 pageSize:pageSize parentId:0 pubTimeStatus:0 showStatus:1];
}
-(void)successTrendCommentListArr:(NSMutableArray *)commentArr withTotal:(nonnull NSString *)total{
    
    [[ChrysanthemumIndexView sharedMasterUser] remove];
    self.total = [total intValue];
    [self.commentModelArr removeAllObjects];
    [self.cellHeightArr removeAllObjects];
    for (trendCommentModel * model in commentArr)/*拿到详情页评论数组*/ {
        trendCommentDataModel * commentModel = [[trendCommentDataModel alloc] init];
        commentModel.model = model;
//        commentModel.commentTwoArr = model.commentArr;
        [self.cellHeightArr addObject:[NSNumber numberWithFloat:[commentModel setCommentFrames:model]]];
        [self.commentModelArr addObject:commentModel];
        NSMutableArray*twoArr = [[NSMutableArray alloc] init];
        for (trendTwoCommentModel*tmodel in model.commentArr) {
             trendCommentTwoFrameModel*fmodel = [[trendCommentTwoFrameModel alloc] init];
            fmodel.model = tmodel;
            [twoArr addObject:fmodel];
            commentModel.commentTwoArr =twoArr;
        }
    }
     
    
    self.commentTableView.commentArr = self.commentModelArr;
//    CGFloat height =0;
//    for (NSNumber*number in self.cellHeightArr) {
//        height = height+[number floatValue];
//    }
//    self.commentTableView.frame =CGRectMake(0, CGRectGetMaxY(self.toolBarView.frame)+14, ScreenWidth, height);
//    [self.commentTableView commentArr:_commentModelArr cell:^commentTwoTableViewCell * _Nullable(NSIndexPath * _Nonnull indexPath) {
//        commentTwoTableViewCell* cell = [[commentTwoTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
//        return cell;
//    } selectedCell:^(NSIndexPath * _Nonnull indexPath) {
//
//    }];
//    [self.commentTableView reloadData];
//    [self.commentTableView reloadTableViewHeight];
//    [self reloadScrollViewFrame:CGRectGetMaxY(self.commentTableView.frame)];
    self.loadMore = NO;
}
-(void)failedMethod:(NSString *)message{
    [[ChrysanthemumIndexView sharedMasterUser] remove];
    FBUtilShowTipView(self.view,message);
}
-(void)createNaviView{
    UIView * bgV = [[UIView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, TopHeight)];
    bgV.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:bgV];
    bigButton *backButton = [bigButton buttonWithType:UIButtonTypeCustom];
    backButton.frame = CGRectMake(10,statusBarHeight, 44, 44);
    [backButton addTarget:self action:@selector(backButtonMethod) forControlEvents:UIControlEventTouchUpInside];
//    [self.backButton setBackgroundColor:[UIColor orangeColor]];
    [backButton setImage:[UIImage imageNamed:@"返回"] forState:UIControlStateNormal];
    [bgV addSubview:backButton];
   
    UILabel * title = [[UILabel alloc] initWithFrame:CGRectMake(0, statusBarHeight, ScreenWidth,navBarHeight)];
    title.text = @"文章详情";
//    title.backgroundColor = [UIColor redColor];
    title.font = [UIFont fontWithName:@"PingFang SC" size: 17];
    title.numberOfLines = 0;
    title.textAlignment = NSTextAlignmentCenter;
    [bgV addSubview:title];
    UIButton * rsearchButton = [UIButton buttonWithType:UIButtonTypeCustom];
    rsearchButton.frame = CGRectMake(ScreenWidth-16-17, title.center.y-8.5, 17, 17);
    [rsearchButton addTarget:self action:@selector(forwordButtonMethod) forControlEvents:UIControlEventTouchUpInside];
    [rsearchButton setImage:[UIImage imageNamed:@"转发"] forState:UIControlStateNormal];
    [bgV addSubview:rsearchButton];
    self.navigationController.interactivePopGestureRecognizer.delegate = self;

}
-(void)backButtonMethod{
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)viewDidAppear:(BOOL)animated {
 [super viewDidAppear:animated];

 // 是否允许右滑返回
 [self.navigationController.interactivePopGestureRecognizer setEnabled:self.backButton];
}
-(void)publishButtonMethod{
    
}
-(void)createScrollView{
    self.homeScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, TopHeight+18, ScreenWidth, ScreenHeight)];
    self.homeScrollView.delegate = self;
    self.homeScrollView.contentSize = CGSizeMake(ScreenWidth, 1000);
    self.homeScrollView.showsVerticalScrollIndicator = NO;
    self.homeScrollView.userInteractionEnabled = YES;
    self.homeScrollView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.homeScrollView];
    UITapGestureRecognizer * recg = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hideKeyBoard)];
    [self.homeScrollView addGestureRecognizer:recg];

}
-(void)createCellView{
    if (!self.bodyView) {
        self.bodyView = [[trendDetailBodyView alloc] init];
    }
    [self.homeScrollView addSubview: self.bodyView];
    self.bodyView.frame = _dataModel.momentsBodyFrame;
    self.bodyView.myDelegate = self;
    self.bodyView.momentFrames = _dataModel;
    
//    trendImageView * trendImgV = [[trendImageView alloc] init];
//    [self.homeScrollView addSubview:trendImgV];
//    [self reloadScrollViewFrame:CGRectGetMaxY(self.dataModel.momentsBodyFrame) ];
    
//    if (self.dataModel.moment.imageArr.count!=0) {
//        trendImgV.hidden = NO;
//        trendImgV.frame = self.dataModel.bodyPhotoFrame;
//        [trendImgV imageFrame:trendImgV.frame  imageArr:self.dataModel.moment.imageArr];
//    }else{
//        trendImgV.hidden = YES;
//    }
    [self reloadScrollViewFrame:CGRectGetMaxY(self.dataModel.momentsBodyFrame)];
    if (!self.toolBarView) {
        self.toolBarView = [[trendDetailToolBarView alloc] init];
    }
     self.toolBarView.momentFrames = _dataModel;
    self.toolBarView.frame = _dataModel.momentsToolBarFrame;
    [self.homeScrollView addSubview:self.toolBarView];
    [self reloadScrollViewFrame:CGRectGetMaxY(self.dataModel.momentsToolBarFrame) ];

    
    if (!self.commentTableView) {
        self.commentTableView  = [[trendDetailCommentTableView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(self.toolBarView.frame), ScreenWidth, 0) style:UITableViewStylePlain];
    }
    self.commentTableView.commentDelegate =self;
     
//    CGFloat height =0;
//    for (NSNumber*number in self.cellHeightArr) {
//        height = height+[number floatValue];
//    }
//    self.commentTableView.frame =CGRectMake(0, CGRectGetMaxY(self.toolBarView.frame)+14, ScreenWidth, height);
//    [self.commentTableView commentArr:_commentModelArr cell:^commentTwoTableViewCell * _Nullable(NSIndexPath * _Nonnull indexPath) {
//        commentTwoTableViewCell* cell = [[commentTwoTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
//        cell.backgroundColor = SelectColor;
//        return cell;
//    } selectedCell:^(NSIndexPath * _Nonnull indexPath) {
//        
//    }];
//    self.commentTableView.backgroundColor = [UIColor orangeColor];
    [self.homeScrollView addSubview:self.commentTableView];
    [self reloadScrollViewFrame:CGRectGetMaxY(self.commentTableView.frame) ];

}
-(void)didselectcommentButton:(NSInteger)tag{
    [self.inputView.inputField becomeFirstResponder];
    self.inputView.inputField.tag = tag;
 }
-(void)deleteButtonClick:(trendModel *)model{
    [[ChrysanthemumIndexView sharedMasterUser]show];
    trendDeleteParser * parser = [[trendDeleteParser alloc]init];
    parser.myDelegate = self;
    [parser requestWithMyId:[model.myId intValue]];
}
-(void)successDeleteTrend{
    [[ChrysanthemumIndexView sharedMasterUser]remove];
    [self.navigationController popViewControllerAnimated:YES];
    [[NSNotificationCenter defaultCenter]postNotificationName:@"reloadDataMethod" object:nil];
}
-(void)createInputView{
    CGFloat heights = 0;
    if (statusBarHeight==20) {
        heights = 49;
    }else{
        heights=69;
    }
    UIView * bottomV = [[UIView alloc] initWithFrame:CGRectMake(0, [UIScreen mainScreen].bounds.size.height-heights, ScreenWidth, heights)];
    bottomV.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:bottomV];
    CGFloat height = statusBarHeight==20?[UIScreen mainScreen].bounds.size.height-49:[UIScreen mainScreen].bounds.size.height-49-20;
    self.inputView = [[trendInputView alloc] initWithFrame:CGRectMake(0, height, ScreenWidth, 49)];
    self.inputView.inputField.delegate = self;
    self.inputAreaDefaultRect = self.inputView.frame;
    [self.inputView.sendButton addTarget:self action:@selector(sendButtonMethod) forControlEvents:UIControlEventTouchUpInside];
    [self.inputView.inputField addTarget:self action:@selector(textFieldDidChange:) forControlEvents:UIControlEventEditingChanged];
    [self.view addSubview:self.inputView];
}
-(void)sendButtonMethod{
    [self hideKeyBoard];
    [[ChrysanthemumIndexView sharedMasterUser] show];
    trendCommentCreateParser * parser = [[trendCommentCreateParser alloc] init];
    parser.myDelegate = self;
    if (self.inputView.inputField.tag-200>=0) {
        trendCommentDataModel * model = _commentModelArr[self.inputView.inputField.tag-200];
        NSLog(@"%@",model.model.myId);
        [parser requestTrendCommentCreateId:[_model.myId intValue] parentId:[model.model.myId intValue] content:_inputView.inputField.text];
    }else{
        [parser requestTrendCommentCreateId:[_model.myId intValue] parentId:0 content:_inputView.inputField.text];
    }
    
}
-(void) successTrendCommentCreate{
    [[ChrysanthemumIndexView sharedMasterUser] remove];
    self.inputView.inputField.tag=0;
    [self requestCommentList:self.pageSize];
}
//-(void)requestCommentChild{
//    trendCommentChildListParser * parser = [[trendCommentChildListParser  alloc] init];
//    parser.myDelegate = self;
//    parser requestTrendCommentChildListId:[_model.myId intValue] orderStatus:1 pageNum:1 pageSize:3 parentId:<#(int64_t)#> pubTimeStatus:<#(int32_t)#> showStatus:<#(int32_t)#>
//}
- (void)textFieldDidChange:(id) sender {

   UITextField *textField = (UITextField *)sender;
    if (textField.text.length>0) {
        [self.inputView.sendButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    }else{
        [self.inputView.sendButton setTitleColor:CommonColor forState:UIControlStateNormal];

    }
   

}
 
- (void)keyboardWillShow:(NSNotification *)notification
{
    NSDictionary *userInfo = [notification userInfo];
    NSTimeInterval animationDuration;
    UIViewAnimationCurve animationCurve;
    CGRect keyboardEndFrame;
    
    [[userInfo objectForKey:UIKeyboardAnimationCurveUserInfoKey] getValue:&animationCurve];
    [[userInfo objectForKey:UIKeyboardAnimationDurationUserInfoKey] getValue:&animationDuration];
    [[userInfo objectForKey:UIKeyboardFrameEndUserInfoKey] getValue:&keyboardEndFrame];
    
    CGRect keyboardFrame = [self.view convertRect:keyboardEndFrame fromView:nil];
    CGRect rect = self.inputView.frame;
    
    
    
    rect.origin.y = CGRectGetMinY(keyboardFrame)- CGRectGetHeight(rect);
    
    
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:animationDuration];
    [UIView setAnimationCurve:animationCurve];
    self.inputView.frame = rect;
    [UIView commitAnimations];
}
- (void)keyboardWillHide:(NSNotification*)notification
{
    NSDictionary *userInfo = [notification userInfo];
    NSTimeInterval animationDuration;
    UIViewAnimationCurve animationCurve;
    CGRect keyboardEndFrame;
    
    [[userInfo objectForKey:UIKeyboardAnimationCurveUserInfoKey] getValue:&animationCurve];
    [[userInfo objectForKey:UIKeyboardAnimationDurationUserInfoKey] getValue:&animationDuration];
    [[userInfo objectForKey:UIKeyboardFrameEndUserInfoKey] getValue:&keyboardEndFrame];
    
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:animationDuration];
    [UIView setAnimationCurve:animationCurve];
    self.inputView.frame = self.inputAreaDefaultRect;
    [UIView commitAnimations];
}
-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [self hideKeyBoard];
    return YES;
}
-(void)hideKeyBoard{
    [self.view endEditing:YES];
    
}
- (void)dealloc
{
    // 移除通知
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}
 
#pragma mark - <UITableViewDelegate>
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    [self hideKeyBoard];
}
-(void)reloadFrameMethod:(NSNotification*)notification{
   
    self.commentTableView.frame =CGRectMake(0, CGRectGetMaxY(self.toolBarView.frame)+14, ScreenWidth, [[notification.userInfo objectForKey:@"height"] floatValue]);
    [self reloadScrollViewFrame:CGRectGetMaxY(self.commentTableView.frame) ];
}
 
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    CGFloat currentOffsetY = scrollView.contentOffset.y;
    /*self.refreshControl.isRefreshing == NO加这个条件是为了防止下面的情况发生：
    每次进入UITableView，表格都会沉降一段距离，这个时候就会导致currentOffsetY + scrollView.frame.size.height   > scrollView.contentSize.height 被触发，从而触发loadMore方法，而不会触发refresh方法。
     */
    if (!self.loadMore&& currentOffsetY + scrollView.frame.size.height> scrollView.contentSize.height){
        if (self.commentModelArr.count<self.total) {
            if (self.loadMore == NO) {
                   
                   self.loadMore = YES;
                   //设置滚动轮
                _pageSize = _pageSize+10;
                [self requestCommentList:_pageSize];
               }
    //        [self requestCommentList:20];
            self.commentTableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
             
            }];
        }
        
    }
    

}
 
#pragma mark 刷新列表
-(void)reloadScrollViewFrame:(CGFloat)height{
//    if (statusBarHeight==20) {
//        height = height+49;
//    }else{
//        height=height+69;
//    }
    self.homeScrollView.contentSize= CGSizeMake(ScreenWidth, height+49) ;
}
 
@end
