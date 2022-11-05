Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id D644D61DEB2
	for <lists+dm-devel@lfdr.de>; Sat,  5 Nov 2022 22:38:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1667684283;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=OS0q96vUKtVq0EMFlle2rzCmqSeG6dfZoX4b4cQM1Ew=;
	b=TyphsI5IrZT9GT9tVqvzxDpL+5AulkjP5UKZcMx6tHGJdnTU2DyXNsBYR3e0X4qJYl0i13
	wifvw2sL7HSTZajVj/6CI095Si3g/ZsVugOL52ZU7iUGxfSzfibZlM2DrXMoF3euhXhCd2
	yIV35nwcESFpvjzO1iqiG/2FR/uRDJQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-310-nRrAmhZkPeCYmWc3eRXXMQ-1; Sat, 05 Nov 2022 17:37:59 -0400
X-MC-Unique: nRrAmhZkPeCYmWc3eRXXMQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EED818027EA;
	Sat,  5 Nov 2022 21:37:57 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id C5E352028DC1;
	Sat,  5 Nov 2022 21:37:43 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 8D2BB19465A4;
	Sat,  5 Nov 2022 21:37:42 +0000 (UTC)
X-Original-To: dm-devel@listman.corp.redhat.com
Delivered-To: dm-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 00F091946586
 for <dm-devel@listman.corp.redhat.com>; Sat,  5 Nov 2022 21:37:40 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id CCE152024CC0; Sat,  5 Nov 2022 21:37:40 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C557D2024CBF
 for <dm-devel@redhat.com>; Sat,  5 Nov 2022 21:37:40 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A74158027EC
 for <dm-devel@redhat.com>; Sat,  5 Nov 2022 21:37:40 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com
 [209.85.221.49]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-330-t4POAKg4PY2mPW-XyJpiSQ-1; Sat, 05 Nov 2022 17:37:36 -0400
X-MC-Unique: t4POAKg4PY2mPW-XyJpiSQ-1
Received: by mail-wr1-f49.google.com with SMTP id h9so11397019wrt.0;
 Sat, 05 Nov 2022 14:37:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Tj8dy+FNwQZe2yXZFoX8wyZWCyiE16U1ubPBBCEIL18=;
 b=GGGl8f6oD9j4Fmy5nSGw4ol8rRoSOMChN+2nlNVRyswX0JpQUeV43qLvV+ym7IVNEe
 Y50tDzdA7XwU6rQLMT7wltBkeZWwkUvkYW1sR6wv3KhF1/z9xhIvtgcc50FNN4w9DwjA
 fYxWtBwSARXeyd9uCQhyLBCJot6UPaL6bLdhMLS6+GvG0TQKlvv8y10dKH2WT7W8ifrM
 f2yFkYy90IypQ2Jfoqf5spOdTj7OQuJzyu1nxnvw8mtlmiJJwiSL6fcD/pdqEGaELzg6
 U62a1TUnhZSoxwA04j4TgL0+KBw3GDrlociXa/zJtcd8T71jnjLk6uaWMFqVkVlQ1496
 Yb2Q==
X-Gm-Message-State: ACrzQf1DvnBoDRezZjXsG8F+baJIH5XvLEVZxjHqDujd5YRdFcUAX+v+
 Xkv5j0JD99UXW/fA9xtL0Q==
X-Google-Smtp-Source: AMsMyM5wT9Ts6Oa4eTjcnxNt8KoC1Qv5MwGM/5EyfZLAECkBWY4g4+t2ylRCEohcgllM2dA2vejHxg==
X-Received: by 2002:adf:e241:0:b0:238:3c64:decc with SMTP id
 bl1-20020adfe241000000b002383c64deccmr11059961wrb.698.1667684255263; 
 Sat, 05 Nov 2022 14:37:35 -0700 (PDT)
Received: from localhost (230.red-81-44-152.dynamicip.rima-tde.net.
 [81.44.152.230]) by smtp.gmail.com with ESMTPSA id
 k19-20020a05600c1c9300b003cf4c1e211fsm3704312wms.38.2022.11.05.14.37.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 05 Nov 2022 14:37:34 -0700 (PDT)
