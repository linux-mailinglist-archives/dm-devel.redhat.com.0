Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id D728F7B3BC5
	for <lists+dm-devel@lfdr.de>; Fri, 29 Sep 2023 23:06:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1696021566;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=PtixOyw2SLN3BDh8eGFU2gW1mdN/HH8xTeaSRBJx/CM=;
	b=cA1pae/tASGVk9tmHsmHnAqpkut0P+YdLk0FEt5++Z9mJzLC7bxjzy941DdrjDVprURbLD
	8FSYF8SYgyA92EC9H7Cox1Xdm9pUbosUQDlLUbpSYDC/aPMMXmWHZLtbYMdCfzzH7o+oVH
	NGD/3yZhaU2l1mJuJ7AJVKlBbzBuG5o=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-113-pOVbIdfHPdapc2AbK5IrYQ-1; Fri, 29 Sep 2023 17:06:02 -0400
X-MC-Unique: pOVbIdfHPdapc2AbK5IrYQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DCAA2101A529;
	Fri, 29 Sep 2023 21:05:59 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E63C5176E4;
	Fri, 29 Sep 2023 21:05:54 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 9C07219465BA;
	Fri, 29 Sep 2023 21:05:53 +0000 (UTC)
X-Original-To: dm-devel@listman.corp.redhat.com
Delivered-To: dm-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 60F7C1946586
 for <dm-devel@listman.corp.redhat.com>; Fri, 29 Sep 2023 21:05:06 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id D8693176EA; Fri, 29 Sep 2023 21:05:05 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast07.extmail.prod.ext.rdu2.redhat.com [10.11.55.23])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CF9A4170E9
 for <dm-devel@redhat.com>; Fri, 29 Sep 2023 21:05:05 +0000 (UTC)
Received: from us-smtp-inbound-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 829833C11CC9
 for <dm-devel@redhat.com>; Fri, 29 Sep 2023 21:05:05 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-475-YzY_jDL-Mqytssecj6EHIA-2; Fri, 29 Sep 2023 17:05:03 -0400
