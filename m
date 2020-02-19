Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 40BFC163D35
	for <lists+dm-devel@lfdr.de>; Wed, 19 Feb 2020 07:49:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1582094966;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=FYROG7t/f3XN9E9I1vQ1ZBbHRKko8aca26mMCkstpoI=;
	b=apZGp93qd5B+U0qhOPvpX3LhAwLk6EO++wDJQPrfJU38DX83dZq3juJdn5pLPyPGx36Dxq
	u/C68XqwnXTVoDYqeal7azXvHinhpz0uc3/ar4k4PZNeMOH3IRmNqtQcpaQvzZozCT0t8C
	H2GEnLaoDDq8L06W6n3L0JZirljqKyw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-168-0O9ifW-cN0iVkfJe_8RJKQ-1; Wed, 19 Feb 2020 01:49:23 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 765588018A4;
	Wed, 19 Feb 2020 06:49:15 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4E86690526;
	Wed, 19 Feb 2020 06:49:15 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id B795718089D5;
	Wed, 19 Feb 2020 06:49:14 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 01J6mu5K015888 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 19 Feb 2020 01:48:56 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 5541019757; Wed, 19 Feb 2020 06:48:56 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2FF1019756;
	Wed, 19 Feb 2020 06:48:56 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 01J6msoO009953; 
	Wed, 19 Feb 2020 00:48:55 -0600
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 01J6mr10009952;
	Wed, 19 Feb 2020 00:48:53 -0600
From: Benjamin Marzinski <bmarzins@redhat.com>
To: Christophe Varoqui <christophe.varoqui@opensvc.com>
Date: Wed, 19 Feb 2020 00:48:30 -0600
Message-Id: <1582094920-9883-9-git-send-email-bmarzins@redhat.com>
In-Reply-To: <1582094920-9883-1-git-send-email-bmarzins@redhat.com>
References: <1582094920-9883-1-git-send-email-bmarzins@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-loop: dm-devel@redhat.com
Cc: device-mapper development <dm-devel@redhat.com>,
	Martin Wilck <Martin.Wilck@suse.com>
Subject: [dm-devel] [PATCH v3 08/18] libmultipath: add vend_id to
	get_vpd_sgio
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-MC-Unique: 0O9ifW-cN0iVkfJe_8RJKQ-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

This tells multipath how it should decode vendor specific pages. It will
be used by a future patch.

Reviewed-by: Martin Wilck <mwilck@suse.com>
Signed-off-by: Benjamin Marzinski <bmarzins@redhat.com>
---
 libmultipath/discovery.c |  4 ++--
 libmultipath/discovery.h |  2 +-
 libmultipath/propsel.c   |  2 +-
 tests/vpd.c              | 10 +++++-----
 4 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/libmultipath/discovery.c b/libmultipath/discovery.c
index 19a8d2af..8b9bdb55 100644
--- a/libmultipath/discovery.c
+++ b/libmultipath/discovery.c
@@ -1205,7 +1205,7 @@ get_vpd_sysfs (struct udev_device *parent, int pg, char * str, int maxlen)
 }
 
 int
