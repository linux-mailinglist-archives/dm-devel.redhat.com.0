Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id D22FE6D01B6
	for <lists+dm-devel@lfdr.de>; Thu, 30 Mar 2023 12:45:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1680173107;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=Eg5d0/EaT/FGWjB7QpN8ZEUIAW2qIu30RKsuukmze9I=;
	b=b95ylEnx6q65IoxCRVvUJlBTkhPR541z3yuUEQvg6hkLkj3FkcFkkh+q/i/nkRlLfO24GC
	3usElL9ng2EMvIKqkMw42ombmefz9h/H4Z+IkIOsrO84eW+uLzWMxppFGDdsQnm0S71c9L
	vuuxOuBlN/MRFg9N3gzJZ5/5Qvel0v8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-248-TSQGCEerPvWSA75f_RHk4Q-1; Thu, 30 Mar 2023 06:45:05 -0400
X-MC-Unique: TSQGCEerPvWSA75f_RHk4Q-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9A0D218E0AC5;
	Thu, 30 Mar 2023 10:45:01 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 534792166B33;
	Thu, 30 Mar 2023 10:45:01 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 1F6FA194658F;
	Thu, 30 Mar 2023 10:45:01 +0000 (UTC)
X-Original-To: dm-devel@listman.corp.redhat.com
Delivered-To: dm-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 51D441946587
 for <dm-devel@listman.corp.redhat.com>; Thu, 30 Mar 2023 10:45:00 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 3842C492B00; Thu, 30 Mar 2023 10:45:00 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast08.extmail.prod.ext.rdu2.redhat.com [10.11.55.24])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 31383492C3E
 for <dm-devel@redhat.com>; Thu, 30 Mar 2023 10:45:00 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 155A73823A0E
 for <dm-devel@redhat.com>; Thu, 30 Mar 2023 10:45:00 +0000 (UTC)
