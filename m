Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id CE8A126252E
	for <lists+dm-devel@lfdr.de>; Wed,  9 Sep 2020 04:28:32 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-539-bu8vg7YsP4Km9J_DSi1PQQ-1; Tue, 08 Sep 2020 22:28:30 -0400
X-MC-Unique: bu8vg7YsP4Km9J_DSi1PQQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9D02E1005E5C;
	Wed,  9 Sep 2020 02:28:23 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AEE421002388;
	Wed,  9 Sep 2020 02:28:21 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 436297A00E;
	Wed,  9 Sep 2020 02:28:16 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0892S9X3020590 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 8 Sep 2020 22:28:10 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id DF1C0200A799; Wed,  9 Sep 2020 02:28:09 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D96E22028DCC
	for <dm-devel@redhat.com>; Wed,  9 Sep 2020 02:28:07 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id F0EFB856DE8
	for <dm-devel@redhat.com>; Wed,  9 Sep 2020 02:28:06 +0000 (UTC)
Received: from huawei.com (szxga07-in.huawei.com [45.249.212.35]) (Using
	TLS) by relay.mimecast.com with ESMTP id
	us-mta-242-ttAgI4e3M0iCvuNl1nPFZQ-1; Tue, 08 Sep 2020 22:28:04 -0400
X-MC-Unique: ttAgI4e3M0iCvuNl1nPFZQ-1
Received: from DGGEMS410-HUB.china.huawei.com (unknown [172.30.72.58])
	by Forcepoint Email with ESMTP id 5CE26BBD6010D20C5D14;
	Wed,  9 Sep 2020 10:28:00 +0800 (CST)
Received: from [127.0.0.1] (10.174.178.161) by DGGEMS410-HUB.china.huawei.com
	(10.3.19.210) with Microsoft SMTP Server id 14.3.487.0;
	Wed, 9 Sep 2020 10:27:53 +0800
To: Martin Wilck <mwilck@suse.com>, Christophe Varoqui
	<christophe.varoqui@opensvc.com>, Benjamin Marzinski <bmarzins@redhat.com>,
	dm-devel mailing list <dm-devel@redhat.com>
References: <2fb59aa1-eafa-49b6-08aa-a279565ec234@huawei.com>
	<fd8cdf1e-3a56-e904-21e1-eb6258f78d79@huawei.com>
	<ca471cce2d6801dde59fd9d8e8d191f3b89ef407.camel@suse.com>
From: lixiaokeng <lixiaokeng@huawei.com>
Message-ID: <d6322435-bbad-90a1-4b06-450141145439@huawei.com>
Date: Wed, 9 Sep 2020 10:27:52 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
	Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <ca471cce2d6801dde59fd9d8e8d191f3b89ef407.camel@suse.com>
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
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: dm-devel@redhat.com
Cc: linfeilong <linfeilong@huawei.com>,
	"liuzhiqiang \(I\)" <liuzhiqiang26@huawei.com>
Subject: Re: [dm-devel] [PATCH V3 05/14] multipathd: use MALLOC and check
 return value in cli_getprkey func
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
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Language: en-GB



On 2020/9/8 22:32, Martin Wilck wrote:
> On Tue, 2020-09-08 at 16:49 +0800, lixiaokeng wrote:
>> In cli_getprkey func, we use MALLOC instead of malloc, and check
>> the return value of MALLOC.
>>
>> V1->V2: turn back MALLOC to malloc and reomve error message
> 
> Ok, but now you need to change the patch subject as well...
> 
> Also, please don't include v1->v2 changes in the commit message itself.
> Once this is committed, it's not interesting how it differs from
> earlier versions of the patch. Put it below the "---" marker,
> or just mention the version history in the cover letter.
> 
> Please see
> https://www.kernel.org/doc/html/v4.17/process/submitting-patches.html
> 
> Regards,
> Martin
> 
  I will change the message of patches 1, 2, 4, 5, 6, 7, 9, 11, 12, 14
and send them as V4.

Regards,
Lixiaokeng

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

