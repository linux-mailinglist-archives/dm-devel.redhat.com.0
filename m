Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 361EB213084
	for <lists+dm-devel@lfdr.de>; Fri,  3 Jul 2020 02:39:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1593736743;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=jbBrZ8NTnyYSmUnQ3DCgaziks0S4Z7hdTJnmQvRX//M=;
	b=IJXm/7oGBBXYsTyRYzlKPo4xsimf1/pkC6u394eXfxMjQv0fw0Tq53dYK9Q+0xs3lJf9+o
	4GtAZAuEiCHWc4DyLyb+aJajYIZVVS29gg+oZSFxOwngFwUQehVuqt4P7cE84+Hab/IPat
	CuumIFoP2sgvh0/YLFn6CMuICtg4EUU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-192-mVyfR6vFPUab-AufFQ6J2g-1; Thu, 02 Jul 2020 20:38:55 -0400
X-MC-Unique: mVyfR6vFPUab-AufFQ6J2g-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 39352800405;
	Fri,  3 Jul 2020 00:38:50 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1BB6376120;
	Fri,  3 Jul 2020 00:38:50 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id D1F116C9CB;
	Fri,  3 Jul 2020 00:38:49 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0630caAY019310 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 2 Jul 2020 20:38:36 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 5975A73FE9; Fri,  3 Jul 2020 00:38:36 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7CE6C73FD1;
	Fri,  3 Jul 2020 00:38:33 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 0630cWuL014270; 
	Thu, 2 Jul 2020 19:38:32 -0500
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 0630cVfR014269;
	Thu, 2 Jul 2020 19:38:31 -0500
From: Benjamin Marzinski <bmarzins@redhat.com>
To: Christophe Varoqui <christophe.varoqui@opensvc.com>
Date: Thu,  2 Jul 2020 19:38:27 -0500
Message-Id: <1593736707-14216-5-git-send-email-bmarzins@redhat.com>
In-Reply-To: <1593736707-14216-1-git-send-email-bmarzins@redhat.com>
References: <1593736707-14216-1-git-send-email-bmarzins@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: dm-devel@redhat.com
Cc: device-mapper development <dm-devel@redhat.com>,
	Martin Wilck <Martin.Wilck@suse.com>
Subject: [dm-devel] [PATCH v2 4/4] libmultipath: fix checker detection for
	nvme devices
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

In order to fix hwhandler autodetection, commit 8794a776 made
detect_alua() differentiate between failures to detect whether alua was
supported, and successfully detecting that it was not supported.
However, this causes nvme devices to get the TUR checker assigned to
them. This is because there is nothing in detect_alua() to make it only
work on scsi devices, and select_checker wasn't updated to handle
detect_alua() failing without setting pp->tpgs to TPGS_NONE.

detect_alua() should automatically set pp->tpgs to TPGS_NONE and exit on
non-scsi devices. Also, select_checker() should not assume that a
devices is ALUA, simply because if failed to detect if alua was
supported.

Fixes: 8794a776 "libmultipath: fix ALUA autodetection when paths are
                 down"
Reviewed-by: Martin Wilck <mwilck@suse.com>
Signed-off-by: Benjamin Marzinski <bmarzins@redhat.com>
---
 libmultipath/discovery.c | 6 ++++++
 libmultipath/propsel.c   | 4 +++-
 2 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/libmultipath/discovery.c b/libmultipath/discovery.c
index 83a41a4a..aa5942c3 100644
--- a/libmultipath/discovery.c
+++ b/libmultipath/discovery.c
@@ -887,6 +887,12 @@ detect_alua(struct path * pp)
 	int tpgs;
 	unsigned int timeout;
 
+
+	if (pp->bus != SYSFS_BUS_SCSI) {
+		pp->tpgs = TPGS_NONE;
+		return;
+	}
+
 	if (sysfs_get_timeout(pp, &timeout) <= 0)
 		timeout = DEF_TIMEOUT;
 
diff --git a/libmultipath/propsel.c b/libmultipath/propsel.c
index 897e48ca..d362beb4 100644
--- a/libmultipath/propsel.c
+++ b/libmultipath/propsel.c
@@ -521,7 +521,9 @@ int select_checker(struct config *conf, struct path *pp)
 		if (check_rdac(pp)) {
 			ckr_name = RDAC;
 			goto out;
-		} else if (path_get_tpgs(pp) != TPGS_NONE) {
+		}
+		path_get_tpgs(pp);
+		if (pp->tpgs != TPGS_NONE && pp->tpgs != TPGS_UNDEF) {
 			ckr_name = TUR;
 			goto out;
 		}
-- 
2.17.2

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

