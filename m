Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 4974B1401CA
	for <lists+dm-devel@lfdr.de>; Fri, 17 Jan 2020 03:20:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1579227602;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=8LwbtlEj3/np2ZVebOsP5H02VaUIrqpF+mHZp0zKKik=;
	b=CMt+AUMXv8Myn2xnRlq4ntBvb+hl1zpO/0ZHULEDut88NXPJnRjfV7yBCAWZ3B2gdJm/Vr
	imPT1N0x0mkCua2gWd6dsFPxNb3YMAL8TRXGQNV8XodXmRrpx0hmjZ7498ZHtm25IOswiP
	Kmwk7k4bn3cOwJ/lKYN2iwwaG0I4dT8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-100-wqMqgxNENR2_pIfUNLghjQ-1; Thu, 16 Jan 2020 21:19:02 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7D378800C76;
	Fri, 17 Jan 2020 02:18:56 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 507425D9C9;
	Fri, 17 Jan 2020 02:18:56 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id D8B1B18089D7;
	Fri, 17 Jan 2020 02:18:55 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 00H2Icen030688 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 16 Jan 2020 21:18:38 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id F2D0581215; Fri, 17 Jan 2020 02:18:37 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CF59781214;
	Fri, 17 Jan 2020 02:18:37 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 00H2IaAF017273; 
	Thu, 16 Jan 2020 20:18:36 -0600
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 00H2IZZC017272;
	Thu, 16 Jan 2020 20:18:35 -0600
From: Benjamin Marzinski <bmarzins@redhat.com>
To: Christophe Varoqui <christophe.varoqui@opensvc.com>
Date: Thu, 16 Jan 2020 20:18:14 -0600
Message-Id: <1579227500-17196-10-git-send-email-bmarzins@redhat.com>
In-Reply-To: <1579227500-17196-1-git-send-email-bmarzins@redhat.com>
References: <1579227500-17196-1-git-send-email-bmarzins@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: dm-devel@redhat.com
Cc: device-mapper development <dm-devel@redhat.com>,
	Martin Wilck <Martin.Wilck@suse.com>
Subject: [dm-devel] [PATCH 09/15] libmultipath: add code to get vendor
	specific vpd data
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
X-MC-Unique: wqMqgxNENR2_pIfUNLghjQ-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

This adds the wildcard 'g' for multipath and path formatted printing,
which returns extra data from a device's vendor specific vpd page.  The
specific vendor vpd page to use, and the vendor/product id to decode it
can be set in the hwentry with vpd_vendor_pg and vpd_vendor_id. It can
be configured in the devices section of multipath.conf with the
vpd_vendor parameter. Currently, the only devices that use this are HPE
3PAR arrays, to return the Volume Name.

Signed-off-by: Benjamin Marzinski <bmarzins@redhat.com>
---
 libmultipath/config.c      |  4 ++++
 libmultipath/config.h      |  2 ++
 libmultipath/dict.c        | 34 ++++++++++++++++++++++++++++++++++
 libmultipath/discovery.c   | 34 +++++++++++++++++++++++++++++++++-
 libmultipath/hwtable.c     |  2 ++
 libmultipath/print.c       | 27 +++++++++++++++++++++++++++
 libmultipath/propsel.c     | 24 ++++++++++++++++++++++++
 libmultipath/propsel.h     |  2 ++
 libmultipath/structs.h     |  9 +++++++++
 multipath/multipath.conf.5 |  8 ++++++++
 10 files changed, 145 insertions(+), 1 deletion(-)

diff --git a/libmultipath/config.c b/libmultipath/config.c
index 85626e96..72b8d37c 100644
--- a/libmultipath/config.c
+++ b/libmultipath/config.c
@@ -369,6 +369,8 @@ merge_hwe (struct hwentry * dst, struct hwentry * src)
 	merge_num(max_sectors_kb);
 	merge_num(ghost_delay);
 	merge_num(all_tg_pt);
+	merge_num(vpd_vendor_pg);
+	merge_num(vpd_vendor_id);
 	merge_num(san_path_err_threshold);
 	merge_num(san_path_err_forget_rate);
 	merge_num(san_path_err_recovery_time);
