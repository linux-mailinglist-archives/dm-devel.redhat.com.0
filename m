Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E8166FBC32
	for <lists+dm-devel@lfdr.de>; Tue,  9 May 2023 02:56:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1683593763;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=+9r17JssIrVxfVAAUY9pqk/Y/2K3e0VM1VtnzziWfHk=;
	b=f3/kW1FuzhscGfxkPihlziF3hjSC6D18mcpCX0Z3FsrwaTCI50IS+us415bQBRn+rQ+YTD
	/h9xulYP6uEKv9eyo6p7a7mEpZcN5gPFcET/0sTeeeYKKyP3Ng+jaI+b3LpBd2gvhvlcmV
	/5Oo1YQ1REOVVsyAUZBu4h3zc18yvZM=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-657-tZ8ZxzFpNV6uWkwmsIyPYg-1; Mon, 08 May 2023 20:55:51 -0400
X-MC-Unique: tZ8ZxzFpNV6uWkwmsIyPYg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 56F2E3C0F372;
	Tue,  9 May 2023 00:55:48 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id B93CF2028B5E;
	Tue,  9 May 2023 00:55:47 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 2B30719452D1;
	Tue,  9 May 2023 00:55:47 +0000 (UTC)
X-Original-To: dm-devel@listman.corp.redhat.com
Delivered-To: dm-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id B75C819452C4
 for <dm-devel@listman.corp.redhat.com>; Tue,  9 May 2023 00:55:45 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 9A5ED40C6F42; Tue,  9 May 2023 00:55:45 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9191A40C6F41
 for <dm-devel@redhat.com>; Tue,  9 May 2023 00:55:45 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 735C8101A55C
 for <dm-devel@redhat.com>; Tue,  9 May 2023 00:55:45 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-662-D9sgzt3pP7yg8rSSRH-QbQ-1; Mon, 08 May 2023 20:55:41 -0400
