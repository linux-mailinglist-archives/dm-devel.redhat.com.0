Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 070E8246929
	for <lists+dm-devel@lfdr.de>; Mon, 17 Aug 2020 17:14:05 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-434-IJWDlWOdMqSzTQOKmNmcKQ-1; Mon, 17 Aug 2020 11:14:02 -0400
X-MC-Unique: IJWDlWOdMqSzTQOKmNmcKQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2A5B21007462;
	Mon, 17 Aug 2020 15:13:55 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E9F111014173;
	Mon, 17 Aug 2020 15:13:52 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 245F9181A050;
	Mon, 17 Aug 2020 15:13:43 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 07HFDZUd032000 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 17 Aug 2020 11:13:36 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 818F22157F24; Mon, 17 Aug 2020 15:13:35 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 72F6A2166BDD
	for <dm-devel@redhat.com>; Mon, 17 Aug 2020 15:13:33 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 02C4218AE955
	for <dm-devel@redhat.com>; Mon, 17 Aug 2020 15:13:33 +0000 (UTC)
Received: from huawei.com (szxga05-in.huawei.com [45.249.212.191]) (Using
	TLS) by relay.mimecast.com with ESMTP id
	us-mta-341-jouA2Q4ZMH2_ZX2SZswdDw-1; Mon, 17 Aug 2020 11:13:26 -0400
X-MC-Unique: jouA2Q4ZMH2_ZX2SZswdDw-1
Received: from DGGEMS413-HUB.china.huawei.com (unknown [172.30.72.59])
	by Forcepoint Email with ESMTP id 2017BB9457F6D84AD20F;
	Mon, 17 Aug 2020 23:13:07 +0800 (CST)
Received: from [127.0.0.1] (10.174.179.249) by DGGEMS413-HUB.china.huawei.com
	(10.3.19.213) with Microsoft SMTP Server id 14.3.487.0;
	Mon, 17 Aug 2020 23:12:57 +0800
To: Martin Wilck <mwilck@suse.com>, <bmarzins@redhat.com>, Christophe Varoqui
	<christophe.varoqui@opensvc.com>, Zdenek Kabelac <zkabelac@redhat.com>
References: <351fa23b-b730-ce22-7e89-24f26a693a6a@huawei.com>
	<2d9db95b-bb88-0d22-1c2d-df459415ee3d@huawei.com>
	<71d49c03470fbb70cc37f757e4804380566fba12.camel@suse.com>
From: Zhiqiang Liu <liuzhiqiang26@huawei.com>
Message-ID: <dd79ea15-f7fd-81a9-8e3d-4840f2d94422@huawei.com>
Date: Mon, 17 Aug 2020 23:12:56 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
	Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <71d49c03470fbb70cc37f757e4804380566fba12.camel@suse.com>
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
Subject: Re: [dm-devel] [PATCH 1/6] checker: remove useless name check in
 checker_get func
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
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 2020/8/17 16:05, Martin Wilck wrote:
> On Sun, 2020-08-16 at 09:42 +0800, Zhiqiang Liu wrote:
>> In checker_get func, input name will be checked before
>> calling checker_class_lookup func, in which name will
>> also be checked.
>>
>> Here, we just remove useless input name check in checker_get func.
>>
>> Signed-off-by: Zhiqiang Liu <liuzhiqiang26@huawei.com>
>> Signed-off-by: lixiaokeng <lixiaokeng@huawei.com>
>> ---
>>  libmultipath/checkers.c | 9 ++++-----
>>  1 file changed, 4 insertions(+), 5 deletions(-)
> 
> Nack. Better safe than sorry. If you look at the generated assembly,
> you'll see that the compiler optimizes this double check away, so
> doesn't inflict runtime overhead, while it makes it easier to verify
> the code.
> 
> I'd ack this if we had a solid convention in the multipath-tools code
> to check parameters always (only) in the callee. But so far we don't.
> I guess if we want to do that, we'd first need to agree on and
> implement a common convention for return values, too.
> 
I agree with you.
The location of the parameter check is not uniform.
Are we dealing with it now? or add it in your TODO list?


> If checker_class_lookup() was non-static and/or the code was executed
> very often, things would also look different to me. But both is not the
> case.
> 



> Regards,
> Martin
> 
> 
> 
>>
>> diff --git a/libmultipath/checkers.c b/libmultipath/checkers.c
>> index f7ddd53..ac41d64 100644
>> --- a/libmultipath/checkers.c
>> +++ b/libmultipath/checkers.c
>> @@ -361,11 +361,10 @@ void checker_get(const char *multipath_dir,
>> struct checker *dst,
>>  	if (!dst)
>>  		return;
>>
>> -	if (name && strlen(name)) {
>> -		src = checker_class_lookup(name);
>> -		if (!src)
>> -			src = add_checker_class(multipath_dir, name);
>> -	}
>> +	src = checker_class_lookup(name);
>> +	if (!src)
>> +		src = add_checker_class(multipath_dir, name);
>> +
>>  	dst->cls = src;
>>  	if (!src)
>>  		return;
> 
> 
> .
> 

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

