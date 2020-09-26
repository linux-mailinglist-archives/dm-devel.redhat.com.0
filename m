Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id B44F927BE76
	for <lists+dm-devel@lfdr.de>; Tue, 29 Sep 2020 09:55:31 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-187-EQz4ArhLORizVzJmdkqMIQ-1; Tue, 29 Sep 2020 03:55:27 -0400
X-MC-Unique: EQz4ArhLORizVzJmdkqMIQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 270AF81CAFF;
	Tue, 29 Sep 2020 07:55:22 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9CC456198C;
	Tue, 29 Sep 2020 07:55:21 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 5574C1826D29;
	Tue, 29 Sep 2020 07:55:21 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 08QGVGlT015451 for <dm-devel@listman.util.phx.redhat.com>;
	Sat, 26 Sep 2020 12:31:16 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 5DEB4115D7D0; Sat, 26 Sep 2020 16:31:16 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 595EB115D7CF
	for <dm-devel@redhat.com>; Sat, 26 Sep 2020 16:31:12 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BB85C858287
	for <dm-devel@redhat.com>; Sat, 26 Sep 2020 16:31:12 +0000 (UTC)
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
	(mail-oln040092069046.outbound.protection.outlook.com [40.92.69.46])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-491-UQY6rDjkPbC3LmtmAunTAA-1; Sat, 26 Sep 2020 12:31:10 -0400
X-MC-Unique: UQY6rDjkPbC3LmtmAunTAA-1
Received: from VE1EUR02FT039.eop-EUR02.prod.protection.outlook.com
	(2a01:111:e400:7e1e::48) by
	VE1EUR02HT176.eop-EUR02.prod.protection.outlook.com
	(2a01:111:e400:7e1e::237) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3412.21;
	Sat, 26 Sep 2020 16:31:08 +0000
Received: from AM0PR09MB2897.eurprd09.prod.outlook.com
	(2a01:111:e400:7e1e::45) by VE1EUR02FT039.mail.protection.outlook.com
	(2a01:111:e400:7e1e::394) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3412.21 via
	Frontend Transport; Sat, 26 Sep 2020 16:31:08 +0000
X-IncomingTopHeaderMarker: OriginalChecksum:93A528F8DFF86DB3A065FA6D2182BE65D6124764FBDFFF7FD006D9E24228C908;
	UpperCasedChecksum:4EC714D12DB341FBE75F832F9B072CE628EE6F994565C7E5CE25ECC6E0FC41C7;
	SizeAsReceived:7690; Count:49
Received: from AM0PR09MB2897.eurprd09.prod.outlook.com
	([fe80::5599:5bc3:3b28:d3c0]) by
	AM0PR09MB2897.eurprd09.prod.outlook.com
	([fe80::5599:5bc3:3b28:d3c0%4]) with mapi id 15.20.3412.025;
	Sat, 26 Sep 2020 16:31:08 +0000
From: Frank Meinl <frank.meinl@live.de>
To: dm-devel@redhat.com
Date: Sat, 26 Sep 2020 18:29:47 +0200
Message-ID: <AM0PR09MB2897B99544634CA56DA930D1FE370@AM0PR09MB2897.eurprd09.prod.outlook.com>
In-Reply-To: <AM0PR09MB289702395C44596866E4B9C3FE370@AM0PR09MB2897.eurprd09.prod.outlook.com>
References: <AM0PR09MB289702395C44596866E4B9C3FE370@AM0PR09MB2897.eurprd09.prod.outlook.com>
X-ClientProxiedBy: AM3PR04CA0132.eurprd04.prod.outlook.com (2603:10a6:207::16)
	To AM0PR09MB2897.eurprd09.prod.outlook.com
	(2603:10a6:208:131::33)
X-Microsoft-Original-Message-ID: <20200926162947.12705-1-frank.meinl@live.de>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from t7-ubuntu.fritz.box (2003:cb:f725:c400:118a:1cbb:61a9:a186) by
	AM3PR04CA0132.eurprd04.prod.outlook.com (2603:10a6:207::16)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3412.22
	via Frontend Transport; Sat, 26 Sep 2020 16:30:05 +0000
