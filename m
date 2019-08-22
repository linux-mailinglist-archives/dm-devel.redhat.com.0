Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E57C9AF98
	for <lists+dm-devel@lfdr.de>; Fri, 23 Aug 2019 14:35:14 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 8D2B61057869;
	Fri, 23 Aug 2019 12:35:12 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 04A90100EBD2;
	Fri, 23 Aug 2019 12:35:12 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 4D59F24F68;
	Fri, 23 Aug 2019 12:35:11 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x7MGDmDM030668 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 22 Aug 2019 12:13:48 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 0481C2619E; Thu, 22 Aug 2019 16:13:48 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx21.extmail.prod.ext.phx2.redhat.com
	[10.5.110.62])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id F307726186
	for <dm-devel@redhat.com>; Thu, 22 Aug 2019 16:13:45 +0000 (UTC)
Received: from youngberry.canonical.com (youngberry.canonical.com
	[91.189.89.112]) (using TLSv1 with cipher AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 43D9C18C4264
	for <dm-devel@redhat.com>; Thu, 22 Aug 2019 16:13:44 +0000 (UTC)
Received: from mail-qk1-f199.google.com ([209.85.222.199])
	by youngberry.canonical.com with esmtps
	(TLS1.0:RSA_AES_128_CBC_SHA1:16) (Exim 4.76)
	(envelope-from <gpiccoli@canonical.com>) id 1i0piY-0008RD-Iv
	for dm-devel@redhat.com; Thu, 22 Aug 2019 16:13:42 +0000
Received: by mail-qk1-f199.google.com with SMTP id d203so6350462qke.4
	for <dm-devel@redhat.com>; Thu, 22 Aug 2019 09:13:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=xO4f5LyO1PZ+amXcQ0RlQJkFGBKrHUfxg3DhwTaUd1U=;
	b=eK/g+Uxxz/+Mr6KUTa9t9UOwa0FxqnxJ+HiW6ViWETdQP8P2P0DumRnD1GNUu6UING
	iz/FUv2k5g1O6ZmpV/Xs8CPSxA0tGnAFJPl8yomcQOiek0osysGGDGjCElUnjerYQ8Tp
	pQQQbTkvdOkrPMCd0VFCqqOS0Mee/LFiQdcb/SxiqQ3RpbGJNsOYfURAhc/4fKv7Bylo
	+WzPvfthQdO82nAM7XGtm2P4y6xnBAm/Ejzzj31iVAVrI/pXW4bwrU8q8y090mvZSeA+
	HWapeNLGx7koDUR0VczksiWQLUVJhSUfnN6Co9+iC4+cFpfCNoaxB/Lnp3mK2CH5ElkO
	B7ew==
X-Gm-Message-State: APjAAAXsCtB4I+HdQepN4Bqtqm+29jT5ORYK2ZAGn+bo47KcEXe1DLRm
	TpbRC2xiHLi7Oi8mzBrbuKkFJEssp1Gh4/mPxWlPGHv+ZXjtbRdp9IWfJ93q5ovQXE0YcPrX34Z
	TgotjJCVAiWdqhhQd6mZvKO2b1S0eBA==
X-Received: by 2002:a05:620a:693:: with SMTP id
	f19mr38335963qkh.189.1566490421774; 
	Thu, 22 Aug 2019 09:13:41 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxCa+zfrHMhMyn0bVEAvMuTDgOyEWm8N+LMas5RglV0aoVXn+mpkmkBG0TTKtYV2WN+FR11kQ==
X-Received: by 2002:a05:620a:693:: with SMTP id
	f19mr38335936qkh.189.1566490421540; 
	Thu, 22 Aug 2019 09:13:41 -0700 (PDT)
Received: from localhost ([191.13.61.137])
	by smtp.gmail.com with ESMTPSA id z186sm65318qkb.2.2019.08.22.09.13.40
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 22 Aug 2019 09:13:40 -0700 (PDT)
From: "Guilherme G. Piccoli" <gpiccoli@canonical.com>
To: linux-raid@vger.kernel.org
Date: Thu, 22 Aug 2019 13:13:18 -0300
Message-Id: <20190822161318.26236-2-gpiccoli@canonical.com>
In-Reply-To: <20190822161318.26236-1-gpiccoli@canonical.com>
References: <20190822161318.26236-1-gpiccoli@canonical.com>
MIME-Version: 1.0
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 238
	matched, not delayed by milter-greylist-4.6.2 (mx1.redhat.com
	[10.5.110.62]); Thu, 22 Aug 2019 16:13:44 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.6.2 (mx1.redhat.com [10.5.110.62]);
	Thu, 22 Aug 2019 16:13:44 +0000 (UTC) for IP:'91.189.89.112'
	DOMAIN:'youngberry.canonical.com'
	HELO:'youngberry.canonical.com' FROM:'gpiccoli@canonical.com'
	RCPT:''
X-RedHat-Spam-Score: -4.998  (RCVD_IN_DNSWL_HI, SPF_HELO_NONE,
	SPF_NONE) 91.189.89.112 youngberry.canonical.com
	91.189.89.112 youngberry.canonical.com <gpiccoli@canonical.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.62
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Fri, 23 Aug 2019 08:34:47 -0400
Cc: Song Liu <songliubraving@fb.com>, gpiccoli@canonical.com,
	liu.song.a23@gmail.com, NeilBrown <neilb@suse.com>,
	linux-block@vger.kernel.org, dm-devel@redhat.com,
	jay.vosburgh@canonical.com
Subject: [dm-devel] [PATCH v3 2/2] mdadm: Introduce new array state 'broken'
	for raid0/linear
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2 (mx1.redhat.com [10.5.110.64]); Fri, 23 Aug 2019 12:35:13 +0000 (UTC)

Currently if a md raid0/linear array gets one or more members removed while
being mounted, kernel keeps showing state 'clean' in the 'array_state'
sysfs attribute. Despite udev signaling the member device is gone, 'mdadm'
cannot issue the STOP_ARRAY ioctl successfully, given the array is mounted.

Nothing else hints that something is wrong (except that the removed devices
don't show properly in the output of mdadm 'detail' command). There is no
other property to be checked, and if user is not performing reads/writes
to the array, even kernel log is quiet and doesn't give a clue about the
missing member.

This patch is the mdadm counterpart of kernel new array state 'broken'.
The 'broken' state mimics the state 'clean' in every aspect, being useful
only to distinguish if an array has some member missing. All necessary
paths in mdadm were changed to deal with 'broken' state, and in case the
tool runs in a kernel that is not updated, it'll work normally, i.e., it
doesn't require the 'broken' state in order to work.
Also, this patch changes the way the array state is showed in the 'detail'
command (for raid0/linear only) - now it takes the 'array_state' sysfs
attribute into account instead of only rely in the MD_SB_CLEAN flag.

Cc: NeilBrown <neilb@suse.com>
Cc: Song Liu <songliubraving@fb.com>
Signed-off-by: Guilherme G. Piccoli <gpiccoli@canonical.com>
---

v2 -> v3:
* Nothing changed.

v1 -> v2:
* Added handling for md/linear 'broken' state.


 Detail.c  | 17 +++++++++++++++--
 Monitor.c |  9 +++++++--
 maps.c    |  1 +
 mdadm.h   |  1 +
 mdmon.h   |  2 +-
 monitor.c |  4 ++--
 6 files changed, 27 insertions(+), 7 deletions(-)

diff --git a/Detail.c b/Detail.c
index ad60434..cc7e9f1 100644
--- a/Detail.c
+++ b/Detail.c
@@ -81,6 +81,7 @@ int Detail(char *dev, struct context *c)
 	int external;
 	int inactive;
 	int is_container = 0;
+	char arrayst[12] = { 0 }; /* no state is >10 chars currently */
 
 	if (fd < 0) {
 		pr_err("cannot open %s: %s\n",
@@ -485,9 +486,21 @@ int Detail(char *dev, struct context *c)
 			else
 				st = ", degraded";
 
+			if (array.state & (1 << MD_SB_CLEAN)) {
+				if ((array.level == 0) ||
+				    (array.level == LEVEL_LINEAR))
+					strncpy(arrayst,
+						map_num(sysfs_array_states,
+							sra->array_state),
+						sizeof(arrayst)-1);
+				else
+					strncpy(arrayst, "clean",
+						sizeof(arrayst)-1);
+			} else
+				strncpy(arrayst, "active", sizeof(arrayst)-1);
+
 			printf("             State : %s%s%s%s%s%s \n",
-			       (array.state & (1 << MD_SB_CLEAN)) ?
-			       "clean" : "active", st,
+			       arrayst, st,
 			       (!e || (e->percent < 0 &&
 				       e->percent != RESYNC_PENDING &&
 				       e->percent != RESYNC_DELAYED)) ?
diff --git a/Monitor.c b/Monitor.c
index 036103f..9fd5406 100644
--- a/Monitor.c
+++ b/Monitor.c
@@ -1055,8 +1055,12 @@ int Wait(char *dev)
 	}
 }
 
+/* The state "broken" is used only for RAID0/LINEAR - it's the same as
+ * "clean", but used in case the array has one or more members missing.
+ */
+#define CLEAN_STATES_LAST_POS	5
 static char *clean_states[] = {
-	"clear", "inactive", "readonly", "read-auto", "clean", NULL };
+	"clear", "inactive", "readonly", "read-auto", "clean", "broken", NULL };
 
 int WaitClean(char *dev, int verbose)
 {
@@ -1116,7 +1120,8 @@ int WaitClean(char *dev, int verbose)
 			rv = read(state_fd, buf, sizeof(buf));
 			if (rv < 0)
 				break;
-			if (sysfs_match_word(buf, clean_states) <= 4)
+			if (sysfs_match_word(buf, clean_states)
+			    <= CLEAN_STATES_LAST_POS)
 				break;
 			rv = sysfs_wait(state_fd, &delay);
 			if (rv < 0 && errno != EINTR)
diff --git a/maps.c b/maps.c
index 02a0474..49b7f2c 100644
--- a/maps.c
+++ b/maps.c
@@ -150,6 +150,7 @@ mapping_t sysfs_array_states[] = {
 	{ "read-auto", ARRAY_READ_AUTO },
 	{ "clean", ARRAY_CLEAN },
 	{ "write-pending", ARRAY_WRITE_PENDING },
+	{ "broken", ARRAY_BROKEN },
 	{ NULL, ARRAY_UNKNOWN_STATE }
 };
 
diff --git a/mdadm.h b/mdadm.h
index 43b07d5..c88ceab 100644
--- a/mdadm.h
+++ b/mdadm.h
@@ -373,6 +373,7 @@ struct mdinfo {
 		ARRAY_ACTIVE,
 		ARRAY_WRITE_PENDING,
 		ARRAY_ACTIVE_IDLE,
+		ARRAY_BROKEN,
 		ARRAY_UNKNOWN_STATE,
 	} array_state;
 	struct md_bb bb;
diff --git a/mdmon.h b/mdmon.h
index 818367c..b3d72ac 100644
--- a/mdmon.h
+++ b/mdmon.h
@@ -21,7 +21,7 @@
 extern const char Name[];
 
 enum array_state { clear, inactive, suspended, readonly, read_auto,
-		   clean, active, write_pending, active_idle, bad_word};
+		   clean, active, write_pending, active_idle, broken, bad_word};
 
 enum sync_action { idle, reshape, resync, recover, check, repair, bad_action };
 
diff --git a/monitor.c b/monitor.c
index 81537ed..e0d3be6 100644
--- a/monitor.c
+++ b/monitor.c
@@ -26,7 +26,7 @@
 
 static char *array_states[] = {
 	"clear", "inactive", "suspended", "readonly", "read-auto",
-	"clean", "active", "write-pending", "active-idle", NULL };
+	"clean", "active", "write-pending", "active-idle", "broken", NULL };
 static char *sync_actions[] = {
 	"idle", "reshape", "resync", "recover", "check", "repair", NULL
 };
@@ -476,7 +476,7 @@ static int read_and_act(struct active_array *a, fd_set *fds)
 		a->next_state = clean;
 		ret |= ARRAY_DIRTY;
 	}
-	if (a->curr_state == clean) {
+	if ((a->curr_state == clean) || (a->curr_state == broken)) {
 		a->container->ss->set_array_state(a, 1);
 	}
 	if (a->curr_state == active ||
-- 
2.22.0

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
