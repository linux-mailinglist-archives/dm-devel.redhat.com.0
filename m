Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 29849898AF
	for <lists+dm-devel@lfdr.de>; Mon, 12 Aug 2019 10:30:45 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id EECB7793E5;
	Mon, 12 Aug 2019 08:30:42 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5102119C4F;
	Mon, 12 Aug 2019 08:30:40 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id D6D0118005B9;
	Mon, 12 Aug 2019 08:30:35 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x7BGCtcc019130 for <dm-devel@listman.util.phx.redhat.com>;
	Sun, 11 Aug 2019 12:12:55 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id A554564434; Sun, 11 Aug 2019 16:12:55 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx18.extmail.prod.ext.phx2.redhat.com
	[10.5.110.47])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1DDAF6012D;
	Sun, 11 Aug 2019 16:12:51 +0000 (UTC)
Received: from sender4-pp-o95.zoho.com (sender4-pp-o95.zoho.com
	[136.143.188.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id B419530821AE;
	Sun, 11 Aug 2019 16:12:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1565539968; cv=none; d=zoho.com; s=zohoarc; 
	b=UMyNH7HBAABebeq9+p3mhTE8wvjaVLEKShctDus1FhQOHf2zz1+07oN3chn9PrFuivrHVqfp2wr/SeYQh6fhmFEEF5asQ/5n+jcH0pNNaZ86ljk2IKBbehUBDzea0Xtmwy2smzJ9dWphOLeLO9wPE0q01OhXNIrBcYxavZYMuv0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zoho.com;
	s=zohoarc; t=1565539968;
	h=Cc:Date:From:Message-ID:Subject:To:ARC-Authentication-Results;
	bh=RDRspd14WFFAqpEgCwVCBF5hWq4eIuUAPFRdNY1Qr5M=; 
	b=PFAgk36/7O22tqmuti54U1NZiSC9naXmJkjYlxaz8raFWPdjAmyit0e5fPEljoKKBis14RgLKv0AdZf9OnhotkTIG1zB2rTg+gFR2iZkw1ghpQIBvMMqkjLmiOtw5OMlKQRMefvs3C2YRb0dLmagkmQSRIwrCLrnz1rlHdN2PQE=
ARC-Authentication-Results: i=1; mx.zoho.com; dkim=pass  header.i=zoho.com;
	spf=pass  smtp.mailfrom=yehs2007@zoho.com;
	dmarc=pass header.from=<yehs2007@zoho.com>
	header.from=<yehs2007@zoho.com>
DomainKey-Signature: a=rsa-sha1; q=dns; c=nofws; s=zapps768; d=zoho.com; 
	h=from:to:cc:subject:date:message-id; 
	b=oSxardQRHbESzohqmPTbbFcstHm4my1NOgTP8u2fcI3J8lM1psGBPT1BhZK+xk42+fRaAJ8tOFpn
	NR+NhQri5IR+1+V2lUMXijBOOsYQB6AKM8YK10UEMOyplTCjM1a0  
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1565539968; 
	s=zm2019; d=zoho.com; i=yehs2007@zoho.com;
	h=From:To:Cc:Subject:Date:Message-Id; l=665;
	bh=RDRspd14WFFAqpEgCwVCBF5hWq4eIuUAPFRdNY1Qr5M=;
	b=IxB+fWn5NilLxekR+a16wqgkvDxBgq2TgpXST78UfwdXc8jtGpgGBUjjYS9uv62i
	BNbj+a2p4P77/orqrDV3+OkmBGcfTGrCXkmVNNoOuO+fbZh3JqyxKcibFqQrzgVIBxS
	dkbclLJWAoA2DT0N+eXIWWWNNqEVxDBjXbA7GyPQ=
Received: from YEHS1XR3054QMS.lenovo.com (114.245.9.228 [114.245.9.228]) by
	mx.zohomail.com with SMTPS id 156553996745427.6067071232319;
	Sun, 11 Aug 2019 09:12:47 -0700 (PDT)
From: Huaisheng Ye <yehs2007@zoho.com>
To: mpatocka@redhat.com, snitzer@redhat.com, agk@redhat.com
Date: Mon, 12 Aug 2019 00:12:32 +0800
Message-Id: <20190811161233.7616-1-yehs2007@zoho.com>
X-ZohoMailClient: External
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 238
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.47]); Sun, 11 Aug 2019 16:12:50 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.47]);
	Sun, 11 Aug 2019 16:12:50 +0000 (UTC) for IP:'136.143.188.95'
	DOMAIN:'sender4-pp-o95.zoho.com' HELO:'sender4-pp-o95.zoho.com'
	FROM:'yehs2007@zoho.com' RCPT:''
X-RedHat-Spam-Score: 0.151  (DKIM_SIGNED, DKIM_VALID, DKIM_VALID_AU,
	FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,
	SPF_PASS) 136.143.188.95 sender4-pp-o95.zoho.com 136.143.188.95
	sender4-pp-o95.zoho.com <yehs2007@zoho.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.47
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Mon, 12 Aug 2019 04:30:26 -0400
Cc: prarit@redhat.com, dm-devel@redhat.com, linux-kernel@vger.kernel.org,
	tyu1@lenovo.com, Huaisheng Ye <yehs1@lenovo.com>
Subject: [dm-devel] dm writecache: remove unused member pointer in
	writeback_struct
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.25]); Mon, 12 Aug 2019 08:30:43 +0000 (UTC)

From: Huaisheng Ye <yehs1@lenovo.com>

The stucture member pointer page in writeback_struct never has been
used actually. Remove it.

Signed-off-by: Huaisheng Ye <yehs1@lenovo.com>
---
 drivers/md/dm-writecache.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/md/dm-writecache.c b/drivers/md/dm-writecache.c
index 1cb137f..5c7009d 100644
--- a/drivers/md/dm-writecache.c
+++ b/drivers/md/dm-writecache.c
@@ -190,7 +190,6 @@ struct writeback_struct {
 	struct dm_writecache *wc;
 	struct wc_entry **wc_list;
 	unsigned wc_list_n;
-	struct page *page;
 	struct wc_entry *wc_list_inline[WB_LIST_INLINE];
 	struct bio bio;
 };
-- 
1.8.3.1


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
