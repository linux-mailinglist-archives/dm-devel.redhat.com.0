Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id C4D831F8EE1
	for <lists+dm-devel@lfdr.de>; Mon, 15 Jun 2020 08:58:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1592204289;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=T+0+5EOHf+QCMVuFeoAsKBOBocZNJn/PsP0wBht5pJ4=;
	b=bMfiXUxgYYRAjoMd/lZZlP5cxExmrihAKOpoKdT52SstCZ5ZGf5dfQ07REfUvDSuMSRVSK
	0svk+BE80Zzb/pcnhV1HYPci9xxaaAEitwXRPA6dVR9sfWL5jTfR95Tczohm6cGq4cn27K
	kydyf2jiyH1HgOcIGgvYUHiqKRN6Oto=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-418-JoT4ek3ZOz2F4etPJp8LWw-1; Mon, 15 Jun 2020 02:57:56 -0400
X-MC-Unique: JoT4ek3ZOz2F4etPJp8LWw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 712E27BAC;
	Mon, 15 Jun 2020 06:57:51 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 717A89033A;
	Mon, 15 Jun 2020 06:57:49 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 32868833C4;
	Mon, 15 Jun 2020 06:57:39 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 05CG14ZA026679 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 12 Jun 2020 12:01:04 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 2F9522166BA2; Fri, 12 Jun 2020 16:01:04 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E02A52156A2D
	for <dm-devel@redhat.com>; Fri, 12 Jun 2020 16:00:57 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 69A148007CB
	for <dm-devel@redhat.com>; Fri, 12 Jun 2020 16:00:57 +0000 (UTC)
Received: from sender4-pp-o92.zoho.com (sender4-pp-o92.zoho.com
	[136.143.188.92]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-281-jSR9Aw2NMkqFNnWAmNlrGg-1; Fri, 12 Jun 2020 11:59:53 -0400
X-MC-Unique: jSR9Aw2NMkqFNnWAmNlrGg-1
DomainKey-Signature: a=rsa-sha1; q=dns; c=nofws; s=zapps768; d=zoho.com; 
	h=from:to:cc:subject:date:message-id; 
	b=jwib4dOSM4dN3RdXv+76K4G5TxQ+2UkhB8qPHsbvUdrrJ2zTmRf5BX66PW6cvNYcpcble5sSv1JL
	lZzNJRcGyyEmxucQTypF2ncMei/TrRY2NNc6/I7PfM9OSzbPyeO+
Received: from YEHS1XPF1D05WL.lenovo.com (111.197.254.230 [111.197.254.230])
	by mx.zohomail.com with SMTPS id 15919775869391016.4366660991806;
	Fri, 12 Jun 2020 08:59:46 -0700 (PDT)
From: Huaisheng Ye <yehs2007@zoho.com>
To: mpatocka@redhat.com, snitzer@redhat.com, agk@redhat.com
Date: Fri, 12 Jun 2020 23:59:11 +0800
Message-Id: <20200612155911.96528-1-yehs2007@zoho.com>
X-ZohoMailClient: External
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Mon, 15 Jun 2020 02:57:28 -0400
Cc: dm-devel@redhat.com, linux-kernel@vger.kernel.org,
	Huaisheng Ye <yehs1@lenovo.com>
Subject: [dm-devel] [PATCH] dm writecache: correct uncommitted_block when
	discarding uncommitted entry
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Huaisheng Ye <yehs1@lenovo.com>

When uncommitted entry has been discarded, correct wc->uncommitted_block
for getting the exact number.

Signed-off-by: Huaisheng Ye <yehs1@lenovo.com>
---
 drivers/md/dm-writecache.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/md/dm-writecache.c b/drivers/md/dm-writecache.c
index 4367cc7..64b4527 100644
--- a/drivers/md/dm-writecache.c
+++ b/drivers/md/dm-writecache.c
@@ -855,6 +855,8 @@ static void writecache_discard(struct dm_writecache *wc, sector_t start, sector_
 				}
 				discarded_something = true;
 			}
+			if (!writecache_entry_is_committed(wc, e))
+				wc->uncommitted_blocks--;
 			writecache_free_entry(wc, e);
 		}
 
-- 
1.8.3.1

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

