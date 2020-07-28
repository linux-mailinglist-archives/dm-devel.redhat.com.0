Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 311AD230BDF
	for <lists+dm-devel@lfdr.de>; Tue, 28 Jul 2020 15:57:12 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-85-ozhnouctO566eYoZL7wnSg-1; Tue, 28 Jul 2020 09:57:08 -0400
X-MC-Unique: ozhnouctO566eYoZL7wnSg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 72FD7100962A;
	Tue, 28 Jul 2020 13:56:59 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E654F79251;
	Tue, 28 Jul 2020 13:56:54 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 6120EA359F;
	Tue, 28 Jul 2020 13:56:44 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 06SDuWu6011799 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 28 Jul 2020 09:56:32 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 4AC331009BBD; Tue, 28 Jul 2020 13:56:32 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4589A110E9BB
	for <dm-devel@redhat.com>; Tue, 28 Jul 2020 13:56:28 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BD5AD8007A4
	for <dm-devel@redhat.com>; Tue, 28 Jul 2020 13:56:28 +0000 (UTC)
Received: from huawei.com (szxga06-in.huawei.com [45.249.212.32]) (Using
	TLS) by relay.mimecast.com with ESMTP id
	us-mta-84-PDlpSNvSPoiwqAxXyG2Pbg-1; Tue, 28 Jul 2020 09:56:23 -0400
X-MC-Unique: PDlpSNvSPoiwqAxXyG2Pbg-1
Received: from DGGEMS413-HUB.china.huawei.com (unknown [172.30.72.60])
	by Forcepoint Email with ESMTP id 219114CFE4A314D65196;
	Tue, 28 Jul 2020 21:56:14 +0800 (CST)
Received: from [127.0.0.1] (10.174.179.62) by DGGEMS413-HUB.china.huawei.com
	(10.3.19.213) with Microsoft SMTP Server id 14.3.487.0; Tue, 28 Jul 2020
	21:56:05 +0800
To: Benjamin Marzinski <bmarzins@redhat.com>
References: <1694e42f-92e7-e380-bc8c-ac3ec47cafdc@huawei.com>
	<20200727164530.GN11089@octiron.msp.redhat.com>
From: lixiaokeng <lixiaokeng@huawei.com>
Message-ID: <92b1653b-bf07-a79b-359a-635924102a84@huawei.com>
Date: Tue, 28 Jul 2020 21:56:04 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
	Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200727164530.GN11089@octiron.msp.redhat.com>
Content-Language: en-GB
X-Originating-IP: [10.174.179.62]
X-CFilter-Loop: Reflected
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: dm-devel@redhat.com
Cc: liuzhiqiang26@huawei.com, linfeilong@huawei.com, dm-devel@redhat.com,
	Martin Wilck <mwilck@suse.com>, lutianxiong@huawei.com
Subject: Re: [dm-devel] [dm-level] upstream-queue-libmultipath: fix memory
 leak when iscsi login/out and "multipath -r" executed
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi.
    Thanks very much! I will try these patches.
-Lixiaokeng

On 2020/7/28 0:45, Benjamin Marzinski wrote:
> On Sat, Jul 25, 2020 at 01:47:01PM +0800, lixiaokeng wrote:
>> When one iscsi device logs in and logs out with the "multipath -r"
>> executed at the same time, memory leak happens in multipathd
>> process.
>>
>> The reason is following. When "multipath -r" is executed, the path
>> will be free in configure function. Before path_discovery executed,
>> iscsi device logs out. Then path_discovery will not find any path and
>> there is no path in the gvecs->pathvec. When map_discovery function
>> is executed, disassemble_map function will be called. Because
>> gvecs->pathvec->slot is empty and is_deamon is 1, a path will be
>> allocated and is not stored in gvecs->pathvec but store in
>> mpp->pg. But when the mpp is removed and freed by remove_map
>> function, the path will not be free and can't be find anymore.
>>
>> The procedure details given as follows,
>> 1."multipath -r" is executed
>> main
>> 	->child
>> 		->reconfigure
>> 			->configure
>> 				->path_discovery //after iscsi logout
>> 				->map_discovery
>> 					->update_multipath_table
>> 						->disassemble_map
>> 							->alloc_path
>> 2.then "multipath -r" is executed again
>> main
>> main
>> 	->child
>> 		->reconfigure
>> 			->remove_maps_and_stop_waiters
>> 				->remove_maps
>>
>> Here, we delete checking is_deamon. Because whether the process is a
>> daemon process or not, we think the path should be add to gvecs->pathvec.
> 
> There is more work that needs to be done to besides removing the is_daemon
> check.  However, Martin already posted patches that deal with this as
> part of the his large patchset.
> 
> https://www.redhat.com/archives/dm-devel/2020-July/msg00245.html
> 
> You should take a look at those, and at my comments on them, because they
> should resolve your issue.
> 
> -Ben
> 
>>
>> Reported-by: Tianxiong Li <lutianxiong@huawei.com>
>> Signed-off-by: Lixiaokeng <lixiaokeng@huawei.com>
>> Signed-off-by: Zhiqiang Liu <liuzhiqiang26@huawei.com>
>>
>> ---
>>  libmultipath/dmparser.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/libmultipath/dmparser.c b/libmultipath/dmparser.c
>> index b856a07f..d556f642 100644
>> --- a/libmultipath/dmparser.c
>> +++ b/libmultipath/dmparser.c
>> @@ -315,7 +315,7 @@ int disassemble_map(vector pathvec, char *params, struct multipath *mpp,
>>  						WWID_SIZE);
>>  				}
>>  				/* Only call this in multipath client mode */
>> -				if (!is_daemon && store_path(pathvec, pp))
>> +				if (store_path(pathvec, pp))
>>  					goto out1;
>>  			} else {
>>  				if (!strlen(pp->wwid) &&
>> --
> 
> 
> .
> 

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

