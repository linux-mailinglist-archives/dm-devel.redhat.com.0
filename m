Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 1BBB226F884
	for <lists+dm-devel@lfdr.de>; Fri, 18 Sep 2020 10:40:51 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-102-BTE3ZM3LNwSfQH5Bn9qFoQ-1; Fri, 18 Sep 2020 04:40:47 -0400
X-MC-Unique: BTE3ZM3LNwSfQH5Bn9qFoQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D0584195D563;
	Fri, 18 Sep 2020 08:40:41 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BD27D6886A;
	Fri, 18 Sep 2020 08:40:35 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 6FA35183D040;
	Fri, 18 Sep 2020 08:40:23 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 08I8eAJ3028583 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 18 Sep 2020 04:40:10 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 4AFFB1010AE4; Fri, 18 Sep 2020 08:40:10 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 45B3B1010AE5
	for <dm-devel@redhat.com>; Fri, 18 Sep 2020 08:40:07 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D43C585828F
	for <dm-devel@redhat.com>; Fri, 18 Sep 2020 08:40:07 +0000 (UTC)
Received: from huawei.com (szxga06-in.huawei.com [45.249.212.32]) (Using
	TLS) by relay.mimecast.com with ESMTP id
	us-mta-105-dTC3N9PBPCC0nc-PWzudDQ-1; Fri, 18 Sep 2020 04:40:03 -0400
X-MC-Unique: dTC3N9PBPCC0nc-PWzudDQ-1
Received: from DGGEMS402-HUB.china.huawei.com (unknown [172.30.72.59])
	by Forcepoint Email with ESMTP id C325E275AD8BA7C5F066;
	Fri, 18 Sep 2020 16:39:55 +0800 (CST)
Received: from [10.174.178.208] (10.174.178.208) by
	DGGEMS402-HUB.china.huawei.com (10.3.19.202) with Microsoft SMTP Server
	id 14.3.487.0; Fri, 18 Sep 2020 16:39:46 +0800
To: Martin Wilck <mwilck@suse.com>, Benjamin Marzinski <bmarzins@redhat.com>
References: <d89bc33d-8e5d-d194-3b26-83ff4d170c5c@huawei.com>
	<20200918022626.GU11108@octiron.msp.redhat.com>
	<011310221c816f3c3573d96d91aca3e0a48fb80d.camel@suse.com>
From: lixiaokeng <lixiaokeng@huawei.com>
Message-ID: <3735c20d-a0fd-ca41-be9a-0df679022668@huawei.com>
Date: Fri, 18 Sep 2020 16:39:45 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
	Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <011310221c816f3c3573d96d91aca3e0a48fb80d.camel@suse.com>
X-Originating-IP: [10.174.178.208]
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
Cc: linfeilong <linfeilong@huawei.com>,
	dm-devel mailing list <dm-devel@redhat.com>,
	"liuzhiqiang \(I\)" <liuzhiqiang26@huawei.com>
Subject: Re: [dm-devel] [PATCH 0/6] libmultipath: check udev* func return
	value
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Language: en-GB

Hi Martin,

On 2020/9/18 15:37, Martin Wilck wrote:
> On Thu, 2020-09-17 at 21:26 -0500, Benjamin Marzinski wrote:
>> On Tue, Sep 15, 2020 at 12:38:27PM +0800, lixiaokeng wrote:
>>> Hi,
>>>   The udev* function may return NULL,and it will be
>>> dereferenced in str* and sscanf func. For example,
>>> there is a coredump caused in add func, which show in
>>> be7a043(commit id) in upstream-queue. We check the
>>> return value to avoid dereference NULL.
>>>
>>> repo: openSUSE/multipath-tools
>>> repo link: https://github.com/openSUSE/multipath-tools
>>> branch: upstream-queue
>>>
>> For the set
>> Reviewed-by: Benjamin Marzinski <bmarzins@redhat.com>
> 
> Well, the set got the logic wrong in 3 out of 6 patches :-)
> 
> In general, as these fixes are all very similar, I would prefer
> bundling them together into one patch, and I would like to make sure
> (and assert in the commit message) that the set fixes
> *all* possible NULL pointer dereferences related to accessing udev
> properties (I haven't checked whether this is the case for the set).
> 
> Also, while I'd ack this set if the logic was correct, I think that in
> a way it's papering over the actual problem. udev_device_get_XYZ()
> functions fail *only* if the underlying sysfs directory has vanished
> (well, perhaps for out-of-memory, too, but let's put that aside for a
> moment). It that case, we should actually not just return an error code

   Here we use multipath-tools basing on iscsi. When iscsi logout, the path
will disappear in sysfs and a uevent will cause. Before uevent processed,
some coredump will happen but if coredump is solved the multipathd will
deal with the disappeared path latter.
  In this set, the funcs will not be processed when multipath-tools bases
on iscsi. However, I think multipathd will deal with the disappeared path
like basing on iscsi. So I just check them. Anyway, if you have any better
idea, please tell me.

> - we should realize that there's a problem with the device (it probably
> has been deleted from the system and shouldn't be used any more in any
> way), and that we need to deal with it somehow. This is a fundamental
> problem for all user space programs that use udev_devices for more than
> a few CPU cycles. That doesn't mean the set is wrong, but we should
> keep this in mind. I have something cooking for a more complete
> solution, which isn't ready yet.
> 
> Finally, @lixiaokeng, please check your inbox once more. You still
> haven't fixed #11/14 of your previous series.
> 

I will modify patch 11/14 and send it.

> Regards,
> Martin
> 
> 
> .
> 

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

