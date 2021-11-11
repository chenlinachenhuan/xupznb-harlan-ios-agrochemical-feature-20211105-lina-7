//
//  contentViewController.m
//  Agrochemical
//
//  Created by HarLan on 2021/9/27.
//

#import "contentViewController.h"
#import "classContentView.h"
#import "classContentViewDataModel.h"
#import "classDetailIntroduceModel.h"
#import "classDetailDataModel.h"
#import "classContentModel.h"
#import "subClassParser.h"
 @interface contentViewController ()<subClassParserDelegate>
@property(nonatomic,retain)classContentView * contentView;
@property(nonatomic,retain)NSMutableArray* dataModelArr;
@property(nonatomic,retain)NSMutableArray * classListArr;
@end

@implementation contentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.classListArr = [[NSMutableArray alloc] init];
    [self requestSubClass];
 
}
-(void)requestSubClass{
    subClassParser * parser = [[subClassParser alloc] init];
    parser.myDelegate = self;
    [parser requestSubClassList:[self.textModel.myId integerValue] pageNum:1 pageSize:10 viewStatus:1];
}
-(void)successGetSubCLassList:(NSMutableArray *)arr total:(NSInteger)total{
    self.classListArr = arr;
    [self createContentView];

}
-(void)createContentView{
    self.dataModelArr =[[NSMutableArray alloc] init];
    self.contentView = [[classContentView alloc] init];
//    classContentViewDataModel * dataModel = [[classContentViewDataModel alloc] init];
//    classDetailDataModel * DModel = [[classDetailDataModel alloc] init];
//    DModel.model = self.textModel;
    for (classContentModel * model in self.classListArr) {
        classContentViewDataModel * contentModel = [[classContentViewDataModel alloc] init];
        contentModel.contentModel = model;
        [self.dataModelArr addObject:contentModel];
    }
    self.contentView.frame = CGRectMake(0, 0, ScreenWidth, ScreenHeight-0.56*ScreenWidth-49);
    [self.contentView createclassContentView:self.dataModelArr];
    [self.view addSubview:self.contentView];
}
@end
