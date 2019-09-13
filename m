Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 427BDB1923
	for <lists+dm-devel@lfdr.de>; Fri, 13 Sep 2019 09:47:02 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 198652BFDD;
	Fri, 13 Sep 2019 07:47:00 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AB20819C5B;
	Fri, 13 Sep 2019 07:46:59 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 9AC714A460;
	Fri, 13 Sep 2019 07:46:58 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x8D7hYNi005799 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 13 Sep 2019 03:43:34 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 483C6100195C; Fri, 13 Sep 2019 07:43:34 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx12.extmail.prod.ext.phx2.redhat.com
	[10.5.110.41])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0B9E01001944;
	Fri, 13 Sep 2019 07:43:32 +0000 (UTC)
Received: from m4a0041g.houston.softwaregrp.com
	(m4a0041g.houston.softwaregrp.com [15.124.2.87])
	(using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 63A3030001EB;
	Fri, 13 Sep 2019 07:43:25 +0000 (UTC)
Received: FROM m4a0041g.houston.softwaregrp.com (15.120.17.147) BY
	m4a0041g.houston.softwaregrp.com WITH ESMTP; 
	Fri, 13 Sep 2019 07:41:34 +0000
Received: from M9W0067.microfocus.com (2002:f79:be::f79:be) by
	M4W0335.microfocus.com (2002:f78:1193::f78:1193) with Microsoft SMTP
	Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1591.10; Fri, 13 Sep 2019 07:39:59 +0000
Received: from NAM05-DM3-obe.outbound.protection.outlook.com (15.124.72.13) by
	M9W0067.microfocus.com (15.121.0.190) with Microsoft SMTP Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1591.10 via Frontend Transport; Fri, 13 Sep 2019 07:39:59 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=mpCqRehGTVZgF2MXYOz32hR2bP+P7vX7c/8rUH7+AsUieFlXl4oaJ9iSOsbrtge2y21WrJHVLYD6OodPni2M+CaK1yFli4xsj/vpQm5oyUoHSZrwUlb7gYhYQ/XH/MupOWEUhQ+anYk4+PHaWDA1HNHdnAkoQynuOnnBYppWs1qV1xsxYmnEY4fy4UHL2JYocuq6T2LCByGMBc+Qg/eJXxhU9ZboCFCOiVkICIobseQPPupeP3/03VrV2h5Bhh1ryzobtqsgMdZjgcYOCoBdWBcPwJpOUB1fFfaq0ZJmCXWPe9zqU6vKoM+QS1nFHr5ntQpBvqBF91ZrfJ7egwi3YQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=KIcHezqr/003hNrQ5MJqwKJGYpugH2Lpxd5eYq6V9AQ=;
	b=hujXnzPMJubwSZwxOndjZmVgwwTz4kYr7UZou3Yxj8R4c5qUZU39T1Hn85nD5yJ5ZEz5MYCCVtmiEqOsI26TkDagxO62VXPlgS/w8r8SVsJ3csAJIXpD2baePcZgtkILDPKpVsjgR29ACfg3lGaGXvmhIhHNxoaldPX/VMsD0vzFV4wzRNg3j+k2cxqk/H3YBhX+QsVGXYbsjiXsd/HviteGItpoOMrSC+jbwbhdimxOeTvxTFY2ADfdRIIwvZrYHbO37jlmlRRWoJcKyioX/iDmOKLiMGMZavR4vZ4S3g0trmiuGX6S7j++QzUY2lPlB8lIOA1XjzxqFH8MrUtZAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
	smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
	dkim=pass header.d=suse.com; arc=none
Received: from CH2PR18MB3349.namprd18.prod.outlook.com (52.132.246.91) by
	CH2PR18MB3398.namprd18.prod.outlook.com (52.132.246.221) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2263.15; Fri, 13 Sep 2019 07:39:53 +0000
Received: from CH2PR18MB3349.namprd18.prod.outlook.com
	([fe80::d507:1099:1d46:c025]) by
	CH2PR18MB3349.namprd18.prod.outlook.com
	([fe80::d507:1099:1d46:c025%6]) with mapi id 15.20.2241.018;
	Fri, 13 Sep 2019 07:39:53 +0000
From: Martin Wilck <Martin.Wilck@suse.com>
To: "bmarzins@redhat.com" <bmarzins@redhat.com>,
	"christophe.varoqui@opensvc.com" <christophe.varoqui@opensvc.com>
Thread-Topic: [PATCH 2/4] libmultipath: EMC PowerMax NVMe device config
Thread-Index: AQHVagZucoPxmQO+00avpeFAM0r9NQ==
Date: Fri, 13 Sep 2019 07:39:53 +0000
Message-ID: <a2ff649478fa4c04447637fd751680dd740c3f47.camel@suse.com>
References: <1568155161-9343-1-git-send-email-bmarzins@redhat.com>
	<1568155161-9343-3-git-send-email-bmarzins@redhat.com>
In-Reply-To: <1568155161-9343-3-git-send-email-bmarzins@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Martin.Wilck@suse.com; 
x-originating-ip: [90.186.0.117]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c8c4522e-e4ca-438a-4daf-08d7381d913b
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(5600166)(711020)(4605104)(1401327)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
	SRVR:CH2PR18MB3398; 
x-ms-traffictypediagnostic: CH2PR18MB3398:
x-microsoft-antispam-prvs: <CH2PR18MB3398F57FD3587A7EAD5FDDFEFCB30@CH2PR18MB3398.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:883;
x-forefront-prvs: 0159AC2B97
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(4636009)(346002)(366004)(39860400002)(376002)(136003)(396003)(199004)(189003)(7736002)(66066001)(8676002)(91956017)(71190400001)(71200400001)(558084003)(6506007)(99286004)(11346002)(446003)(110136005)(54906003)(476003)(2616005)(256004)(26005)(66446008)(64756008)(66946007)(66476007)(76176011)(5660300002)(6436002)(102836004)(66556008)(186003)(86362001)(486006)(229853002)(14454004)(25786009)(6486002)(53936002)(36756003)(2501003)(6246003)(478600001)(118296001)(4326008)(6512007)(2906002)(316002)(6116002)(8936002)(3846002)(81156014)(81166006)(305945005)(76116006);
	DIR:OUT; SFP:1102; SCL:1; SRVR:CH2PR18MB3398;
	H:CH2PR18MB3349.namprd18.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
	permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: at8RRUHtYdAlPIyOt59B81RFn+7Ltf9ZD8AX+A1WeS4eDXGL5kwLmmbjt5Mb5Ss4VAIqPZPPblrpxoEyfNfmkUZBlHC/H5Ufby0wcePcsMyLW/Ut2YTosh6PmSdFeLhv7WTVC9wuGgMvkGBr5JiKgviThmVU09+Aap26L76hvWWvhozMaciqRTyKk2EIj9AL2VOKmkDVqltqqCdi7/kQwjYnAD17LIVkJ7zzNFiatL3UVYSLO7p2qwPnqEe+uPcBBLuyzNv2UxFuVIg0t0qxDKE3mM+UsaesJf6FFfj3JPHGLUjEGLeYt7Set5gkPYiujQU3ZIyud1YD5lpuhic2+ETUt0GB5NWBxKLsNfA2DgRLq4SQcwWgyVVcvsyxMUACe/UJXbxO8f0LRNc/RfCUECEOcNmJ7iUxjs2FIZoySEQ=
x-ms-exchange-transport-forked: True
Content-ID: <F5F48ABBC6EFD84FB91BD54A01459CC8@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: c8c4522e-e4ca-438a-4daf-08d7381d913b
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Sep 2019 07:39:53.6735 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VYxpfNTWfWeTLvVpFG+pMuTPijW1/dK1lO2Ia/3N2PIBRdb2hzFKvDc/Ns9826As2S7n1/1qLHoxHOq2ZNAXww==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR18MB3398
X-OriginatorOrg: suse.com
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 238
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.41]); Fri, 13 Sep 2019 07:43:30 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.41]);
	Fri, 13 Sep 2019 07:43:30 +0000 (UTC) for IP:'15.124.2.87'
	DOMAIN:'m4a0041g.houston.softwaregrp.com'
	HELO:'m4a0041g.houston.softwaregrp.com'
	FROM:'Martin.Wilck@suse.com' RCPT:''
