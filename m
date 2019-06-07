Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id CAE1D38AFD
	for <lists+dm-devel@lfdr.de>; Fri,  7 Jun 2019 15:10:10 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 0E2018F927;
	Fri,  7 Jun 2019 13:10:03 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C87048189F;
	Fri,  7 Jun 2019 13:10:01 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 5878C18433A0;
	Fri,  7 Jun 2019 13:09:59 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x57D6x5g000511 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 7 Jun 2019 09:06:59 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 3C7EF8CB89; Fri,  7 Jun 2019 13:06:59 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx10.extmail.prod.ext.phx2.redhat.com
	[10.5.110.39])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3508317D09;
	Fri,  7 Jun 2019 13:06:59 +0000 (UTC)
Received: from smtp2.provo.novell.com (smtp2.provo.novell.com [137.65.250.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
	bits)) (No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 34DC522389D;
	Fri,  7 Jun 2019 13:06:34 +0000 (UTC)
Received: from apollon.suse.de.de (prva10-snat226-2.provo.novell.com
	[137.65.226.36])
	by smtp2.provo.novell.com with ESMTP (TLS encrypted);
	Fri, 07 Jun 2019 07:06:27 -0600
From: Martin Wilck <mwilck@suse.com>
To: Christophe Varoqui <christophe.varoqui@opensvc.com>,
	Benjamin Marzinski <bmarzins@redhat.com>
Date: Fri,  7 Jun 2019 15:05:38 +0200
Message-Id: <20190607130552.13203-17-mwilck@suse.com>
In-Reply-To: <20190607130552.13203-1-mwilck@suse.com>
References: <20190607130552.13203-1-mwilck@suse.com>
MIME-Version: 1.0
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 216
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.39]); Fri, 07 Jun 2019 13:06:38 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.39]);
	Fri, 07 Jun 2019 13:06:38 +0000 (UTC) for IP:'137.65.250.81'
	DOMAIN:'smtp2.provo.novell.com' HELO:'smtp2.provo.novell.com'
	FROM:'mwilck@suse.com' RCPT:''
X-RedHat-Spam-Score: -2.3  (RCVD_IN_DNSWL_MED, SPF_HELO_NONE,
	SPF_PASS) 137.65.250.81 smtp2.provo.novell.com
	137.65.250.81 smtp2.provo.novell.com <mwilck@suse.com>
X-Scanned-By: MIMEDefang 2.78 on 10.5.110.39
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com, Martin Wilck <mwilck@suse.com>
Subject: [dm-devel] [PATCH 16/30] libmultipath: fix possible WWID overflow
	in parse_vpd_pg83()
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.26]); Fri, 07 Jun 2019 13:10:09 +0000 (UTC)

We have to check the remaining length before printing to the
output buffer, not afterwards.

Fixes: 18176202e75c "Read wwid from sysfs vpg_pg83 attribute"
Signed-off-by: Martin Wilck <mwilck@suse.com>
---
 libmultipath/discovery.c | 16 +++-------------
 1 file changed, 3 insertions(+), 13 deletions(-)

diff --git a/libmultipath/discovery.c b/libmultipath/discovery.c
index 89c4d2ad..eed35284 100644
--- a/libmultipath/discovery.c
+++ b/libmultipath/discovery.c
@@ -1012,11 +1012,9 @@ parse_vpd_pg83(const unsigned char *in, size_t in_len,
 			int i;
 
 			len = sprintf(out, "%d", vpd_type);
-			for (i = 0; i < vpd_len; i++) {
+			for (i = 0; i < vpd_len && len < out_len - 2; i++) {
 				len += sprintf(out + len,
 					       "%02x", vpd[i]);
-				if (len >= out_len)
-					break;
 			}
 		} else if (vpd_type == 0x8) {
 			if (!memcmp("eui.", vpd, 4)) {
@@ -1024,27 +1022,19 @@ parse_vpd_pg83(const unsigned char *in, size_t in_len,
 				len = 1;
 				vpd += 4;
 				vpd_len -= 4;
-				for (i = 0; i < vpd_len; i++) {
+				for (i = 0; i < vpd_len && len < out_len - 1; i++) {
 					len += sprintf(out + len, "%c",
 						       tolower(vpd[i]));
-					if (len >= out_len)
-						break;
 				}
-				len = vpd_len + 1;
-				out[len] = '\0';
 			} else if (!memcmp("naa.", vpd, 4)) {
 				out[0] = '3';
 				len = 1;
 				vpd += 4;
 				vpd_len -= 4;
-				for (i = 0; i < vpd_len; i++) {
+				for (i = 0; i < vpd_len && len < out_len - 1; i++) {
 					len += sprintf(out + len, "%c",
 						       tolower(vpd[i]));
-					if (len >= out_len)
-						break;
 				}
-				len = vpd_len + 1;
-				out[len] = '\0';
 			} else {
 				out[0] = '8';
 				len = 1;
-- 
2.21.0

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
