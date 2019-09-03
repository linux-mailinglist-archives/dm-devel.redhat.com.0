Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id C75FCA7E70
	for <lists+dm-devel@lfdr.de>; Wed,  4 Sep 2019 10:53:35 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id C4A043064FD2;
	Wed,  4 Sep 2019 08:53:33 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9BD5F60606;
	Wed,  4 Sep 2019 08:53:33 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 339B61800B74;
	Wed,  4 Sep 2019 08:53:33 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x83JnZe1024996 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 3 Sep 2019 15:49:35 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 8D44B194B2; Tue,  3 Sep 2019 19:49:35 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx27.extmail.prod.ext.phx2.redhat.com
	[10.5.110.68])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 875F919D70
	for <dm-devel@redhat.com>; Tue,  3 Sep 2019 19:49:33 +0000 (UTC)
Received: from youngberry.canonical.com (youngberry.canonical.com
	[91.189.89.112]) (using TLSv1 with cipher AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 2C2428796BC
	for <dm-devel@redhat.com>; Tue,  3 Sep 2019 19:49:32 +0000 (UTC)
Received: from mail-pl1-f199.google.com ([209.85.214.199])
	by youngberry.canonical.com with esmtps
	(TLS1.0:RSA_AES_128_CBC_SHA1:16) (Exim 4.76)
	(envelope-from <gpiccoli@canonical.com>) id 1i5Eny-0004ub-Bj
	for dm-devel@redhat.com; Tue, 03 Sep 2019 19:49:30 +0000
Received: by mail-pl1-f199.google.com with SMTP id g9so10372157plo.21
	for <dm-devel@redhat.com>; Tue, 03 Sep 2019 12:49:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=G5yfoLgOl+DBM+YTslU6y0CKPqFGOH/9TbsO7XW6rqc=;
	b=STQymXyiXHVw2Uf7NsTz3WFP8gt4aNlPkfOXviMppYCTFJGjGhIned1pNSY+gqPLOE
	QMFk/CvhEkULdEfAPLHeu7KGJ1cJ2qM97qlS8MHJEtWG/ak5pgkOcaqP6LfUUQHa/wMb
	U6jDiUggms8ajn+58W9McLfrJZGHLg8eCjV2gceN13l84tpdFpElE3OvnJPpvNBGc/96
	hTD+eO+Wa1Qbu2lCOxIs6Sp0DzZYEs30yaFFOindt7b87MLAjQP5gggzhANPH2TaciiE
	2R2mW4ugh7pJjH/qVDPwk9+jReL9V6yF7I4BGoPA5VJY45VdLRE6tYz71zd3qmLjjJjX
	VWBg==
X-Gm-Message-State: APjAAAWshIAx6Tln8z/FtwwzvtTfvuCSTkZAFaFUJw9S549nO7zAT7p1
	7R7k60+1ZTOq7RSjbhvOwKFaZPvHLRF9q69QLyqHS2zjDgU3OEHc8TQhTkAKi1Yj0iiuPcS5Qc3
	8w3/NzZ8XVSt0zayFOFvNKE1Qhi+Elg==
X-Received: by 2002:a17:902:7592:: with SMTP id
	j18mr36507843pll.186.1567540169142; 
	Tue, 03 Sep 2019 12:49:29 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxyoaUoLZlZenn5wcFMze5HicJKKUtAW77wnfwEqBzb28QkXp3iA25uQpSEt3LD2a5mu0QFGA==
X-Received: by 2002:a17:902:7592:: with SMTP id
	j18mr36507826pll.186.1567540168966; 
	Tue, 03 Sep 2019 12:49:28 -0700 (PDT)
Received: from localhost (201-93-37-171.dial-up.telesp.net.br. [201.93.37.171])
	by smtp.gmail.com with ESMTPSA id
	y15sm24921254pfp.111.2019.09.03.12.49.26
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 03 Sep 2019 12:49:28 -0700 (PDT)
From: "Guilherme G. Piccoli" <gpiccoli@canonical.com>
To: linux-raid@vger.kernel.org
Date: Tue,  3 Sep 2019 16:49:01 -0300
Message-Id: <20190903194901.13524-2-gpiccoli@canonical.com>
In-Reply-To: <20190903194901.13524-1-gpiccoli@canonical.com>
References: <20190903194901.13524-1-gpiccoli@canonical.com>
MIME-Version: 1.0
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 238
	matched, not delayed by milter-greylist-4.6.2 (mx1.redhat.com
	[10.5.110.68]); Tue, 03 Sep 2019 19:49:32 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.6.2 (mx1.redhat.com [10.5.110.68]);
	Tue, 03 Sep 2019 19:49:32 +0000 (UTC) for IP:'91.189.89.112'
	DOMAIN:'youngberry.canonical.com'
	HELO:'youngberry.canonical.com' FROM:'gpiccoli@canonical.com'
	RCPT:''
X-RedHat-Spam-Score: -4.998  (RCVD_IN_DNSWL_HI, SPF_HELO_NONE,
	SPF_NONE) 91.189.89.112 youngberry.canonical.com
	91.189.89.112 youngberry.canonical.com <gpiccoli@canonical.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.68
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Wed, 04 Sep 2019 04:53:21 -0400
Cc: nfbrown@suse.com, Song Liu <songliubraving@fb.com>, jes.sorensen@gmail.com,
	gpiccoli@canonical.com, liu.song.a23@gmail.com,
	linux-block@vger.kernel.org, dm-devel@redhat.com,
	jay.vosburgh@canonical.com
Subject: [dm-devel] [PATCH v4 2/2] mdadm: Introduce new array state 'broken'
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.45]); Wed, 04 Sep 2019 08:53:34 +0000 (UTC)

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

