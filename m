Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 4368C97946
	for <lists+dm-devel@lfdr.de>; Wed, 21 Aug 2019 14:30:09 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 27AA97F765;
	Wed, 21 Aug 2019 12:30:07 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E06F25D721;
	Wed, 21 Aug 2019 12:30:06 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 43CB624F31;
	Wed, 21 Aug 2019 12:30:04 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x7L1dlh0017622 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 20 Aug 2019 21:39:47 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 5ECE260BF4; Wed, 21 Aug 2019 01:39:47 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx22.extmail.prod.ext.phx2.redhat.com
	[10.5.110.63])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2A29160BF3;
	Wed, 21 Aug 2019 01:39:42 +0000 (UTC)
Received: from sender4-pp-o95.zoho.com (sender4-pp-o95.zoho.com
	[136.143.188.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id A670B1801580;
	Wed, 21 Aug 2019 01:39:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1566351579; cv=none; d=zoho.com; s=zohoarc; 
	b=fp8j31Xa/U150l7Y6Fbp1R1Sgruh3tmrn7l8PPam2TDipyKsUCznK+wYJYB0oLjpxnKqrj1iBni6Yyb6QccD2kgnL9VySTEr8RDZ0fY+EJRTQSB6TtIGb3K7aZY5v0IVgxmLaSA8m9C3snw9nszXo7vK9Gr6D5+VZ9DmDjzMufY=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zoho.com;
	s=zohoarc; t=1566351579;
	h=Cc:Date:From:Message-ID:Subject:To:ARC-Authentication-Results;
	bh=X1s7c/q2LhXifg1IRo4YM5sxau9UteN88ivBRni95ns=; 
	b=akJ+PnPqyhzoo0FohsHlhOFPprxL8hWejLAIkEahbv7t/ZQBUJ5PrCSijBmgiBM6W9Dg5r1aE7I6+cr9fknT0DRXj3xeG8RWqe+sAKPrTXWMgsKLPWJ6lCsHLXeaZRWn3DUPPZiXGCDztsVLfUdnqFSfpCt8Oj7MqInou2fUsD4=
ARC-Authentication-Results: i=1; mx.zoho.com; dkim=pass  header.i=zoho.com;
	spf=pass  smtp.mailfrom=kontais@zoho.com;
	dmarc=pass header.from=<kontais@zoho.com>
	header.from=<kontais@zoho.com>
DomainKey-Signature: a=rsa-sha1; q=dns; c=nofws; s=zapps768; d=zoho.com; 
	h=from:to:cc:subject:date:message-id; 
	b=knMUgmONZ2y/YuDnv7B7dUtCXn8BCbophzl4idit5x/E7rEhfi4A9PzcP1aSMu3bfcbBSQqgJxba
	tJTQJl9+V2oW/czn9qtl1hoaSjPXsYEzn4SapA+3X+28AGv3LyVa  
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1566351579; 
	s=zm2019; d=zoho.com; i=kontais@zoho.com;
	h=From:To:Cc:Subject:Date:Message-Id; l=1322;
	bh=X1s7c/q2LhXifg1IRo4YM5sxau9UteN88ivBRni95ns=;
	b=Lq+ncVyE9B0GiDGyQwLxVAJe2SkVKTdmQ24y96S+aHwDOwAPnX9ExnIR7aEtAhe+
	dW5Z7lXicQVW/7DdSaJUIQEe5HVyhwSBl1zBbuj6LMVoUB52IP7ouSkzRlPOP36ECmo
	AirHUhjOybKTub605M8Tzlqh1vhHcJCQUXGpdyqc=
Received: from dev31.localdomain (103.244.59.4 [103.244.59.4]) by
	mx.zohomail.com with SMTPS id 1566351578120361.08327538001834;
	Tue, 20 Aug 2019 18:39:38 -0700 (PDT)
From: Zhang Tao <kontais@zoho.com>
To: agk@redhat.com, snitzer@redhat.com
Date: Wed, 21 Aug 2019 09:33:31 +0800
Message-Id: <1566351211-13280-1-git-send-email-kontais@zoho.com>
X-ZohoMailClient: External
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 238
	matched, not delayed by milter-greylist-4.6.2 (mx1.redhat.com
	[10.5.110.63]); Wed, 21 Aug 2019 01:39:41 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.6.2 (mx1.redhat.com [10.5.110.63]);
	Wed, 21 Aug 2019 01:39:41 +0000 (UTC) for IP:'136.143.188.95'
	DOMAIN:'sender4-pp-o95.zoho.com' HELO:'sender4-pp-o95.zoho.com'
	FROM:'kontais@zoho.com' RCPT:''
X-RedHat-Spam-Score: -0.099  (DKIM_SIGNED, DKIM_VALID, DKIM_VALID_AU,
	FREEMAIL_FROM, RCVD_IN_DNSWL_NONE, SPF_HELO_NONE,
	SPF_PASS) 136.143.188.95 sender4-pp-o95.zoho.com 136.143.188.95
	sender4-pp-o95.zoho.com <kontais@zoho.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.63
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Wed, 21 Aug 2019 08:29:57 -0400
Cc: Zhang Tao <zhangtao27@lenovo.com>, dm-devel@redhat.com,
	linux-kernel@vger.kernel.org
Subject: [dm-devel] [PATCH] dm table: fix a potential array out of bounds
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2 (mx1.redhat.com [10.5.110.71]); Wed, 21 Aug 2019 12:30:08 +0000 (UTC)

From: Zhang Tao <zhangtao27@lenovo.com>

allocate num + 1 for target and offset array, n_highs need num + 1
elements, the last element will be used for node lookup in function
dm_table_find_target.

Signed-off-by: Zhang Tao <zhangtao27@lenovo.com>
---
 drivers/md/dm-table.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/md/dm-table.c b/drivers/md/dm-table.c
index 7b6c3ee..fd7f604 100644
--- a/drivers/md/dm-table.c
+++ b/drivers/md/dm-table.c
@@ -160,20 +160,22 @@ static int alloc_targets(struct dm_table *t, unsigned int num)
 {
 	sector_t *n_highs;
 	struct dm_target *n_targets;
+	unsigned int alloc_num;
 
 	/*
 	 * Allocate both the target array and offset array at once.
 	 * Append an empty entry to catch sectors beyond the end of
 	 * the device.
 	 */
-	n_highs = (sector_t *) dm_vcalloc(num + 1, sizeof(struct dm_target) +
+	alloc_num = num + 1;
+	n_highs = (sector_t *) dm_vcalloc(alloc_num, sizeof(struct dm_target) +
 					  sizeof(sector_t));
 	if (!n_highs)
 		return -ENOMEM;
 
-	n_targets = (struct dm_target *) (n_highs + num);
+	n_targets = (struct dm_target *) (n_highs + alloc_num);
 
-	memset(n_highs, -1, sizeof(*n_highs) * num);
+	memset(n_highs, -1, sizeof(*n_highs) * alloc_num);
 	vfree(t->highs);
 
 	t->num_allocated = num;
-- 
1.8.3.1


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