@@ -517,6 +519,8 @@ store_hwe (vector hwtable, struct hwentry * dhwe)
 	hwe->detect_prio = dhwe->detect_prio;
 	hwe->detect_checker = dhwe->detect_checker;
 	hwe->ghost_delay = dhwe->ghost_delay;
+	hwe->vpd_vendor_pg = dhwe->vpd_vendor_pg;
+	hwe->vpd_vendor_id = dhwe->vpd_vendor_id;
 
 	if (dhwe->bl_product && !(hwe->bl_product = set_param_str(dhwe->bl_product)))
 		goto out;
diff --git a/libmultipath/config.h b/libmultipath/config.h
index e69aa07c..589146de 100644
--- a/libmultipath/config.h
+++ b/libmultipath/config.h
@@ -87,6 +87,8 @@ struct hwentry {
 	int max_sectors_kb;
 	int ghost_delay;
 	int all_tg_pt;
+	int vpd_vendor_pg;
+	int vpd_vendor_id;
 	char * bl_product;
 };
 
diff --git a/libmultipath/dict.c b/libmultipath/dict.c
index 2b046e1d..d6d8b79b 100644
--- a/libmultipath/dict.c
+++ b/libmultipath/dict.c
@@ -1366,6 +1366,39 @@ def_uxsock_timeout_handler(struct config *conf, vector strvec)
 	return 0;
 }
 
+static int
+hw_vpd_vendor_handler(struct config *conf, vector strvec)
+{
+	int rc = 0;
+	char *buff;
+
+	struct hwentry * hwe = VECTOR_LAST_SLOT(conf->hwtable);
+	if (!hwe)
+		return 1;
+
+	buff = set_value(strvec);
+	if (!buff)
+		return 1;
+	if (strcmp(buff, "hp3par") == 0) {
+		hwe->vpd_vendor_pg = 0xc0;
+		hwe->vpd_vendor_id = VPD_VP_HP3PAR;
+	} else
+		rc = 1;
+	FREE(buff);
+	return rc;
+}
+
+static int
+snprint_hw_vpd_vendor(struct config *conf, char * buff, int len,
+		      const void * data)
+{
+	const struct hwentry * hwe = (const struct hwentry *)data;
+
+	if (hwe->vpd_vendor_pg == 0xc0 && hwe->vpd_vendor_id == VPD_VP_HP3PAR)
+		return snprintf(buff, len, "hp3par");
+	return 0;
+}
+
 /*
  * blacklist block handlers
  */
@@ -1806,6 +1839,7 @@ init_keywords(vector keywords)
 	install_keyword("max_sectors_kb", &hw_max_sectors_kb_handler, &snprint_hw_max_sectors_kb);
 	install_keyword("ghost_delay", &hw_ghost_delay_handler, &snprint_hw_ghost_delay);
 	install_keyword("all_tg_pt", &hw_all_tg_pt_handler, &snprint_hw_all_tg_pt);
+	install_keyword("vpd_vendor", &hw_vpd_vendor_handler, &snprint_hw_vpd_vendor);
 	install_sublevel_end();
 
 	install_keyword_root("overrides", &overrides_handler);
diff --git a/libmultipath/discovery.c b/libmultipath/discovery.c
index 1d79cbae..d2773c3a 100644
--- a/libmultipath/discovery.c
+++ b/libmultipath/discovery.c
@@ -1103,6 +1103,30 @@ parse_vpd_pg83(const unsigned char *in, size_t in_len,
 	return len;
 }
 
+static int
+parse_vpd_c0_hp3par(const unsigned char *in, size_t in_len,
+		    char *out, size_t out_len)
+{
+	size_t len;
+
+	memset(out, 0x0, out_len);
+	if (in_len <= 4 || (in[4] > 3 && in_len < 44)) {
+		condlog(3, "HP/3PAR vendor specific VPD page length too short: %lu", in_len);
+		return -EINVAL;
+	}
+	if (in[4] <= 3) /* revision must be > 3 to have Vomlume Name */
+		return -ENODATA;
+	len = get_unaligned_be32(&in[40]);
+	if (len > out_len || len + 44 > in_len) {
+		condlog(3, "HP/3PAR vendor specific Volume name too long: %lu",
+			len);
+		return -EINVAL;
+	}
+	memcpy(out, &in[44], len);
+	out[out_len - 1] = '\0';
+	return len;
+}
+
 static int
 get_vpd_sysfs (struct udev_device *parent, int pg, char * str, int maxlen)
 {
@@ -1170,7 +1194,9 @@ get_vpd_sgio (int fd, int pg, int vend_id, char * str, int maxlen)
 			len = (buff_len <= maxlen)? buff_len : maxlen;
 			memcpy (str, buff, len);
 		}
