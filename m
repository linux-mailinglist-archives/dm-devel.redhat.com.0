Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 0E24A27532A
	for <lists+dm-devel@lfdr.de>; Wed, 23 Sep 2020 10:23:00 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-316--4FTnA4SMs6uwFmEj64Upw-1; Wed, 23 Sep 2020 04:22:57 -0400
X-MC-Unique: -4FTnA4SMs6uwFmEj64Upw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D381D85C706;
	Wed, 23 Sep 2020 08:22:51 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2D1E655764;
	Wed, 23 Sep 2020 08:22:50 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id B04308C7AA;
	Wed, 23 Sep 2020 08:22:46 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 08MIZYBd030331 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 22 Sep 2020 14:35:34 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 362202156A30; Tue, 22 Sep 2020 18:35:34 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2FF4C2156A23
	for <dm-devel@redhat.com>; Tue, 22 Sep 2020 18:35:32 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0EA01811E8F
	for <dm-devel@redhat.com>; Tue, 22 Sep 2020 18:35:32 +0000 (UTC)
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
	(mail-oln040092070054.outbound.protection.outlook.com [40.92.70.54])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-499-g1JaCD_2NEGhWU3IrecVCw-1; Tue, 22 Sep 2020 14:35:29 -0400
X-MC-Unique: g1JaCD_2NEGhWU3IrecVCw-1
Received: from AM5EUR03FT062.eop-EUR03.prod.protection.outlook.com
	(2a01:111:e400:7e08::4a) by
	AM5EUR03HT241.eop-EUR03.prod.protection.outlook.com
	(2a01:111:e400:7e08::188) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3391.15;
	Tue, 22 Sep 2020 18:35:28 +0000
Received: from AM0PR09MB2897.eurprd09.prod.outlook.com
	(2a01:111:e400:7e08::48) by AM5EUR03FT062.mail.protection.outlook.com
	(2a01:111:e400:7e08::376) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3391.15 via
	Frontend Transport; Tue, 22 Sep 2020 18:35:28 +0000
X-IncomingTopHeaderMarker: OriginalChecksum:D17EA8C772780EE16F33FCB4645BCC87209C8D4165A7701930C49BD33CDEC8F1;
	UpperCasedChecksum:5917EECAE923699500D744893A1B59E9CDFCD6DA2FF5F30A2D64F153027FD746;
	SizeAsReceived:7532; Count:47
Received: from AM0PR09MB2897.eurprd09.prod.outlook.com
	([fe80::5599:5bc3:3b28:d3c0]) by
	AM0PR09MB2897.eurprd09.prod.outlook.com
	([fe80::5599:5bc3:3b28:d3c0%4]) with mapi id 15.20.3412.020;
	Tue, 22 Sep 2020 18:35:27 +0000
From: Frank Meinl <frank.meinl@live.de>
To: dm-devel@redhat.com
Date: Tue, 22 Sep 2020 20:34:30 +0200
Message-ID: <AM0PR09MB289726B5423506E7A0CBFA47FE3B0@AM0PR09MB2897.eurprd09.prod.outlook.com>
X-ClientProxiedBy: FR2P281CA0029.DEUP281.PROD.OUTLOOK.COM
	(2603:10a6:d10:14::16) To AM0PR09MB2897.eurprd09.prod.outlook.com
	(2603:10a6:208:131::33)
X-Microsoft-Original-Message-ID: <20200922183430.27895-1-frank.meinl@live.de>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (2a02:8070:a196:3b00:dc3c:ad29:d9fd:8a26)
	by FR2P281CA0029.DEUP281.PROD.OUTLOOK.COM
	(2603:10a6:d10:14::16) with Microsoft SMTP Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384)
	id 15.20.3412.20 via Frontend Transport;
	Tue, 22 Sep 2020 18:35:27 +0000
