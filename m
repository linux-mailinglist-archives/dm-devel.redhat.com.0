Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 8BE602AB026
	for <lists+dm-devel@lfdr.de>; Mon,  9 Nov 2020 05:17:40 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-487-4b_6nSJFMqaF_TaIkkBk6w-1; Sun, 08 Nov 2020 23:17:37 -0500
X-MC-Unique: 4b_6nSJFMqaF_TaIkkBk6w-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AA4CD1006C8D;
	Mon,  9 Nov 2020 04:17:28 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B4C165577A;
	Mon,  9 Nov 2020 04:17:23 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id EA1B5180B658;
	Mon,  9 Nov 2020 04:17:10 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0A94GuWC023392 for <dm-devel@listman.util.phx.redhat.com>;
	Sun, 8 Nov 2020 23:16:57 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id DAF17207A524; Mon,  9 Nov 2020 04:16:56 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D5F81205F386
	for <dm-devel@redhat.com>; Mon,  9 Nov 2020 04:16:53 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BA2EC811E76
	for <dm-devel@redhat.com>; Mon,  9 Nov 2020 04:16:53 +0000 (UTC)
Received: from szxga05-in.huawei.com (szxga05-in.huawei.com
	[45.249.212.191]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-242-sM9PDdBbOYm6suLq3fbCfQ-1; Sun, 08 Nov 2020 23:16:49 -0500
X-MC-Unique: sM9PDdBbOYm6suLq3fbCfQ-1
Received: from DGGEMS413-HUB.china.huawei.com (unknown [172.30.72.60])
	by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4CTyP05lP0zhhrq;
	Mon,  9 Nov 2020 12:16:36 +0800 (CST)
Received: from [10.174.177.208] (10.174.177.208) by
	DGGEMS413-HUB.china.huawei.com (10.3.19.213) with Microsoft SMTP Server
	id 14.3.487.0; Mon, 9 Nov 2020 12:16:34 +0800
To: Benjamin Marzinski <bmarzins@redhat.com>
References: <fd96f23b-63ff-4933-b112-667e5adce0b5@huawei.com>
	<20201102215938.GU3384@octiron.msp.redhat.com>
From: lixiaokeng <lixiaokeng@huawei.com>
Message-ID: <bcf8faf3-55b9-a065-d6c6-574e444b64b2@huawei.com>
Date: Mon, 9 Nov 2020 12:16:35 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
	Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201102215938.GU3384@octiron.msp.redhat.com>
X-Originating-IP: [10.174.177.208]
X-CFilter-Loop: Reflected
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: dm-devel@redhat.com
Cc: linfeilong <linfeilong@huawei.com>,
	dm-devel mailing list <dm-devel@redhat.com>,
	Martin Wilck <mwilck@suse.com>,
	"liuzhiqiang \(I\)" <liuzhiqiang26@huawei.com>
Subject: Re: [dm-devel] [PATCH v3] libmultipath: fix memory leaks in
	coalesce_paths
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
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-GB
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit


>>
>> +	if (mpvec)
>> +		newmp = mpvec;
>> +	else
>> +		newmp = vector_alloc();
>> +	if (!newmp) {
>> +		condlog(0, "can not allocate newmp");
>> +		return ret;
>> +	}
>> +
> 
> It's possible that this patch is based on different code than I am
> looking at, but otherwise, You should either move this code below the
> code that checks the pathvec size and allocates the bitfield, or make
> the failure path for that code free newmp, if necessary. Otherwise, you
> could leak newmp on those failures.
> 
> -Ben
> 
>>  	/* ignore refwwid if it's empty */
>>  	if (refwwid && !strlen(refwwid))
>>  		refwwid = NULL;
Hi

Thanks for your great advice. I will move these codes after checking
the pathvec size and allocating the bitfield.

Regarts,
Lixiaokeng

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

