Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 53984258979
	for <lists+dm-devel@lfdr.de>; Tue,  1 Sep 2020 09:44:11 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-461-9bPMSM7HMIWTDY-5ZALDqQ-1; Tue, 01 Sep 2020 03:44:08 -0400
X-MC-Unique: 9bPMSM7HMIWTDY-5ZALDqQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2BD4718A2252;
	Tue,  1 Sep 2020 07:44:02 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9C2C078B44;
	Tue,  1 Sep 2020 07:44:01 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id E184179A2C;
	Tue,  1 Sep 2020 07:43:54 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 07VB4Fpc009440 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 31 Aug 2020 07:04:16 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id D214A2166B44; Mon, 31 Aug 2020 11:04:15 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CD4D12166B28
	for <dm-devel@redhat.com>; Mon, 31 Aug 2020 11:04:13 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B527487EF6C
	for <dm-devel@redhat.com>; Mon, 31 Aug 2020 11:04:13 +0000 (UTC)
Received: from huawei.com (szxga05-in.huawei.com [45.249.212.191]) (Using
	TLS) by relay.mimecast.com with ESMTP id
	us-mta-362-4mbknRacOSGI23UYMcO7Dw-1; Mon, 31 Aug 2020 07:04:09 -0400
X-MC-Unique: 4mbknRacOSGI23UYMcO7Dw-1
Received: from DGGEMS408-HUB.china.huawei.com (unknown [172.30.72.60])
	by Forcepoint Email with ESMTP id 67E83D72823448CCE65A;
	Mon, 31 Aug 2020 19:04:03 +0800 (CST)
Received: from [127.0.0.1] (10.174.179.249) by DGGEMS408-HUB.china.huawei.com
	(10.3.19.208) with Microsoft SMTP Server id 14.3.487.0;
	Mon, 31 Aug 2020 19:03:57 +0800
To: Martin Wilck <mwilck@suse.com>
References: <dc4f5730-157f-8a27-247c-628f38bb6cb5@huawei.com>
	<8e24c49b-6f56-e7ea-7f2a-e7bd9d266e23@huawei.com>
	<cb97dfa97281bf9fe6738ffbf6abb20b5e2991ae.camel@suse.com>
From: Zhiqiang Liu <liuzhiqiang26@huawei.com>
Message-ID: <777ef6aa-f173-0f65-f454-5ae87986f79c@huawei.com>
Date: Mon, 31 Aug 2020 19:03:56 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
	Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <cb97dfa97281bf9fe6738ffbf6abb20b5e2991ae.camel@suse.com>
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
X-Mailman-Approved-At: Tue, 01 Sep 2020 03:43:47 -0400
Cc: lixiaokeng <lixiaokeng@huawei.com>, yanxiaodan@huawei.com,
	linfeilong@huawei.com, dm-devel@redhat.com,
	Zdenek Kabelac <zkabelac@redhat.com>
Subject: Re: [dm-devel] [PATCH V3 2/5] multipathd: use daemon_status_msg to
 construct sd notify msg in do_sd_notify func
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
X-Mimecast-Spam-Score: 0.003
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 2020/8/31 17:55, Martin Wilck wrote:
> Hello Zhiqiang,
> 
> On Sat, 2020-08-29 at 11:03 +0800, Zhiqiang Liu wrote:
>> sd_notify_status() is very similar with daemon_status(), except
>> DAEMON_IDLE and DAEMON_RUNNING state. As suggested by Martin,
>> we can create the sd notification string in a dynamic buffer,
>> and treat DAEMON_IDLE and DAEMON_RUNNING cases first. Then,
>> we can use daemon_status_msg[state] for other cases.
>>
>> V2->V3:
>> - set MSG_SIZE to 32 and use safe_sprintf as suggested by Martin.
>>
>> Signed-off-by: Zhiqiang Liu <liuzhiqiang26@huawei.com>
>> Signed-off-by: lixiaokeng <lixiaokeng@huawei.com>
>> ---
>>  multipathd/main.c | 34 ++++++++++++----------------------
>>  1 file changed, 12 insertions(+), 22 deletions(-)
> 
> Thanks again. I'd like to modify the patch slightly as attached. 
> I'm sorry that I didn't mention these minor issues in my previous
> reviews. I'm sending you the fixup patch in order to short-circuit 
> the procedure a bit and save both of us some work.
> 
> Would this be ok for you?
> If yes, please resubmit this as v4.
> 
> Regards,
> Martin
> 

Thanks for your suggestion.
I will send the v4 patch as your suggestion.

Regards,
Zhiqiang Liu

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

