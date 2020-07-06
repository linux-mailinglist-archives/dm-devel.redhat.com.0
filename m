Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 5750E2164B2
	for <lists+dm-devel@lfdr.de>; Tue,  7 Jul 2020 05:39:51 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-100-L-h1U3IbP1O003I3GyI8jA-1; Mon, 06 Jul 2020 23:39:47 -0400
X-MC-Unique: L-h1U3IbP1O003I3GyI8jA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E2131107ACF7;
	Tue,  7 Jul 2020 03:39:41 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B2DAA2E049;
	Tue,  7 Jul 2020 03:39:40 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 668061809547;
	Tue,  7 Jul 2020 03:39:38 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 066KMjbK002356 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 6 Jul 2020 16:22:45 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 022123325A; Mon,  6 Jul 2020 20:22:45 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id EE78217E39B
	for <dm-devel@redhat.com>; Mon,  6 Jul 2020 20:22:42 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2A5E8800260
	for <dm-devel@redhat.com>; Mon,  6 Jul 2020 20:22:42 +0000 (UTC)
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
	(mail-dm6nam10on2085.outbound.protection.outlook.com [40.107.93.85])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-5-yjwVSntNONW-OXBF7qou0Q-1; Mon, 06 Jul 2020 16:22:37 -0400
X-MC-Unique: yjwVSntNONW-OXBF7qou0Q-1
Received: from DM6PR06MB5276.namprd06.prod.outlook.com (2603:10b6:5:10e::20)
	by DM6PR06MB5546.namprd06.prod.outlook.com (2603:10b6:5:3c::22) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3153.24;
	Mon, 6 Jul 2020 20:22:35 +0000
Received: from DM6PR06MB5276.namprd06.prod.outlook.com
	([fe80::a431:1852:72a1:1a1a]) by
	DM6PR06MB5276.namprd06.prod.outlook.com
	([fe80::a431:1852:72a1:1a1a%5]) with mapi id 15.20.3153.029;
	Mon, 6 Jul 2020 20:22:35 +0000
From: "Schremmer, Steven" <Steve.Schremmer@netapp.com>
To: device-mapper development <dm-devel@redhat.com>, Christophe Varoqui
	<christophe.varoqui@opensvc.com>, Benjamin Marzinski <bmarzins@redhat.com>,
	Martin Wilck <mwilck@suse.com>