X-MC-Unique: YzY_jDL-Mqytssecj6EHIA-2
X-IronPort-AV: E=McAfee;i="6600,9927,10848"; a="448870630"
X-IronPort-AV: E=Sophos;i="6.03,188,1694761200"; d="scan'208";a="448870630"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2023 14:04:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10848"; a="840414243"
X-IronPort-AV: E=Sophos;i="6.03,188,1694761200"; d="scan'208";a="840414243"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by FMSMGA003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 29 Sep 2023 14:04:52 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Fri, 29 Sep 2023 14:04:51 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Fri, 29 Sep 2023 14:04:51 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.176)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Fri, 29 Sep 2023 14:04:51 -0700
Received: from CY5PR11MB6366.namprd11.prod.outlook.com (2603:10b6:930:3a::8)
 by DS0PR11MB7829.namprd11.prod.outlook.com (2603:10b6:8:f1::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.28; Fri, 29 Sep
 2023 21:04:48 +0000
Received: from CY5PR11MB6366.namprd11.prod.outlook.com
 ([fe80::4c02:d735:4942:ad0c]) by CY5PR11MB6366.namprd11.prod.outlook.com
 ([fe80::4c02:d735:4942:ad0c%4]) with mapi id 15.20.6813.017; Fri, 29 Sep 2023
 21:04:48 +0000
Date: Fri, 29 Sep 2023 22:04:37 +0100
From: Giovanni Cabiddu <giovanni.cabiddu@intel.com>
To: Mikulas Patocka <mpatocka@redhat.com>
Message-ID: <ZRc75XGd92MgaVko@gcabiddu-mobl1.ger.corp.intel.com>
References: <af9581e2-58f9-cc19-428f-6f18f1f83d54@redhat.com>
 <ZQ2vJNs/7ZzY44z1@gcabiddu-mobl1.ger.corp.intel.com>
 <ed935382-98ee-6f5d-2f-7c6badfd3abb@redhat.com>
In-Reply-To: <ed935382-98ee-6f5d-2f-7c6badfd3abb@redhat.com>
Organization: Intel Research and Development Ireland Ltd - Co. Reg. #308263 -
 Collinstown Industrial Park, Leixlip, County Kildare - Ireland
X-ClientProxiedBy: DUZPR01CA0091.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4bb::26) To CY5PR11MB6366.namprd11.prod.outlook.com
 (2603:10b6:930:3a::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6366:EE_|DS0PR11MB7829:EE_
X-MS-Office365-Filtering-Correlation-Id: 1621498c-138b-4bf3-7acd-08dbc12fb71e
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0
X-Microsoft-Antispam-Message-Info: Qofyzz8k5NRxX4Q/B4CA4A28Ixea2JQ83yqAkLEa2L1LZCMXSX+bCTaW7OzkKIFEEjfVjIyRkp/UvI0VGwRWjWQkgBgsTahK0u4D5LB7k4NV5WhKJMcrJyvMPKjMhEa9KiohZpBrKB8exG7tWYJCV+SGGBkhzjviGGMEn3r8hKSLgJUrCnFH6cZlsCEDSARAnWMVWp4lltb12VMTdX5TfaBqWZCzxgANDbygnO+kLdhPutMXWig7dYlFjByrZ6lyQrwy5uWndlFKSr8Hca/xFTF9Ztgy0qH1z4zd71dNHfgoD62Tx6XVTXiOxqf4aOGa7TcYM6yDz8EXZpXKESvpDhL/p50iFN1SfGuLGb1PTAglNghq5uiEdSyUPTVu+7TTldOcMkliE3EXR/ylBaH7KtFJh9Nd2NxmzH14I6VGB5ddsnp41DZQM8vGhzhyPbScY1LoJnfiCbJlE2CS8C5jed8Dxq1wuRgjVUZJOeGaLcZd3q/lrEu3oVwK/iSqoVL5foWJT53/9qCxaXrUzPRi/A4gM7G4xQXx1PGqWlWxmAk3klkmFTbpF15TxKwTqbXB28pzarsa5dgZtsxPlUp71g==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6366.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(346002)(396003)(366004)(376002)(39860400002)(230922051799003)(186009)(451199024)(64100799003)(1800799009)(84970400001)(966005)(6666004)(478600001)(83380400001)(26005)(82960400001)(6512007)(6486002)(36916002)(6506007)(2906002)(86362001)(5660300002)(44832011)(8936002)(4326008)(8676002)(316002)(38100700002)(66556008)(66476007)(66946007)(6916009)(41300700001)(54906003)(30864003);
 DIR:OUT; SFP:1102
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?moqf7ubP0qyiI6BhrMeLpuVUaeP+saFN7IzgdIp1FB4l4VqjQIsZwHvNqspG?=
 =?us-ascii?Q?F+J8tYGZxhNHz0RMNauxfol8ejITw1v1VnX5azD8duV13vOlsh7KU/hAC7fL?=
 =?us-ascii?Q?CO8lH6RnUN2sD1rmiTOgHMcdj9z5agUVNGE50wM+VD9t9X6xhJ/wTByQXCQz?=
 =?us-ascii?Q?/o77r6ia3SJ7fkGNcaq3qCsVT6f32ySVcodx5+SzyLlDiFZiqwVwR1yMZQzY?=
 =?us-ascii?Q?m90R6EU9e76Gnzdm1Y4bSKDflzDdpAVto2mPm+O9tdWFSYvkgZHfVBDe0A9K?=
 =?us-ascii?Q?dWVk1+DLZ5HaEMbbyRA6ojNscNcm05URbKZClOQRbKwH+5P8phrSl3es6RP0?=
 =?us-ascii?Q?INJtLXc4DWf3mojjgsqISQzF4P4ALLnx0jcXbKWAza7v9RxpIt+dvVRs8hLX?=
 =?us-ascii?Q?o6vSxMl3Knv2sOSlQVs61s3vRftmooEo7ICuwPwxVYpCD8j7VC5TnoFjhd18?=
 =?us-ascii?Q?eve7gfauecyUSUSpvAxgMGmxj3E+b1+RRv7rE6hd68Am0NxbznYiEcAEyc50?=
 =?us-ascii?Q?cfAmFVa0LsdEJcqxhY4xv6ZXxIgBLO9glZFadGfQ9EMRxYVOz+I0aC/Qs3CT?=
 =?us-ascii?Q?qrcnQUdsGLumlnPxdVx25V2rso/Zc4QmGcs58HKYdk5N9cdTIMLfREJN4JtV?=
 =?us-ascii?Q?oMEpA6XqjeZ1iB3r1fIkDtggO1wvbQrtu8W6e90PH3b0nGsJHV1RxUOOEXn3?=
 =?us-ascii?Q?K/w4ZbVZlI56shQrNK2oAcKymUd8anLU/z+q81W5RSW3WsUJHbWZFa047EHe?=
 =?us-ascii?Q?JINt8NiwyCfWShakCzCU55Dw72T68GGRTHMXQGNm6E209OkkEOW/FpqO83Ih?=
 =?us-ascii?Q?2pDk1GrA93AakkZYIxSWPIHDdqaJe6lItmoW5ZXePM6sqZM88CsBoqsNmYTN?=
 =?us-ascii?Q?vxfFfbtEfq9WSqN3ZnvOo8Mo+Pgp79f/GtmzjCkbC3NUkct5c/yI96GH45L/?=
 =?us-ascii?Q?O4f4G/vxwhUVQLgVZMmt+BqTubroRX7XyCUGUkteIgtWzYfLUZMmyOWayjaL?=
 =?us-ascii?Q?51KfvsZrOJxrS7tzOJUVxP9N/o1SzuNxXxlrn8vP69guFJlBvqd54EBEcNMB?=
 =?us-ascii?Q?OSZE/G4B8c9LCAEQe1Z0OwCli1AHFrTBMyerN+8h2EZHBnKxOUbXZn5yoWH4?=
 =?us-ascii?Q?gaB8DJ0+uyvbvNlmfM4n3CODtDzw191jHjnjXEKG5exyleUm4fJE+2wycwqN?=
 =?us-ascii?Q?0Cog3CeQkP8reFn+KOJGuP193OY+fC7rmrO87Um+B+tt3EjzFqhsV5+k1gOo?=
 =?us-ascii?Q?gtNKozBcU5oN/e+FIV/vFRpc0kaey2+nTF71O5bJHmwvWxoNuvflC1MrKgG7?=
 =?us-ascii?Q?oj92e7gIG7y/KYwTjVJ8e/BpdkxgSpXTBhyZwhRDNE6rr0Bc8oh26VKL2BX0?=
 =?us-ascii?Q?03bGGfsSHeWhc0pAnkKTvz7Ar4GE+S9uaUv2tHnIe5shoeMzqAObFsLziRIh?=
 =?us-ascii?Q?P5b5ccG6rViROtJIwFgMlg0f/u+auHr286vA4eHc6Civ2TmS1EloA8htmiVX?=
 =?us-ascii?Q?JxyRlNQLfGP97kztP4KVZxcOF10FCl3tZ+wsTiMfI4Bv9EyHUp/FRaW75Whm?=
 =?us-ascii?Q?HCRvbeilMnPY19JyWKIn7p+Hd5ZIc1uV9/trnT96MIp9bP0SVItheSp/Jovi?=
 =?us-ascii?Q?/g=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1621498c-138b-4bf3-7acd-08dbc12fb71e
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6366.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2023 21:04:48.5161 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jeXSHnhuM2Ydjd04yAAW3XrpqBc5otshDTtdyG7nSMBnWWK48U9NlT2K4UeSWvniYTwUQYcFFp3rlUCH4hc67Xe07ATdkeMQ/fxQE7Qc7/A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7829
X-OriginatorOrg: intel.com
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Subject: Re: [dm-devel] [PATCH v2] qat: fix deadlock in backlog processing
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
Cc: Herbert Xu <herbert@gondor.apana.org.au>,
 Michael Hrivnak <mhrivnak@redhat.com>, qat-linux@intel.com,
 dm-devel@redhat.com, linux-crypto@vger.kernel.org,
 "David S. Miller" <davem@davemloft.net>, Eric Garver <egarver@redhat.com>
Errors-To: dm-devel-bounces@redhat.com
Sender: "dm-devel" <dm-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: intel.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Sep 22, 2023 at 06:34:16PM +0200, Mikulas Patocka wrote:
> On Fri, 22 Sep 2023, Giovanni Cabiddu wrote:
> > Hi Mikulas,
> > 
> > many thanks for reporting this issue and finding a solution.
> > 
> > On Thu, Sep 21, 2023 at 10:53:55PM +0200, Mikulas Patocka wrote:
> > > I was evaluating whether it is feasible to use QAT with dm-crypt (the 
> > > answer is that it is not - QAT is slower than AES-NI for this type of 
> > > workload; QAT starts to be benefical for encryption requests longer than 
> > > 64k).
> > Correct. Is there anything that we can do to batch requests in a single
> > call?
> 
> Ask Herbert Xu. I think it would complicate the design of crypto API.
> 
> > Sometime ago there was some work done to build a geniv template cipher
> > and optimize dm-crypt to encrypt larger block sizes in a single call,
> > see [1][2]. Don't know if that work was completed.
> >
> > >And I got some deadlocks.
> > Ouch!
> > 
> > > The reason for the deadlocks is this: suppose that one of the "if"
> > > conditions in "qat_alg_send_message_maybacklog" is true and we jump to the
> > > "enqueue" label. At this point, an interrupt comes in and clears all
> > > pending messages. Now, the interrupt returns, we grab backlog->lock, add
> > > the message to the backlog, drop backlog->lock - and there is no one to
> > > remove the backlogged message out of the list and submit it.
> > Makes sense. In my testing I wasn't able to reproduce this condition.
> 
> I reproduced it with this:
> Use a system with two Intel(R) Xeon(R) Gold 5420+ processors
> Use a kernel 6.6-rc2
> Patch the kernel, so that dm-crypt uses QAT - that is, in 
> 	drivers/md/dm-crypt.c, replace all strings 
> 	"CRYPTO_ALG_ALLOCATES_MEMORY" with "0"
> Use .config from RHEL-9.4 beta and compile the kernel
> On the system, disable hyperthreading with
> 	"echo off >/sys/devices/system/cpu/smt/control"
> Activate dm-crypt on the top of nvme:
> 	"cryptsetup create cr /dev/nvme3n1 --sector-size=4096"
> Run fio in a loop:
> 	"while true; do
> 		fio --ioengine=psync --iodepth=1 --rw=randwrite --direct=1 
> 		--end_fsync=1 --bs=64k --numjobs=56 --time_based 
> 		--runtime=10 --group_reporting --name=job 
> 		--filename=/dev/mapper/cr
> 	done"
> 
> With this setup, I get a deadlock in a few iterations of fio.
> 
> > > I fixed it with this patch - with this patch, the test passes and there
> > > are no longer any deadlocks. I didn't want to add a spinlock to the hot
> > > path, so I take it only if some of the condition suggests that queuing may
> > > be required.
> > > 
> > > Signed-off-by: Mikulas Patocka <mpatocka@redhat.com>
> > > Cc: stable@vger.kernel.org
> > The commit message requires a bit of rework to describe the change.
> 
> I improved the message and I send a second version of the patch.
> 
> > Also, deserves a fixes tag.
> 
> "Fixes" tag is for something that worked and that was broken in some 
> previous commit.
That's right.

> A quick search through git shows that QAT backlogging was 
> broken since the introduction of QAT.
The driver was moved from drivers/crypto/qat to drivers/crypto/intel/qat
that's why you see a single patch.
This fixes 386823839732 ("crypto: qat - add backlog mechanism")

> 
> > > 
> > > ---
> > >  drivers/crypto/intel/qat/qat_common/qat_algs_send.c |   31 ++++++++++++--------
> > >  1 file changed, 20 insertions(+), 11 deletions(-)
> > > 
> > > Index: linux-2.6/drivers/crypto/intel/qat/qat_common/qat_algs_send.c
> > > ===================================================================
> > > --- linux-2.6.orig/drivers/crypto/intel/qat/qat_common/qat_algs_send.c
> > > +++ linux-2.6/drivers/crypto/intel/qat/qat_common/qat_algs_send.c
> > > @@ -40,16 +40,6 @@ void qat_alg_send_backlog(struct qat_ins
> > >  	spin_unlock_bh(&backlog->lock);
> > >  }
> > >  
> > > -static void qat_alg_backlog_req(struct qat_alg_req *req,
> > > -				struct qat_instance_backlog *backlog)
> > > -{
> > > -	INIT_LIST_HEAD(&req->list);
> > Is the initialization of an element no longer needed?
> 
> It was never needed. list_add_tail calls __list_add and __list_add 
> overwrites new->next and new->prev without reading them. So, there's no 
> need to initialize them.
> 
> > > -
> > > -	spin_lock_bh(&backlog->lock);
> > > -	list_add_tail(&req->list, &backlog->list);
> > > -	spin_unlock_bh(&backlog->lock);
> > > -}
> > > -
> > >  static int qat_alg_send_message_maybacklog(struct qat_alg_req *req)
> > >  {
> > >  	struct qat_instance_backlog *backlog = req->backlog;
> > > @@ -71,8 +61,27 @@ static int qat_alg_send_message_maybackl
> > >  	return -EINPROGRESS;
> > >  
> > >  enqueue:
> > > -	qat_alg_backlog_req(req, backlog);
> > > +	spin_lock_bh(&backlog->lock);
> > > +
> > > +	/* If any request is already backlogged, then add to backlog list */
> > > +	if (!list_empty(&backlog->list))
> > > +		goto enqueue2;
> > >  
> > > +	/* If ring is nearly full, then add to backlog list */
> > > +	if (adf_ring_nearly_full(tx_ring))
> > > +		goto enqueue2;
> > > +
> > > +	/* If adding request to HW ring fails, then add to backlog list */
> > > +	if (adf_send_message(tx_ring, fw_req))
> > > +		goto enqueue2;
> > In a nutshell, you are re-doing the same steps taking the backlog lock.
> > 
> > It should be possible to re-write it so that there is a function that
> > attempts enqueuing and if it fails, then the same is called again taking
> > the lock.
> > If you want I can rework it and resubmit.
> 
> Yes, if you prefer it this way, I reworked the patch so that we execute 
> the same code with or without the spinlock held.
> 
> > > +
> > > +	spin_unlock_bh(&backlog->lock);
> > > +	return -EINPROGRESS;
> > > +
> > > +enqueue2:
> > > +	list_add_tail(&req->list, &backlog->list);
> > > +
> > > +	spin_unlock_bh(&backlog->lock);
> > >  	return -EBUSY;
> > >  }
> > 
> > [1] https://www.mail-archive.com/linux-kernel@vger.kernel.org/msg1276510.html
> > [2] https://www.mail-archive.com/linux-kernel@vger.kernel.org/msg1428293.html
> > 
> > Regards,
> > 
> > -- 
> > Giovanni
> > 
> 
> From: Mikulas Patocka <mpatocka@redhat.com>
> Subject: [PATCH] qat: fix deadlock in backlog processing
crypto: qat - fix ...
> 
> I was testing QAT with dm-crypt and I got some deadlocks.
> 
> The reason for the deadlocks is this: suppose that one of the "if"
> conditions in "qat_alg_send_message_maybacklog" is true and we jump to the
> "enqueue" label. At this point, an interrupt comes in and clears all
> pending messages. Now, the interrupt returns, we grab backlog->lock, add
> the message to the backlog, drop backlog->lock - and there is no one to
> remove the backlogged message out of the list and submit it.
> 
> In order to fix the bug, we must hold the spinlock backlog->lock when we 
> perform test for free space in the ring - so that the test for free space 
> and adding the request to a backlog is atomic and can't be interrupted by 
> an interrupt. Every completion interrupt calls qat_alg_send_backlog which 
> grabs backlog->lock, so holding this spinlock is sufficient to synchronize 
> with interrupts.
> 
> I didn't want to add a spinlock unconditionally to the hot path for 
> performance reasons, so I take it only if some of the condition suggests 
> that queuing may be required.
> 
> Signed-off-by: Mikulas Patocka <mpatocka@redhat.com>
> Cc: stable@vger.kernel.org
> 
> ---
>  drivers/crypto/intel/qat/qat_common/qat_algs_send.c |   23 ++++++++++----------
>  1 file changed, 12 insertions(+), 11 deletions(-)
> 
> Index: linux-2.6/drivers/crypto/intel/qat/qat_common/qat_algs_send.c
> ===================================================================
> --- linux-2.6.orig/drivers/crypto/intel/qat/qat_common/qat_algs_send.c
> +++ linux-2.6/drivers/crypto/intel/qat/qat_common/qat_algs_send.c
> @@ -40,22 +40,14 @@ void qat_alg_send_backlog(struct qat_ins
>  	spin_unlock_bh(&backlog->lock);
>  }
>  
> -static void qat_alg_backlog_req(struct qat_alg_req *req,
> -				struct qat_instance_backlog *backlog)
> -{
> -	INIT_LIST_HEAD(&req->list);
> -
> -	spin_lock_bh(&backlog->lock);
> -	list_add_tail(&req->list, &backlog->list);
> -	spin_unlock_bh(&backlog->lock);
> -}
> -
>  static int qat_alg_send_message_maybacklog(struct qat_alg_req *req)
>  {
>  	struct qat_instance_backlog *backlog = req->backlog;
>  	struct adf_etr_ring_data *tx_ring = req->tx_ring;
>  	u32 *fw_req = req->fw_req;
> +	bool locked = false;
>  
> +repeat:
>  	/* If any request is already backlogged, then add to backlog list */
>  	if (!list_empty(&backlog->list))
>  		goto enqueue;
> @@ -68,11 +60,20 @@ static int qat_alg_send_message_maybackl
>  	if (adf_send_message(tx_ring, fw_req))
>  		goto enqueue;
>  
> +	if (unlikely(locked))
> +		spin_unlock_bh(&backlog->lock);
>  	return -EINPROGRESS;
>  
>  enqueue:
> -	qat_alg_backlog_req(req, backlog);
> +	if (!locked) {
> +		spin_lock_bh(&backlog->lock);
> +		locked = true;
> +		goto repeat;
> +	}
> +
> +	list_add_tail(&req->list, &backlog->list);
>  
> +	spin_unlock_bh(&backlog->lock);
>  	return -EBUSY;
>  }
>  
> 
Thanks - when I proposed the rework I was thinking at a solution without
gotos. Here is a draft:
------------8<----------------
 .../intel/qat/qat_common/qat_algs_send.c      | 40 ++++++++++---------
 1 file changed, 22 insertions(+), 18 deletions(-)

diff --git a/drivers/crypto/intel/qat/qat_common/qat_algs_send.c b/drivers/crypto/intel/qat/qat_common/qat_algs_send.c
index bb80455b3e81..18c6a233ab96 100644
--- a/drivers/crypto/intel/qat/qat_common/qat_algs_send.c
+++ b/drivers/crypto/intel/qat/qat_common/qat_algs_send.c
@@ -40,17 +40,7 @@ void qat_alg_send_backlog(struct qat_instance_backlog *backlog)
 	spin_unlock_bh(&backlog->lock);
 }
 
