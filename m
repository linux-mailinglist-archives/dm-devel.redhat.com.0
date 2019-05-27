Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id C862F2B5F2
	for <lists+dm-devel@lfdr.de>; Mon, 27 May 2019 15:01:56 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id A200D90C87;
	Mon, 27 May 2019 13:01:49 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6C79060BEC;
	Mon, 27 May 2019 13:01:45 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id EC8F718433A3;
	Mon, 27 May 2019 13:01:41 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x4RD0aCi009862 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 27 May 2019 09:00:37 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 8A2E060632; Mon, 27 May 2019 13:00:36 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx17.extmail.prod.ext.phx2.redhat.com
	[10.5.110.46])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4151660606;
	Mon, 27 May 2019 13:00:34 +0000 (UTC)
Received: from smtp2.provo.novell.com (smtp2.provo.novell.com [137.65.250.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
	bits)) (No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id EB513307C942;
	Mon, 27 May 2019 13:00:22 +0000 (UTC)
Received: from apollon.suse.de.de (prva10-snat226-2.provo.novell.com
	[137.65.226.36])
	by smtp2.provo.novell.com with ESMTP (TLS encrypted);
	Mon, 27 May 2019 07:00:15 -0600
From: Martin Wilck <mwilck@suse.com>
To: Christophe Varoqui <christophe.varoqui@opensvc.com>,
	Benjamin Marzinski <bmarzins@redhat.com>
Date: Mon, 27 May 2019 14:59:36 +0200
Message-Id: <20190527125942.8366-4-mwilck@suse.com>
In-Reply-To: <20190527125942.8366-1-mwilck@suse.com>
References: <20190527125942.8366-1-mwilck@suse.com>
MIME-Version: 1.0
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 216
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.46]); Mon, 27 May 2019 13:00:30 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.46]);
	Mon, 27 May 2019 13:00:30 +0000 (UTC) for IP:'137.65.250.81'
	DOMAIN:'smtp2.provo.novell.com' HELO:'smtp2.provo.novell.com'
	FROM:'mwilck@suse.com' RCPT:''
X-RedHat-Spam-Score: -2.298  (RCVD_IN_DNSWL_MED, SPF_HELO_NONE,
	SPF_NONE) 137.65.250.81 smtp2.provo.novell.com
	137.65.250.81 smtp2.provo.novell.com <mwilck@suse.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.46
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com, Xose Vazquez Perez <xose.vazquez@gmail.com>,
	Martin Wilck <mwilck@suse.com>
Subject: [dm-devel] [PATCH v2 3/9] mpathpersist: no need to treat error
	close() as fatal
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.29]); Mon, 27 May 2019 13:01:55 +0000 (UTC)

Simplify code a bit.

Signed-off-by: Martin Wilck <mwilck@suse.com>
---
 mpathpersist/main.c | 11 ++---------
 1 file changed, 2 insertions(+), 9 deletions(-)

diff --git a/mpathpersist/main.c b/mpathpersist/main.c
index 2e19f29f..6df9762d 100644
--- a/mpathpersist/main.c
+++ b/mpathpersist/main.c
@@ -154,7 +154,7 @@ static int do_batch_file(const char *batch_fn)
 
 static int handle_args(int argc, char * argv[], int nline)
 {
-	int fd, c, res;
+	int fd, c;
 	const char *device_name = NULL;
 	int num_prin_sa = 0;
 	int num_prout_sa = 0;
@@ -179,7 +179,6 @@ static int handle_args(int argc, char * argv[], int nline)
 	char *batch_fn = NULL;
 	void *resp = NULL;
 	struct transportid * tmp;
-	struct config *conf = multipath_conf;
 
 	memset(transportids, 0, MPATH_MX_TIDS * sizeof(struct transportid));
 
@@ -565,13 +564,7 @@ static int handle_args(int argc, char * argv[], int nline)
 		printf("PR out: command failed\n");
 	}
 
-	res = close (fd);
-	if (res < 0)
-	{
-		mpath_lib_exit(conf);
-		udev_unref(udev);
-		return MPATH_PR_FILE_ERROR;
-	}
+	close (fd);
 
 out :
 	if (ret == MPATH_PR_SYNTAX_ERROR) {
-- 
2.21.0

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
