Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FD7B2B5F1
	for <lists+dm-devel@lfdr.de>; Mon, 27 May 2019 15:01:56 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 93AB1C05D3EF;
	Mon, 27 May 2019 13:01:48 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0FF512C279;
	Mon, 27 May 2019 13:01:45 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 9CA20206D3;
	Mon, 27 May 2019 13:01:41 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x4RD0ctm009887 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 27 May 2019 09:00:38 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 90FC71017E30; Mon, 27 May 2019 13:00:38 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx11.extmail.prod.ext.phx2.redhat.com
	[10.5.110.40])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 888F31017E2C;
	Mon, 27 May 2019 13:00:38 +0000 (UTC)
Received: from smtp2.provo.novell.com (smtp2.provo.novell.com [137.65.250.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
	bits)) (No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id C65083084023;
	Mon, 27 May 2019 13:00:21 +0000 (UTC)
Received: from apollon.suse.de.de (prva10-snat226-2.provo.novell.com
	[137.65.226.36])
	by smtp2.provo.novell.com with ESMTP (TLS encrypted);
	Mon, 27 May 2019 07:00:12 -0600
From: Martin Wilck <mwilck@suse.com>
To: Christophe Varoqui <christophe.varoqui@opensvc.com>,
	Benjamin Marzinski <bmarzins@redhat.com>
Date: Mon, 27 May 2019 14:59:34 +0200
Message-Id: <20190527125942.8366-2-mwilck@suse.com>
In-Reply-To: <20190527125942.8366-1-mwilck@suse.com>
References: <20190527125942.8366-1-mwilck@suse.com>
MIME-Version: 1.0
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 216
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.40]); Mon, 27 May 2019 13:00:31 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.40]);
	Mon, 27 May 2019 13:00:31 +0000 (UTC) for IP:'137.65.250.81'
	DOMAIN:'smtp2.provo.novell.com' HELO:'smtp2.provo.novell.com'
	FROM:'mwilck@suse.com' RCPT:''
X-RedHat-Spam-Score: -2.3  (RCVD_IN_DNSWL_MED, SPF_HELO_NONE,
	SPF_PASS) 137.65.250.81 smtp2.provo.novell.com
	137.65.250.81 smtp2.provo.novell.com <mwilck@suse.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.40
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com, Xose Vazquez Perez <xose.vazquez@gmail.com>,
	Martin Wilck <mwilck@suse.com>
Subject: [dm-devel] [PATCH v2 1/9] mpathpersist: call usage() just once on
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.32]); Mon, 27 May 2019 13:01:54 +0000 (UTC)

This simplifies further changes.

Signed-off-by: Martin Wilck <mwilck@suse.com>
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
