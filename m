Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id C6E998E009
	for <lists+dm-devel@lfdr.de>; Wed, 14 Aug 2019 23:43:01 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id B5643315C01C;
	Wed, 14 Aug 2019 21:42:59 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5912F8CB83;
	Wed, 14 Aug 2019 21:42:58 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 8C23024F30;
	Wed, 14 Aug 2019 21:42:55 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x7ELgVOT006810 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 14 Aug 2019 17:42:31 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 72695825F8; Wed, 14 Aug 2019 21:42:31 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx11.extmail.prod.ext.phx2.redhat.com
	[10.5.110.40])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E1A54D1F8;
	Wed, 14 Aug 2019 21:42:28 +0000 (UTC)
Received: from m4a0039g.houston.softwaregrp.com
	(m4a0039g.houston.softwaregrp.com [15.124.2.85])
	(using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 54698300D21B;
	Wed, 14 Aug 2019 21:42:22 +0000 (UTC)
Received: FROM m4a0039g.houston.softwaregrp.com (15.120.17.147) BY
	m4a0039g.houston.softwaregrp.com WITH ESMTP; 
	Wed, 14 Aug 2019 21:42:10 +0000
Received: from M4W0334.microfocus.com (2002:f78:1192::f78:1192) by
	M4W0335.microfocus.com (2002:f78:1193::f78:1193) with Microsoft SMTP
	Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1591.10; Wed, 14 Aug 2019 21:40:34 +0000
Received: from NAM04-SN1-obe.outbound.protection.outlook.com (15.124.8.11) by
	M4W0334.microfocus.com (15.120.17.146) with Microsoft SMTP Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1591.10 via Frontend Transport; Wed, 14 Aug 2019 21:40:34 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=IAo3teedaMWh+iZk9bkLOYqNZQPszb1xKLOo7ONRQOHvohGg1PlFKrZ/eHiHXBWyMKUs9EbD5xm91F/41Vi/ttGQ2zC0nflzbDwMspdC4FPnKIMLxjHRMaFjWH6S700yOJ/T7Kgea8hmvbMbI8Kt9/i3Z/rDo7Gco8Td/Q04u1UHBaf1p/+eN5i69Qdh8Er6UD7nJB+ESk+8yygJl03Pq4MVpISGq9dEZKS9ElgtnmE0kJ0KnFDN3nqyalgNeO3Kslb1FBIrWUGokU+CEsRmvv6yi4XY149l/epXuURN75//2HYD2SQybQC4osexrfFQvqO0HCCAlvVIpIMV7DyCGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=JucQ9G/F1z+FEhQBjrjqgqdt33pwapTceWNzi1vxGDU=;
	b=KCVGt8A6j74z0WpBX+8/1akJ4Y9qdMTL4MyZLxKAOvw8uWaaf+2j15L1Mhju+mdyhMpF1s0vI8jSJO8O0F+8SpNS1hKbHi4vWWexlhC+YqXW07hLBL9pak85RxUkPEKX2szVjmAFqU6zcg9vVoKd/D3kvxtijiAe9+NjHSrWr+FlBE4rnugVkSg8XbPdCCDjosgW8IREZo4JfI3pi6SODtUFwE/S+7gQRHtJkn4StmDqZ8EvxNJKR3xShjURC3IMQpyAmA7BF8duXfjp6rEXYMGoR7HUrF91j2Z/pk3vTqQtlwps8PGINZUvz8n1W9bDKw+e+6Mis65bmBN9YPuMIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
	smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
	dkim=pass header.d=suse.com; arc=none
Received: from CH2PR18MB3349.namprd18.prod.outlook.com (52.132.246.91) by
	CH2PR18MB3222.namprd18.prod.outlook.com (52.132.245.20) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2157.18; Wed, 14 Aug 2019 21:40:33 +0000
Received: from CH2PR18MB3349.namprd18.prod.outlook.com
	([fe80::8818:7a86:93d7:561a]) by
	CH2PR18MB3349.namprd18.prod.outlook.com
	([fe80::8818:7a86:93d7:561a%6]) with mapi id 15.20.2157.022;
	Wed, 14 Aug 2019 21:40:33 +0000
From: Martin Wilck <Martin.Wilck@suse.com>
To: "bmarzins@redhat.com" <bmarzins@redhat.com>,
	"christophe.varoqui@opensvc.com" <christophe.varoqui@opensvc.com>
Thread-Topic: [PATCH 07/16] libmultipath: make one_group allocate a new vector
Thread-Index: AQHVUujm2EEBHmpnjk2k5jDZtcNeyQ==
Date: Wed, 14 Aug 2019 21:40:33 +0000
Message-ID: <40e16015d7710fb5a1a469da57b39749b026677b.camel@suse.com>
References: <1564763622-31752-1-git-send-email-bmarzins@redhat.com>
	<1564763622-31752-8-git-send-email-bmarzins@redhat.com>
In-Reply-To: <1564763622-31752-8-git-send-email-bmarzins@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Martin.Wilck@suse.com; 
x-originating-ip: [94.218.227.174]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1c377c4f-9a1a-4608-afcc-08d72100091e
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
	SRVR:CH2PR18MB3222; 
x-ms-traffictypediagnostic: CH2PR18MB3222:
x-microsoft-antispam-prvs: <CH2PR18MB3222992BAC24C0BF1C343D51FCAD0@CH2PR18MB3222.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5516;
x-forefront-prvs: 01294F875B
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(4636009)(136003)(39860400002)(376002)(396003)(346002)(366004)(199004)(189003)(26005)(6506007)(8936002)(478600001)(8676002)(6512007)(102836004)(6486002)(316002)(14454004)(4326008)(99286004)(54906003)(110136005)(2501003)(86362001)(81156014)(5660300002)(76176011)(81166006)(486006)(11346002)(118296001)(7736002)(305945005)(2616005)(91956017)(66066001)(25786009)(256004)(6116002)(71200400001)(186003)(53936002)(2906002)(476003)(36756003)(64756008)(66446008)(66476007)(66556008)(558084003)(6436002)(6246003)(66946007)(229853002)(3846002)(446003)(76116006)(71190400001);
	DIR:OUT; SFP:1102; SCL:1; SRVR:CH2PR18MB3222;
	H:CH2PR18MB3349.namprd18.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
	permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 7JGTyjI9KS1egQFSKknxGfnWzdXSnxTUlA3wAPN+/kZKr3B35RBg3zjlOVjjF5HWkZzgDz1ssHVSdLlp/Wuq03elhBV0/ERlSEEcZeb7RepeXD1vNeOVp9pypsr4MEDsQSteDL1I0/PFo54Mcw+bJ0A2vO8YhcNCEJva6EZcHd9hx5ZUVISQ5C7JjVtueYxfX7lLsLRSOkeHVvD9ve4VD1Sx4fLW/R1ypGTeJegCFh8eZ/U7cru7y0deS71WgixKPBSzKSXHSGtF+QwS4L4O9HQQVW6Qpox/IvBQl1nybKIe4Om8cZQJG1ATN54yO5StI7jmxJy2CJHqDVLnXe5yVsM0szJCqWg6X/YFa3MCCxjtIn/PnMQ+q4Trp3SsDgtrBXnRkgA2qPWPKft6AsGNp/kGeBGCG9gcpTnrD0u22p0=
x-ms-exchange-transport-forked: True
Content-ID: <11B524C366D57542A3BDDF52CBCB9876@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c377c4f-9a1a-4608-afcc-08d72100091e
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Aug 2019 21:40:33.1817 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JzxGDNS1SVkVqgIWUpIgIZwwpDmP4YYxXOFI5q3uJZTPCI0nWnIHMljl7sAyfBTfcmgN0zJQsgN0TiPIAkSzoA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR18MB3222
X-OriginatorOrg: suse.com
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 238
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.40]); Wed, 14 Aug 2019 21:42:28 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.40]);
	Wed, 14 Aug 2019 21:42:28 +0000 (UTC) for IP:'15.124.2.85'
	DOMAIN:'m4a0039g.houston.softwaregrp.com'
	HELO:'m4a0039g.houston.softwaregrp.com'
	FROM:'Martin.Wilck@suse.com' RCPT:''
X-RedHat-Spam-Score: 0.001  (RCVD_IN_DNSWL_NONE, SPF_HELO_NONE, SPF_PASS,
	UNPARSEABLE_RELAY) 15.124.2.85
	m4a0039g.houston.softwaregrp.com 15.124.2.85
	m4a0039g.houston.softwaregrp.com <Martin.Wilck@suse.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.40
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-MIME-Autoconverted: from base64 to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id x7ELgVOT006810
X-loop: dm-devel@redhat.com
Cc: "dm-devel@redhat.com" <dm-devel@redhat.com>,
	"mkumar@redhat.com" <mkumar@redhat.com>
Subject: Re: [dm-devel] [PATCH 07/16] libmultipath: make one_group allocate
	a new vector
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.41]); Wed, 14 Aug 2019 21:43:00 +0000 (UTC)

On Fri, 2019-08-02 at 11:33 -0500, Benjamin Marzinski wrote:
> All the pgpolicy functions besides one_group() allocate a new vector
> for
> the pathgroups. If one_group() works the same, it is easier to factor
> out the common code.
> 
> Signed-off-by: Benjamin Marzinski <bmarzins@redhat.com>

Reviewed-by: Martin Wilck <mwilck@suse.com>


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
