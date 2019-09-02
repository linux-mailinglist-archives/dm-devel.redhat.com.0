Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 87E68A58B1
	for <lists+dm-devel@lfdr.de>; Mon,  2 Sep 2019 16:01:50 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id BEB8E3082E61;
	Mon,  2 Sep 2019 14:01:46 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7F8C15C299;
	Mon,  2 Sep 2019 14:01:43 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 940552551C;
	Mon,  2 Sep 2019 14:01:36 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x82E1OGn032748 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 2 Sep 2019 10:01:24 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 38C9660126; Mon,  2 Sep 2019 14:01:24 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from [10.43.17.45] (unknown [10.43.17.45])
	by smtp.corp.redhat.com (Postfix) with ESMTP id AECED6012A;
	Mon,  2 Sep 2019 14:01:21 +0000 (UTC)
To: Dmitrij Gusev <dmitrij@gusev.co>
References: <20190829081514.29660-1-yuyufen@huawei.com>
	<877e6vf45p.fsf@notabene.neil.brown.name>
	<07ffeca5-6b69-0602-0981-2221cfb682af@huawei.com>
	<8a1c4146-fdc5-138d-af2d-a77b606b59e2@gusev.co>
	<1cd9447e-9d84-e7f3-3b5f-c3064537e6e3@redhat.com>
	<24771f1a-7b0c-d63f-1df1-3349c5c0f6c6@gusev.co>
From: Zdenek Kabelac <zkabelac@redhat.com>
Organization: Red Hat
Message-ID: <fe6b92b3-abec-6c07-d1b6-a358094ec96f@redhat.com>
Date: Mon, 2 Sep 2019 16:01:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <24771f1a-7b0c-d63f-1df1-3349c5c0f6c6@gusev.co>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: dm-devel@redhat.com
Cc: device-mapper development <dm-devel@redhat.com>
Subject: Re: [dm-devel] Kernel error at a LVM snapshot creation
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.46]); Mon, 02 Sep 2019 14:01:49 +0000 (UTC)

Dne 02. 09. 19 v 15:58 Dmitrij Gusev napsal(a):
> Hello.
> 
> Please find answers below.
> Thank you.
> Dmitrij
> 
> On 2019-09-02 11:32, Zdenek Kabelac wrote:
>> Dne 02. 09. 19 v 3:04 Dmitrij Gusev napsal(a):
>>> Hello.
>>>
>>> I get a kernel error every time I create LVM snapshot - at the creation and 
>>> at boot time, though the snapshot itself is working properly.
>>>
>>> Linux nexus 4.19.69 #2 SMP Thu Aug 29 16:33:35 CDT 2019 x86_64 Intel(R) 
>>> Xeon(R) E-2174G CPU @ 3.80GHz GenuineIntel GNU/Linux
>>
>> Hi
>>
>>
>> This is likely not a kernel error.
>>
>> In which way are you creating your snapshot ?
>> Seems like it's made read-only ?
> 
> Yes, I create read-only snapshot in this case.
> 
> cmd line: lvcreate -pr --size $size --snapshot -n $snap $lv $pv
> 
>>
>> What version of lvm2 are you using ?
>> (there used to be bug when creating COW as read-only device)
> 
> I use lvm2 format.
> 
> LVM utility version: lvm2-2.02.154 (Slackware 14.2).
> 


Yep - so please try to use lvm2 version >= 2.02.178
(contains fix for COW to be read-write even for read-only snapshots)


Regards

Zdenek

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
