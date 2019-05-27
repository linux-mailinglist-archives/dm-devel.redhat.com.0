Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id A6D212B5F4
	for <lists+dm-devel@lfdr.de>; Mon, 27 May 2019 15:01:58 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 9BEF6308621E;
	Mon, 27 May 2019 13:01:44 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6C4162B445;
	Mon, 27 May 2019 13:01:42 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 8EDA1206D6;
	Mon, 27 May 2019 13:01:38 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x4RD0eea009912 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 27 May 2019 09:00:41 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id C4B9A6A248; Mon, 27 May 2019 13:00:40 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx01.extmail.prod.ext.phx2.redhat.com
	[10.5.110.25])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BCAB16C350;
	Mon, 27 May 2019 13:00:40 +0000 (UTC)
Received: from smtp2.provo.novell.com (smtp2.provo.novell.com [137.65.250.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
	bits)) (No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 6B0E981DE8;
	Mon, 27 May 2019 13:00:32 +0000 (UTC)
Received: from apollon.suse.de.de (prva10-snat226-2.provo.novell.com
	[137.65.226.36])
	by smtp2.provo.novell.com with ESMTP (TLS encrypted);
	Mon, 27 May 2019 07:00:23 -0600
From: Martin Wilck <mwilck@suse.com>
To: Christophe Varoqui <christophe.varoqui@opensvc.com>,
	Benjamin Marzinski <bmarzins@redhat.com>
Date: Mon, 27 May 2019 14:59:41 +0200
Message-Id: <20190527125942.8366-9-mwilck@suse.com>
In-Reply-To: <20190527125942.8366-1-mwilck@suse.com>
References: <20190527125942.8366-1-mwilck@suse.com>
MIME-Version: 1.0
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 216
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.25]); Mon, 27 May 2019 13:00:33 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.25]);
	Mon, 27 May 2019 13:00:33 +0000 (UTC) for IP:'137.65.250.81'
	DOMAIN:'smtp2.provo.novell.com' HELO:'smtp2.provo.novell.com'
	FROM:'mwilck@suse.com' RCPT:''
X-RedHat-Spam-Score: -2.298  (RCVD_IN_DNSWL_MED, SPF_HELO_NONE,
	SPF_NONE) 137.65.250.81 smtp2.provo.novell.com
	137.65.250.81 smtp2.provo.novell.com <mwilck@suse.com>
X-Scanned-By: MIMEDefang 2.83 on 10.5.110.25
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com, Xose Vazquez Perez <xose.vazquez@gmail.com>,
	Martin Wilck <mwilck@suse.com>
Subject: [dm-devel] [PATCH v2 8/9] mpathpersist.8: fix examples in man page
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.42]); Mon, 27 May 2019 13:01:57 +0000 (UTC)

--prout-type is ignored in the REGISTER service action. The RESERVE service
action takes a Reservation Key, not a Service action Reservation Key, as
argument. The text mentions "Service Action Reservation Key" in several places
where it means the Reservation Key. Add examples for unregistering the current
key, and the CLEAR service action. Fix formatting with longer text in the
description lines (the .TP formatting would produce bad results if the
first line needs to be broken).

Signed-off-by: Martin Wilck <mwilck@suse.com>
---
 mpathpersist/mpathpersist.8 | 43 +++++++++++++++++++++++++++++--------
 1 file changed, 34 insertions(+), 9 deletions(-)

diff --git a/mpathpersist/mpathpersist.8 b/mpathpersist/mpathpersist.8
index 885491dd..cd602e40 100644
--- a/mpathpersist/mpathpersist.8
+++ b/mpathpersist/mpathpersist.8
@@ -167,18 +167,43 @@ PR In: maximum allocation length. LEN is a decimal number between 0 and 8192.
 .SH EXAMPLE
 .\" ----------------------------------------------------------------------------
 .
-.TP
-Register the Service Action Reservation Key for the /dev/mapper/mpath9 device:
-\fBmpathpersist --out --register --param-sark=\fI123abc \fB--prout-type=\fI5 /dev/mapper/mpath9\fR
-.TP
-Read the Service Action Reservation Key for the /dev/mapper/mpath9 device:
+.PP
+Register the key \(dq123abc\(dq for the /dev/mapper/mpath9 device:
+.RS
+\fBmpathpersist --out --register --param-sark=\fI123abc /dev/mapper/mpath9\fR
+.RE
+.PP
+Read registered reservation keys for the /dev/mapper/mpath9 device:
+.RS
 \fBmpathpersist -i -k \fI/dev/mapper/mpath9\fR
-.TP
-Reserve the Service Action Reservation Key for the /dev/mapper/mpath9 device:
-\fBmpathpersist --out --reserve --param-sark=\fI123abc \fB--prout-type=\fI8 \fB-d \fI/dev/mapper/mpath9\fR
-.TP
+.RE
+.PP
+Create a reservation for the /dev/mapper/mpath9 device with the given
+reservation key:
+.RS
+\fBmpathpersist --out --reserve --param-rk=\fI123abc \fB--prout-type=\fI8 \fB-d \fI/dev/mapper/mpath9\fR
+.RE
+.PP
 Read the reservation status of the /dev/mapper/mpath9 device:
+.RS
 \fBmpathpersist -i -s -d \fI/dev/mapper/mpath9\fR
+.RE
+.PP
+Release the previously created reservation (note that the prout-type needs to
+be the same as above):
+.RS
+\fBmpathpersist --out --release --param-rk=\fI123abc \fB--prout-type=\fI8 \fB-d \fI/dev/mapper/mpath9\fR
+.RE
+.PP
+Remove the current key registered for this host (i.e. reset it to 0):
+.RS
+\fBmpathpersist --out --register-ignore -K \fI123abc\fB -S \fI0\fB \fI/dev/mapper/mpath9\fR
+.RE
+.PP
+Remove current reservation, and unregister all registered keys from all I_T nexuses:
+.RS
+\fBmpathpersist -oCK \fI123abc \fI/dev/mapper/mpath9\fR
+.RE
 .
 .
 .\" ----------------------------------------------------------------------------
-- 
2.21.0

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
