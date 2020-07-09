Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id CEB49219DA0
	for <lists+dm-devel@lfdr.de>; Thu,  9 Jul 2020 12:21:58 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-139-YV2OIaMINRSkd2f8GR7n-w-1; Thu, 09 Jul 2020 06:21:55 -0400
X-MC-Unique: YV2OIaMINRSkd2f8GR7n-w-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5FC33E91E;
	Thu,  9 Jul 2020 10:21:50 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3C9942C26B;
	Thu,  9 Jul 2020 10:21:50 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id F040093F85;
	Thu,  9 Jul 2020 10:21:49 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 069AKGsq030212 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 9 Jul 2020 06:20:16 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 5157A2156A54; Thu,  9 Jul 2020 10:20:16 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4D3332157F24
	for <dm-devel@redhat.com>; Thu,  9 Jul 2020 10:20:15 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2159A185A797
	for <dm-devel@redhat.com>; Thu,  9 Jul 2020 10:20:15 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-481-Cm4MjsUdOnqQGVYCZgGZhw-1;
	Thu, 09 Jul 2020 06:20:09 -0400
X-MC-Unique: Cm4MjsUdOnqQGVYCZgGZhw-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 7268FB071;
	Thu,  9 Jul 2020 10:20:07 +0000 (UTC)
From: mwilck@suse.com
To: Christophe Varoqui <christophe.varoqui@opensvc.com>,
	Benjamin Marzinski <bmarzins@redhat.com>
Date: Thu,  9 Jul 2020 12:19:49 +0200
Message-Id: <20200709101952.7285-2-mwilck@suse.com>
In-Reply-To: <20200709101952.7285-1-mwilck@suse.com>
References: <20200709101952.7285-1-mwilck@suse.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 069AKGsq030212
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com, Martin Wilck <mwilck@suse.com>
Subject: [dm-devel] [PATCH 36/39] libmultipath: add macro DEV_LOSS_TMO_UNSET
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

The special value 0 means "unset" for dev_loss. Make this more
explicit by using a macro.

Signed-off-by: Martin Wilck <mwilck@suse.com>
---
 libmultipath/defaults.h  |  1 +
 libmultipath/dict.c      |  4 ++--
 libmultipath/discovery.c | 12 +++++++-----
 libmultipath/propsel.c   |  2 +-
 4 files changed, 11 insertions(+), 8 deletions(-)

diff --git a/libmultipath/defaults.h b/libmultipath/defaults.h
index 0574e8f..39a5e41 100644
--- a/libmultipath/defaults.h
+++ b/libmultipath/defaults.h
@@ -58,6 +58,7 @@
 #define CHECKINT_UNDEF		UINT_MAX
 #define DEFAULT_CHECKINT	5
 
+#define DEV_LOSS_TMO_UNSET	0U
 #define MAX_DEV_LOSS_TMO	UINT_MAX
 #define DEFAULT_PIDFILE		"/" RUN_DIR "/multipathd.pid"
 #define DEFAULT_SOCKET		"/org/kernel/linux/storage/multipathd"
diff --git a/libmultipath/dict.c b/libmultipath/dict.c
index 0e9ea38..be3029c 100644
--- a/libmultipath/dict.c
+++ b/libmultipath/dict.c
@@ -873,7 +873,7 @@ set_dev_loss(vector strvec, void *ptr)
 	if (!strcmp(buff, "infinity"))
 		*uint_ptr = MAX_DEV_LOSS_TMO;
 	else if (sscanf(buff, "%u", uint_ptr) != 1)
-		*uint_ptr = 0;
+		*uint_ptr = DEV_LOSS_TMO_UNSET;
 
 	FREE(buff);
 	return 0;
