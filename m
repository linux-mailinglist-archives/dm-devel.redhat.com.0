Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F8D68E08B
	for <lists+dm-devel@lfdr.de>; Thu, 15 Aug 2019 00:15:40 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 59680C04D941;
	Wed, 14 Aug 2019 22:15:37 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2A9E610016EB;
	Wed, 14 Aug 2019 22:15:35 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id B25714A486;
	Wed, 14 Aug 2019 22:15:30 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x7EMBFFl007399 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 14 Aug 2019 18:11:15 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 6333C7B6E2; Wed, 14 Aug 2019 22:11:15 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx16.extmail.prod.ext.phx2.redhat.com
	[10.5.110.45])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 346365C29A;
	Wed, 14 Aug 2019 22:11:13 +0000 (UTC)
Received: from m9a0002g.houston.softwaregrp.com
	(m9a0002g.houston.softwaregrp.com [15.124.64.67])
	(using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id A4A6D30BD2C8;
	Wed, 14 Aug 2019 22:11:06 +0000 (UTC)
Received: FROM m9a0002g.houston.softwaregrp.com (15.121.0.191) BY
	m9a0002g.houston.softwaregrp.com WITH ESMTP; 
	Wed, 14 Aug 2019 22:10:36 +0000
Received: from M9W0067.microfocus.com (2002:f79:be::f79:be) by
	M9W0068.microfocus.com (2002:f79:bf::f79:bf) with Microsoft SMTP Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1591.10; Wed, 14 Aug 2019 22:05:47 +0000
Received: from NAM03-BY2-obe.outbound.protection.outlook.com (15.124.72.11) by
	M9W0067.microfocus.com (15.121.0.190) with Microsoft SMTP Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1591.10 via Frontend Transport; Wed, 14 Aug 2019 22:05:48 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=P2WNGtqFSqUkr0G2dm3xuuA6syUfQW7y4qtJaLclSogCgqkqZLja11a1okEPUdYz8U1M64gWeI7BvqOhD3SIenjBFQb3k3eLOZtcjR+GlCuo/uHRq+mOKiGQvMYTa8ByE5GPuC8k5pQe0A0qJjlpbbp8B7Wgdb7rj70gZwVxhjTfUVmTiKcjtaPeQf/7gNJ3FC3Ogvh8ZxQ6hWTev4Zxzn03u292dxDApVLt/zjL9Bce4tgBfRBPHuPl6GgIgMEcv4St8AMVVYDr+MRZqZOvfQw7dR60LN2hYit/NBNjxtvUEmVk2KSPQM5zQO+FbWNaGC64vLwnSJ9DUQ+6OyPypw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=HhqrvD3QQ+kfSNreBuCbYJKLdmm1VClhYz5lafM1llo=;
	b=Y+2GJ22MhJqUWzIEMmimduGpknzyoYXm0rVZRRu4jxIc/ST6sGPOGerUtVnF0MtEhFIK0VCxkNl4x2RVezFHkdIK3R3OlEdM3jIU63scOLyIwlKatl+6+lOKOIG5m1ThhFH3OXtVArYpf0yJo19XUJFgQjtit589yrVdOswIyTkv4Fg14TcodvBzofC+PMrC544ufgeZKjGWoeUzpnrH/4822krAbCe5AvnirR3dqLflDEPmYPREeV+sGuos/wq8zGi9kvIq19TnkPVfhi192Q5w3MQIuk0Qc4d5ECtvQDucrOSIPuWMzYBJKJF7aHodK5uxzGv4ROokK5ooL6vyaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
	smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
	dkim=pass header.d=suse.com; arc=none
Received: from CH2PR18MB3349.namprd18.prod.outlook.com (52.132.246.91) by
	CH2PR18MB3334.namprd18.prod.outlook.com (52.132.246.76) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2157.18; Wed, 14 Aug 2019 22:05:46 +0000
Received: from CH2PR18MB3349.namprd18.prod.outlook.com
	([fe80::8818:7a86:93d7:561a]) by
	CH2PR18MB3349.namprd18.prod.outlook.com
	([fe80::8818:7a86:93d7:561a%6]) with mapi id 15.20.2157.022;
	Wed, 14 Aug 2019 22:05:46 +0000
From: Martin Wilck <Martin.Wilck@suse.com>
To: "bmarzins@redhat.com" <bmarzins@redhat.com>,
	"christophe.varoqui@opensvc.com" <christophe.varoqui@opensvc.com>
Thread-Topic: [PATCH 10/16] libmultipath: make pgpolicyfn take a paths vector
Thread-Index: AQHVUuxsjC5YJKVTZEitk0mK3YTBsw==
Date: Wed, 14 Aug 2019 22:05:45 +0000
Message-ID: <1f9360e75494c4597d80a08677a34441159b3af4.camel@suse.com>
References: <1564763622-31752-1-git-send-email-bmarzins@redhat.com>
	<1564763622-31752-11-git-send-email-bmarzins@redhat.com>
In-Reply-To: <1564763622-31752-11-git-send-email-bmarzins@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Martin.Wilck@suse.com; 
x-originating-ip: [94.218.227.174]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 588830f4-f529-4b4f-3b9e-08d721038edf
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
	SRVR:CH2PR18MB3334; 
x-ms-traffictypediagnostic: CH2PR18MB3334:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CH2PR18MB3334C7D417922EF47CCA33D6FCAD0@CH2PR18MB3334.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 01294F875B
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(4636009)(39860400002)(366004)(346002)(376002)(396003)(136003)(199004)(189003)(446003)(6486002)(6436002)(11346002)(2501003)(118296001)(71200400001)(256004)(71190400001)(26005)(6506007)(36756003)(186003)(102836004)(486006)(476003)(2616005)(99286004)(2906002)(86362001)(14444005)(14454004)(229853002)(305945005)(25786009)(316002)(66556008)(76176011)(7736002)(66446008)(66946007)(64756008)(8936002)(66476007)(6512007)(81156014)(81166006)(478600001)(3846002)(6246003)(66066001)(8676002)(76116006)(6116002)(110136005)(54906003)(91956017)(5660300002)(4326008)(107886003)(53936002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:CH2PR18MB3334;
	H:CH2PR18MB3349.namprd18.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
	permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: VsxnF2Id6HG+kHLZOmvZJqk49ExI+dD5JWd8R+f5Wyy0wQ4E8KXeF58X/ZL2jWWB/emck+OtKpc1j88rwVuu0WFFOisIGUEy9pdMBOphbjbQrcU6NbjldPRTn3WzE74lTycd2J2SL3sUWCsKl8RRE5tZrtO1T0qVuY0DITddFAZsUq+eEgH8gpQFgScWKjFe9kAYgmelAZlzJhiJZwolOPXZwTy23bNVk0LDZzaqhuA/5cLw4vW3PGdSrtAeMOUblZq9DnNAIXDLNXwhJ/dRtv+YI0+/rlTCpiK440p/2KRfjn5jBYhKo4CEPx6wjdy7i/Walz7/7IEKisGbJshxZzbBAYNDwfU67vkPD7rDa/N3kynXRmijHBZcUjS4ZrBdgXThjEyXuG39yZNFiOORTLafULR8zDzokYkWtBm1dAc=
Content-ID: <85BB8C015C96F44EBF4DD52D514C5983@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 588830f4-f529-4b4f-3b9e-08d721038edf
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Aug 2019 22:05:46.0108 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0iCEYCu8w1NkrtHrVBHcp4HCAuKxtAJ+6g/WRXguKKkwn7q7M0wvCQ+fdop9hddGnu/Jon8f3M7RLGmae2EEMQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR18MB3334
X-OriginatorOrg: suse.com
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 238
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.45]); Wed, 14 Aug 2019 22:11:12 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.45]);
	Wed, 14 Aug 2019 22:11:12 +0000 (UTC) for IP:'15.124.64.67'
	DOMAIN:'m9a0002g.houston.softwaregrp.com'
	HELO:'m9a0002g.houston.softwaregrp.com'
	FROM:'Martin.Wilck@suse.com' RCPT:''
