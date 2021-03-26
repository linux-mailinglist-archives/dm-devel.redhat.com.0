Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id 112BE349E40
	for <lists+dm-devel@lfdr.de>; Fri, 26 Mar 2021 01:55:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1616720125;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=kGNFVpvio4E8T2sXZ19vliwQO9Fae6xRQqmVS0w5G8I=;
	b=VWdJSdLOovdi5v6edNvbrQm8FHXOqeD8Io+Y8QjxekPKRXbvJXiS7T71Y/AyCoxd/Sy3Nh
	hYlhPUSqhT4kiNY3ATQ0XKkKZ3H7KxKyCfEIQCzIszS51ywx2NemQUcemXOnzQ2gKBcqos
	Ya0rnldCm++vE5rhvZPsEaiz8cBh1/0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-288-j78icRg7P_WKB1FE1UJjjQ-1; Thu, 25 Mar 2021 20:55:22 -0400
X-MC-Unique: j78icRg7P_WKB1FE1UJjjQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3D5AE190A7A0;
	Fri, 26 Mar 2021 00:55:17 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5F98C5D9D0;
	Fri, 26 Mar 2021 00:55:12 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id BAAA81809C83;
	Fri, 26 Mar 2021 00:55:04 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 12Q0qrMv019153 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 25 Mar 2021 20:52:53 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id E05C71394F; Fri, 26 Mar 2021 00:52:53 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 407F55D9DE;
	Fri, 26 Mar 2021 00:52:50 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 12Q0qmvg010267; 
	Thu, 25 Mar 2021 19:52:49 -0500
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 12Q0qmkm010266;
	Thu, 25 Mar 2021 19:52:48 -0500
From: Benjamin Marzinski <bmarzins@redhat.com>
To: Christophe Varoqui <christophe.varoqui@opensvc.com>
Date: Thu, 25 Mar 2021 19:52:44 -0500
Message-Id: <1616719966-10221-3-git-send-email-bmarzins@redhat.com>
In-Reply-To: <1616719966-10221-1-git-send-email-bmarzins@redhat.com>
References: <1616719966-10221-1-git-send-email-bmarzins@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: dm-devel@redhat.com
Cc: device-mapper development <dm-devel@redhat.com>,
	Martin Wilck <Martin.Wilck@suse.com>
Subject: [dm-devel] [PATCH 2/4] libmultipath: fix priorities in
	parse_vpd_pg83
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
MIME-Version: 1.0
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The priorities for the EUI-64 (0x02) and NAME (0x08) scsi identifiers in
parse_vpd_pg83() don't match their priorities in 55-scsi-sg3_id.rules.
Switch them so that they match.

Signed-off-by: Benjamin Marzinski <bmarzins@redhat.com>
---
 libmultipath/discovery.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/libmultipath/discovery.c b/libmultipath/discovery.c
index 5727f7a6..f8044141 100644
--- a/libmultipath/discovery.c
+++ b/libmultipath/discovery.c
@@ -1152,19 +1152,19 @@ parse_vpd_pg83(const unsigned char *in, size_t in_len,
 				vpd = d;
 			}
 			break;
-		case 0x8:
-			/* SCSI Name: Prio 4 */
-			if (memcmp(d + 4, "eui.", 4) &&
-			    memcmp(d + 4, "naa.", 4) &&
-			    memcmp(d + 4, "iqn.", 4))
-				break;
+		case 0x2:
+			/* EUI-64: Prio 4 */
 			if (prio < 4) {
 				prio = 4;
 				vpd = d;
 			}
 			break;
-		case 0x2:
-			/* EUI-64: Prio 3 */
+		case 0x8:
+			/* SCSI Name: Prio 3 */
+			if (memcmp(d + 4, "eui.", 4) &&
+			    memcmp(d + 4, "naa.", 4) &&
+			    memcmp(d + 4, "iqn.", 4))
+				break;
 			if (prio < 3) {
 				prio = 3;
 				vpd = d;
-- 
2.17.2

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

