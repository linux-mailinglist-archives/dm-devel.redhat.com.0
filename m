Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id E3091505BD
	for <lists+dm-devel@lfdr.de>; Mon, 24 Jun 2019 11:30:50 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id B020E368FF;
	Mon, 24 Jun 2019 09:30:32 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 77B005D9C9;
	Mon, 24 Jun 2019 09:30:31 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id BD3D91806B18;
	Mon, 24 Jun 2019 09:30:27 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x5O9Tgk6005679 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 24 Jun 2019 05:29:42 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 63C465C225; Mon, 24 Jun 2019 09:29:42 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx02.extmail.prod.ext.phx2.redhat.com
	[10.5.110.26])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5C59B5C1B5;
	Mon, 24 Jun 2019 09:29:42 +0000 (UTC)
Received: from smtp2.provo.novell.com (smtp2.provo.novell.com [137.65.250.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
	bits)) (No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 728AA87632;
	Mon, 24 Jun 2019 09:29:31 +0000 (UTC)
Received: from apollon.suse.de.de (prva10-snat226-2.provo.novell.com
	[137.65.226.36])
	by smtp2.provo.novell.com with ESMTP (TLS encrypted);
	Mon, 24 Jun 2019 03:29:24 -0600
From: Martin Wilck <mwilck@suse.com>
To: Benjamin Marzinski <bmarzins@redhat.com>,
	Christophe Varoqui <christophe.varoqui@opensvc.com>
Date: Mon, 24 Jun 2019 11:27:50 +0200
Message-Id: <20190624092756.7769-26-mwilck@suse.com>
In-Reply-To: <20190624092756.7769-1-mwilck@suse.com>
References: <20190624092756.7769-1-mwilck@suse.com>
MIME-Version: 1.0
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 216
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.26]); Mon, 24 Jun 2019 09:29:31 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.26]);
	Mon, 24 Jun 2019 09:29:31 +0000 (UTC) for IP:'137.65.250.81'
	DOMAIN:'smtp2.provo.novell.com' HELO:'smtp2.provo.novell.com'
	FROM:'mwilck@suse.com' RCPT:''
X-RedHat-Spam-Score: -2.3  (RCVD_IN_DNSWL_MED, SPF_HELO_NONE,
	SPF_PASS) 137.65.250.81 smtp2.provo.novell.com
	137.65.250.81 smtp2.provo.novell.com <mwilck@suse.com>
X-Scanned-By: MIMEDefang 2.78 on 10.5.110.26
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com, Martin Wilck <mwilck@suse.com>
Subject: [dm-devel] [PATCH v2 24/30] libmultipath: parse_vpd_pg80: fix
	whitespace handling
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
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.30]); Mon, 24 Jun 2019 09:30:49 +0000 (UTC)

According to the SPC spec, the unit serial number is right-aligned
ASCII. Thus leading whitespace must be skipped. Moreover, trailing
whitespace should be discarded before doing the length check.

Fixes: 756ef73b7197 "Separate out vpd parsing functions"
Signed-off-by: Martin Wilck <mwilck@suse.com>
---
 libmultipath/discovery.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/libmultipath/discovery.c b/libmultipath/discovery.c
index 931a676f..b10afdef 100644
--- a/libmultipath/discovery.c
+++ b/libmultipath/discovery.c
@@ -907,9 +907,18 @@ get_geometry(struct path *pp)
 static int
 parse_vpd_pg80(const unsigned char *in, char *out, size_t out_len)
 {
-	char *p = NULL;
 	int len = get_unaligned_be16(&in[2]);
 
+	/*
+	 * Strip leading and trailing whitespace
+	 */
+	while (len > 0 && in[len + 3] == ' ')
+		--len;
+	while (len > 0 && in[4] == ' ') {
+		++in;
+		--len;
+	}
+
 	if (len >= out_len) {
 		condlog(2, "vpd pg80 overflow, %d/%d bytes required",
 			len + 1, (int)out_len);
@@ -919,15 +928,6 @@ parse_vpd_pg80(const unsigned char *in, char *out, size_t out_len)
 		memcpy(out, in + 4, len);
 		out[len] = '\0';
 	}
-	/*
-	 * Strip trailing whitspaces
-	 */
-	p = out + len - 1;
-	while (p > out && *p == ' ') {
-		*p = '\0';
-		p--;
-		len --;
-	}
 	return len;
 }
 
-- 
2.21.0

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
