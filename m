Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 8E7E832375F
	for <lists+dm-devel@lfdr.de>; Wed, 24 Feb 2021 07:33:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1614148438;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=ASpNYsBTtWoZzsCpXPXi6PlKbcprjw7OQpxFjnPGoZk=;
	b=RRS6vvdFlYRu1I4JpIqLt92ENJm/lPZs8YjDbSIAIv0vvKhz5gox1ANYQ2uEgD1Urw3veA
	SjUHkgo3wYA1JUllsAt8V0P3HnttzI/qa1CShrjBF5viljE+otUTIU7lm1GrG8kztIzRy/
	FxYHdp8ua0npkny667AwOxqsl6Eh95U=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-355-UnFu77G5Puu353y8qso7qg-1; Wed, 24 Feb 2021 01:33:56 -0500
X-MC-Unique: UnFu77G5Puu353y8qso7qg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3A510801965;
	Wed, 24 Feb 2021 06:33:49 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 03DDB1001281;
	Wed, 24 Feb 2021 06:33:49 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 92C3D57DFC;
	Wed, 24 Feb 2021 06:33:42 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 11O6XYRN029060 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 24 Feb 2021 01:33:34 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id DE15E19C47; Wed, 24 Feb 2021 06:33:34 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A5DA519C46;
	Wed, 24 Feb 2021 06:33:30 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 11O6XTm6019893; 
	Wed, 24 Feb 2021 00:33:29 -0600
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 11O6XSbk019892;
	Wed, 24 Feb 2021 00:33:28 -0600
From: Benjamin Marzinski <bmarzins@redhat.com>
To: Christophe Varoqui <christophe.varoqui@opensvc.com>
Date: Wed, 24 Feb 2021 00:33:21 -0600
Message-Id: <1614148402-19847-3-git-send-email-bmarzins@redhat.com>
In-Reply-To: <1614148402-19847-1-git-send-email-bmarzins@redhat.com>
References: <1614148402-19847-1-git-send-email-bmarzins@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-loop: dm-devel@redhat.com
Cc: device-mapper development <dm-devel@redhat.com>,
	Chongyun Wu <wucy11@chinatelecom.cn>, Martin Wilck <Martin.Wilck@suse.com>
Subject: [dm-devel] [PATCH v2 2/3] libmultipath: cleanup uid_attribute
	checking code
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

In get_uid(), if pp->getuid is NULL, multipath will check the
pp->uid_attribute to get the wwid.  If pp->uid_attribute is NULL,
nothing will happen in that block of code, because both udev_available
and has_uid_fallback() are false if pp->uid_attribute is NULL. So
instead of multiple checks if pp->uid_attribute is NULL, just check once
for the code block.

Signed-off-by: Benjamin Marzinski <bmarzins@redhat.com>
---
 libmultipath/discovery.c | 17 ++++++++---------
 1 file changed, 8 insertions(+), 9 deletions(-)

diff --git a/libmultipath/discovery.c b/libmultipath/discovery.c
index 3a06f319..40727fa3 100644
--- a/libmultipath/discovery.c
+++ b/libmultipath/discovery.c
@@ -2183,22 +2183,21 @@ get_uid (struct path * pp, int path_state, struct udev_device *udev,
 		} else
 			len = strlen(pp->wwid);
 		origin = "callout";
-	} else {
-		bool valid_uid_attr = pp->uid_attribute
-			&& *pp->uid_attribute;
-		bool empty_uid_attr = pp->uid_attribute
-			&& !*pp->uid_attribute;
-		bool udev_available = udev && valid_uid_attr;
+	} else if (pp->uid_attribute) {
+		/* if the uid_attribute is an empty string skip udev checking */
+		bool check_uid_attr = udev && *pp->uid_attribute;
 
-		if (udev_available) {
+		if (check_uid_attr) {
 			len = get_udev_uid(pp, pp->uid_attribute, udev);
 			origin = "udev";
 			if (len == 0)
 				condlog(1, "%s: empty udev uid", pp->dev);
 		}
-		if ((!udev_available || (len <= 0 && allow_fallback))
+		if ((!check_uid_attr || (len <= 0 && allow_fallback))
 		    && has_uid_fallback(pp)) {
-			if (!udev || !empty_uid_attr)
+			/* if udev wasn't set or we failed in get_udev_uid()
+			 * log at a higher priority */
+			if (!udev || check_uid_attr)
 				used_fallback = 1;
 			len = uid_fallback(pp, path_state, &origin);
 		}
-- 
2.17.2

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

