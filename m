Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A26FDFC3
	for <lists+dm-devel@lfdr.de>; Mon, 29 Apr 2019 11:49:08 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 5FE7785A03;
	Mon, 29 Apr 2019 09:49:05 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D6C4917B4F;
	Mon, 29 Apr 2019 09:49:04 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 47D6018089CB;
	Mon, 29 Apr 2019 09:49:02 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x3T9msOB020620 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 29 Apr 2019 05:48:54 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 3EAF35C205; Mon, 29 Apr 2019 09:48:54 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx06.extmail.prod.ext.phx2.redhat.com
	[10.5.110.30])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1E70A69509;
	Mon, 29 Apr 2019 09:48:49 +0000 (UTC)
Received: from smtp2.provo.novell.com (smtp2.provo.novell.com [137.65.250.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
	bits)) (No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 6D2E5356F6;
	Mon, 29 Apr 2019 09:48:48 +0000 (UTC)
Received: from apollon.suse.de.de (prva10-snat226-1.provo.novell.com
	[137.65.226.35])
	by smtp2.provo.novell.com with ESMTP (TLS encrypted);
	Mon, 29 Apr 2019 03:48:43 -0600
From: Martin Wilck <mwilck@suse.com>
To: Yufen Yu <yuyufen@huawei.com>, Mike Snitzer <snitzer@redhat.com>
Date: Mon, 29 Apr 2019 11:48:15 +0200
Message-Id: <20190429094815.29827-1-mwilck@suse.com>
MIME-Version: 1.0
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 216
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.30]); Mon, 29 Apr 2019 09:48:49 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.30]);
	Mon, 29 Apr 2019 09:48:49 +0000 (UTC) for IP:'137.65.250.81'
	DOMAIN:'smtp2.provo.novell.com' HELO:'smtp2.provo.novell.com'
	FROM:'mwilck@suse.com' RCPT:''
X-RedHat-Spam-Score: -2.301  (RCVD_IN_DNSWL_MED,
	SPF_PASS) 137.65.250.81 smtp2.provo.novell.com
	137.65.250.81 smtp2.provo.novell.com <mwilck@suse.com>
X-Scanned-By: MIMEDefang 2.78 on 10.5.110.30
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: dm-devel@redhat.com
Cc: Bart Van Assche <Bart.VanAssche@sandisk.com>, dm-devel@redhat.com,
	Mikulas Patocka <mpatocka@redhat.com>, Martin Wilck <mwilck@suse.com>
Subject: [dm-devel] [PATCH] dm mpath: parse_path: always free
	attached_handler_name
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.26]); Mon, 29 Apr 2019 09:49:06 +0000 (UTC)

Commit b592211c33f7 "dm mpath: fix attached_handler_name leak and
dangling hw_handler_name pointer" fixed a memory leak for the
case where setup_scsi_dh() returns failure. But setup_scsi_dh
may return success and not "use" attached_handler_name if the
retain_attached_hwhandler flag is not set on the map. As
setup_scsi_sh properly "steals" the pointer by nullifying it,
freeing it unconditionally in parse_path() is safe.

Fixes: b592211c33f7 "dm mpath: fix attached_handler_name leak and
dangling hw_handler_name pointer"
Reported-by: Yufen Yu <yuyufen@huawei.com>

Signed-off-by: Martin Wilck <mwilck@suse.com>
---
 drivers/md/dm-mpath.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/md/dm-mpath.c b/drivers/md/dm-mpath.c
index 2ee5e35..cc5173d 100644
--- a/drivers/md/dm-mpath.c
+++ b/drivers/md/dm-mpath.c
@@ -882,6 +882,7 @@ static struct pgpath *parse_path(struct dm_arg_set *as, struct path_selector *ps
 	if (attached_handler_name || m->hw_handler_name) {
 		INIT_DELAYED_WORK(&p->activate_path, activate_path_work);
 		r = setup_scsi_dh(p->path.dev->bdev, m, &attached_handler_name, &ti->error);
+		kfree(attached_handler_name);
 		if (r) {
 			dm_put_device(ti, p->path.dev);
 			goto bad;
@@ -896,7 +897,6 @@ static struct pgpath *parse_path(struct dm_arg_set *as, struct path_selector *ps
 
 	return p;
  bad:
-	kfree(attached_handler_name);
 	free_pgpath(p);
 	return ERR_PTR(r);
 }
-- 
2.21.0

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
