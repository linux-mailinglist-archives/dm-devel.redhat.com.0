Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 484D0323761
	for <lists+dm-devel@lfdr.de>; Wed, 24 Feb 2021 07:34:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1614148444;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=Vq5ULADlEZ4nnwj2Pjd75/uPeko91hvprCla0voeY4s=;
	b=hharL63u5kpWtFFX8h5289Cm3P5qhe7LD2bFVCMCwcUJ39q3RG3bC3XHY6cEwMIrXbyODx
	A6VTW16xEtOZXbhYxIwbaqHUTFPn/dk3HIZHDZXeOBGeVC346mN+US7vS/uS1YkfH3PAoW
	YPjLJrf610NAT2gNE3Ox/nlksIP0WXI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-7-UwHpFRgbODyESV-PSVWGQw-1; Wed, 24 Feb 2021 01:33:54 -0500
X-MC-Unique: UwHpFRgbODyESV-PSVWGQw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EB2D7195D568;
	Wed, 24 Feb 2021 06:33:48 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A4DF25D74A;
	Wed, 24 Feb 2021 06:33:47 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 2129018095CB;
	Wed, 24 Feb 2021 06:33:43 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 11O6XYLN029055 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 24 Feb 2021 01:33:34 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 0BD835D6A1; Wed, 24 Feb 2021 06:33:34 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6C26B6362B;
	Wed, 24 Feb 2021 06:33:29 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 11O6XSVe019889; 
	Wed, 24 Feb 2021 00:33:28 -0600
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 11O6XRvf019888;
	Wed, 24 Feb 2021 00:33:27 -0600
From: Benjamin Marzinski <bmarzins@redhat.com>
To: Christophe Varoqui <christophe.varoqui@opensvc.com>
Date: Wed, 24 Feb 2021 00:33:20 -0600
Message-Id: <1614148402-19847-2-git-send-email-bmarzins@redhat.com>
In-Reply-To: <1614148402-19847-1-git-send-email-bmarzins@redhat.com>
References: <1614148402-19847-1-git-send-email-bmarzins@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: dm-devel@redhat.com
Cc: device-mapper development <dm-devel@redhat.com>,
	Chongyun Wu <wucy11@chinatelecom.cn>, Martin Wilck <Martin.Wilck@suse.com>
Subject: [dm-devel] [PATCH v2 1/3] libmultipath: cleanup code to strip wwid
	trailing spaces
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Signed-off-by: Benjamin Marzinski <bmarzins@redhat.com>
---
 libmultipath/discovery.c | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/libmultipath/discovery.c b/libmultipath/discovery.c
index 9be94cd1..3a06f319 100644
--- a/libmultipath/discovery.c
+++ b/libmultipath/discovery.c
@@ -2152,11 +2152,11 @@ int
 get_uid (struct path * pp, int path_state, struct udev_device *udev,
 	 int allow_fallback)
 {
-	char *c;
 	const char *origin = "unknown";
 	ssize_t len = 0;
 	struct config *conf;
 	int used_fallback = 0;
+	size_t i;
 
 	if (!pp->uid_attribute && !pp->getuid) {
 		conf = get_multipath_config();
@@ -2210,12 +2210,9 @@ get_uid (struct path * pp, int path_state, struct udev_device *udev,
 		return 1;
 	} else {
 		/* Strip any trailing blanks */
-		c = strchr(pp->wwid, '\0');
-		c--;
-		while (c && c >= pp->wwid && *c == ' ') {
-			*c = '\0';
-			c--;
-		}
+		for (i = strlen(pp->wwid); i > 0 && pp->wwid[i-1] == ' '; i--);
+			/* no-op */
+		pp->wwid[i] = '\0';
 	}
 	condlog((used_fallback)? 1 : 3, "%s: uid = %s (%s)", pp->dev,
 		*pp->wwid == '\0' ? "<empty>" : pp->wwid, origin);
-- 
2.17.2

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