X-RedHat-Spam-Score: 0.001  (RCVD_IN_DNSWL_NONE, SPF_HELO_NONE, SPF_PASS,
	UNPARSEABLE_RELAY) 15.124.2.87
	m4a0041g.houston.softwaregrp.com 15.124.2.87
	m4a0041g.houston.softwaregrp.com <Martin.Wilck@suse.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.41
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-MIME-Autoconverted: from base64 to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id x8D7hYNi005799
X-loop: dm-devel@redhat.com
Cc: "dm-devel@redhat.com" <dm-devel@redhat.com>,
	"yi.he@dell.com" <yi.he@dell.com>
Subject: Re: [dm-devel] [PATCH 2/4] libmultipath: EMC PowerMax NVMe device
	config
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
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.39]); Fri, 13 Sep 2019 07:47:00 +0000 (UTC)

On Tue, 2019-09-10 at 17:39 -0500, Benjamin Marzinski wrote:
> Got this config from Dell.
> 
> Cc: heyi <yi.he@dell.com>
> Signed-off-by: Benjamin Marzinski <bmarzins@redhat.com>
> ---
>  libmultipath/hwtable.c | 6 ++++++
>  1 file changed, 6 insertions(+)

Reviewed-by: Martin Wilck <mwilck@suse.com>


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
