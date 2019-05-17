Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 3325922097
	for <lists+dm-devel@lfdr.de>; Sat, 18 May 2019 00:59:51 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 321A5307CB5F;
	Fri, 17 May 2019 22:59:48 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 018A35F9C8;
	Fri, 17 May 2019 22:59:48 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 924A71806B15;
	Fri, 17 May 2019 22:59:47 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x4HMvUd9004785 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 17 May 2019 18:57:30 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 1F0C85D772; Fri, 17 May 2019 22:57:30 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx20.extmail.prod.ext.phx2.redhat.com
	[10.5.110.49])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9832C5D719;
	Fri, 17 May 2019 22:57:27 +0000 (UTC)
Received: from smtp2.provo.novell.com (smtp2.provo.novell.com [137.65.250.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
	bits)) (No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id C3297305B23A;
	Fri, 17 May 2019 22:57:25 +0000 (UTC)
Received: from apollon.suse.de.de (prva10-snat226-1.provo.novell.com
	[137.65.226.35])
	by smtp2.provo.novell.com with ESMTP (TLS encrypted);
	Fri, 17 May 2019 16:57:18 -0600
From: Martin Wilck <mwilck@suse.com>
To: Benjamin Marzinski <bmarzins@redhat.com>
Date: Sat, 18 May 2019 00:56:57 +0200
Message-Id: <20190517225703.16295-2-mwilck@suse.com>
In-Reply-To: <20190517225703.16295-1-mwilck@suse.com>
References: <20190517225703.16295-1-mwilck@suse.com>
MIME-Version: 1.0
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 216
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.49]); Fri, 17 May 2019 22:57:26 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.49]);
	Fri, 17 May 2019 22:57:26 +0000 (UTC) for IP:'137.65.250.81'
	DOMAIN:'smtp2.provo.novell.com' HELO:'smtp2.provo.novell.com'
	FROM:'mwilck@suse.com' RCPT:''
X-RedHat-Spam-Score: -2.3  (RCVD_IN_DNSWL_MED, SPF_HELO_NONE,
	SPF_PASS) 137.65.250.81 smtp2.provo.novell.com
	137.65.250.81 smtp2.provo.novell.com <mwilck@suse.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.49
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: dm-devel@redhat.com
Cc: dbond@redhat.com, dm-devel@redhat.com, Martin Wilck <mwilck@suse.com>
Subject: [dm-devel] [RFC PATCH 1/7] mpathpersist: call usage() just once on
	return
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.42]); Fri, 17 May 2019 22:59:50 +0000 (UTC)

This simplifies further changes.
---
 mpathpersist/main.c | 11 ++---------
 1 file changed, 2 insertions(+), 9 deletions(-)

diff --git a/mpathpersist/main.c b/mpathpersist/main.c
index 10cba452..94e89c13 100644
--- a/mpathpersist/main.c
+++ b/mpathpersist/main.c
@@ -265,7 +265,6 @@ int main (int argc, char * argv[])
 
 			default:
 				fprintf(stderr, "unrecognised switch " "code 0x%x ??\n", c);
-				usage ();
 				ret = MPATH_PR_SYNTAX_ERROR;
 				goto out;
 		}
@@ -283,7 +282,6 @@ int main (int argc, char * argv[])
 		{
 			for (; optind < argc; ++optind)
 				fprintf (stderr, "Unexpected extra argument: %s\n", argv[optind]);
-			usage ();
 			ret = MPATH_PR_SYNTAX_ERROR;
 			goto out;
 		}
@@ -296,14 +294,12 @@ int main (int argc, char * argv[])
 	if ((prout_flag + prin_flag) == 0)
 	{
 		fprintf (stderr, "choose either '--in' or '--out' \n");
-		usage ();
 		ret = MPATH_PR_SYNTAX_ERROR;
 		goto out;
 	}
 	if ((prout_flag + prin_flag) > 1)
 	{
 		fprintf (stderr, "choose either '--in' or '--out' \n");
-		usage ();
 		ret = MPATH_PR_SYNTAX_ERROR;
 		goto out;
 	}
@@ -334,20 +330,17 @@ int main (int argc, char * argv[])
 		{
 			fprintf (stderr,
 					" No service action given for Persistent Reserve IN\n");
-			usage();
 			ret = MPATH_PR_SYNTAX_ERROR;
 		}
 		else if (num_prin_sa > 1)
 		{
 			fprintf (stderr, " Too many service actions given; choose "
 					"one only\n");
-			usage();
 			ret = MPATH_PR_SYNTAX_ERROR;
 		}
 	}
 	else
 	{
-		usage ();
 		ret = MPATH_PR_SYNTAX_ERROR;
 		goto out;
 	}
@@ -356,7 +349,6 @@ int main (int argc, char * argv[])
 	{
 		fprintf (stderr, " --relative-target-port"
 				" only useful with --register-move\n");
-		usage ();
 		ret = MPATH_PR_SYNTAX_ERROR;
 		goto out;
 	}
@@ -378,7 +370,6 @@ int main (int argc, char * argv[])
 	if (device_name == NULL)
 	{
 		fprintf (stderr, "No device name given \n");
-		usage ();
 		ret = MPATH_PR_SYNTAX_ERROR;
 		goto out;
 	}
@@ -496,6 +487,8 @@ int main (int argc, char * argv[])
 	}
 
 out :
+	if (ret == MPATH_PR_SYNTAX_ERROR)
+		usage();
 	mpath_lib_exit(conf);
 	udev_unref(udev);
 	return (ret >= 0) ? ret : MPATH_PR_OTHER;
-- 
2.21.0

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
