Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F36345665E
	for <lists+dm-devel@lfdr.de>; Fri, 19 Nov 2021 00:18:52 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-196-A1iLDOBqPKqbtbgFi_ly8g-1; Thu, 18 Nov 2021 18:18:47 -0500
X-MC-Unique: A1iLDOBqPKqbtbgFi_ly8g-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 509C110151EE;
	Thu, 18 Nov 2021 23:18:42 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3055D5D6B1;
	Thu, 18 Nov 2021 23:18:42 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 4DE101832DD5;
	Thu, 18 Nov 2021 23:18:41 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 1AINEHHC005256 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 18 Nov 2021 18:14:17 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 6112E2026D69; Thu, 18 Nov 2021 23:14:17 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5B4962026D64
	for <dm-devel@redhat.com>; Thu, 18 Nov 2021 23:14:04 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7F880857FAD
	for <dm-devel@redhat.com>; Thu, 18 Nov 2021 23:14:04 +0000 (UTC)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29]) by
	relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	us-mta-436-YpOqdlWjO1-yFjXUqihn-g-1; Thu, 18 Nov 2021 18:14:02 -0500
X-MC-Unique: YpOqdlWjO1-yFjXUqihn-g-1
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	key-exchange X25519 server-signature ECDSA (P-521) server-digest
	SHA512) (No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 698451FD3D;
	Thu, 18 Nov 2021 23:14:01 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	key-exchange X25519 server-signature ECDSA (P-521) server-digest
	SHA512) (No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 1423313AA8;
	Thu, 18 Nov 2021 23:14:01 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA id aOeUAjnelmGAQAAAMHmgww
	(envelope-from <mwilck@suse.com>); Thu, 18 Nov 2021 23:14:01 +0000
From: mwilck@suse.com
To: Christophe Varoqui <christophe.varoqui@opensvc.com>,
	Benjamin Marzinski <bmarzins@redhat.com>
Date: Fri, 19 Nov 2021 00:13:24 +0100
Message-Id: <20211118231338.22358-8-mwilck@suse.com>
In-Reply-To: <20211118231338.22358-1-mwilck@suse.com>
References: <20211118231338.22358-1-mwilck@suse.com>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 1AINEHHC005256
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com, Martin Wilck <mwilck@suse.com>
Subject: [dm-devel] [PATCH 07/21] libmultipath: use strbuf in
	parse_vpd_pg83()
X-BeenThere: dm-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: device-mapper development <dm-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/dm-devel>,
	<mailto:dm-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://listman.redhat.com/archives/dm-devel>
List-Post: <mailto:dm-devel@redhat.com>
List-Help: <mailto:dm-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/dm-devel>,
	<mailto:dm-devel-request@redhat.com?subject=subscribe>
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Martin Wilck <mwilck@suse.com>

By using the strbuf API, the code gets more readable, as we need
less output size checks.

While at it, avoid a possible crash by passing a NULL pointer
to memchr().

Signed-off-by: Martin Wilck <mwilck@suse.com>
---
 libmultipath/discovery.c | 113 +++++++++++++++++----------------------
 1 file changed, 49 insertions(+), 64 deletions(-)

diff --git a/libmultipath/discovery.c b/libmultipath/discovery.c
index 5ce9031..16b6fae 100644
--- a/libmultipath/discovery.c
+++ b/libmultipath/discovery.c
@@ -1120,6 +1120,7 @@ parse_vpd_pg83(const unsigned char *in, size_t in_len,
 	size_t len, vpd_len, i;
 	int vpd_type, prio = -1;
 	int err = -ENODATA;
+	STRBUF_ON_STACK(buf);
 
         /* Need space at least for one digit */
 	if (out_len <= 1)
@@ -1237,92 +1238,76 @@ parse_vpd_pg83(const unsigned char *in, size_t in_len,
 	if (vpd_type == 0x2 || vpd_type == 0x3) {
 		size_t i;
 
-		len = sprintf(out, "%d", vpd_type);
-		if (2 * vpd_len >= out_len - len) {
-			condlog(1, "%s: WWID overflow, type %d, %zu/%zu bytes required",
-				__func__, vpd_type,
-				2 * vpd_len + len + 1, out_len);
-			vpd_len = (out_len - len - 1) / 2;
-		}
+		if ((err = print_strbuf(&buf, "%d", vpd_type)) < 0)
+			return err;
 		for (i = 0; i < vpd_len; i++)
-			len += sprintf(out + len,
-				       "%02x", vpd[i]);
+			if ((err = print_strbuf(&buf, "%02x", vpd[i])) < 0)
+				return err;
 	} else if (vpd_type == 0x8) {
-		if (!memcmp("eui.", vpd, 4))
-			out[0] =  '2';
+		char type;
+
+                if (!memcmp("eui.", vpd, 4))
+			type =  '2';
 		else if (!memcmp("naa.", vpd, 4))
-			out[0] = '3';
+			type = '3';
 		else
-			out[0] = '8';
+			type = '8';
+		if ((err = fill_strbuf(&buf, type, 1)) < 0)
+			return err;
 
 		vpd += 4;
 		len = vpd_len - 4;
-		while (len > 2 && vpd[len - 2] == '\0')
-			--len;
-		if (len > out_len - 1) {
-			condlog(1, "%s: WWID overflow, type 8/%c, %zu/%zu bytes required",
-				__func__, out[0], len + 1, out_len);
-			len = out_len - 1;
+		if ((err = __append_strbuf_str(&buf, (const char *)vpd, len)) < 0)
+			return err;
+
+                /* The input is 0-padded, make sure the length is correct */
+		truncate_strbuf(&buf, strlen(get_strbuf_str(&buf)));
+		len = get_strbuf_len(&buf);
+		if (type != '8') {
+			char *buffer = __get_strbuf_buf(&buf);
+
+			for (i = 0; i < len; ++i)
+				buffer[i] = tolower(buffer[i]);
 		}
 
-		if (out[0] == '8')
-			for (i = 0; i < len; ++i)
-				out[1 + i] = vpd[i];
-		else
-			for (i = 0; i < len; ++i)
-				out[1 + i] = tolower(vpd[i]);
-
-		/* designator should be 0-terminated, but let's make sure */
-		out[len] = '\0';
-
 	} else if (vpd_type == 0x1) {
 		const unsigned char *p;
 		size_t p_len;
 
-		out[0] = '1';
-		len = 1;
-		while ((p = memchr(vpd, ' ', vpd_len))) {
+		if ((err = fill_strbuf(&buf, '1', 1)) < 0)
+			return err;
+		while (vpd && (p = memchr(vpd, ' ', vpd_len))) {
 			p_len = p - vpd;
-			if (len + p_len > out_len - 1) {
-				condlog(1, "%s: WWID overflow, type 1, %zu/%zu bytes required",
-					__func__, len + p_len, out_len);
-				p_len = out_len - len - 1;
-			}
-			memcpy(out + len, vpd, p_len);
-			len += p_len;
-			if (len >= out_len - 1) {
-				out[len] = '\0';
-				break;
-			}
-			out[len] = '_';
-			len ++;
-			if (len >= out_len - 1) {
-				out[len] = '\0';
-				break;
-			}
+			if ((err = __append_strbuf_str(&buf, (const char *)vpd,
+						       p_len)) < 0)
+				return err;
 			vpd = p;
 			vpd_len -= p_len;
-			while (vpd && *vpd == ' ') {
+			while (vpd && vpd_len > 0 && *vpd == ' ') {
 				vpd++;
 				vpd_len --;
 			}
+			if (vpd_len > 0 && (err = fill_strbuf(&buf, '_', 1)) < 0)
+				return err;
 		}
-		p_len = vpd_len;
-		if (p_len > 0 && len < out_len - 1) {
-			if (len + p_len > out_len - 1) {
-				condlog(1, "%s: WWID overflow, type 1, %zu/%zu bytes required",
-					__func__, len + p_len + 1, out_len);
-				p_len = out_len - len - 1;
-			}
-			memcpy(out + len, vpd, p_len);
-			len += p_len;
-			out[len] = '\0';
-		}
-		if (len > 1 && out[len - 1] == '_') {
-			out[len - 1] = '\0';
-			len--;
+		if (vpd_len > 0) {
+			if ((err = __append_strbuf_str(&buf, (const char *)vpd,
+						       vpd_len)) < 0)
+				return err;
 		}
 	}
+
+        len = get_strbuf_len(&buf);
+	if (len >= out_len) {
+		condlog(1, "%s: WWID overflow, type %d, %zu/%zu bytes required",
+			__func__, vpd_type, len, out_len);
+                if (vpd_type == 2 || vpd_type == 3)
+			/* designator must have an even number of characters */
+			len = 2 * (out_len / 2) - 1;
+		else
+			len = out_len - 1;
+	}
+	strlcpy(out, get_strbuf_str(&buf), len + 1);
 	return len;
 }
 
-- 
2.33.1


--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

