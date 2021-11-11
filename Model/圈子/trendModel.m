//
//  trendModel.m
//  Agrochemical
//
//  Created by HarLan on 2021/9/22.
//

#import "trendModel.h"
#import "trendListCommentModel.h"
@implementation trendModel

- (id)initWithData:(NSDictionary *)data{
    if (self==[super init]) {
        self.nameStr = [data objectForKey:@"nickname"];
        self.followStatus = [data objectForKey:@"followStatus"];
        self.headImage = [data objectForKey:@"avatar"];
        self.typeId =[data objectForKey:@"typeId"];
        NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
        [formatter setDateFormat:@"HH:mm"];//yyyy年MM月dd日
        NSString *dateString =[data objectForKey:@"pubTime"];
        NSRange range = NSMakeRange(11, 5);
        dateString = [dateString substringWithRange:range];//误区** 字符串长度必须与formatter长度对应一致 不然date就是nil
        NSDate *date = [formatter dateFromString:dateString];
//                    [formatter setDateFormat:@"yyyy年MM月dd日"];
         self.pubTime = [formatter stringFromDate:date];
        self.viewNum = [NSString stringWithFormat:@"%@",[data objectForKey:@"viewNum"]];
        self.titleStr = [data objectForKey:@"title"];
        self.textStr =[data objectForKey:@"content"];
        self.fabulousNum =[NSString stringWithFormat:@"%@",[data objectForKey:@"fabulousNum"]];
        self.fabulousStatus =[NSString stringWithFormat:@"%@",[data objectForKey:@"fabulousStatus"]];

        self.shareNum =[NSString stringWithFormat:@"%@",[data objectForKey:@"shareNum"]];
        self.commentTitleStr =[NSString stringWithFormat:@"%@",[data objectForKey:@"commentNum"]];
        self.myId = [data objectForKey:@"id"];
        self.memberId = [data objectForKey:@"memberId"];
        if ([self.typeId intValue]==1) {
            self.imageArr =[data objectForKey:@"albumPicsDesc"];

        }
        self.movUrl = [data objectForKey:@"albumPics"];
         self.commentArr = [[NSMutableArray alloc] init];
        for (NSDictionary*dic in [data objectForKey:@"commentList"]) {
            trendListCommentModel * model = [[trendListCommentModel alloc] initWithData:dic];
            [self.commentArr addObject:model];
        }
        
    }
    return self;
     
}
@end