-	} else
+	} else if (pg == 0xc0 && vend_id == VPD_VP_HP3PAR)
+		len = parse_vpd_c0_hp3par(buff, buff_len, str, maxlen);
+	else
 		len = -ENOSYS;
 
 	return len;
@@ -1544,6 +1570,12 @@ scsi_ioctl_pathinfo (struct path * pp, struct config *conf, int mask)
 	if (!(mask & DI_SERIAL))
 		return;
 
+	select_vpd_vendor_pg(conf, pp);
+	select_vpd_vendor_id(conf, pp);
+
+	if (pp->vpd_vendor_pg != 0 && get_vpd_sgio(pp->fd, pp->vpd_vendor_pg, pp->vpd_vendor_id, pp->vpd_data, sizeof(pp->vpd_data)) < 0)
+		condlog(3, "%s: failed to get extra vpd data", pp->dev);
+
 	parent = pp->udev;
 	while (parent) {
 		const char *subsys = udev_device_get_subsystem(parent);
diff --git a/libmultipath/hwtable.c b/libmultipath/hwtable.c
index 16627ec5..1f27450c 100644
--- a/libmultipath/hwtable.c
+++ b/libmultipath/hwtable.c
@@ -117,6 +117,8 @@ static struct hwentry default_hw[] = {
 		.no_path_retry = 18,
 		.fast_io_fail  = 10,
 		.dev_loss      = MAX_DEV_LOSS_TMO,
+		.vpd_vendor_pg = 0xc0,
+		.vpd_vendor_id = VPD_VP_HP3PAR,
 	},
 	{
 		/* RA8000 / ESA12000 */
diff --git a/libmultipath/print.c b/libmultipath/print.c
index 907469ad..0aafe3cb 100644
--- a/libmultipath/print.c
+++ b/libmultipath/print.c
@@ -358,6 +358,23 @@ snprint_action (char * buff, size_t len, const struct multipath * mpp)
 	}
 }
 
+static int
+snprint_multipath_vpd_data(char * buff, size_t len,
+			   const struct multipath * mpp)
+{
+	struct pathgroup * pgp;
+	struct path * pp;
+	int i, j;
+
+	vector_foreach_slot(mpp->pg, pgp, i) {
+		vector_foreach_slot(pgp->paths, pp, j) {
+			if (strlen(pp->vpd_data))
+				return snprintf(buff, len, "%s", pp->vpd_data);
+		}
+	}
+	return 0;
+}
+
 /*
  * path info printing functions
  */
@@ -688,6 +705,14 @@ snprint_path_marginal(char * buff, size_t len, const struct path * pp)
 	return snprintf(buff, len, "normal");
 }
 
+static int
+snprint_path_vpd_data(char * buff, size_t len, const struct path * pp)
+{
+	if (strlen(pp->vpd_data) > 0)
+		return snprintf(buff, len, "%s", pp->vpd_data);
+	return 0;
+}
+
 struct multipath_data mpd[] = {
 	{'n', "name",          0, snprint_name},
 	{'w', "uuid",          0, snprint_multipath_uuid},
@@ -712,6 +737,7 @@ struct multipath_data mpd[] = {
 	{'p', "prod",          0, snprint_multipath_prod},
 	{'e', "rev",           0, snprint_multipath_rev},
 	{'G', "foreign",       0, snprint_multipath_foreign},
+	{'g', "vpd page data", 0, snprint_multipath_vpd_data},
 	{0, NULL, 0 , NULL}
 };
 
@@ -737,6 +763,7 @@ struct path_data pd[] = {
 	{'r', "target WWPN",   0, snprint_tgt_wwpn},
 	{'a', "host adapter",  0, snprint_host_adapter},
 	{'G', "foreign",       0, snprint_path_foreign},
+	{'g', "vpd page data", 0, snprint_path_vpd_data},
 	{'0', "failures",      0, snprint_path_failures},
 	{'P', "protocol",      0, snprint_path_protocol},
 	{0, NULL, 0 , NULL}
diff --git a/libmultipath/propsel.c b/libmultipath/propsel.c
index b5b5b89f..3c99f2d4 100644
--- a/libmultipath/propsel.c
+++ b/libmultipath/propsel.c
@@ -1203,3 +1203,27 @@ out:
 		origin);
 	return 0;
 }
