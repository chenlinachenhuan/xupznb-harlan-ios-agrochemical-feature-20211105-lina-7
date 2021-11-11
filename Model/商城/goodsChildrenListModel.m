//
//  goodsChildrenListModel.m
//  Agrochemical
//
//  Created by HarLan on 2021/11/1.
//

#import "goodsChildrenListModel.h"
 @implementation goodsChildrenListModel
-(id)initWithData:(NSDictionary*)dic{
    if (self==[super init]) {
        self.myId = [dic objectForKey:@"id"];
        self.name = [dic objectForKey:@"dictValue"];
        self.pic = [dic objectForKey:@"pic"];
        self.remark = [dic objectForKey:@"remark"];

    }
    return self;
}
@end
