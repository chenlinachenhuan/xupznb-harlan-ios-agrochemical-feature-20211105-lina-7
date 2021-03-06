//
//  newsDetailViewController.m
//  Agrochemical
//
//  Created by HarLan on 2021/10/15.
//

#import "newsDetailViewController.h"
#import <WebKit/WebKit.h>
#import "newsDetailTextParser.h"
#import "newsDetailTextModel.h"
#import "newsCommentListParser.h"
#import "trendInputView.h"
#import "newsCommentCreateParser.h"
#import "newsCommentView.h"
#import "newsCommentFrameModel.h"
#import "newsCommentTableViewCell.h"
#import "newsCommentFabulousParser.h"
#import "newsCommentCancelFabulousParser.h"
#import "newsCommentReportParser.h"
@interface newsDetailViewController ()<UIGestureRecognizerDelegate,newsDetailProtocolDelegate,UIScrollViewDelegate,newsCommentListDelegate,UITextFieldDelegate,newsCommentCreateDelegate,newsCommentFabulousDelegate,newsCommentCancelFabulousDelegate,newsCommentReportDelegate,WKNavigationDelegate>
@property(nonatomic,retain)newsDetailTextModel * textModel;
@property(nonatomic,retain)UIScrollView * homeScrollView;
@property(nonatomic,retain)trendInputView * inputView;
@property(nonatomic,assign)CGRect inputAreaDefaultRect;
@property(nonatomic,retain)newsCommentView * commentView ;
@property(nonatomic,retain)WKWebView * webView;
@property(nonatomic,retain)NSMutableArray * commentFrameArr;
@property(nonatomic,retain)newsLikeButton * recordButton;
@property(nonatomic,retain)UILabel * typeL;
@property(nonatomic,assign)BOOL loadMore;
@property(nonatomic,assign)int32_t pageSize;
@property(nonatomic,assign)NSInteger total;
@end

@implementation newsDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = BackGroundColor;
    self.navigationController.navigationBarHidden = YES;
    self.navigationController.navigationBar.barTintColor = [UIColor whiteColor];
    [self initMethod];
    [self requestNewsDetailTextMethod];
    [self createNaviView];
    [self createScrollView];
    [self createBottomView];
}
-(void)initMethod{
    self.pageSize =10;
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
}
-(void)requestNewsDetailTextMethod{
    [[ChrysanthemumIndexView sharedMasterUser] show];
    newsDetailTextParser * parser = [[newsDetailTextParser alloc] init];
    parser.myDelegate = self;
    [parser requestWithMyId:[ self.myId integerValue] ];
}
-(void)successWithNewsDetail:(newsDetailTextModel *)model{
    
    [[ChrysanthemumIndexView sharedMasterUser] remove];
    self.textModel = model;
    [self createTextView];
 
}
-(void)failedMethod{
    [[ChrysanthemumIndexView sharedMasterUser] remove];
}
-(void)createNaviView{
//     self.navigationController.navigationBar.shadowImage = [[UIImage alloc] init];
    UIView * bgV = [[UIView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, TopHeight)];
    bgV.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:bgV];
    bigButton *backButton = [bigButton buttonWithType:UIButtonTypeCustom];
    backButton.frame = CGRectMake(10,statusBarHeight, 44, 44);
    [backButton addTarget:self action:@selector(backButtonMethod) forControlEvents:UIControlEventTouchUpInside];
//    [self.backButton setBackgroundColor:[UIColor orangeColor]];
    [backButton setImage:[UIImage imageNamed:@"??????"] forState:UIControlStateNormal];
    [bgV addSubview:backButton];
   
    UILabel * title = [[UILabel alloc] initWithFrame:CGRectMake(0, statusBarHeight, ScreenWidth,navBarHeight)];
    title.text = @"????????????";
//    title.backgroundColor = [UIColor redColor];
    title.font = [UIFont fontWithName:@"PingFang SC" size: 17];
    title.numberOfLines = 0;
    title.textAlignment = NSTextAlignmentCenter;
    [bgV addSubview:title];
    UIButton * rsearchButton = [UIButton buttonWithType:UIButtonTypeCustom];
    rsearchButton.frame = CGRectMake(ScreenWidth-16-17, title.center.y-8.5, 17, 17);
    [rsearchButton addTarget:self action:@selector(forwordButtonMethod) forControlEvents:UIControlEventTouchUpInside];
    [rsearchButton setImage:[UIImage imageNamed:@"??????"] forState:UIControlStateNormal];
    [bgV addSubview:rsearchButton];
    self.navigationController.interactivePopGestureRecognizer.delegate = self;
    
}
-(void)createScrollView{
    self.homeScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, TopHeight+10, ScreenWidth, ScreenHeight)];
    self.homeScrollView.delegate = self;
    self.homeScrollView.contentSize = CGSizeMake(ScreenWidth, 1000);
    self.homeScrollView.showsVerticalScrollIndicator = NO;
    self.homeScrollView.userInteractionEnabled = YES;
    self.homeScrollView.backgroundColor = [UIColor whiteColor];
