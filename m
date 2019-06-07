Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 7262538B02
	for <lists+dm-devel@lfdr.de>; Fri,  7 Jun 2019 15:10:27 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 0D9BC30832E4;
	Fri,  7 Jun 2019 13:10:20 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CEBC07FE98;
	Fri,  7 Jun 2019 13:10:18 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 68FED206D4;
	Fri,  7 Jun 2019 13:10:16 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x57D71Tr000553 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 7 Jun 2019 09:07:01 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 387E782701; Fri,  7 Jun 2019 13:07:01 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx12.extmail.prod.ext.phx2.redhat.com
	[10.5.110.41])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2F45D8189F;
	Fri,  7 Jun 2019 13:07:00 +0000 (UTC)
Received: from smtp2.provo.novell.com (smtp2.provo.novell.com [137.65.250.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
	bits)) (No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 03AF9308A963;
	Fri,  7 Jun 2019 13:06:44 +0000 (UTC)
Received: from apollon.suse.de.de (prva10-snat226-2.provo.novell.com
	[137.65.226.36])
	by smtp2.provo.novell.com with ESMTP (TLS encrypted);
	Fri, 07 Jun 2019 07:06:32 -0600
From: Martin Wilck <mwilck@suse.com>
To: Christophe Varoqui <christophe.varoqui@opensvc.com>,
	Benjamin Marzinski <bmarzins@redhat.com>
Date: Fri,  7 Jun 2019 15:05:42 +0200
Message-Id: <20190607130552.13203-21-mwilck@suse.com>
In-Reply-To: <20190607130552.13203-1-mwilck@suse.com>
References: <20190607130552.13203-1-mwilck@suse.com>
MIME-Version: 1.0
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 216
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.41]); Fri, 07 Jun 2019 13:06:49 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.41]);
	Fri, 07 Jun 2019 13:06:49 +0000 (UTC) for IP:'137.65.250.81'
	DOMAIN:'smtp2.provo.novell.com' HELO:'smtp2.provo.novell.com'
	FROM:'mwilck@suse.com' RCPT:''
X-RedHat-Spam-Score: -2.3  (RCVD_IN_DNSWL_MED, SPF_HELO_NONE,
	SPF_PASS) 137.65.250.81 smtp2.provo.novell.com
	137.65.250.81 smtp2.provo.novell.com <mwilck@suse.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.41
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com, Martin Wilck <mwilck@suse.com>
Subject: [dm-devel] [PATCH 20/30] libmultipath: parse_vpd_pg83: common code
	for SCSI string parsing
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
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.44]); Fri, 07 Jun 2019 13:10:26 +0000 (UTC)

The three cases for eui, naa, and iqn parsing share almost all code.

Signed-off-by: Martin Wilck <mwilck@suse.com>
---
 libmultipath/discovery.c | 54 ++++++++++++++++------------------------
 1 file changed, 21 insertions(+), 33 deletions(-)

diff --git a/libmultipath/discovery.c b/libmultipath/discovery.c
index e484ec8d..32e3f9d3 100644
--- a/libmultipath/discovery.c
+++ b/libmultipath/discovery.c
@@ -1023,43 +1023,31 @@ parse_vpd_pg83(const unsigned char *in, size_t in_len,
 				len += sprintf(out + len,
 					       "%02x", vpd[i]);
 		} else if (vpd_type == 0x8) {
-			if (!memcmp("eui.", vpd, 4)) {
+			if (!memcmp("eui.", vpd, 4))
 				out[0] =  '2';
-				vpd += 4;
-				len = vpd_len - 4;
-				if (len > out_len - 1) {
-					condlog(1, "%s: WWID overflow, type 8/%c, %d/%lu bytes required",
-						__func__, out[0], len + 1, out_len);
-					len = out_len - 1;
-				}
-				for (i = 0; i < len; ++i)
-					out[1 + i] = tolower(vpd[i]);
-				/* designator should be 0-terminated, but let's make sure */
-				out[len] = '\0';
-			} else if (!memcmp("naa.", vpd, 4)) {
+			else if (!memcmp("naa.", vpd, 4))
 				out[0] = '3';
-				vpd += 4;
-				len = vpd_len - 4;
-				if (len > out_len - 1) {
-					condlog(1, "%s: WWID overflow, type 8/%c, %d/%lu bytes required",
-						__func__, out[0], len + 1, out_len);
-					len = out_len - 1;
-				}
-				for (i = 0; i < len; ++i)
-					out[1 + i] = tolower(vpd[i]);
-				out[len] = '\0';
-			} else {
+			else
 				out[0] = '8';
-				vpd += 4;
-				len = vpd_len - 4;
-				if (len > out_len - 1) {
-					condlog(1, "%s: WWID overflow, type 8/%c, %d/%lu bytes required",
-						__func__, out[0], len + 1, out_len);
-					len = out_len - 1;
-				}
-				memcpy(out + 1, vpd, len);
-				out[len] = '\0';
+
+			vpd += 4;
+			len = vpd_len - 4;
+			if (len > out_len - 1) {
+				condlog(1, "%s: WWID overflow, type 8/%c, %d/%lu bytes required",
+					__func__, out[0], len + 1, out_len);
+				len = out_len - 1;
 			}
+
+			if (out[0] == '8')
+				for (i = 0; i < len; ++i)
+					out[1 + i] = vpd[i];
+			else
+				for (i = 0; i < len; ++i)
+					out[1 + i] = tolower(vpd[i]);
+
+			/* designator should be 0-terminated, but let's make sure */
+			out[len] = '\0';
+
 		} else if (vpd_type == 0x1) {
 			const unsigned char *p;
 			int p_len;
-- 
2.21.0

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
