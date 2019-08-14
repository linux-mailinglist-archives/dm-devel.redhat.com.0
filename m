Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id F20E78DFBD
	for <lists+dm-devel@lfdr.de>; Wed, 14 Aug 2019 23:27:42 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id DBAF464469;
	Wed, 14 Aug 2019 21:27:38 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E06E2900BA;
	Wed, 14 Aug 2019 21:27:35 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 411C318005A4;
	Wed, 14 Aug 2019 21:27:26 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x7ELQgxg006268 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 14 Aug 2019 17:26:42 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 6F206825F8; Wed, 14 Aug 2019 21:26:42 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx17.extmail.prod.ext.phx2.redhat.com
	[10.5.110.46])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DA0A0D1F8;
	Wed, 14 Aug 2019 21:26:39 +0000 (UTC)
Received: from m4a0041g.houston.softwaregrp.com
	(m4a0041g.houston.softwaregrp.com [15.124.2.87])
	(using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id B535E300CB6B;
	Wed, 14 Aug 2019 21:26:35 +0000 (UTC)
Received: FROM m4a0041g.houston.softwaregrp.com (15.120.17.147) BY
	m4a0041g.houston.softwaregrp.com WITH ESMTP; 
	Wed, 14 Aug 2019 21:26:22 +0000
Received: from M9W0068.microfocus.com (2002:f79:bf::f79:bf) by
	M4W0335.microfocus.com (2002:f78:1193::f78:1193) with Microsoft SMTP
	Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1591.10; Wed, 14 Aug 2019 21:21:20 +0000
Received: from NAM01-BY2-obe.outbound.protection.outlook.com (15.124.72.10) by
	M9W0068.microfocus.com (15.121.0.191) with Microsoft SMTP Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1591.10 via Frontend Transport; Wed, 14 Aug 2019 21:21:19 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=c4BTLM/+oGBJ4iLJ8f2WhMia17QFqCYQ0zBnxopNZIwe3Yt910060EUI+56hVbadPEn+1GIRXgUqRku6baUN3RS7v+n3lpdN5yUUEoI5zQA1IoJFqz9+2znkwcxWJzcoohEtSoUUu8BLJ386eOaNwTQ6M4jGbEUIcM7SAM3aUFJntOuz8xODdF9Mi08wHg8qYNvwF4Wfvm7nXrag4BtQG9tuHtvBiDYi6NQ6gv3j9EYwu9ReGO3S7l51GpOgGxuCjEe86dVTWTR0lBubC5imWOjqXCDs/JnCcb3bVegMLsGSC80MXKWwEW/3zKaqPNVFpRe/K9VKeCj0UeOABulilQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=nYpOycaIGPxAmmzd9x3YDn6XSC0IpMC6RlBS8RRxeSI=;
	b=EUWwWb9QlYrmnCTiWsgixUHqD7NbnY1mRE/zTSCgztskJtK9GDeHRSYZg59rtvQk7IvDjt0XFxPIuWHUfCdf6Fqi+kt9MFlZkZH4s5vUz7g7Gf/Bb8R+0tPnRKXe/amsGtYafb/Ug4Y7W89gB8LRdl5VaRqLUTrMWZIbsQGfN8emfGbcB1SsAGpNB3JePEkrEytUmM+D/eAcGZoEAgiWA0G2IFXI390iWuByGWBcENrsP02azW+Dphz7xi5J2xb6kx5JmcwzqOU3pjsYy/voi7cJwCbS42zw48fv0fqVoyK07XoXA+IRAF7lLfz/XX5K+Mfvc8ThqZ0jIZ+WwC4z8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
	smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
	dkim=pass header.d=suse.com; arc=none
Received: from CH2PR18MB3349.namprd18.prod.outlook.com (52.132.246.91) by
	CH2PR18MB3240.namprd18.prod.outlook.com (52.132.245.78) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2157.18; Wed, 14 Aug 2019 21:21:19 +0000
Received: from CH2PR18MB3349.namprd18.prod.outlook.com
	([fe80::8818:7a86:93d7:561a]) by
	CH2PR18MB3349.namprd18.prod.outlook.com
	([fe80::8818:7a86:93d7:561a%6]) with mapi id 15.20.2157.022;
	Wed, 14 Aug 2019 21:21:19 +0000
From: Martin Wilck <Martin.Wilck@suse.com>
To: "bmarzins@redhat.com" <bmarzins@redhat.com>,
	"christophe.varoqui@opensvc.com" <christophe.varoqui@opensvc.com>
Thread-Topic: [PATCH 05/16] libmultipath: fix double free in pgpolicyfn error
	paths
Thread-Index: AQHVUuY2+XZpJIKrUEuKn3sfZTpQPQ==
Date: Wed, 14 Aug 2019 21:21:18 +0000
Message-ID: <aec80dc201ee2db91cc8316529cabba4082690bd.camel@suse.com>
References: <1564763622-31752-1-git-send-email-bmarzins@redhat.com>
	<1564763622-31752-6-git-send-email-bmarzins@redhat.com>
In-Reply-To: <1564763622-31752-6-git-send-email-bmarzins@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Martin.Wilck@suse.com; 
x-originating-ip: [94.218.227.174]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: bab9243b-536c-4eea-36d9-08d720fd592f
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
	SRVR:CH2PR18MB3240; 
x-ms-traffictypediagnostic: CH2PR18MB3240:
x-microsoft-antispam-prvs: <CH2PR18MB3240CF7D63B2DDE33E83C54FFCAD0@CH2PR18MB3240.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5797;
x-forefront-prvs: 01294F875B
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(4636009)(346002)(366004)(39860400002)(376002)(136003)(396003)(189003)(199004)(66946007)(64756008)(66476007)(81156014)(102836004)(76116006)(91956017)(99286004)(6436002)(478600001)(8676002)(4326008)(186003)(6506007)(81166006)(71200400001)(486006)(76176011)(6486002)(71190400001)(305945005)(6116002)(66446008)(2501003)(446003)(14454004)(54906003)(316002)(86362001)(476003)(7736002)(2616005)(25786009)(8936002)(229853002)(11346002)(5660300002)(26005)(2906002)(6246003)(118296001)(256004)(3846002)(66556008)(53936002)(6512007)(66066001)(4744005)(36756003)(110136005);
	DIR:OUT; SFP:1102; SCL:1; SRVR:CH2PR18MB3240;
	H:CH2PR18MB3349.namprd18.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
	permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: r3lbRU4EfcZE05gzXc62LV1Rgk6gEZA0nhbRb0UFCajLcXL0P5BJmZDQ7aDC59JxOvlDnTlP33QJQxqALM2KRKGAspiNKBl2/91UnHVzLhJ5g1osDtvI4rqf1WXNXo5iYVFBLftLq+wKInCi2nuxz0b2GjOfXIRtK42895O2pWXBq8GLzMRLWbi3sSbn3DL+tN0/5TOXWQkh3osgProosxCvxGznw0dkzGYiHZImIiZ/pzseHRTp7EIk7hGBMM7soVqZjculp6EJ5HBAKbEFsWmI6/2nDYQ0BNt/dpDoia6+ZyEAX9LxuROwPF+8LdL1V9lryrLNczecUIU6yPtvUxQgNhsBN/xSghLsQ6VuRZhV4tPLR9+cHP0y2OFGXHGpJ8j2zPMgRjK8Nbo4HgoP/TljK41hHMhsgk5ApF8ulIs=
x-ms-exchange-transport-forked: True
Content-ID: <881CB4E977944742B58FA2F89EAACC94@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: bab9243b-536c-4eea-36d9-08d720fd592f
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Aug 2019 21:21:18.9626 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CtMSEqdf/q1EJswxODK++gMCBRUyarG30KFzGZxKj4y9lfWwO7+2fWxrRaAZ71rj2nb/UoAccrsZNCaKv/TwRA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR18MB3240
X-OriginatorOrg: suse.com
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 238
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.46]); Wed, 14 Aug 2019 21:26:39 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.46]);
	Wed, 14 Aug 2019 21:26:39 +0000 (UTC) for IP:'15.124.2.87'
	DOMAIN:'m4a0041g.houston.softwaregrp.com'
	HELO:'m4a0041g.houston.softwaregrp.com'
	FROM:'Martin.Wilck@suse.com' RCPT:''
