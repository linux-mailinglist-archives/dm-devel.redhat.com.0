Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 9EB18246895
	for <lists+dm-devel@lfdr.de>; Mon, 17 Aug 2020 16:43:53 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-490-cX5Dt-OLOu6OpmzQ9J0wIw-1; Mon, 17 Aug 2020 10:43:50 -0400
X-MC-Unique: cX5Dt-OLOu6OpmzQ9J0wIw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AC7571007B03;
	Mon, 17 Aug 2020 14:43:42 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 71CBF70C3E;
	Mon, 17 Aug 2020 14:43:37 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 16CBA4EE20;
	Mon, 17 Aug 2020 14:43:28 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 07HEhCPF028155 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 17 Aug 2020 10:43:12 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 605A82022789; Mon, 17 Aug 2020 14:43:12 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5A4742028E91
	for <dm-devel@redhat.com>; Mon, 17 Aug 2020 14:43:09 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 775078A1923
	for <dm-devel@redhat.com>; Mon, 17 Aug 2020 14:43:09 +0000 (UTC)
Received: from huawei.com (szxga07-in.huawei.com [45.249.212.35]) (Using
	TLS) by relay.mimecast.com with ESMTP id
	us-mta-525-RNl4IjmQOHqH1Yq-Bl4a9A-1; Mon, 17 Aug 2020 10:43:06 -0400
X-MC-Unique: RNl4IjmQOHqH1Yq-Bl4a9A-1
Received: from DGGEMS409-HUB.china.huawei.com (unknown [172.30.72.59])
	by Forcepoint Email with ESMTP id 2D1A127CB5C398234752;
	Mon, 17 Aug 2020 22:42:58 +0800 (CST)
Received: from [127.0.0.1] (10.174.179.249) by DGGEMS409-HUB.china.huawei.com
	(10.3.19.209) with Microsoft SMTP Server id 14.3.487.0;
	Mon, 17 Aug 2020 22:42:51 +0800
To: Martin Wilck <mwilck@suse.com>, <bmarzins@redhat.com>, Christophe Varoqui
	<christophe.varoqui@opensvc.com>, Zdenek Kabelac <zkabelac@redhat.com>
References: <351fa23b-b730-ce22-7e89-24f26a693a6a@huawei.com>
	<a0d6c479-7802-eb30-9f5d-0075ca1397f9@huawei.com>
	<d1268e158e8c063c12e7f5ab1e8a72109c4a336a.camel@suse.com>
From: Zhiqiang Liu <liuzhiqiang26@huawei.com>
Message-ID: <e80c36ed-6034-1a4e-59f0-4de34965e55a@huawei.com>
Date: Mon, 17 Aug 2020 22:42:49 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
	Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <d1268e158e8c063c12e7f5ab1e8a72109c4a336a.camel@suse.com>
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
Cc: linfeilong <linfeilong@huawei.com>, Yanxiaodan <yanxiaodan@huawei.com>,
	dm-devel@redhat.com, lixiaokeng <lixiaokeng@huawei.com>
Subject: Re: [dm-devel] [PATCH 6/6] multipathd: return NULL if MALLOC fails
 in alloc_waiteri, func
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
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit



On 2020/8/17 17:21, Martin Wilck wrote:
> On Sun, 2020-08-16 at 09:46 +0800, Zhiqiang Liu wrote:
>> In alloc_waiter func, if MALLOC fails, wp is equal to NULL.
>> If now we call memset(wp), segmentation fault will occur.
>>
>> Signed-off-by: Zhiqiang Liu <liuzhiqiang26@huawei.com>
>> Signed-off-by: lixiaokeng <lixiaokeng@huawei.com>
>> ---
>>  multipathd/waiter.c | 4 +++-
>>  1 file changed, 3 insertions(+), 1 deletion(-)
>>
>> diff --git a/multipathd/waiter.c b/multipathd/waiter.c
>> index e645766..80e6e6e 100644
>> --- a/multipathd/waiter.c
>> +++ b/multipathd/waiter.c
>> @@ -33,8 +33,10 @@ static struct event_thread *alloc_waiter (void)
>>  	struct event_thread *wp;
>>
>>  	wp = (struct event_thread *)MALLOC(sizeof(struct
>> event_thread));
>> -	memset(wp, 0, sizeof(struct event_thread));
>> +	if (!wp)
>> +		return NULL;
>>
>> +	memset(wp, 0, sizeof(struct event_thread));
>>  	return wp;
>>  }
>>
> 
> This is correct, but while you're at it, please also remove the
> superfluous memset() call (counterintuitively, MALLOC(x) maps to
> calloc(1, x)).
> 
> Martin
> 
Thanks for your suggestion.
I will remove the memset() call in v2 patch.

Zhiqiang
> 
> 
> .
> 

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

