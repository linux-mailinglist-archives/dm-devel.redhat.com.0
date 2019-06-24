Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 947D7505B2
	for <lists+dm-devel@lfdr.de>; Mon, 24 Jun 2019 11:30:30 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id B4F0F7FDEC;
	Mon, 24 Jun 2019 09:30:23 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 70D9A5D721;
	Mon, 24 Jun 2019 09:30:22 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id CB6A2206D3;
	Mon, 24 Jun 2019 09:30:20 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x5O9TUnT005359 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 24 Jun 2019 05:29:30 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id F369E1001B07; Mon, 24 Jun 2019 09:29:29 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx04.extmail.prod.ext.phx2.redhat.com
	[10.5.110.28])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id EAC091001B04;
	Mon, 24 Jun 2019 09:29:29 +0000 (UTC)
Received: from smtp2.provo.novell.com (smtp2.provo.novell.com [137.65.250.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
	bits)) (No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 90F617F7C0;
	Mon, 24 Jun 2019 09:29:21 +0000 (UTC)
Received: from apollon.suse.de.de (prva10-snat226-2.provo.novell.com
	[137.65.226.36])
	by smtp2.provo.novell.com with ESMTP (TLS encrypted);
	Mon, 24 Jun 2019 03:29:17 -0600
From: Martin Wilck <mwilck@suse.com>
To: Benjamin Marzinski <bmarzins@redhat.com>,
	Christophe Varoqui <christophe.varoqui@opensvc.com>
Date: Mon, 24 Jun 2019 11:27:46 +0200
Message-Id: <20190624092756.7769-22-mwilck@suse.com>
In-Reply-To: <20190624092756.7769-1-mwilck@suse.com>
References: <20190624092756.7769-1-mwilck@suse.com>
MIME-Version: 1.0
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 216
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.28]); Mon, 24 Jun 2019 09:29:21 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.28]);
	Mon, 24 Jun 2019 09:29:21 +0000 (UTC) for IP:'137.65.250.81'
	DOMAIN:'smtp2.provo.novell.com' HELO:'smtp2.provo.novell.com'
	FROM:'mwilck@suse.com' RCPT:''
X-RedHat-Spam-Score: -2.3  (RCVD_IN_DNSWL_MED, SPF_HELO_NONE,
	SPF_PASS) 137.65.250.81 smtp2.provo.novell.com
	137.65.250.81 smtp2.provo.novell.com <mwilck@suse.com>
X-Scanned-By: MIMEDefang 2.78 on 10.5.110.28
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com, Martin Wilck <mwilck@suse.com>
Subject: [dm-devel] [PATCH v2 20/30] libmultipath: parse_vpd_pg83: common
	code for SCSI string parsing
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
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.27]); Mon, 24 Jun 2019 09:30:29 +0000 (UTC)

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