X-MC-Unique: D9sgzt3pP7yg8rSSRH-QbQ-1
X-IronPort-AV: E=McAfee;i="6600,9927,10704"; a="339009392"
X-IronPort-AV: E=Sophos;i="5.99,259,1677571200"; d="scan'208";a="339009392"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2023 17:55:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10704"; a="945068462"
X-IronPort-AV: E=Sophos;i="5.99,259,1677571200"; d="scan'208";a="945068462"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga006.fm.intel.com with ESMTP; 08 May 2023 17:55:38 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Mon, 8 May 2023 17:55:37 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Mon, 8 May 2023 17:55:37 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.107)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Mon, 8 May 2023 17:55:37 -0700
Received: from PH0PR11MB4855.namprd11.prod.outlook.com (2603:10b6:510:41::12)
 by BL3PR11MB6410.namprd11.prod.outlook.com (2603:10b6:208:3b9::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.33; Tue, 9 May
 2023 00:55:32 +0000
Received: from PH0PR11MB4855.namprd11.prod.outlook.com
 ([fe80::cfb2:e73:907d:cb77]) by PH0PR11MB4855.namprd11.prod.outlook.com
 ([fe80::cfb2:e73:907d:cb77%5]) with mapi id 15.20.6363.032; Tue, 9 May 2023
 00:55:32 +0000
Message-ID: <08da7a0a-6b66-2c0e-eb56-96b5ee8faa30@intel.com>
Date: Mon, 8 May 2023 17:55:29 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
To: Eric Biggers <ebiggers@kernel.org>
References: <20220112211258.21115-1-chang.seok.bae@intel.com>
 <20230410225936.8940-1-chang.seok.bae@intel.com>
 <20230410225936.8940-11-chang.seok.bae@intel.com>
 <ZFWQ4sZEVu/LHq+Q@gmail.com>
From: "Chang S. Bae" <chang.seok.bae@intel.com>
In-Reply-To: <ZFWQ4sZEVu/LHq+Q@gmail.com>
X-ClientProxiedBy: BYAPR06CA0058.namprd06.prod.outlook.com
 (2603:10b6:a03:14b::35) To PH0PR11MB4855.namprd11.prod.outlook.com
 (2603:10b6:510:41::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB4855:EE_|BL3PR11MB6410:EE_
X-MS-Office365-Filtering-Correlation-Id: 3ed1f339-dcc6-485f-bfcf-08db5028173b
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0
X-Microsoft-Antispam-Message-Info: yAN0CyfLiivzUeVGvmNY5q+golORL20Mx96G2hLS+u6ZgMIjhibr5D/B/NBp5MA/OLbXKNIEEPZIWsoymPu8/tvar51KxVwODHisWYLJrNn1uHkGuk0RkCJbG5srrTUKMppu1XaVqG6nkWVlUhmdR+Gq/HvJ1zp2i2yck5iDBcKKOxlD9wSmNTyWm83c2K/MWYKYDBhwuTVWspM7L3/6Tq00RK4Df3RRzFeJoc+SLhFt9AAI5/mJRpRm0TxlE2uRRJxDSENP7wuUi08Lq5K637VNctA9NEOIbkX+9dvKEwqp40mVRVVgNu6Fn+GTLP9Go+gLNNEEv5E9Srn0z5E45UK2J12cJcmG+Puda8QHC7FDFsvxFfSUq5OtJ3HT53b8QU5nZaAAXVdYTOY5rcw5vr1rednftfgTJ6+JxlWtax66iDkxZziafh3bjRkgurM3Ts4V6jp5aebIlZWNvzgUDLNKmoME8YITamZrDo2Pctxbqihk/gXXFxNzapzdsPl0A4D3pXuyTNEDCS6/NjiRLVeaWXEMmDomms1jL65l/UvD4GEdePYB50N19iwPnN/Tcz3822PoGj8vv9obtNUEORbD2imTXporRMceYQ2OEqKgpM+QqEFgKNDH60n7XpSmqOt13D05fVk25xHbqRyTRQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB4855.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(376002)(366004)(346002)(39860400002)(396003)(136003)(451199021)(6486002)(6666004)(478600001)(83380400001)(2616005)(26005)(6506007)(6512007)(186003)(53546011)(36756003)(38100700002)(82960400001)(86362001)(31696002)(966005)(66946007)(5660300002)(66556008)(66476007)(7416002)(316002)(8676002)(31686004)(8936002)(41300700001)(6916009)(4326008)(54906003)(2906002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UzBWNmRkeWxZOTRJMlp2NG1Nd3N4RzhzRTA0ajZkU3hZYXFzUFFmcS9GQzlV?=
 =?utf-8?B?Z2xGMWpFQ0FPRHlaekFUVzRYNU9USjBLbnpqYWNRVHBDUlpLRi9iR0lBQWMy?=
 =?utf-8?B?S25GQlNHMWdTdTQ0TGJPdE00dzlIOE5NTVNCM0tERUJyajBZOGhiTElTVERM?=
 =?utf-8?B?OUZ6dy9DZmlzOEFTcWRrdjVOdGtIRENZRCs4UE10MW1Ta0lvRC9YOGpCSTc3?=
 =?utf-8?B?c1h0eTJHZDgxa040RWRkTFNIb2ZhazI1QzNUbFNob1NOeUxJM2ZlY2xtNnYr?=
 =?utf-8?B?TERYQmNTbHphOEgzcXVROUZmVU5xb3FpOTJBK1ZOb0o1cWczbnZwZ3FLdkZX?=
 =?utf-8?B?T24rZm11UW9YQmVWL0wrcjhyOGYxbXZGL3ZrbDJaR1o2LysrMFY5Qis1cWlp?=
 =?utf-8?B?ZWwycG5QaWM1MnpHd0FPYnoxUmVaQ2hQV29wNEJsRjlnQ0RmV05GUm1Na3ZS?=
 =?utf-8?B?b1hCWER0QllhemtVM085aWVCTEExQWlOT0RrV2o2MDZHQ0pxeHhhVGVHM29W?=
 =?utf-8?B?Q0h1VG1vOXZJd2g4YlhCa2FiSmI4Q3NMMnJ2TGdlQThxNUk0TGpNanZMcUVT?=
 =?utf-8?B?akRqTVBod2tOS3lFdGZaTUUyRkZ4c3hUWGxEcStPcWxtcm9UUXd0eVk0L0Jp?=
 =?utf-8?B?NjBkblZVT29EN2grYUVmVnZkK2F4MmdQUUQvMnpWRU5Oci9mdkp0elRmUHIz?=
 =?utf-8?B?VlZYZ2J5Qm5JWWJIckRtY0FySEE0Zm5zLzFmbU1HYzZ3MGxwakdDYnBTTHI2?=
 =?utf-8?B?aDBxMERSWm1yV0I0TGJnNGF2RWRGNS9YKzhIRmRzdU9SeWlaQ0wzeW85TWM4?=
 =?utf-8?B?cElHS1laR2tUWkpPVTBZSXEzWnRmMUlHOVFneVNUVm5vNTk3VitmYkJnM0xr?=
 =?utf-8?B?UXNsaVhBWWcxT0JDU3AzZGpSRTJNNnpobVdiS3lGaG91L09lOVp3MHIvRGJV?=
 =?utf-8?B?dzVlMWwyN002QnZlL3I3bC9lSjU0RExZYlFZcUJSVUl3K0pWZVdRbmZvdCtt?=
 =?utf-8?B?TkMyd0Q5L0V1VS9tV1JDeG03K05EVktXYWtPWnlnRE1IVGIvSGtjdzNHKzNH?=
 =?utf-8?B?ZHJnOU9aNW9VVGdqSXZuN05FY1RxanMySndEb1hNTFBmUnBOQ1NQeUVJelVs?=
 =?utf-8?B?cWp1d09JM1I1VURHYkhHVFpjd3VaWEpsUEtHNHV5ZlAwdW00eU1ITWQzOHMz?=
 =?utf-8?B?cjFkRnN3dHpBQVBIaFg4RWloNG5tRlRNWUVnczRrMUtsckZNdnJzc0FqcjRu?=
 =?utf-8?B?bjB4NlltVyt3aG11VkdSOVlQV2x4eGJjMzhGSU4rbmNuNm1lclo1SlQ3ZGty?=
 =?utf-8?B?ak96Vis1dFdqcmVvU3AwbUNUSUE0MWc1d2l5OEZZeHFqRFV4a3MzYnM1ZmlH?=
 =?utf-8?B?QWFHOTJiSGtIL0JkUGlUS2tFeERSdlJoSnBkSE9PeWhvNy9MbjhnS3lOaFdl?=
 =?utf-8?B?YXF6SU01aERYRnBwVVpmUk8wTExzbXd2OExQR09VUGxrMGtRaFl5VjFmbUJ5?=
 =?utf-8?B?TGVhUWNwYW1KK1EwZXpQY1RsaU9Ub3JGdWFwc3lhalZyUkIzSzFUSmIrdGFS?=
 =?utf-8?B?c2txcDZwNTlwSmt2YUtoU3VjMEtSeXlUNHpsMVBhZk5UblJpdHNGNGRrdnNr?=
 =?utf-8?B?QmZuYWkvNVBSL1RldEV5cXkzdjY5Yk1XMG5oN3dRdFNycmxmbDc1YUFBK2tk?=
 =?utf-8?B?dlFGQXJVTjVQM240K01sbktUUXhpVnAyTTFBejZYSEZaWmRNUXIrYnY0ZnV2?=
 =?utf-8?B?bkpnQlNsM1QxQ3g5T01NMEVTbjROL0gzOEhsYXE2N2N5Vm9wL1FxeUVmQWVv?=
 =?utf-8?B?ajVEWG9udWt2aVpVTUJhZW91d3RIaHhlay85WkwwL21OUlZudFZ4UXdveU16?=
 =?utf-8?B?VHpHTDErMWIySUR5cDVGOWw2aWRIMVpvMzhCZXhMZ1hFbGRHMmlCTUNyMUJL?=
 =?utf-8?B?bVA5ZGI3MlA2ZE54WllkbHNuNkJtR1EyZjQ0RkFLdFZpbThxYjhCaURFclFK?=
 =?utf-8?B?TUpPT2NldnhiT0krcXorNjU5TUJXcFBGU3FOVld1V0cwVzdDVjczVEpuN1J5?=
 =?utf-8?B?WDl2MHVDUTB4ZHEzWkl5UVN3dkVrL1pscGJheWJqVjBSdVJBMWw2bGZibHJm?=
 =?utf-8?B?ZXJmN1ZFYXpuT1QramJrb2JGWUgyc0p4cFV4aFlDNFdaOHRpSmFjZnRrMU9r?=
 =?utf-8?B?dGc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ed1f339-dcc6-485f-bfcf-08db5028173b
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB4855.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2023 00:55:32.4897 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dsMRBLTMDhoRRTXbpi+2CeKoWMtRNj34kAhZvOwVcI+uqfOWd5YfzUl8XgRXU9/igEBCOXpCg9hnas5pgpuo6gsjlY9m25YFMTQ6NXA2Nao=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR11MB6410
X-OriginatorOrg: intel.com
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Subject: Re: [dm-devel] [PATCH v6 10/12] crypto: x86/aes - Prepare for a new
 AES implementation
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
 linux-kernel@vger.kernel.org, mingo@kernel.org,
 lalithambika.krishnakumar@intel.com, dm-devel@redhat.com,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 linux-crypto@vger.kernel.org, luto@kernel.org,
 "H. Peter Anvin" <hpa@zytor.com>, bernie.keany@intel.com, tglx@linutronix.de,
 gmazyland@gmail.com, charishma1.gairuboyina@intel.com
Errors-To: dm-devel-bounces@redhat.com
Sender: "dm-devel" <dm-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: intel.com
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"

On 5/5/2023 4:27 PM, Eric Biggers wrote:
> On Mon, Apr 10, 2023 at 03:59:34PM -0700, Chang S. Bae wrote:
>> Refactor the common C code to avoid code duplication. The AES-NI code uses
>> it with a function pointer argument to call back the AES-NI assembly code.
>> So will the AES-KL code.
> 
> Actually, the AES-NI XTS glue code currently makes direct calls to the assembly
> code.  This patch changes it to make indirect calls.  Indirect calls are very
> expensive these days, partly due to all the speculative execution mitigations.
> So this patch likely causes a performance regression.  How about making
> xts_crypt_common() and xts_setkey_common() be inline functions?

I guess this series is relevant:
   https://lore.kernel.org/lkml/20201222160629.22268-1-ardb@kernel.org/#t

Yeah, inlining those looks to be just a cut-and-paste work. Then I was 
curious about the performance impact.

So I picked one of my old machines. Then, I was able to quickly run 
through with these cases:

$ cryptsetup benchmark -c aes-xts -s 256

# Tests are approximate using memory only (no storage IO).
# Algorithm |       Key |      Encryption |      Decryption

Upstream (6.4-rc1)
     aes-xts        256b      3949.3 MiB/s      4014.2 MiB/s
     aes-xts        256b      4016.1 MiB/s      4011.6 MiB/s
     aes-xts        256b      4026.2 MiB/s      4018.4 MiB/s
     aes-xts        256b      4009.2 MiB/s      4006.9 MiB/s
     aes-xts        256b      4025.0 MiB/s      4016.4 MiB/s

Upstream + V6
     aes-xts        256b      3876.1 MiB/s      3963.6 MiB/s
     aes-xts        256b      3926.3 MiB/s      3984.2 MiB/s
     aes-xts        256b      3940.8 MiB/s      3961.2 MiB/s
     aes-xts        256b      3929.7 MiB/s      3984.7 MiB/s
     aes-xts        256b      3892.5 MiB/s      3942.5 MiB/s

Upstream + V6 + {inlined helpers}
     aes-xts        256b      3996.9 MiB/s      4085.4 MiB/s
     aes-xts        256b      4087.6 MiB/s      4104.9 MiB/s
     aes-xts        256b      4117.9 MiB/s      4130.2 MiB/s
     aes-xts        256b      4098.4 MiB/s      4120.6 MiB/s
     aes-xts        256b      4095.5 MiB/s      4111.5 MiB/s

Okay, I'm a bit more convinced with this inlining. Will try to comment 
this along with the change.

> Another issue with having the above be exported symbols is that their names are
> too generic, so they could easily collide with another symbols in the kernel.
> To be exported symbols, they would need something x86-specific in their names.

I think that's another good point though, they don't need to be exported 
once moved into the header so that inlined.

>>   arch/x86/crypto/Makefile           |   2 +-
>>   arch/x86/crypto/aes-intel_asm.S    |  26 ++++
>>   arch/x86/crypto/aes-intel_glue.c   | 127 ++++++++++++++++
>>   arch/x86/crypto/aes-intel_glue.h   |  44 ++++++
>>   arch/x86/crypto/aesni-intel_asm.S  |  58 +++----
>>   arch/x86/crypto/aesni-intel_glue.c | 235 +++++++++--------------------
>>   arch/x86/crypto/aesni-intel_glue.h |  17 +++
> 
> It's confusing having aes-intel, aesni-intel, *and* aeskl-intel.  Maybe call the
> first one "aes-helpers" or "aes-common" instead?

Yeah, I can see a few files named with helper. So, maybe 
s/aes-intel/aes-helpers/.

>> +struct aes_xts_ctx {
>> +	u8 raw_tweak_ctx[sizeof(struct crypto_aes_ctx)] AES_ALIGN_ATTR;
>> +	u8 raw_crypt_ctx[sizeof(struct crypto_aes_ctx)] AES_ALIGN_ATTR;
>> +}; >
> This struct does not make sense.  It should look like:
> 
>      struct aes_xts_ctx {
>              struct crypto_aes_ctx tweak_ctx AES_ALIGN_ATTR;
>              struct crypto_aes_ctx crypt_ctx AES_ALIGN_ATTR;
>      };
> 
> The runtime alignment to a 16-byte boundary should happen when translating the
> raw crypto_skcipher_ctx() into the pointer to the aes_xts_ctx.  It should not
> happen when accessing each individual field in the aes_xts_ctx.

Oh, ugly. This came from mindless copy & paste here. I guess the fix 
could be a standalone patch. Or, it can be fixed along with this mess.

>>   /*
>> - * int aesni_set_key(struct crypto_aes_ctx *ctx, const u8 *in_key,
>> - *                   unsigned int key_len)
>> + * int _aesni_set_key(struct crypto_aes_ctx *ctx, const u8 *in_key,
>> + *                    unsigned int key_len)
>>    */
> 
> It's conventional to use two leading underscores, not one.

Yes, will fix.

Thanks,
Chang

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

