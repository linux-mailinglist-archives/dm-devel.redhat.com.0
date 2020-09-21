Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 9CBF0271F4F
	for <lists+dm-devel@lfdr.de>; Mon, 21 Sep 2020 11:53:06 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-416-5gyhOK5KP_GYihXEb_DI_w-1; Mon, 21 Sep 2020 05:53:03 -0400
X-MC-Unique: 5gyhOK5KP_GYihXEb_DI_w-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 85B52801AE3;
	Mon, 21 Sep 2020 09:52:56 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 87FF5277C9;
	Mon, 21 Sep 2020 09:52:54 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 845088C7CE;
	Mon, 21 Sep 2020 09:52:46 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 08L9qYUe030258 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 21 Sep 2020 05:52:35 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id C9DCD2024508; Mon, 21 Sep 2020 09:52:34 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C459220244F7
	for <dm-devel@redhat.com>; Mon, 21 Sep 2020 09:52:32 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 68736185A78B
	for <dm-devel@redhat.com>; Mon, 21 Sep 2020 09:52:32 +0000 (UTC)
Received: from huawei.com (szxga04-in.huawei.com [45.249.212.190]) (Using
	TLS) by relay.mimecast.com with ESMTP id
	us-mta-326-lYpQAQJbMLiViXvtju4YLQ-1; Mon, 21 Sep 2020 05:52:29 -0400
X-MC-Unique: lYpQAQJbMLiViXvtju4YLQ-1
Received: from DGGEMS414-HUB.china.huawei.com (unknown [172.30.72.58])
	by Forcepoint Email with ESMTP id 3D74BECADD1BF6A0F560;
	Mon, 21 Sep 2020 17:52:26 +0800 (CST)
Received: from [10.174.178.208] (10.174.178.208) by
	DGGEMS414-HUB.china.huawei.com (10.3.19.214) with Microsoft SMTP Server
	id 14.3.487.0; Mon, 21 Sep 2020 17:52:17 +0800
To: Martin Wilck <mwilck@suse.com>, Benjamin Marzinski <bmarzins@redhat.com>, 
	Christophe Varoqui <christophe.varoqui@opensvc.com>, dm-devel mailing list
	<dm-devel@redhat.com>
References: <be54400a-5da9-8444-c473-562d675b10f3@huawei.com>
	<a09c32f1acded7e3fe2e5187606e27c60c584de6.camel@suse.com>
From: lixiaokeng <lixiaokeng@huawei.com>
Message-ID: <041991f0-d777-4372-7e69-42c5d29a2432@huawei.com>
Date: Mon, 21 Sep 2020 17:52:17 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
	Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <a09c32f1acded7e3fe2e5187606e27c60c584de6.camel@suse.com>
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
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: dm-devel@redhat.com
Cc: linfeilong <linfeilong@huawei.com>,
	"liuzhiqiang \(I\)" <liuzhiqiang26@huawei.com>
Subject: Re: [dm-devel] [PATCH v2] libmultipath: check udev_device_get_*
 return value to avoid segfault
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Language: en-GB

Hi Martin,
   Thanks for your careful review. In path_discover() and declare_sysfs_get_str(),
NULL will not be dereferenced. I just check all return value that will cause
segfault. But you are right, the other invocations of udev_device_get_XYZ()
should be checked too.

Regards,
Lixiaokeng



On 2020/9/21 17:14, Martin Wilck wrote:
> On Mon, 2020-09-21 at 12:00 +0800, lixiaokeng wrote:
>> The udev_device_get_* function may return NULL, and it will be
>> deregerenced in str* and sscanf func. We check the return value
>> to avoid segfault. Fix all.
>>
> 
> Thanks. Let me remark that this patch does _not_ fix all invocations of
> udev_device_get_XYZ() (I suppose you meant something else with "Fix
> all.", but please be more specific next time then).
> See path_discover(), declare_sysfs_get_str(), for instance.
> 
> Anyway, that can be fixed later, so:
> 
> Reviewed-by: Martin Wilck <mwilck@suse.com>
> 
> 
> .
> 

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

