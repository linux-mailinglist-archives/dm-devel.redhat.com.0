Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 065488EECD
	for <lists+dm-devel@lfdr.de>; Thu, 15 Aug 2019 16:58:28 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id C089AC05AA71;
	Thu, 15 Aug 2019 14:58:25 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 47A761001947;
	Thu, 15 Aug 2019 14:58:25 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 4796018005C7;
	Thu, 15 Aug 2019 14:58:24 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x7FEtfmq008908 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 15 Aug 2019 10:55:41 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 99BDB10016F3; Thu, 15 Aug 2019 14:55:41 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx01.extmail.prod.ext.phx2.redhat.com
	[10.5.110.25])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 64F0C10016E8;
	Thu, 15 Aug 2019 14:55:39 +0000 (UTC)
Received: from m9a0003g.houston.softwaregrp.com
	(m9a0003g.houston.softwaregrp.com [15.124.64.68])
	(using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id E2315796EF;
	Thu, 15 Aug 2019 14:55:36 +0000 (UTC)
Received: FROM m9a0003g.houston.softwaregrp.com (15.121.0.190) BY
	m9a0003g.houston.softwaregrp.com WITH ESMTP; 
	Thu, 15 Aug 2019 14:55:04 +0000
Received: from M4W0335.microfocus.com (2002:f78:1193::f78:1193) by
	M9W0067.microfocus.com (2002:f79:be::f79:be) with Microsoft SMTP Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1591.10; Thu, 15 Aug 2019 14:46:54 +0000
Received: from NAM01-BN3-obe.outbound.protection.outlook.com (15.124.8.14) by
	M4W0335.microfocus.com (15.120.17.147) with Microsoft SMTP Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1591.10 via Frontend Transport; Thu, 15 Aug 2019 14:46:54 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=U6IbGXMNxUsHy6h4pxizXsbwJhTwrgtxNWzIVjmC7uApCeAEVU9cVhpFiyON30z8+OExwshqgCw0wUqJOGLgOPIEtNmMYNjPDcg3c9xC6d92q+xmdTj2jWPeIJuqzZ60tLY1ullU73gL0a90kxzkp/rGdE+vRNvWYEOZIfkVQ4/Goa4a+XhwM2cN4EX/FPF9XSWrSuLc6tAqdyX0aESA6qsTILhFSdq0vYTW50xBlz8OdO63sySCeVsRQ5PfLoiU+7NbDtXLrjx+5u3iT94cR8R82greZOLU7jEkflYaaudKREMKNKE7K5QZty/xLvdt+YQzBYUWjp9EHWpW+ubnMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=lXH8RtBbenieSxs2Ds1mZYyYQrySUqnqedZlssvI/Ew=;
	b=dv1adVHPmnexIuvj0KWfRlDTM7DxZSIVTrgfI21JHdS5O7PYKq/8Tbxb+CkSewbDsY83gzUGSmBVrQuhwPfjjWIzg4D62OktG/1DvbfutnaKl/kKYHVswg2u1EL1iBdc5bFYjuQO7QqpwwKqHEqSM8EMQREJ0qROBfgxG9GQS4aZtWB0BC8pSK7WPv8omaiP8tUdGdznV339Xyx5Z9cSCKB44NtkFTSEXdrUeXVcUq0GoDJtix9+Ph7RkROkrM9ARw4MB1Uxh9O1O6rO0PmazD/mgxlg4zxWNuE+z9TRTskpPw8SFFfRPN9F0A8rAZMDHm+E5WS/UO+QB5jtgGb44A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
	smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
	dkim=pass header.d=suse.com; arc=none
Received: from CH2PR18MB3349.namprd18.prod.outlook.com (52.132.246.91) by
	CH2PR18MB3319.namprd18.prod.outlook.com (52.132.246.21) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2157.13; Thu, 15 Aug 2019 14:46:53 +0000
Received: from CH2PR18MB3349.namprd18.prod.outlook.com
	([fe80::8818:7a86:93d7:561a]) by
	CH2PR18MB3349.namprd18.prod.outlook.com
	([fe80::8818:7a86:93d7:561a%6]) with mapi id 15.20.2157.022;
	Thu, 15 Aug 2019 14:46:53 +0000
From: Martin Wilck <Martin.Wilck@suse.com>
To: Christophe Varoqui <christophe.varoqui@opensvc.com>, Benjamin Marzinski
	<bmarzins@redhat.com>
Thread-Topic: [PATCH 0/2] multipath-tools: Add option to disable NVMe
	("foreign") support
Thread-Index: AQHVU3hHnrIhl0XVfUaSEs1LLq48Ww==
Date: Thu, 15 Aug 2019 14:46:53 +0000
Message-ID: <20190815144638.5664-1-martin.wilck@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: AM7PR04CA0018.eurprd04.prod.outlook.com
	(2603:10a6:20b:110::28) To CH2PR18MB3349.namprd18.prod.outlook.com
	(2603:10b6:610:2c::27)
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Martin.Wilck@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [94.218.227.174]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0af897b5-4c90-4d40-fd28-08d7218f697c
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(5600148)(711020)(4605104)(1401327)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
	SRVR:CH2PR18MB3319; 
x-ms-traffictypediagnostic: CH2PR18MB3319:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CH2PR18MB3319D16956861A9452DEB7F1FCAC0@CH2PR18MB3319.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3826;
x-forefront-prvs: 01304918F3
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(4636009)(396003)(366004)(376002)(136003)(39860400002)(346002)(199004)(189003)(476003)(486006)(66556008)(5660300002)(66476007)(14454004)(81166006)(6512007)(66446008)(2616005)(81156014)(6486002)(8676002)(64756008)(44832011)(66066001)(54906003)(4326008)(25786009)(110136005)(66946007)(316002)(305945005)(186003)(26005)(478600001)(52116002)(4744005)(36756003)(1076003)(256004)(107886003)(86362001)(6436002)(71200400001)(2906002)(53936002)(71190400001)(102836004)(6116002)(3846002)(99286004)(7736002)(386003)(6506007)(8936002)(50226002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:CH2PR18MB3319;
	H:CH2PR18MB3349.namprd18.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
	permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 6DfhzWUspmjzf8NtaCcu/lYZPt63sYBkQXJpMZ3ercXqf5UyAzavLKNOARvRVykzrSd7Cp+xNVeATSKm5N86dNEV8SBXyix8KnRmkEFH+TjLO1j5zmLtsUi7yXsXd2R0m9q50DuUCEZHSmLFtYy0oQLZGGV64eV3PdPfEyeMQtwJKJnMUK+6/hLAn9M/xIgrzS0A9HwvWNI5mwlueEXe5xVP9NsRtoQ3GuE0oHFUvzqo30xueL7e7hGXDySLzproSMMGRy9VNuhFNUstCHo9nXZD/EEQhWBwJqN/PAigjMFJoxUZ2z7OrRq4uEs+s/lHBGqGu+sXB9FYT31bWP+v3sa+iSrzka0QnhnyJYEqRm3gY+To3XodkXkdvhSi3KGx90QkeUjLLTT4AK8PjZbMbP8pOeHJcqPpd1F8zYJFuIo=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 0af897b5-4c90-4d40-fd28-08d7218f697c
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Aug 2019 14:46:53.4760 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +ViVtso4qkuzWv5RYtN4rrDgMDfC0Sx74acnkggR5XccMt7gdiIsXiea1J19F/wbXWqkVg8WxUvz1daOecBDbw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR18MB3319
X-OriginatorOrg: suse.com
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 238
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.25]); Thu, 15 Aug 2019 14:55:38 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.25]);
	Thu, 15 Aug 2019 14:55:38 +0000 (UTC) for IP:'15.124.64.68'
	DOMAIN:'m9a0003g.houston.softwaregrp.com'
	HELO:'m9a0003g.houston.softwaregrp.com'
	FROM:'Martin.Wilck@suse.com' RCPT:''
