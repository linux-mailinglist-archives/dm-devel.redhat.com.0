Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id A8BC78E019
	for <lists+dm-devel@lfdr.de>; Wed, 14 Aug 2019 23:44:51 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 86C823078A2E;
	Wed, 14 Aug 2019 21:44:49 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5EEEF27C28;
	Wed, 14 Aug 2019 21:44:49 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 043E418005A4;
	Wed, 14 Aug 2019 21:44:49 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x7ELiUuq006872 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 14 Aug 2019 17:44:30 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 0B93280B05; Wed, 14 Aug 2019 21:44:30 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx12.extmail.prod.ext.phx2.redhat.com
	[10.5.110.41])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E5CCB82098;
	Wed, 14 Aug 2019 21:44:26 +0000 (UTC)
Received: from m9a0002g.houston.softwaregrp.com
	(m9a0002g.houston.softwaregrp.com [15.124.64.67])
	(using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id F38DD3172D8D;
	Wed, 14 Aug 2019 21:44:22 +0000 (UTC)
Received: FROM m9a0002g.houston.softwaregrp.com (15.121.0.191) BY
	m9a0002g.houston.softwaregrp.com WITH ESMTP; 
	Wed, 14 Aug 2019 21:43:50 +0000
Received: from M4W0335.microfocus.com (2002:f78:1193::f78:1193) by
	M9W0068.microfocus.com (2002:f79:bf::f79:bf) with Microsoft SMTP Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1591.10; Wed, 14 Aug 2019 21:39:30 +0000
Received: from NAM01-BN3-obe.outbound.protection.outlook.com (15.124.8.12) by
	M4W0335.microfocus.com (15.120.17.147) with Microsoft SMTP Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1591.10 via Frontend Transport; Wed, 14 Aug 2019 21:39:30 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=oWXhPnsLFxxX+1/8uZ5JbuBcFB+paY+oBgKrCwClWKF42FNjCctpcAAP91DOvXlDxEjmU/2G6ih6hKhfpC1IreDPlDUI6FOKkfYF0fh7M7fu3BndfD6TQgsgoumP7HBivfMsdZp9JwDs3au11HHJVNCt4fUkG8YC88L9Fl91r585nFQRrSZOcR1b0+Eq7kRvXf7mh5vl6j9CIhTEH8E5XWce7HxpT4hE7j2t41dM1rdJKEK7W0TmBfygTJsWkWSfqxZMXZWNZU4KV7UaoJuAnqNE7PZSBa7dMR6syTb8U5bgx/qBruZxpbbXEtqu8+MNUWWDVTy6wIx/MduJA7TjDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=tioJ2nNXknhmPFlVXmopDaWSvmLRmu0OZTDYYHZaI50=;
	b=lTEkFKCMoL+Er6y4kR+0+MZu+5iDc2o3s/47I+mP1B/8pE1YQiJwfytwLWtmMv/MtV4IqNm3BRxoaLzulkqudx9tRxZEUS+la5h/dXIuezO+l/C7FimWGtMEVeKueWgx1hDt127CvwZaj3tglp35KVUIyrP20TAMwr6BuKaj4gmgy2KFOIYa4bHJRNx/Lw7RaF+Tqh1BeJRirXSNEjH08Tnx96I8/YKpbeXLyukfkTTv9tQEmcaPtJ6DbV5mVHiK9EFUw0jrDmMwckshITOhh/WQU3ua+SCqly1sBX6Ymk4Waj5kM7uu8pLn2cz72v3DSYH2mjao809CdHOQ9uQpsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
	smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
	dkim=pass header.d=suse.com; arc=none
Received: from CH2PR18MB3349.namprd18.prod.outlook.com (52.132.246.91) by
	CH2PR18MB3431.namprd18.prod.outlook.com (52.132.245.140) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2157.14; Wed, 14 Aug 2019 21:39:28 +0000
Received: from CH2PR18MB3349.namprd18.prod.outlook.com
	([fe80::8818:7a86:93d7:561a]) by
	CH2PR18MB3349.namprd18.prod.outlook.com
	([fe80::8818:7a86:93d7:561a%6]) with mapi id 15.20.2157.022;
	Wed, 14 Aug 2019 21:39:28 +0000
From: Martin Wilck <Martin.Wilck@suse.com>
To: "bmarzins@redhat.com" <bmarzins@redhat.com>,
	"christophe.varoqui@opensvc.com" <christophe.varoqui@opensvc.com>
Thread-Topic: [PATCH 04/16] libmultipath: add wrapper function around
	pgpolicyfn
Thread-Index: AQHVUui/buKLLd+aBk2lYGNBaYDmwg==
Date: Wed, 14 Aug 2019 21:39:27 +0000
Message-ID: <944d12858b6fc3660150d03f07ad1126132acaa3.camel@suse.com>
References: <1564763622-31752-1-git-send-email-bmarzins@redhat.com>
	<1564763622-31752-5-git-send-email-bmarzins@redhat.com>
In-Reply-To: <1564763622-31752-5-git-send-email-bmarzins@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Martin.Wilck@suse.com; 
x-originating-ip: [94.218.227.174]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 46ac8e8f-d3df-4200-9bed-08d720ffe241
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
	SRVR:CH2PR18MB3431; 
x-ms-traffictypediagnostic: CH2PR18MB3431:
x-microsoft-antispam-prvs: <CH2PR18MB3431F2EFDB015717C222C327FCAD0@CH2PR18MB3431.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-forefront-prvs: 01294F875B
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(4636009)(396003)(376002)(346002)(366004)(39860400002)(136003)(199004)(189003)(11346002)(118296001)(3846002)(36756003)(66556008)(66476007)(102836004)(4326008)(64756008)(76116006)(66446008)(91956017)(25786009)(4744005)(186003)(446003)(26005)(476003)(5660300002)(86362001)(66946007)(81156014)(2616005)(2501003)(53936002)(6512007)(81166006)(486006)(8936002)(6506007)(99286004)(76176011)(14454004)(6486002)(305945005)(2906002)(8676002)(71200400001)(478600001)(54906003)(110136005)(6246003)(256004)(6436002)(229853002)(6116002)(71190400001)(316002)(7736002)(66066001);
	DIR:OUT; SFP:1102; SCL:1; SRVR:CH2PR18MB3431;
	H:CH2PR18MB3349.namprd18.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
	permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: Qj3pCBSomk0faLfiKoROKyzVbXFcICoz0cLSrRJqwKk9RkZBbZwbuCjJ6ssjfuTn8BqEuQHp+C8VbWTWUHPqGSK+xWGm6qPZaK3M+GDPRmOtOiKSokNGrgeCzEnAJmc593/JavLHbd1xw6IKhTFRX1Fl2B6hcJVMJBRMkuXoQXrmmbHkOYy9EnOTbRv1CQnxHJuj1vjT1fub48eGHEJsG8ofPBeN3WSVMPFBtpf5Po4EKu7HjH0l6o9C/4569NMPZYNEhe2UwV+97MoAxMd6RlOhGsryed728B8YtFkto6CI0kbx6HyHRNuGh9zVNRTF5+MQOkQ5PSwhGfqiMfuSu/8p6JOdM/VTTZafWlSZoLtjDRtinWZp36+axBLOm6S1t2B5iBh2ST6XrxW9o+tJM26QJacv1bVnlWP4Zlx6N4A=
x-ms-exchange-transport-forked: True
Content-ID: <CF9D8E04AA9C164697DFF14C5AF56C68@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 46ac8e8f-d3df-4200-9bed-08d720ffe241
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Aug 2019 21:39:27.9655 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Bj2kJVkwTL7vGWtFN/hW1RudutehsefoLZydxYmBePdZQT7QofJXgohF0eEyv5gVILrhb2srZdW0yOUtz5qPqg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR18MB3431
X-OriginatorOrg: suse.com
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 238
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.41]); Wed, 14 Aug 2019 21:44:26 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.41]);
	Wed, 14 Aug 2019 21:44:26 +0000 (UTC) for IP:'15.124.64.67'
	DOMAIN:'m9a0002g.houston.softwaregrp.com'
	HELO:'m9a0002g.houston.softwaregrp.com'
	FROM:'Martin.Wilck@suse.com' RCPT:''
