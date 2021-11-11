//
//  newsViewProtocol.h
//  Agrochemical
//
//  Created by HarLan on 2021/10/15.
//

@protocol newsProtocolDelegate<NSObject>
-(void)success:(NSMutableArray*)arr total:(NSInteger)total;
-(void)failedMethod:(NSString*)message;
@end

 
