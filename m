Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id A14E9505A9
	for <lists+dm-devel@lfdr.de>; Mon, 24 Jun 2019 11:30:11 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 0E35581DE9;
	Mon, 24 Jun 2019 09:30:00 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D76A454360;
	Mon, 24 Jun 2019 09:29:54 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id B20DB1806B18;
	Mon, 24 Jun 2019 09:29:31 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x5O9SwpJ004495 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 24 Jun 2019 05:28:59 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id F0C7A5C237; Mon, 24 Jun 2019 09:28:58 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx13.extmail.prod.ext.phx2.redhat.com
	[10.5.110.42])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DB67F5C236;
	Mon, 24 Jun 2019 09:28:56 +0000 (UTC)
Received: from smtp2.provo.novell.com (smtp2.provo.novell.com [137.65.250.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
	bits)) (No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id B71303086214;
	Mon, 24 Jun 2019 09:28:53 +0000 (UTC)
Received: from apollon.suse.de.de (prva10-snat226-2.provo.novell.com
	[137.65.226.36])
	by smtp2.provo.novell.com with ESMTP (TLS encrypted);
	Mon, 24 Jun 2019 03:28:48 -0600
From: Martin Wilck <mwilck@suse.com>
To: Benjamin Marzinski <bmarzins@redhat.com>,
	Christophe Varoqui <christophe.varoqui@opensvc.com>
Date: Mon, 24 Jun 2019 11:27:30 +0200
Message-Id: <20190624092756.7769-6-mwilck@suse.com>
In-Reply-To: <20190624092756.7769-1-mwilck@suse.com>
References: <20190624092756.7769-1-mwilck@suse.com>
MIME-Version: 1.0
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 216
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.42]); Mon, 24 Jun 2019 09:28:54 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.42]);
	Mon, 24 Jun 2019 09:28:54 +0000 (UTC) for IP:'137.65.250.81'
	DOMAIN:'smtp2.provo.novell.com' HELO:'smtp2.provo.novell.com'
	FROM:'mwilck@suse.com' RCPT:''
X-RedHat-Spam-Score: -2.3  (RCVD_IN_DNSWL_MED, SPF_HELO_NONE,
	SPF_PASS) 137.65.250.81 smtp2.provo.novell.com
	137.65.250.81 smtp2.provo.novell.com <mwilck@suse.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.42
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com, Martin Wilck <mwilck@suse.com>
Subject: [dm-devel] [PATCH v2 05/30] multipath-tools: fix more gcc 9
	-Wstringop-truncation warnings
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.25]); Mon, 24 Jun 2019 09:30:10 +0000 (UTC)

More often than not, this means replacing strncpy() by strlcpy().

Signed-off-by: Martin Wilck <mwilck@suse.com>
---
 libmpathpersist/mpath_persist.c |  8 ++++----
 libmultipath/configure.c        |  7 ++++---
 libmultipath/discovery.c        | 12 ++++++------
 libmultipath/dmparser.c         | 20 +++++++++-----------
 libmultipath/util.c             |  2 +-
 5 files changed, 24 insertions(+), 25 deletions(-)

diff --git a/libmpathpersist/mpath_persist.c b/libmpathpersist/mpath_persist.c
index 599c5e9e..4abcaed5 100644
--- a/libmpathpersist/mpath_persist.c
+++ b/libmpathpersist/mpath_persist.c
@@ -497,8 +497,8 @@ int mpath_prout_reg(struct multipath *mpp,int rq_servact, int rq_scope,
 				if (k < count)
 					continue;
 			}
