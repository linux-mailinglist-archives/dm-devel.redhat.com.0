Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 15017263F51
	for <lists+dm-devel@lfdr.de>; Thu, 10 Sep 2020 10:07:26 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-532-dBLRcUqpNQ-cquk7Ure0zA-1; Thu, 10 Sep 2020 04:07:24 -0400
X-MC-Unique: dBLRcUqpNQ-cquk7Ure0zA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D7B84807336;
	Thu, 10 Sep 2020 08:07:17 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B533B5C26B;
	Thu, 10 Sep 2020 08:07:17 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 6E1611826D2A;
	Thu, 10 Sep 2020 08:07:17 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 08A6ZaD0026156 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 10 Sep 2020 02:35:36 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id EC800F497C; Thu, 10 Sep 2020 06:35:35 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E73F8F49A3
	for <dm-devel@redhat.com>; Thu, 10 Sep 2020 06:35:33 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 97634811E76
	for <dm-devel@redhat.com>; Thu, 10 Sep 2020 06:35:33 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99]) (Using TLS)
	by relay.mimecast.com with ESMTP id us-mta-294-ZKtp0zliPgWTTL89_Y-M6A-1;
	Thu, 10 Sep 2020 02:35:31 -0400
X-MC-Unique: ZKtp0zliPgWTTL89_Y-M6A-1
Received: from coco.lan (ip5f5ad5ac.dynamic.kabel-deutschland.de
	[95.90.213.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 79CF6206A1;
	Thu, 10 Sep 2020 06:28:16 +0000 (UTC)
Date: Thu, 10 Sep 2020 08:28:12 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Joe Perches <joe@perches.com>
Message-ID: <20200910082812.057a04e6@coco.lan>
In-Reply-To: <e6387578c75736d61b2fe70d9783d91329a97eb4.camel@perches.com>
References: <e6387578c75736d61b2fe70d9783d91329a97eb4.camel@perches.com>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false;
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Thu, 10 Sep 2020 04:06:55 -0400
Cc: linux-wireless@vger.kernel.org, linux-fbdev@vger.kernel.org,
	oss-drivers@netronome.com, nouveau@lists.freedesktop.org,
	alsa-devel <alsa-devel@alsa-project.org>,
	dri-devel@lists.freedesktop.org, linux-mips@vger.kernel.org,
	linux-ide@vger.kernel.org, dm-devel@redhat.com,
	linux-mtd@lists.infradead.org, linux-i2c@vger.kernel.org,
	sparclinux@vger.kernel.org, kvmarm@lists.cs.columbia.edu,
	linux-rtc@vger.kernel.org, linux-s390@vger.kernel.org,
	linux-scsi@vger.kernel.org, dccp@vger.kernel.org,
	linux-rdma@vger.kernel.org, linux-atm-general@lists.sourceforge.net,
	linux-afs@lists.infradead.org, coreteam@netfilter.org,
	intel-wired-lan@lists.osuosl.org, linux-serial@vger.kernel.org,
	linux-input@vger.kernel.org, linux-mmc@vger.kernel.org,
	Kees Cook <kees.cook@canonical.com>, linux-media@vger.kernel.org,
	linux-pm@vger.kernel.org, intel-gfx@lists.freedesktop.org,
	linux-sctp@vger.kernel.org, linux-mediatek@lists.infradead.org,
	linux-nvme@lists.infradead.org, storagedev@microchip.com,
	ceph-devel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-nfs@vger.kernel.org, Jiri Kosina <trivial@kernel.org>,
	linux-parisc@vger.kernel.org, netdev@vger.kernel.org,
	linux-usb@vger.kernel.org, Nick Desaulniers <ndesaulniers@google.com>,
	LKML <linux-kernel@vger.kernel.org>, iommu@lists.linux-foundation.org,
	netfilter-devel@vger.kernel.org, linux-crypto@vger.kernel.org,
	bpf@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Subject: Re: [dm-devel] [trivial PATCH] treewide: Convert switch/case
 fallthrough; to break;
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
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Em Wed, 09 Sep 2020 13:06:39 -0700
Joe Perches <joe@perches.com> escreveu:

> fallthrough to a separate case/default label break; isn't very readable.
> 
> Convert pseudo-keyword fallthrough; statements to a simple break; when
> the next label is case or default and the only statement in the next
> label block is break;
> 
> Found using:
> 
> $ grep-2.5.4 -rP --include=*.[ch] -n "fallthrough;(\s*(case\s+\w+|default)\s*:\s*){1,7}break;" *
> 
> Miscellanea:
> 
> o Move or coalesce a couple label blocks above a default: block.
> 
> Signed-off-by: Joe Perches <joe@perches.com>
> ---
> 
> Compiled allyesconfig x86-64 only.
> A few files for other arches were not compiled.
> 


>  drivers/media/dvb-frontends/drxd_hard.c                   |  2 +-
>  drivers/media/i2c/ov5640.c                                |  2 +-
>  drivers/media/i2c/ov6650.c                                |  5 ++---
>  drivers/media/i2c/smiapp/smiapp-core.c                    |  2 +-
>  drivers/media/i2c/tvp5150.c                               |  2 +-
>  drivers/media/pci/ddbridge/ddbridge-core.c                |  2 +-
>  drivers/media/usb/cpia2/cpia2_core.c                      |  2 +-

For media drivers:

Reviewed-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>


Thanks,
Mauro

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

