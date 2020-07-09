Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 94F01219D80
	for <lists+dm-devel@lfdr.de>; Thu,  9 Jul 2020 12:17:53 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-19-_CpU_H0wMvKgD_uHrJl_0A-1; Thu, 09 Jul 2020 06:17:50 -0400
X-MC-Unique: _CpU_H0wMvKgD_uHrJl_0A-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9F3CB1081;
	Thu,  9 Jul 2020 10:17:40 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7D4776FEE2;
	Thu,  9 Jul 2020 10:17:40 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 3962793F95;
	Thu,  9 Jul 2020 10:17:40 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 069AH5O7029589 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 9 Jul 2020 06:17:05 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 6AFBE2157F25; Thu,  9 Jul 2020 10:17:05 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 66E9C217B43B
	for <dm-devel@redhat.com>; Thu,  9 Jul 2020 10:17:05 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 378A08001E6
	for <dm-devel@redhat.com>; Thu,  9 Jul 2020 10:17:05 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-476-wDRBMOh8MUyh4yO5XtG2GA-1;
	Thu, 09 Jul 2020 06:16:59 -0400
X-MC-Unique: wDRBMOh8MUyh4yO5XtG2GA-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id E888CB083;
	Thu,  9 Jul 2020 10:16:57 +0000 (UTC)
From: mwilck@suse.com
To: Christophe Varoqui <christophe.varoqui@opensvc.com>,
	Benjamin Marzinski <bmarzins@redhat.com>
Date: Thu,  9 Jul 2020 12:16:18 +0200
Message-Id: <20200709101620.6786-34-mwilck@suse.com>
In-Reply-To: <20200709101620.6786-1-mwilck@suse.com>
References: <20200709101620.6786-1-mwilck@suse.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 069AH5O7029589
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com, Martin Wilck <mwilck@suse.com>
Subject: [dm-devel] [PATCH 33/35] multipathd: remove set_multipath_wwid()
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Martin Wilck <mwilck@suse.com>

This function was only called from one place. Making the dm_get_uuid
call explicit there makes the code more obvious.

Signed-off-by: Martin Wilck <mwilck@suse.com>
---
 multipathd/main.c | 14 ++++----------
 1 file changed, 4 insertions(+), 10 deletions(-)

diff --git a/multipathd/main.c b/multipathd/main.c
index f014d2a..40c050b 100644
--- a/multipathd/main.c
+++ b/multipathd/main.c
@@ -400,15 +400,6 @@ remove_maps_and_stop_waiters(struct vectors *vecs)
 	remove_maps(vecs);
 }
 
-static void
-set_multipath_wwid (struct multipath * mpp)
-{
-	if (strlen(mpp->wwid))
-		return;
-
-	dm_get_uuid(mpp->alias, mpp->wwid, WWID_SIZE);
-}
-
 int __setup_multipath(struct vectors *vecs, struct multipath *mpp,
 		      int reset)
 {
@@ -552,7 +543,10 @@ add_map_without_path (struct vectors *vecs, const char *alias)
 		condlog(3, "%s: cannot access table", mpp->alias);
 		goto out;
 	}
-	set_multipath_wwid(mpp);
+	if (!strlen(mpp->wwid))
+		dm_get_uuid(mpp->alias, mpp->wwid, WWID_SIZE);
+	if (!strlen(mpp->wwid))
+		condlog(1, "%s: adding map with empty WWID", mpp->alias);
 	conf = get_multipath_config();
 	mpp->mpe = find_mpe(conf->mptable, mpp->wwid);
 	put_multipath_config(conf);
-- 
2.26.2


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