X-RedHat-Spam-Score: 0.001  (RCVD_IN_DNSWL_NONE, SPF_HELO_NONE, SPF_PASS,
	UNPARSEABLE_RELAY) 15.124.64.68
	m9a0003g.houston.softwaregrp.com 15.124.64.68
	m9a0003g.houston.softwaregrp.com <Martin.Wilck@suse.com>
X-Scanned-By: MIMEDefang 2.83 on 10.5.110.25
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id x7FEtfmq008908
X-loop: dm-devel@redhat.com
Cc: "dm-devel@redhat.com" <dm-devel@redhat.com>,
	Martin Wilck <Martin.Wilck@suse.com>
Subject: [dm-devel] [PATCH 0/2] multipath-tools: Add option to disable NVMe
 ("foreign") support
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.32]); Thu, 15 Aug 2019 14:58:26 +0000 (UTC)

From: Martin Wilck <mwilck@suse.com>

Hi Christophe, hi Ben,

This is my alternative take to Ben's "multipath: add print_foreign option"
patch. I'd prefer it because it's more generic and more flexible for future
extensions.

Regards
Martin

Martin Wilck (2):
  multipath.conf: add "enable_foreign" parameter
  multipath.conf.5: document foreign library support

 libmultipath/config.h      |  1 +
 libmultipath/defaults.h    |  2 ++
 libmultipath/dict.c        |  6 +++++
 libmultipath/foreign.c     | 53 +++++++++++++++++++++++++++++++++++---
 libmultipath/foreign.h     |  3 ++-
 multipath/main.c           |  2 +-
 multipath/multipath.conf.5 | 40 ++++++++++++++++++++++++++++
 multipathd/main.c          |  2 +-
 8 files changed, 102 insertions(+), 7 deletions(-)

-- 
2.22.0


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
