Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id E90BC49F254
	for <lists+dm-devel@lfdr.de>; Fri, 28 Jan 2022 05:18:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1643343497;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=bWweYlFg0+LjX0GKecpF/1gpUC3xnFxu3nUGBCt+mnU=;
	b=EThfh25xmhhil0+mOZewg/KHOcNnp1szArgrCCOoZa9O99fIylQl0bfUgAOECSwcz0uYz1
	Wcobm+gqSvR9mUBbL21+OGg5rBISIVOnYI2ZncwFBx24lw3LnWaPtIhDd5HPX1B1j5hd7r
	dazVSlc5qXi4QULNSWGzbPPTzkJ89Ng=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-434-mCLl9-TmNEaKb1MFKtuygQ-1; Thu, 27 Jan 2022 23:18:13 -0500
X-MC-Unique: mCLl9-TmNEaKb1MFKtuygQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 29D398066F1;
	Fri, 28 Jan 2022 04:18:07 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E9807E716;
	Fri, 28 Jan 2022 04:18:05 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id CD8FE4A7C9;
	Fri, 28 Jan 2022 04:18:02 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
	[10.11.54.2])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 20S4HuV9009716 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 27 Jan 2022 23:17:56 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 8E69C404727B; Fri, 28 Jan 2022 04:17:56 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8A4F34047272
	for <dm-devel@redhat.com>; Fri, 28 Jan 2022 04:17:56 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6FB0B185A794
	for <dm-devel@redhat.com>; Fri, 28 Jan 2022 04:17:56 +0000 (UTC)
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
	[209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
	(version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	us-mta-173-ID_yZZc5MLC8zeXyq_6hoA-1; Thu, 27 Jan 2022 23:17:55 -0500
X-MC-Unique: ID_yZZc5MLC8zeXyq_6hoA-1
Received: by mail-qt1-f198.google.com with SMTP id
	c15-20020ac87dcf000000b002d0a849c0beso3693611qte.16
	for <dm-devel@redhat.com>; Thu, 27 Jan 2022 20:17:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=uy/j0iorjzfngas6HgsLamkI2lubo9i9STfyB6Rfz1M=;
	b=5yinTUlNCieouJwU7N4IaND9AKWCZSTPuO1fw49KHqM+iYaFIoB+xF0YVI9mUFlJ1V
	zCjc5SVA0xR4lYfX50o1jTwOWBhFX7Y2mu+576SCzz7UlCkFueHa38LMTchNsrrdDNUt
	6jaG1E4To89b+x2Wrl9lcGDnUiF7IEhq8eqHWEv0q5TBZpTjEyFqb1k99+T11fNgEAI5
	Vzrj16mSJhGR0Fa5EoRWgt+cFC4/Z7ZPaqBFh3diNpczX6epKfCstJ8gHmOZk9gvwVVC
	n6PKOKrsA2Irj/Fcdjsc35FiWAFSBE2h+UDrx12p12uYiIx42IHDXCT234LgTY1OTu4Z
	2EqQ==
X-Gm-Message-State: AOAM530BL2oQL+4WVBgWHIxaP9TlvV7zwD/nxOt9lSZOP2iRPg447ojM
	bNA83Zt7VOwgCjOPdw53q9ui+tJEwxY5EP6jThJ/BEOzRtTj5EPfJ1G4RnecdeYN6mXg72BtX5E
	yxIkk+4doUVL1dQ==
X-Received: by 2002:a05:620a:2592:: with SMTP id
	x18mr4773408qko.578.1643343474604; 
	Thu, 27 Jan 2022 20:17:54 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyXEdqRD3HFVOXHNPzlLjyGkH9sxVfcjKK9cncI7nKb2QMVaYaptnIK4czeECKsxp2jSGQLqQ==
X-Received: by 2002:a05:620a:2592:: with SMTP id
	x18mr4773404qko.578.1643343474405; 
	Thu, 27 Jan 2022 20:17:54 -0800 (PST)
Received: from localhost (pool-68-160-176-52.bstnma.fios.verizon.net.
	[68.160.176.52]) by smtp.gmail.com with ESMTPSA id
	x16sm2599343qko.17.2022.01.27.20.17.53
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 27 Jan 2022 20:17:54 -0800 (PST)
From: Mike Snitzer <snitzer@redhat.com>
To: axboe@kernel.dk
Date: Thu, 27 Jan 2022 23:17:50 -0500
Message-Id: <20220128041753.32195-1-snitzer@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
X-loop: dm-devel@redhat.com
Cc: linux-block@vger.kernel.org, dm-devel@redhat.com, hch@lst.de
Subject: [dm-devel] [PATCH v3 0/3] block/dm: fix bio-based DM IO accounting
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
MIME-Version: 1.0
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi Jens,

Just over 3 years ago, with commit a1e1cb72d9649 ("dm: fix redundant
IO accounting for bios that need splitting") I focused too narrowly on
fixing the reported potential for redundant accounting for IO totals.
Which, at least mentally for me, papered over how inaccurate all other
bio-based DM's IO accounting is for bios that get split.

This set fixes things up properly by allowing DM to start IO
accounting _after_ IO is submitted and a split may have occurred.  The
proper start_time is still established (prior to submission), it is
passed in to a new bio_start_io_acct_time().  This eliminates the need
for any DM hack to rewind block core's accounting that was started
before any potential bio split.

All said: If you'd provide your Acked-by(s) I'm happy to send this set
to Linus for v5.17-rc (and shepherd the changes into stable@ kernels).

Or you're welcome to pickup this set to send along (I'd obviously
still do any stable@ backports). NOTE: the 3rd patch references the
linux-dm.git commit id for the 1st patch.. so that'll require tweaking
no matter who sends the changes to Linus.

Please advise, thanks.
Mike

v3: fix patch 3 to call bio_start_io_acct_time
v2: made block changes suggested by Christoph

Mike Snitzer (3):
  block: add bio_start_io_acct_time() to control start_time
  dm: revert partial fix for redundant bio-based IO accounting
  dm: properly fix redundant bio-based IO accounting

 block/blk-core.c       | 25 +++++++++++++++++++------
 drivers/md/dm.c        | 20 +++-----------------
 include/linux/blkdev.h |  1 +
 3 files changed, 23 insertions(+), 23 deletions(-)

-- 
2.15.0

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