From: Xose Vazquez Perez <xose.vazquez@gmail.com>
To: 
Date: Sat,  5 Nov 2022 22:37:33 +0100
Message-Id: <20221105213733.182458-1-xose.vazquez@gmail.com>
MIME-Version: 1.0
X-Patchwork-Bot: notify
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Subject: [dm-devel] [PATCH] multipath-tools: multipath.conf man page
 housekeeping
X-BeenThere: dm-devel@redhat.com
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: device-mapper development <dm-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/dm-devel>,
 <mailto:dm-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <http://listman.redhat.com/archives/dm-devel/>
List-Post: <mailto:dm-devel@redhat.com>
List-Help: <mailto:dm-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/dm-devel>,
 <mailto:dm-devel-request@redhat.com?subject=subscribe>
Cc: Xose Vazquez Perez <xose.vazquez@gmail.com>, Martin Wilck <mwilck@suse.com>,
 DM-DEVEL ML <dm-devel@redhat.com>
Errors-To: dm-devel-bounces@redhat.com
Sender: "dm-devel" <dm-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Mark deprecated options as (Deprecated), and standardize the description
Document pg_timeout
Default value of "features" is "0"
directio is also an alternative to readsector0

Cc: Martin Wilck <mwilck@suse.com>
Cc: Benjamin Marzinski <bmarzins@redhat.com>
Cc: Christophe Varoqui <christophe.varoqui@opensvc.com>
Cc: DM-DEVEL ML <dm-devel@redhat.com>
Signed-off-by: Xose Vazquez Perez <xose.vazquez@gmail.com>
---
 multipath/multipath.conf.5 | 41 ++++++++++++++++++++------------------
 1 file changed, 22 insertions(+), 19 deletions(-)

diff --git a/multipath/multipath.conf.5 b/multipath/multipath.conf.5
index 8e28ba12..063b05a7 100644
--- a/multipath/multipath.conf.5
+++ b/multipath/multipath.conf.5
@@ -178,7 +178,7 @@ The default is: \fBno\fR
 .
 .TP
 .B multipath_dir
-This option is not supported any more. The value is ignored.
+(Deprecated) This option is not supported any more, and the value is ignored.
 .
 .
 .TP
@@ -242,6 +242,11 @@ The default is: \fBfailover\fR
 .
 .
 .TP
+.B pg_timeout
+(Deprecated) This option is not supported any more, and the value is ignored.
+.
+.
+.TP
 .B uid_attrs
 .
 Setting this option activates \fBmerging uevents\fR by WWID, which may improve
@@ -283,7 +288,7 @@ The default is: \fBID_WWN\fR, for NVMe devices
 .
 .TP
 .B getuid_callout
-This option is not supported any more. The value is ignored.
+(Deprecated) This option is not supported any more, and the value is ignored.
 .
 .
 .TP
@@ -468,7 +473,7 @@ cannot be changed. \fInvme:tcp\fR paths are only supported in multipath
 devices with queue_mode set to \fIbio\fR. multipath will automatically
 set this when creating a device with \fInvme:tcp\fR paths.
 .TP
-The default is: \fB<unset>\fR
+The default is: \fB0\fR
 .RE
 .
 .
@@ -484,7 +489,7 @@ second, until \fIchecker_timeout\fR seconds have elapsed. Possible values are:
 .TP 12
 .I readsector0
 (Deprecated) Read the first sector of the device. This checker is being
-deprecated, please use \fItur\fR instead.
+deprecated, please use \fItur\fR or \fIdirectio\fR instead.
 .TP
 .I tur
 Issue a \fITEST UNIT READY\fR command to the device.
@@ -556,7 +561,7 @@ The default is: \fBmanual\fR
 .
 .
 .TP
-.B  rr_min_io
+.B rr_min_io
 Number of I/O requests to route to a path before switching to the next in the
 same path group. This is only for \fIBlock I/O\fR(BIO) based multipath and
 only apply to \fIround-robin\fR path_selector.
@@ -740,7 +745,7 @@ The default is: \fB<unset>\fR
 .
 .TP
 .B bindings_file
-This option is deprecated, and will be removed in a future release.
+(Deprecated) This option is deprecated, and will be removed in a future release.
 The full pathname of the binding file to be used when the user_friendly_names
 option is set.
 .RS
