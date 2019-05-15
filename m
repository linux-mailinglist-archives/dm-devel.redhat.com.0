Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id ECA491F8FA
	for <lists+dm-devel@lfdr.de>; Wed, 15 May 2019 18:51:47 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 512C381DE9;
	Wed, 15 May 2019 16:51:44 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A851A608BB;
	Wed, 15 May 2019 16:51:42 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 1A66318089CB;
	Wed, 15 May 2019 16:51:34 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x4FGpQEn030761 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 15 May 2019 12:51:26 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id CF1EC6135A; Wed, 15 May 2019 16:51:26 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx12.extmail.prod.ext.phx2.redhat.com
	[10.5.110.41])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2B27DD1D4;
	Wed, 15 May 2019 16:51:22 +0000 (UTC)
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
	bits)) (No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 2373930917AD;
	Wed, 15 May 2019 16:51:21 +0000 (UTC)
Received: from localhost.localdomain (unknown
	[IPv6:2804:431:9719:d573:a076:d1fd:3417:b195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested) (Authenticated sender: koike)
	by bhuna.collabora.co.uk (Postfix) with ESMTPSA id EDED326D7C1;
	Wed, 15 May 2019 17:51:16 +0100 (BST)
From: Helen Koike <helen.koike@collabora.com>
To: dm-devel@redhat.com
Date: Wed, 15 May 2019 13:50:54 -0300
Message-Id: <20190515165054.12680-1-helen.koike@collabora.com>
MIME-Version: 1.0
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 216
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.41]); Wed, 15 May 2019 16:51:21 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.41]);
	Wed, 15 May 2019 16:51:21 +0000 (UTC) for IP:'46.235.227.227'
	DOMAIN:'bhuna.collabora.co.uk' HELO:'bhuna.collabora.co.uk'
	FROM:'helen.koike@collabora.com' RCPT:''
X-RedHat-Spam-Score: -0.012  (RCVD_IN_DNSWL_NONE, SPF_HELO_PASS,
	SPF_PASS) 46.235.227.227 bhuna.collabora.co.uk
	46.235.227.227 bhuna.collabora.co.uk
	<helen.koike@collabora.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.41
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: dm-devel@redhat.com
Cc: Mike Snitzer <snitzer@redhat.com>, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org, Helen Koike <helen.koike@collabora.com>,
	kernel@collabora.com, Alasdair Kergon <agk@redhat.com>
Subject: [dm-devel] [PATCH v2] dm ioctl: fix hang in early create error
	condition
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.25]); Wed, 15 May 2019 16:51:46 +0000 (UTC)

The dm_early_create() function (which deals with "dm-mod.create=" kernel
command line option) calls dm_hash_insert() who gets an extra reference
to the md object.

In case of failure, this reference wasn't being released, causing
dm_destroy() to hang, thus hanging the whole boot process.

Fix this by calling __hash_remove() in the error path.

Fixes: 6bbc923dfcf57d ("dm: add support to directly boot to a mapped device")
Cc: stable@vger.kernel.org
Signed-off-by: Helen Koike <helen.koike@collabora.com>

---
Hi,

I also tested this patch version with the new test case in the following test
script:

https://gitlab.collabora.com/koike/dm-cmdline-test/commit/d2d7a0ee4a49931cdb59f08a837b516c2d5d743d

Thanks
Helen

Changes in v2:
- instead of modifying dm_hash_insert() to return the hash cell, use
__get_name_cell(dmi->name) instead.

 drivers/md/dm-ioctl.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/md/dm-ioctl.c b/drivers/md/dm-ioctl.c
index c740153b4e52..1e03bc89e20f 100644
--- a/drivers/md/dm-ioctl.c
+++ b/drivers/md/dm-ioctl.c
@@ -2069,7 +2069,7 @@ int __init dm_early_create(struct dm_ioctl *dmi,
 	/* alloc table */
 	r = dm_table_create(&t, get_mode(dmi), dmi->target_count, md);
 	if (r)
-		goto err_destroy_dm;
+		goto err_hash_remove;
 
 	/* add targets */
 	for (i = 0; i < dmi->target_count; i++) {
@@ -2116,6 +2116,10 @@ int __init dm_early_create(struct dm_ioctl *dmi,
 
 err_destroy_table:
 	dm_table_destroy(t);
+err_hash_remove:
+	(void) __hash_remove(__get_name_cell(dmi->name));
+	/* release reference from __get_name_cell */
+	dm_put(md);
 err_destroy_dm:
 	dm_put(md);
 	dm_destroy(md);
-- 
2.20.1

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
