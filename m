Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 24E16D52B6
	for <lists+dm-devel@lfdr.de>; Sat, 12 Oct 2019 23:32:10 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 33581C049E12;
	Sat, 12 Oct 2019 21:32:08 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 089D2F6E1;
	Sat, 12 Oct 2019 21:32:08 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 4DCE04EDA5;
	Sat, 12 Oct 2019 21:32:07 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x9CLSmpL006190 for <dm-devel@listman.util.phx.redhat.com>;
	Sat, 12 Oct 2019 17:28:48 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 192405C22F; Sat, 12 Oct 2019 21:28:48 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx21.extmail.prod.ext.phx2.redhat.com
	[10.5.110.62])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CFEAB5C223;
	Sat, 12 Oct 2019 21:28:45 +0000 (UTC)
Received: from m9a0002g.houston.softwaregrp.com
	(m9a0002g.houston.softwaregrp.com [15.124.64.67])
	(using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 7B43918C4272;
	Sat, 12 Oct 2019 21:28:44 +0000 (UTC)
Received: FROM m9a0002g.houston.softwaregrp.com (15.121.0.190) BY
	m9a0002g.houston.softwaregrp.com WITH ESMTP; 
	Sat, 12 Oct 2019 21:28:05 +0000
Received: from M4W0334.microfocus.com (2002:f78:1192::f78:1192) by
	M9W0067.microfocus.com (2002:f79:be::f79:be) with Microsoft SMTP Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1591.10; Sat, 12 Oct 2019 21:28:09 +0000
Received: from NAM02-BL2-obe.outbound.protection.outlook.com (15.124.8.12) by
	M4W0334.microfocus.com (15.120.17.146) with Microsoft SMTP Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1591.10 via Frontend Transport; Sat, 12 Oct 2019 21:28:09 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=U+UTqMbf/ckeUjydwrdOS4EknnSCtpJc6wXMPdWh+aIYYpfyrqLVdZbPg9MJZspxrQObbQ4evPl3JliWLNe/U57RQ45g/hyL/y4Db3sPsMmmwH1DHqK6jce5kSBQZpEe/qPOVrbGLqrJk8dL6PI8b18GZRfANr6wPJHZXdiNP6JRYpblS2Cy5buFNUGQbhog8XzdpjzNQ51hsAKsh4D7IreO0VbMMZHb3bh5AjjE4HhoICOq049sqIB+R5NJTgj1JNYNAhB75znr2li7+nx8KtGwj4GNx3NCLpZR8CAwyRwpMqfEgIU7cH7Ukcb68G6jRF7FFo+jYBTPrLEIU6at0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=wkP9xFKilVS+dyVz3HpdU1mO6pA1kHXvTMoPUEEp3mM=;
	b=Vj9mKJ4R7Hlp+DjyLdPutxFKDxi6wxCraYYc+7h2lKbSTVI2YszfgkpDdumj7omwKFXtrVwzVNUtoHqFHwafT6OPAibzD61p993HhjSQdvDY7VBg7+iWeMMN/vSLo6NIeKji61SNdrhddFpGPeuJQRjIAlrHU6sUatTeVkn4qQr+UuK1YmcrKZVRhRSwpnr3EJ6yUN4nSO3HuBgI5HpSEbCgbFRPvDe8myoC4A+b5cUYb+VW97GnhyViN0QwePqZVbXwjw0gCwOTqmZYcoapecVtNJQ/tSYbFHJn9/gdH4pKE1X8wHcKwQGJERDiEYrbcBd94TA7Fl+0aE+uVeVPug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
	smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
	dkim=pass header.d=suse.com; arc=none
Received: from CH2PR18MB3349.namprd18.prod.outlook.com (52.132.245.83) by
	CH2PR18MB3317.namprd18.prod.outlook.com (52.132.245.210) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2347.17; Sat, 12 Oct 2019 21:28:08 +0000
Received: from CH2PR18MB3349.namprd18.prod.outlook.com
	([fe80::1075:2453:9278:e985]) by
	CH2PR18MB3349.namprd18.prod.outlook.com
	([fe80::1075:2453:9278:e985%5]) with mapi id 15.20.2347.021;
	Sat, 12 Oct 2019 21:28:08 +0000
From: Martin Wilck <Martin.Wilck@suse.com>
To: Christophe Varoqui <christophe.varoqui@opensvc.com>, Benjamin Marzinski
	<bmarzins@redhat.com>
Thread-Topic: [PATCH 25/72] libmultipath: get_ana_info(): remove unused
	parameter
Thread-Index: AQHVgUPxOxj44m0mE0qtNv7d+42bVg==
Date: Sat, 12 Oct 2019 21:28:08 +0000
Message-ID: <20191012212703.12989-26-martin.wilck@suse.com>
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
x-ms-office365-filtering-correlation-id: c7f54878-3712-4bdc-2f89-08d74f5b136e
x-ms-traffictypediagnostic: CH2PR18MB3317:
x-ld-processed: 856b813c-16e5-49a5-85ec-6f081e13b527,ExtFwd
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CH2PR18MB3317D32393E76F21641BFC21FC960@CH2PR18MB3317.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:346;
x-forefront-prvs: 0188D66E61
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(1496009)(4636009)(136003)(366004)(39860400002)(376002)(346002)(396003)(189003)(199004)(446003)(6512007)(11346002)(4326008)(8676002)(476003)(81156014)(71200400001)(71190400001)(99286004)(14454004)(8936002)(66066001)(107886003)(2616005)(486006)(81166006)(54906003)(256004)(86362001)(110136005)(44832011)(50226002)(25786009)(316002)(6436002)(478600001)(26005)(102836004)(386003)(6506007)(5660300002)(1076003)(52116002)(305945005)(36756003)(2906002)(6116002)(76176011)(4744005)(66446008)(6486002)(7736002)(66946007)(64756008)(66556008)(186003)(66476007)(3846002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:CH2PR18MB3317;
	H:CH2PR18MB3349.namprd18.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
	permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 9KUKpqNX4rML1OPEz6WjZGe5XjuKc1m/UuC8vIgCF1zfnCQrWR5lVW2r8QLKs8xLTEzB/fhfM42hUxxJr72maD3VE5n69KZ9wp27dGVZcaCywqnBy1Z3xxph6dgpHZXsG5Rhx68izCHCN1qm8ioJHH3+g1GUdA2zC7KYM+CGyezdIEwVGJA1Y6pXR4ErpATPMLPnh2xTQmNmlrxuanAO27vWiM7uuDbyIk37QYQdfwBxfs138yavTT4cfJoTteO0UeoL9YwCpsCDUSDnJ99sXYKVE8tfW338sBYYP0gy/2Lbq0o7Ob61rOrDPJkJnHb8FTDz+XJFmko2WbaGf97bSCD4LTGB14pVdO/6fHQcVk2J3x/9Sg1GCtag/Pvugm+JIOvHMix9QIppxcM7+ga3ae80I+MFfzPL1QwalyGHcFU=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: c7f54878-3712-4bdc-2f89-08d74f5b136e
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Oct 2019 21:28:08.5619 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qNy5FqSx5EnvepCXwzyniYKBtHcrzTsvT9tHrcJlcU5vbKPc98sDt2toP9LMBJm1+9OoMQeY+aj+ySl+Tx6UKQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR18MB3317
X-OriginatorOrg: suse.com
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 238
	matched, not delayed by milter-greylist-4.6.2 (mx1.redhat.com
	[10.5.110.62]); Sat, 12 Oct 2019 21:28:45 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.6.2 (mx1.redhat.com [10.5.110.62]);
	Sat, 12 Oct 2019 21:28:45 +0000 (UTC) for IP:'15.124.64.67'
	DOMAIN:'m9a0002g.houston.softwaregrp.com'
	HELO:'m9a0002g.houston.softwaregrp.com'
	FROM:'Martin.Wilck@suse.com' RCPT:''
X-RedHat-Spam-Score: 0.001  (RCVD_IN_DNSWL_NONE, SPF_HELO_NONE, SPF_PASS,
	UNPARSEABLE_RELAY) 15.124.64.67
	m9a0002g.houston.softwaregrp.com 15.124.64.67
	m9a0002g.houston.softwaregrp.com <Martin.Wilck@suse.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.62
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id x9CLSmpL006190
X-loop: dm-devel@redhat.com
Cc: "dm-devel@redhat.com" <dm-devel@redhat.com>,
	Martin Wilck <Martin.Wilck@suse.com>
Subject: [dm-devel] [PATCH 25/72] libmultipath: get_ana_info(): remove
	unused parameter
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
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.31]); Sat, 12 Oct 2019 21:32:08 +0000 (UTC)

From: Martin Wilck <mwilck@suse.com>

Signed-off-by: Martin Wilck <mwilck@suse.com>
---
 libmultipath/prioritizers/ana.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/libmultipath/prioritizers/ana.c b/libmultipath/prioritizers/ana.c
index 2673d9d9..bcb1dbf8 100644
--- a/libmultipath/prioritizers/ana.c
+++ b/libmultipath/prioritizers/ana.c
@@ -106,7 +106,7 @@ static int get_ana_state(__u32 nsid, __u32 anagrpid, void *ana_log,
 	return -ANA_ERR_GETANAS_NOTFOUND;
 }
 
-int get_ana_info(struct path * pp, unsigned int timeout)
+static int get_ana_info(struct path * pp)
 {
 	int	rc;
 	__u32 nsid;
@@ -209,7 +209,7 @@ int getprio(struct path *pp, char *args, unsigned int timeout)
 	if (pp->fd < 0)
 		rc = -ANA_ERR_NO_INFORMATION;
 	else
-		rc = get_ana_info(pp, timeout);
+		rc = get_ana_info(pp);
 
 	switch (rc) {
 	case NVME_ANA_OPTIMIZED:
-- 
2.23.0


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
