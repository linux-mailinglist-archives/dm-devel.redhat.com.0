Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B888505B8
	for <lists+dm-devel@lfdr.de>; Mon, 24 Jun 2019 11:30:39 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 3379580F98;
	Mon, 24 Jun 2019 09:30:37 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E6F626090E;
	Mon, 24 Jun 2019 09:30:34 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 4FD83206D6;
	Mon, 24 Jun 2019 09:30:32 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x5O9TPqK005219 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 24 Jun 2019 05:29:25 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 92D1019C7F; Mon, 24 Jun 2019 09:29:25 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx11.extmail.prod.ext.phx2.redhat.com
	[10.5.110.40])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8847219C69;
	Mon, 24 Jun 2019 09:29:25 +0000 (UTC)
Received: from smtp2.provo.novell.com (smtp2.provo.novell.com [137.65.250.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
	bits)) (No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 6214D30C252E;
	Mon, 24 Jun 2019 09:29:21 +0000 (UTC)
Received: from apollon.suse.de.de (prva10-snat226-2.provo.novell.com
	[137.65.226.36])
	by smtp2.provo.novell.com with ESMTP (TLS encrypted);
	Mon, 24 Jun 2019 03:29:15 -0600
From: Martin Wilck <mwilck@suse.com>
To: Benjamin Marzinski <bmarzins@redhat.com>,
	Christophe Varoqui <christophe.varoqui@opensvc.com>
Date: Mon, 24 Jun 2019 11:27:45 +0200
Message-Id: <20190624092756.7769-21-mwilck@suse.com>
In-Reply-To: <20190624092756.7769-1-mwilck@suse.com>
References: <20190624092756.7769-1-mwilck@suse.com>
MIME-Version: 1.0
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 216
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.40]); Mon, 24 Jun 2019 09:29:21 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.40]);
	Mon, 24 Jun 2019 09:29:21 +0000 (UTC) for IP:'137.65.250.81'
	DOMAIN:'smtp2.provo.novell.com' HELO:'smtp2.provo.novell.com'
	FROM:'mwilck@suse.com' RCPT:''
X-RedHat-Spam-Score: -2.3  (RCVD_IN_DNSWL_MED, SPF_HELO_NONE,
	SPF_PASS) 137.65.250.81 smtp2.provo.novell.com
	137.65.250.81 smtp2.provo.novell.com <mwilck@suse.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.40
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com, Martin Wilck <mwilck@suse.com>
Subject: [dm-devel] [PATCH v2 19/30] libmultipath: add consistent WWID
	overflow logging in parse_vpd_pg83
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
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.27]); Mon, 24 Jun 2019 09:30:37 +0000 (UTC)

Signed-off-by: Martin Wilck <mwilck@suse.com>
---
 libmultipath/discovery.c | 49 ++++++++++++++++++++++++++--------------
 1 file changed, 32 insertions(+), 17 deletions(-)

diff --git a/libmultipath/discovery.c b/libmultipath/discovery.c
index 45c2931e..e484ec8d 100644
--- a/libmultipath/discovery.c
+++ b/libmultipath/discovery.c
@@ -1011,38 +1011,53 @@ parse_vpd_pg83(const unsigned char *in, size_t in_len,
 		if (vpd_type == 0x2 || vpd_type == 0x3) {
 			int i;
 
+			assert(out_len >= 2);
 			len = sprintf(out, "%d", vpd_type);
-			for (i = 0; i < vpd_len && len < out_len - 2; i++) {
+			if (2 * vpd_len >= out_len - len) {
+				condlog(1, "%s: WWID overflow, type %d, %d/%lu bytes required",
+					__func__, vpd_type,
+					2 * vpd_len + len + 1, out_len);
+				vpd_len = (out_len - len - 1) / 2;
+			}
+			for (i = 0; i < vpd_len; i++)
 				len += sprintf(out + len,
 					       "%02x", vpd[i]);
-			}
 		} else if (vpd_type == 0x8) {
 			if (!memcmp("eui.", vpd, 4)) {
 				out[0] =  '2';
-				len = 1;
 				vpd += 4;
-				vpd_len -= 4;
-				for (i = 0; i < vpd_len && len < out_len - 1; i++) {
-					len += sprintf(out + len, "%c",
-						       tolower(vpd[i]));
+				len = vpd_len - 4;
+				if (len > out_len - 1) {
+					condlog(1, "%s: WWID overflow, type 8/%c, %d/%lu bytes required",
+						__func__, out[0], len + 1, out_len);
+					len = out_len - 1;
 				}
+				for (i = 0; i < len; ++i)
+					out[1 + i] = tolower(vpd[i]);
+				/* designator should be 0-terminated, but let's make sure */
+				out[len] = '\0';
 			} else if (!memcmp("naa.", vpd, 4)) {
 				out[0] = '3';
-				len = 1;
 				vpd += 4;
-				vpd_len -= 4;
-				for (i = 0; i < vpd_len && len < out_len - 1; i++) {
-					len += sprintf(out + len, "%c",
-						       tolower(vpd[i]));
+				len = vpd_len - 4;
+				if (len > out_len - 1) {
+					condlog(1, "%s: WWID overflow, type 8/%c, %d/%lu bytes required",
+						__func__, out[0], len + 1, out_len);
+					len = out_len - 1;
 				}
+				for (i = 0; i < len; ++i)
+					out[1 + i] = tolower(vpd[i]);
+				out[len] = '\0';
 			} else {
 				out[0] = '8';
 				vpd += 4;
-				vpd_len -= 4;
-				if (vpd_len > out_len - 2)
-					vpd_len = out_len - 2;
-				memcpy(out + 1, vpd, vpd_len);
-				len = vpd_len + 1;
+				len = vpd_len - 4;
+				if (len > out_len - 1) {
+					condlog(1, "%s: WWID overflow, type 8/%c, %d/%lu bytes required",
+						__func__, out[0], len + 1, out_len);
+					len = out_len - 1;
+				}
+				memcpy(out + 1, vpd, len);
 				out[len] = '\0';
 			}
 		} else if (vpd_type == 0x1) {
-- 
2.21.0

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
