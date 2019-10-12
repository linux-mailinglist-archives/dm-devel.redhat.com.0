Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 28DAFD52C1
	for <lists+dm-devel@lfdr.de>; Sat, 12 Oct 2019 23:32:51 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 635EB81DE8;
	Sat, 12 Oct 2019 21:32:49 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 393721C945;
	Sat, 12 Oct 2019 21:32:49 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id CFB904EE6A;
	Sat, 12 Oct 2019 21:32:48 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x9CLUcpi006721 for <dm-devel@listman.util.phx.redhat.com>;
	Sat, 12 Oct 2019 17:30:38 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 4247B6092F; Sat, 12 Oct 2019 21:30:38 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx20.extmail.prod.ext.phx2.redhat.com
	[10.5.110.49])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0D685608A5;
	Sat, 12 Oct 2019 21:30:36 +0000 (UTC)
Received: from m9a0003g.houston.softwaregrp.com
	(m9a0003g.houston.softwaregrp.com [15.124.64.68])
	(using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 883A03086262;
	Sat, 12 Oct 2019 21:30:34 +0000 (UTC)
Received: FROM m9a0003g.houston.softwaregrp.com (15.121.0.191) BY
	m9a0003g.houston.softwaregrp.com WITH ESMTP; 
	Sat, 12 Oct 2019 21:29:56 +0000
Received: from M4W0334.microfocus.com (2002:f78:1192::f78:1192) by
	M9W0068.microfocus.com (2002:f79:bf::f79:bf) with Microsoft SMTP Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1591.10; Sat, 12 Oct 2019 21:29:38 +0000
Received: from NAM04-BN3-obe.outbound.protection.outlook.com (15.124.8.13) by
	M4W0334.microfocus.com (15.120.17.146) with Microsoft SMTP Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1591.10 via Frontend Transport; Sat, 12 Oct 2019 21:29:38 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=Hw6JCFhXrFdh25fHvTpB7CmJk9anwoqt4jg8MVycVxc7QBCG4T+ncUAfAQtXOJ5HglmLouPxDs2jAo1kfkWjClDj2EQbNhV4tQdg1N8fbFPUfFVJ5oJ4lOwu73B4iJJDwpAa1Tn3FLhAZesDikYoE41SkjXXrVU+XE+AJxVaVtOduBanhMvzDKOE9BYUCiKvNxyEFqMLkYLZBqbmOS4mObSeiRJA4/d/oKUIT2mwfsm5oFVROIdUFE3m1p2whjA+DX/xDBpaQO7/XLMrxA5BTMt5jmvY2A5pMoZKJYBB/Rt9ADcfgzImEnKY/EiByv99LaGPKv4YhxMeIpIPYXlvkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=xSALkrYZtQzeodS8lESPOAL4gPEkxdh3g9wsgCjF6bE=;
	b=RaYbJgspKFpAVP9ReaC2rdlxeJEZhfZITMWeAAuAee1oNpndR4+KQoV1iTBfBnYhT4MMhNbvXBjeBXyMfoievPv7SnSHhxL45dYVQU6Swo81/sb8dwMHPEvpIHB8U4cOboxd+Lcb5Ar0NLzGLuQi5jmgqY95gfxkZ5euMaPgU6njIYEtIjc+rBeQMSWMbxIJ84yCMxC8RzGurQFMIYxkTP5xa5g6eHz4gM7eCfWfluKhFY6MpcSOlDkIDeO7FCMHbIKMQk9g5OKI4T+EEYlIYCjEgdueRnxsm3wY9c4ew1xEIy/hh/aJVGqs/BUcbzzF0S6n/kX3my9SPbP2k0OjcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
	smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
	dkim=pass header.d=suse.com; arc=none
Received: from CH2PR18MB3349.namprd18.prod.outlook.com (52.132.245.83) by
	CH2PR18MB3317.namprd18.prod.outlook.com (52.132.245.210) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2347.17; Sat, 12 Oct 2019 21:29:33 +0000
Received: from CH2PR18MB3349.namprd18.prod.outlook.com
	([fe80::1075:2453:9278:e985]) by
	CH2PR18MB3349.namprd18.prod.outlook.com
	([fe80::1075:2453:9278:e985%5]) with mapi id 15.20.2347.021;
	Sat, 12 Oct 2019 21:29:33 +0000
From: Martin Wilck <Martin.Wilck@suse.com>
To: Christophe Varoqui <christophe.varoqui@opensvc.com>, Benjamin Marzinski
	<bmarzins@redhat.com>
Thread-Topic: [PATCH 64/72] multipath tests: util: fix clang strlcpy warnings
Thread-Index: AQHVgUQOKOwyMv3N3EOoeEd8/q9E+Q==
Date: Sat, 12 Oct 2019 21:28:57 +0000
Message-ID: <20191012212703.12989-65-martin.wilck@suse.com>
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
x-ms-office365-filtering-correlation-id: 1b0c602d-662d-43dd-9676-08d74f5b3089
x-ms-traffictypediagnostic: CH2PR18MB3317:
x-ld-processed: 856b813c-16e5-49a5-85ec-6f081e13b527,ExtFwd
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CH2PR18MB3317CE4BD8712EB2FC2E9BD7FC960@CH2PR18MB3317.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4303;
x-forefront-prvs: 0188D66E61
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(4636009)(136003)(366004)(39860400002)(376002)(346002)(396003)(189003)(199004)(446003)(6512007)(11346002)(4326008)(8676002)(476003)(6666004)(81156014)(71200400001)(71190400001)(99286004)(14454004)(8936002)(66066001)(107886003)(2616005)(486006)(81166006)(54906003)(256004)(86362001)(110136005)(44832011)(50226002)(25786009)(316002)(6436002)(478600001)(26005)(102836004)(386003)(6506007)(5660300002)(1076003)(52116002)(305945005)(36756003)(2906002)(6116002)(76176011)(66446008)(6486002)(7736002)(66946007)(64756008)(66556008)(186003)(66476007)(3846002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:CH2PR18MB3317;
	H:CH2PR18MB3349.namprd18.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
	permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 7FpQSvDHgsRTB/MBbYWTrl2heRD/LxXAfjigIn5pPqUUPttS6QSXCjmmJp3zwPgLnQMvHmHIBvjARZfRDS6C+RItKYYlZnG86fOKYy3gPiPlQRijtSzISg0Ib9krLEQGTRgelgh1E0fspqxF3+kouoH9nTTXARr4KA6HfvQwD6usqP9STbWH2nhul0ryKhhS9HJ7jmuaUiQ7EAJN4kajuTym2MS/v0biyVdH87uMNVvuMj66Ee42s9vTF1ADHcHIMC5QR4mpXbsRqogfQHxIWLUIsC0EOwdo2jNyrS5mcHxfv8BOQFu2cP9eYa9AJQ5/hn5qdifl/1l0FKgmfoVuDSABB2vAzgD35SwizVoNyLtkvK8DP21iw5vmKMlhlZVSBw15FesbMpI53yr1TTnQHhuIzI26PBu2oBrEIWsx7IM=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b0c602d-662d-43dd-9676-08d74f5b3089
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Oct 2019 21:28:57.2855 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Y/rmYliDtVSobpsHkz7aQnQiIT5cFSYDCNJ3mBcvjCR8WBvoQ3gD5He2XTUotl3TveVUbYzSygrpqebjsayNFw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR18MB3317
X-OriginatorOrg: suse.com
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 238
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.49]); Sat, 12 Oct 2019 21:30:35 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.49]);
	Sat, 12 Oct 2019 21:30:35 +0000 (UTC) for IP:'15.124.64.68'
	DOMAIN:'m9a0003g.houston.softwaregrp.com'
	HELO:'m9a0003g.houston.softwaregrp.com'
	FROM:'Martin.Wilck@suse.com' RCPT:''
