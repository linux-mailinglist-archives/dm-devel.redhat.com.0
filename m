Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C633A626B
	for <lists+dm-devel@lfdr.de>; Tue,  3 Sep 2019 09:28:23 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 81EE218C893C;
	Tue,  3 Sep 2019 07:28:21 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0445C5C1B5;
	Tue,  3 Sep 2019 07:28:21 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 22B122551E;
	Tue,  3 Sep 2019 07:28:18 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x82A5CV8023714 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 2 Sep 2019 06:05:12 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id A127F60C47; Mon,  2 Sep 2019 10:05:12 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx01.extmail.prod.ext.phx2.redhat.com
	[10.5.110.25])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 71CC060C18;
	Mon,  2 Sep 2019 10:05:07 +0000 (UTC)
Received: from sender4-pp-o95.zoho.com (sender4-pp-o95.zoho.com
	[136.143.188.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 2789485360;
	Mon,  2 Sep 2019 10:05:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1567418704; cv=none; d=zoho.com; s=zohoarc; 
	b=TM+4mEo1xD2rzEeOfUxWndcC3p0c8zhKYLLPAqM/BOV14zqFaKumCXx8Zy6hu/18AsOsP+TPVaeLZ6bVemP8diEYHDUtiSrdc+2uwGNy4KNQ9PLRA9IP62A95m4Zdq78av9OhLMHjmxQpvXd4kGpx5CBmWAKV71d+vLLd295Bno=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zoho.com;
	s=zohoarc; t=1567418704;
	h=Cc:Date:From:Message-ID:Subject:To:ARC-Authentication-Results;
	bh=Ot31l6YpX1Hep2bcCR1LFgbNEtu8dKylpOjGYbOxviM=; 
	b=biMCUT0zeW4LfaIQz+uiKhh4+fQoHdfApmOIaEMmq+7+RRv2qfDaiGqns4/K9isfdmumv+kaCUScwZIeIdCf0Hk2pPEnySpR5NS0qnsjXthJDtrJx+tzUld6g0W1c/0cjbkdCS9FhSYzfVBhoqUKbBEwdsg/BDJ1UYZ6uXHz+zQ=
ARC-Authentication-Results: i=1; mx.zoho.com; dkim=pass  header.i=zoho.com;
	spf=pass  smtp.mailfrom=yehs2007@zoho.com;
	dmarc=pass header.from=<yehs2007@zoho.com>
	header.from=<yehs2007@zoho.com>
DomainKey-Signature: a=rsa-sha1; q=dns; c=nofws; s=zapps768; d=zoho.com; 
	h=from:to:cc:subject:date:message-id; 
	b=czy/eCu1ugpkJGhENvNLqYJWEHDA7rdgLAiR+89XIzN4M3F28ach6VP6qA3xNdZmujT7mhNHokCP
	rqxXqCcUvxCnXrXxzODJoYdpApi/RsxExfeDwO8ISwt71/kfEhTG  
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1567418704; 
	s=zm2019; d=zoho.com; i=yehs2007@zoho.com;
	h=From:To:Cc:Subject:Date:Message-Id; l=911;
	bh=Ot31l6YpX1Hep2bcCR1LFgbNEtu8dKylpOjGYbOxviM=;
	b=QxLgzFE7GjTrKP6CgR4RAKH6pA4VZ3f28TEBGKKPr1hYWk8Xibf9nCE9OxBkS4iw
	1u0MfRITi23bPn3e5Oq61rL25siCq5jjD2Y7XUDNVgiuF5iIdKM/SAaWR92UyuYTaDv
	Jedy067xd+CjwOPefeZo8UCAM0joTFR8j3Ui7COc=
Received: from YEHS1XPF1D05WL.lenovo.com (111.205.43.251 [111.205.43.251]) by
	mx.zohomail.com with SMTPS id 1567418703324628.2466891855994;
	Mon, 2 Sep 2019 03:05:03 -0700 (PDT)
From: Huaisheng Ye <yehs2007@zoho.com>
To: mpatocka@redhat.com, snitzer@redhat.com, agk@redhat.com
Date: Mon,  2 Sep 2019 18:04:50 +0800
Message-Id: <20190902100450.10600-1-yehs2007@zoho.com>
X-ZohoMailClient: External
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 238
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.25]); Mon, 02 Sep 2019 10:05:06 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.25]);
	Mon, 02 Sep 2019 10:05:06 +0000 (UTC) for IP:'136.143.188.95'
	DOMAIN:'sender4-pp-o95.zoho.com' HELO:'sender4-pp-o95.zoho.com'
	FROM:'yehs2007@zoho.com' RCPT:''
X-RedHat-Spam-Score: 0.151  (DKIM_SIGNED, DKIM_VALID, DKIM_VALID_AU,
	FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,
	SPF_PASS) 136.143.188.95 sender4-pp-o95.zoho.com 136.143.188.95
	sender4-pp-o95.zoho.com <yehs2007@zoho.com>
X-Scanned-By: MIMEDefang 2.83 on 10.5.110.25
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Tue, 03 Sep 2019 03:28:11 -0400
Cc: prarit@redhat.com, dm-devel@redhat.com, linux-kernel@vger.kernel.org,
	tyu1@lenovo.com, Huaisheng Ye <yehs1@lenovo.com>
Subject: [dm-devel] [PATCH] dm writecache: skip writecache_wait for pmem mode
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2 (mx1.redhat.com [10.5.110.70]); Tue, 03 Sep 2019 07:28:22 +0000 (UTC)

From: Huaisheng Ye <yehs1@lenovo.com>

The array bio_in_progress[2] only have chance to be increased and
decreased with ssd mode. For pmem mode, they are not involved at all.
So skip writecache_wait_for_ios in writecache_flush for pmem.

Suggested-by: Doris Yu <tyu1@lenovo.com>
Signed-off-by: Huaisheng Ye <yehs1@lenovo.com>
---
 drivers/md/dm-writecache.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/md/dm-writecache.c b/drivers/md/dm-writecache.c
index c481947..d06b8aa 100644
--- a/drivers/md/dm-writecache.c
+++ b/drivers/md/dm-writecache.c
@@ -726,7 +726,8 @@ static void writecache_flush(struct dm_writecache *wc)
 	}
 	writecache_commit_flushed(wc);
 
-	writecache_wait_for_ios(wc, WRITE);
+	if (!WC_MODE_PMEM(wc))
+		writecache_wait_for_ios(wc, WRITE);
 
 	wc->seq_count++;
 	pmem_assign(sb(wc)->seq_count, cpu_to_le64(wc->seq_count));
-- 
1.8.3.1


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
