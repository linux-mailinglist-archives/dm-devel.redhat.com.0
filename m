Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 9591AD52EB
	for <lists+dm-devel@lfdr.de>; Sat, 12 Oct 2019 23:46:57 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 16CAC315C002;
	Sat, 12 Oct 2019 21:46:55 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BB6E85D6A3;
	Sat, 12 Oct 2019 21:46:54 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 59FF14EE69;
	Sat, 12 Oct 2019 21:46:54 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x9CLW7V7007170 for <dm-devel@listman.util.phx.redhat.com>;
	Sat, 12 Oct 2019 17:32:08 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id EB5CA60BFB; Sat, 12 Oct 2019 21:32:07 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx26.extmail.prod.ext.phx2.redhat.com
	[10.5.110.67])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E18CA60BF4;
	Sat, 12 Oct 2019 21:32:07 +0000 (UTC)
Received: from m4a0039g.houston.softwaregrp.com
	(m4a0039g.houston.softwaregrp.com [15.124.2.85])
	(using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id B2FEE80166A;
	Sat, 12 Oct 2019 21:32:06 +0000 (UTC)
Received: FROM m4a0039g.houston.softwaregrp.com (15.120.17.147) BY
	m4a0039g.houston.softwaregrp.com WITH ESMTP; 
	Sat, 12 Oct 2019 21:31:13 +0000
Received: from M4W0334.microfocus.com (2002:f78:1192::f78:1192) by
	M4W0335.microfocus.com (2002:f78:1193::f78:1193) with Microsoft SMTP
	Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1591.10; Sat, 12 Oct 2019 21:28:56 +0000
Received: from NAM04-BN3-obe.outbound.protection.outlook.com (15.124.8.10) by
	M4W0334.microfocus.com (15.120.17.146) with Microsoft SMTP Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1591.10 via Frontend Transport; Sat, 12 Oct 2019 21:28:56 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=SQtmxio6MnDkhuxuKMN1lukk0BZ0Ev6X9pZWgZ47mMgQlnP78d9Mja7/ajbKNqs1ny5nCrFrBXLUQOKmQC25bgti53/LBIS4snYItYGeK7RZh1IevuSt4zm9AMg/tglQUwZnWun6Ajfw0YpW7Sop6bPNpoaIRrW6cMhTx1AFb+t/ds88896YNrP06Q4umQ4MWMye/RyhJ2eKFPNrqpPc6j+u5CqOdsQs8bnos+qsoyluMRZMQRgE3tKIBZgyaisPR+X2Zb7gv4RIg70Jsoe/Met69nwVKMOeKtzJIMZsgbABlXthKgVwycvf5rUt6+PLxZTbJzJvnORCclTz++TJoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=+/Ghb7PMm83wXHSb5YNDgtR+QCrCJLhPLGcKqC4bigI=;
	b=jMRAdNgXtuFy86xSAOxvw3ocXVv+48E54o3wfBzPbqUWcencHhlRDVKjyJGqrIZRSLeBJ6nVzc5vXjk+YUzxpmb9EvD7w939ZLfYx4PSyb/Z9PMIxACUsw4JPVu8fMOoGQW+yws/RvabUK7jWdZ14UI6ZE0HghxS5771Uug5nanpAz6QPyx2ZaCnm8KydFSq5rkjS7plTRw9YyCXs5AjCyCe+tK6dvFdB1vAFZmlIQBdYgWDpePQZcBrplNjJ8D3KC7AM5fLC3UoFRUNkCR0KM6Yoe1t3e4QYkyQvoQINrYTlYUkhzMPq72rSxtLIK9vD2ID5cs5otrPyH40bw5EbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
	smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
	dkim=pass header.d=suse.com; arc=none
Received: from CH2PR18MB3349.namprd18.prod.outlook.com (52.132.245.83) by
	CH2PR18MB3317.namprd18.prod.outlook.com (52.132.245.210) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2347.17; Sat, 12 Oct 2019 21:28:52 +0000
Received: from CH2PR18MB3349.namprd18.prod.outlook.com
	([fe80::1075:2453:9278:e985]) by
	CH2PR18MB3349.namprd18.prod.outlook.com
	([fe80::1075:2453:9278:e985%5]) with mapi id 15.20.2347.021;
	Sat, 12 Oct 2019 21:28:52 +0000
From: Martin Wilck <Martin.Wilck@suse.com>
To: Christophe Varoqui <christophe.varoqui@opensvc.com>, Benjamin Marzinski
	<bmarzins@redhat.com>
Thread-Topic: [PATCH 42/72] multipath-tools: Makefile.inc: remove
	-Wno-unused-parameter
Thread-Index: AQHVgUP9k2SzaOFSRUuJzlkTumqk9g==
Date: Sat, 12 Oct 2019 21:28:29 +0000
Message-ID: <20191012212703.12989-43-martin.wilck@suse.com>
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
x-ms-office365-filtering-correlation-id: 2d288715-e06f-46c3-47b0-08d74f5b2012
x-ms-traffictypediagnostic: CH2PR18MB3317:
x-ld-processed: 856b813c-16e5-49a5-85ec-6f081e13b527,ExtFwd
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CH2PR18MB331756099A0D8A05E9F87513FC960@CH2PR18MB3317.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:256;
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
x-microsoft-antispam-message-info: /7dy/ThMfqDtbY8eYte8F3jIuDBZ2HYFiIH+DyM92geLbSPC9YsBvsV0LmTumVzRhjXpN+2W0FRZob2DAB8q5v8qiPCblR4tGi3AcDymhzQeexno7TGXUX891xwrCIoerwIMX/A5gp1X43WGPsTYESgzsBHvo+scYnJ48OmZm7VEUAsAYiXeyly2wr0Mtmqpfl5HA2IMuMzsmzHVa1wdsa2LXydIxm0ymuiL0P67P2e7DQYEiB1fCqFS5rgwfbiyCu/Fh8DcSdSzXm1CaGOIeEdnurt+Zz6sLP+n31Rh8Rn9HY4dTI2vfyx6MmdFxfrsd4Hoswmbp/o9H/IwrdalNcWR2zRbqW9UTbAY5Z28Zj5AQQe71KiB2RAnRdrkxxcDnO8i5ZktDwzqR20QRCDxkyQqqegOqzoFO1M0vEkoUFU=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d288715-e06f-46c3-47b0-08d74f5b2012
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Oct 2019 21:28:29.7440 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8hsiY/0eIAOdBOgnAo7Q7jMGBYWahWrccOUwMDk0tLhamWKz8lFpx2f7ZEJi9iN2zgDCSc78Ieg7TERE9X2LAg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR18MB3317
X-OriginatorOrg: suse.com
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 238
	matched, not delayed by milter-greylist-4.6.2 (mx1.redhat.com
	[10.5.110.67]); Sat, 12 Oct 2019 21:32:07 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.6.2 (mx1.redhat.com [10.5.110.67]);
	Sat, 12 Oct 2019 21:32:07 +0000 (UTC) for IP:'15.124.2.85'
	DOMAIN:'m4a0039g.houston.softwaregrp.com'
	HELO:'m4a0039g.houston.softwaregrp.com'
	FROM:'Martin.Wilck@suse.com' RCPT:''
X-RedHat-Spam-Score: 0.001  (RCVD_IN_DNSWL_NONE, SPF_HELO_NONE, SPF_PASS,
	UNPARSEABLE_RELAY) 15.124.2.85
	m4a0039g.houston.softwaregrp.com 15.124.2.85
	m4a0039g.houston.softwaregrp.com <Martin.Wilck@suse.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.67
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id x9CLW7V7007170
X-loop: dm-devel@redhat.com
Cc: "dm-devel@redhat.com" <dm-devel@redhat.com>,
	Martin Wilck <Martin.Wilck@suse.com>
Subject: [dm-devel] [PATCH 42/72] multipath-tools: Makefile.inc: remove
 -Wno-unused-parameter
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
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.41]); Sat, 12 Oct 2019 21:46:55 +0000 (UTC)

From: Martin Wilck <mwilck@suse.com>

All warnings have been eliminated now.

Signed-off-by: Martin Wilck <mwilck@suse.com>
---
 Makefile.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Makefile.inc b/Makefile.inc
index 56c3eda0..da9a3d7d 100644
--- a/Makefile.inc
+++ b/Makefile.inc
@@ -93,7 +93,7 @@ ERROR_DISCARDED_QUALIFIERS := $(call TEST_CC_OPTION,-Werror=discarded-qualifiers
 
 OPTFLAGS	= -O2 -g -pipe -Wall -Wextra -Wformat=2 -Werror=implicit-int \
 		  -Werror=implicit-function-declaration -Werror=format-security \
-		  -Wno-sign-compare -Wno-unused-parameter -Wno-clobbered \
+		  -Wno-sign-compare -Wno-clobbered \
 		  -Werror=cast-qual $(ERROR_DISCARDED_QUALIFIERS) \
 		  -Wp,-D_FORTIFY_SOURCE=2 $(STACKPROT) \
 		  --param=ssp-buffer-size=4
-- 
2.23.0


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