X-RedHat-Spam-Score: 0.001  (RCVD_IN_DNSWL_NONE, SPF_HELO_NONE, SPF_PASS,
	UNPARSEABLE_RELAY) 15.124.64.67
	m9a0002g.houston.softwaregrp.com 15.124.64.67
	m9a0002g.houston.softwaregrp.com <Martin.Wilck@suse.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.45
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-MIME-Autoconverted: from base64 to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id x7EMBFFl007399
X-loop: dm-devel@redhat.com
Cc: "dm-devel@redhat.com" <dm-devel@redhat.com>,
	"mkumar@redhat.com" <mkumar@redhat.com>, Hannes Reinecke <hare@suse.com>
Subject: Re: [dm-devel] [PATCH 10/16] libmultipath: make pgpolicyfn take a
	paths vector
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
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.32]); Wed, 14 Aug 2019 22:15:38 +0000 (UTC)

On Fri, 2019-08-02 at 11:33 -0500, Benjamin Marzinski wrote:
> To enable future changes, mp->pgpolicyfn() now takes a vector of
> paths instead of always using mp->paths.
> 
> Signed-off-by: Benjamin Marzinski <bmarzins@redhat.com>
> ---
>  libmultipath/pgpolicies.c | 38 +++++++++++++++++++----------------
> ---
>  libmultipath/pgpolicies.h | 10 +++++-----
>  libmultipath/structs.h    |  2 +-
>  3 files changed, 25 insertions(+), 25 deletions(-)
> 

The following applies to this patch and its successors (11-13, 15).

This is technically correct, beautiful code, but I'm not sure if this
is where we want to go. Do we really need that strict separation
between "normal" and "marginal" path groups?

As I already noted in my reply to 14/16, I'd favor an approach where
we would factor in the "marginality" of a path when calculating the
priority and the grouping. For example, when working with ALUA and
group_by_prio, rather than lumping all marginal paths together, we may
want to group like this:

 - active/optimized, healthy
 - active/non-optimized, healthy
 - active/optimized, marginal
 - active/non-optimized, marginal
 - standby
 - other

The priorities of these groups would be up to discussion. Today I'm not
even sure if "marginal" property should take precedence over
"optimized" property, or vice-versa. It might actually depend on the
situation and the degree of "shakiness" ...

OK: This is future material. But if we take this patch and its
successors, be'd have it cast in stone that "marginal/normal" is the
main distinction, taking precedence over everything else, and I'm not
convinced that that's the way to go.

We could obtain the semantics of your current patch set by assigning a
negative prio bias to marginal paths, and changing the grouping
algorithms (except group_by_prio) such that they take the marginal
property into account (e.g. group_by_node_name would pretend that all
marginal paths have a common "node name" and lump them together). This
would allow us to keep our current simple mpp->pg vector and represent
the marginal paths simply by one (the last) PG in this vector. 

The benefit would be that this model would be more flexible for more
sophisticated priority models in the future.

Regards,
Martin


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