@@ -751,7 +756,7 @@ The default is: \fB/etc/multipath/bindings\fR
 .
 .TP
 .B wwids_file
-This option is deprecated, and will be removed in a future release.
+(Deprecated) This option is deprecated, and will be removed in a future release.
 The full pathname of the WWIDs file, which is used by multipath to keep track
 of the WWIDs for LUNs it has created multipath devices on in the past.
 .RS
@@ -762,7 +767,7 @@ The default is: \fB/etc/multipath/wwids\fR
 .
 .TP
 .B prkeys_file
-This option is deprecated, and will be removed in a future release.
+(Deprecated) This option is deprecated, and will be removed in a future release.
 The full pathname of the prkeys file, which is used by multipathd to keep
 track of the persistent reservation key used for a specific WWID, when
 \fIreservation_key\fR is set to \fBfile\fR.
@@ -934,7 +939,7 @@ The default is: \fB<unset>\fR
 .
 .TP
 .B config_dir
-This option is not supported any more. The value is ignored.
+(Deprecated) This option is not supported any more, and the value is ignored.
 .
 .
 .TP
@@ -1047,7 +1052,7 @@ The default is: \fBno\fR
 .
 .TP
 .B delay_watch_checks
-This option is \fBdeprecated\fR, and mapped to \fIsan_path_err_forget_rate\fR.
+(Deprecated) This option is \fBdeprecated\fR, and mapped to \fIsan_path_err_forget_rate\fR.
 If this is set to a value greater than 0 and no \fIsan_path_err\fR options
 are set, \fIsan_path_err_forget_rate\fR will be set to the value of
 \fIdelay_watch_checks\fR and \fIsan_path_err_threshold\fR will be set to 1.
@@ -1061,7 +1066,7 @@ The default is: \fBno\fR
 .
 .TP
 .B delay_wait_checks
-This option is \fBdeprecated\fR, and mapped to \fIsan_path_err_recovery_time\fR.
+(Deprecated) This option is \fBdeprecated\fR, and mapped to \fIsan_path_err_recovery_time\fR.
 If this is set to a value greater than 0 and no \fIsan_path_err\fR options
 are set, \fIsan_path_err_recovery_time\fR will be set to the value of
 \fIdelay_wait_checks\fR times \fImax_polling_interval\fR. This will give
@@ -1228,8 +1233,7 @@ The default is: \fBno\fR
 .
 .TP
 .B disable_changed_wwids
-This option is deprecated and ignored. If the WWID of a path suddenly changes,
-multipathd handles it as if it was removed and then added again.
+(Deprecated) This option is not supported any more, and the value is ignored.
 .RE
 .
 .
@@ -1848,7 +1852,7 @@ normal pathgroup. The logic of determining \(dqshaky\(dq condition, as well as
 the logic when to reinstate, differs between the three methods.
 .TP 8
 .B \(dqdelay_checks\(dq failure tracking
-This method is \fBdeprecated\fR and mapped to the \(dqsan_path_err\(dq method.
+(Deprecated) This method is \fBdeprecated\fR and mapped to the \(dqsan_path_err\(dq method.
 See the \fIdelay_watch_checks\fR and \fIdelay_wait_checks\fR options above
 for more information.
 .
@@ -1878,16 +1882,15 @@ path checks by multipathd, which is variable and controlled by the
 .
 .TP
 .B \(dqFPIN \(dq failure tracking
+(Deprecated) This method is \fBdeprecated\fR in favor of the \(dqmarginal_path\(dq
+failure tracking method, and only offered for backward compatibility.
+.RS 8
+.LP
 Fibre channel fabrics can notify hosts about fabric-level issues such
 as integrity failures or congestion with so-called Fabric Performance
 Impact Notifications (FPINs).On receiving the fpin notifications through ELS
 multipathd will move the affected path and port states to marginal.
 .
-.RS 8
-.LP
-This method is \fBdeprecated\fR in favor of the \(dqmarginal_path\(dq failure
-tracking method, and only offered for backward compatibility.
-.
 .RE
 .LP
 See the documentation
-- 
2.38.1

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

