//
//  VTTwoClickController.h
//  MidtransKit
//
//  Created by Nanang Rafsanjani on 3/4/16.
//  Copyright © 2016 Veritrans. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "VTPaymentController.h"
#import "VTCCBackView.h"

@interface VTTwoClickController : VTPaymentController
@property (weak, nonatomic) IBOutlet VTCCBackView *backView;

@end
