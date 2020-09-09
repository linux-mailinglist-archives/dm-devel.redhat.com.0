Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id DFCC32624C2
	for <lists+dm-devel@lfdr.de>; Wed,  9 Sep 2020 04:05:29 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-178-ffDv4vAOMASx0kg3euxCDA-1; Tue, 08 Sep 2020 22:05:26 -0400
X-MC-Unique: ffDv4vAOMASx0kg3euxCDA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D97141DDFA;
	Wed,  9 Sep 2020 02:05:18 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8F40A838B9;
	Wed,  9 Sep 2020 02:05:15 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 34A88183D020;
	Wed,  9 Sep 2020 02:05:06 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 08924pFY016834 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 8 Sep 2020 22:04:52 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id B1A772156A23; Wed,  9 Sep 2020 02:04:51 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id ACAC82166B44
	for <dm-devel@redhat.com>; Wed,  9 Sep 2020 02:04:48 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A94D9101A53F
	for <dm-devel@redhat.com>; Wed,  9 Sep 2020 02:04:48 +0000 (UTC)
Received: from huawei.com (szxga04-in.huawei.com [45.249.212.190]) (Using
	TLS) by relay.mimecast.com with ESMTP id
	us-mta-372-eBfFnEg2NruxLtamd57NDw-1; Tue, 08 Sep 2020 22:04:44 -0400
X-MC-Unique: eBfFnEg2NruxLtamd57NDw-1
Received: from DGGEMS410-HUB.china.huawei.com (unknown [172.30.72.58])
	by Forcepoint Email with ESMTP id B137CA706E766BE74D22;
	Wed,  9 Sep 2020 10:04:40 +0800 (CST)
Received: from [127.0.0.1] (10.174.178.161) by DGGEMS410-HUB.china.huawei.com
	(10.3.19.210) with Microsoft SMTP Server id 14.3.487.0;
	Wed, 9 Sep 2020 10:04:34 +0800
To: Martin Wilck <mwilck@suse.com>, Christophe Varoqui
	<christophe.varoqui@opensvc.com>, Benjamin Marzinski <bmarzins@redhat.com>,
	dm-devel mailing list <dm-devel@redhat.com>
References: <2fb59aa1-eafa-49b6-08aa-a279565ec234@huawei.com>
	<686d0ca6-2bbf-095d-63bc-346ca609061a@huawei.com>
	<f13f55dcfdf6a17702c1c4a3b61b6956e68e0b91.camel@suse.com>
From: lixiaokeng <lixiaokeng@huawei.com>
Message-ID: <07b9f006-7959-aa5f-1327-79bf18fc2014@huawei.com>
Date: Wed, 9 Sep 2020 10:04:33 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
	Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <f13f55dcfdf6a17702c1c4a3b61b6956e68e0b91.camel@suse.com>
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
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: dm-devel@redhat.com
Cc: linfeilong <linfeilong@huawei.com>,
	"liuzhiqiang \(I\)" <liuzhiqiang26@huawei.com>
Subject: Re: [dm-devel] [PATCH V3 06/14] kpartx: check return value of
 malloc in main func
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Language: en-GB



On 2020/9/8 22:25, Martin Wilck wrote:
> On Tue, 2020-09-08 at 16:49 +0800, lixiaokeng wrote:
>> In main func of kpartx.c, we should check return value of
>> malloc before using it.
>>
>> V1->V2: change malloc to xmalloc
>>
>> Signed-off-by: Zhiqiang Liu <liuzhiqiang26@huawei.com>
>> Signed-off-by: Lixiaokeng <lixiaokeng@huawei.com>
>> ---
>>  kpartx/kpartx.c | 5 ++++-
>>  1 file changed, 4 insertions(+), 1 deletion(-)
>>
>> diff --git a/kpartx/kpartx.c b/kpartx/kpartx.c
>> index 98f6176e..6de3c9c4 100644
>> --- a/kpartx/kpartx.c
>> +++ b/kpartx/kpartx.c
>> @@ -61,6 +61,9 @@ struct pt {
>>  int ptct = 0;
>>  int udev_sync = 1;
>>
>> +extern void *
>> +xmalloc (size_t size);
>> +
> 
> Please don't use "extern". It's misleading, because this function is
> defined in the same file. You should actually change xmalloc() to a
> static function.
> 
> Regards,
> Martin
> 

Hi Martin,

  The function xmalloc should be externed before main even it is changed
to static function. So do you think it is a good idea to move xmalloc
before main? Or move it and change it to static func?

Regards,
Lixiaokeng


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

