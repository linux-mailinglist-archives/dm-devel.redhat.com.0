Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id B550D75BF39
	for <lists+dm-devel@lfdr.de>; Fri, 21 Jul 2023 09:03:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1689922984;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=UNaTMi96KoxqI94ijguEmOm2A7p/wHjpc4ryZi8xq6c=;
	b=EFWIx+iYYFrZLBJNxXBmWefMCy/XabN1fWyt+Zh1WJKK/1PrGdaA1M3ZOz591EGXHkFcjp
	DbRyn1RyrlZsoQpxg8rWxIIcENPBk1PofmVgZU8TgU/hxhOGuxDSOZvvANX3bB+0jDCM9+
	W6/oCry+LsjhLwE94nzTHU36BRfD3cI=
Received: from mimecast-mx02.redhat.com (66.187.233.73 [66.187.233.73]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-450-ZOlBaMyCP3GF9GxPq1rhjA-1; Fri, 21 Jul 2023 03:03:00 -0400
X-MC-Unique: ZOlBaMyCP3GF9GxPq1rhjA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 005E61C068DE;
	Fri, 21 Jul 2023 07:02:58 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 29AC0F77B3;
	Fri, 21 Jul 2023 07:02:55 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 7723B1946A72;
	Fri, 21 Jul 2023 07:02:54 +0000 (UTC)
X-Original-To: dm-devel@listman.corp.redhat.com
Delivered-To: dm-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 7EC2619465BD
 for <dm-devel@listman.corp.redhat.com>; Fri, 21 Jul 2023 07:02:52 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 4A28F200C0F2; Fri, 21 Jul 2023 07:02:52 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 41C20200B41D
 for <dm-devel@redhat.com>; Fri, 21 Jul 2023 07:02:52 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 267B4936D27
 for <dm-devel@redhat.com>; Fri, 21 Jul 2023 07:02:52 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [139.178.84.217]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-668-cwCGD8-lMBKpUI4wtpOQ7A-1; Fri, 21 Jul 2023 03:02:48 -0400
X-MC-Unique: cwCGD8-lMBKpUI4wtpOQ7A-1
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 1A49A6112C;
 Fri, 21 Jul 2023 07:02:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5606C433C7;
 Fri, 21 Jul 2023 07:02:45 +0000 (UTC)
Date: Fri, 21 Jul 2023 09:02:43 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Mark-PK Tsai <mark-pk.tsai@mediatek.com>
Message-ID: <2023072117-skewed-engulf-2f32@gregkh>
References: <2023072033-hedge-buffing-8862@gregkh>
 <20230721063845.11676-1-mark-pk.tsai@mediatek.com>
MIME-Version: 1.0
In-Reply-To: <20230721063845.11676-1-mark-pk.tsai@mediatek.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Subject: Re: [dm-devel] [PATCH 5.15] dm init: add dm-mod.waitfor to wait for
 asynchronously probed block devices
X-BeenThere: dm-devel@redhat.com
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: device-mapper development <dm-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/dm-devel>,
 <mailto:dm-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <http://listman.redhat.com/archives/dm-devel/>
List-Post: <mailto:dm-devel@redhat.com>
List-Help: <mailto:dm-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/dm-devel>,
 <mailto:dm-devel-request@redhat.com?subject=subscribe>
Cc: peter@korsgaard.com, snitzer@redhat.com, linux-doc@vger.kernel.org,
 yj.chiang@mediatek.com, corbet@lwn.net, snitzer@kernel.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org, dm-devel@redhat.com,
 linux-mediatek@lists.infradead.org, agk@redhat.com, matthias.bgg@gmail.com,
 linux-arm-kernel@lists.infradead.org
Errors-To: dm-devel-bounces@redhat.com
Sender: "dm-devel" <dm-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: linuxfoundation.org
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Jul 21, 2023 at 02:38:45PM +0800, Mark-PK Tsai wrote:
> > On Mon, Jul 17, 2023 at 09:57:28AM +0800, Mark-PK Tsai wrote:
> > > > On Sun, Jul 16, 2023, 11:16 AM Greg KH <gregkh@linuxfoundation.org> wrote:
> > > > 
> > > > > On Thu, Jul 13, 2023 at 01:58:37PM +0800, Mark-PK Tsai wrote:
> > > > > > From: Peter Korsgaard <peter@korsgaard.com>
> > > > > > 
> > > > > > Just calling wait_for_device_probe() is not enough to ensure that
> > > > > > asynchronously probed block devices are available (E.G. mmc, usb), so
> > > > > > add a "dm-mod.waitfor=<device1>[,..,<deviceN>]" parameter to get
> > > > > > dm-init to explicitly wait for specific block devices before
> > > > > > initializing the tables with logic similar to the rootwait logic that
> > > > > > was introduced with commit  cc1ed7542c8c ("init: wait for
> > > > > > asynchronously scanned block devices").
> > > > > > 
> > > > > > E.G. with dm-verity on mmc using:
> > > > > > dm-mod.waitfor="PARTLABEL=hash-a,PARTLABEL=root-a"
> > > > > > 
> > > > > > [    0.671671] device-mapper: init: waiting for all devices to be 
> > > > > available before creating mapped devices
> > > > > > [    0.671679] device-mapper: init: waiting for device PARTLABEL=hash-a 
> > > > > ...
> > > > > > [    0.710695] mmc0: new HS200 MMC card at address 0001
> > > > > > [    0.711158] mmcblk0: mmc0:0001 004GA0 3.69 GiB
> > > > > > [    0.715954] mmcblk0boot0: mmc0:0001 004GA0 partition 1 2.00 MiB
> > > > > > [    0.722085] mmcblk0boot1: mmc0:0001 004GA0 partition 2 2.00 MiB
> > > > > > [    0.728093] mmcblk0rpmb: mmc0:0001 004GA0 partition 3 512 KiB, 
> > > > > chardev (249:0)
> > > > > > [    0.738274]  mmcblk0: p1 p2 p3 p4 p5 p6 p7
> > > > > > [    0.751282] device-mapper: init: waiting for device PARTLABEL=root-a 
> > > > > ...
> > > > > > [    0.751306] device-mapper: init: all devices available
> > > > > > [    0.751683] device-mapper: verity: sha256 using implementation 
> > > > > "sha256-generic"
> > > > > > [    0.759344] device-mapper: ioctl: dm-0 (vroot) is ready
> > > > > > [    0.766540] VFS: Mounted root (squashfs filesystem) readonly on 
> > > > > device 254:0.
> > > > > > 
> > > > > > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> > > > > > Signed-off-by: Mike Snitzer <snitzer@kernel.org>
> > > > > > Cc: stable@vger.kernel.org
> > > > > > Signed-off-by: Mark-PK Tsai <mark-pk.tsai@mediatek.com>
> > > > > > ---
> > > > > >  .../admin-guide/device-mapper/dm-init.rst     |  8 +++++++
> > > > > >  drivers/md/dm-init.c                          | 22 ++++++++++++++++++-
> > > > > >  2 files changed, 29 insertions(+), 1 deletion(-)
> > > > >
> > > > > What is the git commit id of this change in Linus's tree?
> > > > >
> > > > > thanks,
> > > > >
> > > > > greg k-h
> > > > >
> > > > >
> > > > 
> > > > Hey Greg,
> > > > 
> > > > This change shouldn't be backported to stable@. It is a feature, if
> > > > Mark-PK feels they need it older kernels they need to carry the change
> > > > in their own tree. Or at a minimum they need to explain why this
> > > > change is warranted in stable@.
> > > 
> > > Thanks for your comment.
> > > The reason why we think this should be backported to stable kernel is
> > > that it actually fix the potential race condition when make block
> > > device probe async in stable kernel.
> > > And we'd like to fix this upstream rather than just take it in
> > > our custom tree.
> > 
> > Potential race condition, is this actually able to be hit in real life?
> 
> Yes it hanppened, and it can lead the kernel init process stuck in
> the root wait loop.
> 
> Below is the log.
> (I add 20 seconds delay in mtk_mci probe to quick reproduce it.)
> 
> * Before apply this pactch
> [    0.368594][    T1] device-mapper: init: waiting for all devices to be available before creating mapped devices
> [   21.673047][   T45] probe of 1c660000.mtk-mmc-fcie returned 0 after 21541020 usecs
> [   21.673061][   T45] mtk_mci 1c660000.mtk-mmc-fcie: driver mtk_mci async attach completed: 0
> [   21.680006][    T1] device-mapper: table: 254:0: verity: Data device lookup failed <--------------- start after mtk_mci probe done
> [   21.680012][    T1] device-mapper: ioctl: error adding target to table <--------------------------- won't create /dev/dm-0
> [   21.680067][   T67] mmc0: new HS400 Enhanced strobe MMC card at address 0001
> [   21.680184][   T67] bus: 'mmc': __driver_probe_device: matched device mmc0:0001 with driver mmcblk
> [   21.680192][   T67] bus: 'mmc': really_probe: probing driver mmcblk with device mmc0:0001
> [   21.680500][   T67] mmcblk0: mmc0:0001 016G01 14.5 GiB 
> [   21.683404][   T67]  mmcblk0: p1 p2 p3 p4 p5 p6 p7 p8 p9 p10 p11 p12 p13 p14 p15 p16 p17 p18 p19 p20 p21 p22 p23 p24 p25 p26 p27 p28 p29
> [   21.686152][   T67] mmcblk0boot0: mmc0:0001 016G01 8.00 MiB 
> [   21.687166][   T67] mmcblk0boot1: mmc0:0001 016G01 8.00 MiB 
> [   21.687955][   T67] mmcblk0rpmb: mmc0:0001 016G01 4.00 MiB, chardev (238:0)
> [   21.687977][   T67] driver: 'mmcblk': driver_bound: bound to device 'mmc0:0001'
> [   21.688004][   T67] bus: 'mmc': really_probe: bound device mmc0:0001 to driver mmcblk
> [   21.688010][   T67] probe of mmc0:0001 returned 0 after 7819 usecs
> [   21.688166][    T1] Waiting for root device /dev/dm-0...
> [   41.023192][    T1] driver_probe_done: probe_count = 0
> ... can't exit from the root wait loop
> 
> * After apply this patch and add dm-mod.waitfor="PARTLABEL=rootfs"
> [    0.368417][    T1] device-mapper: init: waiting for all devices to be available before creating mapped devices
> [   21.672749][   T45] probe of 1c660000.mtk-mmc-fcie returned 0 after 21540992 usecs
> [   21.672767][   T45] mtk_mci 1c660000.mtk-mmc-fcie: driver mtk_mci async attach completed: 0
> [   21.672774][    T1] device-mapper: init: waiting for device PARTLABEL=rootfs ...
> [   21.672869][   T43] mtk_mci 1c660000.mtk-mmc-fcie: eMMC: HS400 5.1 200MHz
> [   21.679743][   T43] mmc0: new HS400 Enhanced strobe MMC card at address 0001
> [   21.679852][   T43] bus: 'mmc': __driver_probe_device: matched device mmc0:0001 with driver mmcblk
> [   21.679858][   T43] bus: 'mmc': really_probe: probing driver mmcblk with device mmc0:0001
> [   21.680204][   T43] mmcblk0: mmc0:0001 016G01 14.5 GiB 
> [   21.682866][   T43]  mmcblk0: p1 p2 p3 p4 p5 p6 p7 p8 p9 p10 p11 p12 p13 p14 p15 p16 p17 p18 p19 p20 p21 p22 p23 p24 p25 p26 p27 p28 p29
> [   21.685579][   T43] mmcblk0boot0: mmc0:0001 016G01 8.00 MiB 
> [   21.686631][   T43] mmcblk0boot1: mmc0:0001 016G01 8.00 MiB 
> [   21.687533][   T43] mmcblk0rpmb: mmc0:0001 016G01 4.00 MiB, chardev (238:0)
> [   21.687559][   T43] driver: 'mmcblk': driver_bound: bound to device 'mmc0:0001'
> [   21.687585][   T43] bus: 'mmc': really_probe: bound device mmc0:0001 to driver mmcblk
> [   21.687591][   T43] probe of mmc0:0001 returned 0 after 7732 usecs
> [   21.687838][    T1] device-mapper: init: all devices available <---------------------------------- start after PARTLABEL=rootfs is ready
> [   21.688155][    T1] device-mapper: verity: sha1 using implementation "sha1-generic"
> [   21.688975][    T1] device-mapper: ioctl: dm-0 (dm-verity) is ready
> 

Ok, seems sane, I'll queue this up for 6.1.y and 5.15.y now.

thanks,

greg k-h

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

