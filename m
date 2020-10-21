Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 6593C295453
	for <lists+dm-devel@lfdr.de>; Wed, 21 Oct 2020 23:40:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1603316405;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=THfIMiT5t6+9ciFii9BYp/Wjwu/q1Q0pXDIHVdjQskU=;
	b=dqyxM6+O8dqTvq51TYyD6odpo4a47ezV/RsbNIw206kvL/xRG3+FJ795l7tx0CwopZFu4S
	Jtnui7wa0jNl9FSx1jZvEubqYS5/PdNPsqJwQmNeQk6ReZkhNKssZs35ix9FqNgj2MlNmg
	OrMCodYvm9s2rkgf6jJ5lmBex9lhUdU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-95-hMauZbzHOOGlbkMQuEDA3g-1; Wed, 21 Oct 2020 17:40:02 -0400
X-MC-Unique: hMauZbzHOOGlbkMQuEDA3g-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 671C21087D69;
	Wed, 21 Oct 2020 21:39:55 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 78D625B4BC;
	Wed, 21 Oct 2020 21:39:52 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 9FDD98C7DE;
	Wed, 21 Oct 2020 21:39:43 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 09LLdYJq008781 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 21 Oct 2020 17:39:34 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id BDF1019D7C; Wed, 21 Oct 2020 21:39:34 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3020A19C78;
	Wed, 21 Oct 2020 21:39:31 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 09LLdTda028787; 
	Wed, 21 Oct 2020 16:39:30 -0500
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 09LLdTtY028786;
	Wed, 21 Oct 2020 16:39:29 -0500
From: Benjamin Marzinski <bmarzins@redhat.com>
To: Christophe Varoqui <christophe.varoqui@opensvc.com>
Date: Wed, 21 Oct 2020 16:39:25 -0500
Message-Id: <1603316366-28735-4-git-send-email-bmarzins@redhat.com>
In-Reply-To: <1603316366-28735-1-git-send-email-bmarzins@redhat.com>
References: <1603316366-28735-1-git-send-email-bmarzins@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-loop: dm-devel@redhat.com
Cc: device-mapper development <dm-devel@redhat.com>,
	Martin Wilck <Martin.Wilck@suse.com>
Subject: [dm-devel] [PATCH v3 3/4] libmultipath: add uid failback for dasd
	devices
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Add failback code to get the uid for dasd devices from sysfs. Copied
from dasdinfo

Reviewed-by: Martin Wilck <mwilck@suse.com>
Signed-off-by: Benjamin Marzinski <bmarzins@redhat.com>
---
 libmultipath/defaults.h  |  1 +
 libmultipath/discovery.c | 37 ++++++++++++++++++++++++++++++++++++-
 2 files changed, 37 insertions(+), 1 deletion(-)

diff --git a/libmultipath/defaults.h b/libmultipath/defaults.h
index 39a5e415..947ba467 100644
--- a/libmultipath/defaults.h
+++ b/libmultipath/defaults.h
@@ -8,6 +8,7 @@
  */
 #define DEFAULT_UID_ATTRIBUTE	"ID_SERIAL"
 #define DEFAULT_NVME_UID_ATTRIBUTE	"ID_WWN"
+#define DEFAULT_DASD_UID_ATTRIBUTE	"ID_UID"
 #define DEFAULT_UDEVDIR		"/dev"
 #define DEFAULT_MULTIPATHDIR	"/" LIB_STRING "/multipath"
 #define DEFAULT_SELECTOR	"service-time 0"
diff --git a/libmultipath/discovery.c b/libmultipath/discovery.c
index cbde3585..d7e8577f 100644
--- a/libmultipath/discovery.c
+++ b/libmultipath/discovery.c
@@ -1957,12 +1957,44 @@ get_vpd_uid(struct path * pp)
 	return get_vpd_sysfs(parent, 0x83, pp->wwid, WWID_SIZE);
 }
 
+/* based on code from s390-tools/dasdinfo/dasdinfo.c */
+static ssize_t dasd_get_uid(struct path *pp)
+{
+	struct udev_device *parent;
+	char value[80];
+	char *p;
+	int i;
+
+	parent = udev_device_get_parent_with_subsystem_devtype(pp->udev, "ccw",
+							       NULL);
+	if (!parent)
+		return -1;
+
+	if (sysfs_attr_get_value(parent, "uid", value, 80) < 0)
+		return -1;
+
+	p = value - 1;
+	/* look for the 4th '.' and cut there */
+	for (i = 0; i < 4; i++) {
+		p = index(p + 1, '.');
+		if (!p)
+			break;
+	}
+	if (p)
+		*p = '\0';
+
+	return strlcpy(pp->wwid, value, WWID_SIZE);
+}
+
 static ssize_t uid_fallback(struct path *pp, int path_state,
 			    const char **origin)
 {
 	ssize_t len = -1;
 
-	if (pp->bus == SYSFS_BUS_SCSI) {
+	if (pp->bus == SYSFS_BUS_CCW) {
+		len = dasd_get_uid(pp);
+		*origin = "sysfs";
+	} else if (pp->bus == SYSFS_BUS_SCSI) {
 		len = get_vpd_uid(pp);
 		*origin = "sysfs";
 		if (len < 0 && path_state == PATH_UP) {
@@ -2010,6 +2042,9 @@ static bool has_uid_fallback(struct path *pp)
 		  !strcmp(pp->uid_attribute, ""))) ||
 		(pp->bus == SYSFS_BUS_NVME &&
 		 (!strcmp(pp->uid_attribute, DEFAULT_NVME_UID_ATTRIBUTE) ||
+		  !strcmp(pp->uid_attribute, ""))) ||
+		(pp->bus == SYSFS_BUS_CCW &&
+		 (!strcmp(pp->uid_attribute, DEFAULT_DASD_UID_ATTRIBUTE) ||
 		  !strcmp(pp->uid_attribute, ""))));
 }
 
-- 
2.17.2

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

