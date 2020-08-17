Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 23884246B9C
	for <lists+dm-devel@lfdr.de>; Mon, 17 Aug 2020 17:59:14 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-105-3Ij5V8MdOkSNLfqQzqhVAQ-1; Mon, 17 Aug 2020 11:59:10 -0400
X-MC-Unique: 3Ij5V8MdOkSNLfqQzqhVAQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8994E100CECA;
	Mon, 17 Aug 2020 15:59:03 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B0706756AB;
	Mon, 17 Aug 2020 15:59:02 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 530BA60343;
	Mon, 17 Aug 2020 15:59:00 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 07HFwr8Q006034 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 17 Aug 2020 11:58:53 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 705CA2166BCC; Mon, 17 Aug 2020 15:58:53 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 699582166BB3
	for <dm-devel@redhat.com>; Mon, 17 Aug 2020 15:58:51 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5497518AE955
	for <dm-devel@redhat.com>; Mon, 17 Aug 2020 15:58:51 +0000 (UTC)
Received: from huawei.com (szxga06-in.huawei.com [45.249.212.32]) (Using
	TLS) by relay.mimecast.com with ESMTP id
	us-mta-90-n97MJrw9NvmGnriSIknlmg-1; Mon, 17 Aug 2020 11:58:46 -0400
X-MC-Unique: n97MJrw9NvmGnriSIknlmg-1
Received: from DGGEMS402-HUB.china.huawei.com (unknown [172.30.72.60])
	by Forcepoint Email with ESMTP id B1143CBFD1CAAFB0CF7F;
	Mon, 17 Aug 2020 23:58:41 +0800 (CST)
Received: from [127.0.0.1] (10.174.179.249) by DGGEMS402-HUB.china.huawei.com
	(10.3.19.202) with Microsoft SMTP Server id 14.3.487.0;
	Mon, 17 Aug 2020 23:58:34 +0800
To: Martin Wilck <mwilck@suse.com>, <bmarzins@redhat.com>, Christophe Varoqui
	<christophe.varoqui@opensvc.com>, Zdenek Kabelac <zkabelac@redhat.com>
References: <351fa23b-b730-ce22-7e89-24f26a693a6a@huawei.com>
	<df68c7c3-2b86-ce72-62e9-c43ef80a2bc8@huawei.com>
	<13e2afb835ace628a990ffc6de03fab195833c3a.camel@suse.com>
From: Zhiqiang Liu <liuzhiqiang26@huawei.com>
Message-ID: <a745e588-748e-c5d2-3396-d1d57c6ebc7f@huawei.com>
Date: Mon, 17 Aug 2020 23:58:32 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
	Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <13e2afb835ace628a990ffc6de03fab195833c3a.camel@suse.com>
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
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: dm-devel@redhat.com
Cc: linfeilong <linfeilong@huawei.com>, Yanxiaodan <yanxiaodan@huawei.com>,
	dm-devel@redhat.com, lixiaokeng <lixiaokeng@huawei.com>
Subject: Re: [dm-devel] [PATCH 5/6] vector: add lower boundary check in
 vector_foreach_slot_after
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit



On 2020/8/17 17:11, Martin Wilck wrote:
> On Sun, 2020-08-16 at 09:45 +0800, Zhiqiang Liu wrote:
>> In vector_foreach_slot_after macro, i is the input var, which
>> may have a illegal value (i < 0). So we should add lower boundary
>> check in vector_foreach_slot_after macro.
>>
>> Signed-off-by: Zhiqiang Liu <liuzhiqiang26@huawei.com>
>> Signed-off-by: lixiaokeng <lixiaokeng@huawei.com>
>> ---
>>  libmultipath/vector.h | 6 +++---
>>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> Perhaps we should write this instead? I'm unsure if compilers can
> optimize away the repeated extra check in all cases.
> 
> #define vector_foreach_slot_after(v,p,i) \
> 	if ((v) && (int)(i) >= 0)        \
> 		for (; (int)(i) < VECTOR_SIZE(v) && ((p) = (v)->slot[i]); (i)++)
> 
> Regards,
> Martin
> 
Thanks for your advice.
When I modified the vector_foreach_slot_after func, I just focused
on the basic functionality, and the performance is totally not considered.
I learn a lesson from your advice.

Thanks again.

Regards
Zhiqiang Liu

>>
>> diff --git a/libmultipath/vector.h b/libmultipath/vector.h
>> index 2862dc2..45dbfc1 100644
>> --- a/libmultipath/vector.h
>> +++ b/libmultipath/vector.h
>> @@ -38,11 +38,11 @@ typedef struct _vector *vector;
>>  #define VECTOR_LAST_SLOT(V)   (((V) && VECTOR_SIZE(V) > 0) ? (V)-
>>> slot[(VECTOR_SIZE(V) - 1)] : NULL)
>>
>>  #define vector_foreach_slot(v,p,i) \
>> -	for (i = 0; (v) && (int)i < VECTOR_SIZE(v) && ((p) = (v)-
>>> slot[i]); i++)
>> +	for ((i) = 0; (v) && (int)(i) < VECTOR_SIZE(v) && ((p) = (v)-
>>> slot[i]); (i)++)
>>  #define vector_foreach_slot_after(v,p,i) \
>> -	for (; (v) && (int)i < VECTOR_SIZE(v) && ((p) = (v)->slot[i]);
>> i++)
>> +	for (; (v) && (int)(i) < VECTOR_SIZE(v) && (int)(i) >= 0 &&
>> ((p) = (v)->slot[i]); (i)++)
>>  #define vector_foreach_slot_backwards(v,p,i) \
>> -	for (i = VECTOR_SIZE(v) - 1; (int)i >= 0 && ((p) = (v)-
>>> slot[i]); i--)
>> +	for ((i) = VECTOR_SIZE(v) - 1; (int)(i) >= 0 && ((p) = (v)-
>>> slot[i]); (i)--)
>>
>>  #define identity(x) (x)
>>  /*
> 
> 
> 
> .
> 

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

