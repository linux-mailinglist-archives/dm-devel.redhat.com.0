Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id B36BA2978C7
	for <lists+dm-devel@lfdr.de>; Fri, 23 Oct 2020 23:23:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1603488180;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=qY4WiXQDr+zv11m52B9gw/yM+a8XSuWwzhxeErCGEq8=;
	b=dMhGE9+tUXuyTLXIteIE2fyaMdZjMfB5CLX1sxeQTEYCyOieXmnA27HwRb3PJ8fN1RWh0a
	7baXZq4Dx1yARthQUEgP+bmzFyEODDPQmYcWAVzuTm4uFb+pluEiqK7w8yfZPbxfjlXX8L
	cc3XMepePrPxXAWRENjWm9NWpfu9Fbg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-110-GBS8mdpAP567g1WfVLdWeA-1; Fri, 23 Oct 2020 17:22:57 -0400
X-MC-Unique: GBS8mdpAP567g1WfVLdWeA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 712078049FC;
	Fri, 23 Oct 2020 21:22:52 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4B1421992D;
	Fri, 23 Oct 2020 21:22:52 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 098559230B;
	Fri, 23 Oct 2020 21:22:52 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 09NLFGKY027795 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 23 Oct 2020 17:15:16 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 1B9F910013D7; Fri, 23 Oct 2020 21:15:16 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 095B010013BD;
	Fri, 23 Oct 2020 21:15:12 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 09NLFBOK012593; 
	Fri, 23 Oct 2020 16:15:11 -0500
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 09NLFB2p012592;
	Fri, 23 Oct 2020 16:15:11 -0500
From: Benjamin Marzinski <bmarzins@redhat.com>
To: Christophe Varoqui <christophe.varoqui@opensvc.com>
Date: Fri, 23 Oct 2020 16:15:05 -0500
Message-Id: <1603487708-12547-3-git-send-email-bmarzins@redhat.com>
In-Reply-To: <1603487708-12547-1-git-send-email-bmarzins@redhat.com>
References: <1603487708-12547-1-git-send-email-bmarzins@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-loop: dm-devel@redhat.com
Cc: device-mapper development <dm-devel@redhat.com>,
	Martin Wilck <Martin.Wilck@suse.com>
Subject: [dm-devel] [PATCH 2/5] libmultipath: add eh_deadline multipath.conf
	parameter
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

There are times a fc rport is never lost, meaning that fast_io_fail_tmo
and dev_loss_tmo never trigger, but scsi commands still hang. This can
cause problems in cases where users have string timing requirements, and
the easiest way to solve these issues is to set eh_deadline. Since it's
already possible to set fast_io_fail_tmo and dev_loss_tmo from
multipath.conf, and have multipath take care of setting it correctly for
the scsi devices in sysfs, it makes sense to allow users to set
eh_deadline here as well.

Signed-off-by: Benjamin Marzinski <bmarzins@redhat.com>
---
 libmultipath/config.c      |  2 ++
 libmultipath/config.h      |  2 ++
 libmultipath/configure.c   |  1 +
 libmultipath/dict.c        | 10 ++++++
 libmultipath/discovery.c   | 70 ++++++++++++++++++++++++++++++--------
 libmultipath/propsel.c     | 17 +++++++++
 libmultipath/propsel.h     |  1 +
 libmultipath/structs.h     |  7 ++++
 multipath/multipath.conf.5 | 16 +++++++++
 9 files changed, 111 insertions(+), 15 deletions(-)

diff --git a/libmultipath/config.c b/libmultipath/config.c
index 49e7fb81..9f3cb38d 100644
--- a/libmultipath/config.c
+++ b/libmultipath/config.c
@@ -424,6 +424,7 @@ merge_hwe (struct hwentry * dst, struct hwentry * src)
 	merge_num(flush_on_last_del);
 	merge_num(fast_io_fail);
 	merge_num(dev_loss);
+	merge_num(eh_deadline);
 	merge_num(user_friendly_names);
 	merge_num(retain_hwhandler);
 	merge_num(detect_prio);
@@ -579,6 +580,7 @@ store_hwe (vector hwtable, struct hwentry * dhwe)
 	hwe->flush_on_last_del = dhwe->flush_on_last_del;
 	hwe->fast_io_fail = dhwe->fast_io_fail;
 	hwe->dev_loss = dhwe->dev_loss;