X-Microsoft-Original-Message-ID: <20200922183430.27895-1-frank.meinl@live.de>
X-TMN: [sTftblE5eM6leN739Y17YwnzTmjBx2qYShUbHEv2WZ4o6m8dJCUdK9r1uT4Z8xJ+07pNAjTLr00=]
X-MS-PublicTrafficType: Email
X-IncomingHeaderCount: 47
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-Correlation-Id: 724bfaff-5a0e-422e-1bc9-08d85f2646b7
X-MS-TrafficTypeDiagnostic: AM5EUR03HT241:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jwbDkXbk3gfDOlz2EcwCYQXg4KSoGPRUZaW2a7S6t5Sh+XDvKvNuTt3NUTsMl5dF3QqYwdiO1VUWHXffU9pD4WeK+d8MJh9vMd9RAp6wknMZRGz2XVQvpG/gOFaKUwk10tdmy2cu8tK34JLFnu7U+BG94W43c5q6HZZLHrpFXb/rCoXThP66NQlwED0GLHCOI3DHzw673AvmvsNW9vRYSA==
X-MS-Exchange-AntiSpam-MessageData: 7fAs4n+u6NYnl77s4yKSKpiYDdnrOtepaQwV2y6r7elJHvUxrH2Y9kmRyUmEi7AMBbJX4D1PBi6krqbykOwxsVJkn0qTE2rd/tzVDHDmk8qwrCmrNqmUkroOBKpeJckZlkd/MHT+8cG7Z6iHWz8aj2vlBktRnLL+sfYfdL/pHEPMeZkOVuWLDLWya3PUKga9gbRfb3nohpY1o109R1d+ag==
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 724bfaff-5a0e-422e-1bc9-08d85f2646b7
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2020 18:35:27.8812 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-AuthSource: AM5EUR03FT062.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: Internet
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5EUR03HT241
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false;
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 08MIZYBd030331
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Wed, 23 Sep 2020 04:22:39 -0400
Cc: Frank Meinl <frank.meinl@live.de>, mwilck@suse.com
Subject: [dm-devel] [PATCH] libmultipath: Allow discovery of USB devices
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

This change adds a new configuration option allow_usb_devices. It is
disabled by default, so that the behavior of existing setups is not
changed. If enabled (via multipath.conf), USB devices will be found
during device discovery and can be used for multipath setups.

Without this option, multipath currently ignores all USB drives, which
is convenient for most users. (refer also to commit 51957eb)

However, it can be beneficial to use the multipath dm-module even if
there is only a single path to an USB attached storage. In combination
with the option 'queue_if_no_path', such a setup survives a temporary
device disconnect without any severe consequences for the running
applications. All I/O is queued until the device reappears.

Signed-off-by: Frank Meinl <frank.meinl@live.de>
---
 libmultipath/config.h      |  1 +
 libmultipath/dict.c        |  4 ++++
 libmultipath/discovery.c   | 13 ++++++++++---
 libmultipath/structs.h     |  1 +
 multipath/multipath.conf.5 | 14 ++++++++++++++
 5 files changed, 30 insertions(+), 3 deletions(-)

