Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 556BE25CF66
	for <lists+dm-devel@lfdr.de>; Fri,  4 Sep 2020 04:26:13 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-82-yMxuYLhWPkWaOdrxcpOGaQ-1; Thu, 03 Sep 2020 22:26:10 -0400
X-MC-Unique: yMxuYLhWPkWaOdrxcpOGaQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DD482801ABC;
	Fri,  4 Sep 2020 02:26:02 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2EB207EECF;
	Fri,  4 Sep 2020 02:26:00 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 8812A79DDD;
	Fri,  4 Sep 2020 02:25:50 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0842PaCU022720 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 3 Sep 2020 22:25:36 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 817EA1006B1A; Fri,  4 Sep 2020 02:25:36 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7C92F117A961
	for <dm-devel@redhat.com>; Fri,  4 Sep 2020 02:25:34 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2D9E3811E76
	for <dm-devel@redhat.com>; Fri,  4 Sep 2020 02:25:34 +0000 (UTC)
Received: from huawei.com (szxga06-in.huawei.com [45.249.212.32]) (Using
	TLS) by relay.mimecast.com with ESMTP id
	us-mta-328-w6VcJmfWNzW1HcHzk6iGQw-1; Thu, 03 Sep 2020 22:25:31 -0400
X-MC-Unique: w6VcJmfWNzW1HcHzk6iGQw-1
Received: from DGGEMS410-HUB.china.huawei.com (unknown [172.30.72.60])
	by Forcepoint Email with ESMTP id 38B6683926F4216546F2;
	Fri,  4 Sep 2020 10:25:27 +0800 (CST)
Received: from [127.0.0.1] (10.174.179.62) by DGGEMS410-HUB.china.huawei.com
	(10.3.19.210) with Microsoft SMTP Server id 14.3.487.0; Fri, 4 Sep 2020
	10:25:17 +0800
To: Martin Wilck <mwilck@suse.com>, Benjamin Marzinski <bmarzins@redhat.com>, 
	Christophe Varoqui <christophe.varoqui@opensvc.com>, dm-devel mailing list
	<dm-devel@redhat.com>
References: <37544d4c-950f-4281-3b66-e4d1884c5167@huawei.com>
	<73d14f51e1ca6aeb8dbd40f5a22c21508b6d4401.camel@suse.com>
From: lixiaokeng <lixiaokeng@huawei.com>
Message-ID: <6a6cd305-2c2e-b1af-967b-4b73b254fbda@huawei.com>
Date: Fri, 4 Sep 2020 10:24:58 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
	Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <73d14f51e1ca6aeb8dbd40f5a22c21508b6d4401.camel@suse.com>
X-Originating-IP: [10.174.179.62]
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
	"liuzhiqiang \(I\)" <liuzhiqiang26@huawei.com>
Subject: Re: [dm-devel] [PATCH 00/14] multipath-tools series: some cleanups
 and fixes checked by codedex tool
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

Hello Martin,
   Thanks for your reviews. I will remove the error messages and send
them again.

Regards
Lixiaokeng

On 2020/9/4 4:08, Martin Wilck wrote:
> Hello Lixiaokeng,
> 
> On Wed, 2020-09-02 at 14:40 +0800, lixiaokeng wrote:
>> Hi:
>>     Now, we check multipath-tools codes with codedex tool. Here
>> are some some cleanups and fixes.
> 
> Thank you. However I'm going to nack all patches that add error
> messages after unsuccesful memory allocations. Such messages are
> unhelpful most of the time, and increase the code size without a true
> benefit. I've actually considered to get rid of all these, and replace
> them by a log_oom() macro.
> 
> See an untested prototype attached, to better understand what I mean.
> 
> Regards
> Martin
> 
> 

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