+
+int select_vpd_vendor_pg (struct config *conf, struct path *pp)
+{
+	const char *origin;
+
+	pp_set_hwe(vpd_vendor_pg);
+	pp_set_default(vpd_vendor_pg, 0);
+out:
+	condlog(3, "%s: vpd_vendor_pg = 0x%x %s", pp->dev, pp->vpd_vendor_pg,
+		origin);
+	return 0;
+}
+
+int select_vpd_vendor_id (struct config *conf, struct path *pp)
+{
+	const char *origin;
+
+	pp_set_hwe(vpd_vendor_id);
+	pp_set_default(vpd_vendor_id, 0);
+out:
+	condlog(3, "%s: vpd_vendor_id = 0x%x %s", pp->dev, pp->vpd_vendor_id,
+		origin);
+	return 0;
+}
diff --git a/libmultipath/propsel.h b/libmultipath/propsel.h
index ddfd6262..3f6d319a 100644
--- a/libmultipath/propsel.h
+++ b/libmultipath/propsel.h
@@ -37,3 +37,5 @@ void reconcile_features_with_options(const char *id, char **features,
 				     int* no_path_retry,
 				     int *retain_hwhandler);
 int select_all_tg_pt (struct config *conf, struct multipath * mp);
+int select_vpd_vendor_pg (struct config *conf, struct path *pp);
+int select_vpd_vendor_id (struct config *conf, struct path *pp);
diff --git a/libmultipath/structs.h b/libmultipath/structs.h
index 1c32a799..1ad5f64a 100644
--- a/libmultipath/structs.h
+++ b/libmultipath/structs.h
@@ -21,6 +21,7 @@
 #define HOST_NAME_LEN		16
 #define SLOT_NAME_SIZE		40
 #define PRKEY_SIZE		19
+#define VPD_DATA_SIZE		128
 
 #define SCSI_VENDOR_SIZE	9
 #define SCSI_PRODUCT_SIZE	17
@@ -243,6 +244,11 @@ struct hd_geometry {
 };
 #endif
 
+/*
+ * from sg_vpd_vendor.c
+ */
+#define VPD_VP_HP3PAR 4
+
 struct path {
 	char dev[FILE_NAME_SIZE];
 	char dev_t[BLK_DEV_SIZE];
@@ -255,6 +261,7 @@ struct path {
 	char rev[PATH_REV_SIZE];
 	char serial[SERIAL_SIZE];
 	char tgt_node_name[NODE_NAME_SIZE];
+	char vpd_data[VPD_DATA_SIZE];
 	unsigned long long size;
 	unsigned int checkint;
 	unsigned int tick;
@@ -287,6 +294,8 @@ struct path {
 	int io_err_pathfail_starttime;
 	int find_multipaths_timeout;
 	int marginal;
+	int vpd_vendor_pg;
+	int vpd_vendor_id;
 	/* configlet pointers */
 	vector hwe;
 	struct gen_path generic_path;
diff --git a/multipath/multipath.conf.5 b/multipath/multipath.conf.5
index e866da23..dc103fd8 100644
--- a/multipath/multipath.conf.5
+++ b/multipath/multipath.conf.5
@@ -1472,6 +1472,14 @@ the \fIproduct\fR attribute set to the value of \fIproduct_blacklist\fR.
 The user_friendly_names prefix to use for this
 device type, instead of the default "mpath".
 .TP
+.B vpd_vendor
+The vendor specific vpd page information, using the vpd page abbreviation.
+The vpd page abbreviation can be found by running \fIsg_vpd -e\fR. multipathd
+will use this information to gather device specific information that can be
+displayed with the \fI%g\fR wilcard for the \fImultipathd show maps format\fR
+and \fImultipathd show paths format\fR commands. Currently only the
+\fBhp3par\fR vpd page is supported.
+.TP
 .B hardware_handler
 The hardware handler to use for this device type.
 The following hardware handler are implemented:
-- 
2.17.2

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

