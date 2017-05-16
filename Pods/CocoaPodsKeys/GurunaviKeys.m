//
// Generated by CocoaPods-Keys
// on 15/05/2017
// For more information see https://github.com/orta/cocoapods-keys
//

#import <objc/runtime.h>
#import <Foundation/NSDictionary.h>
#import "GurunaviKeys.h"

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wincomplete-implementation"

@implementation GurunaviKeys

  @dynamic secretKeyID;

#pragma clang diagnostic pop

+ (BOOL)resolveInstanceMethod:(SEL)name
{
  NSString *key = NSStringFromSelector(name);
  NSString * (*implementation)(GurunaviKeys *, SEL) = NULL;

  if ([key isEqualToString:@"secretKeyID"]) {
    implementation = _podKeys5e92eabe991cc620fb6077283ccd355a;
  }

  if (!implementation) {
    return [super resolveInstanceMethod:name];
  }

  return class_addMethod([self class], name, (IMP)implementation, "@@:");
}

static NSString *_podKeys5e92eabe991cc620fb6077283ccd355a(GurunaviKeys *self, SEL _cmd)
{
  
    
      char cString[33] = { GurunaviKeysData[984], GurunaviKeysData[104], GurunaviKeysData[163], GurunaviKeysData[1020], GurunaviKeysData[661], GurunaviKeysData[790], GurunaviKeysData[942], GurunaviKeysData[309], GurunaviKeysData[402], GurunaviKeysData[222], GurunaviKeysData[74], GurunaviKeysData[966], GurunaviKeysData[550], GurunaviKeysData[143], GurunaviKeysData[185], GurunaviKeysData[583], GurunaviKeysData[1051], GurunaviKeysData[381], GurunaviKeysData[365], GurunaviKeysData[4], GurunaviKeysData[593], GurunaviKeysData[70], GurunaviKeysData[142], GurunaviKeysData[713], GurunaviKeysData[71], GurunaviKeysData[405], GurunaviKeysData[489], GurunaviKeysData[864], GurunaviKeysData[1076], GurunaviKeysData[306], GurunaviKeysData[781], GurunaviKeysData[789], '\0' };
    
    return [NSString stringWithCString:cString encoding:NSUTF8StringEncoding];
  
}


static char GurunaviKeysData[1114] = "lrHTdkb45lFl6dz+7ncRlUdLoYsNkAsm7L2KUAoJ8fguD0sLrRs7eGdlIpwowIkcYm0Q5gddPH9fomf1oHt1EoAUhZWvhfL3L+BiVZ4WcBryD0QoGMRdDBSXdf7jo6lV+J/S2PyBA+TGkB02Oqouo+QJ4oavaZm1QcsdOp5IA75oSZbUdUC6hDilm9R7TXxJCRm9xWx1V+NbVzWHveQheUKN10fMX03Qu/zpYJRIwX867czfLUNp4fflqoQyNPEntESrombu9RQty8ovdghirySKdgRtbVVxKqatLImgUsCDVV64preK27EMpr9IKr11EubPOp9R5qqZWSI8qvF0HzBpAO0WHaZN7X/GMoMwQEX6E4Vi9tTCUWmV3Iplof6DmtLVXtIfCxhtD/NS59fLP4/1nYGzS30d8diOu8EoH7pgHXKT/UmKk60ZAI2h0L6eUEp6bRhxRjoK0/3hCKRnEjjpYqGsAouS8XFewACQDcim+qv1wurFtyj15JeMLeec7TABfmV2r/hq92n+3wi566vg7Or6D0mf3WV9OBfCPPTVU8ZH4Ih5AAwFH95XEXMPor1mC/HfKreMmzOLd5iWo23AxQt+bEZFbUBSg99qJazYnUnTHj487y5fsMwL/DghTXP1B/Q5Ng5+0OP4ZW/Np5wTrTU7IIXSptFHstvUaUAibD32TYSbtOUHdoXYfE1KjOFpM1YNu41zm7mfl3haEVT6/V0xkbWzA1xX1Vxjc2lrrpz3lI8v320776X/z3kckgLebAkg3CaOv4RqkRW3o286u293uYFtRBNirMiRDlApNM7duNU6sDsAoUgBm0MwpFPM+QVNm6mvXgRDg0X/YiX1b0Vnth4r6EwYiMo5wSouUgAqm/v3GN5DDwMWUDlxSHCcVXJ4pUsxWAtXAkDDdB8Uen/bf3Gy0u7eYwLrR7f2Z5bfjfE6zWMkT9cy59KVtcweS502L9/kEnAWplFn2yfTfn9I8HWoHDbjyDQ1qLFtfV84XhX9fo1ih4VF4KC2lct2+cGwhi5Cs+nrJ9/10FwWwL+dwH35Z6KYqk3HtkncJGjf+ivm0W7qM6qneBXwyqfrDj10GRqy/pOO1ipCbQ==\\\"";

- (NSString *)description
{
  return [@{
            @"secretKeyID": self.secretKeyID,
  } description];
}

- (id)debugQuickLookObject
{
  return [self description];
}

@end