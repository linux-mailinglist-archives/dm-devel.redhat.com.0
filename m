Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 2C20822BB95
	for <lists+dm-devel@lfdr.de>; Fri, 24 Jul 2020 03:37:51 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-411-JMot3Xe8NYmjzGhPukSeYA-1; Thu, 23 Jul 2020 21:37:48 -0400
X-MC-Unique: JMot3Xe8NYmjzGhPukSeYA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 142F4800597;
	Fri, 24 Jul 2020 01:37:41 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9D2AA10013C2;
	Fri, 24 Jul 2020 01:37:37 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 7F7F6A3581;
	Fri, 24 Jul 2020 01:37:22 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 06O1b6X2025773 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 23 Jul 2020 21:37:07 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 8C292298047; Fri, 24 Jul 2020 01:37:06 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8799122080F
	for <dm-devel@redhat.com>; Fri, 24 Jul 2020 01:37:04 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 754CC805C1A
	for <dm-devel@redhat.com>; Fri, 24 Jul 2020 01:37:04 +0000 (UTC)
Received: from huawei.com (szxga05-in.huawei.com [45.249.212.191]) (Using
	TLS) by relay.mimecast.com with ESMTP id
	us-mta-313-pgJolQFePCeEga3wURO6TQ-1; Thu, 23 Jul 2020 21:36:56 -0400
X-MC-Unique: pgJolQFePCeEga3wURO6TQ-1
Received: from DGGEMS413-HUB.china.huawei.com (unknown [172.30.72.59])
	by Forcepoint Email with ESMTP id 0D9C994E45847C420E2F;
	Fri, 24 Jul 2020 09:36:53 +0800 (CST)
Received: from [127.0.0.1] (10.174.179.249) by DGGEMS413-HUB.china.huawei.com
	(10.3.19.213) with Microsoft SMTP Server id 14.3.487.0;
	Fri, 24 Jul 2020 09:36:45 +0800
To: Benjamin Marzinski <bmarzins@redhat.com>
References: <b1cccadd-955e-0341-879f-01659a04dbb4@huawei.com>
	<20200722205310.GK11089@octiron.msp.redhat.com>
	<fadebd49-d6b0-2813-68b0-57218f8fa13e@huawei.com>
	<20200723132239.GL11089@octiron.msp.redhat.com>
From: Zhiqiang Liu <liuzhiqiang26@huawei.com>
Message-ID: <ec916c01-6d9f-2c8a-cd1b-cb7e3ccf10dd@huawei.com>
Date: Fri, 24 Jul 2020 09:36:45 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
	Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20200723132239.GL11089@octiron.msp.redhat.com>
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit



On 2020/7/23 21:22, Benjamin Marzinski wrote:
> On Thu, Jul 23, 2020 at 09:28:51AM +0800, Zhiqiang Liu wrote:
>>
>>
>> On 2020/7/23 4:53, Benjamin Marzinski wrote:
>>> On Wed, Jul 22, 2020 at 04:41:28PM +0800, Zhiqiang Liu wrote:
>>>> In disassemble_map func, one pp will be allocated and stored in pathvec
>>>> (only in client mode) and pgp->paths. However, if store_path fails, pp
>>>> will not be freed, then memory leak problem occurs.
>>>>
>>>> Here, we will call free_path to free pp when store_path fails.
>>>>
>>>
>>> Reviewed-by: Benjamin Marzinski <bmarzins@redhat.com>
>>>
>>> However, this will need to get reworked on top of Martin's patches (or
>>> incorporated into his next verion patchset).
>>>
>>
>> Thanks for your suggestion.
>> Which branch should I choose to modify my patch?
> 
> Martin's latest set of commits is available here:
> https://github.com/mwilck/multipath-tools/tree/ups/submit-2007
> 
>>
>>
Thanks for your patience.
I will send the V2 patch based on the branch: ups/submit-2007.

>>> -Ben
>>>
>>>> Signed-off-by: Zhiqiang Liu <liuzhiqiang26@huawei.com>
>>>> Signed-off-by: lixiaokeng <lixiaokeng@huawei.com>
>>>> ---
>>>>  libmultipath/dmparser.c | 15 +++++++++++++--
>>>>  1 file changed, 13 insertions(+), 2 deletions(-)
>>>>
>>>> diff --git a/libmultipath/dmparser.c b/libmultipath/dmparser.c
>>>> index 6225838b..3dc77242 100644
>>>> --- a/libmultipath/dmparser.c
>>>> +++ b/libmultipath/dmparser.c
>>>> @@ -142,6 +142,7 @@ int disassemble_map(vector pathvec, char *params, struct multipath *mpp,
>>>>  	int def_minio = 0;
>>>>  	struct path * pp;
>>>>  	struct pathgroup * pgp;
>>>> +	int pp_need_free_flag = 0;
>>>>
>>>>  	p = params;
>>>>
>>>> @@ -293,6 +294,7 @@ int disassemble_map(vector pathvec, char *params, struct multipath *mpp,
>>>>  			char devname[FILE_NAME_SIZE];
>>>>
>>>>  			pp = NULL;
>>>> +			pp_need_free_flag = 0;
>>>>  			p += get_word(p, &word);
>>>>
>>>>  			if (!word)
>>>> @@ -323,9 +325,15 @@ int disassemble_map(vector pathvec, char *params, struct multipath *mpp,
>>>>  					strncpy(pp->wwid, mpp->wwid,
>>>>  						WWID_SIZE - 1);
>>>>  				}
>>>> +
>>>> +				if (is_daemon)
>>>> +					pp_need_free_flag = 1;
>>>> +
>>>>  				/* Only call this in multipath client mode */
>>>> -				if (!is_daemon && store_path(pathvec, pp))
>>>> +				if (!is_daemon && store_path(pathvec, pp)) {
>>>> +					free_path(pp);
>>>>  					goto out1;
>>>> +				}
>>>>  			} else {
>>>>  				if (!strlen(pp->wwid) &&
>>>>  				    strlen(mpp->wwid))
>>>> @@ -334,8 +342,11 @@ int disassemble_map(vector pathvec, char *params, struct multipath *mpp,
>>>>  			}
>>>>  			FREE(word);
>>>>
>>>> -			if (store_path(pgp->paths, pp))
>>>> +			if (store_path(pgp->paths, pp)) {
>>>> +				if (pp_need_free_flag)
>>>> +					free_path(pp);
>>>>  				goto out;
>>>> +			}
>>>>
>>>>  			/*
>>>>  			 * Update wwid for multipaths which are not setup
>>>> -- 
>>>> 2.24.0.windows.2
>>>>
>>>
>>>
>>> .
>>>
> 
> 
> .
> 

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

