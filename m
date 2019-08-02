Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 430777FEBB
	for <lists+dm-devel@lfdr.de>; Fri,  2 Aug 2019 18:39:32 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id E27E1308FC22;
	Fri,  2 Aug 2019 16:39:29 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B3EC560C4E;
	Fri,  2 Aug 2019 16:39:29 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 4C0CA149E2;
	Fri,  2 Aug 2019 16:39:29 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x72GYDuM001429 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 2 Aug 2019 12:34:13 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 12CDD60623; Fri,  2 Aug 2019 16:34:13 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E3D72608C2;
	Fri,  2 Aug 2019 16:34:12 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id x72GYBah031855; 
	Fri, 2 Aug 2019 11:34:11 -0500
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id x72GYBr5031854;
	Fri, 2 Aug 2019 11:34:11 -0500
From: Benjamin Marzinski <bmarzins@redhat.com>
To: Christophe Varoqui <christophe.varoqui@opensvc.com>
Date: Fri,  2 Aug 2019 11:33:42 -0500
Message-Id: <1564763622-31752-17-git-send-email-bmarzins@redhat.com>
In-Reply-To: <1564763622-31752-1-git-send-email-bmarzins@redhat.com>
References: <1564763622-31752-1-git-send-email-bmarzins@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: dm-devel@redhat.com
Cc: device-mapper development <dm-devel@redhat.com>,
	Martin Wilck <mwilck@suse.com>, Muneendra Kumar <mkumar@redhat.com>
Subject: [dm-devel] [PATCH 16/16] multipath: update man pages
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.43]); Fri, 02 Aug 2019 16:39:31 +0000 (UTC)

Add documentation for the marginal_pathgroups option and the
(un)setmarginal commands.

Signed-off-by: Benjamin Marzinski <bmarzins@redhat.com>
---
 multipath/multipath.conf.5 | 34 ++++++++++++++++++++++++++++++----
 multipathd/multipathd.8    | 19 +++++++++++++++++++
 2 files changed, 49 insertions(+), 4 deletions(-)

diff --git a/multipath/multipath.conf.5 b/multipath/multipath.conf.5
index 7fccf8f3..a85a8a60 100644
--- a/multipath/multipath.conf.5
+++ b/multipath/multipath.conf.5
@@ -1043,6 +1043,28 @@ The default is: \fBno\fR
 .
 .
 .TP
+.B marginal_pathgroups
+If set to \fIno\fR, the \fIdelay_*_checks\fR, \fImarginal_path_*\fR, and
+\fIsan_path_err_*\fR options will keep marginal, or \(dqshaky\(dq, paths from
+being reinstated until they have been monitored for some time. This can cause
+situations where all non-marginal paths are down, and no paths are usable
+until multipathd detects this and reinstates a marginal path. If the multipath
+device is not configured to queue IO in this case, it can cause IO errors to
+occur, even though there are marginal paths available.  However, if this
+option is set to \fIyes\fR, when one of the marginal path detecting methods
+determines that a path is marginal, it will be reinstated and placed in a
+seperate pathgroup that will only be used after all the non-marginal pathgroups
+have been tried first. This prevents the possibility of IO errors occuring
+while marginal paths are still usable. After the path has been monitored
+for the configured time, and is declared healthy, it will be returned to its
+normal pathgroup. See "Shaky paths detection" below for more information.
+.RS
+.TP
+The default  is: \fBno\fR
+.RE
+.
+.
+.TP
 .B find_multipaths
 This option controls whether multipath and multipathd try to create multipath
 maps over non-blacklisted devices they encounter. This matters a) when a device is
@@ -1690,10 +1712,14 @@ events. \fImultipathd\fR supports three different methods for detecting this
 situation and dealing with it. All methods share the same basic mode of
 operation: If a path is found to be \(dqshaky\(dq or \(dqflipping\(dq,
 and appears to be in healthy status, it is not reinstated (put back to use)
-immediately. Instead, it is watched for some time, and only reinstated
-if the healthy state appears to be stable. The logic of determining
-\(dqshaky\(dq condition, as well as the logic when to reinstate,
-differs between the three methods.
+immediately. Instead, it is placed in the \(dqdelayed\(dq state and watched
+for some time, and only reinstated if the healthy state appears to be stable.
+If the \fImarginal_pathgroups\fR option is set, the path will reinstated
+immediately, but placed in a special pathgroup for marginal paths. Marginal
+pathgroups will not be used until all other pathgroups have been tried. At the
+time when the path would normally be reinstated, it will be returned to its
+normal pathgroup. The logic of determining \(dqshaky\(dq condition, as well as
+the logic when to reinstate, differs between the three methods.
 .TP 8
 .B \(dqdelay_checks\(dq failure tracking
 This method is \fBdeprecated\fR and mapped to the \(dqsan_path_err\(dq method.
diff --git a/multipathd/multipathd.8 b/multipathd/multipathd.8
index edac7a92..048a838d 100644
--- a/multipathd/multipathd.8
+++ b/multipathd/multipathd.8
@@ -277,6 +277,25 @@ Remove the persistent reservation key associated with $map from the
 \fIreservation_key\fR is set to \fBfile\fR in \fI/etc/multipath.conf\fR.
 .
 .TP
+.B path $path setmarginal
+move $path to a marginal pathgroup. The path will remain in the marginal
+path group until \fIunsetmarginal\fR is called. This command will only
+work if \fImarginal_pathgroups\fR is enabled and there is no Shaky paths
+detection method configured (see the multipath.conf man page for details).
+.
+.TP
+.B path $path unsetmarginal
+return marginal path $path to its normal pathgroup. This command will only
+work if \fImarginal_pathgroups\fR is enabled and there is no Shaky paths
+detection method configured (see the multipath.conf man page for details).
+.
+.TP
+.B map $map unsetmarginal
+return all marginal paths in $map to their normal pathgroups. This command
+will only work if \fImarginal_pathgroups\fR is enabled and there is no Shaky
+paths detection method configured (see the multipath.conf man page for details).
+.
+.TP
 .B quit|exit
 End interactive session.
 .
-- 
2.17.2

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