-get_vpd_sgio (int fd, int pg, char * str, int maxlen)
+get_vpd_sgio (int fd, int pg, int vend_id, char * str, int maxlen)
 {
 	int len, buff_len;
 	unsigned char buff[4096];
@@ -1880,7 +1880,7 @@ static ssize_t uid_fallback(struct path *pp, int path_state,
 		if (len < 0 && path_state == PATH_UP) {
 			condlog(1, "%s: failed to get sysfs uid: %s",
 				pp->dev, strerror(-len));
-			len = get_vpd_sgio(pp->fd, 0x83, pp->wwid,
+			len = get_vpd_sgio(pp->fd, 0x83, 0, pp->wwid,
 					   WWID_SIZE);
 			*origin = "sgio";
 		}
diff --git a/libmultipath/discovery.h b/libmultipath/discovery.h
index 0516e41b..6444887d 100644
--- a/libmultipath/discovery.h
+++ b/libmultipath/discovery.h
@@ -35,7 +35,7 @@ int path_get_tpgs(struct path *pp); /* This function never returns TPGS_UNDEF */
 int do_tur (char *);
 int path_offline (struct path *);
 int get_state (struct path * pp, struct config * conf, int daemon, int state);
-int get_vpd_sgio (int fd, int pg, char * str, int maxlen);
+int get_vpd_sgio (int fd, int pg, int vend_id, char * str, int maxlen);
 int pathinfo (struct path * pp, struct config * conf, int mask);
 int alloc_path_with_pathinfo (struct config *conf, struct udev_device *udevice,
 			      const char *wwid, int flag, struct path **pp_ptr);
diff --git a/libmultipath/propsel.c b/libmultipath/propsel.c
index a5fc6ba0..cd372d94 100644
--- a/libmultipath/propsel.c
+++ b/libmultipath/propsel.c
@@ -504,7 +504,7 @@ check_rdac(struct path * pp)
 	if (__do_set_from_hwe(checker_name, pp, checker_name) &&
 	    strcmp(checker_name, RDAC))
 		return 0;
-	len = get_vpd_sgio(pp->fd, 0xC9, buff, 44);
+	len = get_vpd_sgio(pp->fd, 0xC9, 0, buff, 44);
 	if (len <= 0)
 		return 0;
 	return !(memcmp(buff + 4, "vac1", 4));
diff --git a/tests/vpd.c b/tests/vpd.c
index 1e653ed4..0331c487 100644
--- a/tests/vpd.c
+++ b/tests/vpd.c
@@ -429,7 +429,7 @@ static void test_vpd_vnd_ ## len ## _ ## wlen(void **state)             \
 	free(exp_wwid);							\
 	will_return(__wrap_ioctl, n);					\
 	will_return(__wrap_ioctl, vt->vpdbuf);				\
-	ret = get_vpd_sgio(10, 0x83, vt->wwid, wlen);			\
+	ret = get_vpd_sgio(10, 0x83, 0, vt->wwid, wlen);		\
 	assert_correct_wwid("test_vpd_vnd_" #len "_" #wlen,		\
 			    exp_len, ret, '1', 0, false,		\
 			    exp_subst, vt->wwid);			\
@@ -459,7 +459,7 @@ static void test_vpd_str_ ## typ ## _ ## len ## _ ## wlen(void **state) \
 		exp_len = wlen - 1;					\
 	will_return(__wrap_ioctl, n);					\
 	will_return(__wrap_ioctl, vt->vpdbuf);				\
-	ret = get_vpd_sgio(10, 0x83, vt->wwid, wlen);			\
+	ret = get_vpd_sgio(10, 0x83, 0, vt->wwid, wlen);		\
 	assert_correct_wwid("test_vpd_str_" #typ "_" #len "_" #wlen,	\
 			    exp_len, ret, byte0[type], 0,		\
 			    type != STR_IQN,				\
@@ -496,7 +496,7 @@ static void test_vpd_naa_ ## naa ## _ ## wlen(void **state)             \
 			 3, naa, 0);					\
 	will_return(__wrap_ioctl, n);					\
 	will_return(__wrap_ioctl, vt->vpdbuf);				\
-	ret = get_vpd_sgio(10, 0x83, vt->wwid, wlen);			\
+	ret = get_vpd_sgio(10, 0x83, 0, vt->wwid, wlen);		\
 	assert_correct_wwid("test_vpd_naa_" #naa "_" #wlen,		\
 			    exp_len, ret, '3', '0' + naa, true,		\
 			    test_id, vt->wwid);				\
@@ -527,7 +527,7 @@ static void test_vpd_eui_ ## len ## _ ## wlen ## _ ## sml(void **state)	\
 	}								\
 	will_return(__wrap_ioctl, n);					\
 	will_return(__wrap_ioctl, vt->vpdbuf);				\
-	ret = get_vpd_sgio(10, 0x83, vt->wwid, wlen);			\
+	ret = get_vpd_sgio(10, 0x83, 0, vt->wwid, wlen);		\
 	assert_correct_wwid("test_vpd_eui_" #len "_" #wlen "_" #sml,	\
 			    exp_len, ret, '2', 0, true,			\
 			    test_id, vt->wwid);				\
@@ -554,7 +554,7 @@ static void test_vpd80_ ## size ## _ ## len ## _ ## wlen(void **state)  \
 			 size, len);					\
 	will_return(__wrap_ioctl, n);					\
 	will_return(__wrap_ioctl, vt->vpdbuf);				\
-	ret = get_vpd_sgio(10, 0x80, vt->wwid, wlen);			\
+	ret = get_vpd_sgio(10, 0x80, 0, vt->wwid, wlen);		\
 	assert_correct_wwid("test_vpd80_" #size "_" #len "_" #wlen,	\
 			    exp_len, ret, 0, 0, false,			\
 			    input, vt->wwid);				\
-- 
2.17.2

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

