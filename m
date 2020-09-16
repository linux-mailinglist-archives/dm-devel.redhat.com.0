Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id C828026C46C
	for <lists+dm-devel@lfdr.de>; Wed, 16 Sep 2020 17:40:12 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-377-1TEcF_QAOb-8QrEuMELpFA-1; Wed, 16 Sep 2020 11:40:02 -0400
X-MC-Unique: 1TEcF_QAOb-8QrEuMELpFA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8C37D6409F;
	Wed, 16 Sep 2020 15:39:52 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5FA06610F3;
	Wed, 16 Sep 2020 15:39:52 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 1714C183D035;
	Wed, 16 Sep 2020 15:39:52 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 08GFdWuL024206 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 16 Sep 2020 11:39:32 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 5B421115589D; Wed, 16 Sep 2020 15:39:32 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 55841115589C
	for <dm-devel@redhat.com>; Wed, 16 Sep 2020 15:39:29 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3330980029D
	for <dm-devel@redhat.com>; Wed, 16 Sep 2020 15:39:29 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-285-_3nKOl5EM_-vGihuUixPfQ-1;
	Wed, 16 Sep 2020 11:39:24 -0400
X-MC-Unique: _3nKOl5EM_-vGihuUixPfQ-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 4EA3FB2A1;
	Wed, 16 Sep 2020 15:39:38 +0000 (UTC)
From: mwilck@suse.com
To: Christophe Varoqui <christophe.varoqui@opensvc.com>,
	Benjamin Marzinski <bmarzins@redhat.com>
Date: Wed, 16 Sep 2020 17:37:00 +0200
Message-Id: <20200916153718.582-2-mwilck@suse.com>
In-Reply-To: <20200916153718.582-1-mwilck@suse.com>
References: <20200916153718.582-1-mwilck@suse.com>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false;
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 08GFdWuL024206
X-loop: dm-devel@redhat.com
Cc: Chongyun Wu <wu.chongyun@h3c.com>, dm-devel@redhat.com,
	Martin Wilck <mwilck@suse.com>
Subject: [dm-devel] [PATCH 01/19] multipathd: allow shutdown during
	configure()
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Martin Wilck <mwilck@suse.com>

reconfigure() can be a long-running operation; both initial path
discovery and initial map setup can take a long time. Allow
the main program to indicate that the process should be
interrupted if a shutdown signal was received.

We take advantage of the dynamic linker's symbol lookup ordering
here. The default implementation of should_exit never returns
true, but callers (like multipathd) can override it.

Cc: Chongyun Wu <wu.chongyun@h3c.com>
Signed-off-by: Martin Wilck <mwilck@suse.com>
---
 libmultipath/configure.c |  6 ++++++
 libmultipath/discovery.c |  3 +++
 libmultipath/util.c      |  5 +++++
 libmultipath/util.h      |  1 +
 multipathd/main.c        | 17 +++++++++++++++++
 5 files changed, 32 insertions(+)

diff --git a/libmultipath/configure.c b/libmultipath/configure.c
index 213dbe4..7a8eef3 100644
--- a/libmultipath/configure.c
+++ b/libmultipath/configure.c
@@ -1159,6 +1159,12 @@ int coalesce_paths (struct vectors * vecs, vector newmp, char * refwwid,
 
 	vector_foreach_slot (pathvec, pp1, k) {
 		int invalid;
+
+		if (should_exit()) {
+			ret = CP_FAIL;
+			goto out;
+		}
+
 		/* skip this path for some reason */
 
 		/* 1. if path has no unique id or wwid blacklisted */
diff --git a/libmultipath/discovery.c b/libmultipath/discovery.c
index 3f1b1d7..000f4c9 100644
--- a/libmultipath/discovery.c
+++ b/libmultipath/discovery.c
@@ -200,6 +200,9 @@ path_discovery (vector pathvec, int flag)
 		const char *devtype;
 		const char *devpath;
 
+		if (should_exit())
+			break;
+
 		devpath = udev_list_entry_get_name(entry);
 		condlog(4, "Discover device %s", devpath);
 		udevice = udev_device_new_from_syspath(udev, devpath);
diff --git a/libmultipath/util.c b/libmultipath/util.c
index 1512424..7a0b2eb 100644
--- a/libmultipath/util.c
+++ b/libmultipath/util.c
@@ -422,3 +422,8 @@ void _log_bitfield_overflow(const char *f, unsigned int bit, unsigned int len)
 {
 	condlog(0, "%s: bitfield overflow: %u >= %u", f, bit, len);
 }
+
+int should_exit(void)
+{
+	return 0;
+}
diff --git a/libmultipath/util.h b/libmultipath/util.h
index 045bbee..a0d3d50 100644
--- a/libmultipath/util.h
+++ b/libmultipath/util.h
@@ -27,6 +27,7 @@ int parse_prkey(const char *ptr, uint64_t *prkey);
 int parse_prkey_flags(const char *ptr, uint64_t *prkey, uint8_t *flags);
 int safe_write(int fd, const void *buf, size_t count);
 void set_max_fds(rlim_t max_fds);
+int should_exit(void);
 
 #define KERNEL_VERSION(maj, min, ptc) ((((maj) * 256) + (min)) * 256 + (ptc))
 #define ARRAY_SIZE(x) (sizeof(x)/sizeof((x)[0]))
diff --git a/multipathd/main.c b/multipathd/main.c
index f7229a7..d5e90b2 100644
--- a/multipathd/main.c
+++ b/multipathd/main.c
@@ -141,6 +141,11 @@ static inline enum daemon_status get_running_state(void)
 	return st;
 }
 
+int should_exit(void)
+{
+	return get_running_state() == DAEMON_SHUTDOWN;
+}
+
 /*
  * global copy of vecs for use in sig handlers
  */
@@ -2580,6 +2585,9 @@ configure (struct vectors * vecs)
 		goto fail;
 	}
 
+	if (should_exit())
+		goto fail;
+
 	conf = get_multipath_config();
 	pthread_cleanup_push(put_multipath_config, conf);
 	vector_foreach_slot (vecs->pathvec, pp, i){
@@ -2596,6 +2604,9 @@ configure (struct vectors * vecs)
 		goto fail;
 	}
 
+	if (should_exit())
+		goto fail;
+
 	/*
 	 * create new set of maps & push changed ones into dm
 	 * In the first call, use FORCE_RELOAD_WEAK to avoid making
@@ -2610,6 +2621,9 @@ configure (struct vectors * vecs)
 		goto fail;
 	}
 
+	if (should_exit())
+		goto fail;
+
 	/*
 	 * may need to remove some maps which are no longer relevant
 	 * e.g., due to blacklist changes in conf file
@@ -2621,6 +2635,9 @@ configure (struct vectors * vecs)
 
 	dm_lib_release();
 
+	if (should_exit())
+		goto fail;
+
 	sync_maps_state(mpvec);
 	vector_foreach_slot(mpvec, mpp, i){
 		if (remember_wwid(mpp->wwid) == 1)
-- 
2.28.0


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

