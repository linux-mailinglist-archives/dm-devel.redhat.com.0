Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 41E111CE848
	for <lists+dm-devel@lfdr.de>; Tue, 12 May 2020 00:40:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1589236840;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=TzSbFKdHGiaTO2EMILXZiCroF4HVahWmFwCQgBW6lRk=;
	b=FLjUD594d26m7P4qWAKY6UvTV7nuM+mwctmGWGbpkcqzFx83qHTpEEwOpHLoBeu6KrlRxE
	Oqv0D9NI9F4rqPRbcHGxM7ZuNbLMcAKLFUkeXM9MSJXWzr7sMAufMIm9xwwOaB6APqUycy
	m4fjyYixeAi5maR81yKRHRSsHb5b+zM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-366-qstFSDeGN8KhZgDjAEmnfQ-1; Mon, 11 May 2020 18:40:37 -0400
X-MC-Unique: qstFSDeGN8KhZgDjAEmnfQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3033D19200C6;
	Mon, 11 May 2020 22:40:29 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0EF9B60BF1;
	Mon, 11 May 2020 22:40:29 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 69C244E565;
	Mon, 11 May 2020 22:40:28 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 04BMe17I016116 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 11 May 2020 18:40:01 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 9640A2026FFE; Mon, 11 May 2020 22:40:01 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9206B2026E1C
	for <dm-devel@redhat.com>; Mon, 11 May 2020 22:40:01 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6F720916108
	for <dm-devel@redhat.com>; Mon, 11 May 2020 22:40:01 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-393-nRle-x9oMYSwrW0AMZ7LRw-1;
	Mon, 11 May 2020 18:39:56 -0400
X-MC-Unique: nRle-x9oMYSwrW0AMZ7LRw-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
	by mx2.suse.de (Postfix) with ESMTP id E1EBBAE28;
	Mon, 11 May 2020 22:39:55 +0000 (UTC)
From: mwilck@suse.com
To: Christophe Varoqui <christophe.varoqui@opensvc.com>,
	Benjamin Marzinski <bmarzins@redhat.com>
Date: Tue, 12 May 2020 00:39:25 +0200
Message-Id: <20200511223931.18261-6-mwilck@suse.com>
In-Reply-To: <20200511223931.18261-1-mwilck@suse.com>
References: <20200511223931.18261-1-mwilck@suse.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 04BMe17I016116
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com, Martin Wilck <mwilck@suse.com>
Subject: [dm-devel] [PATCH 05/11] libmultipath: discovery.c: use %z
	qualifier for size_t
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
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Martin Wilck <mwilck@suse.com>

Otherwise compilation for 32bit targets spits out warnings.

Signed-off-by: Martin Wilck <mwilck@suse.com>
---
 libmultipath/discovery.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/libmultipath/discovery.c b/libmultipath/discovery.c
index ee3290cd..ffec5162 100644
--- a/libmultipath/discovery.c
+++ b/libmultipath/discovery.c
@@ -986,7 +986,7 @@ parse_vpd_pg80(const unsigned char *in, char *out, size_t out_len)
 	}
 
 	if (len >= out_len) {
-		condlog(2, "vpd pg80 overflow, %lu/%lu bytes required",
+		condlog(2, "vpd pg80 overflow, %zu/%zu bytes required",
 			len + 1, out_len);
 		len = out_len - 1;
 	}
@@ -1087,7 +1087,7 @@ parse_vpd_pg83(const unsigned char *in, size_t in_len,
 
 		len = sprintf(out, "%d", vpd_type);
 		if (2 * vpd_len >= out_len - len) {
-			condlog(1, "%s: WWID overflow, type %d, %lu/%lu bytes required",
+			condlog(1, "%s: WWID overflow, type %d, %zu/%zu bytes required",
 				__func__, vpd_type,
 				2 * vpd_len + len + 1, out_len);
 			vpd_len = (out_len - len - 1) / 2;
@@ -1096,7 +1096,7 @@ parse_vpd_pg83(const unsigned char *in, size_t in_len,
 			len += sprintf(out + len,
 				       "%02x", vpd[i]);
 	} else if (vpd_type == 0x8 && vpd_len < 4) {
-		condlog(1, "%s: VPD length %lu too small for designator type 8",
+		condlog(1, "%s: VPD length %zu too small for designator type 8",
 			__func__, vpd_len);
 		return -EINVAL;
 	} else if (vpd_type == 0x8) {
@@ -1112,7 +1112,7 @@ parse_vpd_pg83(const unsigned char *in, size_t in_len,
 		while (len > 2 && vpd[len - 2] == '\0')
 			--len;
 		if (len > out_len - 1) {
-			condlog(1, "%s: WWID overflow, type 8/%c, %lu/%lu bytes required",
+			condlog(1, "%s: WWID overflow, type 8/%c, %zu/%zu bytes required",
 				__func__, out[0], len + 1, out_len);
 			len = out_len - 1;
 		}
@@ -1136,7 +1136,7 @@ parse_vpd_pg83(const unsigned char *in, size_t in_len,
 		while ((p = memchr(vpd, ' ', vpd_len))) {
 			p_len = p - vpd;
 			if (len + p_len > out_len - 1) {
-				condlog(1, "%s: WWID overflow, type 1, %lu/%lu bytes required",
+				condlog(1, "%s: WWID overflow, type 1, %zu/%zu bytes required",
 					__func__, len + p_len, out_len);
 				p_len = out_len - len - 1;
 			}
@@ -1162,7 +1162,7 @@ parse_vpd_pg83(const unsigned char *in, size_t in_len,
 		p_len = vpd_len;
 		if (p_len > 0 && len < out_len - 1) {
 			if (len + p_len > out_len - 1) {
-				condlog(1, "%s: WWID overflow, type 1, %lu/%lu bytes required",
+				condlog(1, "%s: WWID overflow, type 1, %zu/%zu bytes required",
 					__func__, len + p_len + 1, out_len);
 				p_len = out_len - len - 1;
 			}
@@ -1186,14 +1186,14 @@ parse_vpd_c0_hp3par(const unsigned char *in, size_t in_len,
 
 	memset(out, 0x0, out_len);
 	if (in_len <= 4 || (in[4] > 3 && in_len < 44)) {
-		condlog(3, "HP/3PAR vendor specific VPD page length too short: %lu", in_len);
+		condlog(3, "HP/3PAR vendor specific VPD page length too short: %zu", in_len);
 		return -EINVAL;
 	}
 	if (in[4] <= 3) /* revision must be > 3 to have Vomlume Name */
 		return -ENODATA;
 	len = get_unaligned_be32(&in[40]);
 	if (len > out_len || len + 44 > in_len) {
-		condlog(3, "HP/3PAR vendor specific Volume name too long: %lu",
+		condlog(3, "HP/3PAR vendor specific Volume name too long: %zu",
 			len);
 		return -EINVAL;
 	}
-- 
2.26.2


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