//    [self.view addSubview:self.homeScrollView];
    [self.view addSubview:self.homeScrollView];
}
-(void)createTextView{
    
    UILabel * titleL = [[UILabel alloc] init];
    CGSize size = [commonMethod sizeWithText:_textModel.title sizeWithWidth:ScreenWidth-32 sizeWithFont:FontSize(17)];
    titleL.frame =(CGRect){16.5,23,size};
    titleL.text = _textModel.title;
//    titleL.textColor = SelectColor;
//    titleL.textAlignment = NSTextAlignmentCenter;
    titleL.font = FontSize(17);
    titleL.numberOfLines = 0;
    [self.homeScrollView addSubview:titleL];

    
    _typeL = [[UILabel alloc] init];
    NSString * typeStr =@"";
    if (self.textModel.cat2Name.length>0) {
        typeStr =self.textModel.cat2Name;
    }else{
        typeStr =self.textModel.catName;
    }
    _typeL.frame =CGRectMake(16.5, CGRectGetMaxY(titleL.frame)+6, [commonMethod widthAuto:[NSString stringWithFormat:@"%@ %@",typeStr,self.textModel.updateTime] fontSize:12 contentheight:12], 12);
    _typeL.text = [NSString stringWithFormat:@"%@ %@",typeStr,self.textModel.updateTime];
    _typeL.textColor = CommonColor;
//    titleL.textAlignment = NSTextAlignmentCenter;
    _typeL.font = FontSize(12);
    _typeL.numberOfLines = 0;
    [self.homeScrollView addSubview:_typeL];
    
//    self.webView = [[WKWebView alloc] initWithFrame:CGRectMake(16.5, CGRectGetMaxY(typeL.frame)+27, ScreenWidth-33, ScreenHeight)];
    [self.webView loadHTMLString:_textModel.content baseURL:nil];
    self.webView.scrollView.scrollEnabled = NO;
    self.webView.navigationDelegate = self;
    self.webView.scrollView.showsVerticalScrollIndicator = NO;
    [self.homeScrollView addSubview:self.webView];
}
- (WKWebView *)webView {
 
    if (!_webView) {
 
        //????????????????????????
 
        NSString *jScript = @"var meta = document.createElement('meta'); meta.setAttribute('name', 'viewport'); meta.setAttribute('content', 'width=device-width'); document.getElementsByTagName('head')[0].appendChild(meta);";
        WKUserScript *wkUScript = [[WKUserScript alloc] initWithSource:jScript injectionTime:WKUserScriptInjectionTimeAtDocumentEnd forMainFrameOnly:YES];
        WKUserContentController *wkUController = [[WKUserContentController alloc] init];
        [wkUController addUserScript:wkUScript];
        
        WKWebViewConfiguration *wkWebConfig = [[WKWebViewConfiguration alloc] init];
        wkWebConfig.userContentController = wkUController;
        _webView = [[WKWebView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, 1) configuration:wkWebConfig];
         [self.homeScrollView addSubview:_webView];
    }
    return _webView;
}
- (void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation
{
    // ????????????
    NSString *fontFamilyStr = @"document.getElementsByTagName('body')[0].style.fontFamily='PingFangSC';";
    [webView evaluateJavaScript:fontFamilyStr completionHandler:nil];
    //????????????
    [ webView evaluateJavaScript:@"document.getElementsByTagName('body')[0].style.webkitTextFillColor= '#333333'" completionHandler:nil];
    //??????????????????
    [ webView evaluateJavaScript:@"document.getElementsByTagName('body')[0].style.webkitTextSizeAdjust= '90%'"completionHandler:nil];

    [webView evaluateJavaScript:@"document.body.offsetHeight" completionHandler:^(id _Nullable result, NSError * _Nullable error) {
        CGFloat documentHeight = [result doubleValue];
        CGRect webFrame = webView.frame;
        webFrame.size.height = documentHeight;
        webView.frame = webFrame;
        self.webView.frame =CGRectMake(0, CGRectGetMaxY(_typeL.frame)+17, webFrame.size.width, webFrame.size.height+10);
        [self reloadScrollViewFrame:CGRectGetMaxY(webFrame)];
        [self requestNewsDetailCommentMethod];

    }];
    
   

}
-(void)backButtonMethod{
    [self.navigationController popViewControllerAnimated:YES];
}
-(void)forwordButtonMethod{
    
}
 
-(void)createBottomView{
    UIView * bottomV = [[UIView alloc] initWithFrame:CGRectMake(0, ScreenHeight1-49, ScreenWidth, 69)];
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
-(void)requestNewsDetailCommentMethod{
    [[ChrysanthemumIndexView sharedMasterUser] show];
    newsCommentListParser * parser = [[newsCommentListParser alloc] init];
    parser.myDelegate = self;
    [parser requestWithMyId:[ _myId integerValue] withOrderStatus:0 withPageNum:1 pageSize:self.pageSize parentId:0 pubTimeStatus:0 showStatus:1];
}
-(void)successFornewsCommentList:(NSMutableArray<newsCommentListTextModel *> *)dataArr total:(NSInteger)total{
    NSLog(@"%@",dataArr);
    [[ChrysanthemumIndexView sharedMasterUser] remove];
    self.total = total;
    self.loadMore=NO;
    self.commentFrameArr = [[NSMutableArray alloc] init];
    CGFloat height=0;
    for (newsCommentListTextModel* textModel in dataArr) {
        newsCommentFrameModel * frameModel = [[newsCommentFrameModel alloc] init];
        frameModel.model = textModel;
       height = height + [frameModel setCommentFrames:textModel];
        [self.commentFrameArr addObject:frameModel];
        
    }
    self.commentView  = [[newsCommentView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(self.webView.frame), ScreenWidth, height+40) style:UITableViewStyleGrouped];
    [self.commentView commentArr:self.commentFrameArr cell:^newsCommentTableViewCell * _Nullable(NSIndexPath * _Nonnull indexPath) {
        newsCommentTableViewCell * cell = [self.commentView dequeueReusableCellWithIdentifier:@"newsComment"];
        if (cell==nil) {
            cell = [[newsCommentTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"newsComment"];
        }
        cell.selectionStyle = 0;
        cell.contentView.backgroundColor = [UIColor clearColor];
        newsCommentFrameModel * frameModel = self.commentFrameArr[indexPath.row];
        cell.iconView.frame = frameModel.commentHeadImageFrame;
        cell.iconView.image = [UIImage imageNamed:testImage];
        cell.nameLabel.frame = frameModel.commentNameFrame;
        cell.nameLabel.text = frameModel.model.nickname;
        cell.timeLabel.frame = frameModel.commentDateFrame;
        cell.timeLabel.text = [NSString stringWithFormat:@"%@",frameModel.model.pubTimeOffsetDesc];
        cell.textL.frame = frameModel.commentTextFrame;
        cell.textL.text = frameModel.model.content;
        cell.likeButton.frame = frameModel.commentButtonFrame;
        cell.likeButton.titleEdgeInsets = UIEdgeInsetsMake(0, 0, 0, -8);
        [cell.likeButton setTitle:[NSString stringWithFormat:@"%@",frameModel.model.fabulousNum] forState:UIControlStateNormal];
        cell.likeButton.tag = indexPath.row;
        cell.likeButton.likeCount = [frameModel.model.fabulousNum intValue];
        cell.likeButton.likeCountBool = frameModel.model.fabulousStatus;
        [cell.likeButton setImage:[UIImage imageNamed:@"??????"] forState:UIControlStateNormal];
        [cell.likeButton setImage:[UIImage imageNamed:@"?????????"] forState:UIControlStateSelected];
        if (frameModel.model.fabulousStatus==0) {
            cell.likeButton.selected=NO;
        }else{
            cell.likeButton.selected=YES;

        }
        [cell.likeButton addTarget:self action:@selector(likeButtonMethod:) forControlEvents:UIControlEventTouchUpInside];
        cell.reportButton.frame = frameModel.reportButtonFrame;
        cell.reportButton.tag = indexPath.row;
        [cell.reportButton addTarget:self action:@selector(reportButtonMethod:) forControlEvents:UIControlEventTouchUpInside];
        cell.lineL.frame = frameModel.lineLFrame;
        if (frameModel.model.fabulousStatus==1) {
            [cell.likeButton setTitleColor:SelectColor forState:UIControlStateNormal];

        }
        return cell;
        
    }selectedCell:^(NSIndexPath * _Nonnull indexPath) {
        
    }];
    [self.homeScrollView addSubview:self.commentView];
    [self reloadScrollViewFrame:CGRectGetMaxY(self.commentView.frame)+20];
    if (dataArr.count==0) {
        UILabel * label = [[UILabel alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(self.commentView.frame)+10, ScreenWidth, 40)];
        label.text = @"????????????";
        label.textColor = UIColorFromRGB(0xA2A6AC);
        label.textAlignment = NSTextAlignmentCenter;
        label.font = FontSize(15);
        [self.homeScrollView addSubview:label];
        [self reloadScrollViewFrame:CGRectGetMaxY(label.frame)+20];

    }
}
 
-(void)likeButtonMethod:(newsLikeButton*)button{
    button.selected = !button.selected;
    NSLog(@"%ld",(long)button.tag);
    newsCommentFrameModel * frameM = self.commentFrameArr[button.tag];
    newsCommentListTextModel * model = frameM.model;
    if (button.selected==1) {
        newsCommentFabulousParser * parser = [[newsCommentFabulousParser alloc] init];
        parser.myDelegate = self;
        [parser requestWithId:model.myId];
    }else{
        newsCommentCancelFabulousParser * parser = [[newsCommentCancelFabulousParser alloc] init];
        parser.myDelegate = self;
        [parser requestWithId:model.myId];
    }
    self.recordButton = button;
}
-(void)successFabulous:(NSInteger)code{
    if (code==200) {
    
        [self.recordButton setTitle:[NSString stringWithFormat:@"%d",self.recordButton.likeCount+1] forState:UIControlStateNormal];
        [self.recordButton setTitleColor:SelectColor forState:UIControlStateNormal];
        self.recordButton.likeCountBool = 1;
        self.recordButton.likeCount =self.recordButton.likeCount+1;
    } 
}
-(void)successCancelFabulous:(NSInteger)code{
    if (code==200) {
        [self.recordButton setTitle:[NSString stringWithFormat:@"%d",self.recordButton.likeCount-1] forState:UIControlStateNormal];
        self.recordButton.likeCount =self.recordButton.likeCount-1;
        [self.recordButton setTitleColor:CommonColor forState:UIControlStateNormal];
        self.recordButton.likeCountBool = 0;
    }
}
-(void)failedMethod:(NSString *)message{
    [[ChrysanthemumIndexView sharedMasterUser] remove];
    FBUtilShowTipView(self.view,message);
}
-(void)reportButtonMethod:(UIButton*)button{
    newsCommentFrameModel * frameM = self.commentFrameArr[button.tag];
    newsCommentListTextModel * model = frameM.model;
    newsCommentReportParser * parser = [[newsCommentReportParser alloc] init];
    parser.myDelegate = self;
    [parser requestWithId:model.myId];
}
-(void)successReport:(NSString*)message{
   
    FBUtilShowTipView(self.view,message);
    
}
-(void)sendButtonMethod{
    [self hideKeyBoard];
    newsCommentCreateParser * parser = [[newsCommentCreateParser alloc] init];
    parser.myDelegate = self;
    [parser requestWithcontent:self.inputView.inputField.text newsId:[self.myId integerValue] parentId:0];
}
-(void)successCreateComment:( NSInteger)code{
  
    FBUtilShowTipView(self.view,@"??????????????????");
    [self requestNewsDetailCommentMethod];
    self.inputView.inputField.text=@"";
    [self.inputView.sendButton setTitleColor:CommonColor forState:UIControlStateNormal];

   
}
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
    [self sendButtonMethod];
    return YES;
}
-(void)hideKeyBoard{
    [self.view endEditing:YES];
}
- (void)dealloc
{
    // ????????????
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}
 
#pragma mark - <UITableViewDelegate>
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    [self.view endEditing:YES];
}
-(void)reloadScrollViewFrame:(CGFloat)height{
    self.homeScrollView.contentSize= CGSizeMake(ScreenWidth, height+20) ;
}
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    CGFloat currentOffsetY = scrollView.contentOffset.y;
    /*self.refreshControl.isRefreshing == NO??????????????????????????????????????????????????????
    ????????????UITableView????????????????????????????????????????????????????????????currentOffsetY + scrollView.frame.size.height   > scrollView.contentSize.height ????????????????????????loadMore????????????????????????refresh?????????
     */
    if (!self.loadMore&& currentOffsetY + scrollView.frame.size.height> scrollView.contentSize.height){
        if (self.commentFrameArr.count<self.total) {
            if (self.loadMore == NO) {
                   
                   self.loadMore = YES;
                   //???????????????
                _pageSize = _pageSize+10;
                [self  requestNewsDetailCommentMethod];
               }
    //        [self requestCommentList:20];
           
        }
        
    }
    

}
@end
