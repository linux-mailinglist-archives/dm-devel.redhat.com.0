Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 17B33241477
	for <lists+dm-devel@lfdr.de>; Tue, 11 Aug 2020 03:15:37 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-239-AXzwh2UgPkqcvS3TdiQnpw-1; Mon, 10 Aug 2020 21:15:34 -0400
X-MC-Unique: AXzwh2UgPkqcvS3TdiQnpw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 97783106B242;
	Tue, 11 Aug 2020 01:15:26 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1F4F65DA33;
	Tue, 11 Aug 2020 01:15:24 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 0674295A75;
	Tue, 11 Aug 2020 01:15:13 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 07B1F1El016798 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 10 Aug 2020 21:15:01 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 79CBA208DD80; Tue, 11 Aug 2020 01:15:01 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 74AD72026D69
	for <dm-devel@redhat.com>; Tue, 11 Aug 2020 01:14:59 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 678DA8007C9
	for <dm-devel@redhat.com>; Tue, 11 Aug 2020 01:14:59 +0000 (UTC)
Received: from huawei.com (szxga05-in.huawei.com [45.249.212.191]) (Using
	TLS) by relay.mimecast.com with ESMTP id
	us-mta-13-ip8S0PK1OKeICX7ktaDhYw-1; Mon, 10 Aug 2020 21:14:57 -0400
X-MC-Unique: ip8S0PK1OKeICX7ktaDhYw-1
Received: from DGGEMS403-HUB.china.huawei.com (unknown [172.30.72.60])
	by Forcepoint Email with ESMTP id 620C525EDEFDB3A12195;
	Tue, 11 Aug 2020 09:14:53 +0800 (CST)
Received: from [127.0.0.1] (10.174.179.249) by DGGEMS403-HUB.china.huawei.com
	(10.3.19.203) with Microsoft SMTP Server id 14.3.487.0;
	Tue, 11 Aug 2020 09:14:47 +0800
To: Martin Wilck <mwilck@suse.com>, <linfeilong@huawei.com>, Yanxiaodan
	<yanxiaodan@huawei.com>, lixiaokeng <lixiaokeng@huawei.com>
References: <140e431094a118a5276f6964921cc120bda2dc49.camel@suse.com>
From: Zhiqiang Liu <liuzhiqiang26@huawei.com>
Message-ID: <60d7ea82-22ed-16f5-de7f-8280b90eeb7f@huawei.com>
Date: Tue, 11 Aug 2020 09:14:46 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
	Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <140e431094a118a5276f6964921cc120bda2dc49.camel@suse.com>
Content-Language: en-US
X-Originating-IP: [10.174.179.249]
X-CFilter-Loop: Reflected
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false;
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com
Subject: Re: [dm-devel] Recent multipath-tools patches from Huawei
X-BeenThere: dm-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: device-mapper development <dm-devel.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/dm-devel>,
	<mailto:dm-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/dm-devel>
List-Post: <mailto:dm-devel@redhat.com>
List-Help: <mailto:dm-devel-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/dm-devel>,
	<mailto:dm-devel-request@redhat.com?subject=subscribe>
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit



On 2020/8/10 22:34, Martin Wilck wrote:
> Hi Liu,
> 
> thanks again for your valuable contributions and meticulous code
> review. I've added your patches in my upstream-queue branch now:
> 
> https://github.com/openSUSE/multipath-tools/commits/upstream-queue
> 
> Not applied yet: 
> 
>  - libmultipath: free pp if store_path fails in disassemble_map:
>    As noted before, this will be merged with my series for
>    disassemble_map().
>  - libmultipath: fix a memory leak in set_ble_device:
>    Please fix minor issues I mentioned
>  - vector: return null when realloc fails in vector_alloc_slot func
>    Needs improvement
> 
> Please double-check if I've missed anything. 
> 
> Next time, please send your patches as a series. That makes it
> much easier for others to make sure they don't miss any.
> And please, don't add "[dm-devel]" explicitly in your email
> subject, mailman will take care of that.
> 
> Regards
> Martin
> 
Thanks for your advise.
I have checked recent patches. The following patch may be missed.
- libmultipath: free pgp if add_pathgroup fails in disassemble_map func




>From e43d45a4ff838cab845bc5b5834d24743192eb75 Mon Sep 17 00:00:00 2001
From: Zhiqiang Liu <liuzhiqiang26@huawei.com>
Date: Wed, 22 Jul 2020 14:31:15 +0800
Subject: [PATCH] libmultipath: free pgp if add_pathgroup fails in disassemble_map

In disassemble_map func, pgp will be added to mpp->pg by calling
add_pathgroup after allocing a pathgroup (pgp) successfully. However,
if add_pathgroup fails, the pgp is actually not inserted into mpp->pg.
So, calling free_pgvec(mpp->pg) cannot free the pgp, then memory leak
problem occurs.

disassemble_map:
-> pgp = alloc_pathgroup()
-> if add_pathgroup(mpp, pgp) fails
	-> goto out
out:
free_pgvec(mpp->pg, KEEP_PATHS);

Here, we will call free_pathgroup(pgp) before going to out tag.

Signed-off-by: Zhiqiang Liu <liuzhiqiang26@huawei.com>
Signed-off-by: lixiaokeng <lixiaokeng@huawei.com>
Reviewed-by: Benjamin Marzinski <bmarzins@redhat.com>
---
 libmultipath/dmparser.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/libmultipath/dmparser.c b/libmultipath/dmparser.c
index ac13ec06..6225838b 100644
--- a/libmultipath/dmparser.c
+++ b/libmultipath/dmparser.c
@@ -268,8 +268,10 @@ int disassemble_map(vector pathvec, char *params, struct multipath *mpp,
 		if (!pgp)
 			goto out;

-		if (add_pathgroup(mpp, pgp))
+		if (add_pathgroup(mpp, pgp)) {
+			free_pathgroup(pgp, KEEP_PATHS);
 			goto out;
+		}

 		p += get_word(p, &word);

-- 
2.24.0.windows.2





> 
> 
> .
> 

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

