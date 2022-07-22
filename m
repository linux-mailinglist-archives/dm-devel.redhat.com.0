Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 27ED857E67D
	for <lists+dm-devel@lfdr.de>; Fri, 22 Jul 2022 20:27:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1658514434;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=zkKI5chgGL7iaqXtSdBmF9phscTPGsKcNmdsjdpQZVE=;
	b=VcPKAi+h1lqcQ5jtxtq9EwCT3tL6e/3b117XY+BcnzYw8CV0QiGL5R2Z0rTuSQ7siOOtQ1
	RqVVqvzgMNRln33RsL3czQ5P/FAP0MAWFgBIwVPhUPp1GnRw+9PlNv8VFEdbiDFVj+8lAt
	KzOMg5MEF18513fG7T+xohETUge+8cU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-387-CzAZzPmMO7uGEAnZPec0jg-1; Fri, 22 Jul 2022 14:27:12 -0400
X-MC-Unique: CzAZzPmMO7uGEAnZPec0jg-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C6AAC811E76;
	Fri, 22 Jul 2022 18:27:09 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 79E50492CA7;
	Fri, 22 Jul 2022 18:27:06 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 66FAB1947BBC;
	Fri, 22 Jul 2022 18:27:05 +0000 (UTC)
X-Original-To: dm-devel@listman.corp.redhat.com
Delivered-To: dm-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 920071947049
 for <dm-devel@listman.corp.redhat.com>; Fri, 22 Jul 2022 09:38:50 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 2588D18EBB; Fri, 22 Jul 2022 09:38:50 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 215D318ECB
 for <dm-devel@redhat.com>; Fri, 22 Jul 2022 09:38:50 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 03FB785A581
 for <dm-devel@redhat.com>; Fri, 22 Jul 2022 09:38:50 +0000 (UTC)
Received: from mail-vk1-f202.google.com (mail-vk1-f202.google.com
 [209.85.221.202]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-103-TtimlfHVPvmR3D9trtk8Yw-1; Fri, 22 Jul 2022 05:38:48 -0400
X-MC-Unique: TtimlfHVPvmR3D9trtk8Yw-1
Received: by mail-vk1-f202.google.com with SMTP id
 o197-20020a1fa5ce000000b00376205c315fso35950vke.12
 for <dm-devel@redhat.com>; Fri, 22 Jul 2022 02:38:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
 bh=X0oN1G1OQvdRnhcJfrd3sUIzDmI1WFEM6TnugeAwxec=;
 b=i3hwx4srTlyj6c1kj2aXAyP5gmpnsR3akn2cR2qwbLUa6ZD3sU1PydL8bYqr67GDr7
 Pwfq6rECwuTzkkYoTkWH6RIDTLdVx0iNhfkQuFvN8ITSVg2avUjFYVKPijr0vUP0Kxhe
 zubzFVR6mrhm9/thGuUty1puOBy7fW6vFuJIEncY0w8NmmFBy1rBMtrOqcbdXJWCfTOh
 tgOdn0kUfqMat8xVD4bRepzZsTJWvkxXE6kQbFSWw0gv0zId74XAzF94mEch/qYBiw1d
 ou+UTiTEAuwtXx8HNH2c3jpuzGIMSK6ZM9sH8vqFNz34Byd0GlTSPoa83NgaNix6UZJc
 xawQ==
X-Gm-Message-State: AJIora+dOxnF8fWTn6TnoHaX43VY00IUSmRErIQZoRmNEOvjAdlXhH37
 v6/jjK+EsusUO9nUMtmOsKYqVQKyUA==
X-Google-Smtp-Source: AGRyM1vlkN+Ixt5tJI3A5NZlp/9LYsAuB90zSBJNNKCuzbKjP/FsQzKU398QjgVHH8OarhwgkNhE2lWeKw==
X-Received: from nhuck.c.googlers.com ([fda3:e722:ac3:cc00:14:4d90:c0a8:39cc])
 (user=nhuck job=sendgmr) by 2002:a05:6102:3bc7:b0:358:3b4b:cd31
 with SMTP id
 a7-20020a0561023bc700b003583b4bcd31mr773613vsv.72.1658482727792; Fri, 22 Jul
 2022 02:38:47 -0700 (PDT)
Date: Fri, 22 Jul 2022 09:38:20 +0000
Message-Id: <20220722093823.4158756-1-nhuck@google.com>
Mime-Version: 1.0
From: Nathan Huckleberry <nhuck@google.com>
To: linux-kernel@vger.kernel.org, dm-devel@redhat.com, 
 Alasdair Kergon <agk@redhat.com>, Mike Snitzer <snitzer@kernel.org>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-Mailman-Approved-At: Fri, 22 Jul 2022 18:27:03 +0000
Subject: [dm-devel] [PATCH 0/3] dm-verity: optionally use tasklets in
 dm-verity
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
Cc: Eric Biggers <ebiggers@kernel.org>, Sami Tolvanen <samitolvanen@google.com>,
 Nathan Huckleberry <nhuck@google.com>
Errors-To: dm-devel-bounces@redhat.com
Sender: "dm-devel" <dm-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Using tasklets for disk verification can reduce IO latency.  When there are
accelerated hash instructions it is often better to compute the hash immediately
using a tasklet rather than deferring verification to a work-queue.  This
reduces time spent waiting to schedule work-queue jobs, but requires spending
slightly more time in interrupt context.

A tasklet can only be used for verification if all the required hashes are
already in the dm-bufio cache.  If verification cannot be done in a tasklet, we
fallback the existing work-queue implementation.

To allow tasklets to query the dm-bufio cache, the dm-bufio code must not sleep.
This patchset adds a flag to dm-bufio that disallows sleeping.

The following shows a speed comparison of random reads on a dm-verity device.
The dm-verity device uses a 1G ramdisk for data and a 1G ramdisk for hashes.
One test was run using tasklets and one test was run using the existing
work-queue solution.  Both tests were run when the dm-bufio cache was hot.  The
tasklet implementation performs significantly better since there is no time
waiting for work-queue jobs to be scheduled.

# /data/fio /data/tasklet.fio | grep READ
   READ: bw=181MiB/s (190MB/s), 181MiB/s-181MiB/s (190MB/s-190MB/s), io=512MiB
   (537MB), run=2827-2827msec
# /data/fio /data/workqueue.fio | grep READ
   READ: bw=23.6MiB/s (24.8MB/s), 23.6MiB/s-23.6MiB/s (24.8MB/s-24.8MB/s),
   io=512MiB (537MB), run=21688-21688msec

Nathan Huckleberry (3):
  dm-bufio: Add flags for dm_bufio_client_create
  dm-bufio: Add DM_BUFIO_GET_CANT_SLEEP
  dm-verity: Add try_verify_in_tasklet

 drivers/md/dm-bufio.c                         | 29 +++++--
 drivers/md/dm-ebs-target.c                    |  3 +-
 drivers/md/dm-integrity.c                     |  2 +-
 drivers/md/dm-snap-persistent.c               |  2 +-
 drivers/md/dm-verity-fec.c                    |  4 +-
 drivers/md/dm-verity-target.c                 | 87 ++++++++++++++++---
 drivers/md/dm-verity.h                        |  5 ++
 drivers/md/persistent-data/dm-block-manager.c |  3 +-
 include/linux/dm-bufio.h                      |  8 +-
 9 files changed, 119 insertions(+), 24 deletions(-)

-- 
2.37.1.359.gd136c6c3e2-goog

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

