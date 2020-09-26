Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 8CA3927BE74
	for <lists+dm-devel@lfdr.de>; Tue, 29 Sep 2020 09:55:30 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-18-tvJurVulPJ-phnxbRJgmqw-1; Tue, 29 Sep 2020 03:55:26 -0400
X-MC-Unique: tvJurVulPJ-phnxbRJgmqw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D00561084C8D;
	Tue, 29 Sep 2020 07:55:20 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A71345D9E8;
	Tue, 29 Sep 2020 07:55:20 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 9ECE6180BA96;
	Tue, 29 Sep 2020 07:55:09 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 08QGSlhK015197 for <dm-devel@listman.util.phx.redhat.com>;
	Sat, 26 Sep 2020 12:28:47 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 740161084498; Sat, 26 Sep 2020 16:28:47 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6F6EA1084494
	for <dm-devel@redhat.com>; Sat, 26 Sep 2020 16:28:43 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 985018008A5
	for <dm-devel@redhat.com>; Sat, 26 Sep 2020 16:28:43 +0000 (UTC)
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
	(mail-oln040092069108.outbound.protection.outlook.com [40.92.69.108])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-206-m5zPy_0fOTOu6eVNiR56qw-1; Sat, 26 Sep 2020 12:28:40 -0400
X-MC-Unique: m5zPy_0fOTOu6eVNiR56qw-1
Received: from VE1EUR02FT039.eop-EUR02.prod.protection.outlook.com
	(2a01:111:e400:7e1e::48) by
	VE1EUR02HT217.eop-EUR02.prod.protection.outlook.com
	(2a01:111:e400:7e1e::372) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3412.21;
	Sat, 26 Sep 2020 16:28:38 +0000
Received: from AM0PR09MB2897.eurprd09.prod.outlook.com
	(2a01:111:e400:7e1e::45) by VE1EUR02FT039.mail.protection.outlook.com
	(2a01:111:e400:7e1e::394) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3412.21 via
	Frontend Transport; Sat, 26 Sep 2020 16:28:38 +0000
X-IncomingTopHeaderMarker: OriginalChecksum:C580F16D8DD68F4C08A83136A4ABE4699BE66A22A43B3748685914C7DC55A59C;
	UpperCasedChecksum:F4ED908AC1DACD6AD3CCADC22EE5E9A4D643782FC3F1EDA9A1C0AB9CF6DA5514;
	SizeAsReceived:7534; Count:47
Received: from AM0PR09MB2897.eurprd09.prod.outlook.com
	([fe80::5599:5bc3:3b28:d3c0]) by
	AM0PR09MB2897.eurprd09.prod.outlook.com
	([fe80::5599:5bc3:3b28:d3c0%4]) with mapi id 15.20.3412.025;
	Sat, 26 Sep 2020 16:28:38 +0000
From: Frank Meinl <frank.meinl@live.de>
To: dm-devel@redhat.com
Date: Sat, 26 Sep 2020 18:26:21 +0200
Message-ID: <AM0PR09MB289702395C44596866E4B9C3FE370@AM0PR09MB2897.eurprd09.prod.outlook.com>
X-ClientProxiedBy: AM4PR0701CA0029.eurprd07.prod.outlook.com
	(2603:10a6:200:42::39) To AM0PR09MB2897.eurprd09.prod.outlook.com
	(2603:10a6:208:131::33)
X-Microsoft-Original-Message-ID: <20200926162621.12630-1-frank.meinl@live.de>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from t7-ubuntu.fritz.box (2003:cb:f725:c400:118a:1cbb:61a9:a186) by
	AM4PR0701CA0029.eurprd07.prod.outlook.com
	(2603:10a6:200:42::39) with Microsoft SMTP Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384)
	id 15.20.3433.14 via Frontend Transport;
	Sat, 26 Sep 2020 16:26:40 +0000