-static void qat_alg_backlog_req(struct qat_alg_req *req,
-				struct qat_instance_backlog *backlog)
-{
-	INIT_LIST_HEAD(&req->list);
-
-	spin_lock_bh(&backlog->lock);
-	list_add_tail(&req->list, &backlog->list);
-	spin_unlock_bh(&backlog->lock);
-}
-
-static int qat_alg_send_message_maybacklog(struct qat_alg_req *req)
+static bool qat_alg_try_enqueue(struct qat_alg_req *req)
 {
 	struct qat_instance_backlog *backlog = req->backlog;
 	struct adf_etr_ring_data *tx_ring = req->tx_ring;
@@ -58,22 +48,36 @@ static int qat_alg_send_message_maybacklog(struct qat_alg_req *req)
 
 	/* If any request is already backlogged, then add to backlog list */
 	if (!list_empty(&backlog->list))
-		goto enqueue;
+		return false;
 
 	/* If ring is nearly full, then add to backlog list */
 	if (adf_ring_nearly_full(tx_ring))
-		goto enqueue;
+		return false;
 
 	/* If adding request to HW ring fails, then add to backlog list */
 	if (adf_send_message(tx_ring, fw_req))
-		goto enqueue;
+		return false;
 
-	return -EINPROGRESS;
+	return true;
+}
 
-enqueue:
-	qat_alg_backlog_req(req, backlog);
 
-	return -EBUSY;
+static int qat_alg_send_message_maybacklog(struct qat_alg_req *req)
+{
+	struct qat_instance_backlog *backlog = req->backlog;
+	int ret = -EINPROGRESS;
+
+	if (qat_alg_try_enqueue(req))
+		return ret;
+
+	spin_lock_bh(&backlog->lock);
+	if (!qat_alg_try_enqueue(req)) {
+		list_add_tail(&req->list, &backlog->list);
+		ret = -EBUSY;
+	}
+	spin_unlock_bh(&backlog->lock);
+
+	return ret;
 }
 
 int qat_alg_send_message(struct qat_alg_req *req)
-- 
2.41.0


--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