@@ -882,7 +882,7 @@ set_dev_loss(vector strvec, void *ptr)
 int
 print_dev_loss(char * buff, int len, unsigned long v)
 {
-	if (!v)
+	if (v == DEV_LOSS_TMO_UNSET)
 		return 0;
 	if (v >= MAX_DEV_LOSS_TMO)
 		return snprintf(buff, len, "\"infinity\"");
diff --git a/libmultipath/discovery.c b/libmultipath/discovery.c
index 81a3fad..f7d6672 100644
--- a/libmultipath/discovery.c
+++ b/libmultipath/discovery.c
@@ -671,7 +671,7 @@ sysfs_set_rport_tmo(struct multipath *mpp, struct path *pp)
 					rport_id, value, -ret);
 		}
 	}
-	if (mpp->dev_loss > 0) {
+	if (mpp->dev_loss != DEV_LOSS_TMO_UNSET) {
 		snprintf(value, 16, "%u", mpp->dev_loss);
 		ret = sysfs_attr_set_value(rport_dev, "dev_loss_tmo",
 					   value, strlen(value));
@@ -705,7 +705,7 @@ sysfs_set_session_tmo(struct multipath *mpp, struct path *pp)
 	condlog(4, "target%d:%d:%d -> %s", pp->sg_id.host_no,
 		pp->sg_id.channel, pp->sg_id.scsi_id, session_id);
 
-	if (mpp->dev_loss) {
+	if (mpp->dev_loss != DEV_LOSS_TMO_UNSET) {
 		condlog(3, "%s: ignoring dev_loss_tmo on iSCSI", pp->dev);
 	}
 	if (mpp->fast_io_fail != MP_FAST_IO_FAIL_UNSET) {
@@ -747,7 +747,7 @@ sysfs_set_nexus_loss_tmo(struct multipath *mpp, struct path *pp)
 	condlog(4, "target%d:%d:%d -> %s", pp->sg_id.host_no,
 		pp->sg_id.channel, pp->sg_id.scsi_id, end_dev_id);
 
-	if (mpp->dev_loss) {
+	if (mpp->dev_loss != DEV_LOSS_TMO_UNSET) {
 		snprintf(value, 11, "%u", mpp->dev_loss);
 		if (sysfs_attr_set_value(sas_dev, "I_T_nexus_loss_timeout",
 					 value, strlen(value)) <= 0)
@@ -782,13 +782,15 @@ sysfs_set_scsi_tmo (struct multipath *mpp, unsigned int checkint)
 			mpp->alias, dev_loss_tmo);
 	}
 	mpp->dev_loss = dev_loss_tmo;
-	if (mpp->dev_loss && mpp->fast_io_fail > 0 &&
+	if (mpp->dev_loss != DEV_LOSS_TMO_UNSET &&
+	    mpp->fast_io_fail != MP_FAST_IO_FAIL_UNSET &&
 	    (unsigned int)mpp->fast_io_fail >= mpp->dev_loss) {
 		condlog(3, "%s: turning off fast_io_fail (%d is not smaller than dev_loss_tmo)",
 			mpp->alias, mpp->fast_io_fail);
 		mpp->fast_io_fail = MP_FAST_IO_FAIL_OFF;
 	}
-	if (!mpp->dev_loss && mpp->fast_io_fail == MP_FAST_IO_FAIL_UNSET)
+	if (mpp->dev_loss == DEV_LOSS_TMO_UNSET &&
+	    mpp->fast_io_fail == MP_FAST_IO_FAIL_UNSET)
 		return 0;
 
 	vector_foreach_slot(mpp->paths, pp, i) {
diff --git a/libmultipath/propsel.c b/libmultipath/propsel.c
index 2233527..555bd96 100644
--- a/libmultipath/propsel.c
+++ b/libmultipath/propsel.c
@@ -766,7 +766,7 @@ int select_dev_loss(struct config *conf, struct multipath *mp)
 	mp_set_ovr(dev_loss);
 	mp_set_hwe(dev_loss);
 	mp_set_conf(dev_loss);
-	mp->dev_loss = 0;
+	mp->dev_loss = DEV_LOSS_TMO_UNSET;
 	return 0;
 out:
 	print_dev_loss(buff, 12, mp->dev_loss);
-- 
2.26.2


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

