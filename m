Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 16F80D52CD
	for <lists+dm-devel@lfdr.de>; Sat, 12 Oct 2019 23:34:17 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 2DB34300D219;
	Sat, 12 Oct 2019 21:34:15 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0418F6031D;
	Sat, 12 Oct 2019 21:34:15 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 7C5E11803518;
	Sat, 12 Oct 2019 21:34:14 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x9CLUA08006519 for <dm-devel@listman.util.phx.redhat.com>;
	Sat, 12 Oct 2019 17:30:10 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 39EB36061E; Sat, 12 Oct 2019 21:30:10 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx28.extmail.prod.ext.phx2.redhat.com
	[10.5.110.69])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6E90460A97;
	Sat, 12 Oct 2019 21:30:08 +0000 (UTC)
Received: from m9a0001g.houston.softwaregrp.com
	(m9a0001g.houston.softwaregrp.com [15.124.64.66])
	(using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id D4012883850;
	Sat, 12 Oct 2019 21:30:06 +0000 (UTC)
Received: FROM m9a0001g.houston.softwaregrp.com (15.121.0.190) BY
	m9a0001g.houston.softwaregrp.com WITH ESMTP; 
	Sat, 12 Oct 2019 21:29:23 +0000
Received: from M4W0334.microfocus.com (2002:f78:1192::f78:1192) by
	M9W0067.microfocus.com (2002:f79:be::f79:be) with Microsoft SMTP Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1591.10; Sat, 12 Oct 2019 21:28:52 +0000
Received: from NAM04-BN3-obe.outbound.protection.outlook.com (15.124.8.10) by
	M4W0334.microfocus.com (15.120.17.146) with Microsoft SMTP Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1591.10 via Frontend Transport; Sat, 12 Oct 2019 21:28:52 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=bQQAOqGp9t/Yvpndk+j4+WM2wTGha4OlxVK38Lc0Jly0Gg8CcClA+wFyOx3BA+ec7v6cKMN7pEqfyTpLMfLKt7a9Bjz8DibHInN2t5Ias4fvV0c/MqQsevzvERaJg0jqarLOBDW/KlDinRnlobvuiRQ8deXQlvLTrdGsPJaGI9boTzWfu3hhlMPoCONzgXSI9wH+/ruraD/FWIMRsYIu7FUVXbPNcgPt0Dka1wAthwE7sixh6sMw7qIeA92YNQ6BWki2Q1zFpE0drDFIi6X5+0E+/XRW3iJPg41090dVt9S6wlb5BCGBCfELhsVqDlH4nAQTiIH4r6v24euGv4Xj7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=jgcNMwGUfw1N6iBqBVt6SGL1XIIkeZD9z1XmRPgImpM=;
	b=bA7N5e13Qgn0hGd+YRZ4VMbcPnnLtXzaq486tb7wjNgM57a5bNHBac0UzRqh39M6MtNzYhwez1/uwrIvyfEe1AixZPEDyL0ktDBAvM6AXDjZ+153wnZul8kTSv8jzamtJFRMGCDj0aXr5F5ifHyAaByvRysGtn4GOEj8jod4T1WNJa9py7XhZNV3vn8Pfod9h5yzTN9OUao1d4bY6q7jvH02WGbiLB4gspoiY2QCGu7p6Vu8/td+KQQif1PGzUPC3v0Z0WW21jYyV/x4Ht6EKNBKHA0mIP/58UzCYaJ6OGc1eLESSFgnlQ7jOJ+A+Vt8E9FnACE4ZhRqYFfyFpw6tw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
	smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
	dkim=pass header.d=suse.com; arc=none
Received: from CH2PR18MB3349.namprd18.prod.outlook.com (52.132.245.83) by
	CH2PR18MB3317.namprd18.prod.outlook.com (52.132.245.210) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2347.17; Sat, 12 Oct 2019 21:28:47 +0000
Received: from CH2PR18MB3349.namprd18.prod.outlook.com
	([fe80::1075:2453:9278:e985]) by
	CH2PR18MB3349.namprd18.prod.outlook.com
	([fe80::1075:2453:9278:e985%5]) with mapi id 15.20.2347.021;
	Sat, 12 Oct 2019 21:28:47 +0000
From: Martin Wilck <Martin.Wilck@suse.com>
To: Christophe Varoqui <christophe.varoqui@opensvc.com>, Benjamin Marzinski
	<bmarzins@redhat.com>
Thread-Topic: [PATCH 34/72] libmultipath: get_pgpolicy_name(): use "len"
	parameter
Thread-Index: AQHVgUP3z3ckOY7l7k6aLIl2wWzQ+A==
Date: Sat, 12 Oct 2019 21:28:19 +0000
Message-ID: <20191012212703.12989-35-martin.wilck@suse.com>
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
x-ms-office365-filtering-correlation-id: db7c34db-2c9e-43ba-5c9f-08d74f5b1a1a
x-ms-traffictypediagnostic: CH2PR18MB3317:
x-ld-processed: 856b813c-16e5-49a5-85ec-6f081e13b527,ExtFwd
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CH2PR18MB3317987A8D63691C17E27BF8FC960@CH2PR18MB3317.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:65;
x-forefront-prvs: 0188D66E61
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(4636009)(136003)(366004)(39860400002)(376002)(346002)(396003)(189003)(199004)(446003)(6512007)(11346002)(4326008)(8676002)(476003)(6666004)(81156014)(71200400001)(71190400001)(99286004)(14454004)(8936002)(66066001)(107886003)(2616005)(486006)(81166006)(54906003)(256004)(14444005)(86362001)(110136005)(44832011)(50226002)(25786009)(316002)(6436002)(478600001)(26005)(102836004)(386003)(6506007)(5660300002)(1076003)(52116002)(305945005)(36756003)(2906002)(6116002)(76176011)(4744005)(66446008)(6486002)(7736002)(66946007)(64756008)(66556008)(186003)(66476007)(3846002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:CH2PR18MB3317;
	H:CH2PR18MB3349.namprd18.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
	permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: TvM4QpoEsQbg9m0CEd66aK89ByySqPNThPNkzlpBthKKRxPw4w88468zaKCIrEPsE0v+mi5ht8XvKNL3VQQXmh5+zoVJi/y4sseKH+Ie5uc761jhZvLq2CgGDH+gDhWaEr/XzIZonWa/ignWTzTfEMpqj5RLWcDlPAP5N4jfkZjw5um3I2LSgU8i5BpV6PPXSJreqj4TcexELDxK8ubsTXYbIzGX4XTnYZVOfNIVfHp2BZy81FS8hIUPlg8gjzmJa/qWLoizVS8ZNOXNA3ewW/KKhPxyUz+9Kr8A9SfcA9kDuTVkd13hWnjogzzqAeVnsaiat88h+AncfHVKcJy00xWgLO0MEPyN9Ix9krcnb8Xk9d6Oi3Z/MGeoE+ha3xXV89KUWBC9epOURvsjvROMHWTcDWanW2r/9atmdaTsFeo=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: db7c34db-2c9e-43ba-5c9f-08d74f5b1a1a
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Oct 2019 21:28:19.7456 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: a4PrjGyeHpDGxZlkOJhA8JMKbmtvWC3s5ivCKjLpYxIdAdmrKEOomHBy/R9hBb2hzrnJipuBWnZkXoExhE0m3A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR18MB3317
X-OriginatorOrg: suse.com
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 238
	matched, not delayed by milter-greylist-4.6.2 (mx1.redhat.com
	[10.5.110.69]); Sat, 12 Oct 2019 21:30:07 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.6.2 (mx1.redhat.com [10.5.110.69]);
	Sat, 12 Oct 2019 21:30:07 +0000 (UTC) for IP:'15.124.64.66'
	DOMAIN:'m9a0001g.houston.softwaregrp.com'
	HELO:'m9a0001g.houston.softwaregrp.com'
	FROM:'Martin.Wilck@suse.com' RCPT:''
X-RedHat-Spam-Score: 0.001  (RCVD_IN_DNSWL_NONE, SPF_HELO_NONE, SPF_PASS,
	UNPARSEABLE_RELAY) 15.124.64.66
	m9a0001g.houston.softwaregrp.com 15.124.64.66
	m9a0001g.houston.softwaregrp.com <Martin.Wilck@suse.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.69
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id x9CLUA08006519
X-loop: dm-devel@redhat.com
Cc: "dm-devel@redhat.com" <dm-devel@redhat.com>,
	Martin Wilck <Martin.Wilck@suse.com>
Subject: [dm-devel] [PATCH 34/72] libmultipath: get_pgpolicy_name(): use
	"len" parameter
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.40]); Sat, 12 Oct 2019 21:34:15 +0000 (UTC)

From: Martin Wilck <mwilck@suse.com>

Signed-off-by: Martin Wilck <mwilck@suse.com>
---
 libmultipath/pgpolicies.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/libmultipath/pgpolicies.c b/libmultipath/pgpolicies.c
index 8f7c6b13..02cafdc7 100644
--- a/libmultipath/pgpolicies.c
+++ b/libmultipath/pgpolicies.c
@@ -54,7 +54,7 @@ int get_pgpolicy_name(char * buff, int len, int id)
 		s = "undefined";
 		break;
 	}
-	return snprintf(buff, POLICY_NAME_SIZE, "%s", s);
+	return snprintf(buff, len, "%s", s);
 }
 
 
-- 
2.23.0


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