+	hwe->eh_deadline = dhwe->eh_deadline;
 	hwe->user_friendly_names = dhwe->user_friendly_names;
 	hwe->retain_hwhandler = dhwe->retain_hwhandler;
 	hwe->detect_prio = dhwe->detect_prio;
diff --git a/libmultipath/config.h b/libmultipath/config.h
index 661dd586..9ce37f16 100644
--- a/libmultipath/config.h
+++ b/libmultipath/config.h
@@ -63,6 +63,7 @@ struct hwentry {
 	int flush_on_last_del;
 	int fast_io_fail;
 	unsigned int dev_loss;
+	int eh_deadline;
 	int user_friendly_names;
 	int retain_hwhandler;
 	int detect_prio;
@@ -148,6 +149,7 @@ struct config {
 	int attribute_flags;
 	int fast_io_fail;
 	unsigned int dev_loss;
+	int eh_deadline;
 	int log_checker_err;
 	int allow_queueing;
 	int allow_usb_devices;
diff --git a/libmultipath/configure.c b/libmultipath/configure.c
index 1c8aac08..a878d870 100644
--- a/libmultipath/configure.c
+++ b/libmultipath/configure.c
@@ -368,6 +368,7 @@ int setup_map(struct multipath *mpp, char *params, int params_size,
 	select_gid(conf, mpp);
 	select_fast_io_fail(conf, mpp);
 	select_dev_loss(conf, mpp);
+	select_eh_deadline(conf, mpp);
 	select_reservation_key(conf, mpp);
 	select_deferred_remove(conf, mpp);
 	select_marginal_path_err_sample_time(conf, mpp);
diff --git a/libmultipath/dict.c b/libmultipath/dict.c
index f4357da1..bab96146 100644
--- a/libmultipath/dict.c
+++ b/libmultipath/dict.c
@@ -899,6 +899,13 @@ declare_ovr_snprint(dev_loss, print_dev_loss)
 declare_hw_handler(dev_loss, set_dev_loss)
 declare_hw_snprint(dev_loss, print_dev_loss)
 
+declare_def_handler(eh_deadline, set_undef_off_zero)
+declare_def_snprint(eh_deadline, print_undef_off_zero)
+declare_ovr_handler(eh_deadline, set_undef_off_zero)
+declare_ovr_snprint(eh_deadline, print_undef_off_zero)
+declare_hw_handler(eh_deadline, set_undef_off_zero)
+declare_hw_snprint(eh_deadline, print_undef_off_zero)
+
 static int
 set_pgpolicy(vector strvec, void *ptr)
 {
@@ -1771,6 +1778,7 @@ init_keywords(vector keywords)
 	install_keyword("gid", &def_gid_handler, &snprint_def_gid);
 	install_keyword("fast_io_fail_tmo", &def_fast_io_fail_handler, &snprint_def_fast_io_fail);
 	install_keyword("dev_loss_tmo", &def_dev_loss_handler, &snprint_def_dev_loss);
+	install_keyword("eh_deadline", &def_eh_deadline_handler, &snprint_def_eh_deadline);
 	install_keyword("bindings_file", &def_bindings_file_handler, &snprint_def_bindings_file);
 	install_keyword("wwids_file", &def_wwids_file_handler, &snprint_def_wwids_file);
 	install_keyword("prkeys_file", &def_prkeys_file_handler, &snprint_def_prkeys_file);
@@ -1880,6 +1888,7 @@ init_keywords(vector keywords)
 	install_keyword("flush_on_last_del", &hw_flush_on_last_del_handler, &snprint_hw_flush_on_last_del);
 	install_keyword("fast_io_fail_tmo", &hw_fast_io_fail_handler, &snprint_hw_fast_io_fail);
 	install_keyword("dev_loss_tmo", &hw_dev_loss_handler, &snprint_hw_dev_loss);
+	install_keyword("eh_deadline", &hw_eh_deadline_handler, &snprint_hw_eh_deadline);
 	install_keyword("user_friendly_names", &hw_user_friendly_names_handler, &snprint_hw_user_friendly_names);
 	install_keyword("retain_attached_hw_handler", &hw_retain_hwhandler_handler, &snprint_hw_retain_hwhandler);
 	install_keyword("detect_prio", &hw_detect_prio_handler, &snprint_hw_detect_prio);
@@ -1920,6 +1929,7 @@ init_keywords(vector keywords)
 	install_keyword("flush_on_last_del", &ovr_flush_on_last_del_handler, &snprint_ovr_flush_on_last_del);
 	install_keyword("fast_io_fail_tmo", &ovr_fast_io_fail_handler, &snprint_ovr_fast_io_fail);
 	install_keyword("dev_loss_tmo", &ovr_dev_loss_handler, &snprint_ovr_dev_loss);
+	install_keyword("eh_deadline", &ovr_eh_deadline_handler, &snprint_ovr_eh_deadline);
 	install_keyword("user_friendly_names", &ovr_user_friendly_names_handler, &snprint_ovr_user_friendly_names);
 	install_keyword("retain_attached_hw_handler", &ovr_retain_hwhandler_handler, &snprint_ovr_retain_hwhandler);
 	install_keyword("detect_prio", &ovr_detect_prio_handler, &snprint_ovr_detect_prio);
diff --git a/libmultipath/discovery.c b/libmultipath/discovery.c
index 950b1586..ef9a9a23 100644
--- a/libmultipath/discovery.c
+++ b/libmultipath/discovery.c
@@ -585,6 +585,42 @@ sysfs_get_asymmetric_access_state(struct path *pp, char *buff, int buflen)
 	return !!preferred;
 }
 
+static int
+sysfs_set_eh_deadline(struct multipath *mpp, struct path *pp)
+{
+	struct udev_device *hostdev;
+	char host_name[HOST_NAME_LEN], value[16];
+	int ret;
+
+	if (mpp->eh_deadline == EH_DEADLINE_UNSET)
+		return 0;
+
+	sprintf(host_name, "host%d", pp->sg_id.host_no);
+	hostdev = udev_device_new_from_subsystem_sysname(udev,
+			"scsi_host", host_name);
+	if (!hostdev)
+		return 1;
+
+	if (mpp->eh_deadline == EH_DEADLINE_OFF)
+		sprintf(value, "off");
+	else if (mpp->eh_deadline == EH_DEADLINE_ZERO)
+		sprintf(value, "0");
+	else
+		snprintf(value, 16, "%u", mpp->eh_deadline);
+
+	ret = sysfs_attr_set_value(hostdev, "eh_deadline",
+				   value, strlen(value));
+	/*
+	 * not all scsi drivers support setting eh_deadline, so failing
+	 * is totally reasonable
+	 */
+	if (ret <= 0)
+		condlog(4, "%s: failed to set eh_deadline to %s, error %d", udev_device_get_sysname(hostdev), value, -ret);
+
+	udev_device_unref(hostdev);
+	return (ret <= 0);
+}
+
 static void
 sysfs_set_rport_tmo(struct multipath *mpp, struct path *pp)
 {
@@ -799,7 +835,8 @@ sysfs_set_scsi_tmo (struct multipath *mpp, unsigned int checkint)
 		mpp->fast_io_fail = MP_FAST_IO_FAIL_OFF;
 	}
 	if (mpp->dev_loss == DEV_LOSS_TMO_UNSET &&
-	    mpp->fast_io_fail == MP_FAST_IO_FAIL_UNSET)
+	    mpp->fast_io_fail == MP_FAST_IO_FAIL_UNSET &&
+	    mpp->eh_deadline == EH_DEADLINE_UNSET)
 		return 0;
 
 	vector_foreach_slot(mpp->paths, pp, i) {
@@ -808,21 +845,24 @@ sysfs_set_scsi_tmo (struct multipath *mpp, unsigned int checkint)
 				err_path = pp;
 			continue;
 		}
-
-		switch (pp->sg_id.proto_id) {
-		case SCSI_PROTOCOL_FCP:
-			sysfs_set_rport_tmo(mpp, pp);
-			continue;
-		case SCSI_PROTOCOL_ISCSI:
-			sysfs_set_session_tmo(mpp, pp);
-			continue;
-		case SCSI_PROTOCOL_SAS:
-			sysfs_set_nexus_loss_tmo(mpp, pp);
-			continue;
-		default:
-			if (!err_path)
-				err_path = pp;
+		if (mpp->dev_loss != DEV_LOSS_TMO_UNSET ||
+		    mpp->fast_io_fail != MP_FAST_IO_FAIL_UNSET) {
+			switch (pp->sg_id.proto_id) {
+			case SCSI_PROTOCOL_FCP:
+				sysfs_set_rport_tmo(mpp, pp);
+				break;
+			case SCSI_PROTOCOL_ISCSI:
+				sysfs_set_session_tmo(mpp, pp);
+				break;
+			case SCSI_PROTOCOL_SAS:
+				sysfs_set_nexus_loss_tmo(mpp, pp);
+				break;
+			default:
+				if (!err_path)
+					err_path = pp;
+			}
 		}
+		sysfs_set_eh_deadline(mpp, pp);
 	}
 
 	if (err_path) {
diff --git a/libmultipath/propsel.c b/libmultipath/propsel.c
index 67d025cf..fa4ac5d9 100644
--- a/libmultipath/propsel.c
+++ b/libmultipath/propsel.c
@@ -775,6 +775,23 @@ out:
 	return 0;
 }
 
+int select_eh_deadline(struct config *conf, struct multipath *mp)
+{
+	const char *origin;
+	char buff[12];
+
+	mp_set_ovr(eh_deadline);
+	mp_set_hwe(eh_deadline);
+	mp_set_conf(eh_deadline);
+	mp->eh_deadline = EH_DEADLINE_UNSET;
+	/* not changing sysfs in default cause, so don't print anything */
+	return 0;
+out:
+	print_undef_off_zero(buff, 12, mp->eh_deadline);
+	condlog(3, "%s: eh_deadline = %s %s", mp->alias, buff, origin);
+	return 0;
+}
+
 int select_flush_on_last_del(struct config *conf, struct multipath *mp)
 {
 	const char *origin;
diff --git a/libmultipath/propsel.h b/libmultipath/propsel.h
index 3d6edd8a..a68bacf0 100644
--- a/libmultipath/propsel.h
+++ b/libmultipath/propsel.h
@@ -17,6 +17,7 @@ int select_uid(struct config *conf, struct multipath *mp);
 int select_gid(struct config *conf, struct multipath *mp);
 int select_fast_io_fail(struct config *conf, struct multipath *mp);
 int select_dev_loss(struct config *conf, struct multipath *mp);
+int select_eh_deadline(struct config *conf, struct multipath *mp);
 int select_reservation_key(struct config *conf, struct multipath *mp);
 int select_retain_hwhandler (struct config *conf, struct multipath * mp);
 int select_detect_prio(struct config *conf, struct path * pp);
diff --git a/libmultipath/structs.h b/libmultipath/structs.h
index cfa7b649..d6ff6762 100644
--- a/libmultipath/structs.h
+++ b/libmultipath/structs.h
@@ -236,6 +236,12 @@ enum fast_io_fail_states {
 	MP_FAST_IO_FAIL_ZERO = UOZ_ZERO,
 };
 
+enum eh_deadline_states {
+	EH_DEADLINE_UNSET = UOZ_UNDEF,
+	EH_DEADLINE_OFF = UOZ_OFF,
+	EH_DEADLINE_ZERO = UOZ_ZERO,
+};
+
 struct vpd_vendor_page {
 	int pg;
 	const char *name;
@@ -356,6 +362,7 @@ struct multipath {
 	int ghost_delay;
 	int ghost_delay_tick;
 	unsigned int dev_loss;
+	int eh_deadline;
 	uid_t uid;
 	gid_t gid;
 	mode_t mode;
diff --git a/multipath/multipath.conf.5 b/multipath/multipath.conf.5
index d2101ed6..cf05c1ab 100644
--- a/multipath/multipath.conf.5
+++ b/multipath/multipath.conf.5
@@ -717,6 +717,22 @@ The default is: \fB600\fR
 .
 .
 .TP
+.B eh_deadline
+Specify the maximum number of seconds the SCSI layer will spend doing error
+handling when scsi devices fail. After this timeout the scsi layer will perform
+a full HBA reset. Setting this may be necessary in cases where the rport is
+never lost, so \fIfast_io_fail_tmo\fR and \fIdev_loss_tmo\fR will never
+trigger, but (frequently do to load) scsi commands still hang. \fBNote:\fR when
+the scsi error handler performs the HBA reset, all target paths on that HBA
+will be affected. eh_deadline should only be set in cases where all targets on
+the affected HBAs are multipathed.
+.RS
+.TP
+The default is: \fB<unset>\fR
+.RE
+.
+.
+.TP
 .B bindings_file
 The full pathname of the binding file to be used when the user_friendly_names
 option is set.
-- 
2.17.2

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

