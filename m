Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ABBF505C0
	for <lists+dm-devel@lfdr.de>; Mon, 24 Jun 2019 11:30:55 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 3D06B30821BF;
	Mon, 24 Jun 2019 09:30:53 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 14E565D9C5;
	Mon, 24 Jun 2019 09:30:52 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 94E9F1806B1C;
	Mon, 24 Jun 2019 09:30:50 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x5O9TnHH005857 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 24 Jun 2019 05:29:49 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 3097F1972A; Mon, 24 Jun 2019 09:29:49 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx03.extmail.prod.ext.phx2.redhat.com
	[10.5.110.27])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2757F19C69;
	Mon, 24 Jun 2019 09:29:49 +0000 (UTC)
Received: from smtp2.provo.novell.com (smtp2.provo.novell.com [137.65.250.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
	bits)) (No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id AE5B883F4C;
	Mon, 24 Jun 2019 09:29:41 +0000 (UTC)
Received: from apollon.suse.de.de (prva10-snat226-2.provo.novell.com
	[137.65.226.36])
	by smtp2.provo.novell.com with ESMTP (TLS encrypted);
	Mon, 24 Jun 2019 03:29:36 -0600
From: Martin Wilck <mwilck@suse.com>
To: Benjamin Marzinski <bmarzins@redhat.com>,
	Christophe Varoqui <christophe.varoqui@opensvc.com>
Date: Mon, 24 Jun 2019 11:27:56 +0200
Message-Id: <20190624092756.7769-32-mwilck@suse.com>
In-Reply-To: <20190624092756.7769-1-mwilck@suse.com>
References: <20190624092756.7769-1-mwilck@suse.com>
MIME-Version: 1.0
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 216
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.27]); Mon, 24 Jun 2019 09:29:42 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.27]);
	Mon, 24 Jun 2019 09:29:42 +0000 (UTC) for IP:'137.65.250.81'
	DOMAIN:'smtp2.provo.novell.com' HELO:'smtp2.provo.novell.com'
	FROM:'mwilck@suse.com' RCPT:''
X-RedHat-Spam-Score: 0.174  (RCVD_IN_DNSWL_MED, SORTED_RECIPS, SPF_HELO_NONE,
	SPF_PASS) 137.65.250.81 smtp2.provo.novell.com
	137.65.250.81 smtp2.provo.novell.com <mwilck@suse.com>
X-Scanned-By: MIMEDefang 2.78 on 10.5.110.27
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com, Xose Vazquez Perez <xose.vazquez@gmail.com>,
	Tang Junhui <tang.junhui@zte.com.cn>, Martin Wilck <mwilck@suse.com>
Subject: [dm-devel] [PATCH v2 30/30] multipath.conf.5: Improve documentation
	of WWID determination
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.47]); Mon, 24 Jun 2019 09:30:53 +0000 (UTC)

Clarify the effect of setting uid_attrs, and document the effect of setting
uid_attribute to an empty string. Replace the arcane "vpd_pg83" with
something easier to understand. Tell the user that the defaults are
usually good enough.

Cc: Tang Junhui <tang.junhui@zte.com.cn>
Cc: Xose Vazquez Perez <xose.vazquez@gmail.com>
Signed-off-by: Martin Wilck <mwilck@suse.com>
---
 multipath/multipath.conf.5 | 48 ++++++++++++++++++++++++--------------
 1 file changed, 31 insertions(+), 17 deletions(-)

diff --git a/multipath/multipath.conf.5 b/multipath/multipath.conf.5
index d5fe38ac..f7d21b4c 100644
--- a/multipath/multipath.conf.5
+++ b/multipath/multipath.conf.5
@@ -241,23 +241,32 @@ The default is: \fBfailover\fR
 .
 .TP
 .B uid_attrs
-The udev attribute providing a unique path identifier for corresponding
-type of path devices. If this field is configured and matched with type
-of device, it would override any other methods providing for device
-unique identifier in config file, and it would activate merging uevents
-according to the identifier to promote effiecncy in processing uevents.
-It has no default value, if you want to identify path by udev attribute
-and to activate merging uevents for SCSI and DASD devices, you can set
-its value as: \fIuid_attrs "sd:ID_SERIAL dasd:ID_UID"\fR.
+.
+Setting this option activates \fBmerging uevents\fR by WWID, which may improve
+uevent processing effiency. Moreover, it's an alternative method to configure
+the udev properties to use for determining unique path identifiers (WWIDs).
 .RS
-.TP
-The default is: \fB<unset>\fR
+.PP
+The value of this option is a space separated list of records like
+\(dq\fItype:ATTR\fR\(dq, where \fItype\fR is matched against the beginning
+of the device node name (e.g. \fIsd:ATTR\fR matches \fIsda\fR), and
+\fIATTR\fR is the name of the udev property to use for matching devices.
+.PP
+If this option is configured and matches the device
+node name of a device, it overrides any other configured  methods for
+determining the WWID for this device.
+.PP
+The default is: \fB<unset>\fR. To enable uevent merging, set it e.g. to
+\(dqsd:ID_SERIAL dasd:ID_UID nvme:ID_WWN\(dq.
 .RE
 .
 .
 .TP
 .B uid_attribute
-The udev attribute providing a unique path identifier.
+The udev attribute providing a unique path identifier (WWID). If
+\fIuid_attribute\fR is set to the empty string, WWID determination is done
+using the \fIsysfs\fR method rather then using udev (not recommended in
+production; see \fBWWID generation\fR below).
 .RS
 .TP
 The default is: \fBID_SERIAL\fR, for SCSI devices
@@ -1635,8 +1644,8 @@ WWID is assumed to point to the same device.
 The WWID is generated by four methods (in the order of preference):
 .TP 17
 .B uid_attrs
-The WWID is derived from udev attributes by matching the device node name. See
-description of \fIuid_attrs\fR in the defaults section above.
+The WWID is derived from udev attributes by matching the device node name; cf
+\fIuid_attrs\fR above.
 .TP
 .B getuid_callout
 Use the specified external program; cf \fIgetuid_callout\fR above.
@@ -1651,10 +1660,15 @@ does not need to call any external programs here. However, under
 certain circumstances udev might not be able to generate the requested
 variable.
 .TP
-.B vpd_pg83
-If none of the \fIgetuid_callout\fR or \fIuid_attribute\fR parameters
-are present multipath will try to use the sysfs attribute
-\fIvpd_pg83\fR to generate the WWID.
+.B sysfs
+Try to determine the WWID from sysfs attributes.
+For SCSI devices, this means reading the Vital Product Data (VPD) page
+\(dqDevice Identification\(dq (0x83).
+.PP
+The default settings (using udev and \fBuid_attribute\fR configured from
+the built-in hardware table) should work fine
+in most scenarios. Users who want to enable uevent merging must set
+\fBuid_attrs\fR.
 .
 .
 .\" ----------------------------------------------------------------------------
-- 
2.21.0

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
