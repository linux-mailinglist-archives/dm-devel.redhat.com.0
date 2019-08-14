Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id CE3958E01D
	for <lists+dm-devel@lfdr.de>; Wed, 14 Aug 2019 23:45:39 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id B604AC08EC1E;
	Wed, 14 Aug 2019 21:45:37 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7E89490A19;
	Wed, 14 Aug 2019 21:45:37 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 0E07818089C8;
	Wed, 14 Aug 2019 21:45:37 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x7ELf5R5006735 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 14 Aug 2019 17:41:05 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id C0B608209B; Wed, 14 Aug 2019 21:41:05 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx18.extmail.prod.ext.phx2.redhat.com
	[10.5.110.47])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 58DB882096;
	Wed, 14 Aug 2019 21:41:03 +0000 (UTC)
Received: from m9a0002g.houston.softwaregrp.com
	(m9a0002g.houston.softwaregrp.com [15.124.64.67])
	(using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 9341A30ADBAD;
	Wed, 14 Aug 2019 21:40:58 +0000 (UTC)
Received: FROM m9a0002g.houston.softwaregrp.com (15.121.0.190) BY
	m9a0002g.houston.softwaregrp.com WITH ESMTP; 
	Wed, 14 Aug 2019 21:40:26 +0000
Received: from M9W0067.microfocus.com (2002:f79:be::f79:be) by
	M9W0067.microfocus.com (2002:f79:be::f79:be) with Microsoft SMTP Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1591.10; Wed, 14 Aug 2019 21:37:41 +0000
Received: from NAM03-BY2-obe.outbound.protection.outlook.com (15.124.72.14) by
	M9W0067.microfocus.com (15.121.0.190) with Microsoft SMTP Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1591.10 via Frontend Transport; Wed, 14 Aug 2019 21:37:41 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=FPSP06FJQd9/ePCdotijHEKbzFZsjGaDTy1Pez6ka4FuONOcFBIvFc0rkV9lvu4BlruxOdqZ24fnfrJqpQhrj5qt2cNE4s0/RQBmCaoHTTEDaYqr5sM628SOawq77ULfQ33WEBhX6EQyEyMk7Lx4Rw7h8PUWDDMo0H6WO+0yeMHstSXSLyZFn/PPf8Tdw8zS6NRf/GaMf8KrMkiDd6tHxwBsVYixE9wJo15VtLtpWOOpaQoBVSLU7Gpb3OMJ/YKA3SsLZVUhJYouY8ytVVAzhRAkI4IS5wJL1RcmgiruP5L7xMyf1aESO8IFJFctlIAnFaIDl7x6YgzEEIapS4N3SQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=JZwD71gDHTnYXwG/QO4IXNJLyk3qp0rmbdJ2rCcR5PU=;
	b=I8ng/xNnMPcX76RKZFrB4dbWLlDmC8lr2RtyJJZm93E62GPMNhDcnblc5q339G0KizOBDBd+nsKYHHG25RIUi7bhl2vnxy6jU85fHPHvLEoslZE8CVYFzb2CbeAuT7NLi3xtXMJwALe49KeaA57PotyU53whzw6a4/E5LQ20SFOymIarrDZWaXlTCjxfXkP/b1dVpujSbxEnpMoqOe+wcvGjS450eq7z82WgT9y+53vOZIgdLYKNrvUyXR2gzy+oLjvPvgQVqaog5Pk35vh+3+hpKx7FTxzwRIO37F+NY/jpYdchfs+7wyIxyX2/DKEUeNgDvGtEC+wGP1OLc5C94Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
	smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
	dkim=pass header.d=suse.com; arc=none
Received: from CH2PR18MB3349.namprd18.prod.outlook.com (52.132.246.91) by
	CH2PR18MB3397.namprd18.prod.outlook.com (52.132.246.220) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2157.18; Wed, 14 Aug 2019 21:37:40 +0000
Received: from CH2PR18MB3349.namprd18.prod.outlook.com
	([fe80::8818:7a86:93d7:561a]) by
	CH2PR18MB3349.namprd18.prod.outlook.com
	([fe80::8818:7a86:93d7:561a%6]) with mapi id 15.20.2157.022;
	Wed, 14 Aug 2019 21:37:40 +0000
From: Martin Wilck <Martin.Wilck@suse.com>
To: "bmarzins@redhat.com" <bmarzins@redhat.com>,
	"christophe.varoqui@opensvc.com" <christophe.varoqui@opensvc.com>
Thread-Topic: [PATCH 02/16] libmultipath: add marginal paths and groups
	infrastructure
Thread-Index: AQHVUuh/mE0sUq87gEm5VNFCCZZ+lQ==
Date: Wed, 14 Aug 2019 21:37:40 +0000
Message-ID: <2f3d72b3fe768050047e7ee60b5e4fe9dcfb253e.camel@suse.com>
References: <1564763622-31752-1-git-send-email-bmarzins@redhat.com>
	<1564763622-31752-3-git-send-email-bmarzins@redhat.com>
In-Reply-To: <1564763622-31752-3-git-send-email-bmarzins@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Martin.Wilck@suse.com; 
x-originating-ip: [94.218.227.174]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9f8be422-52cb-442d-700c-08d720ffa24d
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
	SRVR:CH2PR18MB3397; 
x-ms-traffictypediagnostic: CH2PR18MB3397:
x-microsoft-antispam-prvs: <CH2PR18MB33974239459D5622B549189AFCAD0@CH2PR18MB3397.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1360;
x-forefront-prvs: 01294F875B
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(4636009)(136003)(376002)(396003)(366004)(346002)(39860400002)(199004)(189003)(86362001)(486006)(64756008)(6436002)(36756003)(91956017)(229853002)(66556008)(66476007)(118296001)(5660300002)(66946007)(256004)(8676002)(76116006)(66066001)(66446008)(6486002)(81166006)(4744005)(81156014)(478600001)(99286004)(2501003)(305945005)(76176011)(476003)(316002)(53936002)(54906003)(6512007)(110136005)(446003)(25786009)(102836004)(14454004)(7736002)(26005)(6246003)(71190400001)(71200400001)(2616005)(4326008)(6116002)(186003)(8936002)(2906002)(3846002)(6506007)(11346002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:CH2PR18MB3397;
	H:CH2PR18MB3349.namprd18.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
	permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: RnkFi/9gsojtSkyTZEkg+2+WIWXE2lak4eBs0EHQPSMc47SqPh/zDVY0jlJ67S95WVJZjmpDx+G8DzMbWjgzeOvyjC/pD/HEPbYb5nOEn66lxCVcISIegPKS+YGrmVrlpcKaeKkIKDS1CZ8S3Ukw3kGePhC1zyFDeMQTROq/keA7MmMiHuuFxL2MX91bTbfBIPj9Q9IwGzo1yvFnt32hqZgPWhKm8TVrGHDHIkZlBiqH7scWl5BFd/+4RmDpLodzRAz6RH+bCYktnWfOUSeb3MjVnC+S0V5X++XZuwEPg5wU6vuLygYESX3lBHHKPTjLSXjidYPq7CPzvJKF2djAHqouAZDg530PIyBtnHbBr4M5loWwrkVHjv9U6nlSgXAMdrcKFxhby6/MP1aZWaLL0n1r0JEuq5vSQ5OOKzxTVb8=
x-ms-exchange-transport-forked: True
Content-ID: <6A0C23FE1B2FFC44A302CBA8B8B36B6C@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f8be422-52cb-442d-700c-08d720ffa24d
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Aug 2019 21:37:40.5998 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: evM00Xtf9O8WF+CERrI0x0C3H83cKqVMia5dSoQNbyPAtJTXRHZmLjnoLjXVvfBflOPp7QJXFX3uKSGKVia2KQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR18MB3397
X-OriginatorOrg: suse.com
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 238
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.47]); Wed, 14 Aug 2019 21:41:02 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.47]);
	Wed, 14 Aug 2019 21:41:02 +0000 (UTC) for IP:'15.124.64.67'
	DOMAIN:'m9a0002g.houston.softwaregrp.com'
	HELO:'m9a0002g.houston.softwaregrp.com'
	FROM:'Martin.Wilck@suse.com' RCPT:''