X-Microsoft-Original-Message-ID: <20200926162947.12705-1-frank.meinl@live.de>
X-TMN: [GXvy7nOxHOI1GAE5r8ko1zmSgZUgbDxphoGeEB5QNb2iZO2AQn+sw4gAnsUsTPcB]
X-MS-PublicTrafficType: Email
X-IncomingHeaderCount: 49
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-Correlation-Id: a9b55cff-e77a-48de-5768-08d862396d4b
X-MS-TrafficTypeDiagnostic: VE1EUR02HT176:
X-Microsoft-Antispam: BCL:0
X-Microsoft-Antispam-Message-Info: fiG4ZT0P/0WpEOZ9vbinfumc7uWtaAfHcG8PlgKt063LkGhcD7mJTKWNtNrRxeL6UZ0D/G9yYWsYE8iqVwOstnTykqtcIEQPyAPnHXQmVIAO+UJD+DudeAsKV+XcQNo0yqfPs8vnfsXaIJV0JzGuHRT4myZPB+u2k0LagQjNausL6lGL+9iDZKPPHQXVepJA/mC0nz24TbCONe5JjCeSJyOTqUsEmsoML8pIXVtsMepAknk9odDnYUPmvZ/Hfd1L
X-MS-Exchange-AntiSpam-MessageData: JQLnlKAtOy97il8JXR0YwthY63Wor75YO9pW4Ohms/82iRJtWVxseZb/EGp4qn+4emhs1/QKZB6s0xy0Ux4FGZPbQ7MsOCKQKXHldYag9g1+9jWrDEANUf0rTxanfJRPHzGMEBJrQFPUh/1iVraiPAy+8Rua03PYG99RgKGj3r8IIdvaT2cLXIu06ICF1+tUE5vC/tbT6PNRLu7Wgx86rg==
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a9b55cff-e77a-48de-5768-08d862396d4b
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2020 16:31:08.1772 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-AuthSource: VE1EUR02FT039.eop-EUR02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: Internet
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1EUR02HT176
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
	lists01.pubmisc.prod.ext.phx2.redhat.com id 08QGVGlT015451
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Tue, 29 Sep 2020 03:54:59 -0400
Cc: Frank Meinl <frank.meinl@live.de>, mwilck@suse.com
Subject: [dm-devel] [PATCH v2 2/2] multipath: Extend program description in
	manpage
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

Add two paragraphs which list some advantages of multipath and explain
the benefit for single path devices. The text has been partly composed
by Benjamin Marzinski. - Refer to
https://www.redhat.com/archives/dm-devel/2020-September/msg00431.html

Signed-off-by: Frank Meinl <frank.meinl@live.de>
---
 multipath/multipath.8 | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/multipath/multipath.8 b/multipath/multipath.8
index 5b29a5d9..a580630a 100644
--- a/multipath/multipath.8
+++ b/multipath/multipath.8
@@ -89,7 +89,20 @@ multipath \- Device mapper target autoconfig.
 .\" ----------------------------------------------------------------------------
 .
 .B multipath
-is used to detect and coalesce multiple paths to devices, for fail-over or performance reasons.
+is used to detect and coalesce multiple paths to devices, for fail-over or
+performance reasons.
+.PP
+.B multipath
+works with devices as they are, instead of needing special metadata, like
+\fBlvm\fR devices. Plus, multipath deals with devices that have partitions or
+logical volumes on top of them. Consequently, multipath can be easily employed
+after the device is already set up, without the need to alter logical volumes
+or partition tables.
+.PP
+Despite its name, \fBmultipath\fR may be useful for single path devices, too.
+It offers the possibility to queue I/O if no path to the physical device is
+available. With queuing, a running application may tolerate a temporary device
+disconnect, because outstanding I/O will not fail immediately.
 .
 .\" ----------------------------------------------------------------------------
 .SH ARGUMENTS
-- 
2.25.1


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

