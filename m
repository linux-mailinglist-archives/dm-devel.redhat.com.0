Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id 28E3B3DF70C
	for <lists+dm-devel@lfdr.de>; Tue,  3 Aug 2021 23:44:35 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-360-NLrES8KVMfKgcLPm9_1RvA-1; Tue, 03 Aug 2021 17:44:32 -0400
X-MC-Unique: NLrES8KVMfKgcLPm9_1RvA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6ADA7802929;
	Tue,  3 Aug 2021 21:44:25 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DDB305D9DC;
	Tue,  3 Aug 2021 21:44:17 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id D2F354BB7C;
	Tue,  3 Aug 2021 21:44:00 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 173Fh0t0014944 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 3 Aug 2021 11:43:00 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 1E6FE100CBC9; Tue,  3 Aug 2021 15:43:00 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1AB93101043F
	for <dm-devel@redhat.com>; Tue,  3 Aug 2021 15:42:57 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
	bits)) (No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3356096B05F
	for <dm-devel@redhat.com>; Tue,  3 Aug 2021 15:42:57 +0000 (UTC)
Received: from smtp-relay-canonical-1.canonical.com
	(smtp-relay-canonical-1.canonical.com [185.125.188.121]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-367-PpLGSQfqPG-2A4V7W5Y4qw-1;
	Tue, 03 Aug 2021 11:42:51 -0400
X-MC-Unique: PpLGSQfqPG-2A4V7W5Y4qw-1
Received: from localhost (1.general.cking.uk.vpn [10.172.193.212])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits)
	server-digest SHA256) (No client certificate requested)
	by smtp-relay-canonical-1.canonical.com (Postfix) with ESMTPSA id
	50CCD3F07A; Tue,  3 Aug 2021 15:42:49 +0000 (UTC)
From: Colin King <colin.king@canonical.com>
To: Alasdair Kergon <agk@redhat.com>, dm-devel@redhat.com,
	Tushar Sugandhi <tusharsu@linux.microsoft.com>
Date: Tue,  3 Aug 2021 16:42:49 +0100
Message-Id: <20210803154249.81251-1-colin.king@canonical.com>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 173Fh0t0014944
X-loop: dm-devel@redhat.com
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [dm-devel] [PATCH][next] dm ima: Fix resource leaks on error return
	path
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Colin Ian King <colin.king@canonical.com>

Currently there is an error check on r that immediately returns
on an error rather than taking the error clean-up exit path via
label 'error'. Fix this to avoid resource leaks.

Addresses-Coverity: ("Resourced leak")
Fixes: 0a3bec81a409 ("dm ima: measure data on table load")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/md/dm-ima.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/md/dm-ima.c b/drivers/md/dm-ima.c
index 2d796e439bee..91ea4a7202ab 100644
--- a/drivers/md/dm-ima.c
+++ b/drivers/md/dm-ima.c
@@ -216,7 +216,7 @@ void dm_ima_measure_on_table_load(struct dm_table *table, unsigned int status_fl
 
 	r = crypto_shash_init(shash);
 	if (r)
-		return;
+		goto error;
 
 	device_data_buf_len = strlen(device_data_buf);
 	memcpy(ima_buf + l, device_data_buf, device_data_buf_len);
-- 
2.31.1


--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

