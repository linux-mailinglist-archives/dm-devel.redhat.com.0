Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 5041427BE79
	for <lists+dm-devel@lfdr.de>; Tue, 29 Sep 2020 09:55:38 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-221-TpdGftIHPxyfIUQgfE6H3Q-1; Tue, 29 Sep 2020 03:55:35 -0400
X-MC-Unique: TpdGftIHPxyfIUQgfE6H3Q-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AA1861019649;
	Tue, 29 Sep 2020 07:55:28 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8378B65F5E;
	Tue, 29 Sep 2020 07:55:28 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 31474181A050;
	Tue, 29 Sep 2020 07:55:28 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 08SJAbia010146 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 28 Sep 2020 15:10:37 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 10AF21730C; Mon, 28 Sep 2020 19:10:37 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0BF3286D8D
	for <dm-devel@redhat.com>; Mon, 28 Sep 2020 19:10:34 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 58C8218AE953
	for <dm-devel@redhat.com>; Mon, 28 Sep 2020 19:10:34 +0000 (UTC)
Received: from EUR06-DB8-obe.outbound.protection.outlook.com
	(mail-db8eur06olkn2107.outbound.protection.outlook.com [40.92.51.107])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-112-ECAEbArEOza1yC6Kv5VHEQ-1; Mon, 28 Sep 2020 15:10:27 -0400
X-MC-Unique: ECAEbArEOza1yC6Kv5VHEQ-1
Received: from AM7EUR06FT066.eop-eur06.prod.protection.outlook.com
	(2a01:111:e400:fc36::50) by
	AM7EUR06HT053.eop-eur06.prod.protection.outlook.com
	(2a01:111:e400:fc36::62) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3412.21;
	Mon, 28 Sep 2020 19:10:24 +0000
Received: from AM0PR09MB2897.eurprd09.prod.outlook.com
	(2a01:111:e400:fc36::44) by AM7EUR06FT066.mail.protection.outlook.com
	(2a01:111:e400:fc36::475) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3412.21 via
	Frontend Transport; Mon, 28 Sep 2020 19:10:24 +0000
X-IncomingTopHeaderMarker: OriginalChecksum:D691B3945DF1B5259FA884056E931E18F2383C1AF33F15F1797C9801BAC0F737;
	UpperCasedChecksum:D33225EAB9475DE471E6EB76F48F4E50BB1FA44E8CA9178DBE5EF7CBA2738AA8;
	SizeAsReceived:7520; Count:47
Received: from AM0PR09MB2897.eurprd09.prod.outlook.com
	([fe80::5599:5bc3:3b28:d3c0]) by
	AM0PR09MB2897.eurprd09.prod.outlook.com
	([fe80::5599:5bc3:3b28:d3c0%4]) with mapi id 15.20.3412.029;
	Mon, 28 Sep 2020 19:10:24 +0000
From: Frank Meinl <frank.meinl@live.de>
To: dm-devel@redhat.com
Date: Mon, 28 Sep 2020 21:09:57 +0200
Message-ID: <AM0PR09MB289766D38FDC2D4F424B95AEFE350@AM0PR09MB2897.eurprd09.prod.outlook.com>
X-ClientProxiedBy: AM3PR05CA0141.eurprd05.prod.outlook.com
	(2603:10a6:207:3::19) To AM0PR09MB2897.eurprd09.prod.outlook.com
	(2603:10a6:208:131::33)
X-Microsoft-Original-Message-ID: <20200928190957.8284-1-frank.meinl@live.de>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (2a02:8070:a196:3b00:5cc6:6fdf:b734:3923)
	by AM3PR05CA0141.eurprd05.prod.outlook.com
	(2603:10a6:207:3::19) with Microsoft SMTP Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384)
	id 15.20.3412.22 via Frontend Transport;
	Mon, 28 Sep 2020 19:10:22 +0000
X-Microsoft-Original-Message-ID: <20200928190957.8284-1-frank.meinl@live.de>
X-TMN: [SegyygQxfEWK6CW1onY/O/huljwStC//DNftAcb0vrnUDqn2uOXNe3x/6IDrjOgnthpjCErrOao=]
X-MS-PublicTrafficType: Email
X-IncomingHeaderCount: 47
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-Correlation-Id: 6cfa5bef-3ad7-4e5c-2ea3-08d863e22679
X-MS-TrafficTypeDiagnostic: AM7EUR06HT053:
X-Microsoft-Antispam: BCL:0
X-Microsoft-Antispam-Message-Info: xP4XtDzYd3TNh1b20W7ZB/9m5R5CoUipw2kM7wWlLK1D+cMOvjgvSfq1YDtaoE6hy7s7CWaOVCfugmk4Zm2nj2Cq0d9v8fV5FaSO8cPEBhCvmPgRVYl5h3EOF8MAjTiS3vIWX9uN79U4dRqCX5QO4bw6sYjmt8bw4h92Di7Dc6EAFshS4ZGCAcA08Wc4Fd8xevbCzvb8lUgVijrK8ZMvCw==
X-MS-Exchange-AntiSpam-MessageData: MVMXs8Unqd0FbmWAOd9yrhPt/4hyBg5M0JDtIWuZYq7/PS6HuJRFVwUxpDwUBs7d2pUZp1OTxZDBLVhC5jBVJdaKlEiwyM7OnYhQB1vNuVq8b/O9gfSDLDcR3YgDAeq0UrSAXLTIKj+QN/W+xszr0ggphaHnS6gFuWBzbRXH5FhSpWCKUbO9NDgLAlb7W6tPK67c01GqOHuhmejv2PfnJw==
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6cfa5bef-3ad7-4e5c-2ea3-08d863e22679
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2020 19:10:24.4422 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-AuthSource: AM7EUR06FT066.eop-eur06.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: Internet
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7EUR06HT053
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 08SJAbia010146
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Tue, 29 Sep 2020 03:54:59 -0400
Cc: Frank Meinl <frank.meinl@live.de>, mwilck@suse.com
Subject: [dm-devel] [PATCH v3] libmultipath: Allow discovery of USB devices
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
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
 libmultipath/print.c       |  2 ++
 libmultipath/structs.h     |  1 +
 multipath/multipath.conf.5 | 12 ++++++++++++
 6 files changed, 30 insertions(+), 3 deletions(-)

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
diff --git a/libmultipath/print.c b/libmultipath/print.c
index ea95d696..19de2c7c 100644
--- a/libmultipath/print.c
+++ b/libmultipath/print.c
@@ -684,6 +684,8 @@ snprint_path_protocol(char * buff, size_t len, const struct path * pp)
 			return snprintf(buff, len, "scsi:adt");
 		case SCSI_PROTOCOL_ATA:
 			return snprintf(buff, len, "scsi:ata");
+		case SCSI_PROTOCOL_USB:
+			return snprintf(buff, len, "scsi:usb");
 		case SCSI_PROTOCOL_UNSPEC:
 		default:
 			return snprintf(buff, len, "scsi:unspec");
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