X-RedHat-Spam-Score: 0.001  (RCVD_IN_DNSWL_NONE, SPF_HELO_NONE, SPF_PASS,
	UNPARSEABLE_RELAY) 15.124.64.67
	m9a0002g.houston.softwaregrp.com 15.124.64.67
	m9a0002g.houston.softwaregrp.com <Martin.Wilck@suse.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.47
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-MIME-Autoconverted: from base64 to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id x7ELf5R5006735
X-loop: dm-devel@redhat.com
Cc: "dm-devel@redhat.com" <dm-devel@redhat.com>,
	"mkumar@redhat.com" <mkumar@redhat.com>
Subject: Re: [dm-devel] [PATCH 02/16] libmultipath: add marginal paths and
 groups infrastructure
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.31]); Wed, 14 Aug 2019 21:45:38 +0000 (UTC)

On Fri, 2019-08-02 at 11:33 -0500, Benjamin Marzinski wrote:
> This commit adds a marginal variable ot the paths and pathgroups
> structs.
> The marginal paths variable can be set by
> 
> multipathd path <path> setmarginal
> 
> and cleared by
> 
> multipathd path <path> unsetmarginal
> 
> All of the marginal paths on a multipath device can be cleared by
> 
> multipathd map <map> unsetmarginal
> 
> Currently, the marginal variable of a pathgroup will not change. This
> will be added by a future commit. The marginal state of a path or
> pathgroup is printable with the %M wildcard, and is displayed in the
> json output.
> 
> Signed-off-by: Benjamin Marzinski <bmarzins@redhat.com>

Reviewed-by: Martin Wilck <mwilck@suse.com>

(I'd like different semantics for these commands, but that doesn't
affect this patch).


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
