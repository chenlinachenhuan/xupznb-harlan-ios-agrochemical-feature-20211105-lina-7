//
//  classDetailCellView.m
//  Agrochemical
//
//  Created by HarLan on 2021/9/27.
//

#import "classDetailCellView.h"
 
@implementation classDetailCellView
-(id)init{
    if ([super init]==self) {
//        [self createCe÷llView];
//        self.backgroundColor = [UIColor orangeColor];
    }
    return self;
}
-(void)createCellView:(classDetailDataModel *)dataModel{
    self.dataModel =dataModel;
    
    UIView * cellOneView = [[UIView alloc] init];
    cellOneView.frame = self.dataModel.cellOneFrame;
    cellOneView.backgroundColor = [UIColor whiteColor];
    [self addSubview:cellOneView];
     

    UILabel * titleL = [[UILabel alloc] init];
    titleL.frame = self.dataModel.titleFrame;
    titleL.text = self.dataModel.model.title;
    titleL.numberOfLines = 0;
    titleL.font = FontSize(17);
    [cellOneView addSubview:titleL];
    titleL.attributedText = [commonMethod addLabelToTitle:self.dataModel.model.title typeStr:@"独家"];

    UIView * starView = [[UIView alloc] init];
//    starView.backgroundColor = [UIColor orangeColor];
    starView.frame = self.dataModel.commentNumberImageFrame;
    [cellOneView addSubview:starView];
    
    NSInteger fullStars =[self.dataModel.model.score floatValue]*10/10;
    NSInteger halfStars = [self.dataModel.model.score floatValue]*10;
    BOOL halfStar = halfStars%10 !=0?YES:NO;
    for (int i=0; i<5; i++) {
        UIImageView * imageV = [[UIImageView alloc] initWithFrame:CGRectMake(19*i, 0, 15, 15)];
        imageV.tag = 10000+i;
        imageV.image = [UIImage imageNamed:@"空星"];
        [starView addSubview:imageV];
        if (i<fullStars) {
            imageV.image = [UIImage imageNamed:@"全星"];
        }else if (i==fullStars&&halfStar==YES){
            imageV.image = [UIImage imageNamed:@"半星"];

        } 
    }
    
    UILabel * scoreL = [[UILabel alloc] init];
    scoreL.frame = self.dataModel.commentNumberFrame;
    scoreL.text = [NSString stringWithFormat:@"%@",self.dataModel.model.score];
    if ([self.dataModel.model.score floatValue]==0) {
        scoreL.text = @"暂无评分";
    }
    scoreL.font = FontSize(15);
    scoreL.textColor = [UIColor colorWithRed:255/255.0 green:184/255.0 blue:31/255.0 alpha:1.0];
    [cellOneView addSubview:scoreL];
    
    UILabel * viewsL = [[UILabel alloc] init];
    viewsL.frame = self.dataModel.viewsFrame;
    viewsL.text = [NSString stringWithFormat:@"%@已加入学习",self.dataModel.model.viewNum];
    viewsL.font = FontSize(12);
    viewsL.textColor = CommonColor;
    [cellOneView addSubview:viewsL];
    
    UILabel * moneyL = [[UILabel alloc] init];
    moneyL.frame = self.dataModel.moneyFrame;
    moneyL.text = @"¥";
    moneyL.textColor = SelectColor;
    moneyL.font = FontSize(18);
    [cellOneView addSubview:moneyL];
    
    UILabel * moneyL1 = [[UILabel alloc] init];
    moneyL1.frame = self.dataModel.moneyFrame1;
    moneyL1.text = [NSString stringWithFormat:@"%@",self.dataModel.model.mallPrice];
    moneyL1.textColor = SelectColor;
    moneyL1.font = FontSize(30);
    [cellOneView addSubview:moneyL1];
    
   self.cellTwoView = [[UIView alloc] initWithFrame:self.dataModel.cellTwoFrame];
    self.cellTwoView .backgroundColor = [UIColor whiteColor];
    [self addSubview:self.cellTwoView ];
    
    UIImageView * imageV = [[UIImageView alloc] initWithFrame:self.dataModel.headerImageFrame];
    [imageV sd_setImageWithURL:[NSURL URLWithString:self.dataModel.model.proficientIcon]];
    imageV.clipsToBounds = YES;
    imageV.layer.cornerRadius = self.dataModel.headerImageFrame.size.width/2;
    [self.cellTwoView  addSubview:imageV];
    
    UILabel * nameL = [[UILabel alloc] initWithFrame:self.dataModel.nameFrame];
    nameL.text = self.dataModel.model.proficientName;
    nameL.font = FontSize(17);
    [self.cellTwoView  addSubview:nameL];
    
    UIImageView * cellTwoImage1 = [[UIImageView alloc] initWithFrame:self.dataModel.cellTwoImageOneFrame];
    if ([self.dataModel.model.proficientBelong integerValue]==1) {
        cellTwoImage1.image = [UIImage imageNamed:@"化浪专家"];

    }else{
        cellTwoImage1.image = [UIImage imageNamed:@"三方专家"];

    }
    [self.cellTwoView  addSubview:cellTwoImage1];
    
    UIImageView * cellTwoImage2 = [[UIImageView alloc] initWithFrame:self.dataModel.cellTwoImageTwoFrame];
    cellTwoImage2.image =  [UIImage imageNamed:@"在线服务"];
    cellTwoImage2.hidden=YES;
    [self.cellTwoView  addSubview:cellTwoImage2];
    if ([self.dataModel.model.proficientOnlineStatus integerValue]==1) {
        cellTwoImage2.hidden = NO;
    }
//    UIImageView * cellTwoImage3 = [[UIImageView alloc] initWithFrame:self.dataModel.cellTwoImageThreeFrame];
//    cellTwoImage3.image = [UIImage imageNamed:@"在线服务"];
//    [self.cellTwoView  addSubview:cellTwoImage3];
    
     [self.cellTwoView  addSubview:[self introduceLabelShowAll]];
     self.cellThreeView = [[UIView alloc] initWithFrame:self.dataModel.cellThreeFrame];
    self.cellThreeView.backgroundColor = [UIColor whiteColor];
    [self addSubview:self.cellThreeView];
    
    UILabel * label1 = [[UILabel alloc] initWithFrame:self.dataModel.cellThreeOneTextFrame];
    label1.text = @"适用人群";
    label1.textColor = CommonColor;
    label1.font = FontSize(12);
    [self.cellThreeView addSubview:label1];
    
    UILabel * label2 = [[UILabel alloc] initWithFrame:self.dataModel.cellThreeTwoTextFrame];
    label2.text = self.dataModel.model.suitable;
    label2.font = FontSize(14);
    [self.cellThreeView addSubview:label2];
    
    self.cellFourView = [[UIView alloc] initWithFrame:self.dataModel.cellFourFrame];
    self.cellFourView.backgroundColor = [UIColor whiteColor];
    [self addSubview:self.cellFourView];
    
    UILabel * fourL = [[UILabel alloc] initWithFrame:self.dataModel.cellFourOneTextFrame];
    fourL.text = @"课程简介";
    fourL.textColor = CommonColor;
    fourL.font = FontSize(12);
    [self.cellFourView addSubview:fourL];
    
    UILabel * fourL1 = [[UILabel alloc] initWithFrame:self.dataModel.cellFourTwoTextFrame];
    fourL1.text = self.dataModel.model.remark;
    fourL1.numberOfLines = 0;
    fourL1.font = FontSize(14);
    [self.cellFourView addSubview:fourL1];
}
 
