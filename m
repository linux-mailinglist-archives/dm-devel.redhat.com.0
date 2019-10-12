Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id D2A22D52C2
	for <lists+dm-devel@lfdr.de>; Sat, 12 Oct 2019 23:33:11 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 21AE786679;
	Sat, 12 Oct 2019 21:33:10 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E85145C231;
	Sat, 12 Oct 2019 21:33:09 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 594514EE6D;
	Sat, 12 Oct 2019 21:33:09 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x9CLTgFG006401 for <dm-devel@listman.util.phx.redhat.com>;
	Sat, 12 Oct 2019 17:29:42 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 87A7E19C70; Sat, 12 Oct 2019 21:29:42 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx06.extmail.prod.ext.phx2.redhat.com
	[10.5.110.30])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0488D19C6A;
	Sat, 12 Oct 2019 21:29:40 +0000 (UTC)
Received: from m9a0003g.houston.softwaregrp.com
	(m9a0003g.houston.softwaregrp.com [15.124.64.68])
	(using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id CB396356C9;
	Sat, 12 Oct 2019 21:29:38 +0000 (UTC)
Received: FROM m9a0003g.houston.softwaregrp.com (15.121.0.191) BY
	m9a0003g.houston.softwaregrp.com WITH ESMTP; 
	Sat, 12 Oct 2019 21:29:00 +0000
Received: from M4W0334.microfocus.com (2002:f78:1192::f78:1192) by
	M9W0068.microfocus.com (2002:f79:bf::f79:bf) with Microsoft SMTP Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1591.10; Sat, 12 Oct 2019 21:29:00 +0000
Received: from NAM02-BL2-obe.outbound.protection.outlook.com (15.124.8.11) by
	M4W0334.microfocus.com (15.120.17.146) with Microsoft SMTP Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1591.10 via Frontend Transport; Sat, 12 Oct 2019 21:29:00 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=m7d3TzZl8LTq01S7d41G7QQUIR6p7brI4XPfyVtjizmQPRaiEURyznF9yG8bMRgh3CxrDaWN5qFDvm2Nmq/Qh5hxAwGMbL7BWktw/pJ3MypsmN4i53oljE+McM0jSlv+eY+B+qY8b8t4YA83dYAYzF3NEB9XLkAuAI/qZt9BGtqB4FrHBiNLe6qwy6ZVF5MQqiCfwlacXjH7tMLZw7muNkoBaa9R6STztjsm9QOs0h7KI4L4KjvL8oPLNnkqmF6dUQEsWugSzyZ5EgTrmAKSVdiygBHADDCR8mVmaKfZZMIa724zpeD+sKuMa3vAe3fKgXQkTxm4p/SCJKcEhxUjEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=JDe8F+Q0lTfy4JujH1OmKlv9IXWdPR8UrhmXYl3Qk/s=;
	b=euBLUkxy+uxZr0HuK9wAaPBP7mKhwhMD7rqRvgUXzdX99annslkpiZLDSINuvFDdTX/BRayYSUKdqslpcpEG2IgOgAx+9j0C+jjjvTnJYrIaM/3Nk5+H8IkIzJFz1+ScTuP1Ha0tJgDu1R2GeX0fiaGl6wGpT9G1qA+HOFS9UcIM9sYo8kVdIK2bsDO4C5kn3Kzq/e/PrKGjT6Nqioa6QgjPJ6MlUj4CVYcqkHDgYhYPMtIl+y6okiLR15Qg/GaSVrTuyEeKbYJ0iiQmb2I+nGCIOz9Efhrx0UrzJkB9+VH3tMkqSMUMBK8vHPfahcJ4k3lACI2y4YgC5mdRWf1Xwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
	smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
	dkim=pass header.d=suse.com; arc=none
Received: from CH2PR18MB3349.namprd18.prod.outlook.com (52.132.245.83) by
	CH2PR18MB3317.namprd18.prod.outlook.com (52.132.245.210) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2347.17; Sat, 12 Oct 2019 21:28:57 +0000
Received: from CH2PR18MB3349.namprd18.prod.outlook.com
	([fe80::1075:2453:9278:e985]) by
	CH2PR18MB3349.namprd18.prod.outlook.com
	([fe80::1075:2453:9278:e985%5]) with mapi id 15.20.2347.021;
	Sat, 12 Oct 2019 21:28:57 +0000
From: Martin Wilck <Martin.Wilck@suse.com>
To: Christophe Varoqui <christophe.varoqui@opensvc.com>, Benjamin Marzinski
	<bmarzins@redhat.com>
Thread-Topic: [PATCH 53/72] libmultipath, kpartx: byteorder: always use
	unsigned types
Thread-Index: AQHVgUQFE9QLCiotBU6gO6k8M8OIyQ==
Date: Sat, 12 Oct 2019 21:28:42 +0000
Message-ID: <20191012212703.12989-54-martin.wilck@suse.com>
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
x-ms-office365-filtering-correlation-id: b3606315-69b8-4a1c-8e96-08d74f5b27fe
x-ms-traffictypediagnostic: CH2PR18MB3317:
x-ld-processed: 856b813c-16e5-49a5-85ec-6f081e13b527,ExtFwd
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CH2PR18MB3317FE426DD1E586F1AC3FD2FC960@CH2PR18MB3317.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:175;
x-forefront-prvs: 0188D66E61
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(4636009)(136003)(366004)(39860400002)(376002)(346002)(396003)(189003)(199004)(446003)(6512007)(11346002)(4326008)(8676002)(476003)(6666004)(81156014)(71200400001)(71190400001)(99286004)(14454004)(8936002)(66066001)(107886003)(2616005)(486006)(81166006)(54906003)(256004)(14444005)(86362001)(110136005)(44832011)(50226002)(25786009)(316002)(6436002)(478600001)(26005)(102836004)(386003)(6506007)(5660300002)(1076003)(52116002)(305945005)(36756003)(2906002)(6116002)(76176011)(66446008)(6486002)(7736002)(66946007)(64756008)(66556008)(186003)(66476007)(3846002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:CH2PR18MB3317;
	H:CH2PR18MB3349.namprd18.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
	permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 388OlPHew8+x5ZP+hWGv35k0uTq5Jd7jHM9ol++m5LvDWWKbxo504w40/lghKBwVIh5In3ye6ydwdD+kNZ5rjfs9NSPr1vqf+Bqy8oUo/lCa5Br8BATF301RND+gjkkB4HUaM1Tbl6xqBEt1FAUOnX8or3bYDrELjxuSYVuQKXuJ+ZRmuphqRqjyHByftNn6MV5oZYMK2iY09DGqHd2+f7bE3ni/tG3yPOkymKbFJe4yHO5tltksayZdHWGtCzi29L7Hgi8qtWAi4zJTCkmg55RM+mVzAd2uEDPpvOAna30pZi8sStRGHNNPdJQR3RbKyY6OSKjJjc77vUfQHZUAeOoodb4Zt04BSSds9S1ptKLdtaWuC0BnpYYqYPGLEPHWOVU9P27x3I2kQnNOpFTuAkV9amM7gXDWinqp8Up7hPw=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: b3606315-69b8-4a1c-8e96-08d74f5b27fe
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Oct 2019 21:28:42.9186 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5aiC0mghbgt+tPHmNMAE5izmlzuAnma77va+h5ogHgFzraFtp6gupwVRqLOTYs9iTVCYT7ffBHNNCS7VXyvdvg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR18MB3317
X-OriginatorOrg: suse.com
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 238
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.30]); Sat, 12 Oct 2019 21:29:39 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.30]);
	Sat, 12 Oct 2019 21:29:39 +0000 (UTC) for IP:'15.124.64.68'
	DOMAIN:'m9a0003g.houston.softwaregrp.com'
	HELO:'m9a0003g.houston.softwaregrp.com'
	FROM:'Martin.Wilck@suse.com' RCPT:''