X-RedHat-Spam-Score: 0.001  (RCVD_IN_DNSWL_NONE, SPF_HELO_NONE, SPF_PASS,
	UNPARSEABLE_RELAY) 15.124.2.87
	m4a0041g.houston.softwaregrp.com 15.124.2.87
	m4a0041g.houston.softwaregrp.com <Martin.Wilck@suse.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.46
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-MIME-Autoconverted: from base64 to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id x7ELQgxg006268
X-loop: dm-devel@redhat.com
Cc: "dm-devel@redhat.com" <dm-devel@redhat.com>,
	"mkumar@redhat.com" <mkumar@redhat.com>
Subject: Re: [dm-devel] [PATCH 05/16] libmultipath: fix double free in
 pgpolicyfn error paths
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
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.39]); Wed, 14 Aug 2019 21:27:41 +0000 (UTC)

On Fri, 2019-08-02 at 11:33 -0500, Benjamin Marzinski wrote:
> In the pgpolicy functions, if an error is encountered after
> alloc_pathgroup() is called, but before the path group is added to a
> multipath device with add_pathgroup(), the pathgroup needs to be
> cleaned
> up by calling free_pathgroup(). However, after the pathgroup has been
> added to the multipath device, calling free_pgvec() will clean it up.
> In
> this case, if free_pathgroup() is called first, the recently added
> pathgroup will be freed twice.
> 
> Signed-off-by: Benjamin Marzinski <bmarzins@redhat.com>
> ---
>  libmultipath/pgpolicies.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)

This is correct, but the code remains quite horrible. One day I'd love
to see "pgp" being a local variable inside the loop. That can be done
after your series though.

Martin


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
