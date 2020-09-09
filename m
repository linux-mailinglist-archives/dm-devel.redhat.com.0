Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 8986E2625CD
	for <lists+dm-devel@lfdr.de>; Wed,  9 Sep 2020 05:19:21 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-321-ICDrTlQqPUara099XXmBpg-1; Tue, 08 Sep 2020 23:19:17 -0400
X-MC-Unique: ICDrTlQqPUara099XXmBpg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8750B1005504;
	Wed,  9 Sep 2020 03:19:10 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2E3D278380;
	Wed,  9 Sep 2020 03:19:06 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 28EF47A00E;
	Wed,  9 Sep 2020 03:18:58 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0893Ilj2027275 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 8 Sep 2020 23:18:47 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id F275CB34EA; Wed,  9 Sep 2020 03:18:46 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id ED94CB3026
	for <dm-devel@redhat.com>; Wed,  9 Sep 2020 03:18:44 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9A52F80096B
	for <dm-devel@redhat.com>; Wed,  9 Sep 2020 03:18:44 +0000 (UTC)
Received: from huawei.com (szxga06-in.huawei.com [45.249.212.32]) (Using
	TLS) by relay.mimecast.com with ESMTP id
	us-mta-554-lu-_qPq5MmunFlbe1WUOrQ-1; Tue, 08 Sep 2020 23:18:42 -0400
X-MC-Unique: lu-_qPq5MmunFlbe1WUOrQ-1
Received: from DGGEMS402-HUB.china.huawei.com (unknown [172.30.72.58])
	by Forcepoint Email with ESMTP id 11846E3C484B9C969834;
	Wed,  9 Sep 2020 11:18:34 +0800 (CST)
Received: from [127.0.0.1] (10.174.178.161) by DGGEMS402-HUB.china.huawei.com
	(10.3.19.202) with Microsoft SMTP Server id 14.3.487.0;
	Wed, 9 Sep 2020 11:18:25 +0800
To: Martin Wilck <mwilck@suse.com>, Benjamin Marzinski <bmarzins@redhat.com>
References: <37544d4c-950f-4281-3b66-e4d1884c5167@huawei.com>
	<40cf77df-eaa3-fb72-69fd-9f865d12dc34@huawei.com>
	<20200904213048.GE11108@octiron.msp.redhat.com>
	<8dd72a70-991a-cb7d-3279-3d5036df1b9d@huawei.com>
	<20200908154540.GK11108@octiron.msp.redhat.com>
	<c50b9997b3c4a55d6a2858cd6b931bea93b14bfe.camel@suse.com>
From: lixiaokeng <lixiaokeng@huawei.com>
Message-ID: <3154dc82-e5cf-5d34-6955-04a0ad6e01f0@huawei.com>
Date: Wed, 9 Sep 2020 11:18:24 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
	Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <c50b9997b3c4a55d6a2858cd6b931bea93b14bfe.camel@suse.com>
X-Originating-IP: [10.174.178.161]
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
Cc: linfeilong <linfeilong@huawei.com>,
	dm-devel mailing list <dm-devel@redhat.com>,
	"liuzhiqiang \(I\)" <liuzhiqiang26@huawei.com>
Subject: Re: [dm-devel] [PATCH 09/14] libmultipath: check whether
 mp->features is NULl in, assemble_map
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
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Language: en-GB



On 2020/9/9 0:35, Martin Wilck wrote:
> On Tue, 2020-09-08 at 10:45 -0500, Benjamin Marzinski wrote:
>> On Mon, Sep 07, 2020 at 08:21:28PM +0800, lixiaokeng wrote:
>>>>> @@ -86,9 +86,12 @@ assemble_map (struct multipath * mp, char *
>>>>> params, int len)
>>>>>  	    get_linux_version_code() < KERNEL_VERSION(4, 3, 0))
>>>>>  		add_feature(&mp->features, retain_hwhandler);
>>>>>
>>>>> -	f = STRDUP(mp->features);
>>>>
>>>> clearly strdup()ing without checking if mp->features NULL is
>>>> incorrect.
>>>> However, I'm not sure that we need to fail if mp->features is
>>>> NULL.
>>>> instead, int the APPEND call, we could use the gcc ternary
>>>> operator
>>>> extension
>>>>
>>>> (mp->features)?: "0"
>>>>
>>>> to use "0" if mp->features is NULL.
>>>>
>>>> Also, have you seen this actually occur?  Or is this just a
>>>> theoretical
>>>> issue that you've found from reading the code.  It seems like
>>>> setup_map() will always call select_features() before calling
>>>> assemble_map(), which should mean that mp->features will always
>>>> be set
>>>> in this case. Perhaps I'm missing something here.
>>>>
>>>> -Ben
>>>>
>>> Hi Ben,
>>>   This just a theoretical issue and I did not see it. But it's not
>>> necessary
>>> to call strdup. In your opinion, need multipath be checked?  I will
>>> make new
>>> patch with your suggestion.
>>
>> Since we don't believe it's possible for mp->features (or mp-
>>> hwhandler)
>> to be set to NULL here, it makes sense to print an error if it is
>> NULL.
>> So, I guess my suggestion would be to print an error message if
>> mp->features or mp->hwhandler are NULL, but to assemble the map
>> anyway,
>> using the default value of "0" if they are NULL. That's how
>> assemble_map() currently handles failures in add_feature().
>> add_feature() will print an error, but assemble_map() will go ahead
>> with
>> assembling the map.
>>
>> I'm willing to be convinced that there is a better solution, however.
> 
> What about this:
> 
> assemble_map() is only called from setup_map(), which sets mp->features 
> in select_features(). So what we should do is check for NULL after
> select_features(), or have that function return an error code if strdup
> fails, and bail out early in setup_map() in that case.
> 
> Then we simply need to add a comment in assemble_map() saying that 
> mp->features must be non-null when this function is called.
> 
> As I said earlier, I'm of course not against checking function
> parameters, but here we should fail to setup a "struct multipath" in
> the first place in setup map(), rather than returning an incompletely
> initialized one. If we handle it this way, we don't need to check the
> fields of struct multipath over and over again. Similar arguments hold
> for other structs.
> 
> Of course this kind of assumption needs to be better documented in the
> code.
> 
> Regards
> Martin
> 
> 
Hi Martin,
   If I don't misunderstand, we check feature after select_features and
return 1 if feature is NULL in setup_map. We delete strdup and add
message "mp->features must be non-null" in assemble_map. Like this:
---
select_features(conf, mpp);
if (!mpp->featrues)
	return 1;

---
/* mp->feature must not be NULL */
APPEND(p, end, "%s %s %i %i", mp->features, mp->hwhandler
---

Regards
Lixiaokeng

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