diff --git a/libmultipath/config.h b/libmultipath/config.h
index 2bb7153b..290aea58 100644
--- a/libmultipath/config.h
+++ b/libmultipath/config.h
@@ -158,6 +158,7 @@ struct config {
 	unsigned int dev_loss;
 	int log_checker_err;
 	int allow_queueing;
+	int allow_usb_devices;
 	int find_multipaths;
 	uid_t uid;
 	gid_t gid;
diff --git a/libmultipath/dict.c b/libmultipath/dict.c
index feabae56..f12c2e5c 100644
--- a/libmultipath/dict.c
+++ b/libmultipath/dict.c
@@ -543,6 +543,9 @@ snprint_def_queue_without_daemon (struct config *conf,
 declare_def_handler(checker_timeout, set_int)
 declare_def_snprint(checker_timeout, print_nonzero)
 
+declare_def_handler(allow_usb_devices, set_yes_no)
+declare_def_snprint(allow_usb_devices, print_yes_no)
+
 declare_def_handler(flush_on_last_del, set_yes_no_undef)
 declare_def_snprint_defint(flush_on_last_del, print_yes_no_undef, DEFAULT_FLUSH)
 declare_ovr_handler(flush_on_last_del, set_yes_no_undef)
@@ -1759,6 +1762,7 @@ init_keywords(vector keywords)
 	install_keyword("no_path_retry", &def_no_path_retry_handler, &snprint_def_no_path_retry);
 	install_keyword("queue_without_daemon", &def_queue_without_daemon_handler, &snprint_def_queue_without_daemon);
 	install_keyword("checker_timeout", &def_checker_timeout_handler, &snprint_def_checker_timeout);
+	install_keyword("allow_usb_devices", &def_allow_usb_devices_handler, &snprint_def_allow_usb_devices);
 	install_keyword("pg_timeout", &deprecated_handler, &snprint_deprecated);
 	install_keyword("flush_on_last_del", &def_flush_on_last_del_handler, &snprint_def_flush_on_last_del);
 	install_keyword("user_friendly_names", &def_user_friendly_names_handler, &snprint_def_user_friendly_names);
diff --git a/libmultipath/discovery.c b/libmultipath/discovery.c
index 2f301ac4..4b615caa 100644
--- a/libmultipath/discovery.c
+++ b/libmultipath/discovery.c
@@ -375,11 +375,10 @@ sysfs_get_tgt_nodename(struct path *pp, char *node)
 	while (tgtdev) {
 		value = udev_device_get_subsystem(tgtdev);
 		if (value && !strcmp(value, "usb")) {
-			pp->sg_id.proto_id = SCSI_PROTOCOL_UNSPEC;
+			pp->sg_id.proto_id = SCSI_PROTOCOL_UAS;
 			tgtname = udev_device_get_sysname(tgtdev);
 			strlcpy(node, tgtname, NODE_NAME_SIZE);
-			condlog(3, "%s: skip USB device %s", pp->dev, node);
-			return 1;
+			return 0;
 		}
 		tgtdev = udev_device_get_parent(tgtdev);
 	}
@@ -2136,6 +2135,14 @@ int pathinfo(struct path *pp, struct config *conf, int mask)
 
 		if (rc != PATHINFO_OK)
 			return rc;
+
+		if (pp->bus == SYSFS_BUS_SCSI &&
+		    pp->sg_id.proto_id == SCSI_PROTOCOL_UAS &&
+		    !conf->allow_usb_devices) {
+			condlog(3, "%s: skip USB device %s", pp->dev,
+				pp->tgt_node_name);
+			return PATHINFO_SKIPPED;
+		}
 	}
 
 	if (mask & DI_BLACKLIST && mask & DI_SYSFS) {
diff --git a/libmultipath/structs.h b/libmultipath/structs.h
index 4afd3e88..284c1e45 100644
--- a/libmultipath/structs.h
+++ b/libmultipath/structs.h
@@ -174,6 +174,7 @@ enum scsi_protocol {
 	SCSI_PROTOCOL_SAS = 6,
 	SCSI_PROTOCOL_ADT = 7,	/* Media Changers */
 	SCSI_PROTOCOL_ATA = 8,
+	SCSI_PROTOCOL_UAS = 9,  /* USB Attached SCSI */
 	SCSI_PROTOCOL_UNSPEC = 0xf, /* No specific protocol */
 };
 
diff --git a/multipath/multipath.conf.5 b/multipath/multipath.conf.5
index 5adaced6..21b3bfb6 100644
--- a/multipath/multipath.conf.5
+++ b/multipath/multipath.conf.5
@@ -643,6 +643,20 @@ The default is: in \fB/sys/block/sd<x>/device/timeout\fR
 .
 .
 .TP
+.B allow_usb_devices
+If set to
+.I no
+, all USB devices will be skipped during path discovery. This is convenient
+for most users, as it effectively hides all attached USB disks and flash
+drives from the multipath application. However, if you intend to use multipath
+on USB attached devices, set this to \fIyes\fR.
+.RS
+.TP
+The default is: \fBno\fR
+.RE
+.
+.
+.TP
 .B flush_on_last_del
 If set to
 .I yes
-- 
2.25.1


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

