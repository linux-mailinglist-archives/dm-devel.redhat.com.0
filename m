Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 609F42257CC
	for <lists+dm-devel@lfdr.de>; Mon, 20 Jul 2020 08:35:57 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-93-U61nx8jPMYusz56yP81Skw-1; Mon, 20 Jul 2020 02:35:53 -0400
X-MC-Unique: U61nx8jPMYusz56yP81Skw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5A01C1005510;
	Mon, 20 Jul 2020 06:35:48 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 416DD5D9DD;
	Mon, 20 Jul 2020 06:35:45 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 36F6A1809554;
	Mon, 20 Jul 2020 06:35:30 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 06K6ZEgH003840 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 20 Jul 2020 02:35:14 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 146351004C60; Mon, 20 Jul 2020 06:35:14 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0FCE210054E1
	for <dm-devel@redhat.com>; Mon, 20 Jul 2020 06:35:12 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 03B9983B847
	for <dm-devel@redhat.com>; Mon, 20 Jul 2020 06:35:12 +0000 (UTC)
Received: from huawei.com (szxga07-in.huawei.com [45.249.212.35]) (Using
	TLS) by relay.mimecast.com with ESMTP id
	us-mta-335-JlsUQ_KSOleVPZsXmvdRIQ-1; Mon, 20 Jul 2020 02:35:09 -0400
X-MC-Unique: JlsUQ_KSOleVPZsXmvdRIQ-1
Received: from DGGEMS402-HUB.china.huawei.com (unknown [172.30.72.59])
	by Forcepoint Email with ESMTP id 67446232BFFB5FED9A62;
	Mon, 20 Jul 2020 14:19:41 +0800 (CST)
Received: from [127.0.0.1] (10.174.179.249) by DGGEMS402-HUB.china.huawei.com
	(10.3.19.202) with Microsoft SMTP Server id 14.3.487.0;
	Mon, 20 Jul 2020 14:19:33 +0800
To: Martin Wilck <mwilck@suse.com>, Benjamin Marzinski <bmarzins@redhat.com>
References: <6eb10725-456f-de68-e927-1f5a9771c16c@huawei.com>
	<86d8307c-1747-2254-4f87-fac36f0d51ca@redhat.com>
	<0d26c9f6-4379-f201-a9a5-839bddef3f25@huawei.com>
	<92db2c49d0ddbbc385c6a14ef3d99a54457b908e.camel@suse.com>
	<b482dfdb-a40b-e523-1dcc-d37ddc4fc399@redhat.com>
	<f818352533682ae13fee17eb945fc2c9f62d15cd.camel@suse.com>
	<20200714222241.GK11089@octiron.msp.redhat.com>
	<1943423d8efe0deac64595f71bb56e06b52cdd7c.camel@suse.com>
From: Zhiqiang Liu <liuzhiqiang26@huawei.com>
Message-ID: <87fb8f6a-3a33-a804-6f49-f0f029c7c13f@huawei.com>
Date: Mon, 20 Jul 2020 14:19:32 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
	Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <1943423d8efe0deac64595f71bb56e06b52cdd7c.camel@suse.com>
Content-Language: en-US
X-Originating-IP: [10.174.179.249]
X-CFilter-Loop: Reflected
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: dm-devel@redhat.com
Cc: lixiaokeng <lixiaokeng@huawei.com>, linfeilong@huawei.com,
	dm-devel@redhat.com, lutianxiong@huawei.com,
	Zdenek Kabelac <zkabelac@redhat.com>
Subject: Re: [dm-devel] master - multipathd: fix fd leak when iscsi device
	logs in
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
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit



On 2020/7/16 1:41, Martin Wilck wrote:
> On Tue, 2020-07-14 at 17:22 -0500, Benjamin Marzinski wrote:
>> On Mon, Jul 13, 2020 at 09:59:43PM +0200, Martin Wilck wrote:
>>> Comments welcome.
>>
>> We've agreed that dm_lib_release() is unnecessary, since we always
>> call
>> dm_udev_wait() when update_devs() is needed. dm_lib_exit() should
>> already be safe, since we only call it after cleaning up the other
>> threads. dm_task_set_cookie() looks safe to me as well, assuming that
>> we
>> have early initialization. So we are really talking about
>> dm_task_run()
>> and dm_udev_wait(). Clearly dm_udev_wait() always needs to run under
>> a
>> lock. Two threads trying to remove items from a list at the same time
>> isn't safe, and there's no way to know if there will be items on the
>> _node_ops list. The one thing I'm not sure of, is whether every call
>> to
>> dm_task_run() always needs to be locked. clearly we could, and it
>> would
>> be safer. Also, clearly for calls that add elements to _node_ops it
>> must. But for calls like DM_DEVICE_TABLE or DM_DEVICE_LIST, the only
>> issue that I can see with concurrent calls is the possibility that
>> _ioctl_buffer_double_factor gets increased too much. Perhaps that's
>> enough of a problem that we should just lock all dm_task_run() calls
>> as
>> well.
> 
> Yes. We shouldn't try to be too smart. It's easier to verify that every
> call is wrapped under a lock than to figure out later whether we made
> the case distinction right.
> 
> So, action plan:
> 
>  - remove dm_lib_release() calls
>  - Combine all possibly racy calls related to libdm initialization in
>    some early init call, protected by pthread_once()
>  - make sure dm_lib_exit() is handled correctly
>  - add locking around dm_task_run() and dm_udev_wait()
> 
> Regards
> Martin
> 

Thanks for your detailed analysis.

Look forward to the new version with solving the issue.

Regards,
Zhiqiang Liu



--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

