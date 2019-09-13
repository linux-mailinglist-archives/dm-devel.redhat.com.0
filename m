Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id CDA39B27EC
	for <lists+dm-devel@lfdr.de>; Sat, 14 Sep 2019 00:05:47 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 245CE307CDEA;
	Fri, 13 Sep 2019 22:05:46 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AD9361001944;
	Fri, 13 Sep 2019 22:05:45 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 10551180221D;
	Fri, 13 Sep 2019 22:05:45 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x8DM4FHc031661 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 13 Sep 2019 18:04:15 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id C6FEA5D9CD; Fri, 13 Sep 2019 22:04:15 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 468225D9D3;
	Fri, 13 Sep 2019 22:04:13 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id x8DM4BBD024034; 
	Fri, 13 Sep 2019 17:04:12 -0500
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id x8DM4BoC024033;
	Fri, 13 Sep 2019 17:04:11 -0500
From: Benjamin Marzinski <bmarzins@redhat.com>
To: Christophe Varoqui <christophe.varoqui@opensvc.com>
Date: Fri, 13 Sep 2019 17:04:03 -0500
Message-Id: <1568412244-23982-4-git-send-email-bmarzins@redhat.com>
In-Reply-To: <1568412244-23982-1-git-send-email-bmarzins@redhat.com>
References: <1568412244-23982-1-git-send-email-bmarzins@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: dm-devel@redhat.com
Cc: device-mapper development <dm-devel@redhat.com>,
	Martin Wilck <Martin.Wilck@suse.com>
Subject: [dm-devel] [PATCH v2 3/4] mpathpersist: fix leaks
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.49]); Fri, 13 Sep 2019 22:05:46 +0000 (UTC)

If handle_args() fails while looping through the argument list, it needs
to free batch_fn, if it has been set. Also handle_args() needs to make
sure to free the file descriptor after it has been opened.

Signed-off-by: Benjamin Marzinski <bmarzins@redhat.com>
---
 mpathpersist/main.c | 33 ++++++++++++++++++++++-----------
 1 file changed, 22 insertions(+), 11 deletions(-)

diff --git a/mpathpersist/main.c b/mpathpersist/main.c
index 5ad06a97..de000b0b 100644
--- a/mpathpersist/main.c
+++ b/mpathpersist/main.c
@@ -155,7 +155,8 @@ static int do_batch_file(const char *batch_fn)
 
 static int handle_args(int argc, char * argv[], int nline)
 {
-	int fd, c;
+	int c;
+	int fd = -1;
 	const char *device_name = NULL;
 	int num_prin_sa = 0;
 	int num_prout_sa = 0;
@@ -213,7 +214,8 @@ static int handle_args(int argc, char * argv[], int nline)
 				if (nline == 0 && 1 != sscanf (optarg, "%d", &loglevel))
 				{
 					fprintf (stderr, "bad argument to '--verbose'\n");
-					return MPATH_PR_SYNTAX_ERROR;
+					ret = MPATH_PR_SYNTAX_ERROR;
+					goto out;
 				}
 				break;
 
@@ -228,6 +230,7 @@ static int handle_args(int argc, char * argv[], int nline)
 
 			case 'h':
 				usage ();
+				free(batch_fn);
 				return 0;
 
 			case 'H':
@@ -254,7 +257,8 @@ static int handle_args(int argc, char * argv[], int nline)
 				if (1 != sscanf (optarg, "%" SCNx64 "", &param_rk))
 				{
 					fprintf (stderr, "bad argument to '--param-rk'\n");
-					return MPATH_PR_SYNTAX_ERROR;
+					ret = MPATH_PR_SYNTAX_ERROR;
+					goto out;
 				}
 				++num_prout_param;
 				break;
@@ -263,7 +267,8 @@ static int handle_args(int argc, char * argv[], int nline)
 				if (1 != sscanf (optarg, "%" SCNx64 "", &param_sark))
 				{
 					fprintf (stderr, "bad argument to '--param-sark'\n");
-					return MPATH_PR_SYNTAX_ERROR;
+					ret = MPATH_PR_SYNTAX_ERROR;
+					goto out;
 				}
 				++num_prout_param;
 				break;
@@ -282,7 +287,8 @@ static int handle_args(int argc, char * argv[], int nline)
 				if (1 != sscanf (optarg, "%x", &prout_type))
 				{
 					fprintf (stderr, "bad argument to '--prout-type'\n");
-					return MPATH_PR_SYNTAX_ERROR;
+					ret = MPATH_PR_SYNTAX_ERROR;
+					goto out;
 				}
 				++num_prout_param;
 				break;
@@ -330,7 +336,8 @@ static int handle_args(int argc, char * argv[], int nline)
 			case 'X':
 				if (0 != construct_transportid(optarg, transportids, num_transport)) {
 					fprintf(stderr, "bad argument to '--transport-id'\n");
-					return MPATH_PR_SYNTAX_ERROR;
+					ret = MPATH_PR_SYNTAX_ERROR;
+					goto out;
 				}
 
 				++num_transport;
@@ -339,11 +346,13 @@ static int handle_args(int argc, char * argv[], int nline)
 			case 'l':
 				if (1 != sscanf(optarg, "%u", &mpath_mx_alloc_len)) {
 					fprintf(stderr, "bad argument to '--alloc-length'\n");
-					return MPATH_PR_SYNTAX_ERROR;
+					ret = MPATH_PR_SYNTAX_ERROR;
+					goto out;
 				} else if (MPATH_MAX_PARAM_LEN < mpath_mx_alloc_len) {
 					fprintf(stderr, "'--alloc-length' argument exceeds maximum"
 							" limit(%d)\n", MPATH_MAX_PARAM_LEN);
-					return MPATH_PR_SYNTAX_ERROR;
+					ret = MPATH_PR_SYNTAX_ERROR;
+					goto out;
 				}
 				break;
 
@@ -420,12 +429,14 @@ static int handle_args(int argc, char * argv[], int nline)
 			fprintf (stderr,
 					" No service action given for Persistent Reserve IN\n");
 			ret = MPATH_PR_SYNTAX_ERROR;
+			goto out;
 		}
 		else if (num_prin_sa > 1)
 		{
 			fprintf (stderr, " Too many service actions given; choose "
 					"one only\n");
 			ret = MPATH_PR_SYNTAX_ERROR;
+			goto out;
 		}
 	}
 	else
@@ -481,14 +492,14 @@ static int handle_args(int argc, char * argv[], int nline)
 		{
 			fprintf (stderr, "failed to allocate PRIN response buffer\n");
 			ret = MPATH_PR_OTHER;
-			goto out;
+			goto out_fd;
 		}
 
 		ret = __mpath_persistent_reserve_in (fd, prin_sa, resp, noisy);
 		if (ret != MPATH_PR_SUCCESS )
 		{
 			fprintf (stderr, "Persistent Reserve IN command failed\n");
-			goto out;
+			goto out_fd;
 		}
 
 		switch(prin_sa)
@@ -568,8 +579,8 @@ static int handle_args(int argc, char * argv[], int nline)
 		printf("PR out: command failed\n");
 	}
 
+out_fd:
 	close (fd);
-
 out :
 	if (ret == MPATH_PR_SYNTAX_ERROR) {
 		free(batch_fn);
-- 
2.17.2

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
