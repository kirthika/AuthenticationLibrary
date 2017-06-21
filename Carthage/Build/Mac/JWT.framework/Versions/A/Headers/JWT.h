//
//  JWT.h
//  JWT
//
//  Created by Lobanov Dmitry on 23.10.16.
//  Copyright © 2016 Karma. All rights reserved.
//

#import <Foundation/Foundation.h>

//! Project version number for JWT.
FOUNDATION_EXPORT double JWTVersionNumber;

//! Project version string for JWT.
FOUNDATION_EXPORT const unsigned char JWTVersionString[];

// In this header, you should import all the public headers of your framework using statements like #import <JWT/PublicHeader.h>

// Coding
#import <JWT/JWTCoding.h>

// Algorithms
#import <JWT/JWTAlgorithm.h>
#import <JWT/JWTRSAlgorithm.h>
#import <JWT/JWTAlgorithmFactory.h>
#import <JWT/JWTAlgorithmHSBase.h>
#import <JWT/JWTAlgorithmRSBase.h>

// Holders
#import <JWT/JWTAlgorithmDataHolder.h>
#import <JWT/JWTAlgorithmDataHolderChain.h>

// Claims
#import <JWT/JWTClaimsSet.h>
#import <JWT/JWTClaim.h>
#import <JWT/JWTClaimsSetSerializer.h>
#import <JWT/JWTClaimsSetVerifier.h>

// Supplement
#import <JWT/JWTDeprecations.h>
#import <JWT/JWTBase64Coder.h>