Received: from esa1.hgst.iphmx.com (esa1.hgst.iphmx.com [68.232.141.245]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-599-vbXJ345FMMiQRAERQlAHhg-18; Thu, 30 Mar 2023 06:44:57 -0400
X-MC-Unique: vbXJ345FMMiQRAERQlAHhg-18
X-IronPort-AV: E=Sophos;i="5.98,303,1673884800"; d="scan'208";a="338948191"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 30 Mar 2023 18:44:56 +0800
IronPort-SDR: 7Fa1Xr3LhhrKKJlHMRAhbhQit7p7Mry7SzHkqqB6hsKqjnUqDCv2PQjUwE2Gt7AcIiN9fdm65g
 RqGxYmVg/BtXfYR+CpeTTKbpniOSNMzbYdAcOxRQEaIODlruGPGfJeSJntShd4Z9BpbGmn4U1n
 28GrpEnc5hq9g8LNyGFCeXc87nm6q4EvPj9Zm5/UOqOHOUDEWaF0SaD49e2v21LtFljDzEVpgm
 GuCjd8cy4ypznMGU8QdihnpkyNcHdLq+xOoJcH4PtXmV7KRGTsvo6ECQscZhSpsODd3scMEiaK
 isw=
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 30 Mar 2023 02:55:23 -0700
IronPort-SDR: 8tspoTXpxzHmClJsQZ5bC1hIVYMWR7fxHmL7Ag12bGN2b1vX5dZznqIk1xwQtM6kCQBYt4ri9+
 uDLHirIHJ+4DA1NFYYbUnI8BA/QPlErIYOwpzv98UE2BAm7hitWSquPo0TfsDDIyCATLOL07Nu
 HLS4fBI0QUHTKCNPkR12ymqUtn6Ain+2OW6y6kseY1SYoKAuFCRZt7zXjgTS1iH20DB1vpnG2p
 B++q/+YMWpsASXZesODVp5hf2KtcEe8sIoFQNuEb+V8X1xKBHnSJ33ZRqIMSCLLhRGlFncgf4R
 lH8=
WDCIronportException: Internal
Received: from unknown (HELO redsun91.ssa.fujisawa.hgst.com) ([10.149.66.72])
 by uls-op-cesaip01.wdc.com with ESMTP; 30 Mar 2023 03:44:54 -0700
From: Johannes Thumshirn <johannes.thumshirn@wdc.com>
To: Jens Axboe <axboe@kernel.dk>
Date: Thu, 30 Mar 2023 03:43:59 -0700
Message-Id: <8b8a3bb2db8c5183ef36c1810f2ac776ac526327.1680172791.git.johannes.thumshirn@wdc.com>
In-Reply-To: <cover.1680172791.git.johannes.thumshirn@wdc.com>
References: <cover.1680172791.git.johannes.thumshirn@wdc.com>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Subject: [dm-devel] [PATCH v2 17/19] md: raid1: check if adding pages to
 resync bio fails
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
Cc: Dave Kleikamp <shaggy@kernel.org>, jfs-discussion@lists.sourceforge.net,
 Song Liu <song@kernel.org>, dm-devel@redhat.com,
 Christoph Hellwig <hch@lst.de>, Andreas Gruenbacher <agruenba@redhat.com>,
 Damien Le Moal <damien.lemoal@opensource.wdc.com>,
 Matthew Wilcox <willy@infradead.org>, cluster-devel@redhat.com,
 Chaitanya Kulkarni <kch@nvidia.com>, Mike Snitzer <snitzer@kernel.org>,
 Ming Lei <ming.lei@redhat.com>, linux-raid@vger.kernel.org,
 Bob Peterson <rpeterso@redhat.com>, David Sterba <dsterba@suse.com>,
 linux-block@vger.kernel.org, Damien Le Moal <damien.lemoal@wdc.com>,
 linux-mm@kvack.org, Johannes Thumshirn <johannes.thumshirn@wdc.com>,
 linux-fsdevel@vger.kernel.org, linux-btrfs@vger.kernel.org
Errors-To: dm-devel-bounces@redhat.com
Sender: "dm-devel" <dm-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: wdc.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Check if adding pages to resync bio fails and if bail out.

As the comment above suggests this cannot happen, WARN if it actually
happens.

This way we can mark bio_add_pages as __must_check.

Signed-off-by: Johannes Thumshirn <johannes.thumshirn@wdc.com>
Reviewed-by: Damien Le Moal <damien.lemoal@opensource.wdc.com>
---
 drivers/md/raid1-10.c |  7 ++++++-
 drivers/md/raid10.c   | 12 ++++++++++--
 2 files changed, 16 insertions(+), 3 deletions(-)

diff --git a/drivers/md/raid1-10.c b/drivers/md/raid1-10.c
index e61f6cad4e08..c21b6c168751 100644
--- a/drivers/md/raid1-10.c
+++ b/drivers/md/raid1-10.c
@@ -105,7 +105,12 @@ static void md_bio_reset_resync_pages(struct bio *bio, struct resync_pages *rp,
 		 * won't fail because the vec table is big
 		 * enough to hold all these pages
 		 */
-		bio_add_page(bio, page, len, 0);
+		if (WARN_ON(!bio_add_page(bio, page, len, 0))) {
+			bio->bi_status = BLK_STS_RESOURCE;
+			bio_endio(bio);
+			return;
+		}
+
 		size -= len;
 	} while (idx++ < RESYNC_PAGES && size > 0);
 }
diff --git a/drivers/md/raid10.c b/drivers/md/raid10.c
index 6c66357f92f5..5682dba52fd3 100644
--- a/drivers/md/raid10.c
+++ b/drivers/md/raid10.c
@@ -3808,7 +3808,11 @@ static sector_t raid10_sync_request(struct mddev *mddev, sector_t sector_nr,
 			 * won't fail because the vec table is big enough
 			 * to hold all these pages
 			 */
-			bio_add_page(bio, page, len, 0);
+			if (WARN_ON(!bio_add_page(bio, page, len, 0))) {
+				bio->bi_status = BLK_STS_RESOURCE;
+				bio_endio(bio);
+				goto giveup;
+			}
 		}
 		nr_sectors += len>>9;
 		sector_nr += len>>9;
@@ -4989,7 +4993,11 @@ static sector_t reshape_request(struct mddev *mddev, sector_t sector_nr,
 			 * won't fail because the vec table is big enough
 			 * to hold all these pages
 			 */
-			bio_add_page(bio, page, len, 0);
+			if (WARN_ON(!bio_add_page(bio, page, len, 0))) {
+				bio->bi_status = BLK_STS_RESOURCE;
+				bio_endio(bio);
+				return sectors_done; /* XXX: is this correct? */
+			}
 		}
 		sector_nr += len >> 9;
 		nr_sectors += len >> 9;
-- 
2.39.2

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

