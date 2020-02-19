Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id E603D163D45
	for <lists+dm-devel@lfdr.de>; Wed, 19 Feb 2020 07:51:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1582095063;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=aOTYDOnrLRAAX3HKZ17CecXI8CCRdeewcDalaiW7XjM=;
	b=YdZEi6+Ea+rJFTQsxfRlugLNQhwDNQ5qG3dJwkvdi2vcss1ht+eyuQ07E7JykC8fbAiZ7V
	4wFq9cZBDDVwYjhZYiRjmb2oHB756aZqv9P1uvYKYDQu5J/Bd1rluBQoqtTeBZ8pXHoWGm
	65xzJhNqjPZGbmOpvbfZ+Z+R7eqQmjE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-265-Iy7ZhFmTOS-ypaX_sLmR5g-1; Wed, 19 Feb 2020 01:49:43 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6A1A71902EB1;
	Wed, 19 Feb 2020 06:49:36 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3AF4890F69;
	Wed, 19 Feb 2020 06:49:36 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id B70381803C33;
	Wed, 19 Feb 2020 06:49:35 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 01J6nBEZ015983 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 19 Feb 2020 01:49:11 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 4FCEA5DA60; Wed, 19 Feb 2020 06:49:11 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 92F765D9E2;
	Wed, 19 Feb 2020 06:49:08 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 01J6n7d7009985; 
	Wed, 19 Feb 2020 00:49:07 -0600
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 01J6n6MS009984;
	Wed, 19 Feb 2020 00:49:06 -0600
From: Benjamin Marzinski <bmarzins@redhat.com>
To: Christophe Varoqui <christophe.varoqui@opensvc.com>
Date: Wed, 19 Feb 2020 00:48:38 -0600
Message-Id: <1582094920-9883-17-git-send-email-bmarzins@redhat.com>
In-Reply-To: <1582094920-9883-1-git-send-email-bmarzins@redhat.com>
References: <1582094920-9883-1-git-send-email-bmarzins@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: dm-devel@redhat.com
Cc: device-mapper development <dm-devel@redhat.com>,
	Martin Wilck <mwilck@suse.com>, Martin Wilck <Martin.Wilck@suse.com>
Subject: [dm-devel] [PATCH v3 16/18] fixup! libmultipath: add code to get
	vendor specific vpd data
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
MIME-Version: 1.0
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-MC-Unique: Iy7ZhFmTOS-ypaX_sLmR5g-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Martin Wilck <mwilck@suse.com>

Signed-off-by: Benjamin Marzinski <bmarzins@redhat.com>
---
 libmultipath/discovery.c | 2 +-
 libmultipath/propsel.c   | 2 +-
 libmultipath/propsel.h   | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/libmultipath/discovery.c b/libmultipath/discovery.c
index 33a313a2..23a7889c 100644
--- a/libmultipath/discovery.c
+++ b/libmultipath/discovery.c
@@ -1646,7 +1646,7 @@ scsi_ioctl_pathinfo (struct path * pp, int mask)
 	if (!(mask & DI_SERIAL))
 		return;
 
-	select_vpd_vendor_id(conf, pp);
+	select_vpd_vendor_id(pp);
 	vpd_id = pp->vpd_vendor_id;
 
 	if (vpd_id != VPD_VP_UNDEF && get_vpd_sgio(pp->fd, vpd_vendor_pages[vpd_id].pg, vpd_id, pp->vpd_data, sizeof(pp->vpd_data)) < 0)
diff --git a/libmultipath/propsel.c b/libmultipath/propsel.c
index 8a2d9872..897e48ca 100644
--- a/libmultipath/propsel.c
+++ b/libmultipath/propsel.c
@@ -1218,7 +1218,7 @@ out:
 	return 0;
 }
 
-int select_vpd_vendor_id (struct config *conf, struct path *pp)
+int select_vpd_vendor_id (struct path *pp)
 {
 	const char *origin;
 
diff --git a/libmultipath/propsel.h b/libmultipath/propsel.h
index 4fa08e1f..3d6edd8a 100644
--- a/libmultipath/propsel.h
+++ b/libmultipath/propsel.h
@@ -37,4 +37,4 @@ void reconcile_features_with_options(const char *id, char **features,
 				     int* no_path_retry,
 				     int *retain_hwhandler);
 int select_all_tg_pt (struct config *conf, struct multipath * mp);
-int select_vpd_vendor_id (struct config *conf, struct path *pp);
+int select_vpd_vendor_id (struct path *pp);
-- 
2.17.2

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

