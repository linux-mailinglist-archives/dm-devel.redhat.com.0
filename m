Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id AB48823D39B
	for <lists+dm-devel@lfdr.de>; Wed,  5 Aug 2020 23:31:06 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-208-HzuXCw5YP2i7k9ZI2F_qbw-1; Wed, 05 Aug 2020 17:31:03 -0400
X-MC-Unique: HzuXCw5YP2i7k9ZI2F_qbw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7EFF510059A9;
	Wed,  5 Aug 2020 21:30:56 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9911487A4D;
	Wed,  5 Aug 2020 21:30:55 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id DC3271809554;
	Wed,  5 Aug 2020 21:30:50 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 075LSva7020742 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 5 Aug 2020 17:28:57 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 5F895217B43A; Wed,  5 Aug 2020 21:28:57 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4EEF5217B437
	for <dm-devel@redhat.com>; Wed,  5 Aug 2020 21:28:54 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D15E58A19A2
	for <dm-devel@redhat.com>; Wed,  5 Aug 2020 21:28:54 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-245-Xr_7HDtYNr62ZETvWZGv1g-1;
	Wed, 05 Aug 2020 17:28:52 -0400
X-MC-Unique: Xr_7HDtYNr62ZETvWZGv1g-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 592BDACAF;
	Wed,  5 Aug 2020 21:29:08 +0000 (UTC)
Message-ID: <9458f4d0a17f98b4791e21efc91e779335edfb6f.camel@suse.com>
From: Martin Wilck <mwilck@suse.com>
To: lutianxiong <lutianxiong@huawei.com>, "christophe.varoqui@opensvc.com"
	<christophe.varoqui@opensvc.com>
Date: Wed, 05 Aug 2020 23:28:50 +0200
In-Reply-To: <B8F26E5D3A1269458BE7CD6D60E9885F7A369633@dggemm531-mbx.china.huawei.com>
References: <B8F26E5D3A1269458BE7CD6D60E9885F7A369633@dggemm531-mbx.china.huawei.com>
User-Agent: Evolution 3.36.4
MIME-Version: 1.0
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
Cc: "dm-devel@redhat.com" <dm-devel@redhat.com>,
	Liaoqingwei <liaoqingwei@huawei.com>
Subject: Re: [dm-devel] libmultipath: fix null dereference
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, 2020-07-23 at 01:11 +0000, lutianxiong wrote:
> Hi
> I got a multipath segfault while running iscsi login/logout and
> following scripts in parallel:
>  
> #!/bin/bash
> interval=1
> while true
> do
>               multipath -F &> /dev/null
>               multipath -r &> /dev/null
>               multipath -v2 &> /dev/null
>               multipath -ll &> /dev/null
>               sleep $interval
> done
>  
> This is the debuginfo:
> #0  0x00007f3805e4df58 in add (ctx=0x55d1569e4a00, ud=0x55d1569bafd0)
> at nvme.c:801
> 801              if (strcmp("disk", udev_device_get_devtype(ud)))
> (gdb) bt
> #0  0x00007f3805e4df58 in add (ctx=0x55d1569e4a00, ud=0x55d1569bafd0)
> at nvme.c:801
> #1  0x00007f3806687a44 in add_foreign (udev=0x55d1569bafd0) at
> foreign.c:299
> #2  0x00007f3806665abf in is_claimed_by_foreign (ud=<optimized out>)
> at foreign.h:316
> #3  pathinfo (pp=0x55d1569e9f50, conf=0x55d1569b92d0, mask=69) at
> discovery.c:2064
> #4  0x000055d154c91cbb in check_usable_paths (conf=0x55d1569b92d0,
> devpath=0x55d1569e3200 "dm-6", dev_type=<optimized out>) at
> main.c:368
> #5  0x000055d154c910a5 in main (argc=3, argv=<optimized out>) at
> main.c:1057
>  
> In add() at libmultipath/foreign/nvme.c, udev_device_get_devtype(ud)
> return a NULL pointer then dereferenced.
> Here, NULL check is needed.
>  
>  
>  
> Check if udev_device_get_devtype return NULL before dereferencing it.
>  
> Signed-off-by: lutianxiong <lutianxiong@huawei.com>

Thanks, this looks correct. But could you please resend in proper
format? The patch is corrupt, looks like mangled whitespace.

Martin


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

