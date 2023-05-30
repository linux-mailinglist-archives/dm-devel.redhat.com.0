Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id EAC6571684A
	for <lists+dm-devel@lfdr.de>; Tue, 30 May 2023 17:58:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1685462332;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=shDulqELLWrPJoFtWjQAeMSQ98GK9wqdngZic3+RDjI=;
	b=DkeSOG5q2JgzGSD/2ndw6ej4OoAixUuSUEu/DEnBIuZ0m/1jezlgM0BbjqTU346KP3RZHf
	NDyB9/N4PFBArMv4V/f2C95nOk3qTvORwZieY6cVSN59CaEFfYL2O37aeH0KyFj5aTNpyK
	0x5K3Cx96+QQeud2BQqqgwnXSbUEw9k=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-652-2HN1feawNoGwQ49Aw2NRTg-1; Tue, 30 May 2023 11:58:34 -0400
X-MC-Unique: 2HN1feawNoGwQ49Aw2NRTg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 44D96800141;
	Tue, 30 May 2023 15:51:18 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 2377917103;
	Tue, 30 May 2023 15:51:18 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 752A319451E6;
	Tue, 30 May 2023 15:50:27 +0000 (UTC)
X-Original-To: dm-devel@listman.corp.redhat.com
Delivered-To: dm-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id DB24719465B6
 for <dm-devel@listman.corp.redhat.com>; Tue, 30 May 2023 15:50:08 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id B271F40CFD46; Tue, 30 May 2023 15:50:08 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast08.extmail.prod.ext.rdu2.redhat.com [10.11.55.24])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id AB56340CFD45
 for <dm-devel@redhat.com>; Tue, 30 May 2023 15:50:08 +0000 (UTC)
Received: from us-smtp-inbound-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 90EDF3823A24
 for <dm-devel@redhat.com>; Tue, 30 May 2023 15:50:08 +0000 (UTC)
Received: from esa6.hgst.iphmx.com (esa6.hgst.iphmx.com [216.71.154.45]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-104-f3j7VLpIMquWct2msjPeKw-4; Tue, 30 May 2023 11:50:01 -0400
X-MC-Unique: f3j7VLpIMquWct2msjPeKw-4
X-IronPort-AV: E=Sophos;i="6.00,204,1681142400"; d="scan'208";a="231986007"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 30 May 2023 23:50:00 +0800
IronPort-SDR: aLG/zMLRUmV4frTFQN5APqxj8u7jEEltW6SEFuNd6aJTk6pUAZJNy3YBaeiYqMKNqtuCLkmIIM
 VNN2Hq+5tCd5SmSQkYwmZWOpKn0+6K4Zdtz3F8yOfgVlRkC7qq1Z7fmB6G7JEYMb91IG+Y6Uq2
 Y8VxxE7WnC5BUe8gqhYdfZXjyMS49gcPnhIAKdRq/qicDRIRigbX7zTjc+3soyifXaEu0KL6Ai
 iIkY7i/aufF508IycgrwIsakoW0GYNk6xkejVHBdtVfR1JGbrNR0xbdxAUQj157csCPVNkD4EN
 OsE=
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 30 May 2023 08:04:53 -0700
IronPort-SDR: ZMHPyde+x3oZg2TtUSRL/5p5WqVr/ZfKqvYwCZxUYP2qYQ91FJJt40KpHRQdugU8uEYsX/I3K/
 I9FEFvtZk6Bs4sVviWPES8u2Sy6mkQSXkjcdYwONAcCuJSehDyyyLlFwpmPv+ibIXsEmu0GWG4
 2Y8ns+RdUjXQlTNei1wm9AL/aSe4WsIWt+fbIYohfizzZXwI2DiTr8AG9+VlPVIh3eTqf/W2/A
 sFbZ+/LPFzOwaTFd1WGs1qMqHoly+Y7z8CXi9+Jw0hugo7ke60l0xnB9VSjPDyKn0GdZOBduyf
 BL8=
WDCIronportException: Internal
Received: from unknown (HELO redsun91.ssa.fujisawa.hgst.com) ([10.149.66.6])
 by uls-op-cesaip02.wdc.com with ESMTP; 30 May 2023 08:49:57 -0700
From: Johannes Thumshirn <johannes.thumshirn@wdc.com>
To: Jens Axboe <axboe@kernel.dk>
Date: Tue, 30 May 2023 08:49:13 -0700
Message-Id: <b1b488224117ed5e230478fee2d4c5536ee1fa45.1685461490.git.johannes.thumshirn@wdc.com>
In-Reply-To: <cover.1685461490.git.johannes.thumshirn@wdc.com>
References: <cover.1685461490.git.johannes.thumshirn@wdc.com>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Subject: [dm-devel] [PATCH v6 10/20] zonefs: use __bio_add_page for adding
 single page to bio
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
 Bob Peterson <rpeterso@redhat.com>, Mikulas Patocka <mpatocka@redhat.com>,
 linux-block@vger.kernel.org, Damien Le Moal <damien.lemoal@wdc.com>,
 gouhao@uniontech.com, linux-mm@kvack.org,
 Johannes Thumshirn <johannes.thumshirn@wdc.com>, linux-fsdevel@vger.kernel.org
Errors-To: dm-devel-bounces@redhat.com
Sender: "dm-devel" <dm-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: wdc.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The zonefs superblock reading code uses bio_add_page() to add a page to a
newly created bio. bio_add_page() can fail, but the return value is
never checked.

Use __bio_add_page() as adding a single page to a newly created bio is
guaranteed to succeed.

This brings us a step closer to marking bio_add_page() as __must_check.

Acked-by: Damien Le Moal <damien.lemoal@opensource.wdc.com>
Signed-off-by: Johannes Thumshirn <johannes.thumshirn@wdc.com>
---
 fs/zonefs/super.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/zonefs/super.c b/fs/zonefs/super.c
index 23b8b299c64e..9350221abfc5 100644
--- a/fs/zonefs/super.c
+++ b/fs/zonefs/super.c
@@ -1128,7 +1128,7 @@ static int zonefs_read_super(struct super_block *sb)
 
 	bio_init(&bio, sb->s_bdev, &bio_vec, 1, REQ_OP_READ);
 	bio.bi_iter.bi_sector = 0;
-	bio_add_page(&bio, page, PAGE_SIZE, 0);
+	__bio_add_page(&bio, page, PAGE_SIZE, 0);
 
 	ret = submit_bio_wait(&bio);
 	if (ret)
-- 
2.40.1

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

