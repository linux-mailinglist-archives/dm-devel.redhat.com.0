Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-74.mimecast.com (us-smtp-delivery-74.mimecast.com [216.205.24.74])
	by mail.lfdr.de (Postfix) with ESMTP id B4C49231769
	for <lists+dm-devel@lfdr.de>; Wed, 29 Jul 2020 03:48:45 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-511-ovHxE9xfMJGVqs_3IsO9bQ-1; Tue, 28 Jul 2020 21:48:42 -0400
X-MC-Unique: ovHxE9xfMJGVqs_3IsO9bQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 979491DE1;
	Wed, 29 Jul 2020 01:48:34 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E30805DA2A;
	Wed, 29 Jul 2020 01:48:27 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id D0A88A359F;
	Wed, 29 Jul 2020 01:48:20 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 06T1m800021839 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 28 Jul 2020 21:48:08 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 902C4218ADC4; Wed, 29 Jul 2020 01:48:08 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8BC5E2156A2D
	for <dm-devel@redhat.com>; Wed, 29 Jul 2020 01:48:06 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 467BF86BF5A
	for <dm-devel@redhat.com>; Wed, 29 Jul 2020 01:48:06 +0000 (UTC)
Received: from huawei.com (szxga04-in.huawei.com [45.249.212.190]) (Using
	TLS) by relay.mimecast.com with ESMTP id
	us-mta-513-cy3eH-NhPHqjLxyQsFiBLg-1; Tue, 28 Jul 2020 21:48:03 -0400
X-MC-Unique: cy3eH-NhPHqjLxyQsFiBLg-1
Received: from DGGEMS407-HUB.china.huawei.com (unknown [172.30.72.59])
	by Forcepoint Email with ESMTP id 7E475A740F1A863BF930;
	Wed, 29 Jul 2020 09:47:59 +0800 (CST)
Received: from [127.0.0.1] (10.174.179.249) by DGGEMS407-HUB.china.huawei.com
	(10.3.19.207) with Microsoft SMTP Server id 14.3.487.0;
	Wed, 29 Jul 2020 09:47:50 +0800
To: Benjamin Marzinski <bmarzins@redhat.com>
References: <9bc76686-747f-e85b-d25f-db5a056cf869@huawei.com>
	<20200728162000.GP11089@octiron.msp.redhat.com>
From: Zhiqiang Liu <liuzhiqiang26@huawei.com>
Message-ID: <c07e2946-0355-6317-943d-02774f88840c@huawei.com>
Date: Wed, 29 Jul 2020 09:47:50 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
	Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20200728162000.GP11089@octiron.msp.redhat.com>
Content-Language: en-US
X-Originating-IP: [10.174.179.249]
X-CFilter-Loop: Reflected
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: dm-devel@redhat.com
Cc: "lixiaokeng@huawei.com >> lixiaokeng" <lixiaokeng@huawei.com>,
	Yanxiaodan <yanxiaodan@huawei.com>, linfeilong@huawei.com,
	dm-devel@redhat.com, Zdenek Kabelac <zkabelac@redhat.com>, mwilck@suse.com
Subject: Re: [dm-devel] [PATCH] libmultipath: fix a memory leak in
 disassemble_status func
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
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit



On 2020/7/29 0:20, Benjamin Marzinski wrote:
> On Tue, Jul 28, 2020 at 09:48:06PM +0800, Zhiqiang Liu wrote:
>>
>> In disassemble_status func, for dealing with selector args,
>> word is allocated by get_word func. However, word is not freed.
>> Then a memory leak occurs.
>>
>> Here, we call FREE(word) to free word.
> 
> Err... At the risk of sounding stupid, There is a least-pending
> selector?  Hannes, you added this code (commit 35ad40b4 "leastpending IO
> loadbalancing is not displayed properly"). Was this a Suse thing?  Is it
> still a Suse thing, or have queue-length and service-time replaced it?
> 
Thanks for your reply.
I am sorry that I cannot answer these questions. I found the memory leak through
code review.
In addition, I forget to add a check of whether work is null. I will send the
v2 patch.

> At any rate, for the patch itself (assuming that the correct answer
> isn't to just delete the least-pending code),
> 
> Reviewed-by: Benjamin Marzinski <bmarzins@redhat.com>
>  
>> Signed-off-by: Zhiqiang Liu <liuzhiqiang26@huawei.com>
>> Signed-off-by: lixiaokeng <lixiaokeng@huawei.com>
>> ---
>>  libmultipath/dmparser.c | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/libmultipath/dmparser.c b/libmultipath/dmparser.c
>> index 3dc77242..a4a989b2 100644
>> --- a/libmultipath/dmparser.c
>> +++ b/libmultipath/dmparser.c
>> @@ -584,6 +584,7 @@ int disassemble_status(char *params, struct multipath *mpp)
>>  						   &def_minio) == 1 &&
>>  					    def_minio != mpp->minio)
>>  							mpp->minio = def_minio;
>> +					FREE(word);
>>  				} else
>>  					p += get_word(p, NULL);
>>  			}
>> -- 
>> 2.24.0.windows.2
>>
> 
> 
> .
> 

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