X-RedHat-Spam-Score: 0.001  (RCVD_IN_DNSWL_NONE, SPF_HELO_NONE, SPF_PASS,
	UNPARSEABLE_RELAY) 15.124.64.68
	m9a0003g.houston.softwaregrp.com 15.124.64.68
	m9a0003g.houston.softwaregrp.com <Martin.Wilck@suse.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.49
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id x9CLUcpi006721
X-loop: dm-devel@redhat.com
Cc: "dm-devel@redhat.com" <dm-devel@redhat.com>,
	Martin Wilck <Martin.Wilck@suse.com>
Subject: [dm-devel] [PATCH 64/72] multipath tests: util: fix clang strlcpy
	warnings
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
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.25]); Sat, 12 Oct 2019 21:32:50 +0000 (UTC)

From: Martin Wilck <mwilck@suse.com>

clang erroneously thought that we were using the size of the source
for the destination, while they are equal. Trick it into accepting
the code.

Signed-off-by: Martin Wilck <mwilck@suse.com>
---
 tests/util.c | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/tests/util.c b/tests/util.c
index 4e04a480..7c486fca 100644
--- a/tests/util.c
+++ b/tests/util.c
@@ -328,11 +328,12 @@ static void test_strlcpy_5(void **state)
 {
 	char *tst;
 	int rc;
+	const int sz = sizeof(src_str);
 
-	tst = malloc(sizeof(src_str));
+	tst = malloc(sz);
 	memset(tst, 'f', sizeof(src_str));
 
-	rc = strlcpy(tst, src_str, sizeof(src_str));
+	rc = strlcpy(tst, src_str, sz);
 	assert_int_equal(rc, strlen(src_str));
 	assert_string_equal(src_str, tst);
 
@@ -344,15 +345,16 @@ static void test_strlcpy_6(void **state)
 {
 	char *tst;
 	int rc;
+	const int sz = sizeof(src_str);
 
-	tst = malloc(sizeof(src_str) + 2);
-	memset(tst, 'f', sizeof(src_str) + 2);
+	tst = malloc(sz + 2);
+	memset(tst, 'f', sz + 2);
 
-	rc = strlcpy(tst, src_str, sizeof(src_str) + 2);
+	rc = strlcpy(tst, src_str, sz + 2);
 	assert_int_equal(rc, strlen(src_str));
 	assert_string_equal(src_str, tst);
-	assert_int_equal(tst[sizeof(src_str)], 'f');
-	assert_int_equal(tst[sizeof(src_str) + 1], 'f');
+	assert_int_equal(tst[sz], 'f');
+	assert_int_equal(tst[sz + 1], 'f');
 
 	free(tst);
 }
-- 
2.23.0


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
