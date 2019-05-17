Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id C5B2C22096
	for <lists+dm-devel@lfdr.de>; Sat, 18 May 2019 00:59:50 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id D9E9F81129;
	Fri, 17 May 2019 22:59:48 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 058D72D1C1;
	Fri, 17 May 2019 22:59:48 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 92A171806B16;
	Fri, 17 May 2019 22:59:47 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x4HMvb8e004846 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 17 May 2019 18:57:37 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id A0BCC1972A; Fri, 17 May 2019 22:57:37 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx06.extmail.prod.ext.phx2.redhat.com
	[10.5.110.30])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 96B2818500;
	Fri, 17 May 2019 22:57:37 +0000 (UTC)
Received: from smtp2.provo.novell.com (smtp2.provo.novell.com [137.65.250.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
	bits)) (No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id E77CF368E6;
	Fri, 17 May 2019 22:57:35 +0000 (UTC)
Received: from apollon.suse.de.de (prva10-snat226-1.provo.novell.com
	[137.65.226.35])
	by smtp2.provo.novell.com with ESMTP (TLS encrypted);
	Fri, 17 May 2019 16:57:26 -0600
From: Martin Wilck <mwilck@suse.com>
To: Benjamin Marzinski <bmarzins@redhat.com>
Date: Sat, 18 May 2019 00:57:02 +0200
Message-Id: <20190517225703.16295-7-mwilck@suse.com>
In-Reply-To: <20190517225703.16295-1-mwilck@suse.com>
References: <20190517225703.16295-1-mwilck@suse.com>
MIME-Version: 1.0
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 216
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.30]); Fri, 17 May 2019 22:57:36 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.30]);
	Fri, 17 May 2019 22:57:36 +0000 (UTC) for IP:'137.65.250.81'
	DOMAIN:'smtp2.provo.novell.com' HELO:'smtp2.provo.novell.com'
	FROM:'mwilck@suse.com' RCPT:''
X-RedHat-Spam-Score: -2.3  (RCVD_IN_DNSWL_MED, SPF_HELO_NONE,
	SPF_PASS) 137.65.250.81 smtp2.provo.novell.com
	137.65.250.81 smtp2.provo.novell.com <mwilck@suse.com>
X-Scanned-By: MIMEDefang 2.78 on 10.5.110.30
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-loop: dm-devel@redhat.com
Cc: dbond@redhat.com, dm-devel@redhat.com, Martin Wilck <mwilck@suse.com>
Subject: [dm-devel] [RFC PATCH 6/7] mpathpersist: initialize data structures
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.27]); Fri, 17 May 2019 22:59:49 +0000 (UTC)

We now have the possibility to run several PR commands in a single
mpathpersist invocation. Run initialization / discovery and teardown
only once at program invocation / exit.
---
 mpathpersist/main.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/mpathpersist/main.c b/mpathpersist/main.c
index b204647f..5f871019 100644
--- a/mpathpersist/main.c
+++ b/mpathpersist/main.c
@@ -367,6 +367,9 @@ static int handle_args(int argc, char * argv[], int nline)
 		/* set verbosity */
 		noisy = (loglevel >= 3) ? 1 : hex;
 		verbose	= (loglevel >= 3)? 3: loglevel;
+		ret = mpath_persistent_reserve_init_vecs(verbose);
+		if (ret != MPATH_PR_SUCCESS)
+			goto out;
 	}
 
 	if ((prout_flag + prin_flag) == 0 && batch_fn == NULL)
@@ -473,7 +476,7 @@ static int handle_args(int argc, char * argv[], int nline)
 			goto out;
 		}
 
-		ret = mpath_persistent_reserve_in (fd, prin_sa, resp, noisy, verbose);
+		ret = __mpath_persistent_reserve_in (fd, prin_sa, resp, noisy);
 		if (ret != MPATH_PR_SUCCESS )
 		{
 			fprintf (stderr, "Persistent Reserve IN command failed\n");
@@ -533,8 +536,8 @@ static int handle_args(int argc, char * argv[], int nline)
 		}
 
 		/* PROUT commands other than 'register and move' */
-		ret = mpath_persistent_reserve_out (fd, prout_sa, 0, prout_type,
-				paramp, noisy, verbose);
+		ret = __mpath_persistent_reserve_out (fd, prout_sa, 0, prout_type,
+				paramp, noisy);
 		for (j = 0 ; j < num_transport; j++)
 		{
 			tmp = paramp->trnptid_list[j];
@@ -572,6 +575,8 @@ out :
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
