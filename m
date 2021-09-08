Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id DE4B7403989
	for <lists+dm-devel@lfdr.de>; Wed,  8 Sep 2021 14:10:50 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-108-k9vG1I9sPVeMN7HiGNbX1A-1; Wed, 08 Sep 2021 08:10:48 -0400
X-MC-Unique: k9vG1I9sPVeMN7HiGNbX1A-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F279884A5F1;
	Wed,  8 Sep 2021 12:10:40 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 494855DA61;
	Wed,  8 Sep 2021 12:10:36 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 1F5604EA29;
	Wed,  8 Sep 2021 12:10:25 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 188C8OSW003949 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 8 Sep 2021 08:08:24 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 428A32087456; Wed,  8 Sep 2021 12:08:24 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3E278207B326
	for <dm-devel@redhat.com>; Wed,  8 Sep 2021 12:08:21 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6AC8A811E7F
	for <dm-devel@redhat.com>; Wed,  8 Sep 2021 12:08:21 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99]) (Using TLS)
	by relay.mimecast.com with ESMTP id us-mta-524-NNZ5NFjLONWkn2hQpPv8-g-1;
	Wed, 08 Sep 2021 08:08:17 -0400
X-MC-Unique: NNZ5NFjLONWkn2hQpPv8-g-1
Received: by mail.kernel.org (Postfix) with ESMTPSA id B86D96109F;
	Wed,  8 Sep 2021 12:08:12 +0000 (UTC)
Date: Wed, 8 Sep 2021 14:08:10 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Pintu Agarwal <pintu.ping@gmail.com>
Message-ID: <YTinqiH9h+Q9bYsr@kroah.com>
References: <CAOuPNLhh_LkLQ8mSA4eoUDLCLzHo5zHXsiQZXUB_-T_F1_v6-g@mail.gmail.com>
	<alpine.LRH.2.02.2107211300520.10897@file01.intranet.prod.int.rdu2.redhat.com>
	<CAOuPNLi-xz_4P+v45CHLx00ztbSwU3_maf4tuuyso5RHyeOytg@mail.gmail.com>
	<CAOuPNLg0m-Q7Vhp4srbQrjXHsxVhOr-K2dvnNqzdR6Dr4kioqA@mail.gmail.com>
	<20210830185541.715f6a39@windsurf>
	<CAOuPNLhTidgLNWUbtUgdESYcKcE1C4SOdzKeQVhFGQvEoc0QEg@mail.gmail.com>
	<20210830211224.76391708@windsurf>
	<CAOuPNLgMd0AThhmSknbmKqp3_P8PFhBGr-jW0Mqjb6K6NchEMg@mail.gmail.com>
	<CAOuPNLiW10-E6F_Ndte7U9NPBKa9Y_UuLhgdwAYTc0eYMk5Mqg@mail.gmail.com>
	<CAOuPNLj2Xmx52Gtzx5oEKif4Qz-Tz=vaxhRvHQG-5emO7ewRhg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAOuPNLj2Xmx52Gtzx5oEKif4Qz-Tz=vaxhRvHQG-5emO7ewRhg@mail.gmail.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: dm-devel@redhat.com
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, snitzer@redhat.com,
	Kernelnewbies <kernelnewbies@kernelnewbies.org>,
	open list <linux-kernel@vger.kernel.org>, dm-devel@redhat.com,
	Mikulas Patocka <mpatocka@redhat.com>,
	Sami Tolvanen <samitolvanen@google.com>,
	Phillip Lougher <phillip@squashfs.org.uk>,
	linux-fsdevel <linux-fsdevel@vger.kernel.org>,
	linux-mtd <linux-mtd@lists.infradead.org>, agk@redhat.com
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Sep 08, 2021 at 04:57:45PM +0530, Pintu Agarwal wrote:
> Hi,
> 
> On Mon, 6 Sept 2021 at 21:58, Pintu Agarwal <pintu.ping@gmail.com> wrote:
> 
> > On Tue, 31 Aug 2021 at 18:49, Pintu Agarwal <pintu.ping@gmail.com> wrote:
> >
> > > > No, but you can backport it easily. Back at
> > > > http://lists.infradead.org/pipermail/openwrt-devel/2019-November/025967.html
> > > > I provided backports of this feature to OpenWrt, for the 4.14 and 4.19
> > > > kernels.
> 
> Can you please let me know where to get the below patches for
> backporting to our kernel:
>  create mode 100644
> target/linux/generic/backport-4.14/390-dm-add-support-to-directly-boot-to-a-mapped-device.patch
>  create mode 100644
> target/linux/generic/backport-4.14/391-dm-init-fix-max-devices-targets-checks.patch
>  create mode 100644
> target/linux/generic/backport-4.14/392-dm-ioctl-fix-hang-in-early-create-error-condition.patch
>  create mode 100644
> target/linux/generic/backport-4.14/393-Documentation-dm-init-fix-multi-device-example.patch

If you are stuck on an older kernel version, then you need to get
support from the vendor that is forcing you to be on that kernel
version, as you are already paying them for support.  Please take
advantage of that, as no one knows what is really in "your kernel".

thanks,

greg k-h

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

