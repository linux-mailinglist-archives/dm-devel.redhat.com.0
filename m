Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id BB0AD24871B
	for <lists+dm-devel@lfdr.de>; Tue, 18 Aug 2020 16:17:34 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-427-jU-RkqirPDO8FZgqCxu6AA-1; Tue, 18 Aug 2020 10:17:30 -0400
X-MC-Unique: jU-RkqirPDO8FZgqCxu6AA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0703181F017;
	Tue, 18 Aug 2020 14:17:24 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6DE027B903;
	Tue, 18 Aug 2020 14:17:20 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id CB788181A06B;
	Tue, 18 Aug 2020 14:17:12 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 07HFpdAG005066 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 17 Aug 2020 11:51:39 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 0C67010054C3; Mon, 17 Aug 2020 15:51:39 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 082531111C75
	for <dm-devel@redhat.com>; Mon, 17 Aug 2020 15:51:36 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4E3BD80121D
	for <dm-devel@redhat.com>; Mon, 17 Aug 2020 15:51:36 +0000 (UTC)
Received: from huawei.com (szxga07-in.huawei.com [45.249.212.35]) (Using
	TLS) by relay.mimecast.com with ESMTP id
	us-mta-490-jjDBn0W0Nseqxx88KZx6-Q-1; Mon, 17 Aug 2020 11:51:30 -0400
X-MC-Unique: jjDBn0W0Nseqxx88KZx6-Q-1
Received: from DGGEMS405-HUB.china.huawei.com (unknown [172.30.72.59])
	by Forcepoint Email with ESMTP id 53D0687E438CBAE62AAD;
	Mon, 17 Aug 2020 23:51:24 +0800 (CST)
Received: from [127.0.0.1] (10.174.179.249) by DGGEMS405-HUB.china.huawei.com
	(10.3.19.205) with Microsoft SMTP Server id 14.3.487.0;
	Mon, 17 Aug 2020 23:51:14 +0800
To: Martin Wilck <mwilck@suse.com>, <bmarzins@redhat.com>, Christophe Varoqui
	<christophe.varoqui@opensvc.com>, Zdenek Kabelac <zkabelac@redhat.com>
References: <351fa23b-b730-ce22-7e89-24f26a693a6a@huawei.com>
	<2d7cd13e-d1df-5fc7-9403-1f845faf64d7@huawei.com>
	<e5de8fe451462738776acb8c4107e729828e87a2.camel@suse.com>
	<d44fd311-e66b-b196-6735-919f02e39ff4@huawei.com>
	<dbec56af9d3e25ab7c3806abf8ac86f4c160302f.camel@suse.com>
From: Zhiqiang Liu <liuzhiqiang26@huawei.com>
Message-ID: <f67bcb89-3e69-e880-86dc-02133f7e8928@huawei.com>
Date: Mon, 17 Aug 2020 23:51:13 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
	Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <dbec56af9d3e25ab7c3806abf8ac86f4c160302f.camel@suse.com>
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
X-Mailman-Approved-At: Tue, 18 Aug 2020 10:17:04 -0400
Cc: linfeilong <linfeilong@huawei.com>, Yanxiaodan <yanxiaodan@huawei.com>,
	dm-devel@redhat.com, lixiaokeng <lixiaokeng@huawei.com>
Subject: Re: [dm-devel] [PATCH 3/6] multipathd: adopt static char* arr in
 sd_notify_status func
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



On 2020/8/17 23:44, Martin Wilck wrote:
> On Mon, 2020-08-17 at 23:33 +0800, Zhiqiang Liu wrote:
>>
>> On 2020/8/17 16:35, Martin Wilck wrote:
>>> On Sun, 2020-08-16 at 09:44 +0800, Zhiqiang Liu wrote:
>>>> We adopt static char* array (sd_notify_status_msg) in
>>>> sd_notify_status func, so it looks more simpler and easier
>>>> to expand.
>>>>
>>>> Signed-off-by: Zhiqiang Liu <liuzhiqiang26@huawei.com>
>>>> Signed-off-by: lixiaokeng <lixiaokeng@huawei.com>
>>>> ---
>>>>  multipathd/main.c | 26 ++++++++++++--------------
>>>>  1 file changed, 12 insertions(+), 14 deletions(-)
>>>>
>>>> diff --git a/multipathd/main.c b/multipathd/main.c
>>>> index cab1d0d..a09ccd1 100644
>>>> --- a/multipathd/main.c
>>>> +++ b/multipathd/main.c
>>>> @@ -177,23 +177,21 @@ daemon_status(void)
>>>>   * I love you too, systemd ...
>>>>   */
>>>>  #ifdef USE_SYSTEMD
>>>> +static const char *sd_notify_status_msg[DAEMON_STATUS_SIZE] = {
>>>> +	[DAEMON_INIT] = "STATUS=init",
>>>> +	[DAEMON_START] = "STATUS=startup",
>>>> +	[DAEMON_CONFIGURE] = "STATUS=configure",
>>>> +	[DAEMON_IDLE] = "STATUS=up",
>>>> +	[DAEMON_RUNNING] = "STATUS=up",
>>>> +	[DAEMON_SHUTDOWN] = "STATUS=shutdown",
>>>> +};
>>>> +
>>>
>>> This repetition of "STATUS=" looks clumsy. It's not your fault,
>>> because
>>> the current code does the same thing. But if you want to clean this
>>> up,
>>> please create the notification string in a dynamic buffer, and use
>>> daemon_status() for those cases where it applies.
>>>
>>> Regards
>>> Martin
>>>
>> Thanks for your reply.
>> Besides the prefixes "STATUS=", there are also some differences
>> between
>> sd_notify_status_msg[DAEMON_IDLE|DAEMON_RUNNING] and
>> demon_status_msg[DAEMON_IDLE|DAEMON_RUNNING].
>>
>> For example,
>> sd_notify_status_msg[DAEMON_RUNNING] = "STATUS=up",
>> demon_status_msg[DAEMON_RUNNING] = "running"
>>
>> So if we create the notification string in a dynamic buffer with
>> using daemon_status, we have to make some special judgement
>> on DAEMON_RUNNING and DAEMON_IDLE status. This may be why
>> the sd_notify_status func was created.
>>
>> We can implement both solutions. Martin, which one do you prefer?
> 
> That's what I meant with "where it applies". You treat the IDLE and
> RUNNING cases first (probably in a switch statement), and use
> daemon_status() for the "default" case.
> 
> The  reason we don't differentiate between "running" and "idle" in the
> sd_notify() code path is that the daemon switches between these states
> very often (at least once per tick) and these notifications causes lots
> of dbus traffic without much value.
> 
> Regards
> Martin
> 

I will do that as your suggestion in v2 patch.
Thanks again.

Regards
Zhiqiang Liu

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