X-RedHat-Spam-Score: 0.001  (RCVD_IN_DNSWL_NONE, SPF_HELO_NONE, SPF_PASS,
	UNPARSEABLE_RELAY) 15.124.64.67
	m9a0002g.houston.softwaregrp.com 15.124.64.67
	m9a0002g.houston.softwaregrp.com <Martin.Wilck@suse.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.41
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-MIME-Autoconverted: from base64 to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id x7ELiUuq006872
X-loop: dm-devel@redhat.com
Cc: "dm-devel@redhat.com" <dm-devel@redhat.com>,
	"mkumar@redhat.com" <mkumar@redhat.com>
Subject: Re: [dm-devel] [PATCH 04/16] libmultipath: add wrapper function
 around pgpolicyfn
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
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.43]); Wed, 14 Aug 2019 21:44:50 +0000 (UTC)

On Fri, 2019-08-02 at 11:33 -0500, Benjamin Marzinski wrote:
> group_paths() is a wrapper around the pgpolicy functions, that pulls
> out
> the common code from the beginning and the end. However since
> one_group() didn't free the mp->paths vector, it has to set it to
> NULL,
> to avoid having the wrapper code do that. Also, the pathgroups in
> group_by_prio are now needlessly sorted afterwards.
> 
> Signed-off-by: Benjamin Marzinski <bmarzins@redhat.com>

Reviewed-by: Martin Wilck <mwilck@suse.com>

(Suggestion: squash this with 07/16, and possibly also 05/16 and
06/16).


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
