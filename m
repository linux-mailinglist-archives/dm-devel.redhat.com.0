Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 428F924056A
	for <lists+dm-devel@lfdr.de>; Mon, 10 Aug 2020 13:40:48 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-354-zLibR9t0OsyKl_9HmCw8gA-1; Mon, 10 Aug 2020 07:40:45 -0400
X-MC-Unique: zLibR9t0OsyKl_9HmCw8gA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5A6091005504;
	Mon, 10 Aug 2020 11:40:38 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0E73C19C71;
	Mon, 10 Aug 2020 11:40:36 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 64D3E18095FF;
	Mon, 10 Aug 2020 11:40:28 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 07ABcfxN009564 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 10 Aug 2020 07:38:42 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id BB7BF10062AC; Mon, 10 Aug 2020 11:38:41 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A39B0100650C
	for <dm-devel@redhat.com>; Mon, 10 Aug 2020 11:38:39 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 118D68007C9
	for <dm-devel@redhat.com>; Mon, 10 Aug 2020 11:38:39 +0000 (UTC)
Received: from huawei.com (szxga05-in.huawei.com [45.249.212.191]) (Using
	TLS) by relay.mimecast.com with ESMTP id
	us-mta-74-AJjdaDnnP-WlYglcQHXUZQ-1; Mon, 10 Aug 2020 07:38:32 -0400
X-MC-Unique: AJjdaDnnP-WlYglcQHXUZQ-1
Received: from DGGEMS411-HUB.china.huawei.com (unknown [172.30.72.59])
	by Forcepoint Email with ESMTP id 7314176C1203970ACED1;
	Mon, 10 Aug 2020 19:38:25 +0800 (CST)
Received: from [127.0.0.1] (10.174.179.249) by DGGEMS411-HUB.china.huawei.com
	(10.3.19.211) with Microsoft SMTP Server id 14.3.487.0;
	Mon, 10 Aug 2020 19:38:15 +0800
To: Martin Wilck <mwilck@suse.com>, Benjamin Marzinski <bmarzins@redhat.com>, 
	<christophe.varoqui@opensvc.com>, <zkabelac@redhat.com>
References: <9c67963b-477f-b3f5-8c8c-048de9357ff9@huawei.com>
	<2625305858d9381eb1f69642d6bbcd743a995af2.camel@suse.com>
From: Zhiqiang Liu <liuzhiqiang26@huawei.com>
Message-ID: <c4de4f89-05bd-dc0b-d937-9ed6e09c4853@huawei.com>
Date: Mon, 10 Aug 2020 19:38:14 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
	Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <2625305858d9381eb1f69642d6bbcd743a995af2.camel@suse.com>
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
Cc: linfeilong <linfeilong@huawei.com>, Yanxiaodan <yanxiaodan@huawei.com>,
	dm-devel@redhat.com, lixiaokeng <lixiaokeng@huawei.com>
Subject: Re: [dm-devel] [dm- devel][PATCH] checker: add input check of state
 in checker_state_name func
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



On 2020/8/10 18:17, Martin Wilck wrote:
> On Mon, 2020-08-10 at 09:14 +0800, Zhiqiang Liu wrote:
>> In checker_state_name func, we donot check whether input i
>> is valid. It may cause array access violation problem.
>>
>> Signed-off-by: Zhiqiang Liu <liuzhiqiang26@huawei.com>
>> ---
>>  libmultipath/checkers.c | 26 +++++++++++++++-----------
>>  libmultipath/checkers.h |  3 ++-
>>  2 files changed, 17 insertions(+), 12 deletions(-)
>>
> 
> Reviewed-by: Martin Wilck <mwilck@suse.com>
> 
> Thanks for the patch.
> 
> Btw, are you currently reviewing multipath-tools with coverity or some
> similar tool?
> 
> Martin

Thanks for your reply.
Actually, I just read and learned multipath-tools code without using any tools.
In the future, we may try to use some scanning tools for deep analysis.

Thanks for your review, again.

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

