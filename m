Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id DC452768C46
	for <lists+dm-devel@lfdr.de>; Mon, 31 Jul 2023 08:49:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1690786141;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=mHn/DoUQ+3slECNZW5ujJR4hFO1KzGRhs6HFo5pDKjw=;
	b=Rg0eYWyLEKn/OYhTP1JGTiRueOmEHs0m5gSF9F7axPstv1uIVM6JKWFtiR5L9zyFa5j+uq
	+1p3OH5/++r3AiGomU1cg7Jn4ytSBy8TYcFo4j1gU3Ng0OMk9IOpQr1ssMReU2w9YZU75u
	2i78U+B/gO+3ssLgtgfKZSwwzsfGosI=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-312-wReDQDPOMmC9M5SaycUVVQ-1; Mon, 31 Jul 2023 02:48:57 -0400
X-MC-Unique: wReDQDPOMmC9M5SaycUVVQ-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B3E418910E9;
	Mon, 31 Jul 2023 06:48:54 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id A2CB5492CA6;
	Mon, 31 Jul 2023 06:48:50 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 751E91946A6D;
	Mon, 31 Jul 2023 06:48:48 +0000 (UTC)
X-Original-To: dm-devel@listman.corp.redhat.com
Delivered-To: dm-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id ED3F11946A6A
 for <dm-devel@listman.corp.redhat.com>; Fri, 28 Jul 2023 12:17:43 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id C3DAC4094DCA; Fri, 28 Jul 2023 12:17:43 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BBC954094DC9
 for <dm-devel@redhat.com>; Fri, 28 Jul 2023 12:17:43 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 91F698007CE
 for <dm-devel@redhat.com>; Fri, 28 Jul 2023 12:17:43 +0000 (UTC)
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2135.outbound.protection.outlook.com [40.107.94.135]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-494-QkRRKs8YO7Cl4_BQ_w6GSQ-1; Fri, 28 Jul 2023 08:17:39 -0400
X-MC-Unique: QkRRKs8YO7Cl4_BQ_w6GSQ-1
Received: from PH0PR13MB4842.namprd13.prod.outlook.com (2603:10b6:510:78::6)
 by CO3PR13MB5752.namprd13.prod.outlook.com (2603:10b6:303:164::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.33; Fri, 28 Jul
 2023 12:17:35 +0000
Received: from PH0PR13MB4842.namprd13.prod.outlook.com
 ([fe80::fde7:9821:f2d9:101d]) by PH0PR13MB4842.namprd13.prod.outlook.com
 ([fe80::fde7:9821:f2d9:101d%7]) with mapi id 15.20.6631.026; Fri, 28 Jul 2023
 12:17:35 +0000
Date: Fri, 28 Jul 2023 14:17:23 +0200
From: Simon Horman <simon.horman@corigine.com>
To: Qi Zheng <zhengqi.arch@bytedance.com>
Message-ID: <ZMOx0y+wdHEATDho@corigine.com>
References: <20230727080502.77895-1-zhengqi.arch@bytedance.com>
 <20230727080502.77895-6-zhengqi.arch@bytedance.com>
In-Reply-To: <20230727080502.77895-6-zhengqi.arch@bytedance.com>
X-ClientProxiedBy: AS4P190CA0065.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:20b:656::10) To PH0PR13MB4842.namprd13.prod.outlook.com
 (2603:10b6:510:78::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR13MB4842:EE_|CO3PR13MB5752:EE_
X-MS-Office365-Filtering-Correlation-Id: 7fa1c089-2344-4b06-3624-08db8f649f2e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0
X-Microsoft-Antispam-Message-Info: j0Mc3eF+DP2LxDOozLRyyeIKECVLGRQIlIrdEFb9GZyo19Z8jeFLDt/bCDbFSf8N0UgLcZ5nANCSfFPp9ph0OUTRm7F2bEGtxXu0ZMmYHB++UDEI/qt4sQIsHpj+LQqg6gGfURY4hT2IDCWGw6Ybqs5E7pgqpJs4J/nInIqn9VFU5CgQ+GK35/ZyTVoe6qWgCri0ck8ovO1iCvPMl6pQY1O5aEK2fI+4PMy9h3gUmAn1qC8GUFYKGFd4nIODUjceb9/B+WqmJi70ci7KBpycck/dYE/oE/fSNvWH87L2EN/RSEwJk4PFsx+XLA/x2ei5z3yj6T2zjDIjyD3Tat8vFp7m6b/5G97rY5DcrR5bpBvN1ryBFxovF049q1oBmHR1y7JP7MnntYWy7a2vGVlaH8cxiuhFvjFImRVlPHL7jFTnBxTs4DERfppx6DRLuWoyS8O4un5AQcw6WdKHT5UELpX36pMqwNA+j9Lbq5wh+3whyO46TZ2AhZlYvDlKlv7kTBixlXGW0fX6p3Xifb3vwnkvHoPd+UmsM9xZCOzMyPnlNSvXgvaF2p9+YayAMBmddGwNQoAsFRS9MKI4K1hSr40LZzFN4IAgjQ9J2S041xn/JxtQtD3rgjJxgmntTaofdMkuJGANvA4JO5mZkvQzhMrAXXqvJEOmaFoTF7J+yac=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR13MB4842.namprd13.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(366004)(136003)(39840400004)(376002)(396003)(346002)(451199021)(6512007)(478600001)(38100700002)(66946007)(8936002)(5660300002)(8676002)(66476007)(4326008)(6916009)(2616005)(41300700001)(66556008)(316002)(186003)(83380400001)(6666004)(6486002)(6506007)(86362001)(2906002)(7416002)(44832011)(7406005)(36756003)(67856001);
 DIR:OUT; SFP:1102
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?hPOsWUyNfuPgdO7KGPoxy8ksAiev8ZQ1mx/yK17hREAs80+Bp/61g+ypXcBT?=
 =?us-ascii?Q?HRu9jj6Qg9t07l3KXDplFpMfQmItUDmp/Rl49c3/yUZM8HLSVEUOfoYJFdhK?=
 =?us-ascii?Q?fSIgaNpvoQXryHYMgHOanbyxDsp2IMAM6Iww3QBkSbl730EEjBs5gxcDmCBb?=
 =?us-ascii?Q?QU1V3uoMqgXFhC9JWnnqZp0aSbsHbu4zyZTUWyLGqTYI6pmieGdUW+8LkwcJ?=
 =?us-ascii?Q?T0GkZ4g8qlRo4jk+l6xQ02skBq3BqXWvBLVBQRtkCmtFKTWh610fwMxsVkoM?=
 =?us-ascii?Q?Gnf1thqRe/k1tAWbVMF/a2+G6R558nSRbYsvwdfjoHnDY28X/sYjDBssYr/q?=
 =?us-ascii?Q?Fl6V7TlPdnX6ywkUx5QWinxcmi8lKgaJNWdDfDu8wspT9jG0cJH0gQIv8Cex?=
 =?us-ascii?Q?cNhBeOU3ZulAAFO34xSBp6jb7eFge1AhhnnJZIBgJ9hh24EkK39dXWvylKlQ?=
 =?us-ascii?Q?1ktLIUVF5yMuV2Vmvd4TziJI/G+7EgoKWYvFlDgX7ABke4nbRWeHbG1dmjGp?=
 =?us-ascii?Q?7x5Zw8PVMIwKgAsHbCNrvEO06CmHCJ8AK/tIKMjp9T9xZi65K/IJ05WsKAuj?=
 =?us-ascii?Q?Qxr+kkU/EkZ4MWrTGeAGpaQZQGgh0h8UttK3ddqpmeHbsrx7bDjMbskRnWJp?=
 =?us-ascii?Q?rZ1C0HmN3hiOwYzCPuGdDiZMr7t98q9NV65gQ/SHiXGpM6OCy0OKTkSOSIH1?=
 =?us-ascii?Q?V7Et5iOjOIWdAwR598SHY6uUul9gU5PLOnE30G/jnDxc7wFZUZJMBWyq8BLd?=
 =?us-ascii?Q?rfdzv008lWuhfWDgCaiiB492XTgsC2nNrDNWe29D47eQpQ7OuJIdthMJCJZx?=
 =?us-ascii?Q?l2b/Zb5/I6p5bjCx0Q4WanQW6fBtQG12r7Yr7GEf1W1aFoeQprvePdMpArft?=
 =?us-ascii?Q?pdbQ0CR0h3XJO4+2uuuWmNajIA4qboVi0YBp+K7rQ8PLx6xS+mFQXOiI4Hoa?=
 =?us-ascii?Q?v502tXURqyFypRcDKv6AIFRJQ6JhFLxbbuXNsFzLiWtdAx+kU4nwt6iqJ7Yn?=
 =?us-ascii?Q?LhZkjIdd3zSfy/4HixYBTehrS52N44jF827Sh3vdaRtSQYMGr/Ezf8kqDUuG?=
 =?us-ascii?Q?y8G3exbJVKS4cLtpL4Ae0oq2lWyJ6uZ3msnMmUROXYeb+8uClJ6zkgDbdoNR?=
 =?us-ascii?Q?bWMHaZTumykYTjazZdHf8vwaUSWqjBfQYE3BA2HsxCns+aaaxAVro0VuntZB?=
 =?us-ascii?Q?gDASa2H6OUzdubnVa+jZ6ZNxQZEkLclBxmbs3xg4jWiFrHt0nmYg+BCOrJTT?=
 =?us-ascii?Q?B+X7yNNw5UizQNg6XjkKzmt3cUpuw7upYP9vz23zka7o2TO4MTsfcRopjPdM?=
 =?us-ascii?Q?Kd2qtjL8Yj5ZTL6bJI+IEDTIgXkj6+W0ErfOvDGVyFIPud8PIhk2Vs9NCwbI?=
 =?us-ascii?Q?jrHvmo7xrbGGkVITjitLJ15ofnoW7jlUEZMtIr45BECVNAskC2eroDIELfbh?=
 =?us-ascii?Q?drKPUw6+OUS8C/sferQ8mAXHxjVFmphteP7aP7p50cbQF/4fiuKXqxV+BS5f?=
 =?us-ascii?Q?HRsARsK+VfL9529UpcyCv5oQHYnC+JR6JGkWgnOGhw9GJX+T6zjmEhXAFSlG?=
 =?us-ascii?Q?sjiaqZOwyEuD14aXMfYytHlpYjb63AL5QMCw/26rpqFaI0q0wW+Monr3okit?=
 =?us-ascii?Q?gXo9kiB3+KBcH9Z/XZprsS/Ue0QmWLJ6Uegfo/4/Hd6o8wkg8oTMbd8yz3WX?=
 =?us-ascii?Q?HVhI7w=3D=3D?=
X-OriginatorOrg: corigine.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7fa1c089-2344-4b06-3624-08db8f649f2e
X-MS-Exchange-CrossTenant-AuthSource: PH0PR13MB4842.namprd13.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2023 12:17:35.2229 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fe128f2c-073b-4c20-818e-7246a585940c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iZe55KImseJDEXyvSQcePinFJYyerifPEHQDYs0bVw2T5jNObZA26ORFCKwaaGDVoaLdpiLFCL17f5WTZYMy0/KrkxWVzjRme/VzT17S8OY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO3PR13MB5752
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
X-Mailman-Approved-At: Mon, 31 Jul 2023 06:48:47 +0000
Subject: Re: [dm-devel] [PATCH v3 05/49] mm: shrinker: add infrastructure
 for dynamically allocating shrinker
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
Cc: kvm@vger.kernel.org, djwong@kernel.org, roman.gushchin@linux.dev,
 david@fromorbit.com, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org, linux-mm@kvack.org,
 dm-devel@redhat.com, linux-mtd@lists.infradead.org, cel@kernel.org,
 x86@kernel.org, steven.price@arm.com, cluster-devel@redhat.com,
 xen-devel@lists.xenproject.org, linux-ext4@vger.kernel.org, paulmck@kernel.org,
 linux-arm-msm@vger.kernel.org, linux-nfs@vger.kernel.org, rcu@vger.kernel.org,
 linux-bcache@vger.kernel.org, yujie.liu@intel.com, vbabka@suse.cz,
 linux-raid@vger.kernel.org, brauner@kernel.org, tytso@mit.edu,
 gregkh@linuxfoundation.org, muchun.song@linux.dev,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-xfs@vger.kernel.org, senozhatsky@chromium.org, netdev@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, akpm@linux-foundation.org,
 linux-erofs@lists.ozlabs.org, linux-btrfs@vger.kernel.org, tkhai@ya.ru
Errors-To: dm-devel-bounces@redhat.com
Sender: "dm-devel" <dm-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: corigine.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Jul 27, 2023 at 04:04:18PM +0800, Qi Zheng wrote:
> Currently, the shrinker instances can be divided into the following three
> types:
> 
> a) global shrinker instance statically defined in the kernel, such as
>    workingset_shadow_shrinker.
> 
> b) global shrinker instance statically defined in the kernel modules, such
>    as mmu_shrinker in x86.
> 
> c) shrinker instance embedded in other structures.
> 
> For case a, the memory of shrinker instance is never freed. For case b,
> the memory of shrinker instance will be freed after synchronize_rcu() when
> the module is unloaded. For case c, the memory of shrinker instance will
> be freed along with the structure it is embedded in.
> 
> In preparation for implementing lockless slab shrink, we need to
> dynamically allocate those shrinker instances in case c, then the memory
> can be dynamically freed alone by calling kfree_rcu().
> 
> So this commit adds the following new APIs for dynamically allocating
> shrinker, and add a private_data field to struct shrinker to record and
> get the original embedded structure.
> 
> 1. shrinker_alloc()
> 
> Used to allocate shrinker instance itself and related memory, it will
> return a pointer to the shrinker instance on success and NULL on failure.
> 
> 2. shrinker_register()
> 
> Used to register the shrinker instance, which is same as the current
> register_shrinker_prepared().
> 
> 3. shrinker_free()
> 
> Used to unregister (if needed) and free the shrinker instance.
> 
> In order to simplify shrinker-related APIs and make shrinker more
> independent of other kernel mechanisms, subsequent submissions will use
> the above API to convert all shrinkers (including case a and b) to
> dynamically allocated, and then remove all existing APIs.
> 
> This will also have another advantage mentioned by Dave Chinner:
> 
> ```
> The other advantage of this is that it will break all the existing
> out of tree code and third party modules using the old API and will
> no longer work with a kernel using lockless slab shrinkers. They
> need to break (both at the source and binary levels) to stop bad
> things from happening due to using uncoverted shrinkers in the new

nit: uncoverted -> unconverted

> setup.
> ```
> 
> Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>

...

> diff --git a/mm/shrinker_debug.c b/mm/shrinker_debug.c
> index f1becfd45853..506257585408 100644
> --- a/mm/shrinker_debug.c
> +++ b/mm/shrinker_debug.c
> @@ -191,6 +191,20 @@ int shrinker_debugfs_add(struct shrinker *shrinker)
>  	return 0;
>  }
>  
> +int shrinker_debugfs_name_alloc(struct shrinker *shrinker, const char *fmt,
> +				va_list ap)
> +{
> +	shrinker->name = kvasprintf_const(GFP_KERNEL, fmt, ap);
> +
> +	return shrinker->name ? 0 : -ENOMEM;
> +}
> +
> +void shrinker_debugfs_name_free(struct shrinker *shrinker)
> +{
> +	kfree_const(shrinker->name);
> +	shrinker->name = NULL;
> +}
> +

These functions have no prototype in this file,
perhaps internal.h should be included?

>  int shrinker_debugfs_rename(struct shrinker *shrinker, const char *fmt, ...)
>  {
>  	struct dentry *entry;

...

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

