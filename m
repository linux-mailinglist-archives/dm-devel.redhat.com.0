Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id F1986240715
	for <lists+dm-devel@lfdr.de>; Mon, 10 Aug 2020 16:00:30 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-46-e6Dqdjy_Nz-habvFPJiIhQ-1; Mon, 10 Aug 2020 10:00:26 -0400
X-MC-Unique: e6Dqdjy_Nz-habvFPJiIhQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CE2E2100AA22;
	Mon, 10 Aug 2020 14:00:18 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B143D6931F;
	Mon, 10 Aug 2020 14:00:16 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id A496797558;
	Mon, 10 Aug 2020 14:00:10 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 07AE04hU029114 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 10 Aug 2020 10:00:05 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id BA67B210FE0B; Mon, 10 Aug 2020 14:00:04 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8A198210FE06
	for <dm-devel@redhat.com>; Mon, 10 Aug 2020 14:00:02 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 73F5A108C268
	for <dm-devel@redhat.com>; Mon, 10 Aug 2020 14:00:02 +0000 (UTC)
Received: from huawei.com (szxga05-in.huawei.com [45.249.212.191]) (Using
	TLS) by relay.mimecast.com with ESMTP id
	us-mta-396-Ld_bvIOzM-qxx3dOPTvEQA-1; Mon, 10 Aug 2020 09:59:58 -0400
X-MC-Unique: Ld_bvIOzM-qxx3dOPTvEQA-1
Received: from DGGEMS404-HUB.china.huawei.com (unknown [172.30.72.60])
	by Forcepoint Email with ESMTP id 2DB36B4AA5F35919BB8B;
	Mon, 10 Aug 2020 21:59:54 +0800 (CST)
Received: from [127.0.0.1] (10.174.179.249) by DGGEMS404-HUB.china.huawei.com
	(10.3.19.204) with Microsoft SMTP Server id 14.3.487.0;
	Mon, 10 Aug 2020 21:59:46 +0800
To: Martin Wilck <mwilck@suse.com>, <bmarzins@redhat.com>,
	<christophe.varoqui@opensvc.com>, <kabelac@redhat.com>
References: <a04e1267-0f1c-3a8b-c163-1697469ffeca@huawei.com>
	<a3a9059d2e5a3dd18bbcc649ecdb9d5564021eb1.camel@suse.com>
From: Zhiqiang Liu <liuzhiqiang26@huawei.com>
Message-ID: <3f7a8ed9-160e-4230-6d45-90066d7f87cb@huawei.com>
Date: Mon, 10 Aug 2020 21:59:44 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
	Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <a3a9059d2e5a3dd18bbcc649ecdb9d5564021eb1.camel@suse.com>
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
Cc: linfeilong@huawei.com, Yanxiaodan <yanxiaodan@huawei.com>,
	dm-devel@redhat.com, lixiaokeng <lixiaokeng@huawei.com>
Subject: Re: [dm-devel] [dm- devel][PATCH] vector: return null when realloc
 fails in vector_alloc_slot func
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit



On 2020/8/10 21:48, Martin Wilck wrote:
> Hello Liu,
> 
> On Fri, 2020-07-31 at 18:41 +0800, Zhiqiang Liu wrote:
>> In vector_alloc_slot func, if REALLOC fails, it means new slot
>> allocation fails. However, it just update v->allocated and then
>> return the old v->slot without new slot. So, the caller will take
>> the last old slot as the new allocated slot, and use it by calling
>> vector_set_slot func. Finally, the data of last slot is lost.
>>
>> Here, if REALLOC or MALLOC fails, we will return NULL.
>>
>> Signed-off-by: Zhiqiang Liu <liuzhiqiang26@huawei.com>
>> Signed-off-by: lixiaokeng <lixiaokeng@huawei.com>
>> ---
>>  libmultipath/vector.c | 10 ++++++----
>>  1 file changed, 6 insertions(+), 4 deletions(-)
>>
>> diff --git a/libmultipath/vector.c b/libmultipath/vector.c
>> index 501cf4c5..29dc9848 100644
>> --- a/libmultipath/vector.c
>> +++ b/libmultipath/vector.c
>> @@ -49,12 +49,14 @@ vector_alloc_slot(vector v)
>>  	else
>>  		new_slot = (void *) MALLOC(sizeof (void *) * v-
>>> allocated);
>>
>> -	if (!new_slot)
>> +	/* If REALLOC or MALLOC fails, it means new slot allocation
>> fails, so return NULL. */
>> +	if (!new_slot) {
>>  		v->allocated -= VECTOR_DEFAULT_SIZE;
>> -	else
>> -		v->slot = new_slot;
>> +		return NULL;
>> +	}
>>
>> -	return v->slot;
>> +	v->slot = new_slot;
>> +	return v->slot[VECTOR_SIZE(v) - 1];
> 
> This changes the semantics of the function by returning the last 
> element of the vector rather than v->slot. That's dangerous because
> these elements aren't initialized. You might as well return NULL in
> case of success, which would obviously be wrong (actually, new elements
> _should_ be initialized to NULL). As the return value is only ever used
> to check for successful allocation, it might be best to change it into
> a bool, avoiding any ambiguity about its meaning.
> 
> If you want to clean up this function (appreciated!), please do it
> right:
> 
>  - increment v->allocated only after successful allocation,
>  - avoid the "if (v->slot)" conditional by just calling realloc(),
>  - make sure all newly allocated vector elements are set to NULL,
>  - optionally, change return value to bool (see above).
> 
> Regards,
> Martin
> 
Thanks for your suggestion.
I will rewrite and send the v2 patch as your suggestion.

> 
> 
> .
> 

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

