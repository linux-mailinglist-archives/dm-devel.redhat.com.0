Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 9FA4623D3A4
	for <lists+dm-devel@lfdr.de>; Wed,  5 Aug 2020 23:37:08 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-63-5JiiKOmNOiu1FzcLteQk3w-1; Wed, 05 Aug 2020 17:37:05 -0400
X-MC-Unique: 5JiiKOmNOiu1FzcLteQk3w-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 23B6358;
	Wed,  5 Aug 2020 21:37:00 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C2FC45C1D2;
	Wed,  5 Aug 2020 21:36:57 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id C5E9F96928;
	Wed,  5 Aug 2020 21:36:53 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 075LajlH021456 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 5 Aug 2020 17:36:45 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 58A97217B43C; Wed,  5 Aug 2020 21:36:45 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3B9E5217B439
	for <dm-devel@redhat.com>; Wed,  5 Aug 2020 21:36:42 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8EAB28007A4
	for <dm-devel@redhat.com>; Wed,  5 Aug 2020 21:36:42 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-369-VromxdZHNs6O5aQfUw9Vtw-1;
	Wed, 05 Aug 2020 17:36:40 -0400
X-MC-Unique: VromxdZHNs6O5aQfUw9Vtw-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id E3D28AD1E;
	Wed,  5 Aug 2020 21:36:55 +0000 (UTC)
Message-ID: <7b6403a39da1a6fd6f2297884fed957414c4e55d.camel@suse.com>
From: Martin Wilck <mwilck@suse.com>
To: Benjamin Marzinski <bmarzins@redhat.com>, lixiaokeng
	<lixiaokeng@huawei.com>
Date: Wed, 05 Aug 2020 23:36:38 +0200
In-Reply-To: <20200803173535.GF19233@octiron.msp.redhat.com>
References: <9f10e135-348d-d11a-85cb-797522ba5210@huawei.com>
	<20200803173535.GF19233@octiron.msp.redhat.com>
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
Cc: linfeilong@huawei.com, dm-devel@redhat.com, liuzhiqiang26@huawei.com,
	lutianxiong@huawei.com
Subject: Re: [dm-devel] [PATCH] libmultipath: fix null dereference in add
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, 2020-08-03 at 12:35 -0500, Benjamin Marzinski wrote:
> On Mon, Aug 03, 2020 at 07:57:01PM +0800, lixiaokeng wrote:
> > I got a multipath segfault while running iscsi login/logout and
> > following scripts in parallel:
> > 
> > #!/bin/bash
> > interval=1
> > while true
> > do
> >               multipath -F &> /dev/null
> >               multipath -r &> /dev/null
> >               multipath -v2 &> /dev/null
> >               multipath -ll &> /dev/null
> >               sleep $interval
> > done
> > 
> > This is the debuginfo:
> > #0  0x00007f3805e4df58 in add (ctx=0x55d1569e4a00,
> > ud=0x55d1569bafd0) at nvme.c:801
> > 801              if (strcmp("disk", udev_device_get_devtype(ud)))
> > (gdb) bt
> > #0  0x00007f3805e4df58 in add (ctx=0x55d1569e4a00,
> > ud=0x55d1569bafd0) at nvme.c:801
> > #1  0x00007f3806687a44 in add_foreign (udev=0x55d1569bafd0) at
> > foreign.c:299
> > #2  0x00007f3806665abf in is_claimed_by_foreign (ud=<optimized
> > out>) at foreign.h:316
> > #3  pathinfo (pp=0x55d1569e9f50, conf=0x55d1569b92d0, mask=69) at
> > discovery.c:2064
> > #4  0x000055d154c91cbb in check_usable_paths (conf=0x55d1569b92d0,
> > devpath=0x55d1569e3200 "dm-6", dev_type=<optimized out>) at
> > main.c:368
> > #5  0x000055d154c910a5 in main (argc=3, argv=<optimized out>) at
> > main.c:1057
> > In add() at libmultipath/foreign/nvme.c,
> > udev_device_get_devtype(ud) return a NULL pointer then
> > dereferenced.
> > Here, NULL check is needed.
> > Check if udev_device_get_devtype return NULL before dereferencing
> > it.
> 
> This patch looks fine. However, it has pointed out a larger problem
> with
> the udev_device_get_* functions. This is not the only instance where
> we
> aren't checking the return value of these functions before
> dereferencing
> it.

Right. libudev/libsystemd seem to follow a "lazy" approach for certain 
properties, fetching them only when requested. If such a function call
returns NULL, I guess we have to assume that fetching the respective
property from sysfs failed, and thus the udev_device has become non-
existent / invalid. OTOH, this is probably "better" than libudev
fetching other properties from the cache and NOT making us realize that
the device is long gone.

Next pending code audit :-/

Martin


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

