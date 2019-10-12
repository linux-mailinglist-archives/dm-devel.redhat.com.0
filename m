Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 59466D52EA
	for <lists+dm-devel@lfdr.de>; Sat, 12 Oct 2019 23:46:51 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 894F5308424C;
	Sat, 12 Oct 2019 21:46:48 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9A6F85D71C;
	Sat, 12 Oct 2019 21:46:47 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 562A44EE69;
	Sat, 12 Oct 2019 21:46:43 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x9CLVpxx007082 for <dm-devel@listman.util.phx.redhat.com>;
	Sat, 12 Oct 2019 17:31:51 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 56C161001B39; Sat, 12 Oct 2019 21:31:51 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx17.extmail.prod.ext.phx2.redhat.com
	[10.5.110.46])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BB8AF10027A3;
	Sat, 12 Oct 2019 21:31:48 +0000 (UTC)
Received: from m4a0039g.houston.softwaregrp.com
	(m4a0039g.houston.softwaregrp.com [15.124.2.85])
	(using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 538C03082E90;
	Sat, 12 Oct 2019 21:31:47 +0000 (UTC)
Received: FROM m4a0039g.houston.softwaregrp.com (15.120.17.147) BY
	m4a0039g.houston.softwaregrp.com WITH ESMTP; 
	Sat, 12 Oct 2019 21:30:53 +0000
Received: from M4W0334.microfocus.com (2002:f78:1192::f78:1192) by
	M4W0335.microfocus.com (2002:f78:1193::f78:1193) with Microsoft SMTP
	Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1591.10; Sat, 12 Oct 2019 21:28:53 +0000
Received: from NAM04-BN3-obe.outbound.protection.outlook.com (15.124.8.10) by
	M4W0334.microfocus.com (15.120.17.146) with Microsoft SMTP Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1591.10 via Frontend Transport; Sat, 12 Oct 2019 21:28:53 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=Wk2+LiQS0uO4FxqIbk0I8mdzwMxTinuol4SJL500vuvFJRBAFvzFgKYPpMpiVHoKnlb+4mciMy3P5cQrqQX5/7rw+BLUkMjblk2Dnhj1rqaLg19qA5XU0+fGp7t6OYSVlh25P9AQQKHHgF1DUGSiZY0QPWyugIAQM0ziNd+7Km4qu3F243dwtFEEEOtAERoN5klAw8bzC7XjMM8FnLbTgPK6rafhEhO3E9c4PzQIsFZQRZrPa7Zb+nxYXXp4kSix9wSGS2Vzx0rDGOLIrXH8sIpQ/bnt7OzSgN3Su4RRLcjkeafStH5PpTnZtvSL0U/uNfa+9kgdrvpexGSy+t1lLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=U159rrfpjzk3e6MbKjYXRRLqi55c9WDvSXI51DnrUGM=;
	b=UuwIpgLTjcm8JSn2geB5606xfFMX3FOIcVWhl2EQ98tYQNp5zM7stm8aLyzTyUEkz2wAdTeDip0oMuCKPtF/OqQjCFY/kA4W/aRFQoT0MLqfnaiuKhVperrSHZ7aBL5U3jvHqS25ccBke9TFsLLGKpnjC+JR6FtHi2nqQAMPWtgNosKs391+G+yMhwxGXS5Qp8lMvUT7pcr4VyMttYkT+K55Cs09eM0vCiqdVXvmxH8ke6a1XLCE/wynrPIgyPeVdMr/LvSZrtV4pNaM6kHAhN+K5MYyvcQ/AQQ7nVpYWfgCDCZF5s6khhB7lXpa9OZwvYBVPseKrsCOQUCr+TjIew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
	smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
	dkim=pass header.d=suse.com; arc=none
Received: from CH2PR18MB3349.namprd18.prod.outlook.com (52.132.245.83) by
	CH2PR18MB3317.namprd18.prod.outlook.com (52.132.245.210) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2347.17; Sat, 12 Oct 2019 21:28:49 +0000
Received: from CH2PR18MB3349.namprd18.prod.outlook.com
	([fe80::1075:2453:9278:e985]) by
	CH2PR18MB3349.namprd18.prod.outlook.com
	([fe80::1075:2453:9278:e985%5]) with mapi id 15.20.2347.021;
	Sat, 12 Oct 2019 21:28:49 +0000
From: Martin Wilck <Martin.Wilck@suse.com>
To: Christophe Varoqui <christophe.varoqui@opensvc.com>, Benjamin Marzinski
	<bmarzins@redhat.com>
Thread-Topic: [PATCH 36/72] multipath: delegate_to_multipathd: mark unused
	arguments
Thread-Index: AQHVgUP5NHhJzsJ8XUGxlXQbOJ8Zlw==
Date: Sat, 12 Oct 2019 21:28:22 +0000
Message-ID: <20191012212703.12989-37-martin.wilck@suse.com>
References: <20191012212703.12989-1-martin.wilck@suse.com>
In-Reply-To: <20191012212703.12989-1-martin.wilck@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: AM0PR02CA0045.eurprd02.prod.outlook.com
	(2603:10a6:208:d2::22) To CH2PR18MB3349.namprd18.prod.outlook.com
	(2603:10b6:610:28::19)
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Martin.Wilck@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [2.203.223.119]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: fba3898e-d338-47a6-7789-08d74f5b1b8e
x-ms-traffictypediagnostic: CH2PR18MB3317:
x-ld-processed: 856b813c-16e5-49a5-85ec-6f081e13b527,ExtFwd
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CH2PR18MB3317CA635E4957F772E970CAFC960@CH2PR18MB3317.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1850;
x-forefront-prvs: 0188D66E61
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(4636009)(136003)(366004)(39860400002)(376002)(346002)(396003)(189003)(199004)(446003)(6512007)(11346002)(4326008)(8676002)(476003)(6666004)(81156014)(71200400001)(71190400001)(99286004)(14454004)(8936002)(66066001)(107886003)(2616005)(486006)(81166006)(54906003)(256004)(86362001)(110136005)(44832011)(50226002)(25786009)(316002)(6436002)(478600001)(26005)(102836004)(386003)(6506007)(5660300002)(1076003)(52116002)(305945005)(36756003)(2906002)(6116002)(76176011)(4744005)(66446008)(6486002)(7736002)(66946007)(64756008)(66556008)(186003)(66476007)(3846002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:CH2PR18MB3317;
	H:CH2PR18MB3349.namprd18.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
	permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: cEQPAPTprpZFo8rCcbVW9LNmQSh8IZqAxNudCJv9Ea44BNQq6/U2aBSkaNNouMsgQr3LGf4dBzQYgjW4NCR7RnjmqxYtGxFo/68NeLNGUgEnjGQ2GEsZm/e1/PhxM/FgI+rjhr+Zor2o6num04NtGl0sgiWIzciIAZCPTpvMBTRI+EosBoUvqN19FUmNKx5rEuzzFaF28nPbeXFsKtPm1X4vxe5lsmIGPtkbSGaFvXD0Qz3BH5nK1zuj44tFpWn4e7IXRJvcm8DR+NaqbjNyno7SBUB2KW35nvoEHZGwqOFpnkhULg6xDS65tILA3Lx81xeX9buBd2QcgHaVwnlMyfV6mFWAZIB0vl+TlYAiGcwWH9pigOJEaPUwgu6le23SIrCh0Ob83NBfHoUmTQ5BQLFniFDT81yNnk3aH6t+ap8=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: fba3898e-d338-47a6-7789-08d74f5b1b8e
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Oct 2019 21:28:22.1862 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GAUwcLp1t3LKs6Fko+WazkwInfWvCz4I/CcC6IbgApjEl4KutbYyw5QeGA0ov7NJCsuKMc5wFm4pCHJABobmSQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR18MB3317
X-OriginatorOrg: suse.com
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 238
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.46]); Sat, 12 Oct 2019 21:31:48 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.46]);
	Sat, 12 Oct 2019 21:31:48 +0000 (UTC) for IP:'15.124.2.85'
	DOMAIN:'m4a0039g.houston.softwaregrp.com'
	HELO:'m4a0039g.houston.softwaregrp.com'
	FROM:'Martin.Wilck@suse.com' RCPT:''
