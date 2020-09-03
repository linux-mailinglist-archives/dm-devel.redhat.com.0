Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 3B72825C628
	for <lists+dm-devel@lfdr.de>; Thu,  3 Sep 2020 18:06:58 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-242-1xA9tY8CO7CxQXCxYsRzQg-1; Thu, 03 Sep 2020 12:06:54 -0400
X-MC-Unique: 1xA9tY8CO7CxQXCxYsRzQg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1B6FDAD519;
	Thu,  3 Sep 2020 16:06:29 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 27DB07CD05;
	Thu,  3 Sep 2020 16:06:28 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id E8EC379DA2;
	Thu,  3 Sep 2020 16:06:24 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 083G562h012757 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 3 Sep 2020 12:05:06 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 2CF792166BCC; Thu,  3 Sep 2020 16:05:06 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 26B892166BB3
	for <dm-devel@redhat.com>; Thu,  3 Sep 2020 16:05:02 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D9924801220
	for <dm-devel@redhat.com>; Thu,  3 Sep 2020 16:05:02 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-301-a3QxzVz7Nx600528_FIeLg-1;
	Thu, 03 Sep 2020 12:05:00 -0400
X-MC-Unique: a3QxzVz7Nx600528_FIeLg-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id A43C1B04F;
	Thu,  3 Sep 2020 16:04:59 +0000 (UTC)
From: Coly Li <colyli@suse.de>
To: linux-nvdimm@lists.01.org
Date: Fri,  4 Sep 2020 00:04:48 +0800
Message-Id: <20200903160448.19394-1-colyli@suse.de>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false;
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 083G562h012757
X-loop: dm-devel@redhat.com
Cc: Pankaj Gupta <pankaj.gupta.linux@gmail.com>,
	Mike Snitzer <snitzer@redhat.com>, Vishal Verma <vishal.l.verma@intel.com>,
	Coly Li <colyli@suse.de>, dm-devel@redhat.com,
	Adrian Huang <ahuang12@lenovo.com>, Jan Kara <jack@suse.com>,
	Ira Weiny <ira.weiny@intel.com>
Subject: [dm-devel] [PATCH v3] dax: fix for do not print error message for
	non-persistent memory block device
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0.003
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

When calling __generic_fsdax_supported(), a dax-unsupported device may
not have dax_dev as NULL, e.g. the dax related code block is not enabled
by Kconfig.

Therefore in __generic_fsdax_supported(), to check whether a device
supports DAX or not, the following order should be performed,
- If dax_dev pointer is NULL, it means the device driver explicitly
  announce it doesn't support DAX. Then it is OK to directly return
  false from __generic_fsdax_supported().
- If dax_dev pointer is NOT NULL, it might be because the driver doesn't
  support DAX and not explicitly initialize related data structure. Then
  bdev_dax_supported() should be called for further check.

IMHO if device driver desn't explicitly set its dax_dev pointer to NULL,
this is not a bug. Calling bdev_dax_supported() makes sure they can be
recognized as dax-unsupported eventually.

This patch does the following change for the above purpose,
    -       if (!dax_dev && !bdev_dax_supported(bdev, blocksize)) {
    +       if (!dax_dev || !bdev_dax_supported(bdev, blocksize)) {


Fixes: c2affe920b0e ("dax: do not print error message for non-persistent memory block device")
Signed-off-by: Coly Li <colyli@suse.de>
Reviewed-and-Tested-by: Adrian Huang <ahuang12@lenovo.com>
Reviewed-by: Mike Snitzer <snitzer@redhat.com>
Reviewed-by: Pankaj Gupta <pankaj.gupta.linux@gmail.com>
Cc: Ira Weiny <ira.weiny@intel.com>
Cc: Jan Kara <jack@suse.com>
Cc: Vishal Verma <vishal.l.verma@intel.com>
---
Changelog:
v3: add more Reviewed-by from Mike Snitzer and Pankaj Gupta.
v2: add Reviewed-and-Tested-by from Adrian Huang.
v1: initial version.

 drivers/dax/super.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/dax/super.c b/drivers/dax/super.c
index 32642634c1bb..e5767c83ea23 100644
--- a/drivers/dax/super.c
+++ b/drivers/dax/super.c
@@ -100,7 +100,7 @@ bool __generic_fsdax_supported(struct dax_device *dax_dev,
 		return false;
 	}
 
-	if (!dax_dev && !bdev_dax_supported(bdev, blocksize)) {
+	if (!dax_dev || !bdev_dax_supported(bdev, blocksize)) {
 		pr_debug("%s: error: dax unsupported by block device\n",
 				bdevname(bdev, buf));
 		return false;
-- 
2.26.2


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

