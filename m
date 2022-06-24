Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 83498559B4F
	for <lists+dm-devel@lfdr.de>; Fri, 24 Jun 2022 16:18:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1656080289;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=ZQOFrUEN1xQUvGufW0mg31nIu6XfFhefITsECs9xLi4=;
	b=UvBS6pOqHhhj38VBeuGEC240WNEPLNa3L9E9AD3G1gcOYE1jKOwDmTTCUonFE6OgQF1dH1
	sRoVCTddGwLLwxQ5nhOILVTbejcgfK4DGDg+Cx99WZYAUDeyMKtyT9v7I0hafZQ2RL9fT/
	PMZphlwr2XcCEZA31xCzQjK7aoYDOD4=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-368-E59ndM-xPAC_ZPnzalbdRw-1; Fri, 24 Jun 2022 10:16:15 -0400
X-MC-Unique: E59ndM-xPAC_ZPnzalbdRw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 93A7B3802BAB;
	Fri, 24 Jun 2022 14:14:41 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id CE5249D63;
	Fri, 24 Jun 2022 14:14:35 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 32317194B962;
	Fri, 24 Jun 2022 14:14:34 +0000 (UTC)
X-Original-To: dm-devel@listman.corp.redhat.com
Delivered-To: dm-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 9153A194B946
 for <dm-devel@listman.corp.redhat.com>; Fri, 24 Jun 2022 14:14:32 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 37F6CC08087; Fri, 24 Jun 2022 14:14:32 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from localhost (ovpn-8-21.pek2.redhat.com [10.72.8.21])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5CE6CC15D42;
 Fri, 24 Jun 2022 14:14:30 +0000 (UTC)
From: Ming Lei <ming.lei@redhat.com>
To: Jens Axboe <axboe@kernel.dk>,
	Mike Snitzer <snitzer@redhat.com>
Date: Fri, 24 Jun 2022 22:12:51 +0800
Message-Id: <20220624141255.2461148-1-ming.lei@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Subject: [dm-devel] [PATCH 5.20 0/4] block/dm: add bio_rewind for improving
 dm requeue
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
Cc: linux-block@vger.kernel.org, dm-devel@redhat.com,
 Ming Lei <ming.lei@redhat.com>
Errors-To: dm-devel-bounces@redhat.com
Sender: "dm-devel" <dm-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hello Guys,

The 1st patch adds bio_rewind which can restore bio to original position
by recording sectors between the original position to bio's end sector
if the bio's end sector won't change, which should be very common to
see.

The 2nd and 3rd patch cleans up dm code for handling requeue &
completion.

The last patch implements 2 stage dm io requeue for avoiding to allocate
one bio beforehand for just handling requeue which is one unusual event.
The 1st stage requeue is added for cloning & restoring original bio in wq
context, then 2nd stage requeue will use that as original bio for
handling requeue.


Ming Lei (4):
  block: add bio_rewind() API
  dm: add new helper for handling dm_io requeue
  dm: improve handling for DM_REQUEUE and AGAIN
  dm: add two stage requeue

 block/bio-integrity.c       |  19 ++++
 block/bio.c                 |  19 ++++
 block/blk-crypto-internal.h |   7 ++
 block/blk-crypto.c          |  23 +++++
 drivers/md/dm-core.h        |  11 ++-
 drivers/md/dm.c             | 180 ++++++++++++++++++++++++++++--------
 include/linux/bio.h         |  21 +++++
 include/linux/bvec.h        |  33 +++++++
 8 files changed, 271 insertions(+), 42 deletions(-)

-- 
2.31.1

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

