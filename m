Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 95B966F4146
	for <lists+dm-devel@lfdr.de>; Tue,  2 May 2023 12:22:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1683022924;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=53yggG5N+3uwb2XeCNLkxR2MbznAMcnN7Q9dJX2sk48=;
	b=LvGl7/t1tnbua8f5QuGVMXzacTVtJhZh+xBceYITS2NAXjFgxOG8IqNtT/QP6O6jtcEqk4
	gNhioQqxkRmxqobjpX6S6icveAcZosWuWqR0QJwj0bWJ/gdZC4pzNYvt8md4/px0D8cV/O
	PvxYqd6tOyoAfKSzubw2VEmolWBEciE=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-47-dupwKWyrOSe_V1UzpFvLOw-1; Tue, 02 May 2023 06:22:01 -0400
X-MC-Unique: dupwKWyrOSe_V1UzpFvLOw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D23483C10144;
	Tue,  2 May 2023 10:21:58 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id BC36640BC798;
	Tue,  2 May 2023 10:21:58 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 5881319465A8;
	Tue,  2 May 2023 10:21:58 +0000 (UTC)
X-Original-To: dm-devel@listman.corp.redhat.com
Delivered-To: dm-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 555B71946589
 for <dm-devel@listman.corp.redhat.com>; Tue,  2 May 2023 10:21:57 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 29815C15BB8; Tue,  2 May 2023 10:21:57 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 21ED7C15BAE
 for <dm-devel@redhat.com>; Tue,  2 May 2023 10:21:57 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 04E1F884EC4
 for <dm-devel@redhat.com>; Tue,  2 May 2023 10:21:57 +0000 (UTC)
Received: from esa5.hgst.iphmx.com (esa5.hgst.iphmx.com [216.71.153.144]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-107-cY01x7b1OzmUCILChpYaSQ-4; Tue, 02 May 2023 06:21:55 -0400
X-MC-Unique: cY01x7b1OzmUCILChpYaSQ-4
X-IronPort-AV: E=Sophos;i="5.99,243,1677513600"; d="scan'208";a="229597980"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 02 May 2023 18:21:54 +0800
IronPort-SDR: kbSxixv7L26Uy0pvQhfPRv153/VuF/j9t0AYjG2rI+RSq9D7Zb0BTVE3JNtgF/HORXNvQHlVLX
 3wHDxKHL8j8i/KjEMHDDLieCw4l9MLkSXC0AeOv9A4IPJeHKWMng1XzfywufypbqKvoEOmG984
 9GfV8VoxDF1A2AzPaJbt/V8etqUw2uVIptXoeL1XNKGC6/Jo1YDlZncKVBYl55XsS45sF0wg64
 MCalHXBMp2oQxD8lxTLmst3k28GS5YbrVNHCB8MHwwgcz7W5KjRIfdTQjj92tz2J6wLfMbYigZ
 gIo=
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 02 May 2023 02:31:41 -0700
IronPort-SDR: xRv9qUm/jkFHj47mGNA/6praQO5Yqj7qnIh22218g9Ii/1T0IZaxn5IqFfB1tzk0UZbvAYefj0
 /ajkmqJdSFIwqCAr1990sRV9STv6FmnvwMuCFh00tUkv1kcz55Tru+sZ+t3DxI2ItwUvm8O/TT
 gAhMfAT/LF6mCdTT/kjCHonXe81T0BejQwdHvS2IGUexu6EtwJUc2lkNjjtG2t8eY8jjwTl9Fp
 NYdkUfUEbsQHza/zSMGe0al18yoLgAUHBBNoGU5+ItYpshssTx8F6JYNPfvX9YwFGkWwD9ZVsN
 NOY=
WDCIronportException: Internal
Received: from myd008205.ad.shared (HELO localhost.localdomain)
 ([10.225.1.100])
 by uls-op-cesaip02.wdc.com with ESMTP; 02 May 2023 03:21:50 -0700
From: Johannes Thumshirn <johannes.thumshirn@wdc.com>
To: "axboe @ kernel . dk" <axboe@kernel.dk>
Date: Tue,  2 May 2023 12:19:31 +0200
Message-Id: <20230502101934.24901-18-johannes.thumshirn@wdc.com>
In-Reply-To: <20230502101934.24901-1-johannes.thumshirn@wdc.com>
References: <20230502101934.24901-1-johannes.thumshirn@wdc.com>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Subject: [dm-devel] [PATCH v5 17/20] block: mark bio_add_page as __must_check
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
Cc: linux-block@vger.kernel.org, damien.lemoal@wdc.com, kch@nvidia.com,
 agruenba@redhat.com, shaggy@kernel.org, song@kernel.org,
 Johannes Thumshirn <johannes.thumshirn@wdc.com>,
 Damien Le Moal <damien.lemoal@opensource.wdc.com>, snitzer@kernel.org,
 jfs-discussion@lists.sourceforge.net, willy@infradead.org, ming.lei@redhat.com,
 cluster-devel@redhat.com, linux-mm@kvack.org, dm-devel@redhat.com,
 linux-fsdevel@vger.kernel.org, linux-raid@vger.kernel.org, hch@lst.de,
 rpeterso@redhat.com
Errors-To: dm-devel-bounces@redhat.com
Sender: "dm-devel" <dm-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: wdc.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Now that all users of bio_add_page check for the return value, mark
bio_add_page as __must_check.

Reviewed-by: Damien Le Moal <damien.lemoal@opensource.wdc.com>
Signed-off-by: Johannes Thumshirn <johannes.thumshirn@wdc.com>
---
 include/linux/bio.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/bio.h b/include/linux/bio.h
index b3e7529ff55e..5d5b081ee062 100644
--- a/include/linux/bio.h
+++ b/include/linux/bio.h
@@ -465,7 +465,7 @@ extern void bio_uninit(struct bio *);
 void bio_reset(struct bio *bio, struct block_device *bdev, blk_opf_t opf);
 void bio_chain(struct bio *, struct bio *);
 
-int bio_add_page(struct bio *, struct page *, unsigned len, unsigned off);
+int __must_check bio_add_page(struct bio *, struct page *, unsigned len, unsigned off);
 bool bio_add_folio(struct bio *, struct folio *, size_t len, size_t off);
 extern int bio_add_pc_page(struct request_queue *, struct bio *, struct page *,
 			   unsigned int, unsigned int);
-- 
2.40.0

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

