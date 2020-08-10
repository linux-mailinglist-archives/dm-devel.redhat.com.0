Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 88528240602
	for <lists+dm-devel@lfdr.de>; Mon, 10 Aug 2020 14:38:17 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-414-JcKaghjaOv2NHlLDRzOk8Q-1; Mon, 10 Aug 2020 08:38:14 -0400
X-MC-Unique: JcKaghjaOv2NHlLDRzOk8Q-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6DDFA800404;
	Mon, 10 Aug 2020 12:38:08 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5CB4110013C2;
	Mon, 10 Aug 2020 12:38:05 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id C0EC197557;
	Mon, 10 Aug 2020 12:38:00 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 07ACbqE6017465 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 10 Aug 2020 08:37:53 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id A05CE10F1BF8; Mon, 10 Aug 2020 12:37:52 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9B83810F1BED
	for <dm-devel@redhat.com>; Mon, 10 Aug 2020 12:37:49 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B4BF08007D7
	for <dm-devel@redhat.com>; Mon, 10 Aug 2020 12:37:49 +0000 (UTC)
Received: from huawei.com (szxga04-in.huawei.com [45.249.212.190]) (Using
	TLS) by relay.mimecast.com with ESMTP id
	us-mta-184-IA5PdcbuPn2yu2l1I5ILGQ-1; Mon, 10 Aug 2020 08:37:46 -0400
X-MC-Unique: IA5PdcbuPn2yu2l1I5ILGQ-1
Received: from DGGEMS401-HUB.china.huawei.com (unknown [172.30.72.60])
	by Forcepoint Email with ESMTP id A1D72812325074AB2AA6;
	Mon, 10 Aug 2020 20:37:42 +0800 (CST)
Received: from [127.0.0.1] (10.174.179.249) by DGGEMS401-HUB.china.huawei.com
	(10.3.19.201) with Microsoft SMTP Server id 14.3.487.0;
	Mon, 10 Aug 2020 20:37:33 +0800
To: Martin Wilck <mwilck@suse.com>, Benjamin Marzinski <bmarzins@redhat.com>, 
	<christophe.varoqui@opensvc.com>, Zdenek Kabelac <zkabelac@redhat.com>
References: <40a7ea22-8897-363a-5821-99add9de6dc5@huawei.com>
	<7d0e4a58ddec95d141433c5f472865cba6961459.camel@suse.com>
From: Zhiqiang Liu <liuzhiqiang26@huawei.com>
Message-ID: <beef8934-d706-25f6-3cb0-18958604e32c@huawei.com>
Date: Mon, 10 Aug 2020 20:37:32 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
	Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <7d0e4a58ddec95d141433c5f472865cba6961459.camel@suse.com>
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
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: dm-devel@redhat.com
Cc: linfeilong@huawei.com, yanxiaodan@huawei.com, dm-devel@redhat.com
Subject: Re: [dm-devel] [PATCH V2] libmultipath: free pp if store_path fails
 in disassemble_map
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit



On 2020/8/10 20:20, Martin Wilck wrote:
> Hello Liu,
> 
> On Fri, 2020-07-24 at 09:40 +0800, Zhiqiang Liu wrote:
>> In disassemble_map func, one pp will be allocated and stored in
>> pgp->paths. However, if store_path fails, pp will not be freed,
>> then memory leak problem occurs.
>>
>> Here, we will call free_path to free pp when store_path fails.
>>
>> Signed-off-by: Zhiqiang Liu <liuzhiqiang26@huawei.com>
>> Signed-off-by: lixiaokeng <lixiaokeng@huawei.com>
>> ---
>> V1->V2: update based on ups/submit-2007 branch.
>>
>>  libmultipath/dmparser.c | 9 +++++++--
>>  1 file changed, 7 insertions(+), 2 deletions(-)
>>
> 
> thanks for the patch. I'd suggest to do this without the pp_alloc_flag
> variable, by pulling the store_path() call into the if (!pp)
> conditional and treating failure differently in both branches of the
> conditional. (Side note: if we introduce a boolean like this, we should
> use "bool" as the variable type).
> 
> Unless you object, I'll add that change on top of my submit-2007
> series, giving you appropriate credits.
> 
Thanks for you review.

You are free to deal with the patch.


> @Ben, @Christophe: I've been considering for some time to start
> handling cases like this with __attribute__((cleanup(f)))) (
> https://gcc.gnu.org/onlinedocs/gcc/Common-Variable-Attributes.html).
> That could reduce the amount of goto clauses for error handling
> significantly. It would be a major change in coding style though. What
> do you think?
> 
> Regards,
> Martin
> 
> 
>> diff --git a/libmultipath/dmparser.c b/libmultipath/dmparser.c
>> index b9858fa5..8a0501ba 100644
>> --- a/libmultipath/dmparser.c
>> +++ b/libmultipath/dmparser.c
>> @@ -143,6 +143,7 @@ int disassemble_map(const struct _vector
>> *pathvec,
>>  	int def_minio = 0;
>>  	struct path * pp;
>>  	struct pathgroup * pgp;
>> +	int pp_alloc_flag = 0;
>>
>>  	assert(pathvec != NULL);
>>  	p = params;
>> @@ -292,6 +293,7 @@ int disassemble_map(const struct _vector
>> *pathvec,
>>
>>  		for (j = 0; j < num_paths; j++) {
>>  			pp = NULL;
>> +			pp_alloc_flag = 0;
>>  			p += get_word(p, &word);
>>
>>  			if (!word)
>> @@ -304,13 +306,16 @@ int disassemble_map(const struct _vector
>> *pathvec,
>>
>>  				if (!pp)
>>  					goto out1;
>> -
>> +				pp_alloc_flag = 1;
>>  				strlcpy(pp->dev_t, word, BLK_DEV_SIZE);
>>  			}
>>  			FREE(word);
>>
>> -			if (store_path(pgp->paths, pp))
>> +			if (store_path(pgp->paths, pp)) {
>> +				if (pp_alloc_flag)
>> +					free_path(pp);
>>  				goto out;
>> +			}
>>
>>  			pgp->id ^= (long)pp;
>>  			pp->pgindex = i + 1;
> 
> 
> 
> .
> 

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

