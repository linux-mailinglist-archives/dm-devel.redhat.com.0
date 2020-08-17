Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 8A465246B45
	for <lists+dm-devel@lfdr.de>; Mon, 17 Aug 2020 17:52:01 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-484--RRujqNgNoGlOf1sDsJ1uw-1; Mon, 17 Aug 2020 11:51:58 -0400
X-MC-Unique: -RRujqNgNoGlOf1sDsJ1uw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B821D1800D41;
	Mon, 17 Aug 2020 15:51:51 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 587DD6F15D;
	Mon, 17 Aug 2020 15:51:45 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 2077C4EE15;
	Mon, 17 Aug 2020 15:51:35 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 07HFnX2P004759 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 17 Aug 2020 11:49:33 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 5FA9F2166BB3; Mon, 17 Aug 2020 15:49:33 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5B9992166BCC
	for <dm-devel@redhat.com>; Mon, 17 Aug 2020 15:49:31 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 441488040A8
	for <dm-devel@redhat.com>; Mon, 17 Aug 2020 15:49:31 +0000 (UTC)
Received: from huawei.com (szxga04-in.huawei.com [45.249.212.190]) (Using
	TLS) by relay.mimecast.com with ESMTP id
	us-mta-69-OLHuDp9pOeaSkjasDu8JHw-1; Mon, 17 Aug 2020 11:49:28 -0400
X-MC-Unique: OLHuDp9pOeaSkjasDu8JHw-1
Received: from DGGEMS404-HUB.china.huawei.com (unknown [172.30.72.60])
	by Forcepoint Email with ESMTP id 69444314320568888AB6;
	Mon, 17 Aug 2020 23:49:17 +0800 (CST)
Received: from [127.0.0.1] (10.174.179.249) by DGGEMS404-HUB.china.huawei.com
	(10.3.19.204) with Microsoft SMTP Server id 14.3.487.0;
	Mon, 17 Aug 2020 23:49:06 +0800
To: Martin Wilck <mwilck@suse.com>, <bmarzins@redhat.com>, Christophe Varoqui
	<christophe.varoqui@opensvc.com>, Zdenek Kabelac <zkabelac@redhat.com>
References: <351fa23b-b730-ce22-7e89-24f26a693a6a@huawei.com>
	<2d9db95b-bb88-0d22-1c2d-df459415ee3d@huawei.com>
	<71d49c03470fbb70cc37f757e4804380566fba12.camel@suse.com>
	<dd79ea15-f7fd-81a9-8e3d-4840f2d94422@huawei.com>
	<708dd1bae5ec1c7c2b477a1b3f6f2b05318399dd.camel@suse.com>
From: Zhiqiang Liu <liuzhiqiang26@huawei.com>
Message-ID: <a7c534cd-6a4b-7d2d-8b74-a6c94e43699f@huawei.com>
Date: Mon, 17 Aug 2020 23:49:05 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
	Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <708dd1bae5ec1c7c2b477a1b3f6f2b05318399dd.camel@suse.com>
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit



On 2020/8/17 23:25, Martin Wilck wrote:
> On Mon, 2020-08-17 at 23:12 +0800, Zhiqiang Liu wrote:
>> On 2020/8/17 16:05, Martin Wilck wrote:
>>> On Sun, 2020-08-16 at 09:42 +0800, Zhiqiang Liu wrote:
>>>> In checker_get func, input name will be checked before
>>>> calling checker_class_lookup func, in which name will
>>>> also be checked.
>>>>
>>>> Here, we just remove useless input name check in checker_get
>>>> func.
>>>>
>>>> Signed-off-by: Zhiqiang Liu <liuzhiqiang26@huawei.com>
>>>> Signed-off-by: lixiaokeng <lixiaokeng@huawei.com>
>>>> ---
>>>>  libmultipath/checkers.c | 9 ++++-----
>>>>  1 file changed, 4 insertions(+), 5 deletions(-)
>>>
>>> Nack. Better safe than sorry. If you look at the generated
>>> assembly,
>>> you'll see that the compiler optimizes this double check away, so
>>> doesn't inflict runtime overhead, while it makes it easier to
>>> verify
>>> the code.
>>>
>>> I'd ack this if we had a solid convention in the multipath-tools
>>> code
>>> to check parameters always (only) in the callee. But so far we
>>> don't.
>>> I guess if we want to do that, we'd first need to agree on and
>>> implement a common convention for return values, too.
>>>
>> I agree with you.
>> The location of the parameter check is not uniform.
>> Are we dealing with it now? or add it in your TODO list?
> 
> We don't have an official todo list. I tend to handle such "style"
> things incrementally - when I touch some code for some non-trivial
> reason, I also add "style" changes as appropriate (look at "constify"
> changes in recent multipath-tools commits, for example).
> 
> I believe that most functions in multipath-tools already check the
> passed arguments (in the callee), and I believe that this is where it
> should be done. Let's have an eye on this for some time to come.
> Eventually we can audit the entire code to make sure all functions do
> this properly, and once that's done, we can start removing the
> respective checks in callers, at least some.
> 
> Does that make sense?
> 
> Cheers,
> Martin
> 

Thank you for your patience.
Because I am learning and reviewing multipath-tools code,
I'll be happy to push a patch to handle such "style" things.

Regards
Zhiqiang Liu


> 
> 
> 
> 
>>
>>
>>> If checker_class_lookup() was non-static and/or the code was
>>> executed
>>> very often, things would also look different to me. But both is not
>>> the
>>> case.
>>>
>>
>>
>>> Regards,
>>> Martin
>>>
>>>
>>>
>>>> diff --git a/libmultipath/checkers.c b/libmultipath/checkers.c
>>>> index f7ddd53..ac41d64 100644
>>>> --- a/libmultipath/checkers.c
>>>> +++ b/libmultipath/checkers.c
>>>> @@ -361,11 +361,10 @@ void checker_get(const char *multipath_dir,
>>>> struct checker *dst,
>>>>  	if (!dst)
>>>>  		return;
>>>>
>>>> -	if (name && strlen(name)) {
>>>> -		src = checker_class_lookup(name);
>>>> -		if (!src)
>>>> -			src = add_checker_class(multipath_dir, name);
>>>> -	}
>>>> +	src = checker_class_lookup(name);
>>>> +	if (!src)
>>>> +		src = add_checker_class(multipath_dir, name);
>>>> +
>>>>  	dst->cls = src;
>>>>  	if (!src)
>>>>  		return;
>>>
>>> .
>>>
> 
> 
> 
> .
> 

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

