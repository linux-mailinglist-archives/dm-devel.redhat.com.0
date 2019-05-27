Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 33D832B5F6
	for <lists+dm-devel@lfdr.de>; Mon, 27 May 2019 15:02:07 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id CFB943087941;
	Mon, 27 May 2019 13:01:56 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9FF9D60635;
	Mon, 27 May 2019 13:01:54 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id C981D18433A1;
	Mon, 27 May 2019 13:01:53 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x4RD0o8G009951 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 27 May 2019 09:00:51 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 11D3860C64; Mon, 27 May 2019 13:00:50 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx17.extmail.prod.ext.phx2.redhat.com
	[10.5.110.46])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C50FC60BEC;
	Mon, 27 May 2019 13:00:47 +0000 (UTC)
Received: from smtp2.provo.novell.com (smtp2.provo.novell.com [137.65.250.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
	bits)) (No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id CD7B33082E60;
	Mon, 27 May 2019 13:00:31 +0000 (UTC)
Received: from apollon.suse.de.de (prva10-snat226-2.provo.novell.com
	[137.65.226.36])
	by smtp2.provo.novell.com with ESMTP (TLS encrypted);
	Mon, 27 May 2019 07:00:20 -0600
From: Martin Wilck <mwilck@suse.com>
To: Christophe Varoqui <christophe.varoqui@opensvc.com>,
	Benjamin Marzinski <bmarzins@redhat.com>
Date: Mon, 27 May 2019 14:59:39 +0200
Message-Id: <20190527125942.8366-7-mwilck@suse.com>
In-Reply-To: <20190527125942.8366-1-mwilck@suse.com>
References: <20190527125942.8366-1-mwilck@suse.com>
MIME-Version: 1.0
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 216
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.46]); Mon, 27 May 2019 13:00:38 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.46]);
	Mon, 27 May 2019 13:00:38 +0000 (UTC) for IP:'137.65.250.81'
	DOMAIN:'smtp2.provo.novell.com' HELO:'smtp2.provo.novell.com'
	FROM:'mwilck@suse.com' RCPT:''
X-RedHat-Spam-Score: -2.3  (RCVD_IN_DNSWL_MED, SPF_HELO_NONE,
	SPF_PASS) 137.65.250.81 smtp2.provo.novell.com
	137.65.250.81 smtp2.provo.novell.com <mwilck@suse.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.46
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com, Xose Vazquez Perez <xose.vazquez@gmail.com>,
	Martin Wilck <mwilck@suse.com>
Subject: [dm-devel] [PATCH v2 6/9] mpathpersist: initialize data structures
	only once
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
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.45]); Mon, 27 May 2019 13:02:06 +0000 (UTC)

We now have the possibility to run several PR commands in a single
mpathpersist invocation. Run initialization / discovery and teardown
only once at program invocation / exit.

Signed-off-by: Martin Wilck <mwilck@suse.com>
---
 mpathpersist/main.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/mpathpersist/main.c b/mpathpersist/main.c
index 6df9762d..cbb59623 100644
--- a/mpathpersist/main.c
+++ b/mpathpersist/main.c
@@ -374,6 +374,9 @@ static int handle_args(int argc, char * argv[], int nline)
 		/* set verbosity */
 		noisy = (loglevel >= 3) ? 1 : hex;
 		verbose	= (loglevel >= 3)? 3: loglevel;
+		ret = mpath_persistent_reserve_init_vecs(verbose);
+		if (ret != MPATH_PR_SUCCESS)
+			goto out;
 	}
 
 	if ((prout_flag + prin_flag) == 0 && batch_fn == NULL)
@@ -480,7 +483,7 @@ static int handle_args(int argc, char * argv[], int nline)
 			goto out;
 		}
 
-		ret = mpath_persistent_reserve_in (fd, prin_sa, resp, noisy, verbose);
+		ret = __mpath_persistent_reserve_in (fd, prin_sa, resp, noisy);
 		if (ret != MPATH_PR_SUCCESS )
 		{
 			fprintf (stderr, "Persistent Reserve IN command failed\n");
@@ -540,8 +543,8 @@ static int handle_args(int argc, char * argv[], int nline)
 		}
 
 		/* PROUT commands other than 'register and move' */
-		ret = mpath_persistent_reserve_out (fd, prout_sa, 0, prout_type,
-				paramp, noisy, verbose);
+		ret = __mpath_persistent_reserve_out (fd, prout_sa, 0, prout_type,
+				paramp, noisy);
 		for (j = 0 ; j < num_transport; j++)
 		{
 			tmp = paramp->trnptid_list[j];
@@ -580,6 +583,8 @@ out :
 		free(batch_fn);
 		ret = ret == 0 ? rv : ret;
 	}
+	if (nline == 0)
+		mpath_persistent_reserve_free_vecs();
 	return (ret >= 0) ? ret : MPATH_PR_OTHER;
 }
 
-- 
2.21.0

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
