Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id CCD603D14E1
	for <lists+dm-devel@lfdr.de>; Wed, 21 Jul 2021 19:12:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1626887575;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=1BuQOmF2ewCB0OqQvu6Hwtr+VBEInT7IyEavrQCPsSM=;
	b=VWPbCYQcr/00Uvy0MOEt0U/BeswymAM7Go5Mg4zL+XcGV29+3FJrK74kpgBYMSiPkEfFcV
	e9xyFVN9RTYVPIqNzTdC6UKXSpzehByat7phjxYst9y9jjtUpyUR29LP1S6/IK3L4S4o3c
	JQrv1WIftnP2/4/vxn3ktsl7quT6BMY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-228-xbjSNuuaN3Wigr2TKYNSlA-1; Wed, 21 Jul 2021 13:12:54 -0400
X-MC-Unique: xbjSNuuaN3Wigr2TKYNSlA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8EA67EC1A0;
	Wed, 21 Jul 2021 17:12:46 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 07AB4226E9;
	Wed, 21 Jul 2021 17:12:44 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 3AC2A181A1F3;
	Wed, 21 Jul 2021 17:12:36 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 16LHAPZo030641 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 21 Jul 2021 13:10:25 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 615753702; Wed, 21 Jul 2021 17:10:25 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from file01.intranet.prod.int.rdu2.redhat.com
	(file01.intranet.prod.int.rdu2.redhat.com [10.11.5.7])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6B58B62672;
	Wed, 21 Jul 2021 17:10:17 +0000 (UTC)
Received: from file01.intranet.prod.int.rdu2.redhat.com (localhost [127.0.0.1])
	by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4) with ESMTP
	id 16LHAGci011835; Wed, 21 Jul 2021 13:10:16 -0400
Received: from localhost (mpatocka@localhost)
	by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4/Submit) with
	ESMTP id 16LHAF51011830; Wed, 21 Jul 2021 13:10:15 -0400
X-Authentication-Warning: file01.intranet.prod.int.rdu2.redhat.com: mpatocka
	owned process doing -bs
Date: Wed, 21 Jul 2021 13:10:15 -0400 (EDT)
From: Mikulas Patocka <mpatocka@redhat.com>
X-X-Sender: mpatocka@file01.intranet.prod.int.rdu2.redhat.com
To: Pintu Agarwal <pintu.ping@gmail.com>
In-Reply-To: <CAOuPNLhh_LkLQ8mSA4eoUDLCLzHo5zHXsiQZXUB_-T_F1_v6-g@mail.gmail.com>
Message-ID: <alpine.LRH.2.02.2107211300520.10897@file01.intranet.prod.int.rdu2.redhat.com>
References: <CAOuPNLhqSpaTm3u4kFsnuZ0PLDKuX8wsxuF=vUJ1TEG0EP+L1g@mail.gmail.com>
	<alpine.LRH.2.02.2107200737510.19984@file01.intranet.prod.int.rdu2.redhat.com>
	<CAOuPNLhh_LkLQ8mSA4eoUDLCLzHo5zHXsiQZXUB_-T_F1_v6-g@mail.gmail.com>
User-Agent: Alpine 2.02 (LRH 1266 2009-07-14)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: dm-devel@redhat.com
Cc: snitzer@redhat.com, Kernelnewbies <kernelnewbies@kernelnewbies.org>,
	open list <linux-kernel@vger.kernel.org>, dm-devel@redhat.com,
	linux-mtd <linux-mtd@lists.infradead.org>,
	Sami Tolvanen <samitolvanen@google.com>,
	linux-fsdevel <linux-fsdevel@vger.kernel.org>,
	Phillip Lougher <phillip@squashfs.org.uk>, shli@kernel.org, agk@redhat.com
Subject: Re: [dm-devel] Kernel 4.14: Using dm-verity with squashfs rootfs -
 mounting issue
X-BeenThere: dm-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: device-mapper development <dm-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/dm-devel>,
	<mailto:dm-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://listman.redhat.com/archives/dm-devel>
List-Post: <mailto:dm-devel@redhat.com>
List-Help: <mailto:dm-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/dm-devel>,
	<mailto:dm-devel-request@redhat.com?subject=subscribe>
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit



On Wed, 21 Jul 2021, Pintu Agarwal wrote:

> On Tue, 20 Jul 2021 at 17:12, Mikulas Patocka <mpatocka@redhat.com> wrote:
> >
> > Hi
> >
> > Try to set up dm-verity with block size 512 bytes.
> >
> > I don't know what block size does squashfs use, but if the filesystem
> > block size is smaller than dm-verity block size, it doesn't work.
> >
> Okay thank you so much for this clue,
> It seems we are using 65536 as the squashfs block size:

65536 is the compression block size - it is unrelated to I/O block size.

There's a config option SQUASHFS_4K_DEVBLK_SIZE. The documentation says 
that it uses by default 1K block size and if you enable this option, it 
uses 4K block size.

So, try to set it. Or try to reduce dm-verity block size down to 1K.

> ==> mksquashfs [...] - comp xz -Xdict-size 32K -noI -Xbcj arm -b 65536
> -processors 1
> 
> But for dm-verity we are giving block size of 4096
> ==> [    0.000000] Kernel command line:[..] verity="96160 12020
> d7b8a7d0c01b9aec888930841313a81603a50a2a7be44631c4c813197a50d681 0 "
> rootfstype=squashfs root=/dev/mtdblock34 ubi.mtd=30,0,30 [...]
> root=/dev/dm-0 dm="system none ro,0 96160 verity 1 /dev/mtdblock34
> /dev/mtdblock39 4096 4096 12020 8 sha256
> d7b8a7d0c01b9aec888930841313a81603a50a2a7be44631c4c813197a50d681
> aee087a5be3b982978c923f566a94613496b417f2af592639bc80d141e34dfe7"
> 
> Now, we are checking by giving squashfs block size also as 4096
> 
> In case, if this does not work, what else could be the other option ?
> Can we try with initramfs approach ?

Yes - you can try initramfs.

Mikulas

> Thanks,
> Pintu
> 

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

