Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 9CB37219D7C
	for <lists+dm-devel@lfdr.de>; Thu,  9 Jul 2020 12:17:50 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-99-A4gkEPwiOi2saBKs_5H78g-1; Thu, 09 Jul 2020 06:17:47 -0400
X-MC-Unique: A4gkEPwiOi2saBKs_5H78g-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0D9C31083E91;
	Thu,  9 Jul 2020 10:17:35 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DFBC95C3E7;
	Thu,  9 Jul 2020 10:17:34 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 9813A180530C;
	Thu,  9 Jul 2020 10:17:34 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 069AH07N029453 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 9 Jul 2020 06:17:01 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id D507F2026D69; Thu,  9 Jul 2020 10:17:00 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D12092026D67
	for <dm-devel@redhat.com>; Thu,  9 Jul 2020 10:17:00 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AF64F800A13
	for <dm-devel@redhat.com>; Thu,  9 Jul 2020 10:17:00 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-216-pty-YynfPC2wNhBwBUMovQ-1;
	Thu, 09 Jul 2020 06:16:57 -0400
X-MC-Unique: pty-YynfPC2wNhBwBUMovQ-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 0FEB0B0A5;
	Thu,  9 Jul 2020 10:16:55 +0000 (UTC)
From: mwilck@suse.com
To: Christophe Varoqui <christophe.varoqui@opensvc.com>,
	Benjamin Marzinski <bmarzins@redhat.com>
Date: Thu,  9 Jul 2020 12:16:04 +0200
Message-Id: <20200709101620.6786-20-mwilck@suse.com>
In-Reply-To: <20200709101620.6786-1-mwilck@suse.com>
References: <20200709101620.6786-1-mwilck@suse.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 069AH07N029453
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com, Martin Wilck <mwilck@suse.com>
Subject: [dm-devel] [PATCH 19/35] libmultipath: uevent: inline trivial
	functions
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Martin Wilck <mwilck@suse.com>

Export rather the not-quite-as-trivial getter functions, and
convert the accessors to inline wrappers.

Signed-off-by: Martin Wilck <mwilck@suse.com>
---
 libmultipath/uevent.c | 34 ++--------------------------------
 libmultipath/uevent.h | 41 +++++++++++++++++++++++++++++++++++------
 2 files changed, 37 insertions(+), 38 deletions(-)

diff --git a/libmultipath/uevent.c b/libmultipath/uevent.c
index d74389e..d3061bf 100644
--- a/libmultipath/uevent.c
+++ b/libmultipath/uevent.c
@@ -136,7 +136,7 @@ invalid:
 	return NULL;
 }
 
-static int uevent_get_env_positive_int(const struct uevent *uev,
+int uevent_get_env_positive_int(const struct uevent *uev,
 				       const char *attr)
 {
 	const char *p = uevent_get_env_var(uev, attr);
@@ -657,22 +657,7 @@ out_udev:
 	return err;
 }
 
-int uevent_get_major(const struct uevent *uev)
-{
-	return uevent_get_env_positive_int(uev, "MAJOR");
-}
-
-int uevent_get_minor(const struct uevent *uev)
-{
-	return uevent_get_env_positive_int(uev, "MINOR");
-}
-
-int uevent_get_disk_ro(const struct uevent *uev)
-{
-	return uevent_get_env_positive_int(uev, "DISK_RO");
-}
-
-static char *uevent_get_dm_str(const struct uevent *uev, char *attr)
+char *uevent_get_dm_str(const struct uevent *uev, char *attr)
 {
 	const char *tmp = uevent_get_env_var(uev, attr);
 
@@ -681,21 +666,6 @@ static char *uevent_get_dm_str(const struct uevent *uev, char *attr)
 	return strdup(tmp);
 }
 
-char *uevent_get_dm_name(const struct uevent *uev)
-{
-	return uevent_get_dm_str(uev, "DM_NAME");
-}
-
-char *uevent_get_dm_path(const struct uevent *uev)
-{
-	return uevent_get_dm_str(uev, "DM_PATH");
-}
-
-char *uevent_get_dm_action(const struct uevent *uev)
-{
-	return uevent_get_dm_str(uev, "DM_ACTION");
-}
-
 bool uevent_is_mpath(const struct uevent *uev)
 {
 	const char *uuid = uevent_get_env_var(uev, "DM_UUID");
diff --git a/libmultipath/uevent.h b/libmultipath/uevent.h
index 9a5b213..61ca1b5 100644
--- a/libmultipath/uevent.h
+++ b/libmultipath/uevent.h
@@ -30,13 +30,42 @@ int is_uevent_busy(void);
 int uevent_listen(struct udev *udev);
 int uevent_dispatch(int (*store_uev)(struct uevent *, void * trigger_data),
 		    void * trigger_data);
-int uevent_get_major(const struct uevent *uev);
-int uevent_get_minor(const struct uevent *uev);
-int uevent_get_disk_ro(const struct uevent *uev);
-char *uevent_get_dm_name(const struct uevent *uev);
-char *uevent_get_dm_path(const struct uevent *uev);
-char *uevent_get_dm_action(const struct uevent *uev);
 bool uevent_is_mpath(const struct uevent *uev);
 void uevent_get_wwid(struct uevent *uev);
 
+int uevent_get_env_positive_int(const struct uevent *uev,
+				const char *attr);
+
+static inline int uevent_get_major(const struct uevent *uev)
+{
+	return uevent_get_env_positive_int(uev, "MAJOR");
+}
+
+static inline int uevent_get_minor(const struct uevent *uev)
+{
+	return uevent_get_env_positive_int(uev, "MINOR");
+}
+
+static inline int uevent_get_disk_ro(const struct uevent *uev)
+{
+	return uevent_get_env_positive_int(uev, "DISK_RO");
+}
+
+char *uevent_get_dm_str(const struct uevent *uev, char *attr);
+
+static inline char *uevent_get_dm_name(const struct uevent *uev)
+{
+	return uevent_get_dm_str(uev, "DM_NAME");
+}
+
+static inline char *uevent_get_dm_path(const struct uevent *uev)
+{
+	return uevent_get_dm_str(uev, "DM_PATH");
+}
+
+static inline char *uevent_get_dm_action(const struct uevent *uev)
+{
+	return uevent_get_dm_str(uev, "DM_ACTION");
+}
+
 #endif /* _UEVENT_H */
-- 
2.26.2


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