-(YYLabel*)introduceLabelShowAll{
    NSMutableAttributedString *text = [NSMutableAttributedString new];
    // 添加文本
    NSString *title =  self.dataModel.model.proficientContent;
    [text appendAttributedString:[[NSAttributedString alloc] initWithString:title attributes:nil]];
    text.yy_font = FontSize(14) ;
    _label = [YYLabel new];
    _label.userInteractionEnabled = YES;
    _label.numberOfLines = 0;
    _label.textVerticalAlignment = YYTextVerticalAlignmentTop;
    _label.frame = self.dataModel.introduceFrame;
    _label.attributedText = text;
    [self addSeeMoreButton];
    return self.label;
}
-(void)reloadCellData{
    self.cellTwoView.frame = self.dataModel.cellTwoFrame;
    self.cellThreeView.frame = self.dataModel.cellThreeFrame;
    self.cellFourView.frame = self.dataModel.cellFourFrame;
}
#pragma mark - 添加全文
- (void)addSeeMoreButton {
    __weak __typeof(self) weakSelf = self;
    NSMutableAttributedString *text = [[NSMutableAttributedString alloc] initWithString:@"...更多"];
    YYTextHighlight *hi = [[YYTextHighlight alloc] init];
    [hi setColor:[UIColor colorWithRed:0.578 green:0.790 blue:1.000 alpha:1.000]];
    hi.tapAction = ^(UIView *containerView,NSAttributedString *text,NSRange range, CGRect rect) {
        self.dataModel.isShow=YES;
        // 点击全文回调
        YYLabel *label = weakSelf.label;
        [label sizeToFit];
        [self reloadCellData];
        [self.delegate tapLabelAction:self.dataModel];
    };
    [text yy_setColor:SelectColor range:[text.string rangeOfString:@"更多"]];
    [text yy_setTextHighlight:hi range:[text.string rangeOfString:@"更多"]];
    text.yy_font = _label.font;
    YYLabel *seeMore = [YYLabel new];
    seeMore.attributedText = text;
    [seeMore sizeToFit];
    NSAttributedString *truncationToken = [NSAttributedString yy_attachmentStringWithContent:seeMore contentMode:UIViewContentModeCenter attachmentSize:seeMore.frame.size alignToFont:text.yy_font alignment:YYTextVerticalAlignmentCenter];
    _label.truncationToken = truncationToken;
}
@end
