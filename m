Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 5603C4B561B
	for <lists+dm-devel@lfdr.de>; Mon, 14 Feb 2022 17:25:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1644855919;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=ce4GbifINcQ/FCEMp4oQQl9Q8oW5kECngxQQ4/Q2Y7Y=;
	b=IyBi5X/r45ciRPSTzMWQfN7HJmm9V3KvgSI1bRgJFcExnK5mkphWjNpxDQXSDs4/uGCzaH
	A/L2Mr3tmF5OjtCtHh90KpNniNqs5PZ2jm9g2cUEUB8GS5E5qdAC4DleeA6CuDtIR+hwNn
	HgGItKh+F6vFVkHFFfNIpAVFg2EC7vA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-400-5VpkA1piP8-41JndugNwiA-1; Mon, 14 Feb 2022 11:25:10 -0500
X-MC-Unique: 5VpkA1piP8-41JndugNwiA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F14AA100C610;
	Mon, 14 Feb 2022 16:25:04 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CC92C6E18D;
	Mon, 14 Feb 2022 16:25:03 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 523C11806D1C;
	Mon, 14 Feb 2022 16:24:56 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 21EGOiiH025556 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 14 Feb 2022 11:24:44 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id D10FB10A403B; Mon, 14 Feb 2022 16:24:44 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (unknown [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9F2511057F63;
	Mon, 14 Feb 2022 16:24:38 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 21EGOa95000435; 
	Mon, 14 Feb 2022 10:24:37 -0600
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 21EGOaUh000432;
	Mon, 14 Feb 2022 10:24:36 -0600
From: Benjamin Marzinski <bmarzins@redhat.com>
To: Christophe Varoqui <christophe.varoqui@opensvc.com>
Date: Mon, 14 Feb 2022 10:24:36 -0600
Message-Id: <1644855876-394-1-git-send-email-bmarzins@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-loop: dm-devel@redhat.com
Cc: Muneendra Kumar <muneendra.kumar@broadcom.com>,
	device-mapper development <dm-devel@redhat.com>,
	Martin Wilck <Martin.Wilck@suse.com>
Subject: [dm-devel] [PATCH] multipathd: disallow changing to/from fpin
	marginal paths on reconfig
X-BeenThere: dm-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: device-mapper development <dm-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/dm-devel>,
	<mailto:dm-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://listman.redhat.com/archives/dm-devel>
List-Post: <mailto:dm-devel@redhat.com>
List-Help: <mailto:dm-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/dm-devel>,
	<mailto:dm-devel-request@redhat.com?subject=subscribe>
MIME-Version: 1.0
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Setting marginal_pathgroups to fpin causes two new threads to be created
when multipathd starts.  Turning it on after multipathd starts up won't
cause the theads to start, and turing it off won't keep the threads from
working. So disallow changing marginal_pathgroups to/from "fpin" on
reconfigure.

Signed-off-by: Benjamin Marzinski <bmarzins@redhat.com>
Cc: Muneendra Kumar <muneendra.kumar@broadcom.com>
---
 multipath/multipath.conf.5 | 13 ++++++++-----
 multipathd/main.c          |  9 +++++++++
 2 files changed, 17 insertions(+), 5 deletions(-)

diff --git a/multipath/multipath.conf.5 b/multipath/multipath.conf.5
index 746bb60c..605b46e0 100644
--- a/multipath/multipath.conf.5
+++ b/multipath/multipath.conf.5
@@ -1102,15 +1102,18 @@ have been tried first. This prevents the possibility of IO errors occurring
 while marginal paths are still usable. After the path has been monitored
 for the configured time, and is declared healthy, it will be returned to its
 normal pathgroup.
-However if this option is set to \fIfpin\fR multipathd will receive fpin
+If this option is set to \fIfpin\fR, multipathd will receive fpin
 notifications, set path states to "marginal" accordingly, and regroup paths
-as described for "marginal_pathgroups yes". This option can't be used in combination
-with other options for "Shaky path detection" (see below).If it is set to fpin,
-marginal_path_xyz and san_path_err_xyz parameters are implicitly set to 0.
+as described for \fIon\fR. This option can't be used in combination
+with other options for "Shaky path detection" (see below). \fBNote:\fR If this
+is set to \fIfpin\fR, the \fImarginal_path_*\fR and \fIsan_path_err_*\fR
+options are implicitly set to \fIno\fP. Also, this option cannot be switched
+either to or from \fIfpin\fR on a multipathd reconfigure. multipathd must be
+restarted for the change to take effect.
 See "Shaky paths detection" below for more information.
 .RS
 .TP
-The default is: \fBno\fR
+The default is: \fBoff\fR
 .RE
 .
 .
diff --git a/multipathd/main.c b/multipathd/main.c
index 6bc5178d..f2c0b280 100644
--- a/multipathd/main.c
+++ b/multipathd/main.c
@@ -2850,6 +2850,7 @@ int
 reconfigure (struct vectors * vecs)
 {
 	struct config * old, *conf;
+	int old_marginal_pathgroups;
 
 	conf = load_config(DEFAULT_CONFIGFILE);
 	if (!conf)
@@ -2879,6 +2880,14 @@ reconfigure (struct vectors * vecs)
 	uxsock_timeout = conf->uxsock_timeout;
 
 	old = rcu_dereference(multipath_conf);
+	old_marginal_pathgroups = old->marginal_pathgroups;
+	if ((old_marginal_pathgroups == MARGINAL_PATHGROUP_FPIN) !=
+	    (conf->marginal_pathgroups == MARGINAL_PATHGROUP_FPIN)) {
+		condlog(1, "multipathd must be restarted to turn %s fpin marginal paths",
+			(old_marginal_pathgroups == MARGINAL_PATHGROUP_FPIN)?
+			"off" : "on");
+		conf->marginal_pathgroups = old_marginal_pathgroups;
+	}
 	conf->sequence_nr = old->sequence_nr + 1;
 	rcu_assign_pointer(multipath_conf, conf);
 	call_rcu(&old->rcu, rcu_free_config);
-- 
2.17.2

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

