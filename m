Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id DAD2F2B5F0
	for <lists+dm-devel@lfdr.de>; Mon, 27 May 2019 15:01:55 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 9DF18308622B;
	Mon, 27 May 2019 13:01:52 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6F69A60C64;
	Mon, 27 May 2019 13:01:50 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 01DE1206D6;
	Mon, 27 May 2019 13:01:48 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x4RD0mAQ009945 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 27 May 2019 09:00:48 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id B12835D717; Mon, 27 May 2019 13:00:48 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx04.extmail.prod.ext.phx2.redhat.com
	[10.5.110.28])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A44715D704;
	Mon, 27 May 2019 13:00:48 +0000 (UTC)
Received: from smtp2.provo.novell.com (smtp2.provo.novell.com [137.65.250.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
	bits)) (No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id D189E821C3;
	Mon, 27 May 2019 13:00:32 +0000 (UTC)
Received: from apollon.suse.de.de (prva10-snat226-2.provo.novell.com
	[137.65.226.36])
	by smtp2.provo.novell.com with ESMTP (TLS encrypted);
	Mon, 27 May 2019 07:00:24 -0600
From: Martin Wilck <mwilck@suse.com>
To: Christophe Varoqui <christophe.varoqui@opensvc.com>,
	Benjamin Marzinski <bmarzins@redhat.com>
Date: Mon, 27 May 2019 14:59:42 +0200
Message-Id: <20190527125942.8366-10-mwilck@suse.com>
In-Reply-To: <20190527125942.8366-1-mwilck@suse.com>
References: <20190527125942.8366-1-mwilck@suse.com>
MIME-Version: 1.0
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 216
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.28]); Mon, 27 May 2019 13:00:38 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.28]);
	Mon, 27 May 2019 13:00:38 +0000 (UTC) for IP:'137.65.250.81'
	DOMAIN:'smtp2.provo.novell.com' HELO:'smtp2.provo.novell.com'
	FROM:'mwilck@suse.com' RCPT:''
X-RedHat-Spam-Score: -2.298  (RCVD_IN_DNSWL_MED, SPF_HELO_NONE,
	SPF_NONE) 137.65.250.81 smtp2.provo.novell.com
	137.65.250.81 smtp2.provo.novell.com <mwilck@suse.com>
X-Scanned-By: MIMEDefang 2.78 on 10.5.110.28
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com, Xose Vazquez Perez <xose.vazquez@gmail.com>,
	Martin Wilck <mwilck@suse.com>
Subject: [dm-devel] [PATCH v2 9/9] mpathpersist.8: add documentation for
	--batch-file (-f)
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.42]); Mon, 27 May 2019 13:01:54 +0000 (UTC)

Signed-off-by: Martin Wilck <mwilck@suse.com>
---
 mpathpersist/mpathpersist.8 | 78 ++++++++++++++++++++++++++++++++++++-
 1 file changed, 77 insertions(+), 1 deletion(-)

diff --git a/mpathpersist/mpathpersist.8 b/mpathpersist/mpathpersist.8
index cd602e40..882043ae 100644
--- a/mpathpersist/mpathpersist.8
+++ b/mpathpersist/mpathpersist.8
@@ -5,7 +5,7 @@
 .\"
 .\" ----------------------------------------------------------------------------
 .
-.TH MPATHPERSIST 8 2016-10-30 "Linux"
+.TH MPATHPERSIST 8 2019-05-27 "Linux"
 .
 .
 .\" ----------------------------------------------------------------------------
@@ -71,6 +71,11 @@ Informational messages with trace enabled.
 Query or change DEVICE.
 .
 .TP
+.BI \--batch-file=\fIDEVICE\fB|\-f " FILE"
+Read commands from \fIFILE\fR. See section \(dqBATCH FILES\(dq below. This
+option can be given at most once.
+.
+.TP
 .B \--help|\-h
 Output this usage message.
 .
@@ -207,6 +212,77 @@ Remove current reservation, and unregister all registered keys from all I_T nexu
 .
 .
 .\" ----------------------------------------------------------------------------
+.SH BATCH FILES
+.\" ----------------------------------------------------------------------------
+.
+.PP
+The option \fI--batch-file\fR (\fI-f\fR) sets an input file to be processed
+by \fBmpathpersist\fR. Grouping commands in batch files can provide a speed
+improvement in particular on large installments, because \fBmpathpersist\fR
+needs to scan existing paths and maps only once during startup.
+.
+.PP
+The input file is a text file that is parsed
+line by line. Every line of the file is interpreted as a command line
+(i.e. list of options and parameters) for \fBmpathpersist\fR. Options
+and parameters are separated by one or more whitespace characters (space or TAB).
+Lines can, but do not have to, begin with the word \(dqmpathpersist\(dq.
+The \(dq#\(dq character, either at the beginning of the line or following
+some whitespace, denotes the start of a comment that lasts until the end of the
+line. Empty lines are allowed. Continuation of mpathpersist commands over
+multiple lines is not supported.
+.
+.PP
+All options listed in this man page, except \fI-f\fR and
+\fI-v\fR, are allowed in batch files. Both short and long option formats may be used.
+Using the  \fI-f\fR option inside the batch file is an error. The \fI-v\fR
+option is ignored in batch files.
+.
+.PP
+The multipath map on which to act must be specified on every input line, e.g. using the \fI-d\fR option.
+Commands acting on different multipath maps may be combined in a
+batch file, and multiple commands may act on the same multipath
+map. Commands are executed one by one, so
+that commands further down in the file see status changes caused by previous
+commands.
+If \fBmpathpersist\fR encounters an error while processing a line in the
+batch file, batch file processing is \fBnot\fR aborted; subsequent commands
+are executed nonetheless. The exit status of \fBmpathpersist\fR is the status
+of the first failed command, or 0 if all commands succeeded.
+.
+.PP
+If other options and parameters are used along with
+\fI-f\fR on the \fBmpathpersist\fR command line, the command line will be executed first, followed
+by the commands from the the batch file.
+.
+.PP
+Below is an example of a valid batch input file.
+.
+.PP
+.RS
+.EX
+# This is an mpathpersist input file.
+# Short and long forms of the same command
+-i -k /dev/dm-1 # short form, this comment is ignored
+mpathpersist --in --read-keys --device=/dev/dm-1
+
+# Mixing of long and short options, variable white space
+  --out  --register    -S  abcde     /dev/dm-1
+
+# Mixing of commands for different maps
+-ir /dev/dm-0
+-ir /dev/dm-1
+
+mpathpersist --out --param-rk abcde --reserve --prout-type 5 /dev/dm-1
+# This should now show a reservation
+-ir /dev/dm-1
+-oCK abcde /dev/dm-1
+--in --read-reservation /dev/dm-1
+.EE
+.RE
+.
+.
+.\" ----------------------------------------------------------------------------
 .SH "SEE ALSO"
 .\" ----------------------------------------------------------------------------
 .
-- 
2.21.0

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
