Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 2AB0F2E6F51
	for <lists+dm-devel@lfdr.de>; Tue, 29 Dec 2020 10:29:13 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-496-2YW8DygOOZKeG8Wmum3iDg-1; Tue, 29 Dec 2020 04:29:09 -0500
X-MC-Unique: 2YW8DygOOZKeG8Wmum3iDg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 59BEC107ACE3;
	Tue, 29 Dec 2020 09:29:03 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B84145D9DD;
	Tue, 29 Dec 2020 09:29:02 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 8E8E64EBC6;
	Tue, 29 Dec 2020 09:28:52 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0BT9Sb14013081 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 29 Dec 2020 04:28:37 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 81E991112871; Tue, 29 Dec 2020 09:28:37 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7CA0C111286E
	for <dm-devel@redhat.com>; Tue, 29 Dec 2020 09:28:35 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2864F101A562
	for <dm-devel@redhat.com>; Tue, 29 Dec 2020 09:28:35 +0000 (UTC)
Received: from synology.com (mail.synology.com [211.23.38.101]) (Using TLS)
	by relay.mimecast.com with ESMTP id us-mta-475-_XMguf1uNuW_UA4-ldImbg-1;
	Tue, 29 Dec 2020 04:28:31 -0500
X-MC-Unique: _XMguf1uNuW_UA4-ldImbg-1
Received: from localhost.localdomain (unknown [10.17.198.239])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
	(No client certificate requested)
	by synology.com (Postfix) with ESMTPSA id 42A66CE780A1;
	Tue, 29 Dec 2020 17:21:11 +0800 (CST)
From: dannyshih <dannyshih@synology.com>
To: axboe@kernel.dk
Date: Tue, 29 Dec 2020 17:18:41 +0800
Message-Id: <1609233522-25837-4-git-send-email-dannyshih@synology.com>
In-Reply-To: <1609233522-25837-1-git-send-email-dannyshih@synology.com>
References: <1609233522-25837-1-git-send-email-dannyshih@synology.com>
X-Synology-MCP-Status: no
X-Synology-Spam-Flag: no
X-Synology-Spam-Status: score=0, required 6, WHITELIST_FROM_ADDRESS 0
X-Synology-Virus-Status: no
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: dm-devel@redhat.com
Cc: linux-raid@vger.kernel.org, snitzer@redhat.com, linux-block@vger.kernel.org,
	song@kernel.org, dm-devel@redhat.com,
	Danny Shih <dannyshih@synology.com>, agk@redhat.com
Subject: [dm-devel] [PATCH 3/4] dm: use submit_bio_noacct_add_head for split
	bio sending back
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
MIME-Version: 1.0
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Danny Shih <dannyshih@synology.com>

Use submit_bio_noacct_add_head when sending split bio back to dm device.
Otherwise, it might be handled after the lately split bio.

Signed-off-by: Danny Shih <dannyshih@synology.com>
Reviewed-by: Allen Peng <allenpeng@synology.com>
Reviewed-by: Alex Wu <alexwu@synology.com>
---
 drivers/md/dm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/md/dm.c b/drivers/md/dm.c
index b3c3c8b..1a651d5 100644
--- a/drivers/md/dm.c
+++ b/drivers/md/dm.c
@@ -1613,7 +1613,7 @@ static blk_qc_t __split_and_process_bio(struct mapped_device *md,
 
 				bio_chain(b, bio);
 				trace_block_split(b, bio->bi_iter.bi_sector);
-				ret = submit_bio_noacct(bio);
+				ret = submit_bio_noacct_add_head(bio);
 				break;
 			}
 		}
-- 
2.7.4

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