X-RedHat-Spam-Score: 0.001  (RCVD_IN_DNSWL_NONE, SPF_HELO_NONE, SPF_PASS,
	UNPARSEABLE_RELAY) 15.124.2.85
	m4a0039g.houston.softwaregrp.com 15.124.2.85
	m4a0039g.houston.softwaregrp.com <Martin.Wilck@suse.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.46
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id x9CLVpxx007082
X-loop: dm-devel@redhat.com
Cc: "dm-devel@redhat.com" <dm-devel@redhat.com>,
	Martin Wilck <Martin.Wilck@suse.com>
Subject: [dm-devel] [PATCH 36/72] multipath: delegate_to_multipathd: mark
 unused arguments
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.40]); Sat, 12 Oct 2019 21:46:49 +0000 (UTC)

From: Martin Wilck <mwilck@suse.com>

... for now.

Signed-off-by: Martin Wilck <mwilck@suse.com>
---
 multipath/main.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/multipath/main.c b/multipath/main.c
index b3f8c99b..c2ef8c7b 100644
--- a/multipath/main.c
+++ b/multipath/main.c
@@ -811,8 +811,10 @@ enum {
 	NOT_DELEGATED = 1,
 };
 
-int delegate_to_multipathd(enum mpath_cmds cmd, const char *dev,
-			   enum devtypes dev_type, const struct config *conf)
+int delegate_to_multipathd(enum mpath_cmds cmd,
+			   __attribute__((unused)) const char *dev,
+			   __attribute__((unused)) enum devtypes dev_type,
+			   const struct config *conf)
 {
 	int fd;
 	char command[1024], *p, *reply = NULL;
-- 
2.23.0


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
