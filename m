Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 59DBC10E81C
	for <lists+dm-devel@lfdr.de>; Mon,  2 Dec 2019 11:03:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1575281024;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=//aNuxhymb3sijDpaJyt5//ZoWNIfii6SmkrDZW1sO4=;
	b=fQg9QAXu7KjgxhxuIe7Fi7+44pk8CuBHFWd2bMzd2QyxL8WXsKvE4A6/rckxCWgju3/Jur
	qplaMBDF64xq4sL1WJcoRlNSA5EIMrATmYuOd71hPlMop2msz6/wJfnzW2sjl96HnlZABd
	2aDv1uJc9U1DyTskCDVRnf2Zh5mj6DM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-39-k5TzYMC7OtSFJUT1cKe0ew-1; Mon, 02 Dec 2019 05:03:41 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1DA07DC21;
	Mon,  2 Dec 2019 10:03:35 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AE32D60BF7;
	Mon,  2 Dec 2019 10:03:33 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 3011E4EA33;
	Mon,  2 Dec 2019 10:03:22 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id xB15hBYm008559 for <dm-devel@listman.util.phx.redhat.com>;
	Sun, 1 Dec 2019 00:43:11 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 7873F10ABC87; Sun,  1 Dec 2019 05:43:11 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 73EDF10ABC86
	for <dm-devel@redhat.com>; Sun,  1 Dec 2019 05:43:09 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id F3CA8803007
	for <dm-devel@redhat.com>; Sun,  1 Dec 2019 05:43:08 +0000 (UTC)
Received: from mail-pj1-f66.google.com (mail-pj1-f66.google.com
	[209.85.216.66]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-397-LFrLjT8_Mjm_1uk1GLAC_Q-1; Sun, 01 Dec 2019 00:43:05 -0500
Received: by mail-pj1-f66.google.com with SMTP id s8so15410925pji.2;
	Sat, 30 Nov 2019 21:43:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=rT96Bmg/Qb2KB7vPy+GvW9l+EOJf0s1IFpO90eKCR1g=;
	b=eM6QDVeQklZamRiVZxCgodpPCyinDGNRSr7LFNICgYInMQ0mnmUPy75024E9/9hQMs
	F6idoIk1uFZl7Ef26dY6NO1fYzw0Yi4qVZdAR54nmkqgdUJfYtBu+oq2g0kwfXmnCqTm
	sgGZ8vH00/bsB2FkIzgy0f6fVMS3wzdpKPmipbHc1yNFdlQEmeA112xFSevBRn1Em52C
	VgolcFGBup6Jyg5bNvz8t+LkfezyF5xGdMTJePa+GninjVNsZrX+y16kZwLLtIHRoS96
	/CPYrdkfFr+GWyDMRgchC9J7lE7kmVGp0zRmoMoG4Fv6iIK7enFxIO1l+cfIwaQUDiYX
	jYOQ==
X-Gm-Message-State: APjAAAU0l6L62b5Ckdnp7UPWN+9x81R1bZSqXvrxnan0h7TfOhk5WIIm
	smp3EkIX5eW0xE+uwszveSapdffkkcw=
X-Google-Smtp-Source: APXvYqy6Ck4VuBdaU/0GKhE7mzxxF1dp19x8LqnHC5bbhc8DmO/tK7Im1liWnBEZh+JlQF2vBaLK3A==
X-Received: by 2002:a17:90a:8d10:: with SMTP id
	c16mr15467569pjo.109.1575178983609; 
	Sat, 30 Nov 2019 21:43:03 -0800 (PST)
Received: from localhost.localdomain ([124.80.131.109])
	by smtp.googlemail.com with ESMTPSA id
	m71sm11729146pje.0.2019.11.30.21.43.01
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sat, 30 Nov 2019 21:43:03 -0800 (PST)
From: Jieun Kim <jieun.kim4758@gmail.com>
X-Google-Original-From: Jieun Kim <Jieun.Kim4758@gmail.com>
To: Mike Snitzer <snitzer@redhat.com>
Date: Sun,  1 Dec 2019 14:42:19 +0900
Message-Id: <20191201054219.13146-1-Jieun.Kim4758@gmail.com>
X-MC-Unique: LFrLjT8_Mjm_1uk1GLAC_Q-1
X-MC-Unique: k5TzYMC7OtSFJUT1cKe0ew-1
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id xB15hBYm008559
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Mon, 02 Dec 2019 05:03:09 -0500
Cc: Jieun Kim <Jieun.Kim4758@gmail.com>, dm-devel@redhat.com,
	kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
	Alasdair Kergon <agk@redhat.com>
Subject: [dm-devel] [PATCH 1/2] drivers: md: dm-log.c: Remove unused
	variable 'sz'
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Remove unused variable 'sz' in core_status function
detected by coccinelle scripts(returnvar.cocci)

Signed-off-by: Jieun Kim <Jieun.Kim4758@gmail.com>
---
 drivers/md/dm-log.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/md/dm-log.c b/drivers/md/dm-log.c
index 33e71ea6cc14..8800ec1847b5 100644
--- a/drivers/md/dm-log.c
+++ b/drivers/md/dm-log.c
@@ -781,7 +781,6 @@ static region_t core_get_sync_count(struct dm_dirty_log *log)
 static int core_status(struct dm_dirty_log *log, status_type_t status,
 		       char *result, unsigned int maxlen)
 {
-	int sz = 0;
 	struct log_c *lc = log->context;
 
 	switch(status) {
@@ -795,7 +794,7 @@ static int core_status(struct dm_dirty_log *log, status_type_t status,
 		DMEMIT_SYNC;
 	}
 
-	return sz;
+	return 0;
 }
 
 static int disk_status(struct dm_dirty_log *log, status_type_t status,
-- 
2.17.1


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