-			strncpy(thread[count].param.dev, pp->dev,
-				FILE_NAME_SIZE - 1);
+			strlcpy(thread[count].param.dev, pp->dev,
+				FILE_NAME_SIZE);
 
 			if (count && (thread[count].param.paramp->sa_flags & MPATH_F_SPEC_I_PT_MASK)){
 				/*
@@ -686,8 +686,8 @@ int mpath_prout_rel(struct multipath *mpp,int rq_servact, int rq_scope,
 				continue;
 			}
 
-			strncpy(thread[count].param.dev, pp->dev,
-				FILE_NAME_SIZE - 1);
+			strlcpy(thread[count].param.dev, pp->dev,
+				FILE_NAME_SIZE);
 			condlog (3, "%s: sending pr out command to %s", mpp->wwid, pp->dev);
 			rc = pthread_create (&thread[count].id, &attr, mpath_prout_pthread_fn,
 					(void *) (&thread[count].param));
diff --git a/libmultipath/configure.c b/libmultipath/configure.c
index af4d78de..0648c0d6 100644
--- a/libmultipath/configure.c
+++ b/libmultipath/configure.c
@@ -73,7 +73,7 @@ int group_by_host_adapter(struct pathgroup *pgp, vector adapters)
 			goto out;
 		agp->pgp = pgp;
 
-		strncpy(agp->adapter_name, adapter_name1, SLOT_NAME_SIZE - 1);
+		strlcpy(agp->adapter_name, adapter_name1, SLOT_NAME_SIZE);
 		store_adaptergroup(adapters, agp);
 
 		/* create a new host port group
@@ -667,7 +667,7 @@ select_action (struct multipath * mpp, vector curmp, int force_reload)
 	if (!cmpp) {
 		condlog(2, "%s: remove (wwid changed)", mpp->alias);
 		dm_flush_map(mpp->alias);
-		strncpy(cmpp_by_name->wwid, mpp->wwid, WWID_SIZE - 1);
+		strlcpy(cmpp_by_name->wwid, mpp->wwid, WWID_SIZE);
 		drop_multipath(curmp, cmpp_by_name->wwid, KEEP_PATHS);
 		mpp->action = ACT_CREATE;
 		condlog(3, "%s: set ACT_CREATE (map wwid change)",
@@ -1451,7 +1451,8 @@ int get_refwwid(enum mpath_cmds cmd, char *dev, enum devtypes dev_type,
 
 		conf = get_multipath_config();
 		pthread_cleanup_push(put_multipath_config, conf);
-		if (((dm_get_uuid(dev, tmpwwid)) == 0) && (strlen(tmpwwid))) {
+		if (((dm_get_uuid(dev, tmpwwid)) == 0)
+		    && (strlen(tmpwwid))) {
 			refwwid = tmpwwid;
 			goto check;
 		}
diff --git a/libmultipath/discovery.c b/libmultipath/discovery.c
index 51ca2306..407e64a0 100644
--- a/libmultipath/discovery.c
+++ b/libmultipath/discovery.c
@@ -297,8 +297,8 @@ sysfs_get_timeout(const struct path *pp, unsigned int *timeout)
 	return 1;
 }
 
-int
-sysfs_get_tgt_nodename (struct path *pp, char * node)
+static int
+sysfs_get_tgt_nodename(struct path *pp, char *node)
 {
 	const char *tgtname, *value;
 	struct udev_device *parent, *tgtdev;
@@ -322,7 +322,7 @@ sysfs_get_tgt_nodename (struct path *pp, char * node)
 		if (tgtid >= 0) {
 			pp->sg_id.proto_id = SCSI_PROTOCOL_SAS;
 			pp->sg_id.transport_id = tgtid;
-			strncpy(node, value, NODE_NAME_SIZE);
+			strlcpy(node, value, NODE_NAME_SIZE);
 			return 0;
 		}
 	}
@@ -334,7 +334,7 @@ sysfs_get_tgt_nodename (struct path *pp, char * node)
 		if (value && !strcmp(value, "usb")) {
 			pp->sg_id.proto_id = SCSI_PROTOCOL_UNSPEC;
 			tgtname = udev_device_get_sysname(tgtdev);
-			strncpy(node, tgtname, strlen(tgtname));
+			strlcpy(node, tgtname, NODE_NAME_SIZE);
 			condlog(3, "%s: skip USB device %s", pp->dev, node);
 			return 1;
 		}
@@ -361,7 +361,7 @@ sysfs_get_tgt_nodename (struct path *pp, char * node)
 			if (value) {
 				pp->sg_id.proto_id = SCSI_PROTOCOL_FCP;
 				pp->sg_id.transport_id = tgtid;
-				strncpy(node, value, NODE_NAME_SIZE);
+				strlcpy(node, value, NODE_NAME_SIZE);
 				udev_device_unref(tgtdev);
 				return 0;
 			} else
@@ -390,7 +390,7 @@ sysfs_get_tgt_nodename (struct path *pp, char * node)
 			if (value) {
 				pp->sg_id.proto_id = SCSI_PROTOCOL_ISCSI;
 				pp->sg_id.transport_id = tgtid;
-				strncpy(node, value, NODE_NAME_SIZE);
+				strlcpy(node, value, NODE_NAME_SIZE);
 				udev_device_unref(tgtdev);
 				return 0;
 			}
diff --git a/libmultipath/dmparser.c b/libmultipath/dmparser.c
index a8b0b71a..b856a07f 100644
--- a/libmultipath/dmparser.c
+++ b/libmultipath/dmparser.c
@@ -308,11 +308,11 @@ int disassemble_map(vector pathvec, char *params, struct multipath *mpp,
 				if (!pp)
 					goto out1;
 
-				strncpy(pp->dev_t, word, BLK_DEV_SIZE - 1);
-				strncpy(pp->dev, devname, FILE_NAME_SIZE - 1);
+				strlcpy(pp->dev_t, word, BLK_DEV_SIZE);
+				strlcpy(pp->dev, devname, FILE_NAME_SIZE);
 				if (strlen(mpp->wwid)) {
-					strncpy(pp->wwid, mpp->wwid,
-						WWID_SIZE - 1);
+					strlcpy(pp->wwid, mpp->wwid,
+						WWID_SIZE);
 				}
 				/* Only call this in multipath client mode */
 				if (!is_daemon && store_path(pathvec, pp))
@@ -320,8 +320,8 @@ int disassemble_map(vector pathvec, char *params, struct multipath *mpp,
 			} else {
 				if (!strlen(pp->wwid) &&
 				    strlen(mpp->wwid))
-					strncpy(pp->wwid, mpp->wwid,
-						WWID_SIZE - 1);
+					strlcpy(pp->wwid, mpp->wwid,
+						WWID_SIZE);
 			}
 			FREE(word);
 
@@ -333,23 +333,21 @@ int disassemble_map(vector pathvec, char *params, struct multipath *mpp,
 			 * in the get_dm_mpvec() code path
 			 */
 			if (!strlen(mpp->wwid))
-				strncpy(mpp->wwid, pp->wwid,
-					WWID_SIZE - 1);
+				strlcpy(mpp->wwid, pp->wwid, WWID_SIZE);
 
 			/*
 			 * Update wwid for paths which may not have been
 			 * active at the time the getuid callout was run
 			 */
 			else if (!strlen(pp->wwid))
-				strncpy(pp->wwid, mpp->wwid,
-					WWID_SIZE - 1);
+				strlcpy(pp->wwid, mpp->wwid, WWID_SIZE);
 
 			/*
 			 * Do not allow in-use patch to change wwid
 			 */
 			else if (strcmp(pp->wwid, mpp->wwid) != 0) {
 				condlog(0, "%s: path wwid appears to have changed. Using map wwid.\n", pp->dev_t);
-				strncpy(pp->wwid, mpp->wwid, WWID_SIZE);
+				strlcpy(pp->wwid, mpp->wwid, WWID_SIZE);
 			}
 
 			pgp->id ^= (long)pp;
diff --git a/libmultipath/util.c b/libmultipath/util.c
index 5b838d51..8a4be787 100644
--- a/libmultipath/util.c
+++ b/libmultipath/util.c
@@ -188,7 +188,7 @@ int devt2devname(char *devname, int devname_len, char *devt)
 					return 1;
 				}
 				p++;
-				strncpy(devname, p, devname_len);
+				strlcpy(devname, p, devname_len);
 				return 0;
 			}
 		}
-- 
2.21.0

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