X-Microsoft-Original-Message-ID: <20200926162621.12630-1-frank.meinl@live.de>
X-TMN: [lrCvYy8Ix/O693UH4v0umb5V/ZIabEkujwycbSN4rC9nGE9/FHoB7Ht82onaXqHh]
X-MS-PublicTrafficType: Email
X-IncomingHeaderCount: 47
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-Correlation-Id: c222cae7-8862-4f5d-7d1d-08d86238f2f7
X-MS-TrafficTypeDiagnostic: VE1EUR02HT217:
X-Microsoft-Antispam: BCL:0
X-Microsoft-Antispam-Message-Info: pCEVeLyZju/jCAdjlYLq2+sZm/tTGfgIviLWMHv2jxwxW9M0kxBtHsXegqwsOkJXFJEbYyV5eeqOJ3GQGUkuL78Ja1REPTBSjprXs+0PHX7lERLzpzQ5785MwJbGF2YibFuR0pOAg/AFML4Zr/3qNKIJBcGgeaIisR6NSxL9G+anyilk2HX92drhjai0NpKAoE1+DOKSeQwnK22vSDUwAA==
X-MS-Exchange-AntiSpam-MessageData: 2eJnTxqsHXNAEVKGdn+ifApU/eOBnyl2/i4MSk47MF9TGrSZPtDYfeUsjSY7M7RpKpwsJj3piGiyB3olLR5RIQqm97KMwsKlsSAFI3JaJ5EV/YiEfTAcFophUcycRupc2kA/TawVuR42Nu9hydX4zCS65ATByNCTaJvYXbLm5f4kEMOsdD/juLGvqrZAsbdKvwv0hWp/3wAPchAUUmnTZg==
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c222cae7-8862-4f5d-7d1d-08d86238f2f7
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2020 16:28:38.6893 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-AuthSource: VE1EUR02FT039.eop-EUR02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: Internet
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1EUR02HT217
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 08QGSlhK015197
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Tue, 29 Sep 2020 03:54:59 -0400
Cc: Frank Meinl <frank.meinl@live.de>, mwilck@suse.com
Subject: [dm-devel] [PATCH v2 1/2] libmultipath: Allow discovery of USB
	devices
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
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
 multipath/multipath.conf.5 | 12 ++++++++++++
 5 files changed, 28 insertions(+), 3 deletions(-)

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
index 2f301ac4..193d7127 100644
--- a/libmultipath/discovery.c
+++ b/libmultipath/discovery.c
@@ -375,11 +375,10 @@ sysfs_get_tgt_nodename(struct path *pp, char *node)
 	while (tgtdev) {
 		value = udev_device_get_subsystem(tgtdev);
 		if (value && !strcmp(value, "usb")) {
-			pp->sg_id.proto_id = SCSI_PROTOCOL_UNSPEC;
+			pp->sg_id.proto_id = SCSI_PROTOCOL_USB;
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
+		    pp->sg_id.proto_id == SCSI_PROTOCOL_USB &&
+		    !conf->allow_usb_devices) {
+			condlog(3, "%s: skip USB device %s", pp->dev,
+				pp->tgt_node_name);
+			return PATHINFO_SKIPPED;
+		}
 	}
 
 	if (mask & DI_BLACKLIST && mask & DI_SYSFS) {
diff --git a/libmultipath/structs.h b/libmultipath/structs.h
index 4afd3e88..7de93d6c 100644
--- a/libmultipath/structs.h
+++ b/libmultipath/structs.h
@@ -174,6 +174,7 @@ enum scsi_protocol {
 	SCSI_PROTOCOL_SAS = 6,
 	SCSI_PROTOCOL_ADT = 7,	/* Media Changers */
 	SCSI_PROTOCOL_ATA = 8,
+	SCSI_PROTOCOL_USB = 9,  /* USB Attached SCSI (UAS), and others */
 	SCSI_PROTOCOL_UNSPEC = 0xf, /* No specific protocol */
 };
 
diff --git a/multipath/multipath.conf.5 b/multipath/multipath.conf.5
index 5adaced6..60fa12a2 100644
--- a/multipath/multipath.conf.5
+++ b/multipath/multipath.conf.5
@@ -643,6 +643,18 @@ The default is: in \fB/sys/block/sd<x>/device/timeout\fR
 .
 .
 .TP
+.B allow_usb_devices
+If set to
+.I no
+, all USB devices will be skipped during path discovery. If you intend to use
+multipath on USB attached devices, set this to \fIyes\fR.
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

