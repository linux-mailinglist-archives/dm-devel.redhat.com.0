Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 15296A51A1
	for <lists+dm-devel@lfdr.de>; Mon,  2 Sep 2019 10:32:43 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 078F55D66B;
	Mon,  2 Sep 2019 08:32:41 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6D15B19C5B;
	Mon,  2 Sep 2019 08:32:39 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id ED4AD24F30;
	Mon,  2 Sep 2019 08:32:36 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x828WWnY020754 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 2 Sep 2019 04:32:32 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 821CA5D9D6; Mon,  2 Sep 2019 08:32:32 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from [10.43.17.45] (unknown [10.43.17.45])
	by smtp.corp.redhat.com (Postfix) with ESMTP id C44135D9CC;
	Mon,  2 Sep 2019 08:32:29 +0000 (UTC)
To: Dmitrij Gusev <dmitrij@gusev.co>,
	device-mapper development <dm-devel@redhat.com>
References: <20190829081514.29660-1-yuyufen@huawei.com>
	<877e6vf45p.fsf@notabene.neil.brown.name>
	<07ffeca5-6b69-0602-0981-2221cfb682af@huawei.com>
	<8a1c4146-fdc5-138d-af2d-a77b606b59e2@gusev.co>
From: Zdenek Kabelac <zkabelac@redhat.com>
Organization: Red Hat
Message-ID: <1cd9447e-9d84-e7f3-3b5f-c3064537e6e3@redhat.com>
Date: Mon, 2 Sep 2019 10:32:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <8a1c4146-fdc5-138d-af2d-a77b606b59e2@gusev.co>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: dm-devel@redhat.com
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.39]); Mon, 02 Sep 2019 08:32:41 +0000 (UTC)

Dne 02. 09. 19 v 3:04 Dmitrij Gusev napsal(a):
> Hello.
> 
> I get a kernel error every time I create LVM snapshot - at the creation and at 
> boot time, though the snapshot itself is working properly.
> 
> Linux nexus 4.19.69 #2 SMP Thu Aug 29 16:33:35 CDT 2019 x86_64 Intel(R) 
> Xeon(R) E-2174G CPU @ 3.80GHz GenuineIntel GNU/Linux

Hi


This is likely not a kernel error.

In which way are you creating your snapshot ?
Seems like it's made read-only ?

What version of lvm2 are you using ?
(there used to be bug when creating COW as read-only device)

Regard

Zdenek

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
