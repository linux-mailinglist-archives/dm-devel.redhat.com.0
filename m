Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 047B24CDD3E
	for <lists+dm-devel@lfdr.de>; Fri,  4 Mar 2022 20:16:32 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-664-2WR9_lg3N9K38Rn6aPkD2g-1; Fri, 04 Mar 2022 14:16:28 -0500
X-MC-Unique: 2WR9_lg3N9K38Rn6aPkD2g-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CF59D1854E21;
	Fri,  4 Mar 2022 19:16:19 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7008C60936;
	Fri,  4 Mar 2022 19:16:17 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id AA0651809C98;
	Fri,  4 Mar 2022 19:16:10 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
	[10.11.54.10])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 224JG0pD002169 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 4 Mar 2022 14:16:00 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 9C9BD4328D7; Fri,  4 Mar 2022 19:16:00 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast07.extmail.prod.ext.rdu2.redhat.com [10.11.55.23])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 990344292D9
	for <dm-devel@redhat.com>; Fri,  4 Mar 2022 19:16:00 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7F43B3C01B91
	for <dm-devel@redhat.com>; Fri,  4 Mar 2022 19:16:00 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133]) by relay.mimecast.com with ESMTP with STARTTLS
	(version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	us-mta-414-kfW7QB1sO321R1K9_Mgkeg-1; Fri, 04 Mar 2022 14:15:52 -0500
X-MC-Unique: kfW7QB1sO321R1K9_Mgkeg-1
Received: from [2001:4bb8:180:5296:cded:8d4b:ace6:f3c] (helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nQCFC-00BV1M-HL; Fri, 04 Mar 2022 18:01:34 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Date: Fri,  4 Mar 2022 19:01:05 +0100
Message-Id: <20220304180105.409765-11-hch@lst.de>
In-Reply-To: <20220304180105.409765-1-hch@lst.de>
References: <20220304180105.409765-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
	bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
X-loop: dm-devel@redhat.com
Cc: linux-raid@vger.kernel.org, Theodore Ts'o <tytso@mit.edu>,
	linux-block@vger.kernel.org, Song Liu <song@kernel.org>,
	dm-devel@redhat.com, linux-ext4@vger.kernel.org
Subject: [dm-devel] [PATCH 10/10] block: remove bio_devname
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

All callers are gone, so remove this wrapper.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 block/bio.c         | 6 ------
 include/linux/bio.h | 2 --
 2 files changed, 8 deletions(-)

diff --git a/block/bio.c b/block/bio.c
index b15f5466ce084..151cace2dbe16 100644
--- a/block/bio.c
+++ b/block/bio.c
@@ -807,12 +807,6 @@ int bio_init_clone(struct block_device *bdev, struct bio *bio,
 }
 EXPORT_SYMBOL(bio_init_clone);
 
-const char *bio_devname(struct bio *bio, char *buf)
-{
-	return bdevname(bio->bi_bdev, buf);
-}
-EXPORT_SYMBOL(bio_devname);
-
 /**
  * bio_full - check if the bio is full
  * @bio:	bio to check
diff --git a/include/linux/bio.h b/include/linux/bio.h
index 7523aba4ddf7c..4c21f6e69e182 100644
--- a/include/linux/bio.h
+++ b/include/linux/bio.h
@@ -491,8 +491,6 @@ static inline void bio_release_pages(struct bio *bio, bool mark_dirty)
 		__bio_release_pages(bio, mark_dirty);
 }
 
-extern const char *bio_devname(struct bio *bio, char *buffer);
-
 #define bio_dev(bio) \
 	disk_devt((bio)->bi_bdev->bd_disk)
 
-- 
2.30.2

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

