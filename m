Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id AEAC726BB2C
	for <lists+dm-devel@lfdr.de>; Wed, 16 Sep 2020 05:54:37 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-529-xyWK7mzoNg6wKwBOpwjKsQ-1; Tue, 15 Sep 2020 23:54:33 -0400
X-MC-Unique: xyWK7mzoNg6wKwBOpwjKsQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 022F81868423;
	Wed, 16 Sep 2020 03:54:28 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D4F56171F9;
	Wed, 16 Sep 2020 03:54:27 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 8F210183D024;
	Wed, 16 Sep 2020 03:54:27 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 08G3sDtJ001357 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 15 Sep 2020 23:54:13 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 1ABF1AB40A; Wed, 16 Sep 2020 03:54:13 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 164B6B2791
	for <dm-devel@redhat.com>; Wed, 16 Sep 2020 03:54:10 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9BA31858280
	for <dm-devel@redhat.com>; Wed, 16 Sep 2020 03:54:10 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99]) (Using TLS)
	by relay.mimecast.com with ESMTP id us-mta-541-gRVvx-hWMP6Wkvbkvh5-9Q-1;
	Tue, 15 Sep 2020 23:54:08 -0400
X-MC-Unique: gRVvx-hWMP6Wkvbkvh5-9Q-1
Received: from sol.attlocal.net (172-10-235-113.lightspeed.sntcca.sbcglobal.net
	[172.10.235.113])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id EC4FA221E7;
	Wed, 16 Sep 2020 03:54:06 +0000 (UTC)
From: Eric Biggers <ebiggers@kernel.org>
To: linux-block@vger.kernel.org, Jens Axboe <axboe@kernel.dk>
Date: Tue, 15 Sep 2020 20:53:15 -0700
Message-Id: <20200916035315.34046-4-ebiggers@kernel.org>
In-Reply-To: <20200916035315.34046-1-ebiggers@kernel.org>
References: <20200916035315.34046-1-ebiggers@kernel.org>
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
	lists01.pubmisc.prod.ext.phx2.redhat.com id 08G3sDtJ001357
X-loop: dm-devel@redhat.com
Cc: Miaohe Lin <linmiaohe@huawei.com>, dm-devel@redhat.com,
	Satya Tangirala <satyat@google.com>
Subject: [dm-devel] [PATCH v2 3/3] block: warn if !__GFP_DIRECT_RECLAIM in
	bio_crypt_set_ctx()
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
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Eric Biggers <ebiggers@google.com>

bio_crypt_set_ctx() assumes its gfp_mask argument always includes
__GFP_DIRECT_RECLAIM, so that the mempool_alloc() will always succeed.

For now this assumption is still fine, since no callers violate it.
Making bio_crypt_set_ctx() able to fail would add unneeded complexity.

However, if a caller didn't use __GFP_DIRECT_RECLAIM, it would be very
hard to notice the bug.  Make it easier by adding a WARN_ON_ONCE().

Cc: Miaohe Lin <linmiaohe@huawei.com>
Cc: Satya Tangirala <satyat@google.com>
Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 block/blk-crypto.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/block/blk-crypto.c b/block/blk-crypto.c
index bbe7974fd74f0..5da43f0973b46 100644
--- a/block/blk-crypto.c
+++ b/block/blk-crypto.c
@@ -81,7 +81,15 @@ subsys_initcall(bio_crypt_ctx_init);
 void bio_crypt_set_ctx(struct bio *bio, const struct blk_crypto_key *key,
 		       const u64 dun[BLK_CRYPTO_DUN_ARRAY_SIZE], gfp_t gfp_mask)
 {
-	struct bio_crypt_ctx *bc = mempool_alloc(bio_crypt_ctx_pool, gfp_mask);
+	struct bio_crypt_ctx *bc;
+
+	/*
+	 * The caller must use a gfp_mask that contains __GFP_DIRECT_RECLAIM so
+	 * that the mempool_alloc() can't fail.
+	 */
+	WARN_ON_ONCE(!(gfp_mask & __GFP_DIRECT_RECLAIM));
+
+	bc = mempool_alloc(bio_crypt_ctx_pool, gfp_mask);
 
 	bc->bc_key = key;
 	memcpy(bc->bc_dun, dun, sizeof(bc->bc_dun));
-- 
2.28.0


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