Thread-Topic: [PATCH] libmultipath: add device to hwtable.c
Thread-Index: AdZTzQD5jyDqezbBSBawSgyt/tJQ2g==
Date: Mon, 6 Jul 2020 20:22:35 +0000
Message-ID: <DM6PR06MB52761D5DAA5DFA8B9AB23C268C690@DM6PR06MB5276.namprd06.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-dg-ref: =?us-ascii?Q?PG1ldGE+PGF0IG5tPSJib2R5LnR4dCIgcD0iYzpcdXNlcnNcc3NjaHJlbW1c?=
	=?us-ascii?Q?YXBwZGF0YVxyb2FtaW5nXDA5ZDg0OWI2LTMyZDMtNGE0MC04NWVlLTZiODRi?=
	=?us-ascii?Q?YTI5ZTM1Ylxtc2dzXG1zZy02YzQ3N2Q4Yi1iZmM2LTExZWEtYTk4Yi0xMDRh?=
	=?us-ascii?Q?N2RiMTY2Y2RcYW1lLXRlc3RcNmM0NzdkOGMtYmZjNi0xMWVhLWE5OGItMTA0?=
	=?us-ascii?Q?YTdkYjE2NmNkYm9keS50eHQiIHN6PSIxMTI3IiB0PSIxMzIzODU0MDU1NDIz?=
	=?us-ascii?Q?OTU3NjAiIGg9InpySTlzeDh0Ymo3UEx3elBKTXJCLzdtNVVSbz0iIGlkPSIi?=
	=?us-ascii?Q?IGJsPSIwIiBibz0iMSIgY2k9ImNBQUFBRVJIVTFSU1JVRk5DZ1VBQUNRRUFB?=
	=?us-ascii?Q?Qnc3OHd1MDFQV0FXbGRNNXh5c2luWWFWMHpuSEt5S2RnR0FBQUFBQUFBQUFB?=
	=?us-ascii?Q?QUFBQUFBQUFBQUFBQUFIQUFBQUMwQXdBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
	=?us-ascii?Q?QUFFQUFRQUJBQUFBZU1mc2lBQUFBQUFBQUFBQUFBQUFBSjRBQUFCaEFHUUFa?=
	=?us-ascii?Q?QUJ5QUdVQWN3QnpBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
	=?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
	=?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
	=?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
	=?us-ascii?Q?QUVBQUFBQUFBQUFBZ0FBQUFBQW5nQUFBR01BWXdCZkFHTUFkUUJ6QUhRQWJ3?=
	=?us-ascii?Q?QnRBRjhBWVFCdUFIa0FBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
	=?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
	=?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
	=?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFRQUFBQUFBQUFBQ0FB?=
	=?us-ascii?Q?QUFBQUNlQUFBQVl3QjFBSE1BZEFCdkFHMEFYd0J3QUdVQWNnQnpBRzhBYmdB?=
	=?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
	=?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
	=?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
	=?us-ascii?Q?QUNBQUFBQUFBQUFBQUFBQUFCQUFBQUFBQUFBQUlBQUFBQUFKNEFBQUJqQUhV?=
	=?us-ascii?Q?QWN3QjBBRzhBYlFCZkFIQUFhQUJ2QUc0QVpRQnVBSFVBYlFCaUFHVUFjZ0FB?=
	=?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
	=?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
	=?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
	=?us-ascii?Q?QUFBRUFBQUFBQUFBQUFnQUFBQUFBbmdBQUFHTUFkUUJ6QUhRQWJ3QnRBRjhB?=
	=?us-ascii?Q?Y3dCekFHNEFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
	=?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
	=?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
	=?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQVFBQUFBQUFBQUFD?=
	=?us-ascii?Q?QUFBQUFBQ2VBQUFBWlFCdEFHRUFhUUJzQUY4QVlRQmtBR1FBY2dCbEFITUFj?=
	=?us-ascii?Q?d0FBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
	=?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
	=?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
	=?us-ascii?Q?QUFBSUFBQUFBQUFBQUFBQUFBQUJBQUFBQUFBQUFBSUFBQUFBQUE9PSIvPjwv?=
	=?us-ascii?Q?bWV0YT4=3D?=
x-originating-ip: [98.187.40.65]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9ce63b05-2801-4a76-e09a-08d821ea5246
x-ms-traffictypediagnostic: DM6PR06MB5546:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR06MB5546040CE03D387B67377E308C690@DM6PR06MB5546.namprd06.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:296;
x-forefront-prvs: 04569283F9
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: LeARx5xcDViXV/VvIl/qvvut+Y4EeyDylJiORP4flb+y2i3QbAE0I7P5yC735zag2O6pexDNRpzUoHsnFIfjF58UfdSaKsmuNAi4VO31Ir33QWhHyk7CwARvyRx4BqOX+ep7SRvL/SIzCW9OiYwmOk74mh6fpvUUZtcEUq+Og7kGn94gp6R9ftPwDpwPdP+iMh0tuxDDMA/yZ9vnpLkyNBVzx7PrIkf/RgCI1y7V93Kp0+gyA4JA4rvMiqeVVQVNWBtD7B1FewfjGwJI0PPE9wuaXOw2z05SHnDLE9kNMffYoc+vz0fgo7PZ3/FL8FMvDDSOHeshdHEGZEJEceLrdw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
	IPV:NLI; SFV:NSPM; H:DM6PR06MB5276.namprd06.prod.outlook.com;
	PTR:; CAT:NONE; SFTY:;
	SFS:(4636009)(376002)(346002)(136003)(396003)(39860400002)(366004)(110136005)(316002)(8676002)(5660300002)(33656002)(2906002)(107886003)(76116006)(7696005)(52536014)(66946007)(66476007)(6506007)(66556008)(66446008)(64756008)(26005)(4326008)(55016002)(8936002)(4744005)(9686003)(71200400001)(478600001)(186003)(86362001);
	DIR:OUT; SFP:1101;
