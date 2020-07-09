Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 3E982219D91
	for <lists+dm-devel@lfdr.de>; Thu,  9 Jul 2020 12:20:31 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-259-h4Gig767M3u9jEsUS0RYZg-1; Thu, 09 Jul 2020 06:20:28 -0400
X-MC-Unique: h4Gig767M3u9jEsUS0RYZg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 71DE8107B0F3;
	Thu,  9 Jul 2020 10:20:20 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2244010016DA;
	Thu,  9 Jul 2020 10:20:20 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 7525C93F81;
	Thu,  9 Jul 2020 10:20:19 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 069AKGRi030206 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 9 Jul 2020 06:20:16 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id E394E2026D67; Thu,  9 Jul 2020 10:20:15 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DF31E208DD8A
	for <dm-devel@redhat.com>; Thu,  9 Jul 2020 10:20:13 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id ADBE010DCE81
	for <dm-devel@redhat.com>; Thu,  9 Jul 2020 10:20:13 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-97-WyzIqHwtOi2RTUnirXbi6w-1;
	Thu, 09 Jul 2020 06:20:09 -0400
X-MC-Unique: WyzIqHwtOi2RTUnirXbi6w-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id A6CBCB077;
	Thu,  9 Jul 2020 10:20:07 +0000 (UTC)
From: mwilck@suse.com
To: Christophe Varoqui <christophe.varoqui@opensvc.com>,
	Benjamin Marzinski <bmarzins@redhat.com>
Date: Thu,  9 Jul 2020 12:19:50 +0200
Message-Id: <20200709101952.7285-3-mwilck@suse.com>
In-Reply-To: <20200709101952.7285-1-mwilck@suse.com>
References: <20200709101952.7285-1-mwilck@suse.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 069AKGRi030206
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com, Martin Wilck <mwilck@suse.com>
Subject: [dm-devel] [PATCH 37/39] libmultipath: improve logging for
	dev_loss_tmo override
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Martin Wilck <mwilck@suse.com>

Print a more meaningful warning message, and at higher level, if
the configured dev_loss_tmo can't be applied because it conflicts
with no_path_retry.

Signed-off-by: Martin Wilck <mwilck@suse.com>
---
 libmultipath/discovery.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/libmultipath/discovery.c b/libmultipath/discovery.c
index f7d6672..e2aea81 100644
--- a/libmultipath/discovery.c
+++ b/libmultipath/discovery.c
@@ -774,14 +774,15 @@ sysfs_set_scsi_tmo (struct multipath *mpp, unsigned int checkint)
 			no_path_retry_tmo = MAX_DEV_LOSS_TMO;
 		if (no_path_retry_tmo > dev_loss_tmo)
 			dev_loss_tmo = no_path_retry_tmo;
-		condlog(3, "%s: update dev_loss_tmo to %u",
-			mpp->alias, dev_loss_tmo);
 	} else if (mpp->no_path_retry == NO_PATH_RETRY_QUEUE) {
 		dev_loss_tmo = MAX_DEV_LOSS_TMO;
-		condlog(3, "%s: update dev_loss_tmo to %u",
-			mpp->alias, dev_loss_tmo);
 	}
-	mpp->dev_loss = dev_loss_tmo;
+	if (mpp->dev_loss != DEV_LOSS_TMO_UNSET &&
+	    mpp->dev_loss != dev_loss_tmo) {
+		condlog(2, "%s: Using dev_loss_tmo=%u instead of %u because of no_path_retry setting",
+			mpp->alias, dev_loss_tmo, mpp->dev_loss);
+		mpp->dev_loss = dev_loss_tmo;
+	}
 	if (mpp->dev_loss != DEV_LOSS_TMO_UNSET &&
 	    mpp->fast_io_fail != MP_FAST_IO_FAIL_UNSET &&
 	    (unsigned int)mpp->fast_io_fail >= mpp->dev_loss) {
-- 
2.26.2


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

