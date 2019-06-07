Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id CE1EE38AE8
	for <lists+dm-devel@lfdr.de>; Fri,  7 Jun 2019 15:09:32 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id EBC89C05168F;
	Fri,  7 Jun 2019 13:08:40 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 942C210AFF20;
	Fri,  7 Jun 2019 13:08:24 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 8EC5918433A1;
	Fri,  7 Jun 2019 13:07:52 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x57D6qYN000378 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 7 Jun 2019 09:06:52 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id D513182F56; Fri,  7 Jun 2019 13:06:52 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx01.extmail.prod.ext.phx2.redhat.com
	[10.5.110.25])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CE10982F53;
	Fri,  7 Jun 2019 13:06:49 +0000 (UTC)
Received: from smtp2.provo.novell.com (smtp2.provo.novell.com [137.65.250.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
	bits)) (No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id D27BC85376;
	Fri,  7 Jun 2019 13:06:14 +0000 (UTC)
Received: from apollon.suse.de.de (prva10-snat226-2.provo.novell.com
	[137.65.226.36])
	by smtp2.provo.novell.com with ESMTP (TLS encrypted);
	Fri, 07 Jun 2019 07:06:09 -0600
From: Martin Wilck <mwilck@suse.com>
To: Christophe Varoqui <christophe.varoqui@opensvc.com>,
	Benjamin Marzinski <bmarzins@redhat.com>
Date: Fri,  7 Jun 2019 15:05:25 +0200
Message-Id: <20190607130552.13203-4-mwilck@suse.com>
In-Reply-To: <20190607130552.13203-1-mwilck@suse.com>
References: <20190607130552.13203-1-mwilck@suse.com>
MIME-Version: 1.0
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 216
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.25]); Fri, 07 Jun 2019 13:06:39 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.25]);
	Fri, 07 Jun 2019 13:06:39 +0000 (UTC) for IP:'137.65.250.81'
	DOMAIN:'smtp2.provo.novell.com' HELO:'smtp2.provo.novell.com'
	FROM:'mwilck@suse.com' RCPT:''
X-RedHat-Spam-Score: -2.3  (RCVD_IN_DNSWL_MED, SPF_HELO_NONE,
	SPF_PASS) 137.65.250.81 smtp2.provo.novell.com
	137.65.250.81 smtp2.provo.novell.com <mwilck@suse.com>
X-Scanned-By: MIMEDefang 2.83 on 10.5.110.25
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com, Martin Wilck <mwilck@suse.com>
Subject: [dm-devel] [PATCH 03/30] libmultipath: remove 'space' argument to
	merge_words()
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.31]); Fri, 07 Jun 2019 13:09:23 +0000 (UTC)

merge_words() is always called with space = 1. Remove the argument.

Signed-off-by: Martin Wilck <mwilck@suse.com>
---
 libmultipath/dmparser.c | 18 +++++++-----------
 1 file changed, 7 insertions(+), 11 deletions(-)

diff --git a/libmultipath/dmparser.c b/libmultipath/dmparser.c
index ac13ec06..04f675c1 100644
--- a/libmultipath/dmparser.c
+++ b/libmultipath/dmparser.c
@@ -18,12 +18,12 @@
 #define WORD_SIZE 64
 
 static int
-merge_words (char ** dst, char * word, int space)
+merge_words(char **dst, char *word)
 {
 	char * p = *dst;
 	int len;
 
-	len = strlen(*dst) + strlen(word) + space;
+	len = strlen(*dst) + strlen(word) + 1;
 	*dst = REALLOC(*dst, len + 1);
 
 	if (!*dst) {
@@ -36,11 +36,8 @@ merge_words (char ** dst, char * word, int space)
 	while (*p != '\0')
 		p++;
 
-	while (space) {
-		*p = ' ';
-		p++;
-		space--;
-	}
+	*p = ' ';
+	++p;
 	strncpy(p, word, strlen(word) + 1);
 
 	return 0;
@@ -163,7 +160,7 @@ int disassemble_map(vector pathvec, char *params, struct multipath *mpp,
 		if (!word)
 			return 1;
 
-		if (merge_words(&mpp->features, word, 1)) {
+		if (merge_words(&mpp->features, word)) {
 			FREE(word);
 			return 1;
 		}
@@ -187,7 +184,7 @@ int disassemble_map(vector pathvec, char *params, struct multipath *mpp,
 		if (!word)
 			return 1;
 
-		if (merge_words(&mpp->hwhandler, word, 1)) {
+		if (merge_words(&mpp->hwhandler, word)) {
 			FREE(word);
 			return 1;
 		}
@@ -248,9 +245,8 @@ int disassemble_map(vector pathvec, char *params, struct multipath *mpp,
 
 			num_pg_args = atoi(word);
 
-			if (merge_words(&mpp->selector, word, 1)) {
+			if (merge_words(&mpp->selector, word))
 				goto out1;
-			}
 			FREE(word);
 		} else {
 			p += get_word(p, NULL);
-- 
2.21.0

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
