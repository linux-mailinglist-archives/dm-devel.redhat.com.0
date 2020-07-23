Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 68F9B22A49B
	for <lists+dm-devel@lfdr.de>; Thu, 23 Jul 2020 03:30:16 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-429-tlFRrh17O7yQRZht9c-gUQ-1; Wed, 22 Jul 2020 21:30:13 -0400
X-MC-Unique: tlFRrh17O7yQRZht9c-gUQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 38B73106B242;
	Thu, 23 Jul 2020 01:30:03 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1F1EB71D00;
	Thu, 23 Jul 2020 01:29:58 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 0625E730C0;
	Thu, 23 Jul 2020 01:29:29 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 06N1TBtH019130 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 22 Jul 2020 21:29:11 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 7718210484A; Thu, 23 Jul 2020 01:29:11 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7212510484D
	for <dm-devel@redhat.com>; Thu, 23 Jul 2020 01:29:07 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6FBF28007A4
	for <dm-devel@redhat.com>; Thu, 23 Jul 2020 01:29:07 +0000 (UTC)
Received: from huawei.com (szxga07-in.huawei.com [45.249.212.35]) (Using
	TLS) by relay.mimecast.com with ESMTP id
	us-mta-217-uWXsNXh1Oj-RAD9xxEPQQA-1; Wed, 22 Jul 2020 21:29:02 -0400
X-MC-Unique: uWXsNXh1Oj-RAD9xxEPQQA-1
Received: from DGGEMS413-HUB.china.huawei.com (unknown [172.30.72.58])
	by Forcepoint Email with ESMTP id EBF972352B607D2D7D78;
	Thu, 23 Jul 2020 09:28:57 +0800 (CST)
Received: from [127.0.0.1] (10.174.179.249) by DGGEMS413-HUB.china.huawei.com
	(10.3.19.213) with Microsoft SMTP Server id 14.3.487.0;
	Thu, 23 Jul 2020 09:28:51 +0800
To: Benjamin Marzinski <bmarzins@redhat.com>
References: <b1cccadd-955e-0341-879f-01659a04dbb4@huawei.com>
	<20200722205310.GK11089@octiron.msp.redhat.com>
From: Zhiqiang Liu <liuzhiqiang26@huawei.com>
Message-ID: <fadebd49-d6b0-2813-68b0-57218f8fa13e@huawei.com>
Date: Thu, 23 Jul 2020 09:28:51 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
	Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20200722205310.GK11089@octiron.msp.redhat.com>
Content-Language: en-US
X-Originating-IP: [10.174.179.249]
X-CFilter-Loop: Reflected
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: dm-devel@redhat.com
Cc: yanxiaodan@huawei.com, linfeilong@huawei.com, dm-devel@redhat.com,
	Zdenek Kabelac <zkabelac@redhat.com>, mwilck@suse.com
Subject: Re: [dm-devel] [PATCH] libmultipath: free pp if store_path fails in
 disassemble_map
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit



On 2020/7/23 4:53, Benjamin Marzinski wrote:
> On Wed, Jul 22, 2020 at 04:41:28PM +0800, Zhiqiang Liu wrote:
>> In disassemble_map func, one pp will be allocated and stored in pathvec
>> (only in client mode) and pgp->paths. However, if store_path fails, pp
>> will not be freed, then memory leak problem occurs.
>>
>> Here, we will call free_path to free pp when store_path fails.
>>
> 
> Reviewed-by: Benjamin Marzinski <bmarzins@redhat.com>
> 
> However, this will need to get reworked on top of Martin's patches (or
> incorporated into his next verion patchset).
> 

Thanks for your suggestion.
Which branch should I choose to modify my patch?


> -Ben
> 
>> Signed-off-by: Zhiqiang Liu <liuzhiqiang26@huawei.com>
>> Signed-off-by: lixiaokeng <lixiaokeng@huawei.com>
>> ---
>>  libmultipath/dmparser.c | 15 +++++++++++++--
>>  1 file changed, 13 insertions(+), 2 deletions(-)
>>
>> diff --git a/libmultipath/dmparser.c b/libmultipath/dmparser.c
>> index 6225838b..3dc77242 100644
>> --- a/libmultipath/dmparser.c
>> +++ b/libmultipath/dmparser.c
>> @@ -142,6 +142,7 @@ int disassemble_map(vector pathvec, char *params, struct multipath *mpp,
>>  	int def_minio = 0;
>>  	struct path * pp;
>>  	struct pathgroup * pgp;
>> +	int pp_need_free_flag = 0;
>>
>>  	p = params;
>>
>> @@ -293,6 +294,7 @@ int disassemble_map(vector pathvec, char *params, struct multipath *mpp,
>>  			char devname[FILE_NAME_SIZE];
>>
>>  			pp = NULL;
>> +			pp_need_free_flag = 0;
>>  			p += get_word(p, &word);
>>
>>  			if (!word)
>> @@ -323,9 +325,15 @@ int disassemble_map(vector pathvec, char *params, struct multipath *mpp,
>>  					strncpy(pp->wwid, mpp->wwid,
>>  						WWID_SIZE - 1);
>>  				}
>> +
>> +				if (is_daemon)
>> +					pp_need_free_flag = 1;
>> +
>>  				/* Only call this in multipath client mode */
>> -				if (!is_daemon && store_path(pathvec, pp))
>> +				if (!is_daemon && store_path(pathvec, pp)) {
>> +					free_path(pp);
>>  					goto out1;
>> +				}
>>  			} else {
>>  				if (!strlen(pp->wwid) &&
>>  				    strlen(mpp->wwid))
>> @@ -334,8 +342,11 @@ int disassemble_map(vector pathvec, char *params, struct multipath *mpp,
>>  			}
>>  			FREE(word);
>>
>> -			if (store_path(pgp->paths, pp))
>> +			if (store_path(pgp->paths, pp)) {
>> +				if (pp_need_free_flag)
>> +					free_path(pp);
>>  				goto out;
>> +			}
>>
>>  			/*
>>  			 * Update wwid for multipaths which are not setup
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

