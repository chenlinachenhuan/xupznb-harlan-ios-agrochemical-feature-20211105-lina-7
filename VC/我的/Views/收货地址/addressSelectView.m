//
//  addressSelectView.m
//  Agrochemical
//
//  Created by HarLan on 2021/10/28.
//

#import "addressSelectView.h"

@implementation addressSelectView
-(id)initWithFrame:(CGRect)frame{
    if (self==[super initWithFrame:frame]) {
        self.frame=frame;
        self.selectArr = [[NSMutableArray alloc] init];
        self.showArr = [[NSMutableArray alloc] init];
        self.addressStr = [[NSString alloc] init];
        self.selectStr = [[NSString alloc] init];
        self.selectIdArr = [[NSMutableArray alloc] init];
    }
    return self;
}
-(void)createSelectView{
    self.shadowView = [[UIView alloc] initWithFrame:self.frame];
    self.shadowView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.3];
    [self addSubview:self.shadowView];
    UITapGestureRecognizer * rec = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapMethod)];
    rec.delegate =self;
    [self.shadowView addGestureRecognizer:rec];
    _bgView = [[UIView alloc] initWithFrame:CGRectMake(0, self.frame.size.height, ScreenWidth, 0.720982*ScreenHeight)];
    _bgView.backgroundColor = [UIColor whiteColor];
    UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:_bgView.bounds
                                                   byRoundingCorners:UIRectCornerTopLeft|UIRectCornerTopRight cornerRadii:CGSizeMake(10 , 10)];
    CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
    maskLayer.frame = _bgView.bounds;
    maskLayer.path = maskPath.CGPath;
    _bgView.layer.mask = maskLayer;
    [self.shadowView addSubview:_bgView];
    [UIView animateWithDuration:0.5 animations:^{
        self->_bgView.frame = CGRectMake(0, ScreenHeight1-0.720982*ScreenHeight, ScreenWidth, 0.720982*ScreenHeight);
    }];
    
    UILabel * titleL = [[UILabel alloc] init];
    titleL.frame = CGRectMake(0, 0, ScreenWidth, 40);
    titleL.text = @"请选择所在地区";
    titleL.font = FontSize(17);
    titleL.textAlignment = NSTextAlignmentCenter;
    [self.bgView addSubview:titleL];
    
    self.selectTab = [[UITableView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(titleL.frame)+10, ScreenWidth, 0) style:UITableViewStylePlain];
    self.selectTab.delegate = self;
    self.selectTab.dataSource = self;
    self.selectTab.scrollEnabled=NO;
    self.selectTab.rowHeight = 40;
