Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D7D572714C
	for <lists+dm-devel@lfdr.de>; Thu,  8 Jun 2023 00:07:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1686175632;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=BR2ya2R4+QVSCgxTMeTNei+byAU9+dQpTCvGmhxZTi4=;
	b=SHrwQx6EHbHrSHc5nHlNRaSHW0nfIEyCnflzv82ejcjR3KS6M3bnDAG5wcoaHy/Wn+eIIN
	/hMvhMaI/Vn70GgrvaL3NNvdGJWhKsVcx2nFXhaDdm0+jGeplNTrZyEc/ee/8H/+kVkBez
	khHb8qCfWbc6Q2Iv/bnAGU74b/c2rYw=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-480-D_BIsWijPqmib6ltyyX44A-1; Wed, 07 Jun 2023 18:07:10 -0400
X-MC-Unique: D_BIsWijPqmib6ltyyX44A-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1CE2E185A792;
	Wed,  7 Jun 2023 22:07:08 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 9EF7D48205F;
	Wed,  7 Jun 2023 22:07:02 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 5E8CC19452D3;
	Wed,  7 Jun 2023 22:07:01 +0000 (UTC)
X-Original-To: dm-devel@listman.corp.redhat.com
Delivered-To: dm-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id B45C219452C3
 for <dm-devel@listman.corp.redhat.com>; Wed,  7 Jun 2023 22:06:59 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id F363F403367; Wed,  7 Jun 2023 22:06:58 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id EB44C403362
 for <dm-devel@redhat.com>; Wed,  7 Jun 2023 22:06:58 +0000 (UTC)
Received: from us-smtp-inbound-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C91348002BF
 for <dm-devel@redhat.com>; Wed,  7 Jun 2023 22:06:58 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-652-ZI1ijAeDOJaWOo_84RBNxQ-1; Wed, 07 Jun 2023 18:06:56 -0400
