Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id C85B63615F7
	for <lists+dm-devel@lfdr.de>; Fri, 16 Apr 2021 01:15:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1618528550;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=dFwscWG4u+YHGX0sKdfBmu7pcJ5Y/MYlJkagEaK4K78=;
	b=A9Kvbx7d0UddzSCbuDSzmlg+xPuM3yB6ohQLaI0McEu7IZtRBQmqmCHu5H9FWt6h6KTAFJ
	shKfTzCY5Gp3qqZWyGfc3quxf0n+FxahRg8lfmLLEHKCSulyCnupl7U862luqaD8pJdKi7
	4OYnUdxEeCjpqsDXBZK79pwhLNsRbeU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-559-dYka8EfkO0KsT3aqngd9GQ-1; Thu, 15 Apr 2021 19:15:48 -0400
X-MC-Unique: dYka8EfkO0KsT3aqngd9GQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 727EF107ACCA;
	Thu, 15 Apr 2021 23:15:42 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 21CC460BE5;
	Thu, 15 Apr 2021 23:15:42 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 663731806D15;
	Thu, 15 Apr 2021 23:15:41 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 13FNFbGC011106 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 15 Apr 2021 19:15:37 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 6B41421C861C; Thu, 15 Apr 2021 23:15:37 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6474F21C8617
	for <dm-devel@redhat.com>; Thu, 15 Apr 2021 23:15:34 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DDA9B80A1D2
	for <dm-devel@redhat.com>; Thu, 15 Apr 2021 23:15:34 +0000 (UTC)
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com
	[209.85.160.179]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-122-NMjlSiogMNOrx51O8ZlDww-1; Thu, 15 Apr 2021 19:15:32 -0400
X-MC-Unique: NMjlSiogMNOrx51O8ZlDww-1
Received: by mail-qt1-f179.google.com with SMTP id d6so1261544qtx.13;
	Thu, 15 Apr 2021 16:15:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
	bh=A2s2OPIGot51QKltNpTIuUg2YDwX1FQEhuCnxgRK/jE=;
	b=EmTdUA1JNjuloQx3StVx7jcoVSUqg+WmRQqbh/iTfFeWKq/c6xiiXHxOlK71ezFSxb
	E5PRhgGogA0DhJQoftA4YJQxEYXu1GIapr5WGO/dTMYWQz0Hhu+3r6/3U783nFqz7EOA
	NszXSd3rzr8m+p3rkPK69fn1onxLGWQBDzHe2hUvNlhSB1qwkCv61EflOgN3HSHpkxfI
	4+anyBC/8jnwRCcBGm3PLH1GsBbPCxrsmbROwpqxX5AELRrbNmijjo+EfvIr6Z0uUTP6
	wgzY/5EnWQGNAy2zWKg3mxtRybvPlp0+q4iVeiPax92Cocs+w499KCDzrvBNvCi+GJgD
	dAMg==
X-Gm-Message-State: AOAM533iDbEQaxv7oSa2Cau6rvpyH9pMRYNPnhmGWueah9yCZAQGSxHo
	/cMZiVVn4FQoMrXE3Ur0/w3YdBHF1+ISLg==
X-Google-Smtp-Source: ABdhPJwAgbtdrrcWaDUhxSmioFl2dV0taaSqWO02nP0rl5pOrMokGKWTzXuEaUGSdiGHrWDedY0uGg==
X-Received: by 2002:ac8:7f53:: with SMTP id g19mr5286316qtk.249.1618528531955; 
	Thu, 15 Apr 2021 16:15:31 -0700 (PDT)
Received: from localhost (pool-68-160-176-52.bstnma.fios.verizon.net.
	[68.160.176.52]) by smtp.gmail.com with ESMTPSA id
	v127sm3099344qkh.37.2021.04.15.16.15.31
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 15 Apr 2021 16:15:31 -0700 (PDT)
From: Mike Snitzer <snitzer@redhat.com>
To: Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>
Date: Thu, 15 Apr 2021 19:15:26 -0400
Message-Id: <20210415231530.95464-1-snitzer@redhat.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: dm-devel@redhat.com
Cc: linux-block@vger.kernel.org, dm-devel@redhat.com,
	linux-nvme@lists.infradead.org
Subject: [dm-devel] [PATCH v2 0/4] nvme: improve error handling and
	ana_state to work well with dm-multipath
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi,

I just rebased and tweaked these 4 patches ontop of v5.12-rc7.

Been carrying an older ~5.9 based version in RHEL8 (since RHEL8.3,
August 2020; yes the patchset I just mistakenly emailed instead of
this patchset):
https://git.kernel.org/pub/scm/linux/kernel/git/device-mapper/linux-dm.git/log/?h=nvme-error-handling-fixes/for-5.9

RHEL9 is coming, would really prefer that these changes land upstream
rather than carry them within RHEL.

All review/feedback welcome.

Thanks,
Mike

Chao Leng (1):
  nvme: allow local retry for requests with REQ_FAILFAST_TRANSPORT set

Mike Snitzer (3):
  nvme: return BLK_STS_DO_NOT_RETRY if the DNR bit is set
  nvme: introduce FAILUP handling for REQ_FAILFAST_TRANSPORT
  nvme: decouple basic ANA log page re-read support from native multipathing

 drivers/nvme/host/core.c      | 45 +++++++++++++++++++++++++++++++++++++------
 drivers/nvme/host/multipath.c | 16 ++++++++++-----
 drivers/nvme/host/nvme.h      |  4 ++++
 include/linux/blk_types.h     |  8 ++++++++
 4 files changed, 62 insertions(+), 11 deletions(-)

-- 
2.15.0

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

