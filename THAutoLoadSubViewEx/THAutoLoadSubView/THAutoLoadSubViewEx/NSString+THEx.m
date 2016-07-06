//
//  NSString+MD5Ex.m
//  coreData_test
//
//  Created by litianhao on 16/6/19.
//  Copyright © 2016年 litianhao. All rights reserved.
//

#import "NSString+THEx.h"

#import <CommonCrypto/CommonDigest.h>


@implementation NSString (THEx)

- (NSString *)th_stringByDeleteLiteralBoxOfOcString
{
    if ([self hasPrefix:@"@\""] || [self hasSuffix:@"\""]) {
        NSRange startRange = [self rangeOfString:@"@\""];
        NSRange endRange = [self rangeOfString:@"\"" options:NSBackwardsSearch];
        return  [self substringWithRange:NSMakeRange(startRange.location + startRange.length, endRange.location - startRange.location - startRange.length)];
    }
    return self ;
}

@end
