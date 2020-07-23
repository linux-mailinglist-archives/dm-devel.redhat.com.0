Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id E65B322A4F1
	for <lists+dm-devel@lfdr.de>; Thu, 23 Jul 2020 03:56:35 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-442-CBqqzUHGO6anVdmS17zALA-1; Wed, 22 Jul 2020 21:56:32 -0400
X-MC-Unique: CBqqzUHGO6anVdmS17zALA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 83A50800597;
	Thu, 23 Jul 2020 01:56:26 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8FB675D9D3;
	Thu, 23 Jul 2020 01:56:21 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 53716730C0;
	Thu, 23 Jul 2020 01:55:58 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 06N1Ptha018893 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 22 Jul 2020 21:25:55 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 111A8104848; Thu, 23 Jul 2020 01:25:55 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0CE9610482F
	for <dm-devel@redhat.com>; Thu, 23 Jul 2020 01:25:53 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 06A1F8007A4
	for <dm-devel@redhat.com>; Thu, 23 Jul 2020 01:25:53 +0000 (UTC)
Received: from huawei.com (szxga05-in.huawei.com [45.249.212.191]) (Using
	TLS) by relay.mimecast.com with ESMTP id
	us-mta-337-dzftgc_UO2upB4lQ0-RleA-1; Wed, 22 Jul 2020 21:25:48 -0400
X-MC-Unique: dzftgc_UO2upB4lQ0-RleA-1
Received: from DGGEMS407-HUB.china.huawei.com (unknown [172.30.72.60])
	by Forcepoint Email with ESMTP id 4BDD326EFEC07B0D127E;
	Thu, 23 Jul 2020 09:25:43 +0800 (CST)
Received: from [127.0.0.1] (10.174.179.249) by DGGEMS407-HUB.china.huawei.com
	(10.3.19.207) with Microsoft SMTP Server id 14.3.487.0;
	Thu, 23 Jul 2020 09:25:35 +0800
To: Benjamin Marzinski <bmarzins@redhat.com>
References: <e58b31e0-4f66-072f-b9c6-1047714cf3bf@huawei.com>
	<20200722204843.GJ11089@octiron.msp.redhat.com>
From: Zhiqiang Liu <liuzhiqiang26@huawei.com>
Message-ID: <238de4fe-6261-ec14-9053-4524da28ac39@huawei.com>
Date: Thu, 23 Jul 2020 09:25:34 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
	Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20200722204843.GJ11089@octiron.msp.redhat.com>
Content-Language: en-US
X-Originating-IP: [10.174.179.249]
X-CFilter-Loop: Reflected
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: dm-devel@redhat.com
Cc: lixiaokeng <lixiaokeng@huawei.com>, Yanxiaodan <yanxiaodan@huawei.com>,
	linfeilong <linfeilong@huawei.com>, dm-devel@redhat.com, Zdenek
	Kabelac <zkabelac@redhat.com>, Martin Wilck <mwilck@suse.com>
Subject: Re: [dm-devel] [PATCH] libmultipath: free pgp if add_pathgroup
 fails in disassemble_map func
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

Thanks for your review.

On 2020/7/23 4:48, Benjamin Marzinski wrote:
> On Wed, Jul 22, 2020 at 04:36:04PM +0800, Zhiqiang Liu wrote:
>> In disassemble_map func, pgp will be added to mpp->pg by calling
>> add_pathgroup after allocing a pathgroup (pgp) successfully. However,
>> if add_pathgroup fails, the pgp is actually not inserted into mpp->pg.
>> So, calling free_pgvec(mpp->pg) cannot free the pgp, then memory leak
>> problem occurs.
>>
>> disassemble_map:
>> -> pgp = alloc_pathgroup()
>> -> if add_pathgroup(mpp, pgp) fails
>> 	-> goto out
>> out:
>> free_pgvec(mpp->pg, KEEP_PATHS);
>>
>> Here, we will call free_pathgroup(pgp) before going to out tag.
>>
> 
> Reviewed-by: Benjamin Marzinski <bmarzins@redhat.com>
> 
>> Signed-off-by: Zhiqiang Liu <liuzhiqiang26@huawei.com>
>> Signed-off-by: lixiaokeng <lixiaokeng@huawei.com>
>> ---
>>  libmultipath/dmparser.c | 4 +++-
>>  1 file changed, 3 insertions(+), 1 deletion(-)
>>
>> diff --git a/libmultipath/dmparser.c b/libmultipath/dmparser.c
>> index ac13ec06..6225838b 100644
>> --- a/libmultipath/dmparser.c
>> +++ b/libmultipath/dmparser.c
>> @@ -268,8 +268,10 @@ int disassemble_map(vector pathvec, char *params, struct multipath *mpp,
>>  		if (!pgp)
>>  			goto out;
>>
>> -		if (add_pathgroup(mpp, pgp))
>> +		if (add_pathgroup(mpp, pgp)) {
>> +			free_pathgroup(pgp, KEEP_PATHS);
>>  			goto out;
>> +		}
>>
>>  		p += get_word(p, &word);
>>
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