x-ms-exchange-antispam-messagedata: pZ71D6YegiegO46TcNp3purclIoJej083EuEJAiDqB4d1AkdnrY4jH1h9Seb3oV1Ov83XxJ3Xw7CXTDCcmQ7MSsCYy6Z7thiOaC3Gzw7P84MWbwS48ErOnHC/If2rpYpa7Y8ksBV4L1oqDETRWSkPNeb1/I2O/wBeNO9Xxak65yBUB1B6DSRw45E3eyEhNe5TFJlqfmuCDhmIsb2uXUk8eJjHbjjOyx+yevIqt/wBdqPBQbXn0GmE4MBtSvKQ3SGXCM+p0g4f+NGgCCW7GVwWjTZBXmv64+GfKQo20yZLHB9566cR28ZE68rJ4bgpV1PZQQVPXt9i5iqqsbDdp8Zxc4kYC6T0UDLRnQGMx3jFRyeKOngFZq+CfCNcolQ5W3mqz5IJEQx0KFv69Ll3FrNHZWAHh7O66atcgTzGOPUlmzdVJzH9Jq7QfV8cl4qeI4Hr3FBf+JRuV8cRyO9h1iOYEzo8VtRJvvoUJjdlx2y9xE=
MIME-Version: 1.0
X-OriginatorOrg: netapp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR06MB5276.namprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ce63b05-2801-4a76-e09a-08d821ea5246
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Jul 2020 20:22:35.8696 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4b0911a0-929b-4715-944b-c03745165b3a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6BAVxddoCf+PIn+iVKYsqHsudP10NrLlN5q5gtXdOx0alPCZ7DjqNngGe4+A4F31CXU4JtWdRDF4AL0Qt5VHeQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR06MB5546
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 066KMjbK002356
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Mon, 06 Jul 2020 23:39:09 -0400
Cc: "Schremmer, Steven" <Steve.Schremmer@netapp.com>
Subject: [dm-devel] [PATCH] libmultipath: add device to hwtable.c
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Steve Schremmer <steve.schremmer@netapp.com>

Add FUJITSU ETERNUS_AHB defaults.

Signed-off-by: Steve Schremmer <steve.schremmer@netapp.com>
---
 libmultipath/hwtable.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/libmultipath/hwtable.c b/libmultipath/hwtable.c
index d1fcfdb3..d680bdfc 100644Insert
--- a/libmultipath/hwtable.c
+++ b/libmultipath/hwtable.c
@@ -428,6 +428,22 @@ static struct hwentry default_hw[] = {
 		.pgpolicy      = MULTIBUS,
 		.no_path_retry = 10,
 	},
+	{
+		/*
+		 * ETERNUS AB/HB
+		 * Maintainer: NetApp RDAC team <ng-eseries-upstream-maintainers@netapp.com>
+		 */
+		.vendor        = "FUJITSU",
+		.product       = "ETERNUS_AHB",
+		.bl_product    = "Universal Xport",
+		.pgpolicy      = GROUP_BY_PRIO,
+		.checker_name  = RDAC,
+		.features      = "2 pg_init_retries 50",
+		.hwhandler     = "1 rdac",
+		.prio_name     = PRIO_RDAC,
+		.pgfailback    = -FAILBACK_IMMEDIATE,
+		.no_path_retry = 30,
+	},
 	/*
 	 * Hitachi Vantara
 	 *
-- 
2.18.0




--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

