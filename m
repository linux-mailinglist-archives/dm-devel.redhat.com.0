Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id D8D6E2772A6
	for <lists+dm-devel@lfdr.de>; Thu, 24 Sep 2020 15:39:50 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-446-nbwUZhrxPcemwhLz68qwlA-1; Thu, 24 Sep 2020 09:39:46 -0400
X-MC-Unique: nbwUZhrxPcemwhLz68qwlA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BEDDE1882FBC;
	Thu, 24 Sep 2020 13:39:36 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 95DE61972B;
	Thu, 24 Sep 2020 13:39:36 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 41B0F181A884;
	Thu, 24 Sep 2020 13:39:36 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 08ODdU1j026001 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 24 Sep 2020 09:39:30 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 2EA95100619B; Thu, 24 Sep 2020 13:39:30 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2A1D31006180
	for <dm-devel@redhat.com>; Thu, 24 Sep 2020 13:39:30 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 11D05803524
	for <dm-devel@redhat.com>; Thu, 24 Sep 2020 13:39:30 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-273-CiRyPkumPoKfmhQ_p9-Avg-1;
	Thu, 24 Sep 2020 09:39:27 -0400
X-MC-Unique: CiRyPkumPoKfmhQ_p9-Avg-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 9BF99B123;
	Thu, 24 Sep 2020 13:39:24 +0000 (UTC)
From: mwilck@suse.com
To: Christophe Varoqui <christophe.varoqui@opensvc.com>,
	Benjamin Marzinski <bmarzins@redhat.com>
Date: Thu, 24 Sep 2020 15:37:03 +0200
Message-Id: <20200924133716.14120-9-mwilck@suse.com>
In-Reply-To: <20200924133716.14120-1-mwilck@suse.com>
References: <20200924133716.14120-1-mwilck@suse.com>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 08ODdU1j026001
X-loop: dm-devel@redhat.com
Cc: Chongyun Wu <wu.chongyun@h3c.com>, dm-devel@redhat.com,
	Martin Wilck <mwilck@suse.com>
Subject: [dm-devel] [PATCH v2 08/21] multipathd: cancel threads early during
	shutdown
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Martin Wilck <mwilck@suse.com>

Cancel the other threads before taking vecs->lock. This avoids
delays during shutdown caused e.g. by the checker thread holding
the vecs lock.

Note: this makes it possible that cancelled threads leak memory,
because they can now be cancelled before having released the vecs
lock. I believe this is acceptable, as only threads are affected
that are cancelled during multipathd shutdown.

Cc: Chongyun Wu <wu.chongyun@h3c.com>
Reviewed-by: Benjamin Marzinski <bmarzins@redhat.com>
Signed-off-by: Martin Wilck <mwilck@suse.com>
---
 multipathd/main.c | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

diff --git a/multipathd/main.c b/multipathd/main.c
index 39aea4a..d1f8cc1 100644
--- a/multipathd/main.c
+++ b/multipathd/main.c
@@ -3073,23 +3073,24 @@ child (__attribute__((unused)) void *param)
 		}
 	}
 
-	lock(&vecs->lock);
+	pthread_cancel(check_thr);
+	pthread_cancel(uevent_thr);
+	pthread_cancel(uxlsnr_thr);
+	pthread_cancel(uevq_thr);
+	if (poll_dmevents)
+		pthread_cancel(dmevent_thr);
+
 	conf = get_multipath_config();
 	queue_without_daemon = conf->queue_without_daemon;
 	put_multipath_config(conf);
+
+	lock(&vecs->lock);
 	if (queue_without_daemon == QUE_NO_DAEMON_OFF)
 		vector_foreach_slot(vecs->mpvec, mpp, i)
 			dm_queue_if_no_path(mpp->alias, 0);
 	remove_maps_and_stop_waiters(vecs);
 	unlock(&vecs->lock);
 
-	pthread_cancel(check_thr);
-	pthread_cancel(uevent_thr);
-	pthread_cancel(uxlsnr_thr);
-	pthread_cancel(uevq_thr);
-	if (poll_dmevents)
-		pthread_cancel(dmevent_thr);
-
 	pthread_join(check_thr, NULL);
 	pthread_join(uevent_thr, NULL);
 	pthread_join(uxlsnr_thr, NULL);
-- 
2.28.0


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