X-MC-Unique: ZI1ijAeDOJaWOo_84RBNxQ-1
X-IronPort-AV: E=McAfee;i="6600,9927,10734"; a="341777495"
X-IronPort-AV: E=Sophos;i="6.00,225,1681196400"; d="scan'208";a="341777495"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2023 15:06:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10734"; a="742863869"
X-IronPort-AV: E=Sophos;i="6.00,225,1681196400"; d="scan'208";a="742863869"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga001.jf.intel.com with ESMTP; 07 Jun 2023 15:06:54 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 7 Jun 2023 15:06:54 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 7 Jun 2023 15:06:53 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Wed, 7 Jun 2023 15:06:53 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.42) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Wed, 7 Jun 2023 15:06:53 -0700
Received: from SJ0PR11MB4864.namprd11.prod.outlook.com (2603:10b6:a03:2d4::21)
 by SJ0PR11MB5940.namprd11.prod.outlook.com (2603:10b6:a03:42f::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.33; Wed, 7 Jun
 2023 22:06:51 +0000
Received: from SJ0PR11MB4864.namprd11.prod.outlook.com
 ([fe80::fe54:8b45:be9f:202]) by SJ0PR11MB4864.namprd11.prod.outlook.com
 ([fe80::fe54:8b45:be9f:202%6]) with mapi id 15.20.6455.034; Wed, 7 Jun 2023
 22:06:51 +0000
Message-ID: <1ce70878-cf3a-7cde-be8f-3279c34493d1@intel.com>
Date: Wed, 7 Jun 2023 15:06:48 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
From: "Chang S. Bae" <chang.seok.bae@intel.com>
To: Eric Biggers <ebiggers@kernel.org>
References: <20230524165717.14062-1-chang.seok.bae@intel.com>
 <20230603152227.12335-1-chang.seok.bae@intel.com>
 <20230603152227.12335-13-chang.seok.bae@intel.com>
 <20230607053558.GC941@sol.localdomain>
In-Reply-To: <20230607053558.GC941@sol.localdomain>
X-ClientProxiedBy: SJ0PR03CA0123.namprd03.prod.outlook.com
 (2603:10b6:a03:33c::8) To SJ0PR11MB4864.namprd11.prod.outlook.com
 (2603:10b6:a03:2d4::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB4864:EE_|SJ0PR11MB5940:EE_
X-MS-Office365-Filtering-Correlation-Id: 887ef364-270a-473d-eb9c-08db67a37ef1
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0
X-Microsoft-Antispam-Message-Info: nK9sUq36xfA4XV1b223qDmsLivvK2GrZzesojrmhUXgtT6tBFGOR+w2mRVWazPFGyszESDKujAeEmfGK8rscJDqwpNMpTW5+tmljBpZLhgWLq/aoawR0qfCU3Uge7wCjgD6TyeWQvUwmlVRVbt3jIh4JvkPk0k5tWAOEPLD0BR0zDRvcCKqAY2SYs9ZdOzKFnGmiE/UWmaAZL2LeXnSJPeKBVc1TcYCG2QZro6hhMVXMS14oZpLwhPoFbo83k/kG8zxIamwwAaUJDUG9djqQeXryufLqjjiQ34zhJ1FWFZ865eDtyLe7MB2205Kg0qPrU+3so/VhaW6DWdRZR9IeED1Ekh5S40LLDnHuiA6jK0eq8AArLnHtKpERTJovhr3NvVfVWWUZR3IcFng+iLuWKjTxd2/4uiQmyiKvZsTvXFlaaacEpzHlKhb4+c6KAQgLbpAm9QCFQ9IADc3MVedj7pTk49ZcF3R0LNEh7Upb99k1k5BIL11JfsquSrQ+hhoEgOP81LCmj9uyeIwTevLyTtqNuURdpGHttyH5I7p9f3k1GKdP/c6kJZikXNkjGaroAgFmWlJZzs23F+xW+a0fnrWx1FnXIk+V7stM06XPJitrnYXAVvTW4JHw+T6kX2UIpt+B5oLi3U4dKtANGJadcw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR11MB4864.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(366004)(39860400002)(396003)(346002)(376002)(136003)(451199021)(2906002)(31686004)(5660300002)(8676002)(8936002)(41300700001)(7416002)(316002)(6916009)(4326008)(66946007)(66556008)(66476007)(54906003)(6666004)(6486002)(478600001)(26005)(6512007)(6506007)(966005)(53546011)(38100700002)(83380400001)(31696002)(86362001)(2616005)(186003)(36756003)(82960400001)(45980500001)(43740500002);
 DIR:OUT; SFP:1102
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aVJjRDF6N1UwcG9rZ2hMWi9qNmNRUDBOaUlJNG1FZHBlTWZ3aVR3bjRUSHZF?=
 =?utf-8?B?RWNTeDRRS2JuazVycGpPWEZvU3IzdE9vekRLZjJWUGJIc0tCeHhodW9pUnpR?=
 =?utf-8?B?Skl6TFFwWUJQY2JFSFpQc1RaSGZCUzFmVEZINHBHU2RlVm5EZ25KYUdTMGg4?=
 =?utf-8?B?Mm5RWTdjL0hOOXllaUhCV0svWG5LNEQvMHo1K1RJcU96K1B1NW5hN0RmWFRY?=
 =?utf-8?B?S1c4Q2NLajFQVitUSmFTM1RSWTZhTjJqWHlhdkk0cm52Q3hjeEZEWnk3c1k4?=
 =?utf-8?B?Y240K3h3ZkgwcDQwNGxGbzBzelhRaGxMMWZaVWVVTklSeTBkaW5HTTNzQU1Y?=
 =?utf-8?B?RGhhWVZGRk9rZ0hJSTlQQ1dKUzJjdlpKbWRWWVlFSXlrVE9ZMWhqenUxT09s?=
 =?utf-8?B?dDd4MjJDOUtJVXVPbmxHd0xlRTRacEZqOUZZQXVrZTZwTzVZc2RRVmVMMXJ2?=
 =?utf-8?B?Q2VCOTllRVZSQWNoQTJkMjZxT25QeEE2RzVaY0hESGcvMFRQWEVpNVdpZGtN?=
 =?utf-8?B?OVVLYmpVQTJDRlh2dkVtRnFZVWJkV0hXSHpXdFQvUlpwWFNvdUtwQ2M2MGtk?=
 =?utf-8?B?V0dtUjlCdzJpNDdJRmdsUUlkWXQxRkc0Tk9ybkFWSCtVdlJLMzFnWG42Tmww?=
 =?utf-8?B?d2lZL3hRZnlRSDU1dFpnekxxemdWT0VLZ3NqUEI5RUFZOWN2azA2Qi9CeDlv?=
 =?utf-8?B?UW5OS21TY29ZQTRFaVNlbXNrOGM3TENMWjFVcWNVTUJvZFRGWEFWeXB2R1NZ?=
 =?utf-8?B?VzR2MjYzYWVDeDc5ek5MU0VJUStoUE5IUVIraUpObG16aFQyTVc2b09LdmxW?=
 =?utf-8?B?N0lnSk1kdG03MTBFYkVVL0lEam9ybnhBNUtXNytzVlZRVlV5R2w4Q3lFUTVV?=
 =?utf-8?B?RSs0RnFOR3RxemtLMXJ3WElZQytxV0V4S0p4cWNhK0lTTXBkLzBpelE4ejVJ?=
 =?utf-8?B?U3M1cDFNUWsxaXdSSDdYaHZ5WU16NWtjZE85Zm95VXhHUXNjS0JzbFZMZVF2?=
 =?utf-8?B?OHg3YkhYZThYSjJNb0xqOG4rWi9OaVNabHBrNmk0ZG9aclhoaGlnVTBsRTdT?=
 =?utf-8?B?SUJScUcxQWRFNGxrM09rcTI3RFUyaHRSdzV0OWtpdDYwVWhySUlTbkZESk51?=
 =?utf-8?B?NWFxQWc1cWU5OWJpcmZnNVRodTZ1bGpOWWdnK0NMM2FjWFFsRmJRUDhpUEJL?=
 =?utf-8?B?MEx2cVUzQnlvVVI5amVwSjlnRFpnR0Y4RUZIdVk5SEtYWlF3elhaMG9oakQ0?=
 =?utf-8?B?alpwbTZwWHBOQ2M5YTJTNkdZaktNcVduQkNxSVl1bUcyeEJsS0w0dFFqUlZu?=
 =?utf-8?B?bDRUVjg5STR5c29zY3hTYURwNC9VWXVkdU5iY2NWaHRWTkUrMEpqYitQTjVM?=
 =?utf-8?B?eU9TRlhjWEJIWlY1RFVVeExFSGVrc2xRR0F4dDRSNnNIWk1WSXhkM0NoMjJv?=
 =?utf-8?B?ZHl1ejFRK09ZRld3ckI0MWt0SE9GcjhMYmFpUHV1TC91cWZ5c3l2RjhhVXVo?=
 =?utf-8?B?TVhaM01mbWFQdU5GVHBqbjV5S0VkTU40QXJWa2VyWWJod0xFZjVOamtvcUFy?=
 =?utf-8?B?TjR0c1VtNGFWZklEelRtMmh3QmpjZXRzQmVkcFI4SjV5V1Y3SzlxUVpVK0wz?=
 =?utf-8?B?UVFicFhqak8vSlRmek4yelRPK0R6TGhMLytRNWNyTWgwK1FCRHR4UjMrN3Vq?=
 =?utf-8?B?R3Z2NFY1NzB3ampuMnY0YXBBdi9QSGZ3SWM4Y1FMZ0FER0RDTDhOT20rMTZX?=
 =?utf-8?B?dnBtREg3dktXdWNOdWNPb2JydnNTbUd6M0VuTHpqbHZvRi94NHJPRVpPNjBE?=
 =?utf-8?B?WUZDSWNBYmMzbHpTaDJIYWw4RERjMnBjWFd6eFY2dFppMWlSTWs4aUxNc3Ez?=
 =?utf-8?B?UG9pMU9aZXFIeUVqWHp0RmI2VzgxNGRUNWlDd1RoTmZXbmlJT1FRVUV1WERx?=
 =?utf-8?B?c2pHNFJ1RnRjTjZ0Y1ZBOC9DN1dwaGFiSE1SZ3V5cXJBdkFMVU02bVRTcS84?=
 =?utf-8?B?VHlpVVE3b2wzWGgrTkpCSlNydzdUOTdSYTd2aVY4dmRNQXRXTktNaGpYTU40?=
 =?utf-8?B?K2lLbVRRVHBOR1B2S2FDQ3hzYkY4bUhVR1lodmtSbzVNUkNmNzlYTlcwN2Q2?=
 =?utf-8?B?UFFFOG1DZ0p1Sm9IeUVSYnAwRXpENEdQNkNPQWRLeWc2VDZiZENtL1lMQTFF?=
 =?utf-8?B?NHc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 887ef364-270a-473d-eb9c-08db67a37ef1
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB4864.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jun 2023 22:06:51.1843 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JzcgpL6nmrFwIhbjtwcOpC+XuN5s/rQIDdf2JjyFgtMFKdypvA/1pqIP2SbD8LBZ0Gn/SFhv/J9xzh2Mi6YMu3C3Y/QuSFj5d7//Eu3OsjU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5940
X-OriginatorOrg: intel.com
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Subject: Re: [dm-devel] [PATCH v8 12/12] crypto: x86/aes-kl - Implement the
 AES-XTS algorithm
X-BeenThere: dm-devel@redhat.com
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: device-mapper development <dm-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/dm-devel>,
 <mailto:dm-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <http://listman.redhat.com/archives/dm-devel/>
List-Post: <mailto:dm-devel@redhat.com>
List-Help: <mailto:dm-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/dm-devel>,
 <mailto:dm-devel-request@redhat.com?subject=subscribe>
Cc: x86@kernel.org, herbert@gondor.apana.org.au,
 "David S. Miller" <davem@davemloft.net>, ardb@kernel.org,
 dave.hansen@linux.intel.com, dan.j.williams@intel.com,
 linux-kernel@vger.kernel.org, charishma1.gairuboyina@intel.com,
 mingo@kernel.org, lalithambika.krishnakumar@intel.com, dm-devel@redhat.com,
 Ingo Molnar <mingo@redhat.com>, bp@alien8.de, linux-crypto@vger.kernel.org,
 luto@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, bernie.keany@intel.com,
 tglx@linutronix.de, nhuck@google.com, gmazyland@gmail.com, elliott@hpe.com
Errors-To: dm-devel-bounces@redhat.com
Sender: "dm-devel" <dm-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: intel.com
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"

On 6/6/2023 10:35 PM, Eric Biggers wrote:
> On Sat, Jun 03, 2023 at 08:22:27AM -0700, Chang S. Bae wrote:
> 
> Can you also mention why you are doing this?  I suppose it might as well be
> done, but I'm not seeing how it would actually matter.

While this crypto implementation is in the kernel mode, userspace can 
call it:
     https://docs.kernel.org/crypto/userspace-if.html

And those AES instructions are executable in userspace.

Say someone takes a key handle out of the kernel code and then decrypts 
some disk image from userspace. At least, this is enforced not to do.

> What other sorts of key usage restrictions does AES-KL support?  Are any other
> ones useful here?

Besides this, there are additional bits to restrict using encryption and 
decryption respectively.

This can be found in Section 1.1.1.1 'Handle Restrictions' in its 
whitepaper:
 
https://www.intel.com/content/www/us/en/develop/download/intel-key-locker-specification.html

>> Subsequently the key handle could be corrupted or fail with handle
>> restrictions. Then, encrypt()/decrypt() returns -EINVAL.
> 
> Aren't these scenarios actually impossible?  At least without memory corruption.

Yes, in the dm-crypt path, I think. But, the key handle can be tainted 
in the userspace -> API path.

I think this may help users as this feature can do some integrity checks 
at first and then populate an error right away if it goes wrong.
>> Thus, advertise it with a unique name 'xts-aes-aeskl' in /proc/crypto while
>> not replacing AES-NI under the generic name 'xts(aes)' with a lower priority.
> 
> The above sentence seems to say that xts-aes-aeskl does *not* have a lower
> priority than xts-aes-aesni.  But actually it does.

No, it does not say that. This needs to call out the latter part more 
clearly.

>> Then, the performance is unlikely better than 64-bit which has already a gap
>> vs. AES-NI.
> 
> I don't understand what this sentence is trying to say.

This is in another section for explaining why 64-bitness only. I kinda 
added another point to avoid 32-bit code. But, anyways it is known that 
32-bit kernel mode is being deprecated. Then, the 128-bit register story 
seems to be enough there.

>> +config AS_HAS_KEYLOCKER
>> +	def_bool $(as-instr,encodekey256 %eax$(comma)%eax)
>> +	help
>> +	  Supported by binutils >= 2.36 and LLVM integrated assembler >= V12
> 
> It looks like arch/x86/Kconfig.assembler would be a better place for this.

Yeah, the commit 5e8ebd841a44 ("x86: probe assembler capabilities via 
kconfig instead of makefile") moved those over there.

>> +
>> +#define IN1	%xmm8
>> +#define IN	IN1
> 
> Why do both IN1 and IN exist?  Shouldn't there just be IN?

Oh, this is a silly leftover from the CBC code as it has multiple inputs.

#define IN %xmm8 then, s/IN1/IN/g

>> +
>> +#define AREG	%rax
> 
> Shouldn't %rax just be hardcoded?

I thought this (or any other) renaming helps to read. Maybe I'm missing 
something. Can I get to know your thought on this?

>> +#define HANDLEP	%rdi
> 
> This should be called CTX, to match the function prototypes.
> 
>> +#define UKEYP	OUTP
> 
> This should be called IN_KEY, to match the function prototypes.

Okay. But, OTOH, the prototype itself is somewhat generic. Then its 
argument naming does not always match with what is supposed to be meant 
in the code. Thus, AES-NI renamed those like

     ctx    -> KEYP
     in_key -> UKEY
     ...

So, another option can be leaving some comments there, e.g. '# ctx is 
renamed to KEYP'.

>> +
>> +.Lsetkey_end:
>> +	movdqu STATE1, (HANDLEP)
>> +	movdqu STATE2, 0x10(HANDLEP)
>> +	movdqu STATE3, 0x20(HANDLEP)
> 
> The moves to the ctx should use movdqa, since it is aligned.

Reading the manual, the difference is whether generating #GP or not when 
any misaligned memory operand comes. Then, MOVDQA all here seems to be 
saying please check the alignment every time.

But, HANDLEP is known to have an aligned address. Then, the plain move 
seems to be enough and coherent with the glue code -- avoid unnecessary 
sanity checks.

>> +
>> +	xor AREG, AREG
>> +	FRAME_END
>> +	RET
>> +SYM_FUNC_END(__aeskl_setkey)
> 
> This function always returns 0, so it really should return void.

Yeah, fair enough.

> In the common case (successful AES-256 encryption) this is executing 'jmp'
> twice.  I think the code should be rearranged to eliminate these jmps.

Ah, right. I think a good point! Let me tweak this for those most likely 
cases.

> __aeskl_xts_encrypt() and __aeskl_xts_decrypt() are very similar.  To reduce
> code duplication, can you consider generating them from a macro that takes an
> argument that indicates whether it is encrypt or decrypt?

Yeah, I can see the code that prepares operands is common between them. 
But, I'm not sure folding them together can make it more readable.

> Something that your AES-KL code does that's a bit ugly is that it abuses
> 'struct crypto_aes_ctx' to store a Keylocker key handle instead
> of the actual AES key schedule which the struct is supposed to be for.
> 
> The proper way to represent that would be to make the tfm context for
> xts-aes-aeskl be a union of crypto_aes_ctx and a Keylocker specific context.

Agreed. I think this is likely the fallout of that struct aesni_xts_ctx 
fix. Previously, the field was a byte array which itself is not 
necessarily representing the extended-key format. Now the fix changed it 
to be more specific. Accordingly, Key Locker has to specify it.

Thanks,
Chang

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