//    self.selectTab.hidden = YES;
    self.selectTab.separatorStyle = 0;
    self.selectTab.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    [_bgView addSubview:self.selectTab];
    
    self.showTab = [[UITableView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(titleL.frame)+24, ScreenWidth, self.bgView.frame.size.height-CGRectGetMaxY(self.selectTab.frame)) style:UITableViewStylePlain];
    self.showTab.delegate = self;
    self.showTab.dataSource = self;
    self.showTab.rowHeight = 40;
    self.showTab.separatorStyle=0;
    self.showTab.showsVerticalScrollIndicator=NO;
    self.showTab.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    [_bgView addSubview:self.showTab];
    
    [self areaListRequest:100000];
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (tableView==self.selectTab) {
        if (self.selectArr.count==0) {
            return 0;
        }
        return  _selectArr.count+1;
    }
    return _showArr.count;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 40;
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell * cell;
    if (tableView==self.selectTab) {
       selectTableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
        if (cell==nil) {
            cell = [[selectTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
        }
         if (_selectArr.count==indexPath.row) {
            cell.titleL.text = @"请选择";
             cell.titleL.textColor = SelectColor;
         }else{
             cell.titleL.text =self.selectArr[indexPath.row];
             cell.titleL.textColor = UIColorFromRGB(0x333333);
         }
        [cell.button setImage:[UIImage imageNamed:@"大模块进入我的"] forState:UIControlStateNormal];
        cell.selectionStyle = 0;
         return  cell;
    }else{
        showTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
        if (cell==nil) {
            cell = [[showTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
        }
        if ([self.showArr[indexPath.row] isKindOfClass:[provModel class]]) {
            provModel * model = self.showArr[indexPath.row];
            cell.firstTitle.text = model.firstWord;
            cell.title.text = model.prov;
        }else if ([self.showArr[indexPath.row] isKindOfClass:[cityModel class]]) {
            cityModel * model = self.showArr[indexPath.row];
            cell.firstTitle.text = model.firstWord;
            cell.title.text = model.city;
        }else if ([self.showArr[indexPath.row] isKindOfClass:[regionModel class]]) {
            regionModel * model = self.showArr[indexPath.row];
            cell.firstTitle.text = model.firstWord;
            cell.title.text = model.region;
        }
        cell.selectionStyle = 0;

        return  cell;
    }
    return  cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (tableView==self.selectTab) {
        selectTableViewCell * cell = [tableView cellForRowAtIndexPath:indexPath];
        if (indexPath.row==0) {
            [self areaListRequest:100000];
        }else if (indexPath.row==1) {
            if ([cell.titleL.text isEqualToString:@"请选择"]) {
                return;
            }
            [self areaListRequest:[_selectStr integerValue]];
        }
    }else{
        if ([_showArr[indexPath.row] isKindOfClass:[provModel class]]) {
            provModel * model = self.showArr[indexPath.row];
            [_selectArr removeAllObjects];
            [_selectArr addObject:model.prov];
            [_selectIdArr removeAllObjects];
            [_selectIdArr addObject:model.myId];
            [self areaListRequest:[model.myId integerValue]];
        }else if ([self.showArr[indexPath.row] isKindOfClass:[cityModel class]]) {
            cityModel * model = self.showArr[indexPath.row];
            if (_selectArr.count>1) {
                [_selectArr removeObjectAtIndex:1];
                [_selectIdArr removeObjectAtIndex:1];
            }
            [_selectArr addObject:model.city];
            self.selectStr = model.myId;
            [_selectIdArr addObject:model.myId];
            [self areaListRequest:[model.myId integerValue]];
        }else if ([self.showArr[indexPath.row] isKindOfClass:[regionModel class]]) {
            regionModel * model = self.showArr[indexPath.row];
             if (_selectArr.count>2) {
                [_selectArr removeObjectAtIndex:2];
                 [_selectIdArr removeObjectAtIndex:2];

            }
            [_selectIdArr addObject:model.myId];
            [_selectArr addObject:model.region];
            [self releadAddress];
        }
    }
}
-(void)tapMethod{
    [UIView animateWithDuration:0.5 animations:^{
        self->_bgView.frame = CGRectMake(0, self.frame.size.height, ScreenWidth, 0.720982*ScreenHeight);
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
    
}
-(void)releadAddress{
    NSString*address=@"";
    for (NSString * str in _selectArr) {
        address =  [NSString stringWithFormat:@"%@%@ ",address,str];
    }
    [self tapMethod];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"addressName" object:nil userInfo:@{@"address":address,@"addressId":_selectIdArr}];
}
-(void)areaListRequest:(NSInteger)parentId{
    areaListParser * parser = [[areaListParser alloc] init];
    parser.myDelegate = self;
    [parser requestareaList:parentId];

 }
-(void)successGetareaList:(NSMutableArray *)arr{
    if (arr.count==0) {
        [self releadAddress];
        return;
    }
    [self.showArr removeAllObjects];
   self.showArr = [self arrSorbFirstWord:arr];
  
    [self reloadMethod];
    
}
-(void)reloadMethod{
    
    [self.showTab reloadData];
    [self.selectTab reloadData];
    if (_selectArr.count==0) {
        self.selectTab.frame = CGRectMake(0, 40, ScreenWidth, 40*(_selectArr.count));
        self.showTab.frame = CGRectMake(0, CGRectGetMaxY(self.selectTab.frame), ScreenWidth, 0.720982*ScreenHeight-50);
        
    }else{
        self.selectTab.frame = CGRectMake(0, 40, ScreenWidth, 40*(_selectArr.count+1));
        self.showTab.frame = CGRectMake(0, CGRectGetMaxY(self.selectTab.frame)+24, ScreenWidth, CGRectGetHeight(self.bgView.frame)-CGRectGetMaxY(self.selectTab.frame)-30);
    }
     
}
-(NSMutableArray*)arrSorbFirstWord:(NSMutableArray*)arr{
    NSArray *sortedArray;
    if ([arr[0] isKindOfClass:[provModel class]]) {
        sortedArray = [arr sortedArrayUsingComparator:^NSComparisonResult(provModel *p1, provModel *p2){
            return [p1.firstWord compare:p2.firstWord];
        }];
    }else if ([arr[0] isKindOfClass:[cityModel class]]) {
        sortedArray = [arr sortedArrayUsingComparator:^NSComparisonResult(cityModel *p1, cityModel *p2){
            return [p1.firstWord compare:p2.firstWord];
        }];
    }else if ([arr[0] isKindOfClass:[regionModel class]]) {
        sortedArray = [arr sortedArrayUsingComparator:^NSComparisonResult(regionModel *p1, regionModel *p2){
            return [p1.firstWord compare:p2.firstWord];
        }];
    }
    return [sortedArray mutableCopy];
   
}
#pragma mark - UIGestureRecognizerDelegate
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch
{
    // 输出点击的view的类名
    NSLog(@"%@", NSStringFromClass([touch.view class]));
    
    //     若为UITableViewCellContentView（即点击了tableViewCell），则不截获Touch事件
    if ([NSStringFromClass([touch.view class]) isEqualToString:@"UITableViewCellContentView"]) {
        return NO;
    }
    return  YES;
}
@end
