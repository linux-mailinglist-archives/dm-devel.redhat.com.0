Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id A7EF326BB2B
	for <lists+dm-devel@lfdr.de>; Wed, 16 Sep 2020 05:54:34 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-53-f32NYXb4ODSZDKCdp1gS6w-1; Tue, 15 Sep 2020 23:54:31 -0400
X-MC-Unique: f32NYXb4ODSZDKCdp1gS6w-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 798311074650;
	Wed, 16 Sep 2020 03:54:24 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7ED455DE47;
	Wed, 16 Sep 2020 03:54:23 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 9C79044A64;
	Wed, 16 Sep 2020 03:54:19 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 08G3sDCx001358 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 15 Sep 2020 23:54:13 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 1B7EBEAFAA; Wed, 16 Sep 2020 03:54:13 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1652CF00E9
	for <dm-devel@redhat.com>; Wed, 16 Sep 2020 03:54:10 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EA7C4101A53F
	for <dm-devel@redhat.com>; Wed, 16 Sep 2020 03:54:09 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99]) (Using TLS)
	by relay.mimecast.com with ESMTP id us-mta-518-yeXeNY_ANHq_SmODNW_GJA-1;
	Tue, 15 Sep 2020 23:54:07 -0400
X-MC-Unique: yeXeNY_ANHq_SmODNW_GJA-1
Received: from sol.attlocal.net (172-10-235-113.lightspeed.sntcca.sbcglobal.net
	[172.10.235.113])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 377B121655;
	Wed, 16 Sep 2020 03:54:06 +0000 (UTC)
From: Eric Biggers <ebiggers@kernel.org>
To: linux-block@vger.kernel.org, Jens Axboe <axboe@kernel.dk>
Date: Tue, 15 Sep 2020 20:53:12 -0700
Message-Id: <20200916035315.34046-1-ebiggers@kernel.org>
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
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 08G3sDCx001358
X-loop: dm-devel@redhat.com
Cc: Miaohe Lin <linmiaohe@huawei.com>, dm-devel@redhat.com,
	Satya Tangirala <satyat@google.com>
Subject: [dm-devel] [PATCH v2 0/3] block: fix up bio_crypt_ctx allocation
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

This series makes allocation of encryption contexts either able to fail,
or explicitly require __GFP_DIRECT_RECLAIM (via WARN_ON_ONCE).

This applies to linux-block/for-next.

Changed since v1 (https://lkml.kernel.org/r/20200902051511.79821-1-ebiggers@kernel.org):
    - Added patches 2 and 3.
    - Added kerneldoc for bio_crypt_clone().
    - Adjusted commit message.

Eric Biggers (3):
  block: make bio_crypt_clone() able to fail
  block: make blk_crypto_rq_bio_prep() able to fail
  block: warn if !__GFP_DIRECT_RECLAIM in bio_crypt_set_ctx()

 block/bio.c                 | 20 +++++++++-----------
 block/blk-core.c            |  8 +++++---
 block/blk-crypto-internal.h | 21 ++++++++++++++++-----
 block/blk-crypto.c          | 33 ++++++++++++++++++++-------------
 block/blk-mq.c              |  7 ++++++-
 block/bounce.c              | 19 +++++++++----------
 drivers/md/dm.c             |  7 ++++---
 include/linux/blk-crypto.h  | 20 ++++++++++++++++----
 8 files changed, 85 insertions(+), 50 deletions(-)


base-commit: 99faa39ec56f33591ed3cc4d3ef62ac2878fad7e
-- 
2.28.0


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

