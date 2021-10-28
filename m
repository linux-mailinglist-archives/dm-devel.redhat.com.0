Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 64D3843FB35
	for <lists+dm-devel@lfdr.de>; Fri, 29 Oct 2021 13:06:52 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-10-tJy2IaVZM5ScF8GqeG1P0g-1; Fri, 29 Oct 2021 07:06:49 -0400
X-MC-Unique: tJy2IaVZM5ScF8GqeG1P0g-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3632019200C2;
	Fri, 29 Oct 2021 11:06:44 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5921C60D30;
	Fri, 29 Oct 2021 11:06:41 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 55A351806D04;
	Fri, 29 Oct 2021 11:06:30 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 19S5t2lj017112 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 28 Oct 2021 01:55:03 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 62E5E2026D5D; Thu, 28 Oct 2021 05:55:02 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5DD2E2026D46
	for <dm-devel@redhat.com>; Thu, 28 Oct 2021 05:54:59 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
	bits)) (No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9ED94800141
	for <dm-devel@redhat.com>; Thu, 28 Oct 2021 05:54:59 +0000 (UTC)
Received: from mailgw02.mediatek.com (mailgw02.mediatek.com [210.61.82.184])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-565-h5FxHejANHuaL9TnSn8L_g-1; Thu, 28 Oct 2021 01:54:57 -0400
X-MC-Unique: h5FxHejANHuaL9TnSn8L_g-1
X-UUID: 0500a93a3b824aa4914b4f2b68f923ac-20211028
X-UUID: 0500a93a3b824aa4914b4f2b68f923ac-20211028
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by
	mailgw02.mediatek.com (envelope-from <mark-pk.tsai@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1976393245; Thu, 28 Oct 2021 13:49:47 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
	mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.2.792.15; Thu, 28 Oct 2021 13:49:46 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
	mtkmbs10n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
	15.2.792.15 via Frontend Transport; Thu, 28 Oct 2021 13:49:46 +0800
From: Mark-PK Tsai <mark-pk.tsai@mediatek.com>
To: <hch@infradead.org>
Date: Thu, 28 Oct 2021 13:49:46 +0800
Message-ID: <20211028054946.1524-1-mark-pk.tsai@mediatek.com>
In-Reply-To: <YXj37wXtN0wQqwZx@infradead.org>
References: <YXj37wXtN0wQqwZx@infradead.org>
MIME-Version: 1.0
X-MTK: N
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
X-Mailman-Approved-At: Fri, 29 Oct 2021 07:06:18 -0400
Cc: tequila.huang@mediatek.com, agk@redhat.com, snitzer@redhat.com,
	yj.chiang@mediatek.com, linux-kernel@vger.kernel.org,
	dm-devel@redhat.com, linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, matthias.bgg@gmail.com,
	mark-pk.tsai@mediatek.com
Subject: Re: [dm-devel] [PATCH] dm: add module parameter bdev_wait
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

> > dm_early_create() fail if the target block device not found in
> > the late init stage.
> > The block device is created in mmc_rescan() which kernel do
> > it async by queue it into system_freezable_wq.
> > Add module param bdev_wait to support waiting the block device
> > ready before dm_early_create() like prepare_namespace() does.
>
> This adds a busy loop.  There is a reason why we usually set up
> stacking drivers from userspace, in that we have a working event
> system there.  So the answer is not to add further hacks to the
> in-kernel DM setup hack, but to stop using it.

Thanks for your kind reply.
But We want to use DM target as root device without adding an initramfs.
Is there any other way to do so?

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

