Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F8538E020
	for <lists+dm-devel@lfdr.de>; Wed, 14 Aug 2019 23:46:00 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id C953E3098444;
	Wed, 14 Aug 2019 21:45:58 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9F8D440EFE;
	Wed, 14 Aug 2019 21:45:58 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 41BA824F30;
	Wed, 14 Aug 2019 21:45:58 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x7ELj9rL006905 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 14 Aug 2019 17:45:09 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id C27DB7C141; Wed, 14 Aug 2019 21:45:09 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx05.extmail.prod.ext.phx2.redhat.com
	[10.5.110.29])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4D68C7B6FF;
	Wed, 14 Aug 2019 21:45:07 +0000 (UTC)
Received: from m9a0003g.houston.softwaregrp.com
	(m9a0003g.houston.softwaregrp.com [15.124.64.68])
	(using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 3D77A3DFCD;
	Wed, 14 Aug 2019 21:45:03 +0000 (UTC)
Received: FROM m9a0003g.houston.softwaregrp.com (15.121.0.191) BY
	m9a0003g.houston.softwaregrp.com WITH ESMTP; 
	Wed, 14 Aug 2019 21:44:33 +0000
Received: from M4W0334.microfocus.com (2002:f78:1192::f78:1192) by
	M9W0068.microfocus.com (2002:f79:bf::f79:bf) with Microsoft SMTP Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1591.10; Wed, 14 Aug 2019 21:40:12 +0000
Received: from NAM01-BN3-obe.outbound.protection.outlook.com (15.124.8.11) by
	M4W0334.microfocus.com (15.120.17.146) with Microsoft SMTP Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1591.10 via Frontend Transport; Wed, 14 Aug 2019 21:40:12 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=WKRUkOvOgnZ7z93mU8WjHPzRo1rjN5agO6YFWnb4vK4P6fQf7W1Ht2O4Oc33ngvOM6mVzCMEYueqQdP4U31hsYTKYX1mUhOOz+arXiOVZ7dOcZw+6vhroOIGMTxkEj7XyuHueZpCJeNzQtf3KcLhfHgaJs6PqL8c+qR0yujNpVwfjfX4OWmpbNcyNd26Y+SVW+HD5mXoWz7Xs9zNm1ow4s0VFrcHafwziFXSK2B+O5ZIWXvCS3hQOVoQSeZRUQd+9A/h3f/nGRGqvoO2GsadP8VQeJx99CHA6K1tyeS+8I7I0yUNwSKZP8ZDCxy/C4pmz2FAND3E2EnMMx+4j16Smw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=rS2uLpBHtrfP4ormPy+k/sQwgeefha2g3L2HGDwg1YY=;
	b=fkZbj47fr2AWc+SOmCkd/5DulxlACVxMD0KIMkLKZeAHuMibxL+ZM5lyfu/08EmLDrwMK2+8Rg2Id1Q83qErtK8k0q9udKlutav6LIeeiLPC36n4QWnnEsmtrJChP7oedLLuakl+opTtK6PaFsVgp2ZFakoXIcBzNimZ2FoNJeHKgh1VCdFnRLudhSeVc/SjcfDPB6pU0p7TMT96YSfnEvY3jlOtx2+sLAe5DCPZdor5Sf18Zh9pbgU72DE9KN5Bow+h1xx9yrUwxRODpW4QTA76AtVbNpr869JDk2V0T9oodtGiahXYSTxMpIl08ZxqS/rHsbo0wu1gccSNjwolsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
	smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
	dkim=pass header.d=suse.com; arc=none
Received: from CH2PR18MB3349.namprd18.prod.outlook.com (52.132.246.91) by
	CH2PR18MB3431.namprd18.prod.outlook.com (52.132.245.140) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2157.14; Wed, 14 Aug 2019 21:40:11 +0000
Received: from CH2PR18MB3349.namprd18.prod.outlook.com
	([fe80::8818:7a86:93d7:561a]) by
	CH2PR18MB3349.namprd18.prod.outlook.com
	([fe80::8818:7a86:93d7:561a%6]) with mapi id 15.20.2157.022;
	Wed, 14 Aug 2019 21:40:11 +0000
From: Martin Wilck <Martin.Wilck@suse.com>
To: "bmarzins@redhat.com" <bmarzins@redhat.com>,
	"christophe.varoqui@opensvc.com" <christophe.varoqui@opensvc.com>
Thread-Topic: [PATCH 06/16] libmultipath: remove store_pathgroup
Thread-Index: AQHVUujZZf6RKMjyKEemBdu7+xh54w==
Date: Wed, 14 Aug 2019 21:40:11 +0000
Message-ID: <566e3f9450145b81c592897c60dc8351b9496f58.camel@suse.com>
References: <1564763622-31752-1-git-send-email-bmarzins@redhat.com>
	<1564763622-31752-7-git-send-email-bmarzins@redhat.com>
In-Reply-To: <1564763622-31752-7-git-send-email-bmarzins@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Martin.Wilck@suse.com; 
x-originating-ip: [94.218.227.174]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d3ca8271-e560-4f63-8ae3-08d720fffc37
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
	SRVR:CH2PR18MB3431; 
x-ms-traffictypediagnostic: CH2PR18MB3431:
x-microsoft-antispam-prvs: <CH2PR18MB3431AB84AD6A693E89885864FCAD0@CH2PR18MB3431.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:660;
x-forefront-prvs: 01294F875B
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(4636009)(396003)(376002)(346002)(366004)(39860400002)(136003)(199004)(189003)(11346002)(118296001)(3846002)(36756003)(66556008)(66476007)(102836004)(4326008)(64756008)(76116006)(66446008)(91956017)(25786009)(186003)(446003)(26005)(476003)(5660300002)(86362001)(66946007)(81156014)(2616005)(2501003)(53936002)(6512007)(81166006)(486006)(8936002)(6506007)(99286004)(76176011)(14454004)(6486002)(305945005)(2906002)(8676002)(71200400001)(478600001)(54906003)(110136005)(6246003)(256004)(6436002)(229853002)(6116002)(71190400001)(558084003)(316002)(7736002)(66066001);
	DIR:OUT; SFP:1102; SCL:1; SRVR:CH2PR18MB3431;
	H:CH2PR18MB3349.namprd18.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
	permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: niAovZldJ5d0mXu6Aq6zG/hOvIld8ijh2Q2E8RrYbXw62+UEHSq97ln4DXXCiMfk8Eo4WONwPT3faJe2qCmAEBfRIHBYZ/Ha1eyASjXDk9Z6LlYWqd18YipxZIirVSA2A6R0/oiVVbBeKc1xEfwAJPSN7ZW3WzVtWJ6zou98ji8xLOERwu6OZcP+wXr3gV/OWv0I/fcre+rDwFjYVsZvFkMsKCsywHosgN/wgSUF+ZH14Ku9gfID9Kt8VGnTM5wJ5f+DGIXZFZ7TZkxXft1ZsbJKYRc/6aSHvPJ7bB5uET6lgbxxl6tgUU6R+PjswSiymHjCE8zwAMA6/DtrSzXIf+9wI/Gi20bleT2CzABAmFgo5iWJQV+uYC/1lbN+g3EfBXS1zyjbsDuWpPOfa6vGacnFacpyvqYxvL6ns8I6OkE=
x-ms-exchange-transport-forked: True
Content-ID: <37FA9F0FFE7ED949B7EB9F34C3E9C776@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: d3ca8271-e560-4f63-8ae3-08d720fffc37
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Aug 2019 21:40:11.5003 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MjctDhYdHhbcQ3fRHZwgemHoQdacP4DJerHB4TCmnfazRhaoum3yiweuS1fiLqaiGxlyTL5W1mCZsWuDWM9GdQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR18MB3431
X-OriginatorOrg: suse.com
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 238
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.29]); Wed, 14 Aug 2019 21:45:06 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.29]);
	Wed, 14 Aug 2019 21:45:06 +0000 (UTC) for IP:'15.124.64.68'
	DOMAIN:'m9a0003g.houston.softwaregrp.com'
	HELO:'m9a0003g.houston.softwaregrp.com'
	FROM:'Martin.Wilck@suse.com' RCPT:''
X-RedHat-Spam-Score: 0.001  (RCVD_IN_DNSWL_NONE, SPF_HELO_NONE, SPF_PASS,
	UNPARSEABLE_RELAY) 15.124.64.68
	m9a0003g.houston.softwaregrp.com 15.124.64.68
	m9a0003g.houston.softwaregrp.com <Martin.Wilck@suse.com>
X-Scanned-By: MIMEDefang 2.78 on 10.5.110.29
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-MIME-Autoconverted: from base64 to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id x7ELj9rL006905
X-loop: dm-devel@redhat.com
Cc: "dm-devel@redhat.com" <dm-devel@redhat.com>,
	"mkumar@redhat.com" <mkumar@redhat.com>
Subject: Re: [dm-devel] [PATCH 06/16] libmultipath: remove store_pathgroup
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
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.42]); Wed, 14 Aug 2019 21:45:59 +0000 (UTC)

On Fri, 2019-08-02 at 11:33 -0500, Benjamin Marzinski wrote:
> store_pathgroup() is only called by add_pathgroup(), and doesn't need
> to
> exist as a seperate function.
> 
> Signed-off-by: Benjamin Marzinski <bmarzins@redhat.com>

Reviewed-by: Martin Wilck <mwilck@suse.com>

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