X-RedHat-Spam-Score: 0.001  (RCVD_IN_DNSWL_NONE, SPF_HELO_NONE, SPF_PASS,
	UNPARSEABLE_RELAY) 15.124.64.68
	m9a0003g.houston.softwaregrp.com 15.124.64.68
	m9a0003g.houston.softwaregrp.com <Martin.Wilck@suse.com>
X-Scanned-By: MIMEDefang 2.78 on 10.5.110.30
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id x9CLTgFG006401
X-loop: dm-devel@redhat.com
Cc: "dm-devel@redhat.com" <dm-devel@redhat.com>,
	Martin Wilck <Martin.Wilck@suse.com>
Subject: [dm-devel] [PATCH 53/72] libmultipath,
 kpartx: byteorder: always use unsigned types
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.26]); Sat, 12 Oct 2019 21:33:10 +0000 (UTC)

From: Martin Wilck <mwilck@suse.com>

The swapped results are unsigned, so the non-swapped ones should
be unsigned, too.

Signed-off-by: Martin Wilck <mwilck@suse.com>
---
 kpartx/gpt.c             |  6 +++---
 libmultipath/byteorder.h | 12 ++++++------
 2 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/kpartx/gpt.c b/kpartx/gpt.c
index 4f88d486..aa2a440c 100644
--- a/kpartx/gpt.c
+++ b/kpartx/gpt.c
@@ -40,9 +40,9 @@
 #include "kpartx.h"
 
 #if BYTE_ORDER == LITTLE_ENDIAN
-#  define __le16_to_cpu(x) (x)
-#  define __le32_to_cpu(x) (x)
-#  define __le64_to_cpu(x) (x)
+#  define __le16_to_cpu(x) (uint16_t)(x)
+#  define __le32_to_cpu(x) (uint32_t)(x)
+#  define __le64_to_cpu(x) (uint64_t)(x)
 #  define __cpu_to_le32(x) (x)
 #elif BYTE_ORDER == BIG_ENDIAN
 #  define __le16_to_cpu(x) bswap_16(x)
diff --git a/libmultipath/byteorder.h b/libmultipath/byteorder.h
index 5c771467..0a862447 100644
--- a/libmultipath/byteorder.h
+++ b/libmultipath/byteorder.h
@@ -9,19 +9,19 @@
 #endif
 
 #if BYTE_ORDER == LITTLE_ENDIAN
-#  define le16_to_cpu(x) (x)
+#  define le16_to_cpu(x) (uint16_t)(x)
 #  define be16_to_cpu(x) bswap_16(x)
-#  define le32_to_cpu(x) (x)
-#  define le64_to_cpu(x) (x)
+#  define le32_to_cpu(x) (uint32_t)(x)
+#  define le64_to_cpu(x) (uint64_t)(x)
 #  define be32_to_cpu(x) bswap_32(x)
 #  define be64_to_cpu(x) bswap_64(x)
 #elif BYTE_ORDER == BIG_ENDIAN
 #  define le16_to_cpu(x) bswap_16(x)
-#  define be16_to_cpu(x) (x)
+#  define be16_to_cpu(x) (uint16_t)(x)
 #  define le32_to_cpu(x) bswap_32(x)
 #  define le64_to_cpu(x) bswap_64(x)
-#  define be32_to_cpu(x) (x)
-#  define be64_to_cpu(x) (x)
+#  define be32_to_cpu(x) (uint32_t)(x)
+#  define be64_to_cpu(x) (uint64_t)(x)
 #else
 #  error unsupported
 #endif
-- 
2.23.0


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
