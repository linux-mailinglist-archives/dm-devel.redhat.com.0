Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 452D2242607
	for <lists+dm-devel@lfdr.de>; Wed, 12 Aug 2020 09:26:49 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-267-TXopsTXENCCCFTDHf8AZHQ-1; Wed, 12 Aug 2020 03:26:46 -0400
X-MC-Unique: TXopsTXENCCCFTDHf8AZHQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 56D8018A0F02;
	Wed, 12 Aug 2020 07:26:39 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 51EAE6F15F;
	Wed, 12 Aug 2020 07:26:31 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id F1A231809554;
	Wed, 12 Aug 2020 07:26:10 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 07C7PqsC001873 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 12 Aug 2020 03:25:52 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 77ADAE5B3D; Wed, 12 Aug 2020 07:25:51 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AB654E77A4
	for <dm-devel@redhat.com>; Wed, 12 Aug 2020 07:25:45 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E4D978007D7
	for <dm-devel@redhat.com>; Wed, 12 Aug 2020 07:25:44 +0000 (UTC)
Received: from huawei.com (szxga04-in.huawei.com [45.249.212.190]) (Using
	TLS) by relay.mimecast.com with ESMTP id
	us-mta-277-n5Hz329-MxKAvkRxeL-80w-1; Wed, 12 Aug 2020 03:25:40 -0400
X-MC-Unique: n5Hz329-MxKAvkRxeL-80w-1
Received: from DGGEMS404-HUB.china.huawei.com (unknown [172.30.72.58])
	by Forcepoint Email with ESMTP id 576681836A78F91ACB87;
	Wed, 12 Aug 2020 15:25:26 +0800 (CST)
Received: from [127.0.0.1] (10.174.179.249) by DGGEMS404-HUB.china.huawei.com
	(10.3.19.204) with Microsoft SMTP Server id 14.3.487.0;
	Wed, 12 Aug 2020 15:25:17 +0800
To: Martin Wilck <mwilck@suse.com>, Benjamin Marzinski <bmarzins@redhat.com>, 
	<christophe.varoqui@opensvc.com>, <kabelac@redhat.com>
References: <7556f86a-0b45-8274-b9e7-0576813ca1fe@huawei.com>
	<8254cda18f6f5e98f0c097d1065a39b937ce8628.camel@suse.com>
From: Zhiqiang Liu <liuzhiqiang26@huawei.com>
Message-ID: <f4e1a7e4-b2f6-b165-d7a3-2b56142ef89f@huawei.com>
Date: Wed, 12 Aug 2020 15:25:15 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
	Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <8254cda18f6f5e98f0c097d1065a39b937ce8628.camel@suse.com>
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
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: dm-devel@redhat.com
Cc: linfeilong <linfeilong@huawei.com>, Yanxiaodan <yanxiaodan@huawei.com>,
	dm-devel@redhat.com, lixiaokeng <lixiaokeng@huawei.com>
Subject: Re: [dm-devel] [PATCH V2] vector: return false if realloc fails in
 vector_alloc_slot func
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit



On 2020/8/11 17:46, Martin Wilck wrote:
> On Tue, 2020-08-11 at 11:23 +0800, Zhiqiang Liu wrote:
> 
>> diff --git a/libmultipath/vector.c b/libmultipath/vector.c
>> index 501cf4c5..39e2c20f 100644
>> --- a/libmultipath/vector.c
>> +++ b/libmultipath/vector.c
>> @@ -35,26 +35,22 @@ vector_alloc(void)
>>  }
>>
>>  /* allocated one slot */
>> -void *
>> +bool
>>  vector_alloc_slot(vector v)
>>  {
>>  	void *new_slot = NULL;
>>
>>  	if (!v)
>> -		return NULL;
>> -
>> -	v->allocated += VECTOR_DEFAULT_SIZE;
>> -	if (v->slot)
>> -		new_slot = REALLOC(v->slot, sizeof (void *) * v-
>>> allocated);
>> -	else
>> -		new_slot = (void *) MALLOC(sizeof (void *) * v-
>>> allocated);
>> +		return false;
>>
>> +	new_slot = REALLOC(v->slot, sizeof (void *) * (v->allocated +
>> VECTOR_DEFAULT_SIZE));
> 
> Please wrap this line. We basically still use a 80-columns limit, with
> the exception of string constants (mostly condlog() lines). We don't
> strictly enforce it, but 92 columns is a bit too much for my taste.
Thanks for your reply.
I will introduce new var to shorten this line and init new slot with
using loop in the v3 patch.

Thanks again.

Regards.
Zhiqiang Liu

> 
>>  	if (!new_slot)
>> -		v->allocated -= VECTOR_DEFAULT_SIZE;
>> -	else
>> -		v->slot = new_slot;
>> +		return false;
>>
>> -	return v->slot;
>> +	v->slot = new_slot;
>> +	v->allocated += VECTOR_DEFAULT_SIZE;
>> +	v->slot[VECTOR_SIZE(v) - 1] = NULL;
> 
> This assumes that VECTOR_DEFAULT_SIZE == 1. While that has been true
> essentially forever, there's no guarantee for the future. Better use a
> for loop, or memset().
> 
> Regards
> Martin
> 
> 
> 
> .
> 

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