Cc: Jes Sorensen <jes.sorensen@gmail.com>
Cc: NeilBrown <neilb@suse.de>
Cc: Song Liu <songliubraving@fb.com>
Signed-off-by: Guilherme G. Piccoli <gpiccoli@canonical.com>
---

v3 -> v4:
* Changed arrayst from pre-allocated to pointer (thanks Neil
for the suggestion).
* Simplified array size validation in Monitor/Wait() by
using ARRAY_SIZE(), per Neil's suggestion.

v2 -> v3:
* Nothing changed.

v1 -> v2:
* Added handling for md/linear 'broken' state.


 Detail.c  | 14 ++++++++++++--
 Monitor.c |  8 ++++++--
 maps.c    |  1 +
 mdadm.h   |  1 +
 mdmon.h   |  2 +-
 monitor.c |  4 ++--
 6 files changed, 23 insertions(+), 7 deletions(-)

diff --git a/Detail.c b/Detail.c
index ad60434..3e61e37 100644
--- a/Detail.c
+++ b/Detail.c
@@ -81,6 +81,7 @@ int Detail(char *dev, struct context *c)
 	int external;
 	int inactive;
 	int is_container = 0;
+	char *arrayst;
 
 	if (fd < 0) {
 		pr_err("cannot open %s: %s\n",
@@ -485,9 +486,18 @@ int Detail(char *dev, struct context *c)
 			else
 				st = ", degraded";
 
+			if (array.state & (1 << MD_SB_CLEAN)) {
+				if ((array.level == 0) ||
+				    (array.level == LEVEL_LINEAR))
+					arrayst = map_num(sysfs_array_states,
+							  sra->array_state);
+				else
+					arrayst = "clean";
+			} else
+				arrayst = "active";
+
 			printf("             State : %s%s%s%s%s%s \n",
-			       (array.state & (1 << MD_SB_CLEAN)) ?
-			       "clean" : "active", st,
+			       arrayst, st,
 			       (!e || (e->percent < 0 &&
 				       e->percent != RESYNC_PENDING &&
 				       e->percent != RESYNC_DELAYED)) ?
diff --git a/Monitor.c b/Monitor.c
index 036103f..cf0610b 100644
--- a/Monitor.c
+++ b/Monitor.c
@@ -1055,8 +1055,11 @@ int Wait(char *dev)
 	}
 }
 
+/* The state "broken" is used only for RAID0/LINEAR - it's the same as
+ * "clean", but used in case the array has one or more members missing.
+ */
 static char *clean_states[] = {
-	"clear", "inactive", "readonly", "read-auto", "clean", NULL };
+	"clear", "inactive", "readonly", "read-auto", "clean", "broken", NULL };
 
 int WaitClean(char *dev, int verbose)
 {
@@ -1116,7 +1119,8 @@ int WaitClean(char *dev, int verbose)
 			rv = read(state_fd, buf, sizeof(buf));
 			if (rv < 0)
 				break;
-			if (sysfs_match_word(buf, clean_states) <= 4)
+			if (sysfs_match_word(buf, clean_states)
+			    < (int)ARRAY_SIZE(clean_states)-1)
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
2.17.1

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
