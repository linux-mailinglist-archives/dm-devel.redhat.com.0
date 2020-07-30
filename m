Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 44BB52328FB
	for <lists+dm-devel@lfdr.de>; Thu, 30 Jul 2020 02:32:46 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-62-QLRhXgGWMNmACC2PIU6YSw-1; Wed, 29 Jul 2020 20:32:42 -0400
X-MC-Unique: QLRhXgGWMNmACC2PIU6YSw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8470C10059AB;
	Thu, 30 Jul 2020 00:32:37 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 60C9B19D82;
	Thu, 30 Jul 2020 00:32:37 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 182E01809561;
	Thu, 30 Jul 2020 00:32:37 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 06U0VX0r010303 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 29 Jul 2020 20:31:33 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 8CAF9110D59D; Thu, 30 Jul 2020 00:31:33 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5C03D1009BB0
	for <dm-devel@redhat.com>; Thu, 30 Jul 2020 00:31:29 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 47BA490A9D9
	for <dm-devel@redhat.com>; Thu, 30 Jul 2020 00:31:29 +0000 (UTC)
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182]) by
	relay.mimecast.com with ESMTP id us-mta-174-lezKRqKbMjSJDnJk31PVng-1;
	Wed, 29 Jul 2020 20:31:23 -0400
X-MC-Unique: lezKRqKbMjSJDnJk31PVng-1
Received: from dede-linux-virt.corp.microsoft.com (unknown [131.107.160.54])
	by linux.microsoft.com (Postfix) with ESMTPSA id DA95420B4913;
	Wed, 29 Jul 2020 17:31:20 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com DA95420B4913
From: Deven Bowers <deven.desai@linux.microsoft.com>
To: agk@redhat.com, axboe@kernel.dk, snitzer@redhat.com, jmorris@namei.org,
	serge@hallyn.com, zohar@linux.ibm.com, viro@zeniv.linux.org.uk,
	paul@paul-moore.com, eparis@redhat.com, jannh@google.com,
	dm-devel@redhat.com, linux-integrity@vger.kernel.org,
	linux-security-module@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	linux-block@vger.kernel.org, linux-audit@redhat.com
Date: Wed, 29 Jul 2020 17:31:10 -0700
Message-Id: <20200730003113.2561644-9-deven.desai@linux.microsoft.com>
In-Reply-To: <20200730003113.2561644-1-deven.desai@linux.microsoft.com>
References: <20200730003113.2561644-1-deven.desai@linux.microsoft.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 06U0VX0r010303
X-loop: dm-devel@redhat.com
Cc: sashal@kernel.org, pasha.tatashin@soleen.com, mdsakib@microsoft.com,
	corbet@lwn.net, linux-kernel@vger.kernel.org,
	nramas@linux.microsoft.com, tyhicks@linux.microsoft.com,
	jaskarankhurana@linux.microsoft.com
Subject: [dm-devel] [RFC PATCH v6 08/11] dm-verity: add bdev_setsecurity
	hook for root-hash
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
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Add a security hook call to set a security property of a block_device
in dm-verity with the root-hash that was passed to device-mapper.

Signed-off-by: Deven Bowers <deven.desai@linux.microsoft.com>
---
 drivers/md/dm-verity-target.c | 8 ++++++++
 include/linux/device-mapper.h | 1 +
 2 files changed, 9 insertions(+)

diff --git a/drivers/md/dm-verity-target.c b/drivers/md/dm-verity-target.c
index 9970488e67ed..44914668398d 100644
--- a/drivers/md/dm-verity-target.c
+++ b/drivers/md/dm-verity-target.c
@@ -16,8 +16,10 @@
 #include "dm-verity.h"
 #include "dm-verity-fec.h"
 #include "dm-verity-verify-sig.h"
+#include "dm-core.h"
 #include <linux/module.h>
 #include <linux/reboot.h>
+#include <linux/security.h>
 
 #define DM_MSG_PREFIX			"verity"
 
@@ -1207,6 +1209,12 @@ static int verity_ctr(struct dm_target *ti, unsigned argc, char **argv)
 	ti->per_io_data_size = roundup(ti->per_io_data_size,
 				       __alignof__(struct dm_verity_io));
 
+	r = security_bdev_setsecurity(dm_table_get_md(v->ti->table)->bdev,
+				      DM_VERITY_ROOTHASH_SEC_NAME,
+				      v->root_digest, v->digest_size);
+	if (r)
+		goto bad;
+
 	verity_verify_sig_opts_cleanup(&verify_args);
 
 	return 0;
diff --git a/include/linux/device-mapper.h b/include/linux/device-mapper.h
index ab6b8eb0a150..e8ef887e4bae 100644
--- a/include/linux/device-mapper.h
+++ b/include/linux/device-mapper.h
@@ -626,5 +626,6 @@ static inline unsigned long to_bytes(sector_t n)
 }
 
 #define DM_VERITY_SIGNATURE_SEC_NAME DM_NAME	".verity-sig"
+#define DM_VERITY_ROOTHASH_SEC_NAME DM_NAME	".verity-rh"
 
 #endif	/* _LINUX_DEVICE_MAPPER_H */
-- 
2.27.0


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

