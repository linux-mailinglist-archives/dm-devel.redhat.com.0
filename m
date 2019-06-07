Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id B455338AEB
	for <lists+dm-devel@lfdr.de>; Fri,  7 Jun 2019 15:09:40 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 91087B5C17;
	Fri,  7 Jun 2019 13:09:28 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 689EB82268;
	Fri,  7 Jun 2019 13:09:28 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 0404C18433A0;
	Fri,  7 Jun 2019 13:09:28 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x57D70F3000530 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 7 Jun 2019 09:07:00 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 0F8855F5BB; Fri,  7 Jun 2019 13:07:00 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx13.extmail.prod.ext.phx2.redhat.com
	[10.5.110.42])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 06D9217B23;
	Fri,  7 Jun 2019 13:06:59 +0000 (UTC)
Received: from smtp2.provo.novell.com (smtp2.provo.novell.com [137.65.250.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
	bits)) (No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id B3818308620F;
	Fri,  7 Jun 2019 13:06:44 +0000 (UTC)
Received: from apollon.suse.de.de (prva10-snat226-2.provo.novell.com
	[137.65.226.36])
	by smtp2.provo.novell.com with ESMTP (TLS encrypted);
	Fri, 07 Jun 2019 07:06:38 -0600
From: Martin Wilck <mwilck@suse.com>
To: Christophe Varoqui <christophe.varoqui@opensvc.com>,
	Benjamin Marzinski <bmarzins@redhat.com>
Date: Fri,  7 Jun 2019 15:05:46 +0200
Message-Id: <20190607130552.13203-25-mwilck@suse.com>
In-Reply-To: <20190607130552.13203-1-mwilck@suse.com>
References: <20190607130552.13203-1-mwilck@suse.com>
MIME-Version: 1.0
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 216
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.42]); Fri, 07 Jun 2019 13:06:47 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.42]);
	Fri, 07 Jun 2019 13:06:47 +0000 (UTC) for IP:'137.65.250.81'
	DOMAIN:'smtp2.provo.novell.com' HELO:'smtp2.provo.novell.com'
	FROM:'mwilck@suse.com' RCPT:''
X-RedHat-Spam-Score: -2.3  (RCVD_IN_DNSWL_MED, SPF_HELO_NONE,
	SPF_PASS) 137.65.250.81 smtp2.provo.novell.com
	137.65.250.81 smtp2.provo.novell.com <mwilck@suse.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.42
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com, Martin Wilck <mwilck@suse.com>
Subject: [dm-devel] [PATCH 24/30] libmultipath: parse_vpd_pg80: fix
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.26]); Fri, 07 Jun 2019 13:09:39 +0000 (UTC)

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
